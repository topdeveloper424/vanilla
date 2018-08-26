<?php
if ( !defined( 'BPB_VERSION' ) ) exit;

/**
 * Action Handler
 * @since 1.0
 * @version 1.0
 */
function bpb_handle_actions() {

	if ( !is_user_logged_in() ) return;


	if ( !isset( $_REQUEST['action'] ) || !isset( $_REQUEST['list'] ) || !isset( $_REQUEST['token'] ) || !isset( $_REQUEST['num'] ) ) return;


	switch ( $_REQUEST['action'] ) {
	case 'unblock' :
			if ( wp_verify_nonce( $_REQUEST['token'], 'unblock-' . $_REQUEST['list'] ) ) {
				$current = bpb_get_blocked_users( (int) $_REQUEST['list'] );
				//
					if(isset($_REQUEST['inv']) && $_REQUEST['inv']=='ajax'){

						if (($key = array_search($_REQUEST['num'], $current)) !== false ) {
							    unset($current[$key]);


							update_user_meta( (int) $_REQUEST['list'], '_block', $current );

							do_action( 'bpb_action_unblock', $current );

						$std = new stdClass();
						$std->res = true;
						$std->lnk = bpb_block_link((int) $_REQUEST['list'],$_REQUEST['num'])."&inv=ajax";
						echo json_encode($std);
						unset($_REQUEST['num']);
						unset($_REQUEST['inv']);
						die();
						}

					} else{

						if (isset( $current[ $_REQUEST['num'] ] ) ) {
							    unset($current[ $_REQUEST['num'] ]);
									unset($_REQUEST['num']);
							update_user_meta( (int) $_REQUEST['list'], '_block', $current );

							do_action( 'bpb_action_unblock', $current );
							//
							// bp_core_add_message( __( 'User successfully unblocked', 'bpblock' ) );
							$std = new stdClass();
							$std->res = true; 
							echo json_encode($std);
							unset($_REQUEST['num']);
							unset($_REQUEST['inv']);
							die();

						}
				}
			}
		break;
		case 'block' :


			if ( wp_verify_nonce( $_REQUEST['token'], 'block-' . $_REQUEST['list'] ) ) {


				$current = bpb_get_blocked_users( (int) $_REQUEST['list'] );


				if ( user_can( (int) $_REQUEST['num'], BPB_ADMIN_CAP ) ) {

					if(isset($_REQUEST['inv']) && $_REQUEST['inv']=='ajax'){
						unset($_REQUEST['num']);
						unset($_REQUEST['inv']);

						$std = new stdClass();
						$std->res = false;
						echo json_encode($std);

						die();

					} else{
						bp_core_add_message( __( 'You can not block administrators / moderators', 'bpblock' ), 'error' );

					}

				}
				else {


					$current[] = (int) $_REQUEST['num'];
					update_user_meta( (int) $_REQUEST['list'], '_block', $current );

					do_action( 'bpb_action_block', $current );

					if(isset($_REQUEST['inv']) && $_REQUEST['inv']=='ajax'){

							unset($_REQUEST['inv']);

						$std = new stdClass();
						$std->res = true;
						$std->lnk = bpb_unblock_link((int) $_REQUEST['list'],$_REQUEST['num'])."&inv=ajax";
						echo json_encode($std);
							unset($_REQUEST['num']);
						die();

					}else{
						bp_core_add_message( __( 'User successfully blocked', 'bpblock' ) );
					}

				}
			}

		break;
		default :
			do_action( 'bpb_action' );
		break;
	}

	wp_safe_redirect( remove_query_arg( array( 'action', 'list', 'num', 'token' ) ) );
	exit();
}

/**
 * Add Block Button in Members List
 * @since 1.0
 * @version 1.0
 */
function bpb_insert_block_button_loop() {
	if ( !is_user_logged_in() ) return;
	$user_id = bp_loggedin_user_id() ;
	$member_id = bp_get_member_user_id();
	if ( $user_id == $member_id || user_can( $member_id, BPB_ADMIN_CAP ) ) return;

		$list = bpb_get_blocked_users( $user_id );

		if(!in_array( $member_id, (array) $list)){
		echo '<div class="generic-button block-this-user"><a data-ref ="'.bpb_block_link( $user_id, $member_id ).'&inv=ajax" href="#" class="activity-button block">' . __( 'Block', 'bpblock' ) . '</a></div>';
	}else {
			echo '<div class="generic-button block-this-user"><a data-ref ="'.bpb_unblock_link( $user_id, $member_id ).'&inv=ajax" href="#" class="activity-button unblock">' . __( 'Unblock', 'bpblock' ) . '</a></div>';
		}

}

/**
 * Add Block Button in Loop
 * @since 1.0
 * @version 1.0
 */
 //asamir
function bpb_insert_block_button_profile() {

	if ( !is_user_logged_in() ) return;
	$user_id = bp_loggedin_user_id() ;
	$member_id = bp_displayed_user_id();
	if ( $user_id == $member_id || user_can( $member_id, BPB_ADMIN_CAP ) ) return;

	$list = bpb_get_blocked_users( $user_id );
	if(!in_array( $member_id, (array) $list))
		echo '<div class="generic-button block-this-user"><a data-ref ='.bpb_block_link( $user_id, $member_id ).' href="#" class="activity-button block">' . __( 'Block', 'bpblock' ) . '</a></div>';
	else {
		echo '<div class="generic-button block-this-user"><a data-ref ='.bpb_unblock_link( $user_id, $member_id ).' href="#" class="activity-button unblock">' . __( 'Unblock', 'bpblock' ) . '</a></div>';
	}
}

?>
