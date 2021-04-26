<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wp_pass' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '+td+X`y:#w|BLlx%];;xuQ@y[-&-4-iF+1]pn]ZVOMR(XE$%)H>h,+U5b<n6L=Q|');
define('SECURE_AUTH_KEY',  'z)~8|#+0mTa!.w+5?38-f,->J-[w>./FoU$ipa#io JFD$e~-VJ1~RY]]}3KlQ%$');
define('LOGGED_IN_KEY',    'tSw$<|3)|S i9 ,KAN4HZ[p(+w>_h+n+*7x[sq4eEV}y0tw;,v|[-*8QM<&GUR@%');
define('NONCE_KEY',        '-GN^Ds6G:-OZrs~>nDo[F_oUi4P-Nw3K;Tr++sjE;2:,IHC8^u1pJVhxG>|^a8f-');
define('AUTH_SALT',        'xgt|Yo73c3cvF]G[YkO`1n7s[143Ddf9~H?cKhi7l$efkYWx6Gfpr_g!UC-~[.P(');
define('SECURE_AUTH_SALT', 'W{ao~@UuVON+CAhLZktlc-FQ=+JTWlkSq/,s*##ggL6|zAc<?3qD3Cn!&})8cb7|');
define('LOGGED_IN_SALT',   '_KZ_wC0,dFm!tmv]=xl}YcBVsq*tN2w*S9uw|(tP-6C$|=(=_KJX2[4;I4nqO ie');
define('NONCE_SALT',       '::VK0dy:B<]:z7L1-^%$!.q}C/QL1NXyE}SU)tJS(JN^j2Hz!=BMa8rZS$QwyQ*<');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
