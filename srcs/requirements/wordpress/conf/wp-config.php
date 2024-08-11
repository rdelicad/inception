<?php
// Database configuration
define('DB_NAME', getenv('DB_NAME'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASSWORD', getenv('DB_USER_PASS'));
define('DB_HOST', 'mariadb:3306');

// WordPress URL and title configuration
define('WP_HOME', 'https://' . getenv('WP_URL'));
define('WP_SITEURL', 'https://' . getenv('WP_URL'));

// Security keys generation
define('AUTH_KEY',         '*>Df,Av]}Kc`5jy--d.-^!V3>|4#hX$tW7n(3Q,]* d0|}h!]j*H+RF)sT@?OThr');
define('SECURE_AUTH_KEY',  '$fKEak{a7/2#/fkc3N+2yC6-1$f8z* ]!=baQ<(W:RE5ijO+ W^WSZWjw,:vAfSv');
define('LOGGED_IN_KEY',    '04DY> VG<H?qWH?>ti ,vS8B:{-5Q3]Gc+iAhi42kv_!<ebBtw+740-q8Hx`dA-R');
define('NONCE_KEY',        'Skp.GTnn)8VevmKel:T;SBJ49byf[yq-EN,i^]b0_,W{c~-nDPo$xb+JL-`Jpt{s');
define('AUTH_SALT',        'dOr/O>i*&QP0-D8D57WoKfpD0-iP*5^>jP%v-5~nlJ8x205vU#[WeuofW9K1pW|h');
define('SECURE_AUTH_SALT', ':0V}L)33yYHT |[U1[r}BZu9eR4JTo7r/)wR-*]H%}c!nQ/`$ijqC-u)C}R#-arz');
define('LOGGED_IN_SALT',   'LgG!7yp&kJ@gXU|,O6|4=pcT!!{T7ronBCx@4IHc3Kqi[mcdi^@I`NyJ7c1@|(9E');
define('NONCE_SALT',       ' [P%U}8&I+bfKgTo7]UR)`TSI3I2;=yT96@W,<$rEh#$(n?-`qrU-W/w[,,.eiNA');

// WordPress database table prefix
$table_prefix = 'wp_';

// Debug mode
define('WP_DEBUG', false);

// Absolute path to the WordPress directory and WordPress setup
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');

