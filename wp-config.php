<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'gitlabnow');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Atl=ehT4pe? S;bO`C/03VV9~&mbDK0bcef.h!Zf$]R=]ok[e`(0@c--uzU%<0<i');
define('SECURE_AUTH_KEY',  '(eeE%?QQ( 9WjtC;x]t`[w4rb>bvb?0SU/n0V5;{&+3hLM`LCA^_cV$QQgY|<*17');
define('LOGGED_IN_KEY',    '3$Hm?1o^D0Ff6{tH[Bos4I&U|%S$I5>Dzq Mr :_|X]K4,W;]U/ETL4x]S On[*z');
define('NONCE_KEY',        'UduaVJfO$wPT7g/R{Y4F;B!G@,H lgL/QJp jHqo+f7(}Y{y^DMpU,`q9OM>wEyG');
define('AUTH_SALT',        '+ZcvQ^Sq ?6wfePc+u5nwz1:`fyZLclioY/Lg,#@48KxT]jRnz;A# 1t]^zHvr;e');
define('SECURE_AUTH_SALT', ')ToE%Q^$]u^W/bm`lcS ZO.qd4V2>8c[*JH||s)Hj^ULc#%_F-Cx<L|$RI<NI!Ij');
define('LOGGED_IN_SALT',   '<Lmm7&CEH^Z}|#As&lp)d)3sn l0^<X(<l{9uc?3X|,EzyWx)o<j]_<.-S//J5MA');
define('NONCE_SALT',       'UZ}`6lJMS;a*t7SJ8i+uBL-!ntD}lN{|`oP{l#$ug[EXP#/?Zec}SR4bee`Z/Ts<');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
ini_set('display_errors','Off');
ini_set('error_reporting', E_ALL );
define('WP_DEBUG', false);
define('WP_DEBUG_DISPLAY', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
