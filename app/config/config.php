<?php
/*
 * Modified: preppend directory path of current file, because of this file own different ENV under between Apache and command line.
 * NOTE: please remove this comment.
 */
defined('BASE_PATH') || define('BASE_PATH', getenv('BASE_PATH') ?: realpath(dirname(__FILE__) . '/../..'));
defined('APP_PATH') || define('APP_PATH', BASE_PATH . '/app');
define('SITENAME', 'Sistem Informasi Akademik');
define('BASE_URL', 'http://localhost/phalcon_acl/');
define('PUBLIC_URL', 'http://localhost/phalcon_acl/public/');
define('DOCUMENT_ROOT', $_SERVER['DOCUMENT_ROOT'].'/phalcon_acl/public/');
define('PUBLIC_CONTROLLER', 'account'); 

return new \Phalcon\Config([
    'database' => [
        'adapter'     => 'Mysql',
        'host'        => 'localhost',
        'username'    => 'root',
        'password'    => '12',
        'dbname'      => 'acl_phalcon',
        'charset'     => 'utf8',
    ],
    'application' => [
        'appDir'         => APP_PATH . '/',
        'controllersDir' => APP_PATH . '/controllers/',
        'modelsDir'      => APP_PATH . '/models/',
        'migrationsDir'  => APP_PATH . '/migrations/',
        'viewsDir'       => APP_PATH . '/views/',
        'helpersDir'     => APP_PATH . '/helpers/',
        'pluginsDir'     => APP_PATH . '/plugins/',
        'libraryDir'     => APP_PATH . '/library/',
        'cacheDir'       => BASE_PATH . '/cache/',
        'baseUri'        => 'http://localhost/phalcon_acl/',
    ]
]);
