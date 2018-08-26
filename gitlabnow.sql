-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 26, 2018 at 02:20 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gitlabnow`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity`
--

CREATE TABLE IF NOT EXISTS `wp_bp_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) NOT NULL,
  `type` varchar(75) NOT NULL,
  `action` text NOT NULL,
  `content` longtext NOT NULL,
  `primary_link` varchar(150) NOT NULL,
  `item_id` varchar(75) NOT NULL,
  `secondary_item_id` varchar(75) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_recorded` (`date_recorded`),
  KEY `user_id` (`user_id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `component` (`component`),
  KEY `type` (`type`),
  KEY `mptt_left` (`mptt_left`),
  KEY `mptt_right` (`mptt_right`),
  KEY `hide_sitewide` (`hide_sitewide`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `wp_bp_activity`
--

INSERT INTO `wp_bp_activity` (`id`, `user_id`, `component`, `type`, `action`, `content`, `primary_link`, `item_id`, `secondary_item_id`, `date_recorded`, `hide_sitewide`, `mptt_left`, `mptt_right`) VALUES
(1, 1, 'groups', 'created_group', '<a href="http://localhost:10086/members/admin/" title="admin">admin</a> created the group <a href="http://localhost:10086/groups/support/">Support</a>', '', 'http://localhost:10086/members/admin/', '1', '', '2018-08-26 10:20:11', 0, 0, 0),
(2, 1, 'activity', 'activity_update', '<a href="http://localhost:10086/members/admin/" title="admin">admin</a> posted an update', 'Hi to everyone...?', 'http://localhost:10086/members/admin/', '', '', '2018-08-26 10:21:39', 0, 0, 0),
(3, 1, 'groups', 'activity_update', '<a href="http://localhost:10086/members/admin/" title="admin">admin</a> posted an update in the group <a href="http://localhost:10086/groups/support/">Support</a>', 'Welcome to the Support Group !', 'http://localhost:10086/members/admin/', '1', '', '2018-08-26 10:30:02', 0, 0, 0),
(4, 1, 'profile', 'new_avatar', '<a href="http://localhost:10086/members/admin/" title="admin">admin</a> changed their profile picture', '', 'http://localhost:10086/members/admin/', '', '', '2018-08-26 10:31:27', 0, 0, 0),
(5, 1, 'activity', 'video_post', '<a href="http://localhost:10086/members/admin/" title="ming ming">ming ming</a>', '\n[bpfb_video]https://www.youtube.com/watch?v=k7olvEeBM2I[/bpfb_video]', 'http://localhost:10086/members/admin/', '', '', '2018-08-26 10:44:24', 0, 0, 0),
(6, 1, 'blogs', 'new_blog_post', '<a href="http://localhost:10086/members/admin/" title="ming ming">ming ming</a> wrote a new post, <a href="http://localhost:10086/archives/1">Hello everybody!</a>', 'Welcome to Vanilla!\r\n\r\nThis site is a social site.', 'http://localhost:10086/archives/1', '1', '1', '2018-08-26 10:45:55', 0, 0, 0),
(7, 1, 'activity', 'video_post', '<a href="http://localhost:10086/members/admin/" title="ming ming">ming ming</a>', '\n[bpfb_video]https://www.youtube.com/watch?v=k7olvEeBM2I[/bpfb_video]', 'http://localhost:10086/members/admin/', '', '', '2018-08-26 10:46:47', 0, 0, 0),
(8, 1, 'activity', 'video_post', '<a href="http://localhost:10086/members/admin/" title="ming ming">ming ming</a>', '\n[bpfb_video]https://www.youtube.com/watch?v=k7olvEeBM2I[/bpfb_video]', 'http://localhost:10086/members/admin/', '', '', '2018-08-26 10:46:59', 0, 0, 0),
(9, 1, 'activity', 'photo_post', '<a href="http://localhost:10086/members/admin/" title="ming ming">ming ming</a>', '\n[bpfb_images]\n1_0-72262300-1535280492_5.jpg\n[/bpfb_images]', 'http://localhost:10086/members/admin/', '', '', '2018-08-26 10:48:12', 0, 0, 0),
(10, 2, 'activity', 'activity_update', '<a href="http://localhost:10086/members/won/" title="won">won</a> posted an update', 'Hi,  I like this site.', 'http://localhost:10086/members/won/', '', '', '2018-08-26 10:58:38', 0, 0, 0),
(11, 2, 'profile', 'new_avatar', '<a href="http://localhost:10086/members/won/" title="won">won</a> changed their profile picture', '', 'http://localhost:10086/members/won/', '', '', '2018-08-26 10:59:56', 0, 0, 0),
(12, 2, 'groups', 'joined_group', '<a href="http://localhost:10086/members/won/" title="won">won</a> joined the group <a href="http://localhost:10086/groups/support/">Support</a>', '', 'http://localhost:10086/members/won/', '1', '', '2018-08-26 11:05:58', 1, 0, 0),
(13, 1, 'activity', 'video_post', '<a href="http://localhost:10086/members/admin/" title="ming ming">ming ming</a>', '\n[bpfb_video]https://www.youtube.com/watch?v=BZcZopuYHc8[/bpfb_video]', 'http://localhost:10086/members/admin/', '', '', '2018-08-26 11:45:06', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `activity_id` (`activity_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `wp_bp_activity_meta`
--

INSERT INTO `wp_bp_activity_meta` (`id`, `activity_id`, `meta_key`, `meta_value`) VALUES
(1, 2, 'activityprivacy', 'public'),
(2, 2, 'favorite_count', '1'),
(3, 3, 'activityprivacy', 'public'),
(4, 5, 'bpfb_blog_id', '1'),
(5, 5, 'activityprivacy', 'public'),
(6, 7, 'bpfb_blog_id', '1'),
(7, 7, 'activityprivacy', 'public'),
(8, 8, 'bpfb_blog_id', '1'),
(9, 8, 'activityprivacy', 'public'),
(10, 9, 'bpfb_blog_id', '1'),
(11, 9, 'activityprivacy', 'public'),
(12, 10, 'activityprivacy', 'public'),
(13, 13, 'bpfb_blog_id', '1'),
(14, 13, 'activityprivacy', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_follow`
--

CREATE TABLE IF NOT EXISTS `wp_bp_follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `leader_id` bigint(20) NOT NULL,
  `follower_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `followers` (`leader_id`,`follower_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_bp_follow`
--

INSERT INTO `wp_bp_follow` (`id`, `leader_id`, `follower_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_friends`
--

CREATE TABLE IF NOT EXISTS `wp_bp_friends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initiator_user_id` bigint(20) NOT NULL,
  `friend_user_id` bigint(20) NOT NULL,
  `is_confirmed` tinyint(1) DEFAULT '0',
  `is_limited` tinyint(1) DEFAULT '0',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `friend_user_id` (`friend_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_bp_friends`
--

INSERT INTO `wp_bp_friends` (`id`, `initiator_user_id`, `friend_user_id`, `is_confirmed`, `is_limited`, `date_created`) VALUES
(1, 1, 2, 0, 0, '2018-08-26 11:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_groups`
--

CREATE TABLE IF NOT EXISTS `wp_bp_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'public',
  `enable_forum` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_id` (`creator_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_bp_groups`
--

INSERT INTO `wp_bp_groups` (`id`, `creator_id`, `name`, `slug`, `description`, `status`, `enable_forum`, `date_created`) VALUES
(1, 1, 'Support', 'support', 'This is the official support group of this Site. You can join this group to get updates on support related issues.', 'public', 0, '2018-08-26 10:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_groups_groupmeta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_groups_groupmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_bp_groups_groupmeta`
--

INSERT INTO `wp_bp_groups_groupmeta` (`id`, `group_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'last_activity', '2018-08-26 11:05:58'),
(2, 1, 'total_member_count', '2'),
(3, 1, 'invite_status', 'members');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_groups_members`
--

CREATE TABLE IF NOT EXISTS `wp_bp_groups_members` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `inviter_id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_mod` tinyint(1) NOT NULL DEFAULT '0',
  `user_title` varchar(100) NOT NULL,
  `date_modified` datetime NOT NULL,
  `comments` longtext NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `invite_sent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `is_admin` (`is_admin`),
  KEY `is_mod` (`is_mod`),
  KEY `user_id` (`user_id`),
  KEY `inviter_id` (`inviter_id`),
  KEY `is_confirmed` (`is_confirmed`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_bp_groups_members`
--

INSERT INTO `wp_bp_groups_members` (`id`, `group_id`, `user_id`, `inviter_id`, `is_admin`, `is_mod`, `user_title`, `date_modified`, `comments`, `is_confirmed`, `is_banned`, `invite_sent`) VALUES
(1, 1, 1, 0, 1, 0, 'Group Admin', '2018-08-26 10:18:42', '', 1, 0, 0),
(2, 1, 2, 0, 0, 0, '', '2018-08-26 11:05:58', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_hashtags`
--

CREATE TABLE IF NOT EXISTS `wp_bp_hashtags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hashtag_name` varchar(255) NOT NULL,
  `hashtag_slug` text NOT NULL,
  `value_id` bigint(20) NOT NULL,
  `taxonomy` varchar(255) DEFAULT '',
  `if_activity_component` varchar(255) DEFAULT '',
  `if_activity_item_id` bigint(20) DEFAULT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `created_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hashtag_name` (`hashtag_name`),
  KEY `taxonomy` (`taxonomy`),
  KEY `if_activity_item_id` (`if_activity_item_id`),
  KEY `if_activity_component` (`if_activity_component`),
  KEY `hide_sitewide` (`hide_sitewide`),
  KEY `user_id` (`user_id`),
  KEY `created_ts` (`created_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_messages`
--

CREATE TABLE IF NOT EXISTS `wp_bp_messages_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `thread_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_notices`
--

CREATE TABLE IF NOT EXISTS `wp_bp_messages_notices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_recipients`
--

CREATE TABLE IF NOT EXISTS `wp_bp_messages_recipients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `unread_count` int(10) NOT NULL DEFAULT '0',
  `sender_only` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `thread_id` (`thread_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sender_only` (`sender_only`),
  KEY `unread_count` (`unread_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_notifications`
--

CREATE TABLE IF NOT EXISTS `wp_bp_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) NOT NULL,
  `component_action` varchar(75) NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `secondary_item_id` (`secondary_item_id`),
  KEY `user_id` (`user_id`),
  KEY `is_new` (`is_new`),
  KEY `component_name` (`component_name`),
  KEY `component_action` (`component_action`),
  KEY `useritem` (`user_id`,`is_new`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_bp_notifications`
--

INSERT INTO `wp_bp_notifications` (`id`, `user_id`, `item_id`, `secondary_item_id`, `component_name`, `component_action`, `date_notified`, `is_new`) VALUES
(1, 2, 1, 0, 'friends', 'friendship_request', '2018-08-26 11:05:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_user_blogs`
--

CREATE TABLE IF NOT EXISTS `wp_bp_user_blogs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `blog_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_bp_user_blogs`
--

INSERT INTO `wp_bp_user_blogs` (`id`, `user_id`, `blog_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_user_blogs_blogmeta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_user_blogs_blogmeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wp_bp_user_blogs_blogmeta`
--

INSERT INTO `wp_bp_user_blogs_blogmeta` (`id`, `blog_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'name', 'vanilla'),
(2, 1, 'description', 'Just Social Website'),
(3, 1, 'last_activity', '2018-08-26 10:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_data`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
(1, 1, 1, 'ming ming', '2018-08-26 10:52:34'),
(2, 2, 1, '1994-04-24 00:00:00', '2018-08-26 10:33:15'),
(3, 3, 1, 'Business Books', '2018-08-26 10:35:03'),
(4, 4, 1, 'James Clear', '2018-08-26 10:35:03'),
(5, 1, 2, 'won', '2018-08-26 10:59:08'),
(6, 2, 2, '1993-11-12 00:00:00', '2018-08-26 10:59:08'),
(7, 3, 2, 'arts Books', '2018-08-26 10:59:36'),
(8, 4, 2, 'galina', '2018-08-26 10:59:36');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_fields`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  `type` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `field_order` (`field_order`),
  KEY `can_delete` (`can_delete`),
  KEY `is_required` (`is_required`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
(1, 1, 0, 'textbox', 'Name', '', 1, 0, 0, 0, '', 0),
(2, 1, 0, 'datebox', 'Date of Birth', 'When were you born?', 1, 0, 1, 0, '', 1),
(3, 2, 0, 'textbox', 'Favourite Books', 'What are your favourite books ?', 0, 0, 1, 0, '', 1),
(4, 2, 0, 'textbox', 'Favourite Author', 'Who is your favourite author ?', 0, 0, 2, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_groups`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` mediumtext NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_delete` (`can_delete`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `group_order`, `can_delete`) VALUES
(1, 'Base', '', 0, 0),
(2, 'Interests', 'Let us know your interests.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_meta`
--

CREATE TABLE IF NOT EXISTS `wp_bp_xprofile_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'http://wordpress.org/', '', '2018-08-26 09:26:36', '2018-08-26 09:26:36', 'Hi, this is a comment.<br />To delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `wp_links`
--

INSERT INTO `wp_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_visible`, `link_owner`, `link_rating`, `link_updated`, `link_rel`, `link_notes`, `link_rss`) VALUES
(1, 'http://codex.wordpress.org/', 'Documentation', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(2, 'http://wordpress.org/news/', 'WordPress Blog', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', 'http://wordpress.org/news/feed/'),
(3, 'http://wordpress.org/extend/ideas/', 'Suggest Ideas', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(4, 'http://wordpress.org/support/', 'Support Forum', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(5, 'http://wordpress.org/extend/plugins/', 'Plugins', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(6, 'http://wordpress.org/extend/themes/', 'Themes', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', ''),
(7, 'http://planet.wordpress.org/', 'WordPress Planet', '', '', '', 'Y', 1, 0, '0000-00-00 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=190 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `blog_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 0, 'siteurl', 'http://localhost:10086', 'yes'),
(2, 0, 'blogname', 'vanilla', 'yes'),
(3, 0, 'blogdescription', 'Just Social Website', 'yes'),
(4, 0, 'users_can_register', '1', 'yes'),
(5, 0, 'admin_email', 'mingOK424@hotmail.com', 'yes'),
(6, 0, 'start_of_week', '1', 'yes'),
(7, 0, 'use_balanceTags', '0', 'yes'),
(8, 0, 'use_smilies', '1', 'yes'),
(9, 0, 'require_name_email', '1', 'yes'),
(10, 0, 'comments_notify', '1', 'yes'),
(11, 0, 'posts_per_rss', '10', 'yes'),
(12, 0, 'rss_use_excerpt', '0', 'yes'),
(13, 0, 'mailserver_url', 'mail.example.com', 'yes'),
(14, 0, 'mailserver_login', 'login@example.com', 'yes'),
(15, 0, 'mailserver_pass', 'password', 'yes'),
(16, 0, 'mailserver_port', '110', 'yes'),
(17, 0, 'default_category', '1', 'yes'),
(18, 0, 'default_comment_status', 'open', 'yes'),
(19, 0, 'default_ping_status', 'open', 'yes'),
(20, 0, 'default_pingback_flag', '1', 'yes'),
(21, 0, 'default_post_edit_rows', '20', 'yes'),
(22, 0, 'posts_per_page', '10', 'yes'),
(23, 0, 'date_format', 'F j, Y', 'yes'),
(24, 0, 'time_format', 'g:i a', 'yes'),
(25, 0, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 0, 'links_recently_updated_prepend', '<em>', 'yes'),
(27, 0, 'links_recently_updated_append', '</em>', 'yes'),
(28, 0, 'links_recently_updated_time', '120', 'yes'),
(29, 0, 'comment_moderation', '0', 'yes'),
(30, 0, 'moderation_notify', '1', 'yes'),
(31, 0, 'permalink_structure', '/archives/%post_id%', 'yes'),
(32, 0, 'gzipcompression', '0', 'yes'),
(33, 0, 'hack_file', '0', 'yes'),
(34, 0, 'blog_charset', 'UTF-8', 'yes'),
(35, 0, 'moderation_keys', '', 'no'),
(36, 0, 'active_plugins', 'a:12:{i:0;s:39:"block-post/bp-activity-block-loader.php";i:1;s:45:"bp-automatic-friends/bp-automatic-friends.php";i:2;s:39:"bp-you-are-blocked/buddypress-block.php";i:3;s:33:"buddypress-activity-plus/bpfb.php";i:4;s:38:"buddypress-activity-privacy/loader.php";i:5;s:35:"buddypress-followers-1.2/loader.php";i:6;s:46:"buddypress-global/buddypress-global-search.php";i:7;s:34:"buddypress-like/bp-like-loader.php";i:8;s:24:"buddypress/bp-loader.php";i:9;s:60:"buddypress_FeaturedActivity/buddypress_featured_activity.php";i:10;s:19:"hashtags/loader.php";i:11;s:39:"iw-magnific-popup/iw-magnific-popup.php";}', 'yes'),
(37, 0, 'home', 'http://localhost:10086', 'yes'),
(38, 0, 'category_base', '', 'yes'),
(39, 0, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(40, 0, 'advanced_edit', '0', 'yes'),
(41, 0, 'comment_max_links', '2', 'yes'),
(42, 0, 'gmt_offset', '0', 'yes'),
(43, 0, 'default_email_category', '1', 'yes'),
(44, 0, 'recently_edited', '', 'no'),
(45, 0, 'template', 'bp-default', 'yes'),
(46, 0, 'stylesheet', 'bp-default', 'yes'),
(47, 0, 'comment_whitelist', '1', 'yes'),
(48, 0, 'blacklist_keys', '', 'no'),
(49, 0, 'comment_registration', '0', 'yes'),
(50, 0, 'rss_language', 'en', 'yes'),
(51, 0, 'html_type', 'text/html', 'yes'),
(52, 0, 'use_trackback', '0', 'yes'),
(53, 0, 'default_role', 'subscriber', 'yes'),
(54, 0, 'db_version', '18226', 'yes'),
(55, 0, 'uploads_use_yearmonth_folders', '1', 'yes'),
(56, 0, 'upload_path', '', 'yes'),
(57, 0, 'blog_public', '1', 'yes'),
(58, 0, 'default_link_category', '2', 'yes'),
(59, 0, 'show_on_front', 'posts', 'yes'),
(60, 0, 'tag_base', '', 'yes'),
(61, 0, 'show_avatars', '1', 'yes'),
(62, 0, 'avatar_rating', 'G', 'yes'),
(63, 0, 'upload_url_path', '', 'yes'),
(64, 0, 'thumbnail_size_w', '150', 'yes'),
(65, 0, 'thumbnail_size_h', '150', 'yes'),
(66, 0, 'thumbnail_crop', '1', 'yes'),
(67, 0, 'medium_size_w', '300', 'yes'),
(68, 0, 'medium_size_h', '300', 'yes'),
(69, 0, 'avatar_default', 'mystery', 'yes'),
(70, 0, 'enable_app', '0', 'yes'),
(71, 0, 'enable_xmlrpc', '0', 'yes'),
(72, 0, 'large_size_w', '1024', 'yes'),
(73, 0, 'large_size_h', '1024', 'yes'),
(74, 0, 'image_default_link_type', 'file', 'yes'),
(75, 0, 'image_default_size', '', 'yes'),
(76, 0, 'image_default_align', '', 'yes'),
(77, 0, 'close_comments_for_old_posts', '0', 'yes'),
(78, 0, 'close_comments_days_old', '14', 'yes'),
(79, 0, 'thread_comments', '1', 'yes'),
(80, 0, 'thread_comments_depth', '5', 'yes'),
(81, 0, 'page_comments', '0', 'yes'),
(82, 0, 'comments_per_page', '50', 'yes'),
(83, 0, 'default_comments_page', 'newest', 'yes'),
(84, 0, 'comment_order', 'asc', 'yes'),
(85, 0, 'sticky_posts', 'a:0:{}', 'yes'),
(86, 0, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(87, 0, 'widget_text', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(88, 0, 'widget_rss', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(89, 0, 'timezone_string', '', 'yes'),
(90, 0, 'embed_autourls', '1', 'yes'),
(91, 0, 'embed_size_w', '', 'yes'),
(92, 0, 'embed_size_h', '600', 'yes'),
(93, 0, 'page_for_posts', '0', 'yes'),
(94, 0, 'page_on_front', '0', 'yes'),
(95, 0, 'default_post_format', '0', 'yes'),
(96, 0, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(97, 0, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 0, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 0, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 0, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 0, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 0, 'sidebars_widgets', 'a:7:{s:19:"wp_inactive_widgets";a:16:{i:0;s:10:"calendar-2";i:1;s:7:"links-2";i:2;s:6:"text-2";i:3;s:5:"rss-2";i:4;s:11:"tag_cloud-2";i:5;s:10:"nav_menu-2";i:6;s:24:"bp_core_members_widget-2";i:7;s:32:"bp_core_recently_active_widget-2";i:8;s:18:"bp_groups_widget-2";i:9;s:28:"bp_follow_following_widget-2";i:10;s:8:"search-2";i:11;s:14:"recent-posts-2";i:12;s:17:"recent-comments-2";i:13;s:10:"archives-2";i:14;s:12:"categories-2";i:15;s:6:"meta-2";}s:9:"sidebar-1";a:3:{i:0;s:28:"bp_core_whos_online_widget-2";i:1;s:18:"bp_groups_widget-3";i:2;s:32:"bp_core_recently_active_widget-3";}s:24:"first-footer-widget-area";a:0:{}s:25:"second-footer-widget-area";a:0:{}s:24:"third-footer-widget-area";a:0:{}s:25:"fourth-footer-widget-area";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(103, 0, 'cron', 'a:4:{i:1535275599;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1535275602;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1535280351;a:1:{s:8:"do_pings";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}s:7:"version";i:2;}', 'yes'),
(104, 0, '_transient_doing_cron', '1535285842', 'yes'),
(105, 0, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 0, 'widget_calendar', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(107, 0, 'widget_links', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(108, 0, 'widget_tag_cloud', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(109, 0, 'widget_nav_menu', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(110, 0, 'widget_widget_twentyeleven_ephemera', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(111, 0, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:1:{i:0;O:8:"stdClass":9:{s:8:"response";s:7:"upgrade";s:8:"download";s:58:"http://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":4:{s:4:"full";s:58:"http://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:10:"no_content";s:69:"http://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip";s:11:"new_bundled";s:70:"http://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip";s:7:"partial";b:0;}s:7:"current";s:5:"4.9.8";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1535275603;s:15:"version_checked";s:5:"3.2.1";}', 'yes'),
(112, 0, '_site_transient_update_plugins', 'O:8:"stdClass":3:{s:12:"last_checked";i:1535283601;s:7:"checked";a:16:{s:19:"akismet/akismet.php";s:5:"2.5.3";s:39:"block-post/bp-activity-block-loader.php";s:5:"0.5.0";s:39:"bp-you-are-blocked/buddypress-block.php";s:8:"1.0Beta5";s:24:"buddypress/bp-loader.php";s:5:"1.5.4";s:33:"buddypress-activity-plus/bpfb.php";s:5:"1.6.4";s:38:"buddypress-activity-privacy/loader.php";s:5:"1.3.8";s:45:"bp-automatic-friends/bp-automatic-friends.php";s:5:"1.6.2";s:35:"buddypress-followers-1.2/loader.php";s:3:"1.2";s:46:"buddypress-global/buddypress-global-search.php";s:5:"1.0.0";s:34:"buddypress-like/bp-like-loader.php";s:5:"0.3.0";s:60:"buddypress_FeaturedActivity/buddypress_featured_activity.php";s:5:"1.0.0";s:19:"hashtags/loader.php";s:5:"0.5.1";s:9:"hello.php";s:3:"1.6";s:39:"iw-magnific-popup/iw-magnific-popup.php";s:7:"1.3.1.1";s:49:"buddypress_recommended/buddypress_recommended.php";s:5:"1.6.5";s:53:"buddypress_recommended/ms2-buddypress_recommended.php";s:5:"1.6.5";}s:8:"response";a:1:{s:35:"buddypress-followers-1.2/loader.php";O:8:"stdClass":12:{s:2:"id";s:34:"w.org/plugins/buddypress-followers";s:4:"slug";s:20:"buddypress-followers";s:6:"plugin";s:35:"buddypress-followers-1.2/loader.php";s:11:"new_version";s:5:"1.2.2";s:3:"url";s:51:"https://wordpress.org/plugins/buddypress-followers/";s:7:"package";s:68:"http://downloads.wordpress.org/plugin/buddypress-followers.1.2.2.zip";s:5:"icons";a:1:{s:7:"default";s:71:"https://s.w.org/plugins/geopattern-icon/buddypress-followers_ffe5b1.svg";}s:7:"banners";a:1:{s:2:"1x";s:74:"https://ps.w.org/buddypress-followers/assets/banner-772x250.png?rev=480551";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:19:"WP 4.4.x / BP 2.5.x";s:12:"requires_php";b:0;s:13:"compatibility";a:0:{}}}}', 'yes'),
(115, 0, '_site_transient_update_themes', 'O:8:"stdClass":3:{s:12:"last_checked";i:1535277482;s:7:"checked";a:3:{s:10:"bp-default";s:5:"1.5.4";s:12:"twentyeleven";s:3:"1.2";s:9:"twentyten";s:3:"1.2";}s:8:"response";a:2:{s:12:"twentyeleven";a:4:{s:5:"theme";s:12:"twentyeleven";s:11:"new_version";s:3:"2.8";s:3:"url";s:42:"https://wordpress.org/themes/twentyeleven/";s:7:"package";s:57:"http://downloads.wordpress.org/theme/twentyeleven.2.8.zip";}s:9:"twentyten";a:4:{s:5:"theme";s:9:"twentyten";s:11:"new_version";s:3:"2.5";s:3:"url";s:39:"https://wordpress.org/themes/twentyten/";s:7:"package";s:54:"http://downloads.wordpress.org/theme/twentyten.2.5.zip";}}}', 'yes'),
(116, 0, '_site_transient_timeout_browser_6874a215c513950818178fc976389744', '1535880405', 'yes'),
(117, 0, '_site_transient_browser_6874a215c513950818178fc976389744', 'a:10:{s:4:"name";s:6:"Chrome";s:7:"version";s:12:"68.0.3440.15";s:8:"platform";s:7:"Windows";s:10:"update_url";s:29:"https://www.google.com/chrome";s:7:"img_src";s:43:"http://s.w.org/images/browsers/chrome.png?1";s:11:"img_src_ssl";s:44:"https://s.w.org/images/browsers/chrome.png?1";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;s:6:"mobile";b:0;}', 'yes'),
(118, 0, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:22:"http://localhost:10086";s:4:"link";s:98:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://localhost:10086/";s:3:"url";s:131:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost:10086/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(120, 0, 'can_compress_scripts', '1', 'yes'),
(121, 0, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1535318806', 'no'),
(122, 0, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<p><strong>RSS Error</strong>: A feed could not be found at http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://localhost:10086/</p>', 'no'),
(123, 0, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1535318807', 'no'),
(124, 0, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Could not open handle for fopen() to http://wordpress.org/news/feed/</p></div>', 'no'),
(125, 0, '_transient_timeout_feed_867bd5c64f85878d03a060509cd2f92c', '1535318808', 'no'),
(126, 0, '_transient_feed_867bd5c64f85878d03a060509cd2f92c', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"WPTavern: WPCampus 2018 Videos Are Now Available to Watch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=83466";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"https://wptavern.com/wpcampus-2018-videos-are-now-available-to-watch";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1710:"<p>WPCampus 2018 was held July 12-14, 2018, at <a href="https://wustl.edu/">Washington University</a> in St. Louis, Missouri. Educators, staff, and those in higher-education gathered to learn how WordPress can be and is used in higher-education environments. </p>\n\n<p>If you couldn&#8217;t attend in person or watch the live stream, you can now watch all of the sessions for free. Visit the event&#8217;s <a href="https://2018.wpcampus.org/schedule/">schedule page</a> and click the Watch Session button. Alternatively, you can click on a session&#8217;s title to read a brief description and then watch the embedded video.</p>\n\n<p>Videos are hosted on YouTube which makes it easy to share and embed them. There are also links to view the presenter&#8217;s slides.</p>\n\n<p>If you have time, I recommend watching <a href="https://2018.wpcampus.org/schedule/gutenready-for-the-gutenpocalypse/">GutenReady for the Gutenpocalypse</a> by Brian DeConinck and Jennifer McFarland who work at North Carolina State University in the Information and Technology Department. </p>\n\n<p>In this presentation, the duo explain what they&#8217;re doing to get staff, students, and campus sites prepared for Gutenberg. <br /></p>\n\n\n\n\n\n<p>In addition to the presentation above, I also recommend listening to <a href="https://wptavern.com/wpweekly-episode-324-getting-nc-state-gutenready">episode 324</a> of WordPress Weekly where McFarland describes their experience so far in transitioning sites to Gutenberg, building custom blocks, and discussing what the future of themes might be like once the project is merged into WordPress. </p>\n\n<p>WPCampus organizers are in the beginning stages of planning next year&#8217;s event. </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Aug 2018 19:10:47 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:115:"WPTavern: Gutenberg and Classic Editor Plugins Pass 200,000 Active Installations, WordPress 4.9.9 Planning Underway";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=83475";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:124:"https://wptavern.com/gutenberg-and-classic-editor-plugins-pass-200000-active-installations-wordpress-4-9-9-planning-underway";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6129:"<a href="https://i2.wp.com/wptavern.com/wp-content/uploads/2018/08/printing-letters.jpg?ssl=1"><img /></a>photo credit: reingestalter <a href="http://www.flickr.com/photos/44668468@N00/115805043">numeral types</a> &#8211; <a href="https://creativecommons.org/licenses/by-sa/2.0/">(license)</a>\n<p>It has been three weeks since the &#8220;Try Gutenberg&#8221; prompt was sent out in WordPress 4.9.8 and the <a href="https://wordpress.org/support/plugin/gutenberg/" rel="noopener noreferrer" target="_blank">plugin</a> has now passed 200,000 active installations. The callout has increased the visibility of the Gutenberg project and brought necessary feedback to the development and design of the new editor.</p>\n<p>Prior to WordPress 4.9.8, Gutenberg reviews held a 2.7-star average on WordPress.org. Negative reviews continue to pour in and the average rating has slipped to 2.3 stars. Users are reporting that the new editor is too complicated, cumbersome, and that it offers an inferior writing experience. A few positive reviews are sprinkled in between, calling the editor a &#8220;necessary step forward,&#8221; and those reviewers seem hopeful that others will feel the same once they get past the learning curve. The vast majority of reviews, both positive and negative, report that Gutenberg&#8217;s interface is not yet intuitive to use.</p>\n<p><a href="https://i0.wp.com/wptavern.com/wp-content/uploads/2018/08/Screen-Shot-2018-08-24-at-10.32.49-AM.png?ssl=1"><img /></a></p>\n<p>The Gutenberg team&#8217;s responses to reviews have improved to be less &#8220;canned&#8221; since the <a href="https://wptavern.com/gutenberg-plugin-garners-mixed-reactions-from-new-wave-of-testers" rel="noopener noreferrer" target="_blank">initial reactions</a> a few days after the Gutenprompt went out. However, the team still appears to be combing the feedback for bugs with the existing interface. Overall, the team&#8217;s responses are unified in a general unwillingness to admit that there are critical flaws preventing the interface from being more well-received.</p>\n<p>Active installations of the <a href="https://wordpress.org/plugins/classic-editor/" rel="noopener noreferrer" target="_blank">Classic Editor</a> plugin, the official antidote for those do not wish to adopt Gutenberg when it ships in WordPress 5.0, have climbed to more than 200,000. This number is about equal to the number of sites that have Gutenberg active. The Gutenberg team does not view Classic Editor installs as an important metric for understanding Gutenberg adoption or rejection but rather see these installs as a healthy intermediary step for sites keeping the same workflow while preparing for Gutenberg.</p>\n<p>In response to recent discussion surrounding the <a href="https://wptavern.com/classicpress-gutenberg-not-included" rel="noopener noreferrer" target="_blank">ClassicPress fork of WordPress</a>, Matt Mullenweg <a href="https://wptavern.com/classicpress-gutenberg-not-included#comment-256813" rel="noopener noreferrer" target="_blank">said</a>, &#8220;No plans to ever have direct vote determine strategic direction in WP, but we are having a bit of a referendum in the adoption of the Gutenberg and Classic Editor plugins, people are voting with their usage. The people are deciding.&#8221;</p>\n<p>This is essentially true in that users can decide if they want to adopt Gutenberg or not, for as long as the Classic Editor is supported. The Classic Editor plugin is an option people demanded but now the reality of two different admin experiences is nearer than before. The notion of a fork, though perhaps not a serious threat to the project, makes it painfully clear what some users are willing to do in order to avoid Gutenberg.</p>\n<p>With the number of Classic Editor plugin installations on the rise, WordPress is headed towards a fractured admin experience. For some it may be a healthy transition option, but in the end, the number of Classic Editor installations indicates how many sites will be running an alternative editing experience because site owners are either not ready or not willing to adopt Gutenberg.</p>\n<p>At some point in the future, WordPress will need to unite the editing experience, either by winning these users over to Gutenberg or by discontinuing support for the Classic Editor. In the meantime, WordPress product developers will need to provide support for both editing experiences or go all in on one or the other. It has the potential to erode WordPress&#8217; momentum for a few years, especially if Gutenberg doesn&#8217;t become more intuitive.</p>\n<h3>WordPress 4.9.9 Is Expected to be a 6-8 Week Maintenance Cycle</h3>\n<p>WordPress contributors met this week to <a href="https://make.wordpress.org/core/2018/08/24/dev-chat-summary-august-22-2018-4-9-9-weeks-1-2/" rel="noopener noreferrer" target="_blank">discuss WordPress 4.9.9</a>.</p>\n<p>&#8220;As of now there’s no specific timeline for 4.9.9,&#8221; Jeff Paul said. &#8220;That will get set once release leads are in place. However, I’d like to try and finalize leads in next week’s meeting or shortly thereafter so that we can begin 4.9.9 planning and coordination as we get into September.&#8221; Paul requested contributor submit nominations for release leads, for themselves or others, ahead of next week&#8217;s meeting.</p>\n<p>&#8220;Until we have a confirmed timeline and plan for 5.0, my assumption is that we’ll continue with our minor release cadence of ~6-8 weeks with specific focus on items needed in support of 5.0,&#8221; Paul said.</p>\n<p>During his announcement at WordCamp Europe in Belgrade, Matt Mullenweg said WordPress 5.0 could happen as early as August. It&#8217;s now looking more likely that 5.0 will drop closer to the end of the year. This gives WordPress users and developers more time to prepare their sites to be compatible with Gutenberg and ready to take advantage of the new features it offers. The <a href="https://make.wordpress.org/core/5-0/" rel="noopener noreferrer" target="_blank">schedule for releasing WordPress 5.0</a> is not yet set but the release is expected to happen in 2018.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Aug 2018 18:55:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:79:"WPTavern: WordCamp Kochi is Postponed to November 3rd Due to Extensive Flooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=83465";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:90:"https://wptavern.com/wordcamp-kochi-is-postponed-to-november-3rd-due-to-extensive-flooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2569:"<p><a href="https://2018.kochi.wordcamp.org/">WordCamp Kochi, India</a>, was originally scheduled for September 2nd, but due to heavy rains and extensive flooding in the area, the event has been <a href="https://2018.kochi.wordcamp.org/wordcamp-kochi-2018-is-postponed-to-november-3rd-2018-saturday/">postponed</a> to November 3rd. The venue is unchanged.<br /></p>\n\n<p>Kochi is located in Southwest India in the coastal state of Kerala. The flooding has been so severe, the Kochi <a href="https://timesofindia.indiatimes.com/city/kochi/kerala-floods-kochi-airport-closure-extended-flights-likely-from-next-wednesday/articleshow/65504855.cms">airport has been shutdown</a> since August 15th due to electrical damage. </p>\n\n<p>In addition to WordCamp being postponed, WooCommerce has also postponed its <a href="https://workshops.automattic.com/?utm_campaign=coschedule&utm_source=twitter&utm_medium=WooCommerce">Women&#8217;s Workshop</a>.</p>\n\n\n<blockquote class="twitter-tweet"><p lang="en" dir="ltr">In light of current events, we''ve decided to postpone the Women''s Workshop. More info to come later today. <a href="https://t.co/TBfGGNWZW0">https://t.co/TBfGGNWZW0</a></p>&mdash; WooCommerce (@WooCommerce) <a href="https://twitter.com/WooCommerce/status/1032533215347712000?ref_src=twsrc%5Etfw">August 23, 2018</a></blockquote>\n\n\n<p>Organizers worked with WordCamp Community Support who agreed that the best course of action was to delay the event.</p>\n\n<blockquote class="wp-block-quote"><p>Besides, one of the ethos of conducting a WordCamp is to ensure a safe space for attendees and participants. Since the state is still recovering from the floods, conducting a big event poses a lot of threats/challenges, like rain-borne diseases, unpredictable weather, etc.</p><cite>Hari Shanker R</cite></blockquote>\n\n<p>Tickets for WordCamp Kochi are <a href="https://2018.kochi.wordcamp.org/tickets/">still available</a> and can be purchased from the event&#8217;s site. Women who use the <strong>WCK18WOMAN</strong> coupon code will receive a 40% discount off the ticket price. There&#8217;s also a <a href="https://2018.kochi.wordcamp.org/discounts/">discounts page</a> with information on other ways you can reduce ticket prices.</p>\n\n<p>Those who purchased tickets for September 2nd can use the same ticket to attend November 3rd. If you purchased tickets for September 2nd and can not attend November 3rd, you&#8217;re encouraged to <a href="https://2018.kochi.wordcamp.org/contact/">contact</a> the event&#8217;s organizers as refunds are not available. <br /></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Aug 2018 18:31:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"Matt: Gulf Coast Soul";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:22:"https://ma.tt/?p=48319";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:38:"https://ma.tt/2018/08/gulf-coast-soul/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:558:"<p>Brett Martin has an excellent longread in GQ, <a href="https://www.gq.com/story/houston-restaurants-capital-of-southern-cool">Houston Is the New Capital Of Southern Cool</a>. I moved to San Francisco when I was 20, I hadn&#8217;t ever even been old enough to drink in Houston, but when I returned in my late twenties and really made it my home I was blown away at how much the city had changed in the time I had been away. Or maybe I just grew up enough to appreciate it. Regardless, Brett captures the verve and paradoxes of the city well.</p>\n\n<p> </p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 23 Aug 2018 22:23:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:90:"WPTavern: New Network Media Library Plugin Creates a Shared Library on a Multisite Network";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:29:"https://wptavern.com/?p=83415";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:101:"https://wptavern.com/new-network-media-library-plugin-creates-a-shared-library-on-a-multisite-network";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3950:"<p>WordPress core committer John Blackbourn has released a new plugin called <a href="https://github.com/johnbillion/network-media-library" rel="noopener noreferrer" target="_blank">Network Media Library</a> that provides a shared media library across all sites on a WordPress multisite network. Blackbourn is an engineer at Human Made and the plugin is one he created for a client by forking Frank Bültge and Dominik Schilling&#8217;s <a href="https://github.com/bueltge/multisite-global-media" rel="noopener noreferrer" target="_blank">Multisite Global Media</a> plugin.</p>\n<p>By default, the plugin uses site ID 2 for the central media library, but the site ID can be customized via a filter hook.  Access to the network-wide library is currently restricted to users who have Author level permissions with the upload_files capability on the central media site. In the plugin&#8217;s description Blackbourn said the plan for future versions is to remove the need for users to be added to the central media library.</p>\n<p>After testing it locally, I discovered what the plugin&#8217;s description meant by &#8220;transparently&#8221; uploading media to the central media site. Unlike other plugins that perform a similar function (i.e. <a href="https://wordpress.org/plugins/network-shared-media/" rel="noopener noreferrer" target="_blank">Network Shared Media</a> and <a href="https://github.com/bueltge/multisite-global-media" rel="noopener noreferrer" target="_blank">Multisite Global Media</a>), there is no indication that files are part of a network-wide library. For example, Multisite Global Media adds a &#8220;Global Media&#8221; tab to the media library to indicate which files are aggregated from sites on the network. The Network Media Library plugin works in an invisible way without adding a separate tab to the media library.</p>\n<p><a href="https://i1.wp.com/wptavern.com/wp-content/uploads/2018/08/Screen-Shot-2018-08-23-at-1.34.56-PM.png?ssl=1"><img /></a></p>\n<p>Frank Bültge, co-author of the Multisite Global Media plugin, asked Blackbourn why he opted to fork the plugin instead of enhancing it. Blackbourn said the main difference is that the original plugin supports local media files and his fork does not.</p>\n<blockquote class="twitter-tweet">\n<p lang="en" dir="ltr">This was my original plan, but the main reason for the fork is the local media support in MGM means some bugs can''t easily be fixed, eg. the featured image problem that we chatted about. The two plugins serve different purposes, MGM supports local media files, NML doesn''t <img src="https://s.w.org/images/core/emoji/11/72x72/1f60a.png" alt="', 'no'),
(127, 0, '_transient_timeout_feed_mod_867bd5c64f85878d03a060509cd2f92c', '1535318808', 'no'),
(128, 0, '_transient_feed_mod_867bd5c64f85878d03a060509cd2f92c', '1535275608', 'no'),
(129, 0, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1535318808', 'no'),
(130, 0, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://wptavern.com/wpcampus-2018-videos-are-now-available-to-watch'' title=''WPCampus 2018 was held July 12-14, 2018, at Washington University in St. Louis, Missouri. Educators, staff, and those in higher-education gathered to learn how WordPress can be and is used in higher-education environments. If you couldn’t attend in person or watch the live stream, you can now watch all of the sessions for free. Visit the event’s schedule pag [&hellip;]''>WPTavern: WPCampus 2018 Videos Are Now Available to Watch</a></li><li><a class=''rsswidget'' href=''https://wptavern.com/gutenberg-and-classic-editor-plugins-pass-200000-active-installations-wordpress-4-9-9-planning-underway'' title=''photo credit: reingestalter numeral types – (license) It has been three weeks since the “Try Gutenberg” prompt was sent out in WordPress 4.9.8 and the plugin has now passed 200,000 active installations. The callout has increased the visibility of the Gutenberg project and brought necessary feedback to the development and design of the new editor. Prior to Wo [&hellip;]''>WPTavern: Gutenberg and Classic Editor Plugins Pass 200,000 Active Installations, WordPress 4.9.9 Planning Underway</a></li><li><a class=''rsswidget'' href=''https://wptavern.com/wordcamp-kochi-is-postponed-to-november-3rd-due-to-extensive-flooding'' title=''WordCamp Kochi, India, was originally scheduled for September 2nd, but due to heavy rains and extensive flooding in the area, the event has been postponed to November 3rd. The venue is unchanged. Kochi is located in Southwest India in the coastal state of Kerala. The flooding has been so severe, the Kochi airport has been shutdown since August 15th due to el [&hellip;]''>WPTavern: WordCamp Kochi is Postponed to November 3rd Due to Extensive Flooding</a></li><li><a class=''rsswidget'' href=''https://ma.tt/2018/08/gulf-coast-soul/'' title=''Brett Martin has an excellent longread in GQ, Houston Is the New Capital Of Southern Cool. I moved to San Francisco when I was 20, I hadn’t ever even been old enough to drink in Houston, but when I returned in my late twenties and really made it my home I was blown away at how much the city had changed in the time I had been away. Or maybe I just grew up eno [&hellip;]''>Matt: Gulf Coast Soul</a></li><li><a class=''rsswidget'' href=''https://wptavern.com/new-network-media-library-plugin-creates-a-shared-library-on-a-multisite-network'' title=''WordPress core committer John Blackbourn has released a new plugin called Network Media Library that provides a shared media library across all sites on a WordPress multisite network. Blackbourn is an engineer at Human Made and the plugin is one he created for a client by forking Frank Bültge and Dominik Schilling’s Multisite Global Media plugin. By default, [&hellip;]''>WPTavern: New Network Media Library Plugin Creates a Shared Library on a Multisite Network</a></li></ul></div>', 'no'),
(131, 0, '_transient_timeout_plugin_slugs', '1535370039', 'no'),
(132, 0, '_transient_plugin_slugs', 'a:16:{i:0;s:19:"akismet/akismet.php";i:1;s:39:"block-post/bp-activity-block-loader.php";i:2;s:39:"bp-you-are-blocked/buddypress-block.php";i:3;s:24:"buddypress/bp-loader.php";i:4;s:33:"buddypress-activity-plus/bpfb.php";i:5;s:38:"buddypress-activity-privacy/loader.php";i:6;s:45:"bp-automatic-friends/bp-automatic-friends.php";i:7;s:35:"buddypress-followers-1.2/loader.php";i:8;s:46:"buddypress-global/buddypress-global-search.php";i:9;s:34:"buddypress-like/bp-like-loader.php";i:10;s:60:"buddypress_FeaturedActivity/buddypress_featured_activity.php";i:11;s:19:"hashtags/loader.php";i:12;s:9:"hello.php";i:13;s:39:"iw-magnific-popup/iw-magnific-popup.php";i:14;s:49:"buddypress_recommended/buddypress_recommended.php";i:15;s:53:"buddypress_recommended/ms2-buddypress_recommended.php";}', 'no'),
(133, 0, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1535318809', 'no'),
(134, 0, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '', 'no'),
(135, 0, '_site_transient_timeout_wporg_theme_feature_list', '1535289965', 'yes'),
(136, 0, '_site_transient_wporg_theme_feature_list', 'a:5:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:7:"Columns";a:6:{i:0;s:10:"one-column";i:1;s:11:"two-columns";i:2;s:13:"three-columns";i:3;s:12:"four-columns";i:4;s:12:"left-sidebar";i:5;s:13:"right-sidebar";}s:8:"Features";a:19:{i:0;s:8:"blavatar";i:1;s:10:"buddypress";i:2;s:17:"custom-background";i:3;s:13:"custom-colors";i:4;s:13:"custom-header";i:5;s:11:"custom-menu";i:6;s:12:"editor-style";i:7;s:21:"featured-image-header";i:8;s:15:"featured-images";i:9;s:15:"flexible-header";i:10;s:20:"front-page-post-form";i:11;s:19:"full-width-template";i:12;s:12:"microformats";i:13;s:12:"post-formats";i:14;s:20:"rtl-language-support";i:15;s:11:"sticky-post";i:16;s:13:"theme-options";i:17;s:17:"threaded-comments";i:18;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}s:5:"Width";a:2:{i:0;s:11:"fixed-width";i:1;s:14:"flexible-width";}}', 'yes'),
(137, 0, 'recently_activated', 'a:1:{s:49:"buddypress_recommended/buddypress_recommended.php";i:1535277768;}', 'yes'),
(140, 0, 'bp-active-components', 'a:9:{s:8:"xprofile";s:1:"1";s:8:"settings";s:1:"1";s:7:"friends";s:1:"1";s:8:"messages";s:1:"1";s:8:"activity";s:1:"1";s:6:"groups";s:1:"1";s:6:"forums";s:1:"1";s:5:"blogs";s:1:"1";s:7:"members";s:1:"1";}', 'yes'),
(141, 0, 'bp-xprofile-base-group-name', 'Base', 'yes'),
(142, 0, 'bp-xprofile-fullname-field-name', 'Name', 'yes'),
(143, 0, 'bp-pages', 'a:6:{s:8:"activity";i:7;s:6:"forums";i:9;s:6:"groups";i:8;s:7:"members";i:6;s:8:"register";i:10;s:8:"activate";i:11;}', 'yes'),
(145, 0, 'template_root', '/plugins/buddypress/bp-themes', 'yes'),
(146, 0, 'stylesheet_root', '/plugins/buddypress/bp-themes', 'yes'),
(147, 0, 'current_theme', 'BuddyPress Default', 'yes'),
(148, 0, 'theme_mods_bp-default', 'a:1:{i:0;b:0;}', 'yes'),
(149, 0, 'bp-db-version', '3820', 'yes'),
(150, 0, 'widget_bp_core_members_widget', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(151, 0, 'widget_bp_core_whos_online_widget', 'a:2:{i:2;a:2:{s:5:"title";s:12:"Who''s Online";s:11:"max_members";s:2:"15";}s:12:"_multiwidget";i:1;}', 'yes'),
(152, 0, 'widget_bp_core_recently_active_widget', 'a:3:{i:2;a:0:{}i:3;a:2:{s:5:"title";s:23:"Recently Active Members";s:11:"max_members";s:2:"15";}s:12:"_multiwidget";i:1;}', 'yes'),
(153, 0, 'widget_bp_groups_widget', 'a:3:{i:2;a:0:{}i:3;a:3:{s:5:"title";s:6:"Groups";s:10:"max_groups";s:1:"5";s:13:"group_default";s:6:"active";}s:12:"_multiwidget";i:1;}', 'yes'),
(154, 0, 'bp-deactivated-components', 's:6:"a:0:{}";', 'yes'),
(155, 0, 'bp-blogs-first-install', '0', 'yes'),
(156, 0, 'bp-disable-blogforum-comments', '0', 'yes'),
(157, 0, 'bp-disable-profile-sync', '0', 'yes'),
(158, 0, 'bp-disable-avatar-uploads', '0', 'yes'),
(159, 0, 'bp-disable-account-deletion', '0', 'yes'),
(161, 0, 'hide-loggedout-adminbar', '0', 'yes'),
(162, 0, 'registration', '0', 'yes'),
(164, 0, 'bpfb_plugin', 'a:1:{s:9:"installed";i:1;}', 'yes'),
(167, 0, 'widget_bp_follow_following_widget', 'a:2:{i:2;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(168, 0, 'bp_like_db_version', '43', 'yes'),
(169, 0, 'bp_like_settings', '', 'yes'),
(170, 0, 'bp-hashtags-db-version', '0.5.1', 'yes'),
(173, 0, 'buddyboss_global_search_plugin_options', 'a:1:{s:15:"items-to-search";a:5:{i:0;s:5:"posts";i:1;s:7:"members";i:2;s:6:"groups";i:3;s:8:"activity";i:4;s:8:"messages";}}', 'yes'),
(178, 0, 'bpfb', 'a:6:{s:5:"theme";s:3:"new";s:9:"alignment";s:4:"left";s:12:"oembed_width";i:450;s:20:"thumbnail_size_width";i:150;s:21:"thumbnail_size_height";i:150;s:14:"cleanup_images";b:0;}', 'yes'),
(179, 0, 'feature_post_rate', '5', 'yes'),
(180, 0, 'category_children', 'a:0:{}', 'yes'),
(181, 0, '_site_transient_timeout_theme_roots', '1535290752', 'yes'),
(182, 0, '_site_transient_theme_roots', 'a:3:{s:10:"bp-default";s:29:"/plugins/buddypress/bp-themes";s:12:"twentyeleven";s:7:"/themes";s:9:"twentyten";s:7:"/themes";}', 'yes'),
(184, 0, 'bb-config-location', 'D:\\xampp\\htdocs\\vanilla/bb-config.php', 'yes'),
(188, 0, '_transient_random_seed', '40f134a96aca442a8995c33d2069c139', 'yes');
INSERT INTO `wp_options` (`option_id`, `blog_id`, `option_name`, `option_value`, `autoload`) VALUES
(189, 0, 'rewrite_rules', 'a:72:{s:56:"archives/category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:51:"archives/category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:44:"archives/category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:26:"archives/category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:53:"archives/tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:48:"archives/tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:41:"archives/tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:23:"archives/tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:54:"archives/type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:49:"archives/type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:42:"archives/type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:24:"archives/type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:14:".*wp-atom.php$";s:19:"index.php?feed=atom";s:13:".*wp-rdf.php$";s:18:"index.php?feed=rdf";s:13:".*wp-rss.php$";s:18:"index.php?feed=rss";s:14:".*wp-rss2.php$";s:19:"index.php?feed=rss2";s:14:".*wp-feed.php$";s:19:"index.php?feed=feed";s:22:".*wp-commentsrss2.php$";s:34:"index.php?feed=rss2&withcomments=1";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:29:"comments/page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:56:"archives/author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:51:"archives/author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:44:"archives/author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:26:"archives/author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:83:"archives/date/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:78:"archives/date/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:71:"archives/date/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:53:"archives/date/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:70:"archives/date/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:65:"archives/date/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:58:"archives/date/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:40:"archives/date/([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:57:"archives/date/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:52:"archives/date/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:45:"archives/date/([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:27:"archives/date/([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:37:"archives/[0-9]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"archives/[0-9]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"archives/[0-9]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"archives/[0-9]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"archives/[0-9]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"archives/([0-9]+)/trackback/?$";s:28:"index.php?p=$matches[1]&tb=1";s:50:"archives/([0-9]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?p=$matches[1]&feed=$matches[2]";s:45:"archives/([0-9]+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?p=$matches[1]&feed=$matches[2]";s:38:"archives/([0-9]+)/page/?([0-9]{1,})/?$";s:41:"index.php?p=$matches[1]&paged=$matches[2]";s:45:"archives/([0-9]+)/comment-page-([0-9]{1,})/?$";s:41:"index.php?p=$matches[1]&cpage=$matches[2]";s:30:"archives/([0-9]+)(/[0-9]+)?/?$";s:40:"index.php?p=$matches[1]&page=$matches[2]";s:26:"archives/[0-9]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"archives/[0-9]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"archives/[0-9]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"archives/[0-9]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"archives/[0-9]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:25:".+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:".+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:55:".+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:".+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:".+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:18:"(.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:38:"(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:33:"(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:26:"(.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:33:"(.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:18:"(.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 1, '_edit_lock', '1535280356:1'),
(3, 1, '_edit_last', '1'),
(4, 1, '_pingme', '1'),
(5, 1, '_encloseme', '1'),
(6, 1, '_pingme', '1'),
(7, 1, '_encloseme', '1'),
(8, 11, '_edit_lock', '1535283675:1'),
(9, 14, '_wp_attached_file', '2018/08/mov_bbb.mp4'),
(10, 14, '_wp_attachment_metadata', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` text NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-08-26 09:26:36', '2018-08-26 09:26:36', 'Welcome to Vanilla!\r\n\r\nThis site is a social site.', 'Hello everybody!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-08-26 10:45:55', '2018-08-26 10:45:55', '', 0, 'http://localhost:10086/?p=1', 0, 'post', '', 1),
(2, 1, '2018-08-26 09:26:36', '2018-08-26 09:26:36', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickies to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost:10086/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2018-08-26 09:26:36', '2018-08-26 09:26:36', '', 0, 'http://localhost:10086/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-08-26 09:26:45', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-26 09:26:45', '0000-00-00 00:00:00', '', 0, 'http://localhost:10086/?p=3', 0, 'post', '', 0),
(4, 1, '2018-08-26 09:29:57', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-26 09:29:57', '0000-00-00 00:00:00', '', 0, 'http://localhost:10086/?page_id=4', 0, 'page', '', 0),
(5, 1, '2018-08-26 09:34:32', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-26 09:34:32', '0000-00-00 00:00:00', '', 0, 'http://localhost:10086/?p=5', 0, 'post', '', 0),
(6, 1, '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 0, 'http://localhost:10086/?page_id=6', 0, 'page', '', 0),
(7, 1, '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 'Activity', '', 'publish', 'closed', 'closed', '', 'activity', '', '', '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 0, 'http://localhost:10086/?page_id=7', 0, 'page', '', 0),
(8, 1, '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 'Groups', '', 'publish', 'closed', 'closed', '', 'groups', '', '', '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 0, 'http://localhost:10086/?page_id=8', 0, 'page', '', 0),
(9, 1, '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 'Forums', '', 'publish', 'closed', 'closed', '', 'forums', '', '', '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 0, 'http://localhost:10086/?page_id=9', 0, 'page', '', 0),
(10, 1, '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 'Register', '', 'publish', 'closed', 'closed', '', 'register', '', '', '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 0, 'http://localhost:10086/?page_id=10', 0, 'page', '', 0),
(11, 1, '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 'Activate', '', 'publish', 'closed', 'closed', '', 'activate', '', '', '2018-08-26 09:36:22', '2018-08-26 09:36:22', '', 0, 'http://localhost:10086/?page_id=11', 0, 'page', '', 0),
(12, 1, '2018-08-26 09:26:36', '2018-08-26 09:26:36', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision', '', '', '2018-08-26 09:26:36', '2018-08-26 09:26:36', '', 1, 'http://localhost:10086/archives/12', 0, 'revision', '', 0),
(13, 1, '2018-08-26 10:45:51', '2018-08-26 10:45:51', 'Welcome to Vanilla!\r\n\r\nThis site is a social site.', 'Hello everybody!', '', 'inherit', 'open', 'open', '', '1-revision-2', '', '', '2018-08-26 10:45:51', '2018-08-26 10:45:51', '', 1, 'http://localhost:10086/archives/13', 0, 'revision', '', 0),
(14, 1, '2018-08-26 11:43:32', '2018-08-26 11:43:32', '', 'mov_bbb', '', 'inherit', 'open', 'open', '', 'mov_bbb', '', '', '2018-08-26 11:43:32', '2018-08-26 11:43:32', '', 0, 'http://localhost:10086/wp-content/uploads/2018/08/mov_bbb.mp4', 0, 'attachment', 'video/mp4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Blogroll', 'blogroll', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 2, 0),
(2, 2, 0),
(3, 2, 0),
(4, 2, 0),
(5, 2, 0),
(6, 2, 0),
(7, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'link_category', '', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'first_name', 'ming'),
(2, 1, 'last_name', 'ming'),
(3, 1, 'nickname', 'ming ming'),
(4, 1, 'description', 'I am a programmer from HongKong.\r\nMy major technologies is java,php,python,angular,ruby on rails'),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'show_admin_bar_admin', 'true'),
(11, 1, 'aim', ''),
(12, 1, 'yim', ''),
(13, 1, 'jabber', ''),
(14, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}'),
(15, 1, 'wp_user_level', '10'),
(16, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(17, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(18, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(19, 1, 'last_activity', '2018-08-26 12:14:15'),
(20, 1, 'bp_latest_update', 'a:2:{s:2:"id";s:1:"2";s:7:"content";s:18:"Hi to everyone...?";}'),
(21, 1, 'bp_favorite_activities', 'a:1:{i:0;s:1:"2";}'),
(22, 1, 'wp_user-settings', 'm5=o'),
(23, 1, 'wp_user-settings-time', '1535279236'),
(24, 2, 'first_name', 'won'),
(25, 2, 'last_name', ''),
(26, 2, 'nickname', 'won'),
(27, 2, 'description', 'I am a developer from France.\r\nI want your help.'),
(28, 2, 'rich_editing', 'true'),
(29, 2, 'comment_shortcuts', 'false'),
(30, 2, 'admin_color', 'fresh'),
(31, 2, 'use_ssl', '0'),
(32, 2, 'show_admin_bar_front', 'true'),
(33, 2, 'show_admin_bar_admin', 'true'),
(34, 2, 'aim', ''),
(35, 2, 'yim', ''),
(36, 2, 'jabber', ''),
(37, 2, 'wp_capabilities', 'a:1:{s:10:"subscriber";s:1:"1";}'),
(38, 2, 'wp_user_level', '0'),
(39, 2, 'last_activity', '2018-08-26 11:17:49'),
(40, 2, 'bp_latest_update', 'a:2:{s:2:"id";s:2:"10";s:7:"content";s:22:"Hi,  I like this site.";}'),
(41, 2, 'bp_follow_has_notified', 'a:1:{i:0;s:1:"1";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BYMqU.iNh94m2nZoZNjETVwgAT0iUR1', 'admin', 'mingOK424@hotmail.com', '', '2018-08-26 09:26:34', '', 0, 'ming ming'),
(2, 'won', '$P$BTmymqCjbduUvT4/x8RB6IhIB8Ozpp.', 'won', 'wonwon@yahoo.com', '', '2018-08-26 10:50:31', '', 0, 'won');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
