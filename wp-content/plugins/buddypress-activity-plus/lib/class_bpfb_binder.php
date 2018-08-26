<?php
/**
 * Main handler class.
 * Responsible for the overall functionality.
 */
class BpfbBinder {

	/**
	 * Main entry method.
	 *
	 * @access public
	 * @static
	 */
	public static function serve () {
		$me = new BpfbBinder;
		$me->add_hooks();
	}

	/**
	 * Image moving and resizing routine.
	 *
	 * Relies on WP built-in image resizing.
	 *
	 * @param array Image paths to move from temp directory
	 * @return mixed Array of new image paths, or (bool)false on failure.
	 * @access private
	 */
	function move_images ($imgs) {
		if (!$imgs) return false;
		if (!is_array($imgs)) $imgs = array($imgs);

		global $bp;
		$ret = array();

		list($thumb_w,$thumb_h) = Bpfb_Data::get_thumbnail_size();

		$processed = 0;
		foreach ($imgs as $img) {
			$processed++;
			if (BPFB_IMAGE_LIMIT && $processed > BPFB_IMAGE_LIMIT) break; // Do not even bother to process more.
			if (preg_match('!^https?:\/\/!i', $img)) { // Just add remote images
				$ret[] = esc_url($img);
				continue;
			}

			$pfx = $bp->loggedin_user->id . '_' . preg_replace('/[^0-9]/', '-', microtime());
			$tmp_img = realpath(BPFB_TEMP_IMAGE_DIR . $img);
			$new_img = BPFB_BASE_IMAGE_DIR . "{$pfx}_{$img}";
			if (@rename($tmp_img, $new_img)) {
				if (function_exists('wp_get_image_editor')) { // New way of resizing the image
					$image = wp_get_image_editor($new_img);
					if (!is_wp_error($image)) {
						$thumb_filename  = $image->generate_filename('bpfbt');
						$image->resize($thumb_w, $thumb_h, false);

						// Alright, now let's rotate if we can
						if (function_exists('exif_read_data')) {
							$exif = exif_read_data($new_img); // Okay, we now have the data
							if (!empty($exif['Orientation']) && 3 === (int)$exif['Orientation']) $image->rotate(180);
							else if (!empty($exif['Orientation']) && 6 === (int)$exif['Orientation']) $image->rotate(-90);
							else if (!empty($exif['Orientation']) && 8 === (int)$exif['Orientation']) $image->rotate(90);
						}

						$image->save($thumb_filename);
					}
				} else { // Old school fallback
					image_resize($new_img, $thumb_w, $thumb_h, false, 'bpfbt');
				}
				$ret[] = pathinfo($new_img, PATHINFO_BASENAME);
			} else return false; // Rename failure
		}

		return $ret;
	}

	/**
	 * Sanitizes the path and expands it into full form.
	 *
	 * @param string $file Relative file path
	 *
	 * @return mixed Sanitized path, or (bool)false on failure
	 */
	public static function resolve_temp_path ($file) {
		$file = ltrim($file, '/');

		// No subdirs in path, so we can do this quick check too
		if ($file !== basename($file)) return false;

		$tmp_path = trailingslashit(wp_normalize_path(realpath(BPFB_TEMP_IMAGE_DIR)));
		if (empty($tmp_path)) return false;

		$full_path = wp_normalize_path(realpath($tmp_path . $file));
		if (empty($full_path)) return false;

		// Are we still within our defined TMP dir?
		$rx = preg_quote($tmp_path, '/');
		$full_path = preg_match("/^{$rx}/", $full_path)
			? $full_path
			: false
		;
		if (empty($full_path)) return false;

		// Also, does this resolve to an actual file?
		return file_exists($full_path)
			? $full_path
			: false
		;
	}

	/**
	 * Remote page retrieving routine.
	 *
	 * @param string Remote URL
	 * @return mixed Remote page as string, or (bool)false on failure
	 * @access private
	 */
	function get_page_contents ($url) {
		$response = wp_remote_get($url);
		if (is_wp_error($response)) return false;
		return $response['body'];
	}

	/**
	 * Introduces `plugins_url()` and other significant URLs as root variables (global).
	 */
	function js_plugin_url () {
		$data = apply_filters(
			'bpfb_js_data_object',
			array(
				'root_url' => BPFB_PLUGIN_URL,
				'temp_img_url' => BPFB_TEMP_IMAGE_URL,
				'base_img_url' => BPFB_BASE_IMAGE_URL,
				'theme' => Bpfb_Data::get('theme', 'default'),
				'alignment' => Bpfb_Data::get('alignment', 'left'),
			)
		);
		printf('<script type="text/javascript">var _bpfb_data=%s;</script>', json_encode($data));
		if ('default' != $data['theme'] && !current_theme_supports('bpfb_toolbar_icons')) {
			$url = BPFB_PLUGIN_URL;
			echo <<<EOFontIconCSS
<style type="text/css">
@font-face {
	font-family: 'bpfb';
	src:url('{$url}/css/external/font/bpfb.eot');
	src:url('{$url}/css/external/font/bpfb.eot?#iefix') format('embedded-opentype'),
		url('{$url}/css/external/font/bpfb.woff') format('woff'),
		url('{$url}/css/external/font/bpfb.ttf') format('truetype'),
		url('{$url}/css/external/font/bpfb.svg#icomoon') format('svg');
	font-weight: normal;
	font-style: normal;
}
</style>
EOFontIconCSS;
		}
	}

	/**
	 * Loads needed scripts and l10n strings for JS.
	 */
	function js_load_scripts () {
		wp_enqueue_script('jquery');
		wp_enqueue_script('thickbox');
		if (!current_theme_supports('bpfb_file_uploader')) {
			wp_enqueue_script('file_uploader', BPFB_PLUGIN_URL . '/js/external/fileuploader.js', array('jquery'));
		}
		wp_enqueue_script('bpfb_interface_script', BPFB_PLUGIN_URL . '/js/bpfb_interface.js', array('jquery'));
		wp_localize_script('bpfb_interface_script', 'l10nBpfb', array(
			'add_photos' => __('Add media', 'bpfb'),
			'add_remote_image' => __('Add image URL', 'bpfb'),
			'add_remote_video' => __('Add video URL', 'bpfb'),
			'add_another_remote_image' => __('Add another image URL', 'bpfb'),
			'add_videos' => __('Add videos', 'bpfb'),
			'add_video' => __('Add video', 'bpfb'),
			'add_links' => __('Add links', 'bpfb'),
			'add_link' => __('Add link', 'bpfb'),
			'add' => __('Add', 'bpfb'),
			'cancel' => __('Cancel', 'bpfb'),
			'preview' => __('Preview', 'bpfb'),
			'drop_files' => __('Drop files here to upload', 'bpfb'),
			'upload_file' => __('Upload a Media file', 'bpfb'),
			'choose_thumbnail' => __('Choose thumbnail', 'bpfb'),
			'no_thumbnail' => __('No thumbnail', 'bpfb'),
			'paste_video_url' => __('Paste video URL here', 'bpfb'),
			'paste_link_url' => __('Paste link here', 'bpfb'),
			'images_limit_exceeded' => sprintf(__("You tried to add too many images, only %d will be posted.", 'bpfb'), BPFB_IMAGE_LIMIT),
			// Variables
			'_max_images' => BPFB_IMAGE_LIMIT,
		));
	}

	/**
	 * Loads required styles.
	 */
	function css_load_styles () {
		wp_enqueue_style('thickbox');
		wp_enqueue_style('file_uploader_style', BPFB_PLUGIN_URL . '/css/external/fileuploader.css');
		if (!current_theme_supports('bpfb_interface_style')) {
			wp_enqueue_style('bpfb_interface_style', BPFB_PLUGIN_URL . '/css/bpfb_interface.css');
		}
		if (!current_theme_supports('bpfb_toolbar_icons')) {
			wp_enqueue_style('bpfb_toolbar_icons', BPFB_PLUGIN_URL . '/css/bpfb_toolbar.css');
		}
	}

	/**
	 * Handles video preview requests.
	 */
	function ajax_preview_video () {
		$url = !empty($_POST['data']) ? esc_url($_POST['data']) : false;
		$url = preg_match('/^https?:\/\//i', $url) ? $url : BPFB_PROTOCOL . $url;
		$warning = __('There has been an error processing your request', 'bpfb');
		$response = $url ? __('Processing...', 'bpfb') : $warning;
		$ret = wp_oembed_get($url);
		echo ($ret ? $ret : $warning);
		exit();
	}

	/**
	 * Handles link preview requests.
	 */
	function ajax_preview_link () {
		$url = !empty($_POST['data']) ? esc_url($_POST['data']) : false;
		$scheme = parse_url($url, PHP_URL_SCHEME);
		if (!$scheme || !preg_match('/^https?$/', $scheme)) {
			$url = "http://{$url}";
		}

		$warning = __('There has been an error processing your request', 'bpfb');
		$response = $url ? __('Processing...', 'bpfb') : $warning;
		$images = array();
		$title = $warning;
		$text = $warning;

		$page = $this->get_page_contents($url);
		if (!function_exists('str_get_html')) require_once(BPFB_PLUGIN_BASE_DIR . '/lib/external/simple_html_dom.php');
		$html = str_get_html($page);
		$str = $html->find('text');

		if ($str) {
			$image_els = $html->find('img');
			foreach ($image_els as $el) {
				if ($el->width > 100 && $el->height > 1) // Disregard spacers
					$images[] = esc_url($el->src);
			}
			$og_image = $html->find('meta[property=og:image]', 0);
			if ($og_image) array_unshift($images, esc_url($og_image->content));

			$title = $html->find('title', 0);
			$title = $title ? $title->plaintext: $url;

			$meta_description = $html->find('meta[name=description]', 0);
			$og_description = $html->find('meta[property=og:description]', 0);
			$first_paragraph = $html->find('p', 0);
			if ($og_description && $og_description->content) $text = $og_description->content;
			else if ($meta_description && $meta_description->content) $text = $meta_description->content;
			else if ($first_paragraph && $first_paragraph->plaintext) $text = $first_paragraph->plaintext;
			else $text = $title;

			$images = array_filter($images);
		} else {
			$url = '';
		}

		header('Content-type: application/json');
		echo json_encode(array(
			"url" => $url,
			"images" => $images,
			"title" => esc_attr($title),
			"text" => esc_attr($text),
		));
		exit();
	}

	/**
	 * Handles image preview requests.
	 * Relies on ./lib/external/file_uploader.php for images upload handling.
	 * Stores images in the temporary storage.
	 */
	function ajax_preview_photo () {
		$dir = BPFB_PLUGIN_BASE_DIR . '/img/';
		if (!class_exists('qqFileUploader')) require_once(BPFB_PLUGIN_BASE_DIR . '/lib/external/file_uploader.php');
		$uploader = new qqFileUploader(self::_get_supported_image_extensions());
		$result = $uploader->handleUpload(BPFB_TEMP_IMAGE_DIR);
		//header('Content-type: application/json'); // For some reason, IE doesn't like this. Skip.
		echo htmlspecialchars(json_encode($result), ENT_NOQUOTES);
		exit();
	}

	/**
	 * Handles remote images preview
	 */
	function ajax_preview_remote_image () {
		header('Content-type: application/json');
		$data = !empty($_POST['data']) ?
			(is_array($_POST['data']) ? array_map('esc_url', $_POST['data']) : esc_url($_POST['data']))
			: false
		;
		echo json_encode($data);
		exit();
	}

	/**
	 * Clears up the temporary images storage.
	 */
	function ajax_remove_temp_images () {
		header('Content-type: application/json');
		parse_str($_POST['data'], $data);
		$data = is_array($data) ? $data : array('bpfb_photos'=>array());
		foreach ($data['bpfb_photos'] as $file) {
			$path = self::resolve_temp_path($file);
			if (!empty($path)) @unlink($path);
		}
		echo json_encode(array('status'=>'ok'));
		exit();
	}

	/**
	 * This is where we actually save the activity update.
	 */
	function ajax_update_activity_contents () {

		$bpfb_code = $activity = '';
		$aid = 0;
		$codec = new BpfbCodec;

		if (!empty($_POST['data'])) {
			if (!empty($_POST['data']['bpfb_video_url'])) {
				$bpfb_code = $codec->create_video_tag($_POST['data']['bpfb_video_url']);
				//added 6-18-18 creating object tag
			    $type = 'video_post';
			}
			if (!empty($_POST['data']['bpfb_link_url'])) {
				$bpfb_code = $codec->create_link_tag(
					$_POST['data']['bpfb_link_url'],
					$_POST['data']['bpfb_link_title'],
					$_POST['data']['bpfb_link_body'],
					$_POST['data']['bpfb_link_image']
				);
				 //added 6-18-18 creating object tag
				 $type = 'web_post';
			}
			if (!empty($_POST['data']['bpfb_photos'])) {

				$images = $this->move_images($_POST['data']['bpfb_photos']);

				$bpfb_code = $codec->create_images_tag($images);
				 //added 6-18-18 creating object tag
				// asamir enable other type of post in video
				 if(!empty($images)&& count($images) == 1){
					 	if(IsVideoFile($images[0])){
								$type = 'video_post';
						}else{
								$type = 'photo_post';
						}

				 }else{
						 $type = 'photo_post';
					 }
			}
		}
	        //Added 6-18-18  gelo location data copatible
	        $place_details = bp_get_option( 'bpchk_temp_location' );

					if(!empty($place_details)){
					            $place           = $place_details['place'];
								$longitude       = $place_details['longitude'];
								$latitude        = $place_details['latitude'];
								$add_as_my_place = $place_details['add_as_my_place'];
									if(isset($place) && !empty($place))
								$location_html = ' <div class=geo-head></div><a class=checkin-loc href="http://maps.google.com/maps/place/' . $place . '/@' . $latitude . ',' . $longitude . '" target="_blank" title="' . $place . '">' . $place . '</a>';
					}

        //removed 6-18-18 creating object tag
		//$bpfb_code = apply_filters('bpfb_code_before_save', $bpfb_code);

		// All done creating tags. Now, save the code
		$gid = !empty($_POST['group_id']) && is_numeric($_POST['group_id'])
			? (int)$_POST['group_id']
			: false
		;


		if ( !empty($bpfb_code)) {

        //removed 6-18-18 creating object tag

        //$content = !empty($_POST['content']) ? $_POST['content'] : '';
		//$content .= "\n{$bpfb_code}";
		//$content = apply_filters('bp_activity_post_update_content', $content);
		//	$aid = $gid ?
		//groups_post_update(array('content' => $content, 'group_id' => $gid))
		//	:
		//bp_activity_post_update(array('content' => $content))
		//	;
			//global $blog_id;

		global $bp;
        //removed 6-18-18 creating geo and hashtag compatible
    	//$content = "\n" . $bpfb_code . @$_POST['content'];
        $content = "\n" . $bpfb_code . @$_POST['content'].   $location_html.$hashtags;
				// var_dump($content);
		$bpfb_code = apply_filters('bpfb_code_before_save', $bpfb_code);
        //Added 6-18-18 hashtag data compatible // line sensetive- do not move from this line
        $pattern = '/(#\w+)/u';
	    preg_match_all( $pattern, $content, $hashtags );


	    if ( $hashtags ) {
		/* Make sure there's only one instance of each tag */
        $hashtags = array_unique( $hashtags[1] );
		//but we need to watch for edits and if something was already wrapped in html link - thus check for space or word boundary prior
		foreach ( ( array ) $hashtags as $hashtag ) {
        $pattern = "/(^|\s|\b)" . $hashtag . "($|\b)/u" ;

     //unicode support???
	//$pattern = '/(#|\\uFF03)([a-z0-9_\\u00c0-\\u00d6\\u00d8-\\u00f6\\u00f8-\\u00ff]+)/i';
	//$pattern = '/(^|[^0-9A-Z&/]+)(#|\uFF03)([0-9A-Z_]*[A-Z_]+[a-z0-9_\\u00c0-\\u00d6\\u00d8-\\u00f6\\u00f8-\\u00ff]*)/i';
	//the twitter pattern
	//"(^|[^0-9A-Z&/]+)(#|\uFF03)([0-9A-Z_]*[A-Z_]+[a-z0-9_\\u00c0-\\u00d6\\u00d8-\\u00f6\\u00f8-\\u00ff]*)"
            $hashtag_noHash = str_replace( "#" , '' , $hashtag ) ;

       $content = str_replace( $hashtag , ' <a href="' . $bp->root_domain . "/" . $bp->activity->slug . "/" . BP_ACTIVITY_HASHTAGS_SLUG . "/" . urlencode( htmlspecialchars( $hashtag_noHash ) ) . '" rel="nofollow" class="hashtag" data-turbolinks="false">' . $hashtag . '</a>', $content ) ;

        }
    }

     //added 6-18-18 creating object tag
	$user_id = $bp->loggedin_user->id;
    $userlink = bp_core_get_userlink( $user_id );

			$aid = $gid ?
         //removed 6-18-18 creating object tag
         //groups_post_update(array('content' => $content, 'group_id' => $gid))
				:
				//bp_activity_post_update(array('content' => $content,          'component' => 'activity',
          //'type' => $type,
         // 'user_id' => $user_id))
			//;
       bp_activity_add(
        array(
          'action' => apply_filters( 'activity_update', sprintf( __( '%s', 'trendr' ), $userlink ), $user_id ),
          'content' => $content,
          'component' => 'activity',
          'type' => $type,
          'user_id' => $user_id,
          'id' => $activity_id
        )
      )
    ;

        global $blog_id;
			// removed 6-18-18
			//bp_activity_update_meta($aid, 'bpfb_blog_id', $blog_id);

            // added 6-18-18 geo locattion caopatible
			bp_activity_update_meta($aid, 'bpfb_blog_id', $blog_id, $activity_id, 'bpchk_place_details', $place_details );
		}

		if ($aid) {

			if(isset($_POST['visibility'])){
					$visibility = esc_attr($_POST['visibility']);
					bp_activity_update_meta( $aid, 'activity-privacy', $visibility );
				}

			ob_start();
			if ( bp_has_activities ( 'include=' . $aid ) ) {
				while ( bp_activities() ) {
					bp_the_activity();
					if (function_exists('bp_locate_template')) bp_locate_template( array( 'activity/entry.php' ), true );
					else locate_template( array( 'activity/entry.php' ), true );
				}
			}
			$activity = ob_get_clean();
            // added 6-18-18 geo locattion caopatible
			delete_option( 'bpchk_temp_location' );
		}
		header('Content-type: application/json');
		echo json_encode(array(
			'code' => $bpfb_code,
			'id' => $aid,
			'activity' => $activity,
		));
		exit();
	}

	function _add_js_css_hooks () {
		if (!is_user_logged_in()) return false;

		global $bp;

		$show_condition = (bool)(
			// Load the scripts on Activity pages
			(defined('BP_ACTIVITY_SLUG') && bp_is_activity_component())
			||
			// Load the scripts when Activity page is the Home page
			(defined('BP_ACTIVITY_SLUG') && 'page' == get_option('show_on_front') && is_front_page() && BP_ACTIVITY_SLUG == get_option('page_on_front'))
			||
			// Load the script on Group home page
			(defined('BP_GROUPS_SLUG') && bp_is_groups_component() && 'home' == $bp->current_action)
			||
			apply_filters('bpfb_injection_additional_condition', false)
		);

		if (apply_filters('bpfb_inject_dependencies', $show_condition)) {
			// Step1: Load JS/CSS requirements
			add_action('wp_enqueue_scripts', array($this, 'js_load_scripts'));
			add_action('wp_print_scripts', array($this, 'js_plugin_url'));
			add_action('wp_print_styles', array($this, 'css_load_styles'));

			do_action('bpfb_add_cssjs_hooks');
		}
	}

	/**
	 * Trigger handler when BuddyPress activity is removed.
	 * @param  array $args BuddyPress activity arguments
	 * @return bool Insignificant
	 */
	function remove_activity_images ($args) {
		if (!is_user_logged_in()) return false;
		if (empty($args['id'])) return false;

		$activity = new BP_Activity_Activity($args['id']);
		if (!is_object($activity) || empty($activity->content)) return false;

		if (!bp_activity_user_can_delete($activity)) return false;
		if (!BpfbCodec::has_images($activity->content)) return false;

		$matches = array();
		preg_match('/\[bpfb_images\](.*?)\[\/bpfb_images\]/s', $activity->content, $matches);
		if (empty($matches[1])) return false;

		$this->_clean_up_content_images($matches[1], $activity);

		return true;
	}

	/**
	 * Callback for activity images removal
	 * @param  string $content Shortcode content parsed for images
	 * @param  BP_Activity_Activity Activity which contains the shortcode - used for privilege check
	 * @return bool
	 */
	private function _clean_up_content_images ($content, $activity) {
		if (!Bpfb_Data::get('cleanup_images')) return false;
		if (!bp_activity_user_can_delete($activity)) return false;

		$images = BpfbCodec::extract_images($content);
		if (empty($images)) return false;

		foreach ($images as $image) {
			$info = pathinfo(trim($image));

			// Make sure we have the info we need
			if (empty($info['filename']) || empty($info['extension'])) continue;

			// Make sure we're dealing with the image
			$ext = strtolower($info['extension']);
			if (!in_array($ext, self::_get_supported_image_extensions())) continue;

			// Construct the filenames
			$thumbnail = bpfb_get_image_dir($activity_blog_id) . $info['filename'] . '-bpfbt.' . $ext;
			$full = bpfb_get_image_dir($activity_blog_id) . trim($image);

			// Actually remove the images
			if (file_exists($thumbnail) && is_writable($thumbnail)) @unlink($thumbnail);
			if (file_exists($full) && is_writable($full)) @unlink($full);
		}
		return true;
	}

	/**
	 * Lists supported image extensions
	 * @return array Supported image extensions
	 */
	 // asamir add support VIDEOS_EXT
	private static function _get_supported_image_extensions () {

		return array_merge(array('jpg', 'jpeg', 'png', 'gif') , $GLOBALS['VIDEOS_EXT']);
	}

	/**
	 * This is where the plugin registers itself.
	 */
	function add_hooks () {
        //Added 6-18-18 creating object tag

        /**
         * Firas Abd Alrahman 2015-09-25
         * Workaround, posting files in ajax hangs chrome if we do not set the
         * contentType: 'multipart/form-data',
         * but setting this will prevent the browser from setting boundry in header
         * so we let the data go to browser without being formated
         * this will make $_POST / $_FILES empty
         * we read the request as stream then refill
         * this make it working for chrome FF ...etc.. and jquery ajax request...
         * and we only implement if we found the $_POST request is empty
         * look src.js script line 2769 function _upload for qq upload handler
         *  **/
        if(!$_POST)
        {
            $input = fopen("php://input", "r");
            $temp = tmpfile();
            $realSize = stream_copy_to_stream($input, $temp);
            fclose($input);

            fseek($temp, 0);
            $request = fread($temp,$realSize);
            parse_str($request,$_POST);
        }
		add_action('init', array($this, '_add_js_css_hooks'));

		// Step2: Add AJAX request handlers
		add_action('wp_ajax_bpfb_preview_video', array($this, 'ajax_preview_video'));
		add_action('wp_ajax_bpfb_preview_link', array($this, 'ajax_preview_link'));
		add_action('wp_ajax_bpfb_preview_photo', array($this, 'ajax_preview_photo'));
		add_action('wp_ajax_bpfb_preview_remote_image', array($this, 'ajax_preview_remote_image'));
		add_action('wp_ajax_bpfb_remove_temp_images', array($this, 'ajax_remove_temp_images'));
		add_action('wp_ajax_bpfb_update_activity_contents', array($this, 'ajax_update_activity_contents'));

		do_action('bpfb_add_ajax_hooks');

		// Step 3: Register and process shortcodes
		BpfbCodec::register();
        //Added 6-18-18 creating object tag

		function bpfb_activity_links_filter() {
			echo '<option value="photo_post">Recent Photos</option>';
			echo '<option value="video_post">Recent Videos</option>';
			//echo '<option value="web_post">Web Posts Only</option>';

		}
		function addcustomerfilter(){
			echo '<ul><li><div id="activity_media_filter">
			 Texts <input type="checkbox" name="group1[]" action="activity_update__new_blog_post__new_blog_comment__new_forum_topic__new_forum_post__created_group__joined_group__friendship_accepted__friendship_created__new_member" />
			 Photos <input type="checkbox" name="group1[]" action="photo_post" />
			 Videos  <input type="checkbox" name="group1[]" action="video_post" />
			 Links  <input type="checkbox" name="group1[]" action="web_post" />
				</div>	</li> </ul>';
		}
			//asamir + add custom div to the main activiy view
 			add_action( 'bp_before_container', 'addcustomerfilter' );

			//asamir - do not inlcude the custom filter for this plus plugin
       // add_action( 'bp_activity_filter_options', 'bpfb_activity_links_filter' );

       add_action( 'bp_member_activity_filter_options', 'bpfb_activity_links_filter' );
		if (Bpfb_Data::get('cleanup_images')) {
			add_action('bp_before_activity_delete', array($this, 'remove_activity_images'));
		}
	}
}
