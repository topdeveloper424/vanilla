<?php
/**
 * Plugin Name: BP | You Are Blocked!
 * Plugin URI: http://www.merovingi.com
 * Description: Let your BuddyPress users block other members from contacting them or viewing their profile. Requires BuddyPress 1.8 or higher.
 * Version: 1.0Beta5
 * Tags: buddypress, block, users
 * Author: Gabriel S Merovingi
 * Author URI: http://www.merovingi.com
 * Author Email: info@merovingi.com
 * Requires at least: TRM 3.1
 * Tested up to: TRM 3.6.1
 * Text Domain: bpblock
 * Domain Path: /lang
 * License: GPLv2 or later
 * License URI: http://www.gnu.org/licenses/gpl-2.0.html
 */
define( 'BPB_VERSION',      '1.0Beta5' );
define( 'BPB_THIS',         __FILE__ );
define( 'BPB_ROOT_DIR',     plugin_dir_path( BPB_THIS ) );
define( 'BPB_INCLUDES_DIR', BPB_ROOT_DIR . 'includes/' );
define( 'BPB_TEMPLATE_DIR', BPB_ROOT_DIR . 'templates/' );

/**
 * Load Plugin with BuddyPress
 * @since 1.0
 * @version 1.0
 */
add_action( 'bp_include', 'bpb_load_plugin' );
function bpb_load_plugin() {

	global $bpb_my_list;

	if ( ! defined( 'BPB_ADMIN_CAP' ) )
		define( 'BPB_ADMIN_CAP', 'edit_users' );

	require_once( BPB_INCLUDES_DIR . 'bpb-functions.php' );

	if ( is_user_logged_in() ){
		wp_cache_add( 'bpb', get_user_meta( bp_loggedin_user_id() , '_block', true ), 'bpb_my_block_list' );
//asamir
			wp_enqueue_script( 'bp-you-are-blocked-js',  plugin_dir_url( __FILE__ ).'includes/bpb-block.js', array( 'jquery' ) );
	}
	require_once( BPB_INCLUDES_DIR . 'bpb-actions.php' );
	bpb_handle_actions();
	add_action( 'bp_directory_members_item', 'bpb_insert_block_button_loop' );
	add_action( 'bp_member_header_actions',  'bpb_insert_block_button_profile' );

	require_once( BPB_INCLUDES_DIR . 'bpb-templates.php' );
	//add_action( 'bp_members_screen_display_profile', 'bpb_load_blocked_profile_templates' );
	add_action( 'bp_screens', 'bpb_core_screen_profite', 1 );

	require_once( BPB_INCLUDES_DIR . 'bpb-queries.php' );
	add_action( 'bp_pre_user_query_construct',     'bpb_adjust_user_query', 1 );
	add_filter( 'bp_get_total_member_count',       'bpb_adjust_total_count' );
	add_filter( 'bp_get_member_latest_update',     'bpb_adjust_latest_update' );
	add_filter( 'bp_activity_content_before_save', 'bpb_adjust_mentions', 1, 2 );
	// add_action( 'bp_activity_before_save', 'validationthemention' );
	require_once( BPB_INCLUDES_DIR . 'bpb-activities.php' );
	add_filter( 'bp_activity_get',             'bpb_filter_activities', 10, 2 );
	add_filter( 'bp_get_member_latest_update', 'bpb_remove_activity_if_blocked' );

	require_once( BPB_INCLUDES_DIR . 'bpb-profile.php' );
	add_action( 'bp_setup_nav',   'bpb_setup_navigation' );
	add_action( 'admin_bar_menu', 'bpb_setup_tool_bar', 110 );

	if ( bp_is_active( 'friends' ) ) {
		require_once( BPB_INCLUDES_DIR . 'bpb-friends.php' );
		add_filter( 'bp_is_friend', 'bpb_friend_check', 10, 2 );

		remove_action( 'bp_init', 'friends_action_add_friend' );
		add_action( 'bp_init',    'bpb_friends_action_add_friend' );
	}

	if ( bp_is_active( 'messages' ) ) {
		require_once( BPB_INCLUDES_DIR . 'bpb-messages.php' );
		add_filter( 'bp_messages_recipients',       'bpb_check_message_receipients' );
		add_action( 'messages_message_before_save', 'bpb_before_message_send' );
	}
}
?>
