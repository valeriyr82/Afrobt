-- phpMyAdmin SQL Dump
-- version 2.11.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 03, 2010 at 06:55 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `framework_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `config_data_blog`
--

DROP TABLE IF EXISTS `config_data_blog`;
CREATE TABLE IF NOT EXISTS `config_data_blog` (
  `config_data_id` bigint(20) NOT NULL default '0',
  `dim1` varchar(100) character set utf8 NOT NULL,
  `dim2` varchar(100) character set utf8 NOT NULL,
  `dim3` varchar(100) character set utf8 NOT NULL,
  `dim4` varchar(100) character set utf8 NOT NULL,
  `config_value` text character set utf8 NOT NULL,
  `config_type` enum('Int','Real','String','Boolean','Array','Intwithsymbol','Email','Website','Textarea') character set utf8 NOT NULL default 'String',
  `config_category` varchar(100) character set utf8 NOT NULL,
  `config_section` varchar(100) character set utf8 NOT NULL,
  `config_section_order` int(11) NOT NULL default '100',
  `editable` enum('Yes','No') character set utf8 NOT NULL default 'No',
  `edit_order` int(11) NOT NULL default '999',
  `description` text character set utf8 NOT NULL,
  `help_text` text character set utf8 NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config_data_blog`
--

INSERT INTO `config_data_blog` (`config_data_id`, `dim1`, `dim2`, `dim3`, `dim4`, `config_value`, `config_type`, `config_category`, `config_section`, `config_section_order`, `editable`, `edit_order`, `description`, `help_text`, `date_added`) VALUES
(1, 'admin', 'blog', 'blog_post_auto_activate', '', '0', 'Boolean', 'general_blog_settings', 'feature', 17, 'Yes', 999, 'Allow auto activation of blogs', 'Allow auto activation of blogs', '0000-00-00 00:00:00'),
(2, 'admin', 'blog', 'sub_category', '', '1', 'Boolean', 'general_blog_settings', 'feature', 17, 'Yes', 999, 'Blog Post Sub-category', 'Blog Post Sub-category', '0000-00-00 00:00:00'),
(3, 'admin', 'blog', 'allow_edit_blog_post_to_approve', '', '1', 'Boolean', 'general_blog_settings', 'feature', 17, 'Yes', 999, 'Allow post to be approved by admin while editing post', 'Allow post to be approved by admin while editing post', '0000-00-00 00:00:00'),
(4, 'admin', 'blog', 'no_of_free_blog_posting', '', '2', 'String', 'general_blog_settings', 'feature', 17, 'Yes', 999, 'Allowed no of uploads for Free members(Leave as empty for no limit)', 'Allowed no of uploads for Free members(Leave as empty for no limit)', '0000-00-00 00:00:00'),
(5, 'admin', 'blog', 'allow_edit_blog_post_description', '', '1', 'Boolean', 'general_blog_settings', 'feature', 17, 'Yes', 999, 'Allow edit blog post description after activate', 'Allow edit blog post description after activate', '0000-00-00 00:00:00'),
(6, 'admin', 'blog', 'blog_post_list_message_total_length', '', '250', 'Int', 'general_blog_settings', 'feature', 17, 'Yes', 999, 'Blog Post message total character size', 'Blog Post message total character size', '0000-00-00 00:00:00'),
(7, 'admin', 'blog', 'blog_post_list_message_length', '', '150', 'Int', 'general_blog_settings', 'feature', 17, 'Yes', 999, 'Post message length', 'Post message length', '0000-00-00 00:00:00'),
(8, 'admin', 'blog', 'message_share_blog_post_total_length', '', '200', 'Int', 'general_blog_settings', 'feature', 17, 'Yes', 999, 'Blog Post description total character size', 'Blog Post description total character size', '0000-00-00 00:00:00'),
(9, 'admin', 'blog', 'message_share_blog_post_length', '', '90', 'Int', 'general_blog_settings', 'feature', 18, 'Yes', 999, 'Blog Post description length', 'Blog Post description length', '0000-00-00 00:00:00'),
(10, 'admin', 'blog', 'captcha', '', '1', 'Boolean', 'general_blog_settings', 'captcha', 18, 'Yes', 999, 'Captcha', 'Captcha', '0000-00-00 00:00:00'),
(11, 'admin', 'blog', 'captcha_method', '', 'image', 'String', 'general_blog_settings', 'captcha', 18, 'Yes', 999, 'Captcha method Set(image / honeypot)', 'Captcha method Set(image / honeypot)', '0000-00-00 00:00:00'),
(12, 'admin', 'blog', 'allow_self_ratings', '', '1', 'Boolean', 'general_blog_settings', 'captcha', 18, 'Yes', 999, 'Blog Post Self Ratings', 'Blog Post Self Ratings', '0000-00-00 00:00:00'),
(13, 'admin', 'blogs', 'adult_content_view', '', 'Yes', 'String', 'general_blog_settings', 'captcha', 18, 'Yes', 999, 'Display adult content to members', 'Display adult content to members', '0000-00-00 00:00:00'),
(14, 'admin', 'blog', 'blog_category_list_priority', '', '1', 'Boolean', 'general_blog_settings', 'other Settings', 19, 'Yes', 999, 'List blog categories by priority', 'List blog categories by priority', '0000-00-00 00:00:00');
