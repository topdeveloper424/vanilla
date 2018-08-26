<?php

// Exit if accessed directly
defined( 'ABSPATH' ) || exit;

/**
 * bp_like_button()
 *
 * Outputs the 'Like/Unlike' button.
 *
 */
function bp_like_button( $type = '' ) {

    /* Set the type if not already set, and check whether we are outputting the button on a blogpost or not. */
    if ( ! $type && ! is_single() ) {

        $type = 'activity';

    } 
    if ( $type == 'activity' || $type == 'activity_update' ) {

        // TODO change this to use hook
        bplike_activity_update_button();

    }
}

// Filters to display BuddyPress Like button.
add_action( 'bp_activity_entry_meta' , 'bplike_activity_update_button' );
