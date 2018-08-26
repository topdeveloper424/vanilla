<?php
/**
 * Plugin Name:   Featured Activities for Buddypress
 * Plugin URI:
 * Description:  Featured Activities like ads .
 * Version:      1.0.0
 * Author:       asamir
 * Author URI:   https://www.linkedin.com/in/ahmedsamirabdelkarim
 */

class  BuddypressFeaturedActivity {
    function __construct() {

        $this->constant();
        // initialization
        add_action( 'admin_enqueue_scripts', array(
             $this,
            'admin_scripts'
        ) );
        add_action( 'wp_enqueue_scripts', array(
             $this,
            'front_scripts'
        ) );


        // Compatibility for old default image path.

        add_action( 'admin_menu', array(
             $this,
            'admin_menu'
        ) );
        add_action('admin_bar',array($this,'admin_bar'));
        add_action('admin_bar_menu',array($this,'admin_bar'),300);
    }

    function front_scripts() {
          wp_enqueue_style( 'fp_front_style', plugins_url( 'assets/css/front.css', __FILE__ ), false, FP_POSTS_THUMBNAILS_VERSION );
    }

    function admin_scripts( $page ) {

        if ( 'toplevel_page_fp-posts-thumbnails' === $page ) {
            wp_enqueue_style( 'fp_admin_css', plugins_url( 'assets/css/admin.css', __FILE__ ), false, FP_POSTS_THUMBNAILS_VERSION );
            wp_enqueue_style( 'jquery-ui', 'http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css' );
            wp_enqueue_style( 'wp-color-picker' );
         }

    }
    function constant() {

        define( 'FP_POSTS_THUMBNAILS_VERSION', '1.0.0' );
         define( 'FP_POSTS_THUMBNAILS_PLUGIN_DIR', plugin_dir_path( __FILE__ ) );

    }
    function admin_menu() {

        $page = add_menu_page( __( 'FP Posts Thumbnails', 'fp-posts-thumbnails' ), __( 'Featured Posts', 'FP-posts-thumbnails' ), 'administrator', 'FP-posts-thumbnails', array(
             $this,
            'admin_interface'
        ), 'dashicons-screenoptions' );

    }

    function admin_interface() {

        include_once FP_POSTS_THUMBNAILS_PLUGIN_DIR . '/inc/rpt-settings.php';
    }

}


add_action( 'init', 'BFA_related_posts_thumbnails' );


function fp_promote_activity_update_button( $type = '' ) {
// var_dump(is_super_admin());

    $id=bp_get_activity_id();
     $fp_promote_Expire = bp_activity_get_meta( $id , 'fp_promote_Expire' , true );
      if(empty($fp_promote_Expire) || $fp_promote_Expire < time()){ // draw only if not promoted
          ?>
              <a href="#" class="button bp-primary-action fp_promote <?php echo is_super_admin()? " multiaction ": "" ; ?>" id="promote-activity-<?php echo bp_get_activity_id(); ?>" >
                  Promote
              </a>
              <?php
        }else{
          if(is_super_admin()){
          ?>
          <a href="#" class="button bp-primary-action fp_unpromote" id="promote-activity-<?php echo bp_get_activity_id(); ?>" >
              Unpromote
          </a>
          <?php
        }else{
          ?>
          <a href="#" class="button bp-primary-action disabled"  >
              Promoted
          </a>
          <?php
        }
        }

}

// Filters to display BuddyPress Like button.
add_action( 'bp_activity_entry_meta' , 'fp_promote_activity_update_button' );


function BFA_related_posts_thumbnails() {

    global $related_posts_thumbnails;
    $related_posts_thumbnails = new BuddypressFeaturedActivity();

}

function bp_fp_enqueue_scripts() {

      // echo "<here>";
        wp_register_script( 'bp_fp_promote', plugins_url( 'assets/bp-fp.js',  __FILE__ ), array( 'jquery' ) );
        wp_enqueue_script( 'bp_fp_promote' );

}
add_action( 'wp_enqueue_scripts' , 'bp_fp_enqueue_scripts' );


function bp_fp_activity_class($class) {
  global $activities_template;

  if(isset($GLOBALS['featured_post'])){
    if($activities_template->activity->id == $GLOBALS['featured_post']){
      $class .= ' featured_post';
    }
  }

return $class;
}
add_filter( 'bp_get_activity_css_class', "bp_fp_activity_class" );


function bp_fp_promote_process_ajax() {
// var_dump($_POST);
   // ensuring $id only contains an integer


   if ( $_POST['type'] == 'activity_fp_promote' ) {
     $id = preg_replace( "/\D/" , "" , $_POST['id'] );
     $period_in_min = preg_replace( "/\D/" , "" , $_POST['period_in_min'] );

      if(!is_numeric($period_in_min))
        echo "error" ;
      else {
        $period_in_min = $period_in_min*60;
      }
       $fp_promote_details = bp_activity_get_meta( $id , 'fp_promote' , true );
       $fp_promote_details["creator"] = get_current_user_id();
       $fp_promote_details["createdat"] = time();
       $fp_promote_details["expire_in"] =$period_in_min; //after 60s
       bp_activity_update_meta( $id , 'fp_promote' , $fp_promote_details );
       bp_activity_update_meta( $id , 'fp_promote_Expire' , (int)$fp_promote_details["createdat"]+(int)$fp_promote_details["expire_in"] );
        if(is_super_admin()){
               bp_activity_update_meta( $id , 'fp_promote_type' , 'manual' );
               echo "Unpromote";
        }else{
          bp_activity_update_meta( $id , 'fp_promote_type' , 'ad' );
          echo "promoted";
          }
   }else if ( $_POST['type'] == 'activity_fp_unpromote' ) {
        $id = preg_replace( "/\D/" , "" , $_POST['id'] );
       bp_activity_delete_meta( $id , 'fp_promote'  );
       bp_activity_delete_meta( $id , 'fp_promote_Expire' );
       bp_activity_delete_meta( $id , 'fp_promote_type'  );
       echo "Promote";

   }

   die();

}

add_action( 'wp_ajax_promote_process_ajax' , 'bp_fp_promote_process_ajax' );


?>
