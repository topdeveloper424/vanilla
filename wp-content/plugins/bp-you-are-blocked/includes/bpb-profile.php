<?php
if ( !defined( 'BPB_VERSION' ) ) exit;

/**
 * Setup BP Navigation
 * @since 1.0
 * @version 1.0
 */
function bpb_setup_navigation() {
	global $bp;

	if ( !is_user_logged_in() || ( !current_user_can( BPB_ADMIN_CAP ) && bp_loggedin_user_id()  != bp_displayed_user_id() ) ) return;

	bp_core_new_subnav_item( array(
		'name'                    => __( 'Blocked Members', 'bpblock' ),
		'slug'                    => 'blocked',
		'parent_url'              => $bp->displayed_user->domain . 'settings/',
		'parent_slug'             => 'settings',
		'screen_function'         => 'bpb_my_blocked_members',
		'show_for_displayed_user' => false
	) );
}

/**
 * Load Blocking Navigation Items
 * @since 1.0
 * @version 1.0
 */
function bpb_my_blocked_members() {
	add_action( 'bp_template_title',   'bpb_my_blocked_title' );
	add_action( 'bp_template_content', 'bpb_my_blocked_members_screen' );
	bp_core_load_template( apply_filters( 'bp_core_template_plugin', 'members/single/plugins' ) );
}

/**
 * Menu Title
 * @since 1.0
 * @version 1.0
 */
function bpb_my_blocked_title() {
	if ( current_user_can( BPB_ADMIN_CAP ) && bp_loggedin_user_id()  != bp_displayed_user_id() )
		echo __( 'Members this user blocks', 'bpblock' );
	else
		echo __( 'Members you currently block', 'bpblock' );
}

/**
 * My Blocked Members Screen
 * @since 1.0
 * @version 1.0
 */
function bpb_my_blocked_members_screen() {
	$profile_id = bp_displayed_user_id();
	$token = wp_create_nonce( 'unblock-' . $profile_id );
	$list = bpb_get_blocked_users( $profile_id );
	if ( empty( $list ) )
		$list[] = 0; ?>

<table class="users-blocked">
	<thead>
		<th class="user" style="width:70%;"><?php _e( 'User', 'bpblock' ); ?></th>
		<th class="actions" style="width:30%;"><?php _e( 'Actions', 'bpblock' ); ?></th>
	</thead>
	<tbody>
<?php

	// Loop though our block list
	foreach ( (array) $list as $num => $user_id ) {
		// Zero means list is empty
		if ( $user_id == 0 ) { ?>

		<tr>
			<td colspan="2"><?php _e( 'No users found', 'bpblock' ); ?></td>
		</tr>
<?php
		}
		// Else get user
		else {
			$user = get_user_by( 'id', $user_id );
			// If user has been removed, remove it from our list as well
			if ( $user === false ) {
				bpb_remove_user_from_list( $profile_id, $user_id );
				continue;
			} ?>

		<tr>
			<td class="user"><?php echo $user->display_name; ?></td>
			<td class="actions"><div class="generic-button block-this-user"><a class="activity-button unblock" href="#" data-ref="<?php echo bpb_unblock_link( $profile_id, $num ); ?>"><?php _e( 'Unblock', 'bpblock' ); ?></a></div></td>
		</tr>
<?php
		}
	}
?>

	</tbody>
</table>
<?php
}

function bpb_setup_tool_bar() {
	// Bail if this is an ajax request
	if ( !bp_use_wp_admin_bar() || defined( 'DOING_AJAX' ) )
		return;

	// Only add menu for logged in user
	if ( is_user_logged_in() ) {
		global $bp, $wp_admin_bar;

		// Add secondary parent item for all BuddyPress components
		$wp_admin_bar->add_menu( array(
			'parent' => 'my-account-settings',
			'id'     => 'my-block-list',
			'title'  => __( 'Blocked Members', 'bpblock' ),
			'href'   => bp_loggedin_user_domain() . 'settings/blocked/'
		) );
	}
}
?>
