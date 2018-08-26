<?php get_header( 'buddypress' ); ?>

	<div id="content">
		<div class="padder">
			<!-- You are blocked! Template -->
			<div id="buddypress">
				<p>&nbsp;</p>
				<h1 style="text-align:center;"><?php _e( 'Blocked Profile', 'bpblock' ); ?></h1>
				<h2 style="text-align:center;"><?php _e( 'You have selected to block this profile', 'bpblock' ); ?></h2>
				<p style="text-align:center;"><a href="<?php echo bp_loggedin_user_domain() . 'settings/blocked/'; ?>" class="button button-large"><?php _e( 'Manage Blocked Users', 'bpblock' ); ?></a><br /><br /><br /><br /><br /></p>
			</div>
		</div>
	</div>

<?php get_footer( 'buddypress' ); ?>
