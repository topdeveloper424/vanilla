<?php
// Exit if accessed directly
defined( 'ABSPATH' ) || exit;

/**
 * bp_like_install()
 *
 * Installs or upgrades the database content
 */
function bp_like_install() {
    // build a way to easily change this to other predefined words, eg love, thumbs up
       

    update_site_option( 'bp_like_db_version' , BP_LIKE_DB_VERSION );
    update_site_option( 'bp_like_settings' , $settings );

    add_action( 'admin_notices' , 'bp_like_updated_notice' );
}

/**
 * bp_like_check_installed()
 *
 * Checks to see if the DB tables exist or if you are running an old version
 * of the component. If it matches, it will run the installation function.
 * This means we don't have to deactivate and then reactivate.
 *
 */
function bp_like_check_installed() {
    global $wpdb;

    if ( ! is_super_admin() ) {
        return false;
    }

    if ( ! get_site_option( 'bp_like_settings' ) || get_site_option( 'bp-like-db-version' ) ) {
        bp_like_install();
    }

    if ( get_site_option( 'bp_like_db_version' ) < BP_LIKE_DB_VERSION ) {
        bp_like_install();
    }
}

add_action( 'admin_menu' , 'bp_like_check_installed' );


/*
 * The notice we show if the plugin is updated.
 */

function bp_like_updated_notice() {

    if ( ! is_super_admin() ) {
        return false;
    } else {
        echo '<div id="message" class="updated fade"><p style="line-height: 150%">';
        printf( __( '<strong>BuddyPress Like</strong> has been successfully updated to version %s.' , 'buddypress-like' ) , BP_LIKE_VERSION );
        echo '</p></div>';
    }
}


/*
 * The notice we show when the plugin is installed.
 */

function bp_like_install_buddypress_notice() {
    echo '<div id="message" class="error fade"><p style="line-height: 150%">';
    _e( '<strong>BuddyPress Like</strong></a> requires the BuddyPress plugin to work. Please <a href="http://buddypress.org">install BuddyPress</a> first, or <a href="plugins.php">deactivate BuddyPress Like</a>.' , 'buddypress-like' );
    echo '</p></div>';
}
