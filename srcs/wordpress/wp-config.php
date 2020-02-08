<?php
/**
 * Configuración básica de WordPress.
 *
 * Este archivo contiene las siguientes configuraciones: ajustes de MySQL, prefijo de tablas,
 * claves secretas, idioma de WordPress y ABSPATH. Para obtener más información,
 * visita la página del Codex{@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} . Los ajustes de MySQL te los proporcionará tu proveedor de alojamiento web.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** Ajustes de MySQL. Solicita estos datos a tu proveedor de alojamiento web. ** //
/** El nombre de tu base de datos de WordPress */
define('DB_NAME', 'wordpress');

/** Tu nombre de usuario de MySQL */
define('DB_USER', 'root');

/** Tu contraseña de MySQL */
define('DB_PASSWORD', '');

/** Host de MySQL (es muy probable que no necesites cambiarlo) */
define('DB_HOST', 'localhost');

/** Codificación de caracteres para la base de datos. */
define('DB_CHARSET', 'utf8');

/** Cotejamiento de la base de datos. No lo modifiques si tienes dudas. */
define('DB_COLLATE', '');

/**#@+
 * Claves únicas de autentificación.
 *
 * Define cada clave secreta con una frase aleatoria distinta.
 * Puedes generarlas usando el {@link https://api.wordpress.org/secret-key/1.1/salt/ servicio de claves secretas de WordPress}
 * Puedes cambiar las claves en cualquier momento para invalidar todas las cookies existentes. Esto forzará a todos los usuarios a volver a hacer login.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'j[Yq9<`u5Q8Ljz-:~2dECV?pwVpAL_v-|-|<}[u^-e7tj,&N{fS>9~M?]viD8OX-');
define('SECURE_AUTH_KEY',  '|CRWGBH;*9V<HeV7lF|D-2{~n&Wp=j(_cp;dl4!$GaO<|+LcWlbW{vU14.9ZD$,O');
define('LOGGED_IN_KEY',    '18e<s6x.YV3>M@C-M@2]Dgk&pLmP`<8FnBY#AqTQ1e:>jubHey`E}oQvN#?zh{H>');
define('NONCE_KEY',        '3[J.o)DS:ZL7@|kJ(=bk=}/P${h9RI9j]DcB{pfQqSL5?=hlG~~{>`-r#Q/N:+wc');
define('AUTH_SALT',        'x7htpo/|E+qLY[#< vGcZJ#@xjvH<{3x08O|{4X*WyT3(7-qCdt<yS~Sb1/F,%-Y');
define('SECURE_AUTH_SALT', 'm.4iaNW!!ppqtlJRpyB5:3-p-4;%@3y`q-J)+!e:,&|<T)-qbe%Dj$i6qO.SB+(-');
define('LOGGED_IN_SALT',   '/;}q|cn~:}~/X*gef=7g?0M3[w?]X3&we+feDl-+-Hk=E_im/Cf;?EK,]g2D*o-C');
define('NONCE_SALT',       'Foz0J2Flt.hS!Tq?g]ZyoA,88GM4QRr`h+Ja?au*HAP(S:t1/Kb^bxVl:^|3%n.g');

/**#@-*/

/**
 * Prefijo de la base de datos de WordPress.
 *
 * Cambia el prefijo si deseas instalar multiples blogs en una sola base de datos.
 * Emplea solo números, letras y guión bajo.
 */
$table_prefix = 'wp_';


/**
 * Para desarrolladores: modo debug de WordPress.
 *
 * Cambia esto a true para activar la muestra de avisos durante el desarrollo.
 * Se recomienda encarecidamente a los desarrolladores de temas y plugins que usen WP_DEBUG
 * en sus entornos de desarrollo.
 */
define('WP_DEBUG', false);

/* ¡Eso es todo, deja de editar! Feliz blogging */

/** WordPress absolute path to the Wordpress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

