# SKY WIFI TANZANIA — Mobile App API (api.php v1.0)

`api.php` sits next to `index.php` (v9.6+) and `config.local.php`. It uses `index.php` as its engine, so every
action runs exactly the same code as the website (same checks, Omada / Ruijie / Cudy, RADIUS, Sonic Pesa, SMS).

## 1. Basics

| | |
|---|---|
| Base URL | `https://wifi.skytanzania.co.tz/api.php?r=ROUTE` (or `/api.php/ROUTE` if the host supports PATH_INFO) |
| Body | JSON (`Content-Type: application/json`) **or** normal form fields. GET parameters for reads. |
| Auth | `Authorization: Bearer sk_…` (fallbacks: header `X-Api-Token: sk_…`, or `&token=sk_…`) |
| Time | `Y-m-d H:i:s`, Africa/Dar_es_Salaam (+03:00) |
| Money | TZS (numbers) |
| Paging | `page` (1…), `per_page` (max 100) → `meta: {page, per_page, total, pages}` |
| All routes | `GET ?r=routes` |

### Answers

```json
// data
{"ok": true, "data": {...}, "meta": {"page":1,"per_page":25,"total":80,"pages":4}}

// action (write) — same messages the website shows
{"ok": true, "type": "success", "message": "Saved successfully.", "message_html": "…",
 "action": "package_save", "redirect": "?page=packages", "params": {"page": "packages"}}

// error
{"ok": false, "error": "invalid_token", "message": "Token is invalid or expired — sign in again."}
```

`type` is `success | info | warning | danger`. `warning` / `info` are still `ok: true` (e.g. "saved, but…").
`params` holds useful values from the website redirect, e.g. `batch` after generating vouchers, `id` of a new router.

Live routes (marked **live**) return the website's live JSON as-is, plus `ok`
(e.g. `{"ok":true,"success":true,"unread":3}`).

### HTTP codes

| Code | error | Meaning |
|---|---|---|
| 400 | bad_json, bad_action | Bad request |
| 401 | no_token, invalid_token, invalid_credentials, invalid_ticket | Sign in (again) |
| 403 | forbidden, account_inactive, registration_closed | Not allowed |
| 404 | not_found | Unknown route / item |
| 405 | method_not_allowed | Wrong GET/POST |
| 409 | exists | Username / email / phone taken |
| 422 | (various) | Validation / action refused — show `message` |
| 423 | account_locked | Seller is locked → open `home` screen (`locked` or `commission`). Only routes marked 🔓 work |
| 429 | rate_limited | Too many tries |
| 500 | server_error | Show `ref` to support |
| 503 | api_disabled, payout_not_ready | Feature off |

## 2. Sign-in

| Route | Method | Body | Returns |
|---|---|---|---|
| `info` | GET | – | name, versions, currency, logo_url, portal_url, registration_open, features |
| `privacy` | GET | – | version, text, html (show at registration) |
| `auth/login` | POST | `username` (username / email / phone), `password`, `device_name`, `platform` | `token`, `expires_at`, `user` |
| `auth/register` | POST | `full_name`, `username`, `email`, `phone`, `password` (≥6), `privacy_accept: true`, `device_name` | `token`, `user` |
| `auth/forgot` | POST | `who` (username / email / phone) | reset link sent by e-mail / SMS |
| `auth/logout` 🔓 | POST | – | signs out this device |
| `auth/logout_all` 🔓 | POST | – | signs out every device |
| `auth/sessions` 🔓 | GET | – | signed-in devices (`current: true` = this one) |
| `auth/revoke` 🔓 | POST | `id` | signs out one device |

Tokens last 90 days after their last use and are revoked when the password changes (except the current device).

## 3. Account

| Route | Method | Body / query | Notes |
|---|---|---|---|
| `me` 🔓 | GET | – | profile, balance, sms_balance, `restricted`, `home`, locks, unread counts, privacy_accepted |
| `locked` 🔓 | GET | – | lock reason, owed commission, invoices, pending payment |
| `privacy/accept` | POST | – | accept the current Privacy Policy |
| `profile/update` | POST | `full_name`, `email`, `phone` (missing fields keep their value) | |
| `profile/password` | POST | `current`, `new` | other devices are signed out |
| `settings` | GET | – | sms/email notifications, portal announcement, monthly goal |
| `settings/prefs` | POST | `sms_enabled`, `email_enabled` (true/false) | |
| `settings/announce` | POST | `announce` (≤300 chars, banner on your captive portal) | |
| `notifications` 🔓 | GET | `unread=1`, paging | |
| `notifications/read` | POST | `id` | **live** |
| `notifications/read_all` | POST | – | |
| `badges` | GET | – | **live** chat + bell counts and the newest of each (poll every 5–10 s) |
| `live` | GET | – | **live** dashboard numbers |

## 4. Home

| Route | Method | Query | Notes |
|---|---|---|---|
| `dashboard` | GET | – | stats, earnings, routers, pending orders, recent sales (admin: + platform) |
| `earnings` | GET | admin: `seller` | summary + this / last month / all time |
| `insights` | GET | admin: `seller` | goal progress, heatmap, top packages, routers, customers, rank, tips |
| `insights/goal` | POST | `goal` (TZS per month) | |
| `top_sellers` | GET | `period` = today, 7d, 30d, month, all | |
| `reports` | GET | `type` = seller / router, `id`, `period` = today, yesterday, 7d, 30d, month, last_month, year, custom (+ `from`, `to` as Y-m-d) | |
| `export/report` | GET | same as reports | CSV file |

## 5. Routers / hotspot

| Route | Method | Body / query | Notes |
|---|---|---|---|
| `routers` | GET | `q` | your routers with online status |
| `routers/get` | GET | `id` | + RADIUS settings (`radius`), setup text for Ruijie / Cudy (`setup_sheet`), history, outages, RADIUS log |
| `routers/models` | GET | – | brands + models (`code` is used in `router_model`) |
| `routers/save` | POST | **new:** `router_model`, `device_name`, `ap_mac`, `ssid`, `site_name`, `location`, `lipa_info`, `omada_sn` (Omada S/N), `dev_user` / `dev_pass` (router login), `rj_model` (Ruijie / Cudy "any model"), `prov_pkg` + `prov_qty` (first vouchers), `latitude`, `longitude`, `map_public`, `is_active` · **edit:** `id` + only the fields that change | `params.id` = router id |
| `routers/delete` | POST | `id` | |
| `routers/toggle` | POST | `id` | start / stop the hotspot |
| `routers/regen_secrets` | POST | `id` | new RADIUS passwords |
| `routers/provision` | POST | `id` (+ `dev_user`, `dev_pass`) | Omada: run setup again |
| `routers/provision_step` | POST | `id` | **live** call every 3–5 s until `done: true` (`phase`, `msg`) |
| `routers/command` | POST | `id`, `cmd` = reboot / locate | Omada |
| `routers/link_check` / `routers/link_fix` | POST | `id` | health check / repair |
| `routers/sync_all` | POST | – | refresh all router statuses |
| `routers/ssid_create` | POST | `id`, `name`, `type` = hotspot / private / radius / enterprise, `psk` (private, 8–63), `band` = 1 (2.4 GHz) / 2 (5 GHz) / 3 (both) | extra WiFi name |
| `routers/ssid_delete` | POST | `id`, `ssid` (id from `extra_ssids`) | |
| `routers/cudy_portal` | POST | `id`, `secret`, `mode`, `port`, `https`, `path` | Cudy login settings |
| `routers/ruijie_portal` | POST | `id`, `tpl`, `method`, `ufield`, `pfield`, `echo` | Ruijie login settings |
| `routers/ruijie_sync` | POST | `id` | |
| `wifi_names` | GET | – | every router's WiFi names |
| `wifi_names/add` | POST | `router` (id or `all`), `name`, `type`, `psk`, `band` | |
| `map` | GET | admin: `seller` | access points with position, status, sales today; `public_map_url` |
| `map/save` | POST | `id`, `latitude`, `longitude`, `map_public`, or `clear: true` | |

## 6. Packages & vouchers

| Route | Method | Body / query | Notes |
|---|---|---|---|
| `packages` | GET | – | + `unused_vouchers` |
| `packages/save` | POST | `id` (edit), `name`, `description`, `price`, `duration_minutes`, `time_mode` = continuous / online, `data_limit_mb`, `speed_down_mbps`, `speed_up_mbps`, `max_devices` (1–10), `validity_days`, `show_on_portal`, `is_active`, `sort_order`, `device_id` (0 = all routers) | edit: send only changes |
| `packages/delete` | POST | `id` | |
| `vouchers` | GET | `status` = available / sold / active / expired / exhausted / blocked / cancelled, `batch`, `q`, `package_id`, paging | + `counts`, `remaining_seconds` |
| `vouchers/get` | GET | `id` or `code` | devices, sessions, adjustments, `qr_url` |
| `vouchers/batches` | GET | – | last 60 batches |
| `vouchers/generate` | POST | `package_id`, `quantity` | `params.batch` |
| `vouchers/status` | POST | `id`, `to` = blocked / cancelled / unblock | |
| `vouchers/delete` | POST | `id` | |
| `vouchers/delete_many` | POST | `ids` (array) | |
| `vouchers/delete_batch` | POST | `batch` | unused vouchers of the batch |
| `vouchers/print_link` | GET | `batch` | `print_url` / `posters_url` to open in a WebView (valid 15 min, no token in the address) |
| `export/vouchers` | GET | `batch` | CSV file |

## 7. Clients

| Route | Method | Body / query | Notes |
|---|---|---|---|
| `sessions` | GET | `device`, `q`, paging | online users + `remaining_seconds`, `phone` |
| `sessions/metrics` | GET | `device` | **live** speed per session / router (poll 15 s) |
| `sessions/blocked` | GET | – | blocked devices |
| `sessions/disconnect` | POST | `session_id` | |
| `sessions/adjust` | POST | `voucher_id`, `minutes` (+/−), `reason` | add / remove time |
| `sessions/bulk_adjust` | POST | `voucher_ids` (array), `minutes`, `reason` | |
| `sessions/block` | POST | `mac`, `reason` | |
| `sessions/unblock` | POST | `id` (from blocked list) | |
| `export/sessions` | GET | – | CSV |
| `customers` | GET | `q` (phone), paging; admin: `seller` | phone, purchases, total, last package |
| `adjustments` | GET | `q`, paging | time changes history |

## 8. Money

| Route | Method | Body / query | Notes |
|---|---|---|---|
| `orders` | GET | `status` = all / attention / pending / failed / expired / paid / cancelled, `q`, paging; admin: `seller` | portal payments + `counts` |
| `orders/get` | GET | `id` or `ref` | + payment events, `allowed_ops` |
| `orders/manage` | POST | `id`, `op` = recheck / fail / cancel / reconnect / set_status (+ `to`) / note (+ `note`); admin also confirm / edit / reverse | sellers cannot mark a payment paid |
| `orders/cancel` | POST | `id` | pending only |
| `orders/recheck_all` | POST | – | ask Sonic Pesa about unconfirmed payments |
| `export/payments` | GET | `status`, `q` | CSV |
| `transactions` | GET | `type` = purchase / commission / withdrawal / adjustment, `q`, paging | ledger + earnings |
| `withdrawals` | GET | paging | history + `balance`, `rules` (minimum, fees), `methods` |
| `withdraw` | POST | `amount`, `method` = mpesa / tigopesa / airtelmoney / halopesa / crdb / nmb / selcom, `account_number`, `account_name` | Sonic Pesa payout |
| `commission` 🔓 | GET | – | percent, running month, owed, invoices, per-day and per-voucher commission, pending payment |
| `commission/pay` 🔓 | POST | `id` (invoice), `phone` | USSD push to the phone |
| `commission/pay_now` 🔓 | POST | `phone` | pay everything owed now |
| `commission/status` 🔓 | GET | `ref` | **live** `status` = pending / paid / failed (poll every 4 s) |

## 9. SMS & messages

| Route | Method | Body / query | Notes |
|---|---|---|---|
| `sms` | GET | paging | balance, bundles, client counts, purchases, sent messages, auto-SMS settings |
| `sms/buy` | POST | `bundle` (key, e.g. `b100`) + `phone` (USSD push) **or** `pay: "balance"` | then poll `sms/status` |
| `sms/status` | GET | `ref` | **live** |
| `sms/send` | POST | `text`, `scope` = all / 30 / 7 / list (+ `numbers`) | |
| `sms/auto` | POST | `auto` (true/false), `tpl`, `optout` | SMS with the voucher after payment |
| `messages` | GET | seller: – · admin: `seller` (none = inbox), `limit` | chat with the administrator |
| `messages/poll` | GET | `after` (last message id); admin: `seller` | **live** new messages (poll 2–3 s on the chat screen) |
| `messages/send` | POST | `body`; admin: `seller` | **live** (`message` = the new message object) |
| `messages/delete` | POST | `id` | **live** |
| `messages/count` | GET | – | **live** unread |

## 10. Administrator (user_type = admin)

| Route | Method | Body / query |
|---|---|---|
| `admin/stats` 🔓 | GET | – |
| `admin/users` 🔓 | GET | `q`, `type` = seller / admin / customer, paging |
| `admin/users/get` 🔓 | GET | `id` |
| `admin/users/status` 🔓 | POST | `id`, `status` = active / suspended |
| `admin/users/lock` 🔓 | POST | `id`, `reason`, `stop_hotspot`, `autopay` (unlock when commission is paid) |
| `admin/users/unlock` 🔓 | POST | `id` |
| `admin/routers` 🔓 | GET | `q`, `seller`, paging |
| `admin/withdrawals` 🔓 | GET | `q`, paging |
| `admin/commissions` 🔓 | GET | `status` = unpaid / overdue / paid / waived, `seller`, paging |
| `admin/visitors` 🔓 | GET | `period` = today / 7d / 30d, `by` = seller / router |
| `admin/broadcast` 🔓 | POST | `title`, `message` |
| `admin/sms_credit` 🔓 | POST | `seller`, `n` (+/−), `note` |
| `admin/inbox` 🔓 | GET | `q` (**live**) |

Admins can also use every seller route; many accept `seller=ID`.

## 11. Any other website action

`POST action` with `act` = the website form action plus its fields, e.g.
`{"act":"admin_settings", …}`. Sellers may only send seller actions.
`GET|POST ajax` with `name` = a live request (`live`, `live_badges`, `live_metrics`, `notif_read`, `sms_buy_status`,
`commission_status`, `chat_count`, `chat_poll`, `chat_send`, `chat_delete`, `chat_inbox`, `prov_step`, `visitors_live`, `simulate`).

## 12. Typical app flow

1. `GET info` → splash (logo, name, registration_open).
2. `POST auth/login` → save `token` securely (Keystore / Keychain).
3. `GET me` → if `restricted` open the `home` screen (`locked` / `commission`), else the dashboard.
4. Any **423** → the same lock screen. Any **401** → login screen.
5. Poll `badges` every 10 s while the app is open (chat + notification counts).
6. Add router: `routers/models` → `routers/save` → `routers/get?id=` (`setup_sheet` for Ruijie / Cudy) → Omada: `routers/provision_step` loop.
7. Sell: `packages/save` → `vouchers/generate` → `vouchers/print_link` (WebView) or share codes.

### Example (cURL)

```bash
curl -X POST "https://wifi.skytanzania.co.tz/api.php?r=auth/login" \
  -H "Content-Type: application/json" \
  -d '{"username":"seller1","password":"••••••","device_name":"Tecno Spark"}'

curl "https://wifi.skytanzania.co.tz/api.php?r=vouchers&status=available&page=1" \
  -H "Authorization: Bearer sk_…"

curl -X POST "https://wifi.skytanzania.co.tz/api.php?r=vouchers/generate" \
  -H "Authorization: Bearer sk_…" -H "Content-Type: application/json" \
  -d '{"package_id":2,"quantity":20}'
```

## 13. Server notes

- If the host strips the `Authorization` header (some Apache / CGI hosts), add to `.htaccess`:
  `SetEnvIf Authorization "(.*)" HTTP_AUTHORIZATION=$1` — or use the `X-Api-Token` header.
- Optional in `config.local.php`: `define('SKY_API_TOKEN_DAYS', '90');` and `define('SKY_API_CORS', '*');`
- Turn the API off: setting `api_enabled` = `0` (table `settings`).
- Tokens are stored as SHA-256 in table `hs_api_tokens` (created automatically).
