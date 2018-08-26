<?php 
/**
 * Plugin Name: BuddyPress Global Search
 * Plugin URI:  ##
 * Description: Ajax powered global BuddyPress search
 * Author:      BuddyBoss
 * Author URI:  http://buddyboss.com
 * Version:     1.0.0
 */
// Exit if accessed directly
if (!defined('ABSPATH'))
	exit;

/**
 * ========================================================================
 * CONSTANTS
 * ========================================================================
 */
// Codebase version
if (!defined('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_VERSION')) {
	define('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_VERSION', '1.0.0');
}

// Database version
if (!defined('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_DB_VERSION')) {
	define('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_DB_VERSION', 1);
}

// Directory
if (!defined('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_DIR')) {
	define('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_DIR', trailingslashit(plugin_dir_path(__FILE__)));
}

// Url
if (!defined('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_URL')) {
	$plugin_url = plugin_dir_url(__FILE__);

	// If we're using https, update the protocol. Workaround for WP13941, WP15928, WP19037.
	if (is_ssl())
		$plugin_url = str_replace('http://', 'https://', $plugin_url);

	define('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_URL', $plugin_url);
}

// File
if (!defined('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_FILE')) {
	define('BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_FILE', __FILE__);
}

/**
 * ========================================================================
 * MAIN FUNCTIONS
 * ========================================================================
 */

/**
 * Main
 *
 * @return	void
 * @since	1.0.0
 */
function buddyboss_global_search_init() {
	global $bp, $buddyboss_global_search;
	$main_include = BUDDYBOSS_GLOBAL_SEARCH_PLUGIN_DIR . 'includes/main-class.php';

	try {
		if (file_exists($main_include)) {
			require( $main_include );
		} else {
			$msg = sprintf(__("Couldn't load main class at:<br/>%s", 'buddypress-global-search'), $main_include);
			throw new Exception($msg, 404);
		}
	} catch (Exception $e) {
		$msg = sprintf(__("<h1>Fatal error:</h1><hr/><pre>%s</pre>", 'buddypress-global-search'), $e->getMessage());
		echo $msg;
	}

	$buddyboss_global_search = BuddyBoss_Global_Search_Plugin::instance();
}

add_action('plugins_loaded', 'buddyboss_global_search_init');
add_action( 'bp_adminbar_menus', 'bp_adminbar_search_menu',120 );
/**
 * Must be called after hook 'plugins_loaded'
 *
 * @return	BuddyPress Global Search main/global object
 * @see		class BuddyBoss_Global_Search
 * @since	1.0.0
 */

function bp_adminbar_search_menu()
{
	echo '<li id="wp-admin-bar-search" class="admin-bar-search" style="background:none;"><div class="ab-item ab-empty-item" tabindex="-1"><form action="'.site_url().'/" method="get" id="adminbarsearch"><span role="status" aria-live="polite" class="ui-helper-hidden-accessible"></span><input class="adminbar-input ui-autocomplete-input" name="s" id="adminbar-search" value="" maxlength="150" autocomplete="off" type="text"><input class="adminbar-button" value="Search" type="submit"></form></div>		</li>';
}
function buddyboss_global_search() {
	global $buddyboss_global_search;

	return $buddyboss_global_search;
}

/**
 * Settings Link
 * @since	1.0.0
 */
add_filter ('plugin_action_links', 'buddyboss_global_search_meta', 10, 2);
function buddyboss_global_search_meta ($links, $file)
{
	if ($file == plugin_basename (__FILE__))
	{
    	$settings_link = '<a href="' . add_query_arg( array( 'page' => 'buddypress-global-search/includes/admin.php'   ), admin_url( 'options-general.php' ) ) . '">' . esc_html__( 'Settings', 'buddypress-global-search' ) . '</a>';
		array_unshift ($links, $settings_link);
	}
	return $links;
}

?>