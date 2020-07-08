<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en « wp-config.php » et remplir les
 * valeurs.
 *
 * Ce fichier contient les réglages de configuration suivants :
 *
 * Réglages MySQL
 * Préfixe de table
 * Clés secrètes
 * Langue utilisée
 * ABSPATH
 *
 * @link https://fr.wordpress.org/support/article/editing-wp-config-php/.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'username' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'password' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/**
 * Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define( 'DB_COLLATE', '' );

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Y0SVN32/4ny+b@Z78o_dfL/NcvCd3wwc9o~ng*:)m]|uDYz7A-tgbnI-s2_2JaCs');
define( 'SECURE_AUTH_KEY',  'CYy]&`3S/g-UV|(>*Wswdet~+5;*Pcj=4~DN|?G}J!6V`:>8hphX@te2BV0*uWwo');
define( 'LOGGED_IN_KEY',    '}I{R_hS!Dg+y= Q()Jbt-(WK?GV~F-VM{RK_SZMA!<@d3L6&B{->pG5[G1ub~|gn');
define('NONCE_KEY',        ' {hKxL:@&x$.=p.S)$o-z.5>;Gys?_E4hG-9y@-u$Ta.BS%aXDz_*JD|kB$s)&qA');
define( 'AUTH_SALT',        'Drr(4:vAY:<@mHT&Z,y.@bXA(1_oSK/*o[8v.;k5]21S8w9=(5!vQ2ucm.m*[);Z');
define( 'SECURE_AUTH_SALT', 'V%WZVZ@4?aCDHd[^ip+NjWFe+Mt]~l+qE}_V3<}J>ajnvbt<4-pOK/45g>O0QN/B');
define( 'LOGGED_IN_SALT',   '-V6v}PB$fj+lEg-pvK-U++*/,HhJ76!)]tSH9%`VZE[Bb:SvrG.P=cJ$_4,Ku-Bz');
define( 'NONCE_SALT',       'f)0G*&$a=nvMN=Ot-4]Ze|>D@!bP^q9+Uy5fp#Wi^+ -3d|,[aLYNB`e+zT5$%G!');

/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );
