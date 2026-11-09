// SKY WIFI TANZANIA — API client for api.php (see server/API-DOCS.md)
import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// The live server. Can be changed in the app (long-press the logo on the sign-in screen).
const String kDefaultApi = 'https://wifi.skytanzania.co.tz/api.php';

class ApiException implements Exception {
  final String message;
  final String code;
  final int status;
  final Map<String, dynamic>? body;
  ApiException(this.message, {this.code = 'error', this.status = 0, this.body});
  bool get isAuth => status == 401;
  bool get isLocked => status == 423;
  @override
  String toString() => message;
}

/// Answer of a write (website action): ok + type (success / info / warning / danger) + message.
class ActionResult {
  final bool ok;
  final String type;
  final String message;
  final Map<String, dynamic> params;
  final Map<String, dynamic> raw;
  ActionResult({required this.ok, required this.type, required this.message, this.params = const {}, this.raw = const {}});

  factory ActionResult.fromJson(Map<String, dynamic> j) {
    final ok = j['ok'] == true;
    var msg = j['message'];
    if (msg is! String) msg = ok ? 'Done' : (j['msg']?.toString() ?? 'Something went wrong');
    final p = j['params'];
    return ActionResult(
      ok: ok,
      type: (j['type'] ?? (ok ? 'success' : 'danger')).toString(),
      message: msg.toString(),
      params: p is Map ? Map<String, dynamic>.from(p) : <String, dynamic>{},
      raw: j,
    );
  }
}

/// One page of a list: items + paging + extra values sent with the list.
class PageResult {
  final List<dynamic> items;
  final int page;
  final int pages;
  final int total;
  final Map<String, dynamic> extra;
  PageResult(this.items, this.page, this.pages, this.total, this.extra);
  bool get hasMore => page < pages;
}

class Api {
  Api._();
  static final Api I = Api._();

  static const _secure = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
  String base = kDefaultApi;
  String? token;

  /// Called when the token is no longer valid (→ sign-in screen).
  void Function()? onUnauthorized;

  /// Called when the seller account is locked (HTTP 423) — home = "locked" or "commission".
  void Function(String home)? onLocked;

  Future<void> init() async {
    try {
      final p = await SharedPreferences.getInstance();
      base = p.getString('api_base') ?? kDefaultApi;
    } catch (_) {}
    try {
      token = await _secure.read(key: 'token');
    } catch (_) {
      token = null;
    }
  }

  Future<void> setBase(String b) async {
    base = b.trim().isEmpty ? kDefaultApi : b.trim();
    final p = await SharedPreferences.getInstance();
    await p.setString('api_base', base);
  }

  Future<void> saveToken(String? t) async {
    token = t;
    try {
      if (t == null) {
        await _secure.delete(key: 'token');
      } else {
        await _secure.write(key: 'token', value: t);
      }
    } catch (_) {}
  }

  Uri uri(String route, [Map<String, dynamic>? q]) {
    final u = Uri.parse(base);
    final params = <String, String>{...u.queryParameters, 'r': route};
    q?.forEach((k, v) {
      if (v != null && '$v'.isNotEmpty) params[k] = '$v';
    });
    return u.replace(queryParameters: params);
  }

  Map<String, String> get _headers => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
        if (token != null) 'X-Api-Token': token!,
      };

  Future<Map<String, dynamic>> _send(String route, Future<http.Response> Function() call) async {
    http.Response r;
    try {
      r = await call().timeout(const Duration(seconds: 60));
    } on TimeoutException {
      throw ApiException('The server is taking too long. Check your internet and try again.', code: 'timeout');
    } catch (_) {
      throw ApiException('No internet connection. Check your mobile data or WiFi and try again.', code: 'network');
    }
    Map<String, dynamic> j;
    try {
      final d = jsonDecode(utf8.decode(r.bodyBytes));
      j = d is Map<String, dynamic> ? d : <String, dynamic>{'ok': false, 'message': 'Unexpected answer from the server.'};
    } catch (_) {
      throw ApiException('Unexpected answer from the server (HTTP ${r.statusCode}).', code: 'bad_response', status: r.statusCode);
    }
    final msg = (j['message'] is String ? j['message'] as String : null) ?? 'Something went wrong (HTTP ${r.statusCode}).';
    if (r.statusCode == 401 && !route.startsWith('auth/login') && !route.startsWith('auth/register')) {
      if (token != null) {
        await saveToken(null);
        onUnauthorized?.call();
      }
      throw ApiException(msg, code: (j['error'] ?? 'invalid_token').toString(), status: 401, body: j);
    }
    if (r.statusCode == 423) {
      onLocked?.call((j['home'] ?? 'locked').toString());
      throw ApiException(msg, code: 'account_locked', status: 423, body: j);
    }
    if (r.statusCode >= 500) {
      throw ApiException(msg, code: (j['error'] ?? 'server_error').toString(), status: r.statusCode, body: j);
    }
    j['_status'] = r.statusCode;
    return j;
  }

  /// GET → the full JSON answer (used for live routes).
  Future<Map<String, dynamic>> raw(String route, [Map<String, dynamic>? q]) =>
      _send(route, () => http.get(uri(route, q), headers: _headers));

  /// GET → `data` (throws ApiException when ok = false).
  Future<dynamic> get(String route, [Map<String, dynamic>? q]) async {
    final j = await raw(route, q);
    if (j['ok'] != true) {
      throw ApiException((j['message'] ?? 'Something went wrong').toString(), code: (j['error'] ?? 'error').toString(), status: (j['_status'] ?? 0) as int, body: j);
    }
    return j['data'];
  }

  Future<Map<String, dynamic>> getMap(String route, [Map<String, dynamic>? q]) async {
    final d = await get(route, q);
    return d is Map ? Map<String, dynamic>.from(d) : <String, dynamic>{};
  }

  Future<List<dynamic>> getList(String route, [Map<String, dynamic>? q]) async {
    final d = await get(route, q);
    if (d is List) return d;
    if (d is Map && d['items'] is List) return d['items'] as List;
    return <dynamic>[];
  }

  /// Paged list: data is a list, or a map with "items" + extra values.
  Future<PageResult> page(String route, int page, [Map<String, dynamic>? q]) async {
    final j = await raw(route, {...?q, 'page': page, 'per_page': 25});
    if (j['ok'] != true) {
      throw ApiException((j['message'] ?? 'Something went wrong').toString(), code: (j['error'] ?? 'error').toString(), status: (j['_status'] ?? 0) as int);
    }
    final d = j['data'];
    final m = j['meta'] is Map ? Map<String, dynamic>.from(j['meta'] as Map) : <String, dynamic>{};
    List<dynamic> items = <dynamic>[];
    Map<String, dynamic> extra = <String, dynamic>{};
    if (d is List) {
      items = d;
    } else if (d is Map) {
      extra = Map<String, dynamic>.from(d);
      items = (extra.remove('items') as List?) ?? <dynamic>[];
    }
    return PageResult(items, toInt(m['page'], 1), toInt(m['pages'], 1), toInt(m['total'], items.length), extra);
  }

  /// POST → the full JSON answer.
  Future<Map<String, dynamic>> postRaw(String route, [Map<String, dynamic>? body]) =>
      _send(route, () => http.post(uri(route), headers: _headers, body: jsonEncode(body ?? <String, dynamic>{})));

  /// POST a website action → ActionResult (ok / type / message). Business errors do not throw.
  Future<ActionResult> post(String route, [Map<String, dynamic>? body]) async {
    final j = await postRaw(route, body);
    return ActionResult.fromJson(j);
  }

  /// POST that returns data (auth, withdraw, …): throws ApiException when ok = false.
  Future<Map<String, dynamic>> postData(String route, [Map<String, dynamic>? body]) async {
    final j = await postRaw(route, body);
    if (j['ok'] != true) {
      throw ApiException((j['message'] ?? 'Something went wrong').toString(), code: (j['error'] ?? 'error').toString(), status: (j['_status'] ?? 0) as int, body: j);
    }
    final d = j['data'];
    return d is Map ? Map<String, dynamic>.from(d) : <String, dynamic>{};
  }
}

// ---------- safe readers (the server sends numbers or strings) ----------
int toInt(dynamic v, [int def = 0]) {
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is bool) return v ? 1 : 0;
  return int.tryParse('${v ?? ''}') ?? (double.tryParse('${v ?? ''}')?.toInt() ?? def);
}

double toDouble(dynamic v, [double def = 0]) {
  if (v is num) return v.toDouble();
  return double.tryParse('${v ?? ''}') ?? def;
}

String toStr(dynamic v, [String def = '']) => v == null ? def : '$v';

bool toBool(dynamic v) => v == true || v == 1 || v == '1' || v == 'true';

Map<String, dynamic> toMap(dynamic v) => v is Map ? Map<String, dynamic>.from(v) : <String, dynamic>{};

List<dynamic> toList(dynamic v) => v is List ? v : (v is Map ? v.values.toList() : <dynamic>[]);
