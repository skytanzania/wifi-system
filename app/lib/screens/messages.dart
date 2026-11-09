// Chat with the administrator (admin: inbox of sellers) and notifications
import 'dart:async';

import 'package:flutter/material.dart';

import '../api.dart';
import '../main.dart';
import '../ui.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) => Session.isAdmin ? const _AdminInbox() : const ChatThread(seller: 0, title: 'Administrator');
}

class _AdminInbox extends StatelessWidget {
  const _AdminInbox();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Messages')),
        body: AsyncPage<Map<String, dynamic>>(
          load: () => Api.I.getMap('messages'),
          build: (ctx, d, reload) {
            final list = toList(d['inbox']).map(toMap).toList();
            return [
              if (list.isEmpty) const EmptyView('No conversations yet.', icon: Icons.forum_outlined),
              for (final c in list)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GlowCard(
                    padding: const EdgeInsets.all(12),
                    onTap: () async {
                      await Navigator.push(ctx, MaterialPageRoute(builder: (_) => ChatThread(seller: toInt(c['seller_id']), title: toStr(c['name']))));
                      reload();
                    },
                    child: Row(children: [
                      Stack(children: [
                        CircleAvatar(backgroundColor: C.brand.withValues(alpha: .2), child: Text(toStr(c['name']).isEmpty ? '?' : toStr(c['name'])[0].toUpperCase())),
                        if (c['online'] == true) const Positioned(right: 0, bottom: 0, child: Dot(true)),
                      ]),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(toStr(c['name']), style: const TextStyle(fontWeight: FontWeight.w800)),
                          Text('${c['last_from_admin'] == true ? 'You: ' : ''}${toStr(c['last'])}', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: C.muted, fontSize: 12.5)),
                        ]),
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text(fmtDate(c['last_at']), style: const TextStyle(color: C.muted, fontSize: 11)),
                        if (toInt(c['unread']) > 0) Badge(label: Text('${toInt(c['unread'])}')),
                      ]),
                    ]),
                  ),
                ),
            ];
          },
        ),
      );
}

class ChatThread extends StatefulWidget {
  final int seller;
  final String title;
  const ChatThread({super.key, required this.seller, required this.title});
  @override
  State<ChatThread> createState() => _ChatThreadState();
}

class _ChatThreadState extends State<ChatThread> {
  final List<Map<String, dynamic>> _msgs = [];
  final _c = TextEditingController();
  final _sc = ScrollController();
  bool _loading = true;
  bool _sending = false;
  String _status = '';
  Object? _err;
  Timer? _t;

  Map<String, dynamic> get _sel => widget.seller > 0 ? {'seller': widget.seller} : <String, dynamic>{};
  int get _last => _msgs.isEmpty ? 0 : toInt(_msgs.last['id']);

  @override
  void initState() {
    super.initState();
    _load();
    _t = Timer.periodic(const Duration(seconds: 3), (_) => _pollNew());
  }

  @override
  void dispose() {
    _t?.cancel();
    _sc.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final d = await Api.I.getMap('messages', _sel);
      if (!mounted) return;
      setState(() {
        _msgs
          ..clear()
          ..addAll(toList(d['messages']).map(toMap));
        _status = toStr(d['status']);
        _loading = false;
        _err = null;
      });
      _bottom();
    } catch (e) {
      if (mounted) {
        setState(() {
          _err = e;
          _loading = false;
        });
      }
    }
  }

  Future<void> _pollNew() async {
    if (_loading || _last == 0) {
      if (!_loading && _msgs.isEmpty) _load();
      return;
    }
    try {
      final j = await Api.I.raw('messages/poll', {..._sel, 'after': _last});
      if (!mounted || j['ok'] != true) return;
      final add = toList(j['messages']).map(toMap).where((m) => !_msgs.any((x) => x['id'] == m['id'])).toList();
      setState(() {
        _msgs.addAll(add);
        _status = toStr(j['status'], _status);
      });
      if (add.isNotEmpty) _bottom();
    } catch (_) {}
  }

  void _bottom() => WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_sc.hasClients) _sc.animateTo(_sc.position.maxScrollExtent + 80, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
      });

  Future<void> _send() async {
    final t = _c.text.trim();
    if (t.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      final j = await Api.I.postRaw('messages/send', {..._sel, 'body': t});
      if (j['ok'] == true && j['message'] is Map) {
        _c.clear();
        setState(() => _msgs.add(toMap(j['message'])));
        _bottom();
      } else if (mounted) {
        showMessage(context, toStr(j['message'], 'Message not sent.'), type: 'warning');
      }
    } catch (e) {
      if (mounted) showError(context, e);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.title),
            if (_status.isNotEmpty) Text(_status, style: const TextStyle(fontSize: 12, color: C.muted)),
          ]),
        ),
        body: Column(children: [
          Expanded(
            child: _loading
                ? loader
                : _err != null && _msgs.isEmpty
                    ? ErrorView(_err!, _load)
                    : _msgs.isEmpty
                        ? const EmptyView('Write to the administrator — questions, help with routers, payments…', icon: Icons.forum_outlined)
                        : ListView.builder(
                            controller: _sc,
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                            itemCount: _msgs.length,
                            itemBuilder: (ctx, i) {
                              final m = _msgs[i];
                              final mine = m['mine'] == true;
                              final showDay = i == 0 || toStr(_msgs[i - 1]['day']) != toStr(m['day']);
                              return Column(children: [
                                if (showDay)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(toStr(m['day']), style: const TextStyle(color: C.muted, fontSize: 11.5)),
                                  ),
                                Align(
                                  alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
                                  child: GestureDetector(
                                    onLongPress: !mine
                                        ? null
                                        : () async {
                                            if (!await confirm(ctx, 'Delete message', 'Delete this message?', ok: 'Delete', danger: true)) return;
                                            final j = await Api.I.postRaw('messages/delete', {'id': m['id']});
                                            if (j['ok'] == true || j['success'] == true) setState(() => _msgs.remove(m));
                                          },
                                    child: Container(
                                      constraints: BoxConstraints(maxWidth: MediaQuery.of(ctx).size.width * .78),
                                      margin: const EdgeInsets.only(bottom: 6),
                                      padding: const EdgeInsets.fromLTRB(12, 9, 12, 7),
                                      decoration: BoxDecoration(
                                        gradient: mine ? const LinearGradient(colors: [C.brand, C.brand2]) : null,
                                        color: mine ? null : C.card2,
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(16),
                                          topRight: const Radius.circular(16),
                                          bottomLeft: Radius.circular(mine ? 16 : 4),
                                          bottomRight: Radius.circular(mine ? 4 : 16),
                                        ),
                                      ),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                        Align(alignment: Alignment.centerLeft, child: SelectableText(toStr(m['body']), style: const TextStyle(fontSize: 14.5))),
                                        const SizedBox(height: 3),
                                        Row(mainAxisSize: MainAxisSize.min, children: [
                                          Text(toStr(m['time']), style: const TextStyle(fontSize: 10.5, color: Color(0xCCFFFFFF))),
                                          if (mine) ...[
                                            const SizedBox(width: 4),
                                            Icon(m['read'] == true ? Icons.done_all : Icons.done, size: 14, color: m['read'] == true ? C.cyan : const Color(0xCCFFFFFF)),
                                          ],
                                        ]),
                                      ]),
                                    ),
                                  ),
                                ),
                              ]);
                            },
                          ),
          ),
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              color: C.card,
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: _c,
                    minLines: 1,
                    maxLines: 4,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(hintText: 'Type a message', isDense: true),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _sending ? null : _send,
                  icon: _sending ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.send),
                ),
              ]),
            ),
          ),
        ]),
      );
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _k = GlobalKey<PagedListState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Notifications'), actions: [
          TextButton(
            onPressed: () async {
              await runAction(context, 'notifications/read_all', {}, popup: false);
              _k.currentState?.reload();
            },
            child: const Text('Mark all read'),
          ),
        ]),
        body: PagedList(
          key: _k,
          route: 'notifications',
          empty: 'No notifications.',
          item: (ctx, n, reload) {
            final unread = !toBool(n['is_read']);
            final type = toStr(n['type'], 'info');
            return GlowCard(
              glow: unread ? statusColor(type == 'error' ? 'danger' : type) : C.line,
              padding: const EdgeInsets.all(14),
              onTap: () async {
                if (unread) {
                  try {
                    await Api.I.postRaw('notifications/read', {'id': n['id']});
                  } catch (_) {}
                }
                if (!ctx.mounted) return;
                await showMessage(ctx, toStr(n['message']), type: type == 'error' ? 'danger' : (type == 'success' ? 'success' : 'info'), title: toStr(n['title']));
                reload();
              },
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(unread ? Icons.notifications_active : Icons.notifications_none, color: unread ? C.amber : C.muted),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(toStr(n['title']), style: TextStyle(fontWeight: unread ? FontWeight.w800 : FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text(toStr(n['message']), maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(color: C.muted, fontSize: 13)),
                    const SizedBox(height: 4),
                    Text(fmtDate(n['created_at']), style: const TextStyle(color: C.muted, fontSize: 11)),
                  ]),
                ),
              ]),
            );
          },
        ),
      );
}
