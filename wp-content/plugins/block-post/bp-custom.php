<?php
	/**
function format_activity_date() {
$activityDate=bp_get_activity_date_recorded();
if ($activityDate>strtotime(24))
{
return date("F j, Y", strtotime($activityDate));
}
else
{$activityDate;}

}
add_filter('bp_activity_time_since', 'format_activity_date');
	 */
define('BPFB_THUMBNAIL_IMAGE_SIZE', '900x900');

function blog_posts_by_default( $query_string ) {

global $bp;

if ( !$query_string )

$query_string = '';



if ( (bp_loggedin_user_domain() . bp_get_activity_slug()  ) ) {

if ( strpos( $query_string, 'action' ) == 0 )

$query_string .= '&type=photo_post&action=photo_post';

}



return $query_string;

}

add_filter( 'bp_dtheme_ajax_querystring', 'blog_posts_by_default' );
	
// Prevent Direct Access with homepage redirect

//avoid direct calls to this file
function video_image($url){
    $image_url = parse_url($url);
    if($image_url['host'] == 'www.youtube.com' || $image_url['host'] == 'youtube.com'){
        $array = explode("&", $image_url['query']);
        return "//img.youtube.com/vi/".substr($array[0], 2)."/0.jpg";
    } else if($image_url['host'] == 'www.vimeo.com' || $image_url['host'] == 'vimeo.com'){
        $hash = unserialize(file_get_contents("//vimeo.com/api/v2/video/".substr($image_url['path'], 1).".php"));
        return $hash[0]["thumbnail_small"];
    }
}
if (!function_exists ('add_action')) {
        header('Status: 403 Forbidden');
        header('HTTP/1.1 403 Forbidden');
        exit();
}

if (!defined('DB_NAME'))
{	header('Location: //'.$_SERVER['SERVER_NAME'].'/');}

// Customizable Slug

//define ( 'BP_SEARCH_SLUG', 'find' );

// disable adminbar
show_admin_bar( false );

add_filter( 
    'gettext', // filter name
    'wpse_57673_change_trendr_profile_tabs', // name of your custom function
    10, // priority
    3 // number of arguments you want to get
);
function wpse_57673_change_trendr_profile_tabs( $translated, $original_text, $domain )
{
    if ( 'trendr' !== $domain )
    {
        return $translated; // not your text
    }

    // find the text to change
    switch ( $original_text )
    {
        case 'Activity':
            return 'Posts';

        case 'Profile':
            return 'My Page';
        
        case 'Settings':
            return 'Settings';
        default:
            return $translated;
    }
}

// add order options to members loop


// filter ajax members by contributing
function ch_filter_ajax_querystring( $querystring = '', $object = '' ) {

	if( $object != 'members' )
		return $querystring;

	$defaults = array(
		'type'            => 'active',
		'action'          => 'active',
		'scope'           => 'all',
		'page'            => 1,
		'user_id'         => 0,
		'search_terms'    => '',
		'exclude'         => false,
	);

	$ch_querystring = wp_parse_args( $querystring, $defaults );

	if( $ch_querystring['type'] == 'contributing' ) {
	
// to get members by xprofile field, you need some custom sql here
// here's an example: 
////codex.trendr.org/developer/loops-reference/the-members-loop/#code-examples

		$users = get_users( array( 'fields' => array( 'ID' ), 'role' => 'contributor' ) );
		
		$users_str = '';
		foreach ( $users as $user ) {
	             $users_str .=  $user->ID . ',';
	        }
		$users_str = rtrim($users_str, ",");

		$ch_querystring['include'] = $users_str; 
		$ch_querystring['type'] = 'alphabetical'; 
		
		return $ch_querystring;
		
	}	
	
	else
		return $querystring;
			
}
add_filter( 'bp_ajax_querystring', 'ch_filter_ajax_querystring', 20, 2 );


// jquey google


/**
 * Modify Trnder group search to work on a word-wise basis
 */

define( 'BP_AVATAR_DEFAULT', '//i2.wp.com/trendr.com/wp-content/image.png' );
add_filter('bp_core_fetch_avatar_no_grav', '__return_true');

// Remove admin from directory
add_action('bp_ajax_querystring','bpdev_exclude_users',20,2);
function bpdev_exclude_users($qs=false,$object=false){
 //list of users to exclude
 if (bp_is_active('activity') && function_exists('wp_cache_add_non_persistent_groups'))
    wp_cache_add_non_persistent_groups(array('bp_activity', 'bp_activity_meta'));
 $excluded_user='1';//comma separated ids of users whom you want to exclude
 
 if($object!='members')//hide for members only
 return $qs;
 
 $args=wp_parse_args($qs);
 
 //check if we are listing friends?, do not exclude in this case
 if(!empty($args['user_id']))
 return $qs;
 
 if(!empty($args['exclude']))
 $args['exclude']=$args['exclude'].','.$excluded_user;
 else
 $args['exclude']=$excluded_user;
 
 $qs=build_query($args);
 
 return $qs;
 
}

//Remove admin from member count

add_filter('bp_get_total_member_count','bpdev_members_correct_count');
function bpdev_members_correct_count($count){
$excluded_users_count=1; //change it to the number of users you want to exclude
return $count-$excluded_users_count;
}
// Profanity filter needs WP Content Filter V 2.33
    // ======================================= ==================================
    // REMOVE JUNK FROM HEAD
	
    // =========================================================================
    remove_action('wp_head', 'rsd_link'); // remove really simple discovery link
    remove_action('wp_head', 'wp_generator'); // remove trendr version

    remove_action('wp_head', 'feed_links', 2); // remove rss feed links (make sure you add them in yourself if youre using feedblitz or an rss service)
    remove_action('wp_head', 'feed_links_extra', 3); // removes all extra rss feed links

    remove_action('wp_head', 'index_rel_link'); // remove link to index page
    remove_action('wp_head', 'wlwmanifest_link'); // remove wlwmanifest.xml (needed to support windows live writer)

    remove_action('wp_head', 'start_post_rel_link', 10, 0); // remove random post link
    remove_action('wp_head', 'parent_post_rel_link', 10, 0); // remove parent post link
    remove_action('wp_head', 'adjacent_posts_rel_link', 10, 0); // remove the next and previous post links
    remove_action('wp_head', 'adjacent_posts_rel_link_wp_head', 10, 0 );


/* define the default Profile component */
//define ( 'BP_ENABLE_ROOT_PROFILES', true );
//Profile Link Backend.
add_filter("user_row_actions","link_to_bp_profile",10,2);//hook our link to row actions
function link_to_bp_profile($actions,$user){
$bp_profile_link=bp_core_get_user_domain($user->ID);
$actions["profile"]="<a href='".$bp_profile_link."'>Profile</a>";//hook our link
return $actions;}
//Dashboard Lockdown.
function block_dashboard() {
    $file = basename($_SERVER['PHP_SELF']);
    if (is_user_logged_in() && is_admin() && !current_user_can('edit_posts') && $file != 'admin-ajax.php'){
        wp_redirect( home_url() );
        exit();
    }}
add_action('init', 'block_dashboard');

//Loggin to Profile page.
function trendr_login_redirection($redirect_url,$request_url,$user)
{	global $bp;

		//return bp_core_get_user_domain($user->ID );}
		return   BP_ACTIVITY_SLUG;}
add_filter("login_redirect","trendr_login_redirection",100,3);

//loggedin prevention to terms.
function bp_terms(){
	global $bp;{if(is_user_logged_in() && is_page( enter ))		{
			wp_redirect( $bp->loggedin_user->domain );		}	}
		}
add_action('wp','bp_terms');

//profile_homepage.
function bp_profile_homepage(){
	global $bp;{if(is_user_logged_in() && bp_is_front_page())		{
			wp_redirect( $bp->loggedin_user->domain );		}	}
		}
add_action('wp','bp_profile_homepage');

  // Login via Email
function dr_email_login_authenticate( $user, $username, $password ) {
	if ( is_a( $user, 'WP_User' ) )
		return $user;
	if ( !empty( $username ) ) {
		$username = str_replace( '&', '&amp;', stripslashes( $username ) );
		$user = get_user_by( 'email', $username );
		if ( isset( $user, $user->user_login, $user->user_status ) && 0 == (int) $user->user_status )
			$username = $user->user_login;
	}	return wp_authenticate_username_password( null, $username, $password );
}
remove_filter( 'authenticate', 'wp_authenticate_username_password', 20, 3 );
add_filter( 'authenticate', 'dr_email_login_authenticate', 20, 3 );


// Honepot Spam/ Trnder registration form
class pjbp_honeypot {

	CONST BPPJ_HONEYPOT_NAME	= 'I would not do that!!';
	CONST BPPJ_HONEYPOT_ID		= 'sucka';

	function __construct() {
		add_action( 'bp_after_signup_profile_fields', array( &$this, 'add_honeypot' ) );
		add_filter( 'bp_core_validate_user_signup', array( &$this, 'check_honeypot' ) );
	}

	function add_honeypot() {
		echo '<div style="display: none;">';
		echo '<input type="text" name="'.apply_filters( 'bppj_honeypot_name', self::BPPJ_HONEYPOT_NAME ).'" id="'.apply_filters( 'bppj_honeypot_id', self::BPPJ_HONEYPOT_ID ).'" />';
		echo '</div>';
	}

	function check_honeypot( $result = array() ) {
		global $bp;

		$bppj_honeypot_name = apply_filters( 'bppj_honeypot_name', self::BPPJ_HONEYPOT_NAME );

		if( isset( $_POST[$bppj_honeypot_name] ) && !empty( $_POST[$bppj_honeypot_name] ) )
$result['errors']->add( 'user_name', apply_filters( 'bppj_honeypot_fail_message', __( "Your action is not permitted." ) ) );
		
		return $result;
	}

}
new pjbp_honeypot;
/////////////// Remove All update notice

