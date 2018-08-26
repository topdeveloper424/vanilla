<?php
/**
 * BP Follow Core
 *
 * @package BP-Follow
 * @subpackage Core
 */

// Exit if accessed directly
if ( ! defined( 'ABSPATH' ) ) exit;

/**
 * Core class for BP Follow.
 *
 * Extends the {@link BP_Component} class.
 *
 * @package BP-Follow
 * @subpackage Classes
 *
 * @since 1.2
 */
class BP_Recommend_Component extends BP_Component {

	/**
	 * Constructor.
	 *
	 * @global obj $bp BuddyPress instance
	 */
	public function __construct() {
		global $bp;

		// setup misc parameters
		$this->params = array(
			'adminbar_myaccount_order' => apply_filters( 'bp_recommend_nav_position', 71 )
		);

		// register our component as an active component in BP
		$bp->active_components[$this->id] = '1';
	}


	/**
	 * Setup profile / BuddyBar navigation
	 */
	public function setup_nav( $main_nav = array(), $sub_nav = array() ) {
		global $bp;

		// Need to change the user ID, so if we're not on a member page, $counts variable is still calculated
		$user_id = bp_is_user() ? bp_displayed_user_id() : bp_loggedin_user_id();

		// BuddyBar compatibility
		$domain = bp_displayed_user_domain() ? bp_displayed_user_domain() : bp_loggedin_user_domain();

		/** FOLLOWERS NAV ************************************************/

		bp_core_new_nav_item( array(
			'name'                =>  __( 'Recommended', 'bp-recommend' ),
			'slug'                => 'recommended',
			'position'            => $this->params['adminbar_myaccount_order'],
			'screen_function'     => 'bp_recommend_screen',
			'default_subnav_slug' => 'recommend',
			'item_css_id'         => 'recommend-following'
		) );




		/** ACTIVITY SUBNAV **********************************************/

		// Add activity sub nav item
		if ( bp_is_active( 'activity' ) && apply_filters( 'bp_follow_show_activity_subnav', true ) ) {

			bp_core_new_subnav_item( array(
				'name'            => _x( 'Recommended', 'Activity subnav tab', 'bp-recommend' ),
				'slug'            => 'recommend',
				'parent_url'      => trailingslashit( $domain . bp_get_activity_slug() ),
				'parent_slug'     => bp_get_activity_slug(),
				'screen_function' => 'bp_recommend_screen_activity',
				'position'        => 25,
				'item_css_id'     => 'activity-recommend'
			) );
		}

		// BuddyBar compatibility

		do_action( 'bp_follow_setup_nav' );

	}
