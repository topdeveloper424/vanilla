<?php
/*
Plugin Name:  Hashtags
Plugin URI: http://wpnder.org/extend/module/wpnder-activity-swpeam-hashtags/
Description: Enable #hashtags linking within activity swpeam content - converts before database.
Author: rich @etiviti
Author URI: http://etivite.com
License: GNU GENERAL PUBLIC LICENSE 3.0 http://www.gnu.org/licenses/gpl.txt
Version: 0.5.1
Text Domain: bp-activity-hashtags
Network: wpue
*/

//TODO - We really need unicode support =) For example �#tag� works ok, but �#?????� � nope.
//TODO - support post db content filter rewrite on #tag
if ( ! function_exists( 'get_plugins' ) ) {
    require_once( ABSPATH . 'wp-admin/includes/plugin.php' );
}
$plugin_folder = get_plugins( '/' . plugin_basename( dirname( __FILE__ ) ) ) ;
$plugin_file = basename( ( __FILE__ ) ) ;


define( 'BP_HASHTAGS_VERSION' , $plugin_folder[ $plugin_file ][ 'Version' ] ) ;
define( 'BP_HASHTAGS_DB_VERSION' , $plugin_folder[ $plugin_file ][ 'Version' ] ) ;
define( 'BP_HASHTAGS_BASENAME' , plugin_basename( __FILE__ ) ) ;
if ( ! defined( 'BP_ACTIVITY_HASHTAGS_SLUG' ) ) {
    define( 'BP_ACTIVITY_HASHTAGS_SLUG' , 'tag' ) ;
}

function ls_bp_hashtags_init() {

	if ( !bp_is_active( 'activity' ) )
		return;		

	//if ( file_exists( dirname( __FILE__ ) . '/languages/' . get_locale() . '.mo' ) )
	//	load_textdomain( 'bp-activity-hashtags', dirname( __FILE__ ) . '/languages/' . get_locale() . '.mo' );

	$data = maybe_unserialize( get_option( 'etivite_bp_activity_stream_hashtags' ) );
		

		
	require( dirname( __FILE__ ) . '/bp-activity-hashtags.php' );
	
	//same set used for atme mentions
	//add_filter( 'bp_activity_comment_content', 'etivite_bp_activity_hashtags_filter' );
	add_filter( 'bp_activity_new_update_content', 'etivite_bp_activity_hashtags_filter' );

	//add_filter( 'group_forum_topic_text_before_save', 'etivite_bp_activity_hashtags_filter' );
	//add_filter( 'group_forum_post_text_before_save', 'etivite_bp_activity_hashtags_filter' );
	//add_filter( 'groups_activity_new_update_content', 'etivite_bp_activity_hashtags_filter' );		
	
	//what about blog posts in the activity stream
	//if ( $data['blogactivity']['enabled'] ) {
	//	add_filter( 'bp_blogs_activity_new_post_content', 'etivite_bp_activity_hashtags_filter' );
	//	//add_filter( 'bp_blogs_activity_new_comment_content', 'etivite_bp_activity_hashtags_filter' );
//	}
	
	//what about general blog posts/comments?
	//if ( $data['blogposts']['enabled'] ) {
	//	add_filter( 'get_comment_text' , 'etivite_bp_activity_hashtags_filter', 9999 );
		//add_filter( 'the_content', 'etivite_bp_activity_hashtags_filter', 9999 );
//	}
	
	//support edit activity stream plugin
//	add_filter( 'bp_edit_activity_action_edit_content', 'etivite_bp_activity_hashtags_filter' );
	
	//ignore this - if we wanted to filter after - this would be it 
	//but then we can't search by the #hashtag via search_terms (since the trick is the ending </a>)
	//as the search_term uses LIKE %%term%% so we would match #child #children
	//add_filter( 'bp_get_activity_content_body', 'etivite_bp_activity_hashtags_filter' );
	
	//add_action( bp_core_admin_hook(), 'etivite_bp_activity_hashtags_admin_add_admin_menu' );
	
}
add_action( 'bp_include', 'ls_bp_hashtags_init', 88 );
//add_action( 'bp_init', 'ls_bp_hashtags_init', 88 );
function etivite_plugin_get_version() {
    $plugin_data = get_plugin_data( __FILE__ ) ;
    $plugin_version = $plugin_data[ 'Version' ] ;
    return $plugin_version ;
}
function bp_hashtags_tableCreate( $charset_collate ) {
    global $bp ;
    //$activity_table = 'bp_activity' ;
    $toSql = $sql[] = "CREATE TABLE " . BP_HASHTAGS_TABLE . " (
		  		id bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                hashtag_name VARCHAR(255) NOT NULL,
                                hashtag_slug TEXT NOT NULL,
                                value_id bigint(20) NOT NULL,
                                taxonomy varchar(255) DEFAULT '',
                                if_activity_component VARCHAR(255) DEFAULT '',
                                if_activity_item_id bigint(20),
                                hide_sitewide bool DEFAULT 0,
                                user_id int NOT NULL,
                                created_ts DATETIME NOT NULL,
				KEY hashtag_name (hashtag_name),
                                KEY taxonomy (taxonomy),
                                KEY if_activity_item_id (if_activity_item_id),
                                KEY if_activity_component (if_activity_component),
				KEY hide_sitewide (hide_sitewide),
                                KEY user_id (user_id),
                                KEY created_ts (created_ts)
		 	   ) {$charset_collate};" ;
    return $toSql ;
}

function bp_hashtags_is_installed() {
    bp_hashtags_set_constants() ;
    if ( get_site_option( 'bp-hashtags-db-version' ) < BP_HASHTAGS_DB_VERSION ) {
        bp_hashtags_install_upgrade() ;
    }
}

register_activation_hook( __FILE__ , 'bp_hashtags_is_installed' ) ;

/**
 * bp_hashtags_install_upgrade()
 *
 * Installs and/or upgrades the database tables
 * This will only run if the database version constant is
 * greater than the stored database version value or no database version found
 * @author Stergatu Eleni <stergatu@cti.gr>
 * @version 1.0, 8/4/2014 now uses add_site_option instead of add_option
 */
function bp_hashtags_install_upgrade() {
    global $wpdb ;
    global $bp ;

    $charset_collate = '' ;
    if ( ! empty( $wpdb->charset ) ) {
        $charset_collate = "DEFAULT CHARACTER SET $wpdb->charset" ;
    }

    //If there is a previous version installed then move the variables to the sitemeta table
    if ( (get_site_option( 'bp-hashtags-db-version' )) && (get_site_option( 'bp-hashtags-db-version' ) < BP_HASHTAGS_DB_VERSION) ) {
        $sql[] = bp_hashtags_tableCreate( $charset_collate ) ;
    }
    if ( ! get_site_option( 'bp-hashtags-db-version' ) ) {
        $sql[] = bp_hashtags_tableCreate( $charset_collate ) ;
        add_site_option( 'bp-hashtags-db-version' , BP_HASHTAGS_DB_VERSION ) ;
    }
    update_site_option( 'bp-hashtags-db-version' , BP_HASHTAGS_DB_VERSION ) ;

    require_once( ABSPATH . "wp-admin/includes/upgrade.php" ) ;
    dbDelta( $sql ) ;
}

/**
 * @author Stergatu Eleni
 * @version 1, 8/4/2014
 */
function bp_hashtags_set_constants() {
    global $bp ;
    if ( ! defined( 'BP_HASHTAGS_TABLE' ) ) {
        define( 'BP_HASHTAGS_TABLE' , $bp->table_prefix . 'bp_hashtags' ) ;
    }
    do_action( 'bp_hashtags_constants_loaded' ) ;
}



?>
