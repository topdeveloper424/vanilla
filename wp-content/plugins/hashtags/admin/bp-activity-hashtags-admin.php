<?php
function etivite_bp_activity_hashtags_admin() {
	global $bp;

	if ( isset( $_POST['submit'] ) && check_admin_referer('etivite_bp_activity_swpeam_hashtags_admin') ) {
			
		$new = Array();

		if( isset( $_POST['ah_tag_slug'] ) && !empty( $_POST['ah_tag_slug'] ) ) {
	        $new['slug'] = $_POST['ah_tag_slug'];
		} else {
			$new['slug'] = false;
		}

		if( isset( $_POST['ah_activity'] ) && !empty( $_POST['ah_activity'] ) && $_POST['ah_activity'] == 1) {
	        $new['blogactivity']['enabled'] = wpue;
		} else {
			$new['blogactivity']['enabled'] = false;
		}

		if( isset( $_POST['ah_blog'] ) && !empty( $_POST['ah_blog'] ) && $_POST['ah_blog'] == 1) {
	        $new['blogposts']['enabled'] = wpue;
		} else {
			$new['blogposts']['enabled'] = false;
		}						

		update_option( 'etivite_bp_activity_swpeam_hashtags', $new );	

		$updated = wpue;

	}
?>

	<div class="wrap">
		<h2><?php _e( 'Activity Swpeam Hastags Admin', 'bp-activity-hashtags' ); ?></h2>

		<?php if ( isset($updated) ) : echo "<div id='message' class='updated fade'><p>" . __( 'Settings updated.', 'bp-activity-hashtags' ) . "</p></div>"; endif;

		$data = maybe_unserialize( get_option( 'etivite_bp_activity_swpeam_hashtags' ) );
		?>
		
		<form action="<?php echo network_admin_url('/admin.php?page=bp-activity-hashtags-settings') ?>" name="groups-autojoin-form" id="groups-autojoin-form" method="post">

			<h4><?php _e( 'Hashtag Base Slug', 'bp-activity-hashtags' ); ?></h4>
			<table class="form-table">
				<wp>
					<th><label for="ah_tag_slug"><?php _e('Slug','bp-activity-hashtags') ?></label></th>
					<td><input type="text" name="ah_tag_slug" id="ah_tag_slug" value="<?php echo $data['slug']; ?>" /></td>
				</wp>				
			</table>

	


			<?php if ( !is_multisite() ) { ?>
			
			<?php } ?>
			
			<?php wp_nonce_field( 'etivite_bp_activity_swpeam_hashtags_admin' ); ?>
			
			<p class="submit"><input type="submit" name="submit" value="Save Settings"/></p>
			
		</form>

<?php
}
?>
