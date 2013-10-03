-- phpMyAdmin SQL Dump
-- version 2.11.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 12, 2010 at 01:15 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rayzz3`
--

-- --------------------------------------------------------

--
-- Table structure for table `config_data_discussions`
--

DROP TABLE IF EXISTS `config_data_discussions`;
CREATE TABLE IF NOT EXISTS `config_data_discussions` (
  `config_data_id` bigint(20) NOT NULL auto_increment,
  `dim1` varchar(100) NOT NULL,
  `dim2` varchar(100) NOT NULL,
  `dim3` varchar(100) NOT NULL,
  `dim4` varchar(100) NOT NULL,
  `config_value` text NOT NULL,
  `config_type` enum('Int','Real','String','Boolean','Array','Intwithsymbol','Email','Website') NOT NULL default 'String',
  `config_category` varchar(100) NOT NULL,
  `config_section` varchar(100) NOT NULL,
  `config_section_order` int(11) NOT NULL default '100',
  `editable` enum('Yes','No') NOT NULL default 'No',
  `edit_order` int(11) NOT NULL default '999',
  `description` text NOT NULL,
  `help_text` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`config_data_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `config_data_discussions`
--

INSERT INTO `config_data_discussions` (`config_data_id`, `dim1`, `dim2`, `dim3`, `dim4`, `config_value`, `config_type`, `config_category`, `config_section`, `config_section_order`, `editable`, `edit_order`, `description`, `help_text`, `date_added`) VALUES
(1, 'admin', 'discussions', 'add_title', '', '1', 'Boolean', 'discussions', 'discussion_setting', 5, 'Yes', 999, 'Are members allowed to add discussion title', 'Are members allowed to add discussion title', '0000-00-00 00:00:00'),
(2, 'admin', 'discussions', 'title', 'max_allowed', '20', 'Int', 'discussions', 'discussion_setting', 10, 'Yes', 999, 'discussions title max allowed', 'Number of discussion title user can create', '0000-00-00 00:00:00'),
(3, 'admin', 'discussions', 'board', 'max_allowed', '10', 'Int', 'discussions', 'discussion_setting', 15, 'Yes', 999, 'discussions board max allowed', 'Number of boards  user can create in a discussion', '0000-00-00 00:00:00'),
(4, 'admin', 'discussions', 'visibility', 'needed', '0', 'Boolean', 'discussions', 'discussion_setting', 20, 'No', 999, 'Is discussion visibility control needed', 'Is discussion visibility control needed', '0000-00-00 00:00:00'),
(5, 'admin', 'solutions', 'visibility', 'needed', '0', 'Boolean', 'discussions', 'discussion_setting', 30, 'No', 999, 'Is Solutions visibility control needed', 'Is solutions visibility control needed', '0000-00-00 00:00:00'),
(6, 'admin', 'boards', 'visibility', 'needed', '0', 'Boolean', 'discussions', 'discussion_setting', 25, 'No', 999, 'Is Board visibility control needed', 'Is boards visibility control needed', '0000-00-00 00:00:00'),
(7, 'admin', 'discussions', 'auto_publish', 'allowed', '0', 'Boolean', 'discussions', 'discussion_setting', 35, 'Yes', 999, 'Is discussion title auto publish allowed', 'Is discussion title auto publish allowed', '0000-00-00 00:00:00'),
(8, 'admin', 'discussions', 'boards_publish_option', 'allowed', '1', 'Boolean', 'discussions', 'discussion_setting', 40, 'No', 999, 'Is discussion title boards publish allowed', 'Is discussion title boards publish allowed', '0000-00-00 00:00:00'),
(9, 'admin', 'discussions', 'solution_publish_option', 'allowed', '1', 'Boolean', 'discussions', 'discussion_setting', 45, 'No', 999, '', '', '0000-00-00 00:00:00'),
(10, 'admin', 'subscribe', 'discussions', '', '0', 'Boolean', 'discussions', 'discussion_setting', 50, 'No', 999, '', '', '0000-00-00 00:00:00'),
(11, 'admin', 'discussions', 'addthis', '', '0', 'Boolean', 'discussions', 'discussion_setting', 55, 'No', 999, '', '', '0000-00-00 00:00:00'),
(12, 'admin', 'discussions', 'bookmarking', '', '0', 'Boolean', 'discussions', 'discussion_setting', 60, 'No', 999, '', '', '0000-00-00 00:00:00'),
(13, 'admin', 'discussions', 'order', '', 'ASC', 'String', 'discussions', 'discussion_setting', 65, 'No', 999, '', '', '0000-00-00 00:00:00'),
(14, 'html', 'stylesheet', 'screen', 'discussion_file', 'screen_outlook', 'String', 'discussions', 'discussion_setting', 70, 'No', 999, '', '', '0000-00-00 00:00:00'),
(15, 'admin', 'discussions', 'showpopup', '', '1', 'Boolean', 'discussions', 'discussion_setting', 75, 'No', 999, '', '', '0000-00-00 00:00:00'),
(16, 'admin', 'index', 'featured_contributor_count', '', '4', 'Int', 'index', 'general_settings', 5, 'No', 999, '', '', '0000-00-00 00:00:00'),
(17, 'admin', 'index', 'top_contributor_count', '', '3', 'Int', 'index', 'general_settings', 10, 'No', 999, '', '', '0000-00-00 00:00:00'),
(18, 'admin', 'index', 'best_ans_boards_count', '', '5', 'Int', 'index', 'general_settings', 15, 'No', 999, '', '', '0000-00-00 00:00:00'),
(19, 'admin', 'index', 'best_ans_boards_display_count', '', '1', 'Int', 'index', 'general_settings', 20, 'No', 999, '', '', '0000-00-00 00:00:00'),
(20, 'admin', 'index', 'recent_update', '', '10', 'Int', 'index', 'general_settings', 25, 'No', 999, '', '', '0000-00-00 00:00:00'),
(21, 'admin', 'index', 'board_limit', '', '5', 'Int', 'index', 'general_settings', 30, 'No', 999, '', '', '0000-00-00 00:00:00'),
(22, 'admin', 'index', 'best_solution_fadeout_time', '', '3500', 'Int', 'index', 'block_settings', 35, 'Yes', 999, 'Best of Solutions slideshow interval time', 'Best of Solutions slideshow interval time (in milliseconds)', '0000-00-00 00:00:00'),
(23, 'admin', 'index', 'home_module', '', 'discussions', 'String', 'index', 'general_settings', 40, 'No', 999, '', '', '0000-00-00 00:00:00'),
(24, 'admin', 'index', 'recent_boards', '', 'yes', 'String', 'index', 'Home Page Block Settings', 45, 'Yes', 999, 'Recent Boards (''Yes'', ''No'', ''Compulsory'')', 'Recent Boards (''Yes'', ''No'', ''Compulsory'')', '0000-00-00 00:00:00'),
(25, 'admin', 'index', 'popular_boards', '', 'yes', 'String', 'index', 'Home Page Block Settings', 50, 'Yes', 999, 'Popular Boards (''Yes'', ''No'', ''Compulsory'')', 'Popular Boards (''Yes'', ''No'', ''Compulsory'')', '0000-00-00 00:00:00'),
(26, 'admin', 'index', 'recently_solutioned', '', 'yes', 'String', 'index', 'Home Page Block Settings', 55, 'Yes', 999, 'Recently Solutioned (''Yes'', ''No'', ''Compulsory'')', 'Recently Solutioned (''Yes'', ''No'', ''Compulsory'')', '0000-00-00 00:00:00'),
(27, 'admin', 'index', 'boards_with_audios', '', 'no', 'String', 'index', 'general_settings', 60, 'No', 999, '', '', '0000-00-00 00:00:00'),
(28, 'admin', 'index', 'best_of_solution', '', 'yes', 'String', 'index', 'Home Page Block Settings', 65, 'Yes', 999, 'Best of Solutions (''Yes'', ''No'', ''Compulsory'')', 'Best of Solutions (''Yes'', ''No'', ''Compulsory'')', '0000-00-00 00:00:00'),
(29, 'admin', 'index', 'top_discussions', '', 'yes', 'String', 'index', 'Home Page Block Settings', 70, 'Yes', 999, 'Top Discussions (''Yes'', ''No'', ''Compulsory'')', 'Top Discussions (''Yes'', ''No'', ''Compulsory'')', '0000-00-00 00:00:00'),
(30, 'admin', 'discussions', 'index_page', 'limit', '3', 'Int', 'index', 'Home Page Block Limit settings', 75, 'Yes', 999, 'Top discussion limit', 'Top discussion limit', '0000-00-00 00:00:00'),
(31, 'admin', 'index', 'recent_boards_count', '', '1', 'Int', 'index', 'Home Page Block Limit settings', 80, 'Yes', 999, 'Recent boards limit', 'Recent boards limit', '0000-00-00 00:00:00'),
(32, 'admin', 'index', 'popular_boards_count', '', '3', 'Int', 'index', 'Home Page Block Limit settings', 85, 'Yes', 999, 'Popular boards limit', 'Popular boards limit', '0000-00-00 00:00:00'),
(33, 'admin', 'index', 'recently_solutioned_count', '', '3', 'Int', 'index', 'Home Page Block Limit settings', 90, 'Yes', 999, 'Recently solutioned boards limit', 'Recently solutioned boards limit', '0000-00-00 00:00:00'),
(34, 'admin', 'index', 'activity', 'show', '1', 'Boolean', 'index', 'Activity Log', 95, 'Yes', 999, 'Show recent activities', 'Show recent activities', '0000-00-00 00:00:00'),
(35, 'admin', 'index', 'activity', 'count', '5', 'Int', 'index', 'Activity Log', 100, 'Yes', 999, 'Number of activities to display', 'Number of activities to display', '0000-00-00 00:00:00'),
(36, 'admin', 'index', 'activity', 'show_days', '30', 'Int', 'index', 'Activity Log', 105, 'Yes', 999, 'Number of days for which the activities are to be shown', 'Number of days for which the activities are to be shown', '0000-00-00 00:00:00'),
(38, 'feature', 'wrap_content', '', '', '1', 'Boolean', 'feature', 'feature_settings', 10, 'No', 999, 'Is wrap contents allowed?', 'Do you want to wrap the contents? &lt;br /&gt;(Disabling this feature will collapse the design if content with continuous characters posted). Is it ok', '0000-00-00 00:00:00'),
(39, 'feature', 'display_links', '', '', '5', 'Int', 'feature', 'feature_settings', 35, 'No', 999, '', '', '0000-00-00 00:00:00'),
(40, 'feature', 'display_links_expect', '', '', '10', 'Int', 'feature', 'feature_settings', 35, 'No', 999, '', '', '0000-00-00 00:00:00'),
(41, 'admin', 'view_solutions', 'points', '', '1', 'Int', 'rewards', 'point_settings', 5, 'Yes', 999, 'Points for visiting the site every day', 'Points for visiting the site every day', '0000-00-00 00:00:00'),
(42, 'admin', 'sign_up', 'points', '', '100', 'Int', 'rewards', 'point_settings', 10, 'Yes', 999, 'Points for Signup', 'Points for Signup', '0000-00-00 00:00:00'),
(43, 'admin', 'ask_solutions', 'points', '', '5', 'Int', 'rewards', 'point_settings', 15, 'Yes', 999, 'Points for asking boards', 'Points for asking boards', '0000-00-00 00:00:00'),
(44, 'admin', 'reply_solutions', 'points', '', '5', 'Int', 'rewards', 'point_settings', 20, 'Yes', 999, 'Points for solutioning boards', 'Points for solutioning boards', '0000-00-00 00:00:00'),
(45, 'admin', 'best_solutions', 'points', '', '5', 'Int', 'rewards', 'point_settings', 25, 'Yes', 999, 'Points for best solutions', 'Points for best solutions', '0000-00-00 00:00:00'),
(46, 'admin', 'rate', 'points', '', '1', 'Int', 'rewards', 'point_settings', 30, 'Yes', 999, 'Points for rating', 'Points for rating', '0000-00-00 00:00:00'),
(47, 'admin', 'abuse_boards', 'points', '', '-3', 'Intwithsymbol', 'rewards', 'point_settings', 35, 'Yes', 999, 'Points for abusing boards', 'Points for abusing boards', '0000-00-00 00:00:00'),
(48, 'admin', 'abuse_solutions', 'points', '', '-2', 'Intwithsymbol', 'rewards', 'point_settings', 40, 'Yes', 999, 'Points for abusing solutions', 'Points for abusing solutions', '0000-00-00 00:00:00'),
(49, 'admin', 'user_levels', 'allowed', '', '0', 'Boolean', 'rewards', 'rewards_setting', 45, 'No', 999, '', '', '0000-00-00 00:00:00'),
(50, 'user', 'level_one', 'points', '', '250', 'Int', 'rewards', 'rewards_setting', 50, 'No', 999, '', '', '0000-00-00 00:00:00'),
(51, 'user', 'level_two', 'points', '', '500', 'Int', 'rewards', 'rewards_setting', 55, 'No', 999, '', '', '0000-00-00 00:00:00'),
(52, 'user', 'level_three', 'points', '', '1000', 'Int', 'rewards', 'rewards_setting', 60, 'No', 999, '', '', '0000-00-00 00:00:00'),
(53, 'user', 'level_four', 'points', '', '2000', 'Int', 'rewards', 'rewards_setting', 65, 'No', 999, '', '', '0000-00-00 00:00:00'),
(54, 'user', 'level_five', 'points', '', '4000', 'Int', 'rewards', 'rewards_setting', 70, 'No', 999, '', '', '0000-00-00 00:00:00'),
(55, 'user', 'level_six', 'points', '', '7000', 'Int', 'rewards', 'rewards_setting', 75, 'No', 999, '', '', '0000-00-00 00:00:00'),
(56, 'admin', 'rightbar', 'details', '', '1', 'Boolean', 'sidebar', 'miscellaneous', 5, 'Yes', 999, 'User Status', 'User Status', '0000-00-00 00:00:00'),
(57, 'admin', 'rightbar', 'top_contributors', '', '1', 'Boolean', 'sidebar', 'miscellaneous', 10, 'Yes', 999, 'Top contributors', 'Top contributors', '0000-00-00 00:00:00'),
(58, 'admin', 'rightbar', 'featured_contributors', '', '1', 'Boolean', 'sidebar', 'miscellaneous', 15, 'Yes', 999, 'Featured contributors', 'Featured contributors', '0000-00-00 00:00:00'),
(59, 'admin', 'rightbar', 'featured_board', '', '1', 'Boolean', 'sidebar', 'miscellaneous', 20, 'Yes', 999, 'Featured board', 'Featured board', '0000-00-00 00:00:00'),
(60, 'admin', 'ans_attachments', 'temp_folder', '', 'files/temp_files/ans_temp_attachments/', 'String', 'solutions', 'general_settings', 5, 'No', 999, '', '', '0000-00-00 00:00:00'),
(61, 'admin', 'ans_attachments_path', '', '', 'files/ans_attachments/', 'String', 'solutions', 'general_settings', 10, 'No', 999, '', '', '0000-00-00 00:00:00'),
(62, 'admin', 'category', 'mandatory', '', '1', 'Boolean', 'solutions', 'general_settings', 15, 'No', 999, '', '', '0000-00-00 00:00:00'),
(63, 'admin', 'board', 'category_create', '', '0', 'Boolean', 'solutions', 'general_settings', 20, 'No', 999, '', '', '0000-00-00 00:00:00'),
(64, 'admin', 'description', 'mandatory', '', '1', 'Boolean', 'solutions', 'boards_settings', 25, 'Yes', 999, 'Is details mandatory', 'Is details mandatory', '0000-00-00 00:00:00'),
(65, 'admin', 'board', 'edit', '', '1', 'Boolean', 'solutions', 'boards_settings', 30, 'Yes', 999, 'Is allowed to edit board', 'Is allowed to edit board', '0000-00-00 00:00:00'),
(66, 'admin', 'board', 'delete', '', '1', 'Boolean', 'solutions', 'boards_settings', 35, 'Yes', 999, 'Is allowed to delete board', 'Is allowed to delete board', '0000-00-00 00:00:00'),
(67, 'admin', 'board', 'ratings', '', '1', 'Boolean', 'solutions', 'boards_settings', 40, 'Yes', 999, 'Is allowed to rate board', 'Is allowed to rate board', '0000-00-00 00:00:00'),
(68, 'admin', 'board', 'unrate', '', '1', 'Boolean', 'solutions', 'boards_settings', 45, 'Yes', 999, 'Is allowed to un-rate board', 'Is allowed to un-rate board', '0000-00-00 00:00:00'),
(69, 'admin', 'board', 'point_notification', '', '1', 'Boolean', 'solutions', 'boards_settings', 50, 'Yes', 999, 'Is points notification needed near board submit', 'Is points notification needed near board submit', '0000-00-00 00:00:00'),
(70, 'admin', 'board', 'duplicates', '', '0', 'Boolean', 'solutions', 'boards_settings', 55, 'Yes', 999, 'Is posting similar boards allowed', 'Is posting similar boards allowed', '0000-00-00 00:00:00'),
(71, 'admin', 'board_auto_publish', 'allowed', '', '0', 'Boolean', 'solutions', 'boards_settings', 60, 'Yes', 999, 'Is Auto publish all boards allowed', 'Is Auto publish all boards allowed', '0000-00-00 00:00:00'),
(72, 'admin', 'solution_publish_option', 'allowed', '', '1', 'Boolean', 'solutions', 'general_settings', 65, 'No', 999, '', '', '0000-00-00 00:00:00'),
(73, 'admin', 'read_only_board', 'allowed', '', '1', 'Boolean', 'solutions', 'boards_settings', 70, 'Yes', 999, 'Is allowed to create read only board', 'Is allowed to create read only board', '0000-00-00 00:00:00'),
(74, 'admin', 'best_solutions', 'allowed', '', '1', 'Boolean', 'solutions', 'solutions_settings', 75, 'Yes', 999, 'Is selecting best solutions allowed', 'Is selecting best solutions allowed', '0000-00-00 00:00:00'),
(75, 'admin', 'solutions_comment', 'allowed', '', '1', 'Boolean', 'solutions', 'solutions_settings', 80, 'Yes', 999, 'Is  allowed to reply', 'Is  allowed to reply', '0000-00-00 00:00:00'),
(76, 'admin', 'board_owner_comment_present', 'allowed', '', '0', 'Boolean', 'solutions', 'solutions_settings', 85, 'Yes', 999, 'Is reply allowed only after board owner posted the reply', 'Is reply allowed only after board owner posted the reply', '0000-00-00 00:00:00'),
(77, 'admin', 'only_solution_owner_allowed_to_comment', 'allowed', '', '0', 'Boolean', 'solutions', 'solutions_settings', 90, 'Yes', 999, 'Is solution owner only allowed to reply', 'Is solution owner only allowed to reply', '0000-00-00 00:00:00'),
(78, 'admin', 'delete_comment', 'allowed', '', '1', 'Boolean', 'solutions', 'solutions_settings', 95, 'Yes', 999, 'Is User allowed to delete his replies', 'Is User allowed to delete his replies', '0000-00-00 00:00:00'),
(79, 'admin', 'number_of_comments', 'allowed', '', '2', 'Int', 'solutions', 'solutions_settings', 100, 'Yes', 999, 'Number of replies allowed  for each user', 'Number of replies allowed  for each user', '0000-00-00 00:00:00'),
(80, 'admin', 'hot_board', 'limit', '', '25', 'Int', 'solutions', 'solutions_settings', 110, 'Yes', 999, 'Number of solutions to display a board as hot', 'Number of solutions to display a board as hot', '0000-00-00 00:00:00'),
(81, 'admin', 'solutions', 'point_notification', '', '1', 'Boolean', 'solutions', 'solutions_settings', 120, 'Yes', 999, 'Is points notification needed near solution submit', 'Is points notification needed near solution submit', '0000-00-00 00:00:00'),
(82, 'admin', 'solutions', 'limit', '', '1000', 'Int', 'solutions', 'solutions_settings', 125, 'Yes', 999, 'Number of characters for solution', 'Number of characters for solution', '0000-00-00 00:00:00'),
(83, 'admin', 'quick_solutions', 'limit', '', '500', 'Int', 'solutions', 'general_settings', 130, 'Yes', 999, 'Number of characters for Quick solution', 'Number of characters for Quick solution', '0000-00-00 00:00:00'),
(84, 'admin', 'solution', 'edit', '', '1', 'Boolean', 'solutions', 'solutions_settings', 135, 'Yes', 999, 'Is allowed to edit solution', 'Is allowed to edit solution', '0000-00-00 00:00:00'),
(85, 'admin', 'solution', 'delete', '', '1', 'Boolean', 'solutions', 'solutions_settings', 140, 'Yes', 999, 'Is allowed to delete solution', 'Is allowed to delete solution', '0000-00-00 00:00:00'),
(86, 'admin', 'solution', 'order', '', 'DESC', 'String', 'solutions', 'solutions_settings', 145, 'Yes', 999, 'Solutions display order (DESC/ASC)', 'Solutions display order (DESC/ASC)', '0000-00-00 00:00:00'),
(87, 'admin', 'solution', 'ratings', '', '1', 'Boolean', 'solutions', 'solutions_settings', 150, 'Yes', 999, 'Is allowed to rate solution', 'Is allowed to rate solution', '0000-00-00 00:00:00'),
(88, 'admin', 'solution', 'unrate', '', '1', 'Boolean', 'solutions', 'solutions_settings', 155, 'Yes', 999, 'Is allowed to un-rate solution', 'Is allowed to un-rate solution', '0000-00-00 00:00:00'),
(89, 'admin', 'favorite_soultion', 'allowed', '', '1', 'Boolean', 'solutions', 'solutions_settings', 160, 'Yes', 999, 'Is allowed to add a board as favorite', 'Is allowed to add a board as favorite', '0000-00-00 00:00:00'),
(90, 'admin', 'description', 'limit', '', '1000', 'Int', 'solutions', 'display_settings', 165, 'Yes', 999, 'Number of allowed description characters limit', 'Number of allowed description characters limit', '0000-00-00 00:00:00'),
(91, 'admin', 'popular_days', 'limit', '', '17', 'Int', 'solutions', 'display_settings', 170, 'Yes', 999, 'Number of latest days to show popular board', 'Number of latest days to show popular board', '0000-00-00 00:00:00'),
(92, 'admin', 'ask_solutions', 'allowed', '', '1', 'Boolean', 'solutions', 'display_settings', 175, 'Yes', 999, 'Is points for posting boards allowed', 'Is points for posting boards allowed', '0000-00-00 00:00:00'),
(93, 'admin', 'reply_solutions', 'allowed', '', '1', 'Boolean', 'solutions', 'display_settings', 180, 'Yes', 999, 'Is points for posting solutions allowed', 'Is points for posting solutions allowed', '0000-00-00 00:00:00'),
(94, 'admin', 'related_boards', 'allowed', '', '1', 'Boolean', 'solutions', 'display_settings', 185, 'Yes', 999, 'Is allowed to display related boards', 'Is allowed to display related boards', '0000-00-00 00:00:00'),
(95, 'admin', 'abuse_boards', 'allowed', '', '1', 'Boolean', 'solutions', 'abuse_settings', 190, 'Yes', 999, 'Is abusing boards allowed', 'Is abusing boards allowed', '0000-00-00 00:00:00'),
(96, 'admin', 'abuse_boards_points', 'allowed', '', '1', 'Boolean', 'solutions', 'abuse_settings', 195, 'Yes', 999, 'Is points for abusing boards allowed', 'Is points for abusing boards allowed', '0000-00-00 00:00:00'),
(97, 'admin', 'abuse_solutions', 'allowed', '', '1', 'Boolean', 'solutions', 'abuse_settings', 200, 'Yes', 999, 'Is abusing solutions allowed', 'Is abusing solutions allowed', '0000-00-00 00:00:00'),
(98, 'admin', 'abuse_solutions_points', 'allowed', '', '1', 'Boolean', 'solutions', 'abuse_settings', 205, 'Yes', 999, 'Is points for abusing solutions allowed', 'Is points for abusing solutions allowed', '0000-00-00 00:00:00'),
(99, 'admin', 'attachments_boards', 'allowed', '', '1', 'Boolean', 'solutions', 'attachment_settings', 210, 'Yes', 999, 'Is attachments allowed for Boards', 'Is attachments allowed for Boards', '0000-00-00 00:00:00'),
(100, 'admin', 'attachments_solutions', 'allowed', '', '1', 'Boolean', 'solutions', 'attachment_settings', 215, 'Yes', 999, 'Is attachments allowed for Solutions', 'Is attachments allowed for Solutions', '0000-00-00 00:00:00'),
(101, 'admin', 'attachments_allowed', 'count', '', '20', 'Int', 'solutions', 'attachment_settings', 220, 'Yes', 999, 'Number of attachments allowed', 'Number of attachments allowed', '0000-00-00 00:00:00'),
(102, 'admin', 'attachments', 'format_arr', '', 'jpg, gif, png, bmp, pdf, doc, txt, zip', 'Array', 'solutions', 'attachment_settings', 225, 'Yes', 999, 'Allowed attachment Formats ( Only Image Formats )', 'Allowed attachment Formats ( Only Image Formats )', '0000-00-00 00:00:00'),
(103, 'admin', 'attachments', 'max_size', '', '1000', 'Int', 'solutions', 'attachment_settings', 230, 'Yes', 999, 'Allowed attachments maximum size for each image(KB)', 'Allowed attachments maximum size for each image(KB)', '0000-00-00 00:00:00');


UPDATE config_data_discussions SET dim1 = 'admin', dim2 = 'rightbar', dim3 = 'details', dim4 = '', config_value = '0', config_type = 'Boolean', config_category = 'sidebar', config_section = 'miscellaneous', config_section_order = '5', editable = 'No', edit_order = '999', description = 'User Status', help_text = 'User Status' WHERE dim1 = 'admin' AND dim2 = 'rightbar' AND dim3 = 'details' AND dim4 = '';