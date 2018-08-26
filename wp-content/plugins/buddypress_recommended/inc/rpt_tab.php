<li id="activity-recommend">
  <a href="<?php echo bp_loggedin_user_domain() . bp_get_activity_slug() . '/recommend/'; ?>" title="<?php _e( 'Activity that I have been Recommended in.', 'buddypress' ); ?>">
    <?php _e( 'Recommended', 'buddypress' ); ?>
  <?php if ( bp_get_total_mention_count_for_user( bp_loggedin_user_id() ) ) : ?>
    <strong><?php printf( __( '<span>%s new</span>', 'buddypress' ), bp_get_total_mention_count_for_user( bp_loggedin_user_id() ) ); ?></strong>
  <?php endif; ?></a></li>
