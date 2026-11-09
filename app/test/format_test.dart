import 'package:flutter_test/flutter_test.dart';
import 'package:sky_wifi/api.dart';
import 'package:sky_wifi/ui.dart';

void main() {
  test('money and thousands', () {
    expect(thousands(1500), '1,500');
    expect(thousands(1234567), '1,234,567');
    expect(money(500), 'TZS 500');
  });
  test('safe readers', () {
    expect(toInt('12'), 12);
    expect(toInt(3.7), 3);
    expect(toDouble('2.5'), 2.5);
    expect(toBool(1), true);
    expect(toMap(null), isEmpty);
  });
  test('durations', () {
    expect(fmtMinutes(60), '1 hour');
    expect(fmtMinutes(2880), '2 days');
    expect(fmtSecs(3700), '1h 1m');
  });
  test('action result', () {
    final r = ActionResult.fromJson({'ok': false, 'type': 'danger', 'message': 'No', 'params': {'id': '4'}});
    expect(r.ok, false);
    expect(r.params['id'], '4');
  });
}
