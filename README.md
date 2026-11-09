# SKY WIFI TANZANIA

Hotspot seller platform (TP-Link Omada, Ruijie / Reyee and Cudy routers, own RADIUS server, Sonic Pesa mobile money)
and its Android app.

| Folder | What |
|---|---|
| [`app/`](app) | **SKY WIFI** seller app — Flutter (Android). Built by GitHub Actions into an APK. |
| [`server/api.php`](server/api.php) | JSON API for the app. Goes next to `index.php` (v9.6 or newer) and `config.local.php` on the website. |
| [`server/API-DOCS.md`](server/API-DOCS.md) | Every API route, fields, answers and error codes. |

## Get the APK

1. Open **Actions** → **Build SKY WIFI APK** → the latest green run.
2. Download **sky-wifi-release-apk** (zip) → `app-release.apk` → install on the phone.

Every push to `main` that changes `app/` builds a new APK. You can also start a build by hand: Actions → Build SKY WIFI APK → **Run workflow**.

### Same signing key for every build (needed for updates and Google Play)

Add these repository secrets (Settings → Secrets and variables → Actions):
`ANDROID_KEYSTORE_BASE64`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS`, `ANDROID_KEY_PASSWORD`.
With them, each run also builds **sky-wifi-playstore-aab** for the Play Console. Without them the APK is signed with a
temporary key (uninstall the old app before installing a new build).

## Server

1. Upload `server/api.php` next to `index.php` **v9.6+** (the API uses index.php as its engine) and `config.local.php`.
2. Test: `https://wifi.skytanzania.co.tz/api.php?r=info` must answer `{"ok":true,…}`.
3. If the app says "Sign in first" on every screen, the host strips the `Authorization` header — see API-DOCS.md §13
   (the app also sends `X-Api-Token`, so this is rarely needed).
