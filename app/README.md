# SKY WIFI — seller app (Flutter)

Android app for SKY WIFI TANZANIA sellers and the administrator. It uses `api.php` on the website
(`https://wifi.skytanzania.co.tz/api.php`) — every action runs the same code as the website.

## Screens

- **Sign in / create account / forgot password** (Privacy Policy must be accepted)
- **Home** — balance, today / month / all-time earnings, online users, routers online, unused vouchers, payments to check, quick actions, recent sales
- **Vouchers** — search, filter by status, generate, QR code, copy / share text, block / unblock, delete, batches, printing (Kiswahili cards) and WiFi posters
- **Clients** — online users with live speed, add / remove time, disconnect, block; customers (call / SMS); blocked devices
- **Money** — payments (ask Sonic Pesa, reconnect customer, cancel, notes), withdraw (Sonic Pesa payout), voucher commission (pay with USSD push, live status), ledger
- **More** — routers (add Omada / Ruijie / Cudy, provision & connect, start / stop, reboot, health check, RADIUS settings, settings to copy, extra WiFi names, outages, history), packages, WiFi names, map, customers, insights (monthly goal, tips, best packages), top sellers, reports, SMS (buy bundles, send, automatic voucher SMS), messages with the administrator, notifications, profile & settings (password, notifications, captive portal message, signed-in phones)
- **Administrator** — platform earnings, sellers (lock / unlock / suspend / free SMS / message), all routers, withdrawals, commission invoices, portal visitors, message to all sellers
- **Locked account** — only paying the voucher commission works (like the website)

Every system message is shown as a pop-up. The server address can be changed by long-pressing the logo on the sign-in screen.

## Build

```bash
cd app
flutter pub get
flutter run                  # phone connected / emulator
flutter build apk --release  # build/app/outputs/flutter-apk/app-release.apk
```

Flutter 3.38.x (same as `.github/workflows/build-apk.yml`). Code: `lib/api.dart` (API client), `lib/ui.dart` (theme + shared widgets),
`lib/main.dart` (start, sign-in state), `lib/screens/*.dart` (screens).

## Permanent signing key

Release builds are signed with the SKY WIFI upload key (alias `skywifi`, valid until 2056) from the repository secrets
`ANDROID_KEYSTORE_BASE64`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS`, `ANDROID_KEY_PASSWORD`.
The workflow stops if an APK is signed with any other key.

- SHA-256: `A0:8C:15:7F:C4:F7:52:61:20:8E:2E:FD:31:0B:A6:F4:29:20:89:C4:4B:C7:9F:10:C0:77:AC:CB:5E:3B:AD:6E`
- SHA-1: `40:59:3E:CB:D0:27:89:A9:5B:AE:A0:D0:50:71:96:38:33:5F:71:7C`

The keystore file itself is never in this repository (it is public). Keep the `.jks` file and its password in a safe place —
without them no update of the app can be published.
