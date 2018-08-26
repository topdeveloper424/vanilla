<?php
if ( !defined( 'BPB_VERSION' ) ) exit;

/**
 * Friend Check
 * Removed the Add Friend button if the user is blocking us.
 * @since 1.0
 * @version 1.0
 */
function bpb_friend_check( $status, $user_id ) {
	$list = bpb_get_blocked_users( $user_id );
	if ( in_array( bp_loggedin_user_id(), (array) $list ) ) return false;
	return $status;
}

/**
 * Add Friend Action
 * Replicate the friends_action_add_friend() with a custom check
 * to prevent users from constructing new friendship requests to users
 * who block them. Used since even though the button is not shown, you can still
 * construct a request though the URL.
 * @since 1.0
 * @version 1.0
 */
function bpb_friends_action_add_friend() {
	if ( !bp_is_friends_component() || !bp_is_current_action( 'add-friend' ) )
		return false;

	if ( !$potential_friend_id = (int)bp_action_variable( 0 ) )
		return false;

	if ( $potential_friend_id == bp_loggedin_user_id() )
		return false;

	$list = bpb_get_blocked_users( $potential_friend_id );
	if ( in_array( bp_loggedin_user_id(), $list ) ) return false;

	$friendship_status = BP_Friends_Friendship::check_is_friend( bp_loggedin_user_id(), $potential_friend_id );

	if ( 'not_friends' == $friendship_status ) {

		if ( !check_admin_referer( 'friends_add_friend' ) )
			return false;

		if ( !friends_add_friend( bp_loggedin_user_id(), $potential_friend_id ) ) {
			bp_core_add_message( __( 'Friendship could not be requested.', 'buddypress' ), 'error' );
		} else {
			bp_core_add_message( __( 'Friendship requested', 'buddypress' ) );
		}

	} else if ( 'is_friend' == $friendship_status ) {
		bp_core_add_message( __( 'You are already friends with this user', 'buddypress' ), 'error' );
	} else {
		bp_core_add_message( __( 'You already have a pending friendship request with this user', 'buddypress' ), 'error' );
	}

	bp_core_redirect( wp_get_referer() );

	return false;
}
?>