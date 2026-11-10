<?php
/**
 * ============================================================================
 *  SKY WIFI TANZANIA — api.php  v1.1  (JSON REST API for the mobile app)
 * ============================================================================
 *  v1.1 (index.php v9.7): routers/omada + routers/omada_sync (RADIUS server / profile / portal → Omada), sessions/speed (speed of one
 *        user), package fair usage (fup_mb, fup_down_mbps, fup_up_mbps), export/report_pdf (report as PDF), admin/sms_after_sale(+/save),
 *        admin/radius_servers.
 *  Put this file next to index.php (index.php v9.7 or newer) and config.local.php. Nothing else is needed:
 *  the API uses index.php as its engine (database, classes, Omada / Ruijie / Cudy, RADIUS, Sonic Pesa, SMS, e-mail),
 *  so every write goes through exactly the same code as the website — same checks, same results.
 *
 *  ADDRESS        https://YOUR-SITE/api.php?r=ROUTE            e.g.  api.php?r=vouchers&status=available&page=2
 *                 (or https://YOUR-SITE/api.php/ROUTE when the host supports PATH_INFO)
 *  BODY           JSON (Content-Type: application/json) or normal form fields. GET parameters work for reads.
 *  LOGIN          POST api.php?r=auth/login  {"username":"…","password":"…","device_name":"Samsung A15"}
 *                 → {"ok":true,"data":{"token":"sk_…","user":{…}}}
 *  TOKEN          every other call:  Authorization: Bearer sk_…     (or header X-Api-Token: sk_…, or ?token=sk_… as a last resort)
 *  ANSWER         success  {"ok":true,"data":…,"meta":{"page":1,"per_page":25,"total":80,"pages":4}}
 *                 action   {"ok":true,"type":"success","message":"Saved","message_html":"…","redirect":"?page=…","params":{…}}
 *                 error    {"ok":false,"error":"invalid_token","message":"…"}   HTTP 400/401/403/404/405/409/422/423/429/500
 *                 locked   HTTP 423 {"ok":false,"error":"account_locked","home":"locked"|"commission"} — only "locked_ok" routes work
 *  TIMES          "Y-m-d H:i:s" in Africa/Dar_es_Salaam (+03:00). Money in CURRENCY (TZS).
 *  LIST           every route and its parameters:  GET api.php?r=routes   (also in API-DOCS.md delivered with this file)
 *
 *  Security: tokens are random (sk_ + 48 hex), only their SHA-256 is stored (table hs_api_tokens), they expire after
 *  SKY_API_TOKEN_DAYS days of no use (default 90; define it in config.local.php to change), and are revoked on logout /
 *  password change. No cookies are used, so the API cannot be abused through a browser (no CSRF).
 *  Optional in config.local.php:  define('SKY_API_TOKEN_DAYS', '90');   define('SKY_API_CORS', '*');
 * ============================================================================
 */
define('SKY_API', '1.1');

// ---------- CORS (a web build of the app may call the API from another origin; tokens are never cookies) ----------
$__apiOrigin = defined('SKY_API_CORS') ? (string)SKY_API_CORS : '*';
header('Access-Control-Allow-Origin: ' . $__apiOrigin);
header('Access-Control-Allow-Headers: Authorization, Content-Type, X-Api-Token, X-Auth-Token, Accept');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Max-Age: 86400');
header('X-Content-Type-Options: nosniff');
if (($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'OPTIONS') { http_response_code(204); exit; }

// ---------- the engine must be index.php v9.6+ ----------
$__apiIdx = __DIR__ . '/index.php';
if (!is_file($__apiIdx) || strpos((string)file_get_contents($__apiIdx), 'skyApiRoute') === false) {
    http_response_code(500);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['ok' => false, 'error' => 'engine_outdated', 'message' => 'api.php needs index.php v9.6 or newer in the same folder.']);
    exit;
}

// ---------- session in memory only (no cookie, no file): the token decides who is calling ----------
final class SkyApiMemSession implements SessionHandlerInterface
{
    public function open($path, $name): bool { return true; }
    public function close(): bool { return true; }
    #[\ReturnTypeWillChange] public function read($id) { return ''; }
    public function write($id, $data): bool { return true; }
    public function destroy($id): bool { return true; }
    #[\ReturnTypeWillChange] public function gc($max) { return 0; }
}
if (session_status() === PHP_SESSION_NONE) {
    $__off = array_map('trim', explode(',', strtolower((string)ini_get('disable_functions'))));
    if (function_exists('ini_set') && !in_array('ini_set', $__off, true)) {
        @ini_set('session.use_cookies', '0');
        @ini_set('session.use_only_cookies', '1');
        @ini_set('session.use_trans_sid', '0');
        @ini_set('session.cache_limiter', '');
    }
    session_set_save_handler(new SkyApiMemSession(), true);
    session_name('SKYAPI');
    session_id('api' . bin2hex(random_bytes(12)));
    @session_start();
    unset($__off);
}

// ---------- request ----------
SkyApi::$method = strtoupper((string)($_SERVER['REQUEST_METHOD'] ?? 'GET'));
$__r = (string)($_GET['r'] ?? '');
if ($__r === '' && !empty($_SERVER['PATH_INFO'])) $__r = (string)$_SERVER['PATH_INFO'];
SkyApi::$route = trim((string)preg_replace('#[^a-z0-9_/]#', '', strtolower($__r)), '/');
SkyApi::$query = $_GET;
unset(SkyApi::$query['r']);
$__body = [];
$__ct = strtolower((string)($_SERVER['CONTENT_TYPE'] ?? ($_SERVER['HTTP_CONTENT_TYPE'] ?? '')));
if (SkyApi::$method === 'POST' && strpos($__ct, 'json') !== false) {
    $__raw = (string)file_get_contents('php://input');
    $__j = $__raw !== '' ? json_decode($__raw, true) : [];
    if ($__raw !== '' && !is_array($__j)) SkyApi::earlyFail('Invalid JSON body.', 400, 'bad_json');
    $__body = is_array($__j) ? $__j : [];
}
SkyApi::$in = array_merge(SkyApi::$query, $_POST, $__body);
// index.php must not see the API parameters as website parameters (page, ajax, export, radius, cron, …)
$_GET = []; $_REQUEST = []; $_POST = [];
unset($__r, $__body, $__ct, $__raw, $__j);

/** Called by index.php (v9.6) at the end of its engine. true = run the normal page action / ajax / export for this request. */
function skyApiRoute(): bool { return SkyApi::run(); }
/** Called by index.php redirectTo() while serving the API: the redirect after an action becomes the JSON answer. */
function skyApiRedirect(string $url): void { SkyApi::redirected($url); }

final class SkyApi
{
    const DISPATCH = '__dispatch__';
    public static string $method = 'GET';
    public static string $route = '';
    public static array $query = [];
    public static array $in = [];
    public static string $mode = 'api';      // api | action | ajax | raw
    public static string $act = '';
    public static ?array $user = null;
    public static ?array $token = null;

    /** Seller actions of the website that the app may send (admin may send any action). */
    const SELLER_ACTS = ['device_save', 'device_delete', 'device_toggle', 'device_regen', 'prov_run', 'router_ssid_create', 'router_ssid_delete',
        'router_geo_save', 'link_check', 'link_fix', 'device_omada_cmd', 'routers_sync_all', 'omada_vouchers', 'cd_portal_save', 'rj_portal_save', 'rj_sync',
        'package_save', 'package_delete', 'vouchers_generate', 'voucher_status', 'voucher_delete', 'vouchers_delete', 'batch_delete', 'wifi_names_add',
        'chat_send', 'adjust', 'bulk_adjust', 'disconnect', 'block_mac', 'unblock_mac', 'order_cancel', 'pay_manage', 'pay_recheck_all',
        'profile', 'password', 'prefs', 'notif_read_all', 'portal_announce', 'privacy_accept', 'insights_goal',
        'commission_pay', 'commission_pay_now', 'sms_buy', 'sms_send', 'sms_auto_save', 'omada_sync', 'voucher_speed'];   // v1.1: + Omada sync, speed per user
    /** Live data requests of the website (index.php ?ajax=…) the app may use. */
    const AJAX = ['live', 'live_badges', 'live_metrics', 'notif_read', 'sms_buy_status', 'commission_status', 'chat_count', 'chat_poll', 'chat_send',
        'chat_delete', 'chat_inbox', 'prov_step', 'visitors_live', 'simulate'];
    /** Columns never sent to the app. */
    const HIDE = ['password', 'verification_token', 'radius_secret', 'acct_secret', 'prov_pass', 'client_secret', 'access_token', 'refresh_token',
        'token_hash', 'site_dev_pass', 'sonic_pesa_response', 'gateway_response', 'response', 'html', 'prov_opts', 'rj_opts', 'rj_params', 'prov_log',
        'claim', 'claimed_at', 'body_raw', 'headers'];

    // =====================================================================
    // ROUTES: path => [methods, who (public|user|seller|admin), handler, works while the seller is locked]
    // =====================================================================
    static function routes(): array
    {
        $A = fn(string $act, ?callable $prep = null) => function () use ($act, $prep) {   // a website action
            $p = self::$in;
            if ($prep) $p = $prep($p);
            return self::dispatch($act, $p);
        };
        $X = fn(string $name, bool $post) => fn() => self::dispatchAjax($name, $post);   // a website live-data request
        return [
            // ----- public -----
            'routes'                 => ['GET', 'public', fn() => self::routeList(), true],
            'info'                   => ['GET', 'public', fn() => self::info(), true],
            'privacy'                => ['GET', 'public', fn() => self::privacy(), true],
            'auth/login'             => ['POST', 'public', fn() => self::login(), true],
            'auth/register'          => ['POST', 'public', fn() => self::register(), true],
            'auth/forgot'            => ['POST', 'public', fn() => self::forgot(), true],
            // ----- every signed-in user -----
            'auth/logout'            => ['POST', 'user', fn() => self::logout(), true],
            'auth/logout_all'        => ['POST', 'user', fn() => self::logoutAll(), true],
            'auth/sessions'          => ['GET', 'user', fn() => self::tokenList(), true],
            'auth/revoke'            => ['POST', 'user', fn() => self::tokenRevoke(), true],
            'me'                     => ['GET', 'user', fn() => self::me(), true],
            'locked'                 => ['GET', 'user', fn() => self::lockedInfo(), true],
            'privacy/accept'         => ['POST', 'user', $A('privacy_accept', fn($p) => $p + ['privacy_accept' => 1]), false],
            'profile/update'         => ['POST', 'user', $A('profile', fn($p) => self::profilePrep($p)), false],
            'profile/password'       => ['POST', 'user', $A('password', fn($p) => ['current' => (string)($p['current'] ?? ($p['current_password'] ?? '')), 'new' => (string)($p['new'] ?? ($p['new_password'] ?? ''))]), false],
            'settings'               => ['GET', 'seller', fn() => self::settings(), false],
            'settings/prefs'         => ['POST', 'user', $A('prefs', fn($p) => self::prefsPrep($p)), false],
            'settings/announce'      => ['POST', 'seller', $A('portal_announce'), false],
            'notifications'          => ['GET', 'user', fn() => self::notifications(), true],
            'notifications/read'     => ['POST', 'user', $X('notif_read', true), false],
            'notifications/read_all' => ['POST', 'user', $A('notif_read_all'), false],
            'badges'                 => ['GET', 'seller', $X('live_badges', false), false],
            'live'                   => ['GET', 'seller', $X('live', false), false],
            // ----- seller: home -----
            'dashboard'              => ['GET', 'seller', fn() => self::dashboard(), false],
            'earnings'               => ['GET', 'seller', fn() => self::earnings(), false],
            'insights'               => ['GET', 'seller', fn() => self::insights(), false],
            'insights/goal'          => ['POST', 'seller', $A('insights_goal'), false],
            'top_sellers'            => ['GET', 'seller', fn() => self::topSellers(), false],
            // ----- seller: routers / hotspot -----
            'routers'                => ['GET', 'seller', fn() => self::routers(), false],
            'routers/get'            => ['GET', 'seller', fn() => self::routerGet(), false],
            'routers/models'         => ['GET', 'seller', fn() => self::routerModels(), false],
            'routers/save'           => ['POST', 'seller', $A('device_save', fn($p) => self::routerPrep($p)), false],
            'routers/delete'         => ['POST', 'seller', $A('device_delete'), false],
            'routers/toggle'         => ['POST', 'seller', $A('device_toggle'), false],
            'routers/regen_secrets'  => ['POST', 'seller', $A('device_regen'), false],
            'routers/provision'      => ['POST', 'seller', $A('prov_run'), false],
            'routers/provision_step' => ['POST', 'seller', $X('prov_step', true), false],
            'routers/command'        => ['POST', 'seller', $A('device_omada_cmd'), false],
            'routers/link_check'     => ['POST', 'seller', $A('link_check'), false],
            'routers/link_fix'       => ['POST', 'seller', $A('link_fix'), false],
            'routers/sync_all'       => ['POST', 'seller', $A('routers_sync_all'), false],
            'routers/ssid_create'    => ['POST', 'seller', $A('router_ssid_create'), false],
            'routers/ssid_delete'    => ['POST', 'seller', $A('router_ssid_delete'), false],
            'routers/cudy_portal'    => ['POST', 'seller', $A('cd_portal_save'), false],
            'routers/ruijie_portal'  => ['POST', 'seller', $A('rj_portal_save'), false],
            'routers/ruijie_sync'    => ['POST', 'seller', $A('rj_sync'), false],
            'routers/omada'          => ['GET', 'seller', fn() => self::routerOmada(), false],
            'routers/omada_sync'     => ['POST', 'seller', $A('omada_sync', fn($p) => self::omadaSyncPrep($p)), false],
            'wifi_names'             => ['GET', 'seller', fn() => self::wifiNames(), false],
            'wifi_names/add'         => ['POST', 'seller', $A('wifi_names_add'), false],
            'map'                    => ['GET', 'seller', fn() => self::map(), false],
            'map/save'               => ['POST', 'seller', $A('router_geo_save', fn($p) => ['id' => $p['id'] ?? 0, 'lat' => $p['lat'] ?? ($p['latitude'] ?? ''), 'lng' => $p['lng'] ?? ($p['longitude'] ?? ''),
                                            'map_public' => !empty($p['map_public']) && filter_var($p['map_public'], FILTER_VALIDATE_BOOLEAN) ? 1 : 0, 'clear' => !empty($p['clear']) ? 1 : '', 'return' => 'map']), false],
            // ----- seller: packages & vouchers -----
            'packages'               => ['GET', 'seller', fn() => self::packages(), false],
            'packages/save'          => ['POST', 'seller', $A('package_save', fn($p) => self::packagePrep($p)), false],
            'packages/delete'        => ['POST', 'seller', $A('package_delete'), false],
            'vouchers'               => ['GET', 'seller', fn() => self::vouchers(), false],
            'vouchers/get'           => ['GET', 'seller', fn() => self::voucherGet(), false],
            'vouchers/batches'       => ['GET', 'seller', fn() => self::batches(), false],
            'vouchers/generate'      => ['POST', 'seller', $A('vouchers_generate'), false],
            'vouchers/status'        => ['POST', 'seller', $A('voucher_status'), false],
            'vouchers/delete'        => ['POST', 'seller', $A('voucher_delete'), false],
            'vouchers/delete_many'   => ['POST', 'seller', $A('vouchers_delete'), false],
            'vouchers/delete_batch'  => ['POST', 'seller', $A('batch_delete'), false],
            'vouchers/print_link'    => ['GET', 'seller', fn() => self::printLink(), false],
            'vouchers/print_data'    => ['GET', 'seller', fn() => self::printData(), false],
            // ----- seller: clients -----
            'sessions'               => ['GET', 'seller', fn() => self::sessions(), false],
            'sessions/metrics'       => ['GET', 'seller', $X('live_metrics', false), false],
            'sessions/blocked'       => ['GET', 'seller', fn() => self::blocked(), false],
            'sessions/disconnect'    => ['POST', 'seller', $A('disconnect'), false],
            'sessions/adjust'        => ['POST', 'seller', $A('adjust', fn($p) => $p + ['return' => '?page=sessions']), false],
            'sessions/bulk_adjust'   => ['POST', 'seller', $A('bulk_adjust'), false],
            'sessions/block'         => ['POST', 'seller', $A('block_mac'), false],
            'sessions/unblock'       => ['POST', 'seller', $A('unblock_mac'), false],
            'sessions/speed'         => ['POST', 'seller', $A('voucher_speed', fn($p) => self::speedPrep($p)), false],
            'customers'              => ['GET', 'seller', fn() => self::customers(), false],
            'adjustments'            => ['GET', 'seller', fn() => self::adjustments(), false],
            // ----- seller: money -----
            'orders'                 => ['GET', 'seller', fn() => self::orders(), false],
            'orders/get'             => ['GET', 'seller', fn() => self::orderGet(), false],
            'orders/manage'          => ['POST', 'seller', $A('pay_manage'), false],
            'orders/cancel'          => ['POST', 'seller', $A('order_cancel'), false],
            'orders/recheck_all'     => ['POST', 'seller', $A('pay_recheck_all'), false],
            'transactions'           => ['GET', 'seller', fn() => self::ledger(), false],
            'withdrawals'            => ['GET', 'seller', fn() => self::withdrawals(), false],
            'withdraw'               => ['POST', 'seller', fn() => self::withdraw(), false],
            'commission'             => ['GET', 'seller', fn() => self::commission(), true],
            'commission/pay'         => ['POST', 'seller', $A('commission_pay'), true],
            'commission/pay_now'     => ['POST', 'seller', $A('commission_pay_now'), true],
            'commission/status'      => ['GET', 'seller', $X('commission_status', false), true],
            'reports'                => ['GET', 'seller', fn() => self::reports(), false],
            // ----- seller: SMS & messages -----
            'sms'                    => ['GET', 'seller', fn() => self::sms(), false],
            'sms/buy'                => ['POST', 'seller', $A('sms_buy'), false],
            'sms/send'               => ['POST', 'seller', $A('sms_send'), false],
            'sms/auto'               => ['POST', 'seller', $A('sms_auto_save'), false],
            'sms/status'             => ['GET', 'seller', $X('sms_buy_status', false), false],
            'messages'               => ['GET', 'seller', fn() => self::messages(), false],
            'messages/poll'          => ['GET', 'seller', $X('chat_poll', false), false],
            'messages/send'          => ['POST', 'seller', $X('chat_send', true), false],
            'messages/delete'        => ['POST', 'seller', $X('chat_delete', true), false],
            'messages/count'         => ['GET', 'seller', $X('chat_count', false), false],
            // ----- files (CSV) and printable pages -----
            'export/vouchers'        => ['GET', 'seller', fn() => self::raw('export', 'vouchers'), false],
            'export/payments'        => ['GET', 'seller', fn() => self::raw('export', 'payments'), false],
            'export/sessions'        => ['GET', 'seller', fn() => self::raw('export', 'sessions'), false],
            'export/report'          => ['GET', 'seller', fn() => self::raw('export', 'report'), false],
            'export/report_pdf'      => ['GET', 'seller', fn() => self::raw('export', 'report_pdf'), false],
            'view/print'             => ['GET', 'ticket', fn() => self::raw('page', 'print'), false],
            'view/posters'           => ['GET', 'ticket', fn() => self::raw('page', 'posters'), false],
            // ----- administrator -----
            'admin/stats'            => ['GET', 'admin', fn() => self::adminStats(), true],
            'admin/users'            => ['GET', 'admin', fn() => self::adminUsers(), true],
            'admin/users/get'        => ['GET', 'admin', fn() => self::adminUserGet(), true],
            'admin/users/status'     => ['POST', 'admin', $A('admin_user_status'), true],
            'admin/users/lock'       => ['POST', 'admin', $A('admin_user_lock'), true],
            'admin/users/unlock'     => ['POST', 'admin', $A('admin_user_unlock'), true],
            'admin/routers'          => ['GET', 'admin', fn() => self::adminRouters(), true],
            'admin/withdrawals'      => ['GET', 'admin', fn() => self::adminWithdrawals(), true],
            'admin/commissions'      => ['GET', 'admin', fn() => self::adminCommissions(), true],
            'admin/visitors'         => ['GET', 'admin', fn() => self::adminVisitors(), true],
            'admin/broadcast'        => ['POST', 'admin', $A('admin_broadcast'), true],
            'admin/sms_credit'       => ['POST', 'admin', $A('msg_credit'), true],
            'admin/sms_after_sale'   => ['GET', 'admin', fn() => self::adminAfterSale(), true],
            'admin/sms_after_sale/save' => ['POST', 'admin', $A('msg_after_sale_save', fn($p) => self::afterSalePrep($p)), true],
            'admin/radius_servers'   => ['GET', 'admin', fn() => self::adminRadiusServers(), true],
            'admin/inbox'            => ['GET', 'admin', $X('chat_inbox', false), true],
            // ----- any other website action / live request -----
            'action'                 => ['POST', 'user', fn() => self::genericAction(), true],
            'ajax'                   => ['GET,POST', 'user', fn() => self::genericAjax(), true],
        ];
    }

    // =====================================================================
    // FRONT CONTROLLER
    // =====================================================================
    static function run(): bool
    {
        set_exception_handler(function (Throwable $e): void {
            $ref = strtoupper(substr(md5($e->getMessage() . microtime()), 0, 8));
            error_log('SKY API [' . $ref . '] ' . get_class($e) . ': ' . $e->getMessage() . ' in ' . $e->getFile() . ':' . $e->getLine());
            $adm = (self::$user['user_type'] ?? '') === 'admin';
            self::json(['ok' => false, 'error' => 'server_error', 'ref' => $ref, 'message' => 'Server error ' . $ref . ($adm ? ': ' . $e->getMessage() . ' (' . basename($e->getFile()) . ':' . $e->getLine() . ')' : '')], 500);
        });
        if (getSetting('api_enabled', '1') !== '1') self::fail('The API is switched off by the administrator.', 503, 'api_disabled');
        self::schema();
        $routes = self::routes();
        $route = self::$route === '' ? 'info' : self::$route;
        if (!isset($routes[$route])) self::fail('Unknown route "' . $route . '". See ?r=routes', 404, 'not_found');
        [$methods, $who, $fn, $lockedOk] = $routes[$route];
        if (!in_array(self::$method, explode(',', $methods), true)) self::fail('Use ' . $methods . ' for ' . $route . '.', 405, 'method_not_allowed');
        if ($who === 'ticket') self::authTicket($route);
        elseif ($who !== 'public') self::auth($who, (bool)$lockedOk);
        else self::authOptional();
        $res = $fn();
        if ($res === self::DISPATCH) return true;   // index.php continues with the website action / ajax / export / page
        self::out($res);
        return false;
    }

    // ---------- answers ----------
    static function json(array $a, int $code = 200): void
    {
        while (ob_get_level() > 0) @ob_end_clean();
        if (!headers_sent()) {
            if (function_exists('header_remove')) { header_remove('Location'); header_remove('Set-Cookie'); }
            http_response_code($code);
            header('Content-Type: application/json; charset=utf-8');
            header('Cache-Control: no-store');
        }
        echo json_encode($a, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_INVALID_UTF8_SUBSTITUTE | JSON_PRESERVE_ZERO_FRACTION);
        exit;
    }
    static function out($data, array $meta = []): void
    {
        if (is_array($data) && array_key_exists('__meta', $data)) { $meta = $data['__meta']; unset($data['__meta']); $data = $data['data'] ?? $data; }
        self::json(['ok' => true, 'data' => self::clean($data)] + ($meta ? ['meta' => $meta] : []));
    }
    static function fail(string $msg, int $code = 422, string $err = 'error', array $extra = []): void
    {
        self::json(['ok' => false, 'error' => $err, 'message' => $msg] + $extra, $code);
    }
    static function earlyFail(string $msg, int $code, string $err): void
    {
        http_response_code($code);
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode(['ok' => false, 'error' => $err, 'message' => $msg]);
        exit;
    }
    static function list(array $rows, int $total, int $page, int $per, array $extra = []): array
    {
        return ['__meta' => ['page' => $page, 'per_page' => $per, 'total' => $total, 'pages' => (int)max(1, ceil($total / max(1, $per)))],
            'data' => $extra ? $extra + ['items' => $rows] : $rows];
    }
    /** Hide secrets, turn numbers into numbers, decode JSON columns. */
    static function clean($x)
    {
        if (!is_array($x)) return $x;
        $o = [];
        foreach ($x as $k => $v) {
            if (is_string($k) && in_array($k, self::HIDE, true)) continue;
            if (is_array($v)) { $o[$k] = self::clean($v); continue; }
            if (is_string($k) && in_array($k, ['health_json', 'extra_ssids', 'sites_json'], true)) { $o[$k === 'health_json' ? 'health' : $k] = json_decode((string)$v, true); continue; }
            if (is_string($v) && is_string($k) && self::numericKey($k)) {
                if (preg_match('/^-?\d{1,15}$/', $v)) { $o[$k] = (int)$v; continue; }
                if (is_numeric($v)) { $o[$k] = (float)$v; continue; }
            }
            $o[$k] = $v;
        }
        return $o;
    }
    static function numericKey(string $k): bool
    {
        if (preg_match('/^(omada_(site|wlan|ssid|radius|portal|vgroup)_id|sonic_pesa_withdrawal_id|ext_.*|sp_.*|gateway_.*|unique_id|acct_session_id|batch|code|phone|.*_phone|ref|.*_ref|nas_id|omada_nas_id|omada_sn|sn|mac|.*_mac|account_number|username|referral_code)$/', $k)) return false;
        return (bool)preg_match('/^(id|.*_id|n|.*_n|amount|.*_amount|price|total|.*_total|balance|.*_balance|fee|.*_fee|net_amount|.*minutes|.*seconds|session_time|.*bytes.*|.*_mb|.*_mbps|percent|.*_percent|max_devices|validity_days|sort_order|is_.*|show_on_portal|.*_count|count|sales|vouchers|users|devices|macs|parts|sms|rank|online|routers|customers|hits|visits|.*_bps|pkts_.*|attempts|credited|tries|from_admin|unused|change_n|balance_after|mm|vc|latitude|longitude|map_public|omada_clients|active_sessions|reconnect_done|.*_enabled|billing_locked|admin_locked|admin_lock_hotspot|admin_lock_autopay|sms_auto_voucher|compensated|reactivated|duration_sec|unit|unit_cost|bundle|devs|ctrls|api_ctrls|omada_on|unread|kind_n|bal|change|d|s|a|p|total_amount)$/', $k);
    }
    static function plain(string $html): string
    {
        $t = preg_replace('#<br\s*/?>|</(div|p|li)>#i', "\n", $html);
        return trim(html_entity_decode(strip_tags((string)$t), ENT_QUOTES | ENT_HTML5, 'UTF-8'));
    }

    // ---------- input ----------
    static function in(string $k, $def = null) { return self::$in[$k] ?? $def; }
    static function int(string $k, int $def = 0): int { $v = self::$in[$k] ?? null; return is_numeric($v) ? (int)$v : $def; }
    static function str(string $k, string $def = '', int $max = 200): string { $v = self::$in[$k] ?? null; return is_scalar($v) ? substr(trim((string)$v), 0, $max) : $def; }
    static function pg(int $per = 25): array
    {
        $p = max(1, self::int('page', 1));
        $pp = max(1, min(100, self::int('per_page', $per)));
        return [$p, $pp, ($p - 1) * $pp];
    }
    static function uid(): int { return (int)(self::$user['id'] ?? 0); }
    static function isAdm(): bool { return (self::$user['user_type'] ?? '') === 'admin'; }
    static function like(string $s): string { return '%' . addcslashes($s, '%_\\') . '%'; }

    // =====================================================================
    // TOKENS
    // =====================================================================
    static function schema(): void
    {
        if (getSetting('api_schema', '0') === '1') return;
        db()->query("CREATE TABLE IF NOT EXISTS hs_api_tokens (
            id INT AUTO_INCREMENT PRIMARY KEY, user_id INT NOT NULL, token_hash CHAR(64) NOT NULL, name VARCHAR(100) NULL, platform VARCHAR(40) NULL,
            ip VARCHAR(45) NULL, created_at DATETIME DEFAULT CURRENT_TIMESTAMP, last_used_at DATETIME NULL, expires_at DATETIME NOT NULL, revoked_at DATETIME NULL,
            UNIQUE KEY uq_api_hash (token_hash), KEY idx_api_user (user_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
        setSetting('api_schema', '1');
    }
    static function days(): int { return max(1, min(3650, (int)(defined('SKY_API_TOKEN_DAYS') ? SKY_API_TOKEN_DAYS : 90))); }
    static function issue(int $uid): array
    {
        $tok = 'sk_' . bin2hex(random_bytes(24));
        $exp = date('Y-m-d H:i:s', time() + self::days() * 86400);
        $name = self::str('device_name', 'Mobile app', 100) ?: 'Mobile app';
        $plat = substr((string)preg_replace('/[^A-Za-z0-9 ._\-]/', '', self::str('platform', '', 40)), 0, 40);
        q("INSERT INTO hs_api_tokens (user_id, token_hash, name, platform, ip, last_used_at, expires_at) VALUES (?,?,?,?,?,NOW(),?)",
            'isssss', $uid, hash('sha256', $tok), $name, $plat !== '' ? $plat : null, clientIp(), $exp);
        // at most 20 signed-in devices per account: the oldest are signed out
        $keep = array_column(rows("SELECT id FROM hs_api_tokens WHERE user_id=? AND revoked_at IS NULL ORDER BY id DESC LIMIT 20", 'i', $uid), 'id');
        if ($keep) run("UPDATE hs_api_tokens SET revoked_at=NOW() WHERE user_id=? AND revoked_at IS NULL AND id NOT IN (" . implode(',', array_map('intval', $keep)) . ")", 'i', $uid);
        return ['token' => $tok, 'token_type' => 'Bearer', 'expires_at' => $exp, 'expires_in_days' => self::days()];
    }
    static function bearer(): string
    {
        $h = (string)($_SERVER['HTTP_AUTHORIZATION'] ?? ($_SERVER['REDIRECT_HTTP_AUTHORIZATION'] ?? ''));
        if ($h === '' && function_exists('getallheaders')) foreach ((array)getallheaders() as $k => $v) if (strcasecmp((string)$k, 'Authorization') === 0) $h = (string)$v;
        if (preg_match('/^\s*Bearer\s+(\S+)/i', $h, $m)) return $m[1];
        $x = (string)($_SERVER['HTTP_X_API_TOKEN'] ?? ($_SERVER['HTTP_X_AUTH_TOKEN'] ?? ''));
        if ($x !== '') return trim($x);
        return is_scalar(self::$in['token'] ?? null) ? trim((string)self::$in['token']) : '';
    }
    static function tokenRow(string $tok): ?array
    {
        if (!preg_match('/^sk_[a-f0-9]{48}$/', $tok)) return null;
        return row("SELECT t.id AS token_id, t.expires_at AS token_expires, t.last_used_at AS token_used, u.* FROM hs_api_tokens t JOIN users u ON u.id=t.user_id
                    WHERE t.token_hash=? AND t.revoked_at IS NULL AND t.expires_at > NOW()", 's', hash('sha256', $tok));
    }
    /** Sign the user in for this request (the engine reads $_SESSION like on the website). */
    static function signIn(array $u): void
    {
        self::$user = $u;
        $_SESSION['user_id'] = (int)$u['id'];
        $_SESSION['username'] = $u['username'];
        $_SESSION['user_type'] = $u['user_type'];
        $_SESSION['full_name'] = $u['full_name'];
        $_SESSION['logged_in'] = true;
        $_SESSION['login_time'] = time();
    }
    static function auth(string $who, bool $lockedOk): void
    {
        $tok = self::bearer();
        if ($tok === '') self::fail('Sign in first (Authorization: Bearer TOKEN).', 401, 'no_token');
        $u = self::tokenRow($tok);
        if (!$u) self::fail('Token is invalid or expired — sign in again.', 401, 'invalid_token');
        if ($u['status'] !== 'active') self::fail('This account is not active.', 403, 'account_inactive');
        self::$token = ['id' => (int)$u['token_id'], 'expires_at' => $u['token_expires']];
        if (empty($u['token_used']) || strtotime((string)$u['token_used']) < time() - 300)   // sliding expiry, written at most every 5 minutes
            run("UPDATE hs_api_tokens SET last_used_at=NOW(), ip=?, expires_at=? WHERE id=?", 'ssi', clientIp(), date('Y-m-d H:i:s', time() + self::days() * 86400), (int)$u['token_id']);
        foreach (['token_id', 'token_expires', 'token_used'] as $k) unset($u[$k]);
        self::signIn($u);
        $type = (string)$u['user_type'];
        if ($who === 'admin' && $type !== 'admin') self::fail('Administrators only.', 403, 'forbidden');
        if ($who === 'seller' && !in_array($type, ['seller', 'admin'], true)) self::fail('Seller accounts only.', 403, 'forbidden');
        // payment-only mode (locked by the administrator or for unpaid voucher commission): like the website
        if ($type === 'seller' && !$lockedOk && AdminLock::restricted((int)$u['id'])) {
            $home = AdminLock::isLocked((int)$u['id']) ? 'locked' : 'commission';
            self::fail(t('rs_banner'), 423, 'account_locked', ['home' => $home]);
        }
        // the same background work a website visit starts (after the answer is sent)
        try {
            skyAfterResponse(fn() => Housekeeping::maybe());
            Chat::touch((int)$u['id']);
        } catch (Throwable $e) { error_log('api bg: ' . $e->getMessage()); }
    }
    static function authOptional(): void
    {
        $tok = self::bearer();
        if ($tok !== '' && ($u = self::tokenRow($tok)) && $u['status'] === 'active') {
            self::$token = ['id' => (int)$u['token_id'], 'expires_at' => $u['token_expires']];
            foreach (['token_id', 'token_expires', 'token_used'] as $k) unset($u[$k]);
            self::signIn($u);
        }
    }
    /** Printable pages open in the app's web view with a short ticket (no token in the address). */
    static function ticket(int $uid, string $page): string
    {
        $exp = time() + 900;
        return $uid . '.' . $exp . '.' . substr(hash_hmac('sha256', "apiview|$uid|$exp|$page", APP_SECRET), 0, 40);
    }
    static function authTicket(string $route): void
    {
        $page = substr($route, 5);
        $t = self::str('ticket', '', 120);
        if ($t === '') { self::auth('seller', false); return; }   // a Bearer token works too
        if (!preg_match('/^(\d+)\.(\d+)\.([a-f0-9]{40})$/', $t, $m) || (int)$m[2] < time()
            || !hash_equals(substr(hash_hmac('sha256', "apiview|{$m[1]}|{$m[2]}|$page", APP_SECRET), 0, 40), $m[3])) self::fail('This link has expired — open it again from the app.', 401, 'invalid_ticket');
        $u = row("SELECT * FROM users WHERE id=? AND status='active'", 'i', (int)$m[1]);
        if (!$u || !in_array($u['user_type'], ['seller', 'admin'], true)) self::fail('Account not found.', 401, 'invalid_ticket');
        if ($u['user_type'] === 'seller' && AdminLock::restricted((int)$u['id'])) self::fail(t('rs_banner'), 423, 'account_locked');
        self::signIn($u);
    }

    // =====================================================================
    // WEBSITE ACTIONS → JSON
    // =====================================================================
    static function dispatch(string $act, array $p): string
    {
        if (!preg_match('/^[a-z0-9_]{2,40}$/', $act)) self::fail('Unknown action.', 400, 'bad_action');
        if (!self::isAdm() && !in_array($act, self::SELLER_ACTS, true)) self::fail('This action is for administrators only.', 403, 'forbidden');
        foreach (['csrf', 'csrf2', 'token', 'r', 'ticket'] as $k) unset($p[$k]);
        $tok = bin2hex(random_bytes(16));
        $_SESSION['csrf_token'] = $tok;
        $_POST = ['act' => $act, 'csrf' => $tok] + $p;
        $_POST['act'] = $act;
        $_REQUEST = $_POST;
        $_GET = [];
        $_SERVER['REQUEST_METHOD'] = 'POST';
        $_SERVER['HTTP_REFERER'] = '';
        $GLOBALS['page'] = '';
        self::$mode = 'action';
        self::$act = $act;
        return self::DISPATCH;
    }
    static function dispatchAjax(string $name, bool $post): string
    {
        if (!in_array($name, self::AJAX, true)) self::fail('Unknown live request.', 400, 'bad_ajax');
        $p = self::$in;
        foreach (['csrf', 'token', 'r', 'ajax', 'ticket'] as $k) unset($p[$k]);
        $_GET = array_filter($p, 'is_scalar') + ['ajax' => $name];
        $_GET['ajax'] = $name;
        if ($post) {
            $tok = bin2hex(random_bytes(16));
            $_SESSION['csrf_token'] = $tok;
            $_POST = ['csrf' => $tok] + $p;
            $_SERVER['REQUEST_METHOD'] = 'POST';
        } else { $_POST = []; $_SERVER['REQUEST_METHOD'] = 'GET'; }
        $_REQUEST = $_GET + $_POST;
        self::$mode = 'ajax';
        return self::DISPATCH;
    }
    /** CSV exports and printable pages: the website's own output (not JSON). */
    static function raw(string $kind, string $what): string
    {
        $p = array_filter(self::$in, 'is_scalar');
        foreach (['token', 'r', 'ticket', 'csrf', 'page', 'ajax', 'radius', 'cron', 'webhook', 'pwa', 'export'] as $k) unset($p[$k]);
        $_GET = $p;
        if ($kind === 'export') $_GET['export'] = $what; else { $_GET['page'] = $what; $GLOBALS['page'] = $what; }
        $_POST = []; $_REQUEST = $_GET;
        $_SERVER['REQUEST_METHOD'] = 'GET';
        self::$mode = 'raw';
        return self::DISPATCH;
    }
    static function genericAction(): string
    {
        $act = self::str('act', '', 40);
        $p = self::$in;
        unset($p['act']);
        return self::dispatch($act, $p);
    }
    static function genericAjax(): string
    {
        return self::dispatchAjax(self::str('name', '', 40), self::$method === 'POST');
    }
    /** index.php redirected after the action: answer with the flash messages it left. */
    static function redirected(string $url): void
    {
        $fl = (array)($_SESSION['flash'] ?? []);
        unset($_SESSION['flash']);
        $types = []; $msgs = [];
        foreach ($fl as $f) if (is_array($f)) { $types[] = (string)($f[0] ?? 'info'); $msgs[] = (string)($f[1] ?? ''); }
        $rank = ['danger' => 4, 'error' => 4, 'warning' => 3, 'info' => 2, 'success' => 1];
        $type = 'success';
        foreach ($types as $tp) if (($rank[$tp] ?? 0) > ($rank[$type] ?? 0)) $type = $tp;
        $params = [];
        $qs = (string)parse_url($url, PHP_URL_QUERY);
        if ($qs !== '') parse_str($qs, $params);
        if (($frag = (string)parse_url($url, PHP_URL_FRAGMENT)) !== '') $params['section'] = $frag;
        if (self::$mode === 'api' || self::$mode === 'raw') {
            if (($params['page'] ?? '') === 'login') self::fail('Sign in again.', 401, 'invalid_token');
            if (in_array($params['page'] ?? '', ['locked', 'commission'], true) && !$msgs) self::fail(t('rs_banner'), 423, 'account_locked', ['home' => $params['page']]);
            self::fail($msgs ? self::plain(implode("\n", $msgs)) : 'Not allowed.', $type === 'danger' ? 422 : 403, 'refused', ['redirect' => $url]);
        }
        $ok = $type !== 'danger' && $type !== 'error';
        $html = implode('<br>', $msgs);
        $text = self::plain($html);
        if (!$msgs && ($params['page'] ?? '') === 'login') self::fail('Sign in again.', 401, 'invalid_token');
        if (!$msgs && in_array($params['page'] ?? '', ['locked', 'commission'], true) && self::$act !== '' && !in_array(self::$act, AdminLock::ACTS, true))
            self::fail(t('rs_banner'), 423, 'account_locked', ['home' => $params['page']]);
        if ($ok && self::$act === 'password' && self::$token) {   // a new password signs out the other devices
            run("UPDATE hs_api_tokens SET revoked_at=NOW() WHERE user_id=? AND id<>? AND revoked_at IS NULL", 'ii', self::uid(), (int)self::$token['id']);
        }
        self::json(['ok' => $ok, 'type' => $type, 'message' => $text !== '' ? $text : ($ok ? 'Done' : 'Error'), 'message_html' => $html,
            'action' => self::$act, 'redirect' => $url, 'params' => $params], $ok ? 200 : 422);
    }

    // =====================================================================
    // PUBLIC
    // =====================================================================
    static function routeList(): array
    {
        $o = [];
        foreach (self::routes() as $k => $r) $o[] = ['route' => $k, 'methods' => $r[0], 'who' => $r[1], 'works_when_locked' => (bool)$r[3]];
        return $o;
    }
    static function info(): array
    {
        $f = function (callable $c): bool { try { return (bool)$c(); } catch (Throwable $e) { return false; } };
        return ['name' => SITE_NAME, 'app_version' => APP_VERSION, 'api_version' => SKY_API, 'currency' => CURRENCY,
            'timezone' => 'Africa/Dar_es_Salaam', 'utc_offset' => '+03:00', 'server_time' => date('Y-m-d H:i:s'),
            'site_url' => appUrl(), 'portal_url' => portalUrl(), 'logo_url' => skyLogoUrl(),
            'registration_open' => getSetting('allow_registration', '1') === '1',
            'privacy_version' => $f(fn() => Privacy::ready()) ? Privacy::version() : '',
            'support_phone' => getSetting('sales_contact_phone', ''),
            'signed_in' => self::$user !== null,
            'features' => ['sms' => $f(fn() => Sms::ready() && Sms::enabled()), 'commission' => $f(fn() => VoucherCommission::ready() && VoucherCommission::enabled()),
                'chat' => $f(fn() => Chat::ready()), 'map' => $f(fn() => Geo::ready()), 'top_sellers' => getSetting('top_sellers_public', '1') === '1',
                'router_brands' => array_keys((array)RouterModels::BRANDS)]];
    }
    static function privacy(): array
    {
        if (!Privacy::ready()) return ['version' => '', 'text' => '', 'html' => ''];
        $html = Privacy::html();
        return ['version' => Privacy::version(), 'text' => self::plain($html), 'html' => $html,
            'accepted' => self::$user ? Privacy::accepted(self::$user) : null];
    }
    static function login(): array
    {
        if (!rateLimitCheck(clientIp(), 'api_login', 8, 600)) self::fail(t('rate_limited'), 429, 'rate_limited');
        $who = self::str('username', '', 120);
        $pw = (string)(is_scalar(self::$in['password'] ?? null) ? self::$in['password'] : '');
        if ($who === '' || $pw === '') self::fail(t('all_fields_required'), 422, 'missing_fields');
        $u = row("SELECT * FROM users WHERE (username=? OR email=? OR phone=?) LIMIT 1", 'sss', $who, $who, $who);
        if (!$u && ($np = normalizePhone($who)) !== '' && $np !== $who) $u = row("SELECT * FROM users WHERE phone=? LIMIT 1", 's', $np);
        if (!$u || !password_verify($pw, (string)$u['password'])) self::fail(t('invalid_credentials'), 401, 'invalid_credentials');
        if ($u['status'] !== 'active') self::fail('This account is not active.', 403, 'account_inactive');
        run("UPDATE users SET last_login=NOW() WHERE id=?", 'i', (int)$u['id']);
        if (password_needs_rehash((string)$u['password'], PASSWORD_DEFAULT)) run("UPDATE users SET password=? WHERE id=?", 'si', password_hash($pw, PASSWORD_DEFAULT), (int)$u['id']);
        logActivity((int)$u['id'], 'login', 'Mobile app sign-in (' . self::str('device_name', 'app', 60) . ')');
        $t = self::issue((int)$u['id']);
        self::signIn($u);
        return $t + ['user' => self::meData()];
    }
    static function register(): array
    {
        if (getSetting('allow_registration', '1') !== '1') self::fail(t('registration_closed'), 403, 'registration_closed');
        $d = ['username' => self::str('username', '', 60), 'email' => self::str('email', '', 120), 'phone' => normalizePhone(self::str('phone', '', 20)),
              'password' => (string)(is_scalar(self::$in['password'] ?? null) ? self::$in['password'] : ''), 'full_name' => self::str('full_name', '', 120)];
        if (in_array('', $d, true)) self::fail(t('all_fields_required'), 422, 'missing_fields');
        if (strlen($d['password']) < 6) self::fail(t('password_min'), 422, 'weak_password');
        if (!filter_var($d['email'], FILTER_VALIDATE_EMAIL)) self::fail('Invalid email', 422, 'invalid_email');
        if (empty(self::$in['privacy_accept'])) self::fail(t('privacy_must_accept'), 422, 'privacy_required');
        if (!rateLimitCheck(clientIp(), 'register', 5, 3600)) self::fail(t('rate_limited'), 429, 'rate_limited');
        $r = $GLOBALS['auth']->register($d);
        if (empty($r['success'])) self::fail((string)$r['message'], 409, 'exists');
        $uid = (int)($_SESSION['user_id'] ?? 0);
        Privacy::accept($uid);
        logActivity($uid, 'privacy_accept', 'Privacy Policy ' . Privacy::version() . ' (register, mobile app)');
        try { Mailer::queue($d['email'], sprintf(t('em_welcome_subject'), SITE_NAME), Mailer::layout(sprintf(t('em_welcome_subject'), SITE_NAME), sprintf(t('em_welcome_body'), h($d['full_name']), h($d['username'])), appUrl() . '/index.php?page=routers&add=1', t('add_router')), $uid); } catch (Throwable $e) {}
        $u = row("SELECT * FROM users WHERE id=?", 'i', $uid);
        self::signIn($u);
        return self::issue($uid) + ['user' => self::meData()];
    }
    static function forgot(): array
    {
        if (!rateLimitCheck(clientIp(), 'forgot', 5, 900)) self::fail(t('rate_limited'), 429, 'rate_limited');
        try { PasswordReset::request(self::str('who', self::str('username', '', 120), 120)); } catch (Throwable $e) { error_log('api forgot: ' . $e->getMessage()); }
        return ['sent' => true, 'message' => t('fp_sent')];
    }

    // =====================================================================
    // ACCOUNT
    // =====================================================================
    static function logout(): array
    {
        if (self::$token) run("UPDATE hs_api_tokens SET revoked_at=NOW() WHERE id=?", 'i', (int)self::$token['id']);
        logActivity(self::uid(), 'logout', 'Mobile app sign-out');
        return ['signed_out' => true];
    }
    static function logoutAll(): array
    {
        $n = run("UPDATE hs_api_tokens SET revoked_at=NOW() WHERE user_id=? AND revoked_at IS NULL", 'i', self::uid());
        return ['signed_out' => $n];
    }
    static function tokenList(): array
    {
        $cur = (int)(self::$token['id'] ?? 0);
        return array_map(fn($r) => $r + ['current' => (int)$r['id'] === $cur],
            rows("SELECT id, name, platform, ip, created_at, last_used_at, expires_at FROM hs_api_tokens WHERE user_id=? AND revoked_at IS NULL AND expires_at > NOW() ORDER BY id DESC", 'i', self::uid()));
    }
    static function tokenRevoke(): array
    {
        return ['revoked' => run("UPDATE hs_api_tokens SET revoked_at=NOW() WHERE id=? AND user_id=? AND revoked_at IS NULL", 'ii', self::int('id'), self::uid())];
    }
    static function meData(): array
    {
        $u = row("SELECT * FROM users WHERE id=?", 'i', self::uid()) ?: self::$user;
        $uid = (int)$u['id'];
        $isSeller = in_array($u['user_type'], ['seller', 'admin'], true);
        $restricted = $u['user_type'] === 'seller' && AdminLock::restricted($uid);
        $adminLock = $u['user_type'] === 'seller' ? AdminLock::info($uid) : null;
        $cmLocked = $u['user_type'] === 'seller' && VoucherCommission::ready() && VoucherCommission::isLocked($uid);
        $smsOk = false; try { $smsOk = Sms::ready(); } catch (Throwable $e) {}
        return [
            'id' => $uid, 'username' => $u['username'], 'full_name' => $u['full_name'], 'email' => $u['email'], 'phone' => $u['phone'],
            'user_type' => $u['user_type'], 'is_admin' => $u['user_type'] === 'admin', 'status' => $u['status'],
            'balance' => (float)$u['balance'], 'referral_code' => $u['referral_code'], 'created_at' => $u['created_at'], 'last_login' => $u['last_login'],
            'sms_enabled' => (int)($u['sms_enabled'] ?? 0) === 1, 'email_enabled' => (int)($u['email_enabled'] ?? 0) === 1,
            'sms_balance' => $smsOk && $isSeller ? Sms::balance($uid) : 0, 'sms_free' => $smsOk && $isSeller ? Sms::isFree($uid) : false,
            'commission_percent' => $isSeller && VoucherCommission::ready() ? VoucherCommission::percent($uid) : null,
            'privacy_accepted' => Privacy::ready() ? Privacy::accepted($u) : true,
            'restricted' => $restricted, 'home' => $restricted ? (AdminLock::isLocked($uid) ? 'locked' : 'commission') : 'dashboard',
            'admin_locked' => $adminLock !== null, 'admin_lock_reason' => $adminLock['admin_lock_reason'] ?? null, 'admin_lock_hotspot' => $adminLock ? (int)$adminLock['admin_lock_hotspot'] === 1 : false,
            'commission_locked' => $cmLocked,
            'unread_notifications' => Notify::unread($uid), 'unread_messages' => Chat::ready() && $isSeller ? Chat::unread($uid, $u['user_type'] === 'admin') : 0,
            'portal_url' => portalUrl(), 'currency' => CURRENCY,
        ];
    }
    static function me(): array { return self::meData(); }
    static function lockedInfo(): array
    {
        $uid = self::uid();
        $i = AdminLock::info($uid);
        $o = AdminLock::owed($uid);
        $pend = VoucherCommission::ready() ? row("SELECT ref, amount, phone, status, created_at FROM hs_commission_payments WHERE seller_id=? AND status='pending' AND created_at > DATE_SUB(NOW(), INTERVAL 30 MINUTE) ORDER BY id DESC LIMIT 1", 'i', $uid) : null;
        return ['admin_locked' => $i !== null, 'locked_at' => $i['admin_locked_at'] ?? null, 'reason' => $i['admin_lock_reason'] ?? null,
            'hotspot_stopped' => $i ? (int)$i['admin_lock_hotspot'] === 1 : false, 'unlocks_when_paid' => AdminLock::autoPay($uid),
            'commission_locked' => VoucherCommission::ready() && VoucherCommission::isLocked($uid), 'restricted' => AdminLock::restricted($uid),
            'owed_total' => $o['total'], 'owed_open' => $o['open'], 'owed_open_vouchers' => $o['open_n'], 'invoices' => $o['invoices'], 'pending_payment' => $pend,
            'support_phone' => getSetting('sales_contact_phone', '')];
    }
    static function profilePrep(array $p): array
    {
        $u = row("SELECT full_name, email, phone FROM users WHERE id=?", 'i', self::uid()) ?: [];
        foreach (['full_name', 'email', 'phone'] as $k) if (!isset($p[$k]) || trim((string)$p[$k]) === '') $p[$k] = (string)($u[$k] ?? '');
        return ['full_name' => (string)$p['full_name'], 'email' => (string)$p['email'], 'phone' => (string)$p['phone']];
    }
    static function prefsPrep(array $p): array
    {
        $u = row("SELECT sms_enabled, email_enabled FROM users WHERE id=?", 'i', self::uid()) ?: [];
        $o = [];
        foreach (['sms_enabled', 'email_enabled'] as $k) {
            $v = array_key_exists($k, $p) ? filter_var($p[$k], FILTER_VALIDATE_BOOLEAN) : (int)($u[$k] ?? 0) === 1;
            if ($v) $o[$k] = 1;
        }
        return $o;
    }
    static function settings(): array
    {
        $uid = self::uid();
        $u = row("SELECT sms_enabled, email_enabled FROM users WHERE id=?", 'i', $uid) ?: [];
        return ['sms_enabled' => (int)($u['sms_enabled'] ?? 0) === 1, 'email_enabled' => (int)($u['email_enabled'] ?? 0) === 1,
            'portal_announce' => getSetting('portal_msg_' . $uid, ''), 'portal_url' => portalUrl(), 'monthly_goal' => (float)Insights::goal($uid)];
    }
    static function notifications(): array
    {
        [$p, $per, $off] = self::pg(30);
        $uid = self::uid();
        $w = 'user_id=?' . (self::in('unread') ? ' AND is_read=0' : '');
        $n = (int)val("SELECT COUNT(*) FROM notifications WHERE $w", 'i', $uid);
        $list = rows("SELECT id, title, message, type, is_read, read_at, link, icon, created_at FROM notifications WHERE $w ORDER BY id DESC LIMIT ? OFFSET ?", 'iii', $uid, $per, $off);
        return self::list($list, $n, $p, $per, ['unread' => Notify::unread($uid)]);
    }

    // =====================================================================
    // SELLER — HOME
    // =====================================================================
    static function bgSync(bool $payments = false): void
    {
        $uid = self::uid();
        try {
            if (($_SESSION['user_type'] ?? '') === 'seller') ensureDefaultController($uid);
            skyAfterResponse(fn() => OmadaSync::maybe($uid));
            skyAfterResponse(fn() => RuijieCloud::maybeSync(8));
            if ($payments) skyAfterResponse(function (): void { Payments::pollPending(5); PaymentOps::nudgeLate(3); });
        } catch (Throwable $e) { error_log('api sync: ' . $e->getMessage()); }
    }
    static function dashboard(): array
    {
        $uid = self::uid();
        self::bgSync(true);
        $st = SessionOps::stats($uid);
        $ern = Earnings::summary($uid);
        $routers = array_map(fn($d) => self::dev($d, false), Device::forSeller($uid));
        $pending = rows("SELECT o.id, o.order_ref, o.phone, o.amount, o.status, o.created_at, p.name AS package_name FROM hs_orders o LEFT JOIN hs_packages p ON p.id=o.package_id WHERE o.seller_id=? AND o.status='pending' ORDER BY o.id DESC LIMIT 10", 'i', $uid);
        $recent = rows("SELECT o.id, o.order_ref, o.phone, o.amount, o.paid_at, p.name AS package_name, v.code FROM hs_orders o LEFT JOIN hs_packages p ON p.id=o.package_id LEFT JOIN hs_vouchers v ON v.id=o.voucher_id WHERE o.seller_id=? AND o.status='paid' ORDER BY o.paid_at DESC LIMIT 8", 'i', $uid);
        $out = ['stats' => $st, 'earnings' => $ern, 'routers' => $routers, 'pending_orders' => $pending, 'recent_sales' => $recent,
            'packages' => (int)val("SELECT COUNT(*) FROM hs_packages WHERE seller_id=?", 'i', $uid),
            'unread_notifications' => Notify::unread($uid), 'unread_messages' => Chat::ready() ? Chat::unread($uid, self::isAdm()) : 0,
            'radius_server_online' => (int)getSetting('radius_server_seen', '0') > time() - 180];
        if (self::isAdm()) $out['platform'] = Earnings::platform();
        // the same blocks as the website's Home page: 14-day chart, quick start, monthly goal, periods, top sellers
        $days = [];
        for ($ci = 13; $ci >= 0; $ci--) $days[date('Y-m-d', strtotime("-$ci day"))] = ['day' => date('Y-m-d', strtotime("-$ci day")), 'mm' => 0.0, 'vc' => 0.0];
        foreach (rows("SELECT DATE(completed_at) d, SUM(CASE WHEN payment_method='voucher' THEN amount ELSE 0 END) vc, SUM(CASE WHEN payment_method<>'voucher' THEN amount ELSE 0 END) mm
                       FROM transactions WHERE seller_id=? AND type='purchase' AND status='completed' AND completed_at >= ? GROUP BY DATE(completed_at)", 'is', $uid, date('Y-m-d', strtotime('-13 day')) . ' 00:00:00') as $cr)
            if (isset($days[$cr['d']])) $days[$cr['d']] = ['day' => $cr['d'], 'mm' => (float)$cr['mm'], 'vc' => (float)$cr['vc']];
        $out['chart'] = array_values($days);
        $devs = Device::forSeller($uid);
        $qsProv = (bool)array_filter($devs, fn($x) => in_array((string)($x['prov_state'] ?? ''), ['done', 'ready'], true) || Device::omadaConnected($x));
        $qsLive = (bool)array_filter($devs, fn($x) => !empty($x['last_seen']) && time() - strtotime($x['last_seen']) < 86400);
        $out['quick_start'] = [
            ['key' => 'router', 'label' => t('qs_router'), 'done' => (bool)$devs],
            ['key' => 'provision', 'label' => t('qs_provision'), 'done' => $qsProv],
            ['key' => 'package', 'label' => t('qs_package'), 'done' => $out['packages'] > 0],
            ['key' => 'vouchers', 'label' => t('qs_vouchers'), 'done' => (int)val("SELECT COUNT(*) FROM hs_vouchers WHERE seller_id=?", 'i', $uid) > 0],
            ['key' => 'live', 'label' => t('qs_live'), 'done' => $qsLive]];
        try { $out['goal'] = Insights::monthProgress($uid); } catch (Throwable $e) {}
        try { $out['periods'] = Earnings::periods($uid); } catch (Throwable $e) {}
        try {
            if (self::isAdm() || getSetting('top_sellers_public', '1') === '1') {
                $ts = TopSellers::rank('month', 5);
                $show = self::isAdm() || getSetting('top_sellers_amounts', '1') === '1';
                $out['top_sellers'] = array_map(fn($x) => ['rank' => (int)$x['rank'], 'name' => TopSellers::name($x), 'me' => (int)$x['id'] === $uid, 'sales' => (int)$x['sales'],
                    'routers' => (int)$x['routers'], 'total' => $show || (int)$x['id'] === $uid ? (float)$x['total'] : null], $ts['list']);
            }
        } catch (Throwable $e) {}
        return $out;
    }
    static function earnings(): array
    {
        $sid = self::isAdm() ? self::int('seller', self::uid()) : self::uid();
        return ['summary' => Earnings::summary($sid), 'periods' => Earnings::periods($sid)];
    }
    static function insights(): array
    {
        $uid = self::uid();
        $sel = self::isAdm() ? max(0, self::int('seller', $uid)) : $uid;
        $gp = Insights::monthProgress($sel);
        $prd = Earnings::periods($sel);
        $heat = Insights::heatmap($sel, 30);
        $pk = Insights::topPackages($sel, date('Y-m-01 00:00:00'));
        $rt = Insights::routers($sel);
        $cu = Insights::customers($sel);
        $rank = $sel ? Insights::myRank($sel) : null;
        return ['seller' => $sel, 'goal' => $gp, 'periods' => $prd, 'heatmap' => $heat, 'top_packages' => $pk, 'routers' => $rt, 'customers' => $cu, 'rank' => $rank,
            'tips' => Insights::tips($sel, $gp, $heat, $pk, $rt, $cu, $rank, $prd['change']), 'can_set_goal' => $sel === $uid];
    }
    static function topSellers(): array
    {
        $me = self::uid();
        if (!self::isAdm() && getSetting('top_sellers_public', '1') !== '1') self::fail(t('ts_disabled'), 403, 'disabled');
        $per = self::str('period', '30d', 10);
        if (!isset(TopSellers::periods()[$per])) $per = '30d';
        $r = TopSellers::rank($per, 50);
        $show = self::isAdm() || getSetting('top_sellers_amounts', '1') === '1';
        $list = array_map(fn($x) => ['rank' => (int)$x['rank'], 'id' => (int)$x['id'], 'name' => TopSellers::name($x), 'me' => (int)$x['id'] === $me,
            'sales' => (int)$x['sales'], 'total' => $show || (int)$x['id'] === $me ? (float)$x['total'] : null, 'routers' => (int)$x['routers'],
            'online' => (int)$x['online'], 'customers' => (int)$x['customers']], $r['list']);
        return ['period' => $per, 'periods' => TopSellers::periods(), 'sellers' => $r['sellers'], 'amounts_visible' => $show,
            'my_position' => self::isAdm() ? null : TopSellers::position($me, $r['all']), 'list' => $list];
    }

    // =====================================================================
    // SELLER — ROUTERS
    // =====================================================================
    static function dev(array $d, bool $full): array
    {
        $m = RouterModels::forDevice($d);
        $o = ['id' => (int)$d['id'], 'user_id' => (int)$d['user_id'], 'device_name' => $d['device_name'], 'brand' => RouterModels::brandOf($m),
            'model' => RouterModels::label($m), 'model_code' => $m['code'] ?? null, 'ap_mac' => $d['ap_mac'], 'ssid' => $d['ssid'],
            'extra_ssids' => json_decode((string)($d['extra_ssids'] ?? ''), true) ?: [], 'site_name' => $d['site_name'], 'location' => $d['location'],
            'is_active' => (int)$d['is_active'] === 1, 'online' => Device::isOnline($d), 'last_seen' => $d['last_seen'], 'radius_last_auth' => $d['radius_last_auth'] ?? null,
            'omada_status' => $d['omada_status'] ?? null, 'omada_status_at' => $d['omada_status_at'] ?? null, 'omada_clients' => $d['omada_clients'] ?? null,
            'omada_ip' => $d['omada_ip'] ?? null, 'omada_fw' => $d['omada_fw'] ?? null, 'omada_uptime' => $d['omada_uptime'] ?? null, 'omada_sn' => $d['omada_sn'] ?? null,
            'voucher_mode' => $d['voucher_mode'] ?? null, 'prov_state' => $d['prov_state'] ?? null, 'prov_at' => $d['prov_at'] ?? null,
            'active_sessions' => (int)($d['active_sessions'] ?? val("SELECT COUNT(*) FROM hs_sessions WHERE device_id=? AND status='active'", 'i', (int)$d['id'])),
            'latitude' => $d['latitude'] ?? null, 'longitude' => $d['longitude'] ?? null, 'map_public' => (int)($d['map_public'] ?? 0) === 1,
            'lipa_info' => $d['lipa_info'] ?? null, 'created_at' => $d['created_at']];
        if (!$full) return $o;
        $own = (int)$d['user_id'] === self::uid() || self::isAdm();
        $o['nas_key'] = $d['nas_id'];
        $o['portal_url'] = portalUrl();
        $o['health'] = json_decode((string)($d['health_json'] ?? ''), true);
        $o['health_at'] = $d['health_at'] ?? null;
        $o['portal_seen_at'] = $d['portal_seen_at'] ?? null;
        if ($own) {
            $rc = Device::radiusConfig($d);
            $rc['accounting_secret'] = $rc['acct_secret'];   // (the name acct_secret is never sent by clean())
            unset($rc['acct_secret']);
            $o['radius'] = $rc;
            if (RouterModels::isRuijie($d)) $o['setup_sheet'] = RuijieRouter::sheet($d);
            elseif (RouterModels::isCudy($d)) $o['setup_sheet'] = CudyRouter::sheet($d);
        }
        $o['history'] = ProvisionLog::forDevice((int)$d['id'], 20);
        $o['outages'] = Outage::ready() ? Outage::forDevice((int)$d['id'], 10) : [];
        $o['radius_log'] = rows("SELECT kind, username, mac, result, message, created_at FROM hs_radius_log WHERE nas_id=? ORDER BY id DESC LIMIT 15", 's', (string)$d['nas_id']);
        $o['radius_server_online'] = (int)getSetting('radius_server_seen', '0') > time() - 180;
        if (!RouterModels::isRuijie($d) && !RouterModels::isCudy($d)) $o['omada'] = self::omadaInfo($d, false);   // v1.1 — Omada sync
        return $o;
    }
    /** v1.1 — Omada RADIUS server / profile / portal of one router (+ RADIUS profiles in its Omada site when $live). */
    static function omadaInfo(array $d, bool $live): array
    {
        $o = ['radius_server' => RadiusServers::keyOf($d), 'radius_profile_name' => (string)($d['omada_radius_name'] ?? ''), 'portal_name' => (string)($d['omada_portal_name'] ?? ''),
            'radius_profile_effective' => OmadaProvision::radiusName($d), 'portal_effective' => OmadaProvision::portalName($d),
            'radius_profile_default' => OmadaProvision::radiusName(['omada_radius_name' => ''] + $d), 'portal_default' => OmadaProvision::portalName(['omada_portal_name' => ''] + $d),
            'radius_profile_id' => (string)($d['omada_radius_id'] ?? ''), 'portal_id' => (string)($d['omada_portal_id'] ?? ''),
            'external_url' => omadaExternalUrl(), 'ssid_radius_only' => omadaSsidRadiusOnly(), 'synced_at' => $d['omada_synced_at'] ?? null,
            'site_ready' => (string)($d['omada_site_id'] ?? '') !== '', 'voucher_mode' => (string)($d['voucher_mode'] ?? 'radius'),
            'servers' => array_values(array_map(fn($x) => ['key' => $x['key'], 'name' => $x['name'], 'ip' => $x['ip'], 'acct_ip' => $x['acct_ip']], RadiusServers::all()))];
        if ($live) $o['omada_profiles'] = OmadaProvision::siteRadiusProfiles($d, (int)$d['user_id']);
        return $o;
    }
    static function routerOmada(): array
    {
        $d = self::myDevice(self::int('id'));
        if (RouterModels::isRuijie($d) || RouterModels::isCudy($d)) self::fail(t('osync_omada_only'), 400, 'not_omada');
        return self::omadaInfo($d, true);
    }
    static function omadaSyncPrep(array $p): array
    {
        $d = self::myDevice((int)($p['id'] ?? 0));
        if ((int)$d['user_id'] !== self::uid()) self::fail('Only the owner of the router can sync it.', 403, 'forbidden');
        if (array_key_exists('save_only', $p)) { if (filter_var($p['save_only'], FILTER_VALIDATE_BOOLEAN)) $p['save_only'] = '1'; else unset($p['save_only']); }
        return $p;
    }
    static function speedPrep(array $p): array
    {
        $p['mode'] = (($p['mode'] ?? '') === 'reset' || filter_var($p['reset'] ?? false, FILTER_VALIDATE_BOOLEAN)) ? 'reset' : 'set';
        return $p;
    }
    static function adminAfterSale(): array
    {
        return ['enabled' => getSetting('sms_platform_after_sale', '0') === '1', 'always' => getSetting('sms_platform_always', '0') === '1',
            'template' => Sms::platformTemplate(), 'sms_ready' => Sms::ready() && NextSms::configured(),
            'sent_this_month' => Sms::ready() ? (int)val("SELECT COUNT(*) FROM hs_sms_messages WHERE kind='auto_platform' AND created_at >= ?", 's', date('Y-m-01 00:00:00')) : 0];
    }
    static function afterSalePrep(array $p): array
    {
        foreach (['on', 'always'] as $k) if (array_key_exists($k, $p)) { if (filter_var($p[$k], FILTER_VALIDATE_BOOLEAN)) $p[$k] = 1; else unset($p[$k]); }
        if (array_key_exists('enabled', $p) && !array_key_exists('on', $p) && filter_var($p['enabled'], FILTER_VALIDATE_BOOLEAN)) $p['on'] = 1;
        if (array_key_exists('template', $p) && !array_key_exists('tpl', $p)) $p['tpl'] = $p['template'];
        return $p;
    }
    static function adminRadiusServers(): array
    {
        return ['servers' => array_values(RadiusServers::all()), 'external_url' => omadaExternalUrl(), 'ssid_radius_only' => omadaSsidRadiusOnly()];
    }
    static function myDevice(int $id): array
    {
        $d = Device::get($id, self::uid());
        if (!$d && self::isAdm()) $d = Device::get($id);
        if (!$d) self::fail('Router not found.', 404, 'not_found');
        if (!$d['nas_id'] || !$d['radius_secret'] || !$d['acct_secret']) { Device::ensureCredentials((int)$d['id']); $d = Device::get((int)$d['id']) ?: $d; }
        return $d;
    }
    static function routers(): array
    {
        self::bgSync();
        $q = self::str('q', '', 60);
        $list = Device::forSeller(self::uid());
        if ($q !== '') $list = array_values(array_filter($list, fn($d) => matchAny($q, [$d['device_name'], $d['ap_mac'], dashMac((string)$d['ap_mac']), $d['ssid'], $d['site_name'], $d['location'], $d['omada_sn'], $d['model']])));
        return array_map(fn($d) => self::dev($d, false), $list);
    }
    static function routerGet(): array
    {
        self::bgSync();
        return self::dev(self::myDevice(self::int('id')), true);
    }
    static function routerModels(): array
    {
        $o = [];
        foreach (RouterModels::all() as $m) if ((int)$m['is_active'] === 1)
            $o[] = ['code' => $m['code'], 'brand' => RouterModels::brandOf($m), 'model' => $m['model'], 'label' => RouterModels::label($m), 'kind' => $m['kind'] ?? null,
                'description' => $m['description'] ?? null, 'icon' => $m['icon'] ?? null];
        $b = [];
        foreach ((array)RouterModels::BRANDS as $k => $v) $b[$k] = is_array($v) ? ['name' => $v['name'] ?? $k, 'icon' => $v['icon'] ?? '', 'desc' => t((string)($v['desc'] ?? ''))] : $v;
        return ['brands' => $b, 'models' => $o,   // v1.1 — RADIUS servers a router can use + the Omada External Web Portal URL
            'radius_servers' => array_values(array_map(fn($x) => ['key' => $x['key'], 'name' => $x['name'], 'ip' => $x['ip']], RadiusServers::all())),
            'omada_external_url' => omadaExternalUrl(), 'omada_ssid_radius_only' => omadaSsidRadiusOnly()];
    }
    /** Router form: keep the current values the app did not send (the website form always sends every field). */
    static function routerPrep(array $p): array
    {
        $id = (int)($p['id'] ?? 0);
        if ($id > 0) {
            $d = Device::get($id, self::uid()) ?: (self::isAdm() ? Device::get($id) : null);
            if (!$d) self::fail('Router not found.', 404, 'not_found');
            foreach (['device_name', 'ap_mac', 'ssid', 'site_name', 'location', 'lipa_info', 'controller_url', 'dae_target', 'omada_nas_id', 'omada_sn', 'voucher_mode'] as $k)
                if (!array_key_exists($k, $p)) $p[$k] = (string)($d[$k] ?? '');
            if (!array_key_exists('is_active', $p)) $p['is_active'] = (int)$d['is_active'];
            if (!array_key_exists('router_model', $p)) $p['router_model'] = (string)(RouterModels::forDevice($d)['code'] ?? '');
        } else {
            if (!array_key_exists('is_active', $p)) $p['is_active'] = 1;
            unset($p['id']);
        }
        foreach (['is_active', 'map_public', 'omada_auto'] as $k) if (array_key_exists($k, $p)) { if (filter_var($p[$k], FILTER_VALIDATE_BOOLEAN)) $p[$k] = 1; else unset($p[$k]); }
        if (isset($p['latitude']) && !isset($p['geo_lat'])) $p['geo_lat'] = $p['latitude'];
        if (isset($p['longitude']) && !isset($p['geo_lng'])) $p['geo_lng'] = $p['longitude'];
        return $p;
    }
    static function wifiNames(): array
    {
        $o = [];
        foreach (Device::forSeller(self::uid()) as $d) {
            $o[] = ['router_id' => (int)$d['id'], 'device_name' => $d['device_name'], 'online' => Device::isOnline($d), 'brand' => RouterModels::brandOf(RouterModels::forDevice($d)),
                'main_ssid' => $d['ssid'], 'extra_ssids' => json_decode((string)($d['extra_ssids'] ?? ''), true) ?: []];
        }
        return $o;
    }
    static function map(): array
    {
        return ['points' => Geo::ready() ? Geo::points(self::uid(), self::isAdm(), self::isAdm() ? self::int('seller') : 0) : [], 'ready' => Geo::ready(),
            'public_map_url' => appUrl() . '/index.php?page=wifi_map'];
    }

    // =====================================================================
    // SELLER — PACKAGES & VOUCHERS
    // =====================================================================
    static function packages(): array
    {
        return rows("SELECT p.*, d.device_name, (SELECT COUNT(*) FROM hs_vouchers v WHERE v.package_id=p.id AND v.status IN ('available','sold')) AS unused_vouchers
                     FROM hs_packages p LEFT JOIN hs_devices d ON d.id=p.device_id WHERE p.seller_id=? ORDER BY p.sort_order, p.price", 'i', self::uid());
    }
    static function packagePrep(array $p): array
    {
        $id = (int)($p['id'] ?? 0);
        $cur = $id ? row("SELECT * FROM hs_packages WHERE id=? AND seller_id=?", 'ii', $id, self::uid()) : null;
        if ($id && !$cur) self::fail('Package not found.', 404, 'not_found');
        $def = $cur ?: ['name' => '', 'description' => '', 'price' => 0, 'duration_minutes' => 60, 'time_mode' => 'continuous', 'data_limit_mb' => 0, 'speed_down_mbps' => 0,
            'speed_up_mbps' => 0, 'max_devices' => 1, 'validity_days' => 30, 'show_on_portal' => 1, 'is_active' => 1, 'sort_order' => 0, 'device_id' => 0,
            'fup_mb' => 0, 'fup_down_mbps' => 0, 'fup_up_mbps' => 0];   // v1.1: + fair usage
        foreach ($def as $k => $v) if (!array_key_exists($k, $p)) $p[$k] = $v;
        foreach (['show_on_portal', 'is_active'] as $k) { if (filter_var($p[$k], FILTER_VALIDATE_BOOLEAN)) $p[$k] = 1; else unset($p[$k]); }
        if (!$id) unset($p['id']);
        return $p;
    }
    static function vouchers(): array
    {
        $uid = self::uid();
        [$p, $per, $off] = self::pg(25);
        $st = self::str('status', '', 20);
        $st = in_array($st, ['available', 'sold', 'active', 'expired', 'exhausted', 'blocked', 'cancelled'], true) ? $st : '';
        $batch = (string)preg_replace('/[^A-Z0-9]/', '', strtoupper(self::str('batch', '', 40)));
        $qq = strtoupper((string)preg_replace('/[^A-Za-z0-9]/', '', self::str('q', '', 40)));
        $w = 'v.seller_id=?'; $ty = 'i'; $a = [$uid];
        if ($st !== '') { $w .= ' AND v.status=?'; $ty .= 's'; $a[] = $st; }
        if ($batch !== '') { $w .= ' AND v.batch=?'; $ty .= 's'; $a[] = $batch; }
        if ($qq !== '') { $w .= ' AND v.code LIKE ?'; $ty .= 's'; $a[] = '%' . $qq . '%'; }
        if (($pk = self::int('package_id')) > 0) { $w .= ' AND v.package_id=?'; $ty .= 'i'; $a[] = $pk; }
        $n = (int)val("SELECT COUNT(*) FROM hs_vouchers v WHERE $w", $ty, ...$a);
        $list = rows("SELECT v.*, p.name AS package_name, (SELECT COUNT(*) FROM hs_voucher_macs m WHERE m.voucher_id=v.id) AS macs FROM hs_vouchers v LEFT JOIN hs_packages p ON p.id=v.package_id
                      WHERE $w ORDER BY v.id DESC LIMIT ? OFFSET ?", $ty . 'ii', ...array_merge($a, [$per, $off]));
        foreach ($list as &$v) $v['remaining_seconds'] = in_array($v['status'], ['active'], true) ? Vouchers::remainingSeconds($v) : null;
        unset($v);
        $counts = [];
        foreach (rows("SELECT status, COUNT(*) n FROM hs_vouchers WHERE seller_id=? GROUP BY status", 'i', $uid) as $r) $counts[$r['status']] = (int)$r['n'];
        try { OmadaManager::maybeSync($uid); } catch (Throwable $e) {}
        return self::list($list, $n, $p, $per, ['counts' => $counts]);
    }
    static function voucherGet(): array
    {
        $uid = self::uid();
        $code = strtoupper((string)preg_replace('/[^A-Za-z0-9]/', '', self::str('code', '', 40)));
        $v = $code !== '' ? row("SELECT v.*, p.name AS package_name FROM hs_vouchers v LEFT JOIN hs_packages p ON p.id=v.package_id WHERE v.code=? AND v.seller_id=?", 'si', $code, $uid)
                          : row("SELECT v.*, p.name AS package_name FROM hs_vouchers v LEFT JOIN hs_packages p ON p.id=v.package_id WHERE v.id=? AND v.seller_id=?", 'ii', self::int('id'), $uid);
        if (!$v) self::fail('Voucher not found.', 404, 'not_found');
        $v['remaining_seconds'] = Vouchers::remainingSeconds($v);
        $v['qr_url'] = voucherQrUrl((string)$v['code']);
        $v['devices'] = rows("SELECT mac, first_seen, last_seen FROM hs_voucher_macs WHERE voucher_id=? ORDER BY last_seen DESC", 'i', (int)$v['id']);
        $v['sessions'] = rows("SELECT s.id, s.mac, s.ip, s.status, s.started_at, s.stopped_at, s.session_time, s.bytes_in, s.bytes_out, d.device_name FROM hs_sessions s
                               LEFT JOIN hs_devices d ON d.id=s.device_id WHERE s.voucher_id=? ORDER BY s.id DESC LIMIT 20", 'i', (int)$v['id']);
        $v['adjustments'] = rows("SELECT minutes, old_value, new_value, reason, created_at FROM hs_adjustments WHERE voucher_id=? ORDER BY id DESC LIMIT 20", 'i', (int)$v['id']);
        return $v;
    }
    static function batches(): array
    {
        return rows("SELECT v.batch, COUNT(*) n, MIN(v.created_at) created_at, SUM(v.status IN ('available','sold')) unused, MAX(p.name) package_name, MAX(v.price) price
                     FROM hs_vouchers v LEFT JOIN hs_packages p ON p.id=v.package_id WHERE v.seller_id=? AND v.batch IS NOT NULL GROUP BY v.batch ORDER BY MIN(v.created_at) DESC LIMIT 60", 'i', self::uid());
    }
    /** Everything the app needs to draw and print the Kiswahili voucher cards itself (same data as ?page=print). */
    static function printData(): array
    {
        $uid = self::uid();
        $batch = (string)preg_replace('/[^A-Za-z0-9]/', '', self::str('batch', '', 40));
        $ids = array_values(array_filter(array_map('intval', (array)(self::$in['ids'] ?? []))));
        if ($batch === '' && !$ids) self::fail('Choose a batch.', 422, 'missing_batch');
        $sql = "SELECT v.id, v.code, v.price, v.duration_minutes, v.data_limit_mb, v.max_devices, v.valid_until, v.ssid_lock, v.status, p.name AS package_name, d.ssid
                FROM hs_vouchers v LEFT JOIN hs_packages p ON p.id=v.package_id LEFT JOIN hs_devices d ON d.id=v.device_id WHERE v.seller_id=?";
        $list = $ids ? rows($sql . " AND v.id IN (" . implode(',', $ids) . ") ORDER BY v.id", 'i', $uid)
                     : rows($sql . " AND v.batch=? AND v.status IN ('available','sold') ORDER BY v.id", 'is', $uid, $batch);
        $defaultSsid = (string)val("SELECT ssid FROM hs_devices WHERE user_id=? ORDER BY id LIMIT 1", 'i', $uid);
        $seller = row("SELECT full_name, phone FROM users WHERE id=?", 'i', $uid) ?: [];
        $out = [];
        foreach ($list as $v) {
            $ssid = trim((string)($v['ssid_lock'] ?? '')) !== '' ? (string)$v['ssid_lock'] : ((string)($v['ssid'] ?: $defaultSsid) ?: SITE_NAME);
            $out[] = ['id' => (int)$v['id'], 'code' => $v['code'], 'ssid' => $ssid, 'price' => (float)$v['price'], 'package' => (string)($v['package_name'] ?: swDur((int)$v['duration_minutes'])),
                'duration' => swDur((int)$v['duration_minutes']), 'data' => (int)$v['data_limit_mb'] > 0 ? fmtBytes($v['data_limit_mb'] * 1048576) : 'Bila kikomo',
                'max_devices' => (int)$v['max_devices'], 'valid_until' => $v['valid_until'] ? date('d/m/Y', strtotime((string)$v['valid_until'])) : '',
                'qr_wifi' => wifiQrText($ssid), 'qr_login' => voucherQrUrl((string)$v['code'])];
        }
        $mode = (string)getSetting('voucher_qr_mode', 'both');
        return ['batch' => $batch, 'site_name' => SITE_NAME, 'logo_url' => skyLogoUrl(), 'seller_phone' => (string)($seller['phone'] ?? ''),
            'qr_mode' => in_array($mode, ['both', 'wifi', 'auto'], true) ? $mode : 'both', 'vouchers' => $out];
    }
    static function printLink(): array
    {
        $batch = (string)preg_replace('/[^A-Z0-9]/', '', strtoupper(self::str('batch', '', 40)));
        $base = appUrl() . '/' . basename((string)($_SERVER['SCRIPT_NAME'] ?? 'api.php'));
        return ['print_url' => $base . '?r=view/print&batch=' . rawurlencode($batch) . '&ticket=' . self::ticket(self::uid(), 'print'),
            'posters_url' => $base . '?r=view/posters&ticket=' . self::ticket(self::uid(), 'posters'),
            'csv_url_needs_token' => $base . '?r=export/vouchers&batch=' . rawurlencode($batch), 'valid_minutes' => 15];
    }

    // =====================================================================
    // SELLER — CLIENTS
    // =====================================================================
    static function sessions(): array
    {
        $uid = self::uid();
        $list = SessionOps::active($uid, self::int('device'));
        $q = self::str('q', '', 60);
        if ($q !== '') $list = array_values(array_filter($list, fn($s) => matchAny($q, [$s['code'], $s['username'], $s['mac'], dashMac((string)$s['mac']), $s['ip'], $s['package_name'], $s['device_name'], SessionOps::phoneOf($s)])));
        [$p, $per, $off] = self::pg(50);
        $page = array_slice($list, $off, $per);
        foreach ($page as &$s) {
            $s['remaining_seconds'] = !empty($s['code']) ? Vouchers::remainingSeconds($s) : null; $s['phone'] = SessionOps::phoneOf($s);
            if (!empty($s['voucher_id'])) { [$sd, $su, $sw] = SpeedCtl::forVoucher($s); $s['speed'] = ['down' => $sd, 'up' => $su, 'source' => $sw, 'label' => SpeedCtl::label($s)]; }   // v1.1
        }
        unset($s);
        return self::list(array_values($page), count($list), $p, $per);
    }
    static function blocked(): array
    {
        return rows("SELECT id, seller_id, mac, reason, created_at, seller_id=0 AS platform_wide FROM hs_blocked_macs WHERE seller_id=? OR seller_id=0 ORDER BY seller_id=0, id DESC", 'i', self::uid());
    }
    static function customers(): array
    {
        $uid = self::uid();
        [$p, $per, $off] = self::pg(25);
        $sel = self::isAdm() ? self::int('seller') : $uid;
        $cq = self::str('q', '', 30);
        $w = "o.status='paid' AND o.phone IS NOT NULL AND o.phone<>''"; $ty = ''; $a = [];
        if ($sel) { $w .= ' AND o.seller_id=?'; $ty .= 'i'; $a[] = $sel; }
        if ($cq !== '') { $w .= ' AND o.phone LIKE ?'; $ty .= 's'; $a[] = '%' . preg_replace('/\D/', '', $cq) . '%'; }
        $agg = row("SELECT COUNT(DISTINCT o.phone) n, COALESCE(SUM(o.amount),0) total FROM hs_orders o WHERE $w", $ty, ...$a) ?: ['n' => 0, 'total' => 0];
        $rep = (int)val("SELECT COUNT(*) FROM (SELECT o.phone FROM hs_orders o WHERE $w GROUP BY o.phone HAVING COUNT(*)>1) x", $ty, ...$a);
        $list = rows("SELECT o.phone, COUNT(*) n, SUM(o.amount) total, MAX(o.paid_at) last_at, COUNT(DISTINCT o.client_mac) devices,
                             SUBSTRING_INDEX(GROUP_CONCAT(COALESCE(p.name, o.pkg_name, '') ORDER BY o.id DESC SEPARATOR '|'), '|', 1) last_package,
                             SUBSTRING_INDEX(GROUP_CONCAT(COALESCE(o.client_mac, '') ORDER BY o.id DESC SEPARATOR '|'), '|', 1) last_mac
                      FROM hs_orders o LEFT JOIN hs_packages p ON p.id=o.package_id WHERE $w GROUP BY o.phone ORDER BY total DESC, last_at DESC LIMIT ? OFFSET ?",
            $ty . 'ii', ...array_merge($a, [$per, $off]));
        return self::list($list, (int)$agg['n'], $p, $per, ['customers' => (int)$agg['n'], 'total_spent' => (float)$agg['total'], 'repeat_customers' => $rep]);
    }
    static function adjustments(): array
    {
        [$p, $per, $off] = self::pg(25);
        $q = self::str('q', '', 40);
        $w = 'a.seller_id=?'; $ty = 'i'; $a = [self::uid()];
        if ($q !== '') { $w .= ' AND (v.code LIKE ? OR a.reason LIKE ?)'; $ty .= 'ss'; array_push($a, self::like($q), self::like($q)); }
        $n = (int)val("SELECT COUNT(*) FROM hs_adjustments a JOIN hs_vouchers v ON v.id=a.voucher_id WHERE $w", $ty, ...$a);
        $list = rows("SELECT a.*, v.code FROM hs_adjustments a JOIN hs_vouchers v ON v.id=a.voucher_id WHERE $w ORDER BY a.id DESC LIMIT ? OFFSET ?", $ty . 'ii', ...array_merge($a, [$per, $off]));
        return self::list($list, $n, $p, $per);
    }

    // =====================================================================
    // SELLER — MONEY
    // =====================================================================
    static function orders(): array
    {
        $uid = self::uid();
        self::bgSync(true);
        [$p, $per, $off] = self::pg(25);
        $fs = self::str('status', 'all', 20);
        if (!in_array($fs, ['attention', 'all', 'pending', 'failed', 'expired', 'paid', 'cancelled'], true)) $fs = 'all';
        $fq = trim(substr((string)preg_replace('/[^A-Za-z0-9 +\-_.]/', '', self::str('q', '', 40)), 0, 40));
        $sel = self::isAdm() ? self::int('seller') : $uid;
        $w = []; $ty = ''; $a = [];
        if ($sel) { $w[] = 'o.seller_id=?'; $ty .= 'i'; $a[] = $sel; }
        if ($fs === 'attention') $w[] = "o.status IN ('pending','failed','expired')";
        elseif ($fs !== 'all') { $w[] = 'o.status=?'; $ty .= 's'; $a[] = $fs; }
        if ($fq !== '') { $w[] = '(o.order_ref LIKE ? OR o.phone LIKE ? OR o.gateway_ref LIKE ? OR v.code LIKE ?)'; $ty .= 'ssss'; $lk = self::like($fq); array_push($a, $lk, $lk, $lk, $lk); }
        $wh = $w ? implode(' AND ', $w) : '1=1';
        $n = (int)val("SELECT COUNT(*) FROM hs_orders o LEFT JOIN hs_vouchers v ON v.id=o.voucher_id WHERE $wh", $ty, ...$a);
        $list = rows("SELECT o.*, p.name AS package_name, v.code, v.first_used_at AS voucher_used_at, d.device_name, u.username AS seller_name, cb.username AS confirmed_name
                      FROM hs_orders o LEFT JOIN hs_packages p ON p.id=o.package_id LEFT JOIN hs_vouchers v ON v.id=o.voucher_id LEFT JOIN hs_devices d ON d.id=o.device_id
                      LEFT JOIN users u ON u.id=o.seller_id LEFT JOIN users cb ON cb.id=o.confirmed_by WHERE $wh ORDER BY o.id DESC LIMIT ? OFFSET ?", $ty . 'ii', ...array_merge($a, [$per, $off]));
        $cnt = ['pending' => 0, 'failed' => 0, 'expired' => 0, 'paid' => 0, 'cancelled' => 0];
        foreach (rows("SELECT status, COUNT(*) n FROM hs_orders" . ($sel ? ' WHERE seller_id=' . (int)$sel : '') . " GROUP BY status") as $r) $cnt[$r['status']] = (int)$r['n'];
        $cnt['attention'] = $cnt['pending'] + $cnt['failed'] + $cnt['expired'];
        $cnt['all'] = $cnt['attention'] + $cnt['paid'] + $cnt['cancelled'];
        return self::list($list, $n, $p, $per, ['counts' => $cnt, 'sonic_pesa' => Payments::sonicConfigured(), 'seller_can_confirm' => false]);
    }
    static function orderGet(): array
    {
        $o = row("SELECT o.*, p.name AS package_name, v.code, v.status AS voucher_status, d.device_name FROM hs_orders o LEFT JOIN hs_packages p ON p.id=o.package_id
                  LEFT JOIN hs_vouchers v ON v.id=o.voucher_id LEFT JOIN hs_devices d ON d.id=o.device_id WHERE o.id=? OR o.order_ref=? LIMIT 1", 'is', self::int('id'), self::str('ref', '-', 40));
        if (!$o || !PaymentOps::canManage($o, self::uid(), self::isAdm())) self::fail('Payment not found.', 404, 'not_found');
        $o['events'] = rows("SELECT source, http_code, state, message, created_at FROM hs_payment_events WHERE order_id=? ORDER BY id DESC LIMIT 30", 'i', (int)$o['id']);
        $o['allowed_ops'] = self::isAdm() ? ['confirm', 'edit', 'reverse', 'recheck', 'fail', 'cancel', 'reconnect', 'set_status', 'note'] : ['recheck', 'fail', 'cancel', 'reconnect', 'set_status', 'note'];
        return $o;
    }
    static function ledger(): array
    {
        [$p, $per, $off] = self::pg(25);
        $sel = self::isAdm() ? self::int('seller') : self::uid();
        $q = self::str('q', '', 40);
        $w = []; $ty = ''; $a = [];
        if ($sel) { $w[] = '(t.seller_id=? OR t.user_id=?)'; $ty .= 'ii'; array_push($a, $sel, $sel); }
        if (($tp = self::str('type', '', 20)) !== '' && in_array($tp, ['purchase', 'commission', 'withdrawal', 'adjustment', 'refund'], true)) { $w[] = 't.type=?'; $ty .= 's'; $a[] = $tp; }
        if ($q !== '') { $w[] = '(t.transaction_ref LIKE ? OR v.code LIKE ? OR u.username LIKE ? OR t.payment_phone LIKE ? OR t.notes LIKE ?)'; $ty .= 'sssss'; $lk = self::like($q); array_push($a, $lk, $lk, $lk, $lk, $lk); }
        $wh = $w ? implode(' AND ', $w) : '1=1';
        $n = (int)val("SELECT COUNT(*) FROM transactions t LEFT JOIN hs_vouchers v ON v.id=t.voucher_id LEFT JOIN users u ON u.id=COALESCE(t.seller_id,t.user_id) WHERE $wh", $ty, ...$a);
        $list = rows("SELECT t.*, v.code, u.username FROM transactions t LEFT JOIN hs_vouchers v ON v.id=t.voucher_id LEFT JOIN users u ON u.id=COALESCE(t.seller_id,t.user_id)
                      WHERE $wh ORDER BY t.id DESC LIMIT ? OFFSET ?", $ty . 'ii', ...array_merge($a, [$per, $off]));
        return self::list($list, $n, $p, $per, ['earnings' => Earnings::summary($sel)]);
    }
    const WD_METHODS = ['mpesa' => 'M-Pesa', 'tigopesa' => 'Tigo Pesa / Mixx', 'airtelmoney' => 'Airtel Money', 'halopesa' => 'HaloPesa', 'crdb' => 'CRDB Bank', 'nmb' => 'NMB Bank', 'selcom' => 'Selcom'];
    static function wdRules(): array
    {
        $pf = (float)WITHDRAWAL_FEE_PERCENT;
        return ['platform_fee_percent' => $pf, 'sonic_fee_percent' => (float)SONIC_PESA_FEE_PERCENT,
            'minimum' => max((float)getSetting('min_withdrawal', '5000'), ceil((float)SONIC_PESA_MIN_PAYOUT / (1 - $pf / 100))), 'fee_percent_shown' => withdrawalFeePercent()];
    }
    static function withdrawals(): array
    {
        $uid = self::uid();
        [$p, $per, $off] = self::pg(20);
        $n = (int)val("SELECT COUNT(*) FROM withdrawals WHERE user_id=?", 'i', $uid);
        $list = rows("SELECT * FROM withdrawals WHERE user_id=? ORDER BY id DESC LIMIT ? OFFSET ?", 'iii', $uid, $per, $off);
        $u = row("SELECT balance FROM users WHERE id=?", 'i', $uid);
        return self::list($list, $n, $p, $per, ['balance' => (float)($u['balance'] ?? 0), 'earnings' => Earnings::summary($uid), 'rules' => self::wdRules(),
            'methods' => self::WD_METHODS, 'payout_ready' => SonicPesaPayout::configured()]);
    }
    /** Withdraw — the same rules and steps as the website's Withdraw page. */
    static function withdraw(): array
    {
        $user = $GLOBALS['auth']->user();
        $rules = self::wdRules();
        $pf = (float)WITHDRAWAL_FEE_PERCENT; $sf = (float)SONIC_PESA_FEE_PERCENT; $minW = (float)$rules['minimum'];
        $amount = round((float)self::in('amount', 0), 2); $method = self::str('method', '', 20);
        $acc = self::str('account_number', '', 40); $accName = self::str('account_name', '', 120);
        if (!isset(self::WD_METHODS[$method])) self::fail(t('invalid_method'), 422, 'invalid_method');
        if ($acc === '') self::fail(t('all_fields_required'), 422, 'missing_fields');
        if ($amount > (float)$user['balance']) self::fail(t('insufficient_balance'), 422, 'insufficient_balance');
        if ($amount < $minW) self::fail(t('below_minimum') . ' (' . money($minW) . ')', 422, 'below_minimum');
        if (!SonicPesaPayout::configured()) self::fail(t('withdrawal_failed') . ' Sonic Pesa — not configured.', 503, 'payout_not_ready');
        if (!rateLimitCheck('wd' . $user['id'], 'withdraw', 3, 600)) self::fail(t('rate_limited'), 429, 'rate_limited');
        $platformFee = round($amount * $pf / 100, 2); $toSonic = round($amount - $platformFee, 2);
        $sonicFee = round($toSonic * $sf / 100, 2); $net = round($toSonic - $sonicFee, 2);
        if ($toSonic < (float)SONIC_PESA_MIN_PAYOUT) self::fail(t('sonic_pesa_minimum'), 422, 'below_minimum');
        try {
            db()->begin_transaction();
            if (run("UPDATE users SET balance=balance-? WHERE id=? AND balance>=?", 'did', $amount, $user['id'], $amount) !== 1) throw new RuntimeException(t('insufficient_balance'));
            q("INSERT INTO withdrawals (user_id,amount,fee,net_amount,method,account_number,account_name,status,sonic_pesa_fee,sonic_pesa_net_amount) VALUES (?,?,?,?,?,?,?,'pending',?,?)",
                'idddsssdd', $user['id'], $amount, $platformFee + $sonicFee, $net, $method, $acc, $accName, $sonicFee, $net);
            $wid = (int)db()->insert_id;
            q("INSERT INTO transactions (user_id,seller_id,transaction_ref,amount,payment_method,payment_phone,type,status) VALUES (?,?,?,?,?,?,'withdrawal','pending')",
                'iisdss', $user['id'], $user['id'], 'WD' . $wid, $amount, $method, $acc);
            db()->commit();
        } catch (Throwable $e) { try { db()->rollback(); } catch (Throwable $e2) {} self::fail(t('withdrawal_failed') . ' ' . $e->getMessage(), 422, 'withdrawal_failed'); }
        $po = (new SonicPesaPayout())->createPayout($toSonic, $method, $acc, $accName);
        if (!empty($po['success'])) {
            $sid = (string)($po['data']['withdrawal_id'] ?? $po['data']['id'] ?? '');
            run("UPDATE withdrawals SET status='processing', sonic_pesa_withdrawal_id=?, sonic_pesa_response=? WHERE id=?", 'ssi', $sid ?: null, json_encode($po['data']), $wid);
            logActivity((int)$user['id'], 'withdraw', money($amount) . ' → ' . $method . ' ' . $acc . ' (mobile app)');
            return ['withdrawal_id' => $wid, 'status' => 'processing', 'amount' => $amount, 'fee' => $platformFee + $sonicFee, 'net_amount' => $net,
                'message' => t('withdrawal_pending_desc'), 'balance' => (float)val("SELECT balance FROM users WHERE id=?", 'i', (int)$user['id'])];
        }
        run("UPDATE withdrawals SET status='rejected', admin_notes=? WHERE id=?", 'si', (string)$po['message'], $wid);
        run("UPDATE users SET balance=balance+? WHERE id=?", 'di', $amount, $user['id']);
        run("UPDATE transactions SET status='failed' WHERE transaction_ref=?", 's', 'WD' . $wid);
        self::fail(t('withdrawal_failed') . ' ' . $po['message'], 422, 'withdrawal_failed', ['withdrawal_id' => $wid]);
        return [];
    }
    static function commission(): array
    {
        $uid = self::uid();
        if (!VoucherCommission::ready()) return ['ready' => false, 'message' => t('cm_not_ready')];
        $open = rows("SELECT * FROM hs_commission_invoices WHERE seller_id=? AND status IN ('unpaid','overdue') ORDER BY due_at", 'i', $uid);
        $all = rows("SELECT i.*, (SELECT COUNT(*) FROM hs_commission_payments p WHERE p.invoice_id=i.id) tries FROM hs_commission_invoices i WHERE i.seller_id=? ORDER BY i.id DESC LIMIT 60", 'i', $uid);
        $v28 = VoucherCommission::v28();
        $owed = AdminLock::owed($uid);
        return ['ready' => true, 'enabled' => VoucherCommission::enabled(), 'locked' => VoucherCommission::isLocked($uid), 'admin_locked' => AdminLock::isLocked($uid),
            'percent' => VoucherCommission::percent($uid), 'grace_days' => VoucherCommission::graceDays(), 'running' => VoucherCommission::running($uid),
            'balance' => VoucherCommission::balance($uid), 'owed_total' => $owed['total'], 'owed_invoices' => array_sum(array_map(fn($i) => (float)$i['amount'], $open)),
            'paid_total' => (float)val("SELECT COALESCE(SUM(amount),0) FROM hs_commission_invoices WHERE seller_id=? AND status='paid'", 'i', $uid),
            'pending_payment' => row("SELECT ref, amount, phone, status, created_at FROM hs_commission_payments WHERE seller_id=? AND status='pending' AND created_at > DATE_SUB(NOW(), INTERVAL 30 MINUTE) ORDER BY id DESC LIMIT 1", 'i', $uid),
            'open_invoices' => $open, 'invoices' => $all,
            'days' => $v28 ? rows("SELECT DATE(accrued_at) day, COUNT(*) n, COALESCE(SUM(sale_amount),0) sales, COALESCE(SUM(amount),0) amount FROM hs_voucher_commissions WHERE seller_id=? AND accrued_at >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) GROUP BY DATE(accrued_at) ORDER BY day DESC", 'i', $uid) : [],
            'vouchers' => $v28 ? rows("SELECT id, voucher_id, code, sale_amount, percent, amount, used_at, accrued_at, status, invoice_id FROM hs_voucher_commissions WHERE seller_id=? ORDER BY id DESC LIMIT 50", 'i', $uid) : []];
    }
    static function reports(): array
    {
        $uid = self::uid();
        $g = ['period' => self::str('period', '', 20), 'from' => self::str('from', '', 10), 'to' => self::str('to', '', 10)];
        [$from, $to, $label, $per, $f, $t] = Report::range(array_filter($g, fn($v) => $v !== ''));
        $type = self::str('type', 'seller', 10) === 'router' ? 'router' : 'seller';
        $id = self::int('id');
        if ($type === 'router') {
            if (!$id) $id = (int)val("SELECT id FROM hs_devices WHERE user_id=? ORDER BY id LIMIT 1", 'i', $uid);
            $d = $id ? row("SELECT d.*, u.username, m.code AS mcode, m.model AS mmodel FROM hs_devices d JOIN users u ON u.id=d.user_id LEFT JOIN hs_router_models m ON m.id=d.router_model_id WHERE d.id=?", 'i', $id) : null;
            if (!$d || (!self::isAdm() && (int)$d['user_id'] !== $uid)) self::fail(t('rp_no_router'), 404, 'not_found');
            $rep = Report::router($d, $from, $to, $f, $t);
        } else {
            if (!self::isAdm() || !$id) $id = self::isAdm() ? ($id ?: $uid) : $uid;
            $u = row("SELECT * FROM users WHERE id=?", 'i', $id);
            if (!$u) self::fail(t('no_data'), 404, 'not_found');
            $rep = Report::seller($u, $from, $to, $f, $t);
        }
        return ['type' => $type, 'id' => $id, 'period' => $per, 'label' => $label, 'from' => $f, 'to' => $t, 'periods' => array_map(fn($k) => t((string)$k), Report::PERIODS),
            'summary_text' => Report::summaryText($rep, $label), 'report' => $rep];
    }

    // =====================================================================
    // SELLER — SMS & MESSAGES
    // =====================================================================
    static function sms(): array
    {
        $uid = self::uid();
        if (!Sms::ready()) return ['ready' => false, 'message' => t('sms_not_ready')];
        [$p, $per, $off] = self::pg(25);
        $n = (int)val("SELECT COUNT(*) FROM hs_sms_messages WHERE seller_id=?", 'i', $uid);
        $u = row("SELECT sms_auto_voucher FROM users WHERE id=?", 'i', $uid) ?: [];
        return self::list(rows("SELECT id, batch, to_phone, text, kind, parts, status, status_text, created_at, sent_at, done_at FROM hs_sms_messages WHERE seller_id=? ORDER BY id DESC LIMIT ? OFFSET ?", 'iii', $uid, $per, $off),
            $n, $p, $per, ['ready' => true, 'enabled' => Sms::enabled(), 'balance' => Sms::balance($uid), 'free' => Sms::isFree($uid), 'bundles' => Sms::bundles(),
                'clients' => ['all' => count(Sms::clientPhones($uid, 0)), 'last_30_days' => count(Sms::clientPhones($uid, 30)), 'last_7_days' => count(Sms::clientPhones($uid, 7))],
                'pending_purchase' => row("SELECT ref, bundle, sms, amount, phone, status, created_at FROM hs_sms_purchases WHERE seller_id=? AND status='pending' AND created_at > DATE_SUB(NOW(), INTERVAL 15 MINUTE) ORDER BY id DESC LIMIT 1", 'i', $uid),
                'purchases' => rows("SELECT id, ref, bundle, sms, amount, phone, status, credited, paid_via, created_at, paid_at FROM hs_sms_purchases WHERE seller_id=? ORDER BY id DESC LIMIT 10", 'i', $uid),
                'month' => row("SELECT COUNT(*) n, COALESCE(SUM(parts),0) parts, SUM(status='delivered') delivered FROM hs_sms_messages WHERE seller_id=? AND created_at >= ?", 'is', $uid, date('Y-m-01 00:00:00')),
                'auto_voucher_sms' => (int)($u['sms_auto_voucher'] ?? 0) === 1, 'auto_template' => getSetting('sms_tpl_u' . $uid, '') ?: Sms::autoTemplate($uid),
                'opt_out' => getSetting('sms_optout_u' . $uid, ''), 'auto_allowed' => getSetting('sms_auto_allowed', '1') === '1']);
    }
    static function messages(): array
    {
        if (!Chat::ready()) self::fail(t('chat_ready'), 503, 'chat_not_ready');
        $uid = self::uid();
        $adm = self::isAdm();
        $sel = $adm ? self::int('seller') : $uid;
        if ($adm && $sel <= 0) {   // administrator without a seller: the inbox
            $ib = [];
            foreach (Chat::conversations(self::str('q', '', 60)) as $cv)
                $ib[] = ['seller_id' => (int)$cv['id'], 'name' => TopSellers::name($cv), 'online' => Chat::isOnline($cv['last_seen_at']), 'unread' => (int)$cv['unread'],
                    'last_at' => $cv['last_at'], 'last' => (string)$cv['last_body'], 'last_from_admin' => (int)$cv['last_from_admin'] === 1];
            return ['inbox' => $ib, 'unread' => Chat::unread($uid, true)];
        }
        if ($adm && !val("SELECT 1 FROM users WHERE id=? AND user_type='seller'", 'i', $sel)) self::fail(t('chat_no_seller'), 404, 'not_found');
        $list = Chat::thread($sel, 0, max(10, min(300, self::int('limit', 150))));
        Chat::markRead($sel, $adm);
        $peer = $adm ? val("SELECT last_seen_at FROM users WHERE id=?", 'i', $sel) : Chat::adminSeen();
        return ['seller_id' => $sel, 'messages' => array_map(fn($m) => Chat::json($m, $adm) + ['created_at' => $m['created_at']], $list),
            'seen_upto' => Chat::seenUpto($sel, $adm), 'online' => Chat::isOnline($peer), 'status' => Chat::seenText($peer), 'unread' => Chat::unread($uid, $adm)];
    }

    // =====================================================================
    // ADMINISTRATOR
    // =====================================================================
    static function adminStats(): array
    {
        $c = fn(string $sql) => (int)val($sql);
        $o = ['platform' => Earnings::platform(),
            'sellers' => $c("SELECT COUNT(*) FROM users WHERE user_type='seller'"), 'sellers_active' => $c("SELECT COUNT(*) FROM users WHERE user_type='seller' AND status='active'"),
            'sellers_locked' => AdminLock::ready() ? $c("SELECT COUNT(*) FROM users WHERE user_type='seller' AND admin_locked=1") : 0,
            'routers' => $c("SELECT COUNT(*) FROM hs_devices"),
            'routers_online' => $c("SELECT COUNT(*) FROM hs_devices WHERE last_seen > DATE_SUB(NOW(), INTERVAL 10 MINUTE) OR (omada_status='connected' AND omada_status_at > DATE_SUB(NOW(), INTERVAL 15 MINUTE))"),
            'active_sessions' => $c("SELECT COUNT(*) FROM hs_sessions WHERE status='active'"),
            'orders_today' => $c("SELECT COUNT(*) FROM hs_orders WHERE status='paid' AND DATE(paid_at)=CURDATE()"),
            'orders_pending' => $c("SELECT COUNT(*) FROM hs_orders WHERE status='pending'"),
            'withdrawals_pending' => $c("SELECT COUNT(*) FROM withdrawals WHERE status IN ('pending','processing')"),
            'radius_server_online' => (int)getSetting('radius_server_seen', '0') > time() - 180];
        try { if (PortalVisitors::ready()) $o['portal_visitors'] = PortalVisitors::stats(); } catch (Throwable $e) {}
        try { if (VoucherCommission::ready()) $o['commission'] = VoucherCommission::totals(); } catch (Throwable $e) {}
        return $o;
    }
    static function adminUsers(): array
    {
        [$p, $per, $off] = self::pg(25);
        $q = self::str('q', '', 60);
        $w = '1=1'; $ty = ''; $a = [];
        if ($q !== '') { $w = '(u.username LIKE ? OR u.full_name LIKE ? OR u.phone LIKE ? OR u.email LIKE ?)'; $ty = 'ssss'; $a = array_fill(0, 4, self::like($q)); }
        if (($tp = self::str('type', '', 10)) !== '' && in_array($tp, ['seller', 'admin', 'customer'], true)) { $w .= ' AND u.user_type=?'; $ty .= 's'; $a[] = $tp; }
        $n = (int)val("SELECT COUNT(*) FROM users u WHERE $w", $ty, ...$a);
        $list = rows("SELECT u.*, (SELECT COUNT(*) FROM hs_devices d WHERE d.user_id=u.id) devs, (SELECT COUNT(*) FROM hs_devices d WHERE d.user_id=u.id AND d.omada_status='connected') omada_on,
                             (SELECT COUNT(*) FROM hs_sessions s WHERE s.seller_id=u.id AND s.status='active') active_sessions
                      FROM users u WHERE $w ORDER BY u.id DESC LIMIT ? OFFSET ?", $ty . 'ii', ...array_merge($a, [$per, $off]));
        return self::list($list, $n, $p, $per);
    }
    static function adminUserGet(): array
    {
        $u = row("SELECT * FROM users WHERE id=?", 'i', self::int('id'));
        if (!$u) self::fail('User not found.', 404, 'not_found');
        $id = (int)$u['id'];
        return ['user' => $u, 'earnings' => Earnings::summary($id), 'routers' => array_map(fn($d) => self::dev($d, false), Device::forSeller($id)),
            'lock' => AdminLock::info($id), 'owed' => AdminLock::owed($id), 'sms_balance' => Sms::ready() ? Sms::balance($id) : 0,
            'withdrawals' => rows("SELECT * FROM withdrawals WHERE user_id=? ORDER BY id DESC LIMIT 10", 'i', $id),
            'activity' => rows("SELECT action, description, ip_address, created_at FROM activity_logs WHERE user_id=? ORDER BY id DESC LIMIT 20", 'i', $id)];
    }
    static function adminRouters(): array
    {
        [$p, $per, $off] = self::pg(25);
        $q = self::str('q', '', 60);
        $w = '1=1'; $ty = ''; $a = [];
        if ($q !== '') { $w = '(d.device_name LIKE ? OR d.ap_mac LIKE ? OR d.ssid LIKE ? OR u.username LIKE ? OR d.omada_sn LIKE ?)'; $ty = 'sssss'; $a = array_fill(0, 5, self::like($q)); }
        if (($s = self::int('seller')) > 0) { $w .= ' AND d.user_id=?'; $ty .= 'i'; $a[] = $s; }
        $n = (int)val("SELECT COUNT(*) FROM hs_devices d JOIN users u ON u.id=d.user_id WHERE $w", $ty, ...$a);
        $list = rows("SELECT d.*, u.username, (SELECT COUNT(*) FROM hs_sessions s WHERE s.device_id=d.id AND s.status='active') AS active_sessions FROM hs_devices d JOIN users u ON u.id=d.user_id
                      WHERE $w ORDER BY d.id DESC LIMIT ? OFFSET ?", $ty . 'ii', ...array_merge($a, [$per, $off]));
        return self::list(array_map(fn($d) => self::dev($d, false) + ['seller' => $d['username']], $list), $n, $p, $per);
    }
    static function adminWithdrawals(): array
    {
        [$p, $per, $off] = self::pg(25);
        $q = self::str('q', '', 60);
        $w = '1=1'; $a = [];
        if ($q !== '') { $w = '(u.username LIKE ? OR w.account_number LIKE ? OR w.sonic_pesa_withdrawal_id LIKE ? OR w.status LIKE ? OR w.method LIKE ?)'; $a = array_fill(0, 5, self::like($q)); }
        $ty = str_repeat('s', count($a));
        $n = (int)val("SELECT COUNT(*) FROM withdrawals w JOIN users u ON u.id=w.user_id WHERE $w", $ty, ...$a);
        return self::list(rows("SELECT w.*, u.username FROM withdrawals w JOIN users u ON u.id=w.user_id WHERE $w ORDER BY w.id DESC LIMIT ? OFFSET ?", $ty . 'ii', ...array_merge($a, [$per, $off])), $n, $p, $per);
    }
    static function adminCommissions(): array
    {
        if (!VoucherCommission::ready()) return ['ready' => false];
        [$p, $per, $off] = self::pg(25);
        $st = self::str('status', '', 10);
        $w = '1=1'; $ty = ''; $a = [];
        if (in_array($st, ['unpaid', 'overdue', 'paid', 'waived'], true)) { $w = 'i.status=?'; $ty = 's'; $a[] = $st; }
        if (($s = self::int('seller')) > 0) { $w .= ' AND i.seller_id=?'; $ty .= 'i'; $a[] = $s; }
        $n = (int)val("SELECT COUNT(*) FROM hs_commission_invoices i WHERE $w", $ty, ...$a);
        $list = rows("SELECT i.*, u.username FROM hs_commission_invoices i JOIN users u ON u.id=i.seller_id WHERE $w ORDER BY i.id DESC LIMIT ? OFFSET ?", $ty . 'ii', ...array_merge($a, [$per, $off]));
        return self::list($list, $n, $p, $per, ['totals' => VoucherCommission::totals(), 'enabled' => VoucherCommission::enabled(), 'percent' => VoucherCommission::percent()]);
    }
    static function adminVisitors(): array
    {
        if (!PortalVisitors::ready()) return ['ready' => false];
        $per = self::str('period', 'today', 10);
        $by = self::str('by', 'seller', 10);
        return ['ready' => true, 'stats' => PortalVisitors::stats(), 'chart' => PortalVisitors::chart(14),
            'period' => $per, 'by' => $by === 'router' ? 'router' : 'seller', 'grouped' => PortalVisitors::grouped($by === 'router' ? 'router' : 'seller', $per)];
    }
}

// ---------- engine: index.php calls skyApiRoute() at the end of its engine ----------
require $__apiIdx;
// only reached when index.php returned without answering (should not happen)
SkyApi::fail('The request was not handled.', 500, 'not_handled');
