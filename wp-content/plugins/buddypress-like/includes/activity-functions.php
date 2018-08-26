<?php

// Exit if accessed directly
defined( 'ABSPATH' ) || exit;

/**
 * bp_like_activity_filter()
 *
 * Adds activity stream filter options for 'Update Likes' and 'Blog Post Likes'.
 *
 */

function bp_like_activity_filter(){
  ?>
  <option value="activity_mostliked"><?php _e( 'Top', 'bp-reshare' ); ?></option>
    <option value="activity_recentliked"><?php _e( 'Trending', 'bp-reshare' ); ?></option>

  <?php
}

add_action( 'bp_activity_filter_options' , 'bp_like_activity_filter' );
add_action( 'bp_member_activity_filter_options' , 'bp_like_activity_filter' );
add_action( 'bp_group_activity_filter_options' , 'bp_like_activity_filter' );


function bp_like_post_to_stream( $item_id , $user_id, $group_id ) {
}
function bp_like_activity_querystring_filter( $query_string, $object ) {
  global $bp, $top_filter,  $trending_filter;



  /* single member activities */
  if( strpos( $query_string, 'activity_mostliked' ) ) {
    $top_filter = 1;
    $query_string = str_replace( 'type=activity_mostliked&action=activity_mostliked', '', $query_string );
  } else {
    $top_filter = 0;
  }

    if( strpos( $query_string, 'activity_recentliked' ) ) {
    $trending_filter = 1;
    $query_string = str_replace( 'type=activity_recentliked&action=activity_recentliked', '', $query_string );
  } else {
    $trending_filter = 0;
  }

  return apply_filters( 'bp_like_activity_querystring_filter', $query_string, $object );
}

add_filter( 'bp_ajax_querystring', 'bp_like_activity_querystring_filter', 12, 2  );

function bp_like_most_liked_sql( $sql, $select_sql, $from_sql, $where_sql, $sort, $page = false ) {
  global $wpdb, $top_filter, $bp;

  if( empty( $top_filter ) )
    return $sql;

  $select_sql .= ", am.meta_value";
  $from_sql .=" LEFT JOIN {$bp->activity->table_name_meta} am ON a.id = am.activity_id";
  if(!empty( $where_sql )){
    $where_sql = str_replace('WHERE' , '' , $where_sql);
    $where_sql = "WHERE (".$where_sql.") AND am.meta_key = 'liked_count'";
  }
  $order = " ORDER BY am.meta_value DESC";

  $sql = $select_sql .' '.$from_sql.' '.$where_sql . $order . ' ' . $page ;

  return $sql;
}
add_filter('bp_activity_get_user_join_filter', 'bp_like_most_liked_sql', 10, 7);



function bp_like_recent_liked_sql( $sql, $select_sql, $from_sql, $where_sql, $sort, $page = false ) {
  global $wpdb, $trending_filter, $bp;

  if( empty( $trending_filter ) )
    return $sql;


    $select_sql .= ", am.meta_value";
  $from_sql .=" LEFT JOIN {$bp->activity->table_name_meta} am ON a.id = am.activity_id";
  // $where_sql .= " AND am.meta_key = 'liked_count'";
  if(!empty( $where_sql )){
    $where_sql = str_replace('WHERE' , '' , $where_sql);
    $where_sql = "WHERE (".$where_sql.") AND am.meta_key = 'liked_count'";
  }

  $order = " ORDER BY a.date_recorded + 0 {$sort}";

  $sql = $select_sql .' '.$from_sql.' '.$where_sql . $order . ' ' . $page ;

  return $sql;
}
add_filter('bp_activity_get_user_join_filter', 'bp_like_recent_liked_sql', 10, 7);
