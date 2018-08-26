<?php

// Exit if accessed directly
defined( 'ABSPATH' ) || exit;

/**
 * bp_like_is_liked()
 *
 * Checks to see whether the user has liked a given item.
 *
 */
function bp_like_is_liked( $item_id, $type, $user_id) {

    if ( ! $type || ! $item_id ) {
        return false;
    }

    if ( isset( $user_id ) ) {
        if ( ! $user_id ) {
            $user_id = get_current_user_id();
        }
    }

    if ( $type == 'activity_update'  ) {

        $user_likes = get_user_meta( $user_id , 'bp_liked_activities' , true );

    }

    if ( ! isset( $user_likes ) || ! $user_likes ) {
        return false;
    } elseif ( ! array_key_exists( $item_id , $user_likes ) ) {
        return false;
    } else {
        return true;
    }
}

/**
 * bp_like_add_user_like()
 *
 * Registers that the user likes a given item.
 *
 */
function bp_like_add_user_like( $item_id, $type ) {

    $liked_count = 0;

    if ( ! isset( $user_id ) ) {
        $user_id = get_current_user_id();
    }
    if ( ! $item_id || ! is_user_logged_in() ) {
        return false;
    }

    if ( $type == 'activity_update' ) {

        /* Add to the  users liked activities. */
        $user_likes = get_user_meta( $user_id , 'bp_liked_activities' , true );
        $user_likes[$item_id] = 'activity_liked';
        update_user_meta( $user_id , 'bp_liked_activities' , $user_likes );

        /* Add to the total likes for this activity. */
        $users_who_like = bp_activity_get_meta( $item_id , 'liked_count' , true );
        $users_who_like[$user_id] = 'user_likes';
        bp_activity_update_meta( $item_id , 'liked_count' , $users_who_like );

        $liked_count = count( $users_who_like );
        $group_id = 0;

        // check if this item is in a group or not, assign group id if so
        if ( bp_is_active( 'groups' ) && bp_is_group() ) {
          $group_id = bp_get_current_group_id();
        }

        bp_like_post_to_stream( $item_id , $user_id, $group_id );

    }
    echo bp_like_get_text( 'unlike' );

    if ( $liked_count ) {
        echo ' <span>' . $liked_count . '</span>';
    }
}


/*
 * bp_like_get_some_likes()
 *
 * Description: Returns a defined number of likers, beginning with more recent.
 *
 */
function bp_like_get_some_likes( $id, $type ) {

  if ( $type == 'activity_update' ) {
    $users_who_like = array_keys((array) (bp_activity_get_meta( $id , 'liked_count' , true )));
  }


  if( is_array($users_who_like ) && count( $users_who_like ) >= 1 ){
    rsort( $users_who_like );

$output = '<div><ul>';
    foreach( $users_who_like as $user ) {

      $output .= '<li><a href="'. bp_core_get_userlink( $user, false, true ) .'">'. bp_core_fetch_avatar( array( 'item_id' => $user, 'object' => 'user', 'type' => 'thumb', 'class' => 'avatar reshared', 'width' => '40', 'height' => '40' ) ) .'</a></li>';

      $step += 1;
    }

    $output .= '</ul><br style="clear:both"></div>';

    echo $output;



    }
    }




/**
 *
 * view_who_likes() hook
 * TODO explain better
 *
 */
function view_who_likes( $id,  $type ) {

    do_action( 'bp_like_before_view_who_likes' );

    do_action( 'view_who_likes', $id, $type );

    do_action( 'bp_like_after_view_who_likes' );

}

// TODO comment why this is here
add_action( 'view_who_likes' , 'bp_like_get_some_likes', 10, 2 );
