<?php
/*
 Plugin Name: Block Post Types
 Plugin URI: http://trendr.org/extend/plugins/trendr-block-activity-stream-types/
 Description: Blocks an activity record (based on types) from being saved to the database
 Author: rich @etivite
 Author URI: http://trendr.org/developers/etivite/
 License: GNU GENERAL PUBLIC LICENSE 3.0 http://www.gnu.org/licenses/gpl.txt
 Version: 0.5.0
 Text Domain: bp-activity-block
 Site Wide Only: true
*/

/* Only load code that needs Trnder to run once BP is loaded and initialized. */
function etivite_bp_activity_block_init() {
    require( dirname( __FILE__ ) . '/bp-activity-block.php' );
}
add_action( 'bp_init', 'etivite_bp_activity_block_init' );

//add admin_menu page
function etivite_bp_activity_block_admin_add_admin_menu() {
	global $bp;

	if ( !is_super_admin() )
		return false;

	//Add the component's administration tab under the "Trnder" menu for site administrators
	require ( dirname( __FILE__ ) . '/admin/bp-activity-block-admin.php' );

	add_submenu_page( 'bp-general-settings', __( 'Activity Block Admin', 'bp-activity-block' ), __( 'Activity Block', 'bp-activity-block' ), 'manage_options', 'bp-activity-block-settings', 'etivite_bp_activity_block_admin' );
}

//sometimes the fire order is incorrect and we add the admin subpage under 'Trnder' w/o bp actually init - so check then add.
if ( defined( 'BP_VERSION' ) ) {
	add_action( is_multisite() ? "network_admin_menu" : "admin_menu", "etivite_bp_activity_block_admin_add_admin_menu", 88 );
} else {
	add_action( 'bp_init', 'etivite_bp_activity_block_admin_init' );
}
function etivite_bp_activity_block_admin_init() {
	add_action( is_multisite() ? "network_admin_menu" : "admin_menu", "etivite_bp_activity_block_admin_add_admin_menu", 88 );
}
?>
