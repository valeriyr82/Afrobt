-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jul 28, 2010 at 04:09 AM
-- Server version: 5.0.33
-- PHP Version: 5.2.1
-- 
-- Database: 'rayzz'
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table 'activation_code'
-- 

DROP TABLE IF EXISTS activation_code;
CREATE TABLE activation_code (
  code_id bigint(20) NOT NULL auto_increment,
  `code` varchar(100) NOT NULL,
  code_for enum('Signup','Forgotpass') NOT NULL,
  content_id bigint(20) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (code_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'activation_code'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'activity'
-- 

DROP TABLE IF EXISTS activity;
CREATE TABLE activity (
  parent_id bigint(20) NOT NULL auto_increment,
  child_id bigint(20) NOT NULL,
  module varchar(255) NOT NULL,
  owner_id bigint(20) NOT NULL,
  actor_id bigint(20) NOT NULL,
  `status` enum('Yes','Deleted') NOT NULL default 'Yes',
  date_added datetime NOT NULL,
  PRIMARY KEY  (parent_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'activity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'additional_menu_links'
-- 

DROP TABLE IF EXISTS additional_menu_links;
CREATE TABLE additional_menu_links (
  additional_menu_links_id bigint(20) NOT NULL auto_increment,
  menu_name varchar(250) NOT NULL,
  module varchar(50) NOT NULL,
  parent_id int(10) NOT NULL,
  link_file text NOT NULL,
  menu_type enum('main','sub') NOT NULL default 'main',
  `status` enum('yes','no') NOT NULL default 'yes',
  date_added date NOT NULL,
  PRIMARY KEY  (additional_menu_links_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'additional_menu_links'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'advertisement'
-- 

DROP TABLE IF EXISTS advertisement;
CREATE TABLE advertisement (
  add_id int(10) unsigned NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  block varchar(100) NOT NULL,
  about text,
  source longtext,
  start_date datetime NOT NULL,
  end_date datetime NOT NULL,
  allowed_impressions bigint(20) NOT NULL default '0',
  completed_impressions bigint(20) NOT NULL default '0',
  `status` enum('activate','toactivate') NOT NULL default 'toactivate',
  date_added datetime NOT NULL,
  PRIMARY KEY  (add_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'advertisement'
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table 'announcement'
-- 

DROP TABLE IF EXISTS announcement;
CREATE TABLE announcement (
  announcement_id int(11) NOT NULL auto_increment,
  description text,
  `status` enum('Yes','No','Delete') NOT NULL default 'Yes',
  from_date datetime NOT NULL,
  to_date datetime NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (announcement_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'announcement'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'article'
-- 

DROP TABLE IF EXISTS article;
CREATE TABLE article (
  article_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  article_category_id bigint(20) default NULL,
  article_sub_category_id bigint(20) default NULL,
  article_title varchar(200) default NULL,
  article_caption text,
  article_summary text,
  article_tags text,
  article_attachment bigint(20) NOT NULL default '0',
  article_server_url varchar(100) default NULL,
  article_access_type enum('Public','Private') NOT NULL default 'Public',
  relation_id text NOT NULL,
  allow_comments enum('Yes','No','Kinda') NOT NULL default 'Yes',
  allow_ratings enum('Yes','No') NOT NULL default 'Yes',
  allow_embed enum('Yes','No') NOT NULL default 'Yes',
  draft_mode enum('Yes','No') NOT NULL default 'No',
  date_of_publish date default NULL,
  rating_total bigint(20) NOT NULL default '0',
  rating_count bigint(20) NOT NULL default '0',
  date_added datetime default NULL,
  total_views bigint(20) default '0',
  total_comments bigint(20) NOT NULL default '0',
  total_favorites bigint(20) NOT NULL default '0',
  total_downloads bigint(20) NOT NULL default '0',
  featured enum('Yes','No') NOT NULL default 'No',
  last_view_date datetime default NULL,
  article_status enum('Ok','Deleted','ToActivate','Draft','Not Approved','InFuture') NOT NULL default 'Ok',
  flagged_status enum('Yes','No') NOT NULL default 'No',
  article_admin_comments text,
  PRIMARY KEY  (article_id),
  KEY ind_status_articleid (article_status,article_id),
  KEY ind_user_article_ids (user_id,article_id),
  KEY ind_status_lastviewdate (article_status,last_view_date),
  KEY ind_status_views (article_status,total_views),
  KEY ind_rating_total (article_status,rating_total),
  KEY ind_userid_date (user_id,date_added),
  KEY total_favorites (total_favorites),
  KEY total_comments (total_comments,article_status),
  FULLTEXT KEY article_tags (article_tags)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'article'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'article_activity'
-- 

DROP TABLE IF EXISTS article_activity;
CREATE TABLE article_activity (
  id bigint(20) NOT NULL auto_increment,
  parent_id bigint(20) NOT NULL,
  content_id bigint(20) NOT NULL,
  action_key varchar(255) NOT NULL,
  action_value text,
  actor_id bigint(20) NOT NULL,
  owner_id bigint(20) NOT NULL,
  `status` enum('Yes','Deleted') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'article_activity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'article_attachments'
-- 

DROP TABLE IF EXISTS article_attachments;
CREATE TABLE article_attachments (
  attachment_id bigint(20) NOT NULL auto_increment,
  article_id bigint(20) NOT NULL,
  file_name varchar(255) NOT NULL,
  file_ext varchar(55) NOT NULL,
  file_type varchar(50) NOT NULL,
  server_url varchar(100) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (attachment_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'article_attachments'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'article_category'
-- 

DROP TABLE IF EXISTS article_category;
CREATE TABLE article_category (
  article_category_id bigint(20) NOT NULL auto_increment,
  parent_category_id bigint(20) NOT NULL default '0',
  article_category_name varchar(200) default NULL,
  article_category_type enum('Porn','General') NOT NULL default 'General',
  article_category_description text NOT NULL,
  article_category_ext varchar(5) NOT NULL,
  allow_post enum('Yes','No') NOT NULL default 'Yes',
  article_category_status enum('Yes','No') default 'Yes',
  priority int(11) NOT NULL default '0',
  date_added datetime default NULL,
  PRIMARY KEY  (article_category_id),
  KEY ind_catstatus_catid (article_category_status,article_category_id),
  KEY ind_catstatus_catname (article_category_status,article_category_name)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'article_category'
-- 

INSERT INTO article_category (article_category_id, parent_category_id, article_category_name, article_category_type, article_category_description, article_category_ext, allow_post, article_category_status, priority, date_added) VALUES (1, 0, 'test', 'General', 'test category', '', 'Yes', 'Yes', 1, '2007-05-23 18:21:50');
INSERT INTO article_category (article_category_id, parent_category_id, article_category_name, article_category_type, article_category_description, article_category_ext, allow_post, article_category_status, priority, date_added) VALUES (2, 0, 'sample', 'General', 'sample category', '', 'Yes', 'Yes', 1, '2007-05-23 18:21:50');

-- --------------------------------------------------------

-- 
-- Table structure for table 'article_comments'
-- 

DROP TABLE IF EXISTS article_comments;
CREATE TABLE article_comments (
  article_comment_id bigint(20) NOT NULL auto_increment,
  article_comment_main_id bigint(20) NOT NULL default '0',
  article_id bigint(20) default NULL,
  comment_user_id bigint(20) default NULL,
  moods_id int(11) default NULL,
  `comment` text,
  comment_status enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (article_comment_id),
  KEY article_id (article_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'article_comments'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'article_favorite'
-- 

DROP TABLE IF EXISTS article_favorite;
CREATE TABLE article_favorite (
  article_favorite_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  article_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (article_favorite_id),
  KEY ind_article_id (article_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'article_favorite'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'article_rating'
-- 

DROP TABLE IF EXISTS article_rating;
CREATE TABLE article_rating (
  rating_id bigint(20) NOT NULL auto_increment,
  article_id bigint(20) NOT NULL default '0',
  user_id bigint(20) NOT NULL default '0',
  rate int(2) NOT NULL default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (rating_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'article_rating'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'article_tags'
-- 

DROP TABLE IF EXISTS article_tags;
CREATE TABLE article_tags (
  article_tag_id bigint(20) NOT NULL auto_increment,
  tag_name varchar(255) NOT NULL,
  search_count bigint(20) NOT NULL default '0',
  result_count bigint(20) NOT NULL default '0',
  last_searched datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (article_tag_id),
  UNIQUE KEY tag_name (tag_name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'article_tags'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'article_viewed'
-- 

DROP TABLE IF EXISTS article_viewed;
CREATE TABLE article_viewed (
  article_viewed_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  article_id bigint(20) default NULL,
  article_owner_id bigint(20) NOT NULL default '0',
  total_views bigint(20) NOT NULL default '0',
  view_date datetime default NULL,
  PRIMARY KEY  (article_viewed_id),
  KEY ind_article_id (article_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'article_viewed'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'artist_fans_list'
-- 

DROP TABLE IF EXISTS artist_fans_list;
CREATE TABLE artist_fans_list (
  artist_fans_list_id bigint(20) NOT NULL auto_increment,
  artist_id bigint(20) NOT NULL default '0',
  fan_id bigint(20) NOT NULL default '0',
  PRIMARY KEY  (artist_fans_list_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'artist_fans_list'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'be_friended_log'
-- 

DROP TABLE IF EXISTS be_friended_log;
CREATE TABLE be_friended_log (
  be_friended_id bigint(20) NOT NULL auto_increment,
  owner_id bigint(20) NOT NULL,
  friend_id bigint(20) NOT NULL,
  `status` enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime NOT NULL,
  PRIMARY KEY  (be_friended_id),
  UNIQUE KEY owner_id (owner_id,friend_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'be_friended_log'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'birthday_reminder'
-- 

DROP TABLE IF EXISTS birthday_reminder;
CREATE TABLE birthday_reminder (
  birthday_reminder_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  mail_sent_upto_friends_list_id bigint(20) NOT NULL default '0',
  `process` enum('Yes','No') NOT NULL default 'No',
  date_added datetime NOT NULL,
  PRIMARY KEY  (birthday_reminder_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'birthday_reminder'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'block_members'
-- 

DROP TABLE IF EXISTS block_members;
CREATE TABLE block_members (
  id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  block_id bigint(20) NOT NULL default '0',
  date_added datetime default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'block_members'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'block_non_members'
-- 

DROP TABLE IF EXISTS block_non_members;
CREATE TABLE block_non_members (
  id bigint(20) NOT NULL auto_increment,
  email varchar(250) NOT NULL,
  block_id bigint(20) NOT NULL default '0',
  block_all enum('No','Yes') default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'block_non_members'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_activity'
-- 

DROP TABLE IF EXISTS blog_activity;
CREATE TABLE blog_activity (
  id bigint(20) NOT NULL auto_increment,
  parent_id bigint(20) NOT NULL,
  content_id bigint(20) NOT NULL,
  action_key varchar(255) NOT NULL,
  action_value text,
  actor_id bigint(20) NOT NULL,
  owner_id bigint(20) NOT NULL,
  `status` enum('Yes','Deleted') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_activity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_category'
-- 

DROP TABLE IF EXISTS blog_category;
CREATE TABLE blog_category (
  blog_category_id bigint(20) NOT NULL auto_increment,
  parent_category_id int(11) NOT NULL default '0',
  blog_category_name varchar(200) default NULL,
  blog_category_description text,
  blog_category_type enum('Porn','General') NOT NULL default 'General',
  blog_category_ext varchar(5) NOT NULL,
  allow_post enum('Yes','No') NOT NULL default 'Yes',
  blog_category_status enum('Yes','No') default 'Yes',
  priority int(11) NOT NULL default '0',
  date_added datetime default NULL,
  PRIMARY KEY  (blog_category_id),
  KEY parent_category_id (parent_category_id),
  KEY photo_category_type (blog_category_type),
  KEY parent_blog_category_id (parent_category_id,blog_category_name),
  KEY parent_blog_category_id_priority (parent_category_id,priority)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_category'
-- 

INSERT INTO blog_category (blog_category_id, parent_category_id, blog_category_name, blog_category_description, blog_category_type, blog_category_ext, allow_post, blog_category_status, priority, date_added) VALUES (1, 0, 'test', 'test category', 'General', 'jpg', 'Yes', 'Yes', 1, '2007-05-23 18:21:50');

-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_comments'
-- 

DROP TABLE IF EXISTS blog_comments;
CREATE TABLE blog_comments (
  blog_comment_id int(10) unsigned NOT NULL auto_increment,
  blog_comment_main_id bigint(20) NOT NULL default '0',
  blog_id bigint(20) NOT NULL,
  blog_post_id int(11) NOT NULL,
  comment_user_id bigint(20) default NULL,
  `comment` text,
  comment_status enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (blog_comment_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_comments'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_favorite'
-- 

DROP TABLE IF EXISTS blog_favorite;
CREATE TABLE blog_favorite (
  blog_favorite_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  blog_id bigint(20) default NULL,
  blog_post_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (blog_favorite_id),
  KEY ind_blogpost_id (blog_post_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_favorite'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_featured'
-- 

DROP TABLE IF EXISTS blog_featured;
CREATE TABLE blog_featured (
  blog_featured_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  blog_id bigint(20) default NULL,
  blog_post_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (blog_featured_id),
  KEY ind_blog_featured_id (blog_post_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_featured'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_post'
-- 

DROP TABLE IF EXISTS blog_post;
CREATE TABLE blog_post (
  blog_post_id int(11) NOT NULL auto_increment,
  image_name varchar(50) NOT NULL,
  link_url text NOT NULL,
  `status` enum('Ok','Locked') NOT NULL default 'Ok',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (blog_post_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_post'
-- 

INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (1, 'blinkbits.png', 'http://www.blinkbits.com/bookmarklets/save.php?v=1&source_url={source_url}&title={source_title}&body={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (2, 'blogmarks.png', 'http://blogmarks.net/my/new.php?mini=1&simple=1&url{source_url}&title={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (3, 'co.png', 'http://co.mments.com/track?url={source_url}&title={source_title}', 'Ok', '2006-11-21 15:42:44');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (5, 'delicious.png', 'http://del.icio.us/post?url={source_url}&title={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (6, 'delirious.png', 'http://de.lirio.us/rubric/post?uri={source_url};title={source_title};when_done=go_back', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (7, 'digg.png', 'http://digg.com/submit?phase=2&url={source_url}&title={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (8, 'fark.png', 'http://cgi.fark.com/cgi/fark/edit.pl?new_url={source_url}&new_comment={source_title}&new_comment={site_url}&linktype=Misc', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (9, 'feedmelinks.png', 'http://feedmelinks.com/categorize?from=toolbar&op=submit&url={source_url}&name={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (10, 'furl.png', 'http://www.furl.net/storeIt.jsp?u={source_url}&t={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (11, 'linkagogo.png', 'http://www.linkagogo.com/go/AddNoPopup?url={source_url}&title={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (12, 'magnolia.png', 'http://ma.gnolia.com/beta/bookmarklet/add?url={source_url}&title={source_title}&description={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (13, 'newsvine.png', 'http://www.newsvine.com/_tools/seed&save?u={source_url}&h={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (14, 'netvouz.png', 'http://www.netvouz.com/action/submitBookmark?url={source_url}&title={source_title}&description={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (15, 'rawsugar.png', 'http://www.rawsugar.com/tagger/?turl={source_url}&tttl=TITTLE', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (16, 'reddit.png', 'http://reddit.com/submit?url={source_url}&title={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (17, 'scuttle.png', 'http://www.scuttle.org/bookmarks.php/maxpower?action=add&address={source_url}&title={source_title}&description={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (18, 'shadows.png', 'http://www.shadows.com/features/tcr.htm?url={source_url}&title={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (19, 'simpy.png', 'http://www.simpy.com/simpy/LinkAdd.do?href={source_url}&title={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (20, 'smarking.png', 'http://smarking.com/editbookmark/?url={source_url}&description={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (21, 'spurl.png', 'http://www.spurl.net/spurl.php?url={source_url}&title={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (22, 'tailrank.png', 'http://tailrank.com/share/?text=&link_href={source_url}&title={source_title}', 'Ok', '0000-00-00 00:00:00');
INSERT INTO blog_post (blog_post_id, image_name, link_url, status, date_added) VALUES (23, 'yahoomyweb.png', 'http://myweb2.search.yahoo.com/myresults/bookmarklet?u={source_url}&={source_title}', 'Ok', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_posts'
-- 

DROP TABLE IF EXISTS blog_posts;
CREATE TABLE blog_posts (
  blog_post_id int(10) unsigned NOT NULL auto_increment,
  blog_id int(11) NOT NULL,
  user_id bigint(11) NOT NULL default '0',
  blog_post_name varchar(225) NOT NULL,
  message text,
  blog_category_id bigint(20) NOT NULL default '0',
  blog_sub_category_id int(11) NOT NULL default '0',
  blog_tags text,
  blog_access_type enum('Public','Private') NOT NULL default 'Public',
  relation_id text NOT NULL,
  allow_comments enum('Yes','No') NOT NULL default 'Yes',
  allow_ratings enum('Yes','No') NOT NULL default 'Yes',
  rating_total bigint(20) NOT NULL default '0',
  rating_count bigint(20) NOT NULL default '0',
  total_comments int(11) NOT NULL default '0',
  total_favorites bigint(20) NOT NULL default '0',
  total_featured bigint(20) NOT NULL default '0',
  total_views int(11) NOT NULL default '0',
  featured enum('Yes','No') NOT NULL default 'No',
  flagged_status enum('Yes','No') NOT NULL default 'No',
  blog_admin_comments text,
  `status` enum('Ok','Deleted','ToActivate','Draft','Not Approved','InFuture') NOT NULL default 'Ok',
  draft_mode enum('Yes','No') NOT NULL default 'No',
  date_of_publish date default NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  last_view_date datetime default NULL,
  PRIMARY KEY  (blog_post_id),
  KEY ind_status_blogpostid (`status`,blog_post_id),
  KEY ind_user_blog_ids (user_id,blog_post_id),
  KEY ind_status_lastviewdate (`status`,last_view_date),
  KEY ind_status_views (`status`,total_views),
  KEY ind_rating_total (`status`,rating_total),
  KEY ind_userid_date (user_id,date_added),
  KEY total_favorites (total_favorites),
  KEY total_comments (total_comments,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_posts'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_rating'
-- 

DROP TABLE IF EXISTS blog_rating;
CREATE TABLE blog_rating (
  blog_rating_id bigint(20) NOT NULL auto_increment,
  blog_id bigint(20) default NULL,
  blog_post_id bigint(20) default NULL,
  user_id bigint(20) NOT NULL default '0',
  rate int(2) NOT NULL default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (blog_rating_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_rating'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_tags'
-- 

DROP TABLE IF EXISTS blog_tags;
CREATE TABLE blog_tags (
  blog_tag_id bigint(20) NOT NULL auto_increment,
  tag_name varchar(255) NOT NULL,
  blog_id bigint(20) NOT NULL default '0',
  search_count bigint(20) NOT NULL default '0',
  result_count bigint(20) NOT NULL default '0',
  last_searched datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (blog_tag_id),
  KEY result_count (result_count)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_tags'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blog_viewed'
-- 

DROP TABLE IF EXISTS blog_viewed;
CREATE TABLE blog_viewed (
  blog_viewed_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  blog_id bigint(20) default NULL,
  blog_post_id bigint(20) default NULL,
  blog_owner_id bigint(20) NOT NULL default '0',
  total_views bigint(20) NOT NULL default '0',
  view_date datetime default NULL,
  PRIMARY KEY  (blog_viewed_id),
  KEY ind_blog_id (blog_post_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blog_viewed'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blogger'
-- 

DROP TABLE IF EXISTS blogger;
CREATE TABLE blogger (
  blogger_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  blog_site varchar(255) NOT NULL,
  blog_title varchar(255) NOT NULL,
  blog_user_name varchar(255) NOT NULL,
  blog_password varchar(20) NOT NULL,
  `status` enum('Ok','Locked') NOT NULL default 'Ok',
  date_added datetime NOT NULL,
  PRIMARY KEY  (blogger_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blogger'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'blogs'
-- 

DROP TABLE IF EXISTS blogs;
CREATE TABLE blogs (
  blog_id int(11) NOT NULL auto_increment,
  blog_name varchar(100) NOT NULL,
  blog_title varchar(225) NOT NULL,
  blog_slogan varchar(255) default NULL,
  user_id bigint(20) NOT NULL,
  width int(11) default '0',
  height int(11) default '0',
  blog_logo_ext varchar(5) NOT NULL,
  blog_status enum('Toactivate','Active','Deleted') NOT NULL default 'Active',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (blog_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'blogs'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'bugs'
-- 

DROP TABLE IF EXISTS bugs;
CREATE TABLE bugs (
  bug_id bigint(20) NOT NULL auto_increment,
  bug_subject text NOT NULL,
  bug_content text NOT NULL,
  secret_key varchar(252) NOT NULL,
  parent_id bigint(20) NOT NULL default '0',
  reply_from varchar(200) default NULL,
  `status` enum('Open','Closed') NOT NULL default 'Open',
  date_added datetime NOT NULL,
  date_closed datetime NOT NULL,
  PRIMARY KEY  (bug_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'bugs'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'bulletin'
-- 

DROP TABLE IF EXISTS bulletin;
CREATE TABLE bulletin (
  bulletin_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  `subject` varchar(200) default NULL,
  bulletin text,
  access_status enum('Public','Private') default NULL,
  relation_id bigint(20) default NULL,
  total_views bigint(20) default '0',
  total_replies bigint(20) default '0',
  `status` enum('Ok','Blocked') NOT NULL default 'Ok',
  date_added datetime default NULL,
  PRIMARY KEY  (bulletin_id),
  KEY ind_status_bullid (`status`,bulletin_id),
  KEY ind_date_user_id (date_added,user_id),
  KEY ind_user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'bulletin'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_abuse_boards'
-- 

DROP TABLE IF EXISTS discuzz_abuse_boards;
CREATE TABLE discuzz_abuse_boards (
  abuse_id bigint(20) NOT NULL auto_increment,
  board_id bigint(20) NOT NULL,
  reported_by bigint(20) NOT NULL,
  reason varchar(250) NOT NULL,
  date_abused datetime NOT NULL,
  PRIMARY KEY  (abuse_id),
  KEY board_id (board_id,reported_by)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_abuse_boards'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_abuse_solutions'
-- 

DROP TABLE IF EXISTS discuzz_abuse_solutions;
CREATE TABLE discuzz_abuse_solutions (
  abuse_id bigint(20) NOT NULL auto_increment,
  board_id bigint(20) NOT NULL,
  solution_id bigint(20) NOT NULL,
  reported_by bigint(20) NOT NULL,
  reason varchar(250) NOT NULL,
  date_abused datetime NOT NULL,
  PRIMARY KEY  (abuse_id),
  KEY solution_id (solution_id,reported_by)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_abuse_solutions'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_advanced_search'
-- 

DROP TABLE IF EXISTS discuzz_advanced_search;
CREATE TABLE discuzz_advanced_search (
  advanced_search_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  discussion text NOT NULL,
  solution text NOT NULL,
  member text NOT NULL,
  PRIMARY KEY  (advanced_search_id),
  UNIQUE KEY user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_advanced_search'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_attachments'
-- 

DROP TABLE IF EXISTS discuzz_attachments;
CREATE TABLE discuzz_attachments (
  attachment_id bigint(20) NOT NULL auto_increment,
  content_id bigint(20) NOT NULL,
  content_type enum('Board','Solution') NOT NULL,
  attachment_name varchar(150) default NULL,
  attachment_size bigint(20) default '0',
  photo_server_url varchar(255) NOT NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (attachment_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_attachments'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_board_comment'
-- 

DROP TABLE IF EXISTS discuzz_board_comment;
CREATE TABLE discuzz_board_comment (
  comment_id int(10) unsigned NOT NULL auto_increment,
  board_id int(11) NOT NULL default '0',
  solution_id int(11) NOT NULL default '0',
  user_id int(11) NOT NULL default '0',
  `comment` text,
  `status` enum('Active','ToActivate') NOT NULL default 'Active',
  date_added datetime NOT NULL,
  PRIMARY KEY  (comment_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_board_comment'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_boards'
-- 

DROP TABLE IF EXISTS discuzz_boards;
CREATE TABLE discuzz_boards (
  board_id bigint(20) NOT NULL auto_increment,
  discussion_id bigint(20) NOT NULL,
  user_id bigint(20) NOT NULL,
  board varchar(255) NOT NULL,
  seo_title varchar(255) NOT NULL,
  description text NOT NULL,
  moved_to bigint(20) NOT NULL,
  moved_from bigint(20) NOT NULL,
  search_word text NOT NULL,
  tags varchar(255) NOT NULL,
  total_solutions int(11) NOT NULL default '0',
  total_stars bigint(20) NOT NULL default '0',
  total_views int(11) NOT NULL default '0',
  votes bigint(20) NOT NULL default '0',
  best_solution_id bigint(20) NOT NULL default '0',
  `status` enum('ToActivate','Active','Inactive','Blocked','Deleted') NOT NULL default 'Active',
  featured enum('Yes','No') NOT NULL default 'No',
  has_attachment enum('Yes','No') NOT NULL default 'No',
  publish_status enum('Yes','No') NOT NULL default 'Yes',
  visible_to enum('Friends','All','None') NOT NULL default 'All',
  readonly enum('Yes','No') NOT NULL default 'No',
  email_sent enum('Yes','No') NOT NULL default 'No',
  resolved_mail_count bigint(20) NOT NULL default '0',
  abuse_count int(11) default '0',
  latest_viewed datetime NOT NULL,
  last_post_by bigint(20) NOT NULL,
  solution_added datetime NOT NULL,
  board_added datetime NOT NULL,
  redirect_link varchar(255) NOT NULL,
  PRIMARY KEY  (board_id),
  KEY best_solution_id (best_solution_id),
  KEY `status` (`status`),
  KEY user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_boards'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_category'
-- 

DROP TABLE IF EXISTS discuzz_category;
CREATE TABLE discuzz_category (
  cat_id bigint(20) NOT NULL auto_increment,
  cat_name varchar(100) NOT NULL,
  seo_title varchar(255) NOT NULL,
  description text NOT NULL,
  parent_id int(11) NOT NULL default '0',
  has_child enum('Yes','No') NOT NULL default 'No',
  `status` enum('Active','Inactive') NOT NULL default 'Active',
  total_discussions bigint(20) NOT NULL default '0',
  disporder int(11) NOT NULL default '0',
  date_added datetime NOT NULL,
  previous_status enum('Active','Inactive') NOT NULL,
  total_boards bigint(20) NOT NULL,
  total_solutions bigint(20) NOT NULL,
  last_post_user_id bigint(20) NOT NULL,
  last_post_date datetime NOT NULL,
  restricted enum('Yes','No') NOT NULL default 'No',
  PRIMARY KEY  (cat_id),
  KEY parent_id (parent_id),
  KEY total_boards (total_discussions),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_category'
-- 

INSERT INTO discuzz_category (cat_id, cat_name, seo_title, description, parent_id, has_child, status, total_discussions, disporder, date_added, previous_status, total_boards, total_solutions, last_post_user_id, last_post_date, restricted) VALUES (1, 'Welcome to Discuzz', 'Welcome-to-Discuzz', '', 0, 'Yes', 'Active', 0, 1, '2010-07-28 09:17:03', 'Active', 0, 0, 0, '0000-00-00 00:00:00', 'No');
INSERT INTO discuzz_category (cat_id, cat_name, seo_title, description, parent_id, has_child, status, total_discussions, disporder, date_added, previous_status, total_boards, total_solutions, last_post_user_id, last_post_date, restricted) VALUES (2, 'Discuzz Announcements', 'Discuzz-Announcements', '', 0, '', 'Active', 0, 2, '2010-07-28 09:17:03', 'Active', 0, 0, 0, '0000-00-00 00:00:00', 'No');
INSERT INTO discuzz_category (cat_id, cat_name, seo_title, description, parent_id, has_child, status, total_discussions, disporder, date_added, previous_status, total_boards, total_solutions, last_post_user_id, last_post_date, restricted) VALUES (3, 'Software', 'Software', '', 0, '', 'Active', 0, 3, '2010-07-28 09:17:03', 'Active', 0, 0, 0, '0000-00-00 00:00:00', 'No');
INSERT INTO discuzz_category (cat_id, cat_name, seo_title, description, parent_id, has_child, status, total_discussions, disporder, date_added, previous_status, total_boards, total_solutions, last_post_user_id, last_post_date, restricted) VALUES (4, 'Entertainment and Special Interests', 'Entertainment-and-Special-Interests', '', 0, '', 'Active', 0, 4, '2010-07-28 09:17:03', 'Active', 0, 0, 0, '0000-00-00 00:00:00', 'No');
INSERT INTO discuzz_category (cat_id, cat_name, seo_title, description, parent_id, has_child, status, total_discussions, disporder, date_added, previous_status, total_boards, total_solutions, last_post_user_id, last_post_date, restricted) VALUES (5, 'Market Place', 'Market-Place', '', 0, '', 'Active', 0, 5, '2010-07-28 09:17:03', 'Active', 0, 0, 0, '0000-00-00 00:00:00', 'No');
INSERT INTO discuzz_category (cat_id, cat_name, seo_title, description, parent_id, has_child, status, total_discussions, disporder, date_added, previous_status, total_boards, total_solutions, last_post_user_id, last_post_date, restricted) VALUES (6, 'Tips and Troubleshooting', 'Tips-and-Troubleshooting', '', 0, '', 'Active', 0, 7, '2010-07-28 09:17:03', 'Active', 0, 0, 0, '0000-00-00 00:00:00', 'No');
INSERT INTO discuzz_category (cat_id, cat_name, seo_title, description, parent_id, has_child, status, total_discussions, disporder, date_added, previous_status, total_boards, total_solutions, last_post_user_id, last_post_date, restricted) VALUES (7, 'General', 'General', '', 1, '', 'Active', 0, 6, '2010-07-28 09:17:03', 'Active', 0, 0, 0, '0000-00-00 00:00:00', 'No');

-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_common_words'
-- 

DROP TABLE IF EXISTS discuzz_common_words;
CREATE TABLE discuzz_common_words (
  id int(1) NOT NULL auto_increment,
  words text,
  PRIMARY KEY  (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_common_words'
-- 

INSERT INTO discuzz_common_words (id, words) VALUES (1, 'when,what,whom,who,where,which,how,do,in,is,was,were,are,on,the,this,these,them,they,he,she,it,him,her,as,so,but,from,whether,whichever,however,even,because,would,should,could,can,will,shall,want,of,an,while,once,had,see,');

-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_cron_master'
-- 

DROP TABLE IF EXISTS discuzz_cron_master;
CREATE TABLE discuzz_cron_master (
  cron_id bigint(20) NOT NULL auto_increment,
  upto_id bigint(20) default '0',
  total bigint(20) default '0',
  start_time datetime default NULL,
  tot_finished_crons bigint(20) default '0',
  `status` enum('Started','Finished') default NULL,
  cron_for enum('Board','Solution','favorite','Online','Subscribe','Sitemaps') default NULL,
  PRIMARY KEY  (cron_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_cron_master'
-- 

INSERT INTO discuzz_cron_master (cron_id, upto_id, total, start_time, tot_finished_crons, status, cron_for) VALUES (1, 0, 0, '2010-07-28 09:17:03', 0, 'Started', 'Board');
INSERT INTO discuzz_cron_master (cron_id, upto_id, total, start_time, tot_finished_crons, status, cron_for) VALUES (2, 0, 0, '2010-07-28 09:17:03', 0, 'Started', 'Solution');
INSERT INTO discuzz_cron_master (cron_id, upto_id, total, start_time, tot_finished_crons, status, cron_for) VALUES (3, 0, 0, '2010-07-28 09:17:03', 0, 'Started', 'favorite');
INSERT INTO discuzz_cron_master (cron_id, upto_id, total, start_time, tot_finished_crons, status, cron_for) VALUES (4, 0, 0, '2010-07-28 09:17:03', 0, 'Started', 'Online');
INSERT INTO discuzz_cron_master (cron_id, upto_id, total, start_time, tot_finished_crons, status, cron_for) VALUES (5, 0, 0, '2010-07-28 09:17:03', 0, 'Started', 'Subscribe');
INSERT INTO discuzz_cron_master (cron_id, upto_id, total, start_time, tot_finished_crons, status, cron_for) VALUES (6, 0, 0, '2010-07-28 09:17:03', 0, 'Started', 'Sitemaps');

-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_discussions'
-- 

DROP TABLE IF EXISTS discuzz_discussions;
CREATE TABLE discuzz_discussions (
  discussion_id bigint(20) NOT NULL auto_increment,
  discussion_title varchar(200) default NULL,
  seo_title varchar(255) NOT NULL,
  description text,
  user_id bigint(20) NOT NULL,
  pcat_id int(11) NOT NULL,
  cat_id int(11) default NULL,
  search_word text NOT NULL,
  total_boards bigint(20) default '0',
  total_solutions bigint(20) default '0',
  last_post_user_id bigint(20) default NULL,
  last_post_date datetime default NULL,
  `status` enum('ToActivate','Active','Inactive') default NULL,
  publish_status enum('Yes','No') NOT NULL default 'Yes',
  visible_to enum('Friends','All','None') NOT NULL default 'All',
  redirect_link varchar(255) NOT NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (discussion_id),
  KEY ind_status_title (`status`,discussion_title)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_discussions'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_discussions_activity'
-- 

DROP TABLE IF EXISTS discuzz_discussions_activity;
CREATE TABLE discuzz_discussions_activity (
  id bigint(20) NOT NULL auto_increment,
  parent_id bigint(20) NOT NULL,
  content_id bigint(20) NOT NULL,
  action_key varchar(255) NOT NULL,
  action_value text,
  actor_id bigint(20) NOT NULL,
  owner_id bigint(20) NOT NULL,
  `status` enum('Yes','Deleted') NOT NULL default 'Yes',
  date_added datetime NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_discussions_activity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_rightbar_settings'
-- 

DROP TABLE IF EXISTS discuzz_rightbar_settings;
CREATE TABLE discuzz_rightbar_settings (
  sno tinyint(2) NOT NULL auto_increment,
  title varchar(50) NOT NULL,
  order_value tinyint(2) NOT NULL,
  PRIMARY KEY  (sno)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_rightbar_settings'
-- 

INSERT INTO discuzz_rightbar_settings (sno, title, order_value) VALUES (1, 'user_status', 1);
INSERT INTO discuzz_rightbar_settings (sno, title, order_value) VALUES (2, 'top_contributors', 2);
INSERT INTO discuzz_rightbar_settings (sno, title, order_value) VALUES (3, 'featured_contributors', 3);
INSERT INTO discuzz_rightbar_settings (sno, title, order_value) VALUES (4, 'featured_board', 4);

-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_solutions'
-- 

DROP TABLE IF EXISTS discuzz_solutions;
CREATE TABLE discuzz_solutions (
  solution_id bigint(20) NOT NULL auto_increment,
  board_id bigint(20) NOT NULL,
  user_id bigint(20) NOT NULL,
  solution text NOT NULL,
  search_word text NOT NULL,
  total_stars bigint(20) NOT NULL default '0',
  abuse_count int(11) default '0',
  solution_added datetime NOT NULL,
  is_accepted enum('Yes','No') NOT NULL default 'No',
  visible_to enum('Friends','All','None') NOT NULL default 'All',
  email_sent enum('Yes','No') NOT NULL default 'No',
  `status` enum('ToActivate','Active') NOT NULL default 'Active',
  PRIMARY KEY  (solution_id),
  KEY board_id (board_id,user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_solutions'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_tags'
-- 

DROP TABLE IF EXISTS discuzz_tags;
CREATE TABLE discuzz_tags (
  tag_id bigint(20) NOT NULL auto_increment,
  tag_name varchar(255) NOT NULL,
  search_count bigint(20) NOT NULL default '0',
  total_count bigint(20) NOT NULL default '0',
  last_searched datetime NOT NULL,
  PRIMARY KEY  (tag_id),
  UNIQUE KEY tag_name (tag_name),
  KEY total_count (total_count),
  KEY search_count (search_count)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_tags'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_user_bookmarked'
-- 

DROP TABLE IF EXISTS discuzz_user_bookmarked;
CREATE TABLE discuzz_user_bookmarked (
  bookmark_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  content_id bigint(20) NOT NULL,
  content_type enum('Board','User') NOT NULL,
  date_added datetime NOT NULL,
  last_updated datetime NOT NULL,
  PRIMARY KEY  (bookmark_id),
  KEY user_content_type (user_id,content_id,content_type)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_user_bookmarked'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_users_board_log'
-- 

DROP TABLE IF EXISTS discuzz_users_board_log;
CREATE TABLE discuzz_users_board_log (
  log_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  total_board int(11) NOT NULL default '0',
  total_solution int(11) NOT NULL default '0',
  total_best_solution int(11) default '0',
  total_points int(11) NOT NULL default '0',
  subscribe_keywords text NOT NULL,
  keyword_mail enum('Yes','No') NOT NULL default 'Yes',
  reply_mail enum('Yes','No') NOT NULL default 'Yes',
  favorite_mail enum('Yes','No') NOT NULL default 'Yes',
  best_solution_mail enum('Yes','No') NOT NULL default 'Yes',
  abuse_mail enum('Yes','No') NOT NULL default 'Yes',
  internal_mail enum('Yes','No') NOT NULL default 'Yes',
  news_letter enum('Yes','No') NOT NULL default 'Yes',
  index_block text NOT NULL,
  is_blocked enum('Yes','No') NOT NULL default 'No',
  date_viewed datetime NOT NULL,
  date_updated datetime NOT NULL,
  PRIMARY KEY  (log_id),
  KEY user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_users_board_log'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_users_stared_board'
-- 

DROP TABLE IF EXISTS discuzz_users_stared_board;
CREATE TABLE discuzz_users_stared_board (
  star_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  board_id bigint(20) NOT NULL,
  rating tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (star_id),
  KEY user_id (user_id,board_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_users_stared_board'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_users_stared_solution'
-- 

DROP TABLE IF EXISTS discuzz_users_stared_solution;
CREATE TABLE discuzz_users_stared_solution (
  star_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  solution_id bigint(20) NOT NULL,
  rating tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (star_id),
  KEY user_id (user_id,solution_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_users_stared_solution'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_view_log'
-- 

DROP TABLE IF EXISTS discuzz_view_log;
CREATE TABLE discuzz_view_log (
  log_id bigint(20) NOT NULL auto_increment,
  log_userid bigint(20) NOT NULL default '0',
  log_ip varchar(20) NOT NULL default '0',
  board_id bigint(20) NOT NULL default '0',
  date_viewed datetime NOT NULL,
  PRIMARY KEY  (log_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_view_log'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'discuzz_view_weekly_experts'
-- 

DROP TABLE IF EXISTS discuzz_view_weekly_experts;
CREATE TABLE discuzz_view_weekly_experts (
  user_id int(11) NOT NULL,
  week_points int(11) NOT NULL default '0',
  date_added datetime NOT NULL,
  PRIMARY KEY  (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'discuzz_view_weekly_experts'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'embadable_site'
-- 

DROP TABLE IF EXISTS embadable_site;
CREATE TABLE embadable_site (
  embadable_site_id bigint(20) NOT NULL auto_increment,
  url text,
  `status` enum('Activate','Toactivate') NOT NULL default 'Toactivate',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (embadable_site_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'embadable_site'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'exturl'
-- 

DROP TABLE IF EXISTS exturl;
CREATE TABLE exturl (
  exturl_id bigint(20) NOT NULL auto_increment,
  exturl_name varchar(200) default NULL,
  exturl_description text,
  exturl_ext varchar(5) NOT NULL,
  exturl_url varchar(200) default NULL,
  exturl_tags varchar(200) NOT NULL,
  exturl_status enum('Yes','No') default NULL,
  exturl_category_id bigint(20) default NULL,
  featured enum('Yes','No') NOT NULL default 'No',
  date_added datetime default NULL,
  PRIMARY KEY  (exturl_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'exturl'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'exturl_category'
-- 

DROP TABLE IF EXISTS exturl_category;
CREATE TABLE exturl_category (
  exturl_category_id bigint(20) NOT NULL auto_increment,
  exturl_category_ext varchar(10) NOT NULL,
  exturl_category_name varchar(200) default NULL,
  exturl_category_description text,
  exturl_category_status enum('Yes','No') default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (exturl_category_id),
  KEY ind_catstatus_catid (exturl_category_status,exturl_category_id),
  KEY ind_catstatus_catname (exturl_category_status,exturl_category_name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'exturl_category'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'facebook_identity'
-- 

DROP TABLE IF EXISTS facebook_identity;
CREATE TABLE facebook_identity (
  f_uid bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  hashcode varchar(255) NOT NULL,
  facebook_image enum('Yes','No') NOT NULL default 'Yes',
  facebook_image_current enum('Yes','No') NOT NULL default 'Yes',
  `status` enum('ToActivate','Ok') NOT NULL default 'ToActivate',
  PRIMARY KEY  (f_uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'facebook_identity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'facebook_profile'
-- 

DROP TABLE IF EXISTS facebook_profile;
CREATE TABLE facebook_profile (
  user_id int(25) NOT NULL default '0',
  my_profile enum('Yes','No') NOT NULL default 'Yes',
  my_videos enum('Yes','No') NOT NULL default 'Yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'facebook_profile'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'flagged_contents'
-- 

DROP TABLE IF EXISTS flagged_contents;
CREATE TABLE flagged_contents (
  id bigint(20) NOT NULL auto_increment,
  content_id bigint(20) NOT NULL default '0',
  content_type varchar(200) NOT NULL,
  flag varchar(200) NOT NULL,
  flag_comment text,
  reporter_id bigint(20) NOT NULL default '0',
  `status` enum('Ok','Deleted') NOT NULL default 'Ok',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (id),
  FULLTEXT KEY flag_comment (flag_comment)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'flagged_contents'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'friend_suggestion'
-- 

DROP TABLE IF EXISTS friend_suggestion;
CREATE TABLE friend_suggestion (
  user_id bigint(20) NOT NULL,
  friend_id bigint(20) NOT NULL,
  weight bigint(20) NOT NULL,
  `status` enum('Ok','Deleted') NOT NULL default 'Ok',
  date_added datetime NOT NULL,
  PRIMARY KEY  (user_id,friend_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'friend_suggestion'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'friend_suggestion_log'
-- 

DROP TABLE IF EXISTS friend_suggestion_log;
CREATE TABLE friend_suggestion_log (
  id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  last_updated_date date default NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY user_id (user_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'friend_suggestion_log'
-- 



-- --------------------------------------------------------

-- 
-- Table structure for table 'friends_list'
-- 

DROP TABLE IF EXISTS friends_list;
CREATE TABLE friends_list (
  id bigint(20) NOT NULL auto_increment,
  owner_id bigint(20) NOT NULL default '0',
  friend_id bigint(20) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY owner_friend_id (owner_id,friend_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'friends_list'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'friends_relation'
-- 

DROP TABLE IF EXISTS friends_relation;
CREATE TABLE friends_relation (
  id bigint(11) NOT NULL auto_increment,
  friendship_id int(11) NOT NULL default '0',
  relation_id int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'friends_relation'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'friends_relation_name'
-- 

DROP TABLE IF EXISTS friends_relation_name;
CREATE TABLE friends_relation_name (
  relation_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  relation_name varchar(50) default NULL,
  total_contacts int(11) default '0',
  PRIMARY KEY  (relation_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'friends_relation_name'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'general_activity'
-- 

DROP TABLE IF EXISTS general_activity;
CREATE TABLE general_activity (
  id bigint(20) NOT NULL auto_increment,
  parent_id bigint(20) NOT NULL,
  content_id bigint(20) NOT NULL,
  action_key varchar(255) NOT NULL,
  action_value text,
  actor_id bigint(20) NOT NULL,
  owner_id bigint(20) NOT NULL,
  `status` enum('Yes','Deleted') NOT NULL default 'Yes',
  date_added datetime NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'general_activity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'home_page_modules'
-- 

DROP TABLE IF EXISTS home_page_modules;
CREATE TABLE home_page_modules (
  home_page_block_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  module_name varchar(50) default NULL,
  block_name varchar(50) default NULL,
  block_description varchar(250) default NULL,
  order_no int(11) NOT NULL default '0',
  display enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (home_page_block_id),
  KEY display (display,order_no)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'home_page_modules'
-- 

INSERT INTO home_page_modules (home_page_block_id, user_id, module_name, block_name, block_description, order_no, display, date_added) VALUES (1, 1, 'video', 'VideoBlock', 'VideoBlock', 3, 'Yes', '2009-03-26 11:27:22');
INSERT INTO home_page_modules (home_page_block_id, user_id, module_name, block_name, block_description, order_no, display, date_added) VALUES (2, 1, 'video', 'VideoChannel', 'VideoChannel', 4, 'Yes', '2009-03-26 11:28:03');
INSERT INTO home_page_modules (home_page_block_id, user_id, module_name, block_name, block_description, order_no, display, date_added) VALUES (3, 1, 'default', 'NewPeople', 'NewPeople', 5, 'Yes', '2009-03-26 11:37:53');
INSERT INTO home_page_modules (home_page_block_id, user_id, module_name, block_name, block_description, order_no, display, date_added) VALUES (4, 1, 'video', 'RecentVideo', 'RecentVideo', 2, 'Yes', '2009-03-27 17:17:15');
INSERT INTO home_page_modules (home_page_block_id, user_id, module_name, block_name, block_description, order_no, display, date_added) VALUES (5, 1, 'video', 'RandomVideo', 'RandomVideo', 1, 'Yes', '2009-03-27 19:17:04');

-- --------------------------------------------------------

-- 
-- Table structure for table 'index_media_tab_settings'
-- 

DROP TABLE IF EXISTS index_media_tab_settings;
CREATE TABLE index_media_tab_settings (
  index_media_tab_id bigint(20) NOT NULL auto_increment,
  media_type enum('video','music','photo','custom') NOT NULL default 'video',
  media_tab_type varchar(255) NOT NULL,
  PRIMARY KEY  (index_media_tab_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'index_media_tab_settings'
-- 

INSERT INTO index_media_tab_settings (index_media_tab_id, media_type, media_tab_type) VALUES (1, 'video', 'newvideo');
INSERT INTO index_media_tab_settings (index_media_tab_id, media_type, media_tab_type) VALUES (2, 'music', 'newmusic');
INSERT INTO index_media_tab_settings (index_media_tab_id, media_type, media_tab_type) VALUES (3, 'photo', 'mostrecentphoto');
INSERT INTO index_media_tab_settings (index_media_tab_id, media_type, media_tab_type) VALUES (4, 'custom', 'Featured List');

-- --------------------------------------------------------

-- 
-- Table structure for table 'index_root_featured_glider_details'
-- 

DROP TABLE IF EXISTS index_root_featured_glider_details;
CREATE TABLE index_root_featured_glider_details (
  index_glider_id bigint(20) NOT NULL auto_increment,
  glider_title varchar(150) NOT NULL,
  media_type enum('video','music','photo','custom') NOT NULL default 'video',
  media_id bigint(20) NOT NULL COMMENT 'video id if the media type is video ..',
  date_added datetime NOT NULL,
  is_use_default enum('Yes','No') NOT NULL default 'Yes',
  custom_image_ext varchar(10) NOT NULL,
  custom_image_target_url varchar(150) NOT NULL,
  rollover_text varchar(200) NOT NULL,
  sidebar_content text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL default 'Active',
  featured_order bigint(20) NOT NULL default '999' COMMENT 'Order in which the slides are to be shown ',
  PRIMARY KEY  (index_glider_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='details of the content to be shown in the Home page as slide';

-- 
-- Dumping data for table 'index_root_featured_glider_details'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'install_plugin'
-- 

DROP TABLE IF EXISTS install_plugin;
CREATE TABLE install_plugin (
  id int(11) NOT NULL auto_increment,
  date_install datetime NOT NULL,
  plugin_name varchar(100) NOT NULL,
  module_name varchar(100) NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'install_plugin'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'menu'
-- 

DROP TABLE IF EXISTS menu;
CREATE TABLE menu (
  id int(11) NOT NULL auto_increment,
  menu_name varchar(200) NOT NULL,
  file_name varchar(250) NOT NULL,
  normal_querystring varchar(250) NOT NULL,
  seo_querystring varchar(250) NOT NULL,
  folder varchar(100) NOT NULL,
  module varchar(100) NOT NULL,
  menu_order int(11) NOT NULL,
  is_member_menu enum('Yes','No') NOT NULL default 'No',
  is_member_hide_menu enum('Yes','No') NOT NULL default 'No',
  is_module_home_page enum('Yes','No') NOT NULL default 'No',
  menu_page_type enum('normal','static','external_link') NOT NULL default 'normal',
  menu_status enum('Ok','Deleted') NOT NULL,
  link_target varchar(10) default NULL,
  class_name varchar(50) NOT NULL default 'clsDefaultMenu',
  PRIMARY KEY  (id),
  KEY menu_status_order (menu_status,menu_order)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'menu'
-- 

INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (1, 'Home', 'index', 'index.php', 'index.html', '', '', 1, 'No', 'Yes', 'No', 'normal', 'Ok', '', 'clsHomeMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (2, 'My Home', 'myhome', 'myHome.php', 'myhome.html', '', '', 2, 'Yes', 'No', 'No', 'normal', 'Ok', '', 'clsMyHomeMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (3, 'Video', 'index', 'video/index.php', 'video/index.html', '', 'video', 3, 'No', 'No', 'Yes', 'normal', 'Ok', '', 'clsVideoMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (4, 'Music', 'index', 'music/index.php', 'music/index.html', '', 'music', 4, 'No', 'No', 'Yes', 'normal', 'Ok', NULL, 'clsMusicMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (5, 'Photo', 'index', 'photo/index.php', 'photo/index.html', '', 'photo', 5, 'No', 'No', 'Yes', 'normal', 'Ok', '', 'clsPhotoMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (6, 'Members', 'memberslist', 'membersList.php', 'memberslist.html', '', '', 6, 'No', 'No', 'No', 'normal', 'Ok', '', 'clsMembersMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (7, 'Friends', 'myfriends', 'myFriends.php', 'myfriends.html', '', '', 7, 'Yes', 'No', 'No', 'normal', 'Ok', '', 'clsFriendsMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (8, 'Mail', 'mail', 'mail.php?folder=inbox', 'mail/inbox.html', '', '', 8, 'No', 'No', 'No', 'normal', 'Ok', '', 'clsMailMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (9, 'Blog', 'index', 'blog/index.php', 'blog/index.html', '', 'blog', 9, 'No', 'No', 'Yes', 'normal', 'Ok', '', 'clsBlogMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (10, 'Article', 'index', 'article/index.php', 'article/index.html', '', 'article', 10, 'No', 'No', 'Yes', 'normal', 'Ok', '', 'clsArticleMenu');
INSERT INTO menu (id, menu_name, file_name, normal_querystring, seo_querystring, folder, module, menu_order, is_member_menu, is_member_hide_menu, is_module_home_page, menu_page_type, menu_status, link_target, class_name) VALUES (11, 'Discussions', 'index', 'discussions/index.php', 'discussions/index.html', '', 'discussions', 11, 'No', 'No', 'No', 'normal', 'Ok', '', 'clsDiscussionsMenu');

-- --------------------------------------------------------

-- 
-- Table structure for table 'menu_settings'
-- 

DROP TABLE IF EXISTS menu_settings;
CREATE TABLE menu_settings (
  sl_no bigint(20) NOT NULL auto_increment,
  menu_key varchar(250) NOT NULL,
  menu_value varchar(250) NOT NULL,
  PRIMARY KEY  (sl_no),
  KEY menu_key (menu_key)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'menu_settings'
-- 

INSERT INTO menu_settings (sl_no, menu_key, menu_value) VALUES (1, 'show_channel', 'false');
INSERT INTO menu_settings (sl_no, menu_key, menu_value) VALUES (2, 'display_channel_in_row', 'false');
INSERT INTO menu_settings (sl_no, menu_key, menu_value) VALUES (3, 'visible_menu_count', '6');
INSERT INTO menu_settings (sl_no, menu_key, menu_value) VALUES (4, 'visible_channel_count', '10');

-- --------------------------------------------------------

-- 
-- Table structure for table 'messages'
-- 

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
  message_id bigint(20) NOT NULL auto_increment,
  `subject` varchar(255) NOT NULL,
  message text,
  mess_date datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (message_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'messages'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'messages_attachment'
-- 

DROP TABLE IF EXISTS messages_attachment;
CREATE TABLE messages_attachment (
  attachment_Id bigint(20) NOT NULL auto_increment,
  message_id bigint(20) NOT NULL default '0',
  filename varchar(150) NOT NULL,
  downloadfile varchar(50) NOT NULL,
  PRIMARY KEY  (attachment_Id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'messages_attachment'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'messages_contacts'
-- 

DROP TABLE IF EXISTS messages_contacts;
CREATE TABLE messages_contacts (
  user_id bigint(20) NOT NULL default '0',
  contacts_id bigint(20) NOT NULL default '0',
  PRIMARY KEY  (user_id,contacts_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'messages_contacts'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'messages_info'
-- 

DROP TABLE IF EXISTS messages_info;
CREATE TABLE messages_info (
  info_id bigint(20) NOT NULL auto_increment,
  message_id bigint(20) NOT NULL default '0',
  to_id bigint(20) NOT NULL default '0',
  from_id bigint(20) NOT NULL default '0',
  to_viewed enum('No','Yes') NOT NULL default 'No',
  to_answer enum('No','Reply','Forward') NOT NULL default 'No',
  to_stored enum('No','Yes') NOT NULL default 'No',
  to_notify enum('No','Yes') default 'No',
  from_viewed enum('No','Yes') NOT NULL default 'No',
  from_answer enum('No','Reply','Forward') NOT NULL default 'No',
  from_stored enum('No','Yes') NOT NULL default 'No',
  to_delete enum('No','Yes','Trash') NOT NULL default 'No',
  from_delete enum('No','Yes','Trash') NOT NULL default 'No',
  email_status enum('Normal','Request','Video') NOT NULL default 'Normal',
  video_id bigint(20) default NULL,
  attachment enum('No','Yes') NOT NULL default 'No',
  PRIMARY KEY  (info_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'messages_info'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'moods_icons'
-- 

DROP TABLE IF EXISTS moods_icons;
CREATE TABLE moods_icons (
  moods_id int(11) NOT NULL auto_increment,
  moods varchar(200) default NULL,
  moods_image_ext varchar(5) default NULL,
  `status` enum('Yes','No') default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (moods_id),
  KEY ind_status_moods (`status`,moods)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'moods_icons'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music'
-- 

DROP TABLE IF EXISTS music;
CREATE TABLE music (
  music_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  music_album_id bigint(20) NOT NULL default '0',
  thumb_name_id bigint(20) NOT NULL default '0',
  music_file_name_id bigint(20) NOT NULL default '0',
  trimed_music_name_id bigint(20) NOT NULL default '0',
  music_ext varchar(5) default NULL,
  music_size double NOT NULL default '0',
  playing_time varchar(25) NOT NULL,
  music_category_id bigint(20) default NULL,
  music_sub_category_id bigint(20) default NULL,
  music_title varchar(200) default NULL,
  music_caption text,
  music_tags text,
  music_artist text,
  music_year_released year(4) default NULL,
  music_access_type enum('Public','Private') default NULL,
  relation_id text,
  allow_comments enum('Yes','No','Kinda') NOT NULL default 'Yes',
  allow_ratings enum('Yes','No') NOT NULL default 'Yes',
  allow_download enum('Yes','No') NOT NULL default 'Yes',
  allow_embed enum('Yes','No') NOT NULL default 'Yes',
  allow_lyrics enum('Yes','No') NOT NULL default 'Yes',
  rating_total bigint(20) NOT NULL default '0',
  rating_count bigint(20) NOT NULL default '0',
  music_original_filename varchar(255) NOT NULL,
  date_added datetime default NULL,
  total_views bigint(20) default '0',
  total_plays bigint(20) default '0',
  total_comments bigint(20) NOT NULL default '0',
  total_favorites bigint(20) NOT NULL default '0',
  total_featured bigint(20) NOT NULL,
  total_downloads int(11) NOT NULL default '0',
  last_view_date datetime default NULL,
  music_available_formats varchar(45) NOT NULL,
  has_trimmed_music enum('Yes','No','NotSet') NOT NULL default 'NotSet',
  music_server_url varchar(100) default NULL,
  trimmed_music_server_url varchar(250) NOT NULL,
  music_url varchar(255) NOT NULL,
  music_upload_type enum('Normal','externalsiteurl','record') NOT NULL default 'Normal',
  music_featured enum('Yes','No') NOT NULL default 'No',
  music_status enum('Ok','Locked','Deleted') NOT NULL default 'Locked',
  field_1 varchar(250) NOT NULL,
  field_2 varchar(250) NOT NULL,
  field_3 varchar(250) NOT NULL,
  field_4 varchar(250) NOT NULL,
  music_encoded_status enum('No','Partial','Yes') NOT NULL default 'No',
  flagged_status enum('Yes','No') NOT NULL default 'No',
  mass_upload enum('Yes','No') NOT NULL default 'No',
  music_language varchar(25) NOT NULL,
  music_thumb_ext varchar(5) NOT NULL,
  small_width int(11) default NULL,
  small_height int(11) default NULL,
  medium_width int(11) default NULL,
  medium_height int(11) default NULL,
  thumb_width int(11) default NULL,
  thumb_height int(11) default NULL,
  large_width int(11) default NULL,
  large_height int(11) default NULL,
  step_status enum('Step1','Ok') NOT NULL default 'Step1',
  for_sale enum('Yes','No') NOT NULL default 'No',
  music_price double NOT NULL,
  total_purchases int(11) NOT NULL,
  preview_start int(11) NOT NULL,
  preview_end int(11) NOT NULL,
  featured_music_order_id bigint(20) NOT NULL,
  PRIMARY KEY  (music_id),
  KEY total_views (total_views),
  KEY total_plays (total_plays),
  KEY total_comments (total_comments),
  KEY total_favorites (total_favorites),
  KEY total_favorites_2 (total_favorites),
  KEY total_downloads (total_downloads)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_activity'
-- 

DROP TABLE IF EXISTS music_activity;
CREATE TABLE music_activity (
  id bigint(20) NOT NULL auto_increment,
  parent_id bigint(20) NOT NULL,
  content_id bigint(20) NOT NULL,
  action_key varchar(255) NOT NULL,
  action_value text,
  actor_id bigint(20) NOT NULL,
  owner_id bigint(20) NOT NULL,
  `status` enum('Yes','Deleted') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_activity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_advertisement'
-- 

DROP TABLE IF EXISTS music_advertisement;
CREATE TABLE music_advertisement (
  advertisement_id int(11) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  advertisement_name varchar(100) NOT NULL,
  advertisement_description text,
  advertisement_url text,
  advertisement_duration int(11) NOT NULL default '0',
  advertisement_channel text,
  advertisement_audio_ext varchar(100) NOT NULL,
  advertisement_image_ext varchar(100) NOT NULL,
  advertisement_show_at enum('Begining','Ending','Both') NOT NULL default 'Begining',
  advertisement_status enum('Activate','Inactive') NOT NULL default 'Inactive',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (advertisement_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_advertisement'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_album'
-- 

DROP TABLE IF EXISTS music_album;
CREATE TABLE music_album (
  music_album_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  album_title varchar(200) default NULL,
  thumb_music_id bigint(20) default NULL,
  date_added datetime default NULL,
  total_album_views bigint(20) NOT NULL default '0',
  album_for_sale enum('Yes','No') NOT NULL default 'No',
  album_access_type enum('Private','Public') NOT NULL default 'Public',
  album_price double NOT NULL,
  total_purchases int(11) NOT NULL,
  album_featured enum('Yes','No') NOT NULL default 'No',
  PRIMARY KEY  (music_album_id),
  KEY user_id (user_id,thumb_music_id,date_added)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_album'
-- 

INSERT INTO music_album (music_album_id, user_id, album_title, thumb_music_id, date_added, total_album_views, album_for_sale, album_access_type, album_price, total_purchases, album_featured) VALUES (1, 1, 'Anonymous', NULL, NULL, 0, 'No', 'Public', 0, 0, 'No');

-- --------------------------------------------------------

-- 
-- Table structure for table 'music_album_listened'
-- 

DROP TABLE IF EXISTS music_album_listened;
CREATE TABLE music_album_listened (
  music_album_listened_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  album_id bigint(20) default NULL,
  total_plays bigint(20) NOT NULL,
  Last_listened_date datetime default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (music_album_listened_id),
  KEY album_id (album_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_album_listened'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_album_purchase_user_details'
-- 

DROP TABLE IF EXISTS music_album_purchase_user_details;
CREATE TABLE music_album_purchase_user_details (
  music_album_purchase_user_details_id int(11) NOT NULL auto_increment,
  music_order_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  owner_id int(11) NOT NULL,
  album_id int(11) NOT NULL,
  price double NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (music_album_purchase_user_details_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_album_purchase_user_details'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_album_top_chart'
-- 

DROP TABLE IF EXISTS music_album_top_chart;
CREATE TABLE music_album_top_chart (
  music_album_top_chart_id bigint(20) NOT NULL auto_increment,
  album_id bigint(20) NOT NULL,
  top_chart_cron_id bigint(20) NOT NULL,
  total_sales bigint(20) NOT NULL,
  current_position int(11) NOT NULL,
  old_position int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY  (music_album_top_chart_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_album_top_chart'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_album_viewed'
-- 

DROP TABLE IF EXISTS music_album_viewed;
CREATE TABLE music_album_viewed (
  music_album_viewed_id bigint(20) NOT NULL,
  user_id bigint(20) default NULL,
  album_id bigint(20) default NULL,
  total_views bigint(20) NOT NULL,
  last_viewed_date datetime default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (music_album_viewed_id),
  KEY album_id (album_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_album_viewed'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_artist'
-- 

DROP TABLE IF EXISTS music_artist;
CREATE TABLE music_artist (
  music_artist_id bigint(20) NOT NULL auto_increment,
  artist_name varchar(255) NOT NULL,
  search_count bigint(20) NOT NULL default '0',
  result_count bigint(20) NOT NULL default '0',
  last_searched datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (music_artist_id),
  UNIQUE KEY artist_name (artist_name),
  KEY result_count (result_count)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_artist'
-- 

INSERT INTO music_artist (music_artist_id, artist_name, search_count, result_count, last_searched) VALUES (1, 'NotSpecified', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table 'music_artist_category'
-- 

DROP TABLE IF EXISTS music_artist_category;
CREATE TABLE music_artist_category (
  music_artist_category_id bigint(20) NOT NULL auto_increment,
  parent_category_id int(11) NOT NULL default '0',
  music_artist_category_name varchar(200) default NULL,
  music_artist_category_type enum('Porn','General') NOT NULL default 'General',
  music_artist_category_description text,
  music_artist_category_ext varchar(5) NOT NULL,
  music_artist_category_status enum('Yes','No') default NULL,
  priority int(11) NOT NULL default '0',
  date_added datetime default NULL,
  PRIMARY KEY  (music_artist_category_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_artist_category'
-- 

INSERT INTO music_artist_category (music_artist_category_id, parent_category_id, music_artist_category_name, music_artist_category_type, music_artist_category_description, music_artist_category_ext, music_artist_category_status, priority, date_added) VALUES (1, 0, 'test', 'General', 'test', '', 'Yes', 1, '2009-11-30 18:46:55');

-- --------------------------------------------------------

-- 
-- Table structure for table 'music_artist_image'
-- 

DROP TABLE IF EXISTS music_artist_image;
CREATE TABLE music_artist_image (
  music_artist_image bigint(20) NOT NULL auto_increment,
  music_artist_id bigint(20) NOT NULL,
  user_id bigint(20) NOT NULL,
  image_caption text NOT NULL,
  image_ext varchar(10) NOT NULL,
  mini_width int(10) NOT NULL,
  mini_height int(10) NOT NULL,
  small_width int(10) NOT NULL,
  small_height int(10) NOT NULL,
  thumb_width int(10) NOT NULL,
  thumb_height int(10) NOT NULL,
  large_width int(10) NOT NULL,
  large_height int(10) NOT NULL,
  `status` enum('Yes','No','Deleted','ToActivate') NOT NULL default 'ToActivate',
  main_img enum('1','0') NOT NULL default '0',
  date_added datetime NOT NULL,
  PRIMARY KEY  (music_artist_image),
  KEY user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_artist_image'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_artist_member_image'
-- 

DROP TABLE IF EXISTS music_artist_member_image;
CREATE TABLE music_artist_member_image (
  music_artist_member_image bigint(20) NOT NULL auto_increment,
  music_artist_member_id bigint(20) NOT NULL,
  user_id bigint(20) NOT NULL,
  image_caption text NOT NULL,
  image_ext varchar(10) NOT NULL,
  mini_width int(10) NOT NULL,
  mini_height int(10) NOT NULL,
  small_width int(10) NOT NULL,
  small_height int(10) NOT NULL,
  thumb_width int(10) NOT NULL,
  thumb_height int(10) NOT NULL,
  large_width int(10) NOT NULL,
  large_height int(10) NOT NULL,
  `status` enum('Yes','No','Deleted','ToActivate') NOT NULL default 'ToActivate',
  main_img enum('1','0') NOT NULL default '0',
  date_added datetime NOT NULL,
  PRIMARY KEY  (music_artist_member_image),
  KEY user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_artist_member_image'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_artist_promo_image'
-- 

DROP TABLE IF EXISTS music_artist_promo_image;
CREATE TABLE music_artist_promo_image (
  music_artist_promo_image_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  artist_promo_caption text NOT NULL,
  image_ext varchar(10) NOT NULL,
  medium_width int(10) NOT NULL,
  medium_height int(10) NOT NULL,
  small_width int(10) NOT NULL,
  small_height int(10) NOT NULL,
  thumb_width int(10) NOT NULL,
  thumb_height int(10) NOT NULL,
  large_width int(10) NOT NULL,
  large_height int(10) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (music_artist_promo_image_id),
  KEY user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_artist_promo_image'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_artist_top_chart'
-- 

DROP TABLE IF EXISTS music_artist_top_chart;
CREATE TABLE music_artist_top_chart (
  music_artist_top_chart_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  top_chart_cron_id bigint(20) NOT NULL,
  total_sales bigint(20) NOT NULL,
  current_position int(11) NOT NULL,
  old_position int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY  (music_artist_top_chart_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_artist_top_chart'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_artist_viewed'
-- 

DROP TABLE IF EXISTS music_artist_viewed;
CREATE TABLE music_artist_viewed (
  music_artist_viewed_id bigint(20) NOT NULL auto_increment,
  artist_id bigint(20) default NULL,
  user_id bigint(20) default NULL,
  total_views bigint(20) NOT NULL,
  view_date datetime default NULL,
  PRIMARY KEY  (music_artist_viewed_id),
  KEY user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_artist_viewed'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_category'
-- 

DROP TABLE IF EXISTS music_category;
CREATE TABLE music_category (
  music_category_id bigint(20) NOT NULL auto_increment,
  parent_category_id int(11) NOT NULL default '0',
  music_category_name varchar(200) default NULL,
  music_category_type enum('Porn','General') NOT NULL default 'General',
  music_category_description text,
  music_category_ext varchar(5) NOT NULL,
  allow_post enum('Yes','No') NOT NULL default 'Yes',
  music_category_status enum('Yes','No') default NULL,
  priority int(11) NOT NULL default '0',
  date_added datetime default NULL,
  PRIMARY KEY  (music_category_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_category'
-- 

INSERT INTO music_category (music_category_id, parent_category_id, music_category_name, music_category_type, music_category_description, music_category_ext, allow_post, music_category_status, priority, date_added) VALUES (1, 0, 'Test', 'General', NULL, '', 'Yes', 'Yes', 0, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table 'music_comments'
-- 

DROP TABLE IF EXISTS music_comments;
CREATE TABLE music_comments (
  music_comment_id bigint(20) NOT NULL auto_increment,
  music_comment_main_id bigint(20) NOT NULL default '0',
  music_id bigint(20) default NULL,
  comment_user_id bigint(20) default NULL,
  `comment` text,
  comment_status enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (music_comment_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_comments'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_favorite'
-- 

DROP TABLE IF EXISTS music_favorite;
CREATE TABLE music_favorite (
  music_favorite_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  music_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (music_favorite_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_favorite'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_featured'
-- 

DROP TABLE IF EXISTS music_featured;
CREATE TABLE music_featured (
  music_featured_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  music_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (music_featured_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_featured'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_featured_content'
-- 

DROP TABLE IF EXISTS music_featured_content;
CREATE TABLE music_featured_content (
  music_featured_content_id bigint(20) NOT NULL auto_increment,
  image_ext varchar(255) NOT NULL,
  title text NOT NULL,
  description text NOT NULL,
  is_active enum('yes','no') NOT NULL default 'yes',
  start_date datetime NOT NULL,
  end_date datetime NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (music_featured_content_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_featured_content'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_files_settings'
-- 

DROP TABLE IF EXISTS music_files_settings;
CREATE TABLE music_files_settings (
  music_file_id bigint(20) NOT NULL auto_increment,
  file_name varchar(30) NOT NULL,
  file_type enum('Thumb','Music','Trimed') NOT NULL default 'Thumb',
  `status` enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (music_file_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_files_settings'
-- 

INSERT INTO music_files_settings (music_file_id, file_name, file_type, status, date_added) VALUES (1, '', 'Thumb', 'Yes', '2009-06-25 16:01:38');
INSERT INTO music_files_settings (music_file_id, file_name, file_type, status, date_added) VALUES (2, '', 'Music', 'Yes', '2009-06-25 16:01:51');
INSERT INTO music_files_settings (music_file_id, file_name, file_type, status, date_added) VALUES (3, 'Trimed', 'Trimed', 'Yes', '2009-06-25 16:02:17');

-- --------------------------------------------------------

-- 
-- Table structure for table 'music_flagged_contents'
-- 

DROP TABLE IF EXISTS music_flagged_contents;
CREATE TABLE music_flagged_contents (
  flag_id bigint(20) NOT NULL auto_increment,
  content_id bigint(20) NOT NULL default '0',
  content_type enum('Music') NOT NULL default 'Music',
  flag varchar(200) NOT NULL,
  flag_comment text,
  reporter_id bigint(20) NOT NULL,
  `status` enum('Ok','Deleted') NOT NULL default 'Ok',
  date_added datetime default NULL,
  PRIMARY KEY  (flag_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_flagged_contents'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_in_playlist'
-- 

DROP TABLE IF EXISTS music_in_playlist;
CREATE TABLE music_in_playlist (
  music_in_playlist_id bigint(20) NOT NULL auto_increment,
  playlist_id bigint(20) NOT NULL,
  music_id bigint(20) NOT NULL,
  order_id bigint(20) NOT NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (music_in_playlist_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_in_playlist'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_listened'
-- 

DROP TABLE IF EXISTS music_listened;
CREATE TABLE music_listened (
  music_listened_id bigint(20) NOT NULL auto_increment,
  music_id bigint(20) default NULL,
  album_id bigint(20) default NULL,
  user_id bigint(20) default NULL,
  music_owner_id bigint(20) NOT NULL,
  total_plays bigint(20) NOT NULL,
  last_listened datetime default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (music_listened_id),
  KEY music_id (music_id),
  KEY album_id (album_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_listened'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_lyric'
-- 

DROP TABLE IF EXISTS music_lyric;
CREATE TABLE music_lyric (
  music_lyric_id bigint(20) NOT NULL auto_increment,
  music_id bigint(20) default NULL,
  user_id bigint(20) default NULL,
  lyric text,
  best_lyric enum('Yes','No') NOT NULL default 'No',
  lyric_status enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (music_lyric_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_lyric'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_mass_uploader_file_details'
-- 

DROP TABLE IF EXISTS music_mass_uploader_file_details;
CREATE TABLE music_mass_uploader_file_details (
  music_mass_uploader_file_id bigint(20) NOT NULL auto_increment,
  music_mass_upload_title varchar(200) default NULL,
  total_songs bigint(20) NOT NULL default '0',
  file_name varchar(100) default NULL,
  total_songs_moved bigint(20) NOT NULL default '0',
  added_by varchar(50) default NULL,
  date_added datetime default NULL,
  `status` enum('Active','In progress','Completed','Deactivated') NOT NULL default 'Active',
  PRIMARY KEY  (music_mass_uploader_file_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_mass_uploader_file_details'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_mass_uploader_record_details'
-- 

DROP TABLE IF EXISTS music_mass_uploader_record_details;
CREATE TABLE music_mass_uploader_record_details (
  music_mass_uploader_record_id bigint(20) NOT NULL auto_increment,
  music_mass_uploader_file_id bigint(20) NOT NULL default '0',
  music_title varchar(200) default NULL,
  album_name varchar(200) default NULL,
  artist_names varchar(255) default NULL,
  music_year_released year(4) default NULL,
  category_id bigint(20) NOT NULL default '0',
  subcategory_id bigint(20) NOT NULL default '0',
  `language` varchar(30) default NULL,
  image_path varchar(255) default NULL,
  music_file_path varchar(255) default NULL,
  music_tags text,
  field_1 varchar(200) default NULL,
  field_2 varchar(200) default NULL,
  field_3 varchar(200) default NULL,
  field_4 varchar(200) default NULL,
  music_id varchar(20) NOT NULL default '0',
  `status` enum('Active','Completed','Error') NOT NULL default 'Active',
  error_log varchar(250) default NULL,
  PRIMARY KEY  (music_mass_uploader_record_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_mass_uploader_record_details'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_order'
-- 

DROP TABLE IF EXISTS music_order;
CREATE TABLE music_order (
  music_order_id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  amount double NOT NULL,
  currency varchar(10) NOT NULL,
  music_id varchar(100) NOT NULL,
  album_id varchar(100) NOT NULL,
  date_added datetime NOT NULL,
  music_order_status enum('Yes','No') NOT NULL default 'No',
  music_order_update datetime NOT NULL,
  PRIMARY KEY  (music_order_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_order'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_other_format_downloads'
-- 

DROP TABLE IF EXISTS music_other_format_downloads;
CREATE TABLE music_other_format_downloads (
  music_other_format_downloads_id bigint(20) NOT NULL auto_increment,
  music_id bigint(20) NOT NULL default '0',
  music_type varchar(5) NOT NULL,
  total_downloads int(10) NOT NULL default '0',
  PRIMARY KEY  (music_other_format_downloads_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_other_format_downloads'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_playlist'
-- 

DROP TABLE IF EXISTS music_playlist;
CREATE TABLE music_playlist (
  playlist_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  playlist_name varchar(250) NOT NULL,
  playlist_description text character set latin1 collate latin1_general_ci,
  playlist_tags text character set latin1 collate latin1_general_ci,
  featured enum('Yes','No') NOT NULL default 'No',
  date_added datetime NOT NULL,
  total_tracks int(11) NOT NULL default '0',
  total_views bigint(20) NOT NULL default '0',
  total_comments bigint(20) NOT NULL,
  rating_total bigint(20) NOT NULL,
  rating_count bigint(20) NOT NULL,
  total_favorites bigint(20) NOT NULL default '0',
  total_featured bigint(20) NOT NULL,
  last_viewed_date datetime NOT NULL,
  thumb_music_id bigint(20) NOT NULL,
  thumb_ext varchar(20) NOT NULL,
  relation_id text,
  playlist_status enum('Yes','No') NOT NULL default 'Yes',
  allow_comments enum('Yes','No','Kinda') NOT NULL default 'Yes',
  allow_ratings enum('Yes','No') NOT NULL default 'Yes',
  allow_embed enum('Yes','No') NOT NULL default 'Yes',
  PRIMARY KEY  (playlist_id),
  KEY user_id (user_id,playlist_name),
  KEY thumb_music_id (thumb_music_id),
  FULLTEXT KEY playlist_description (playlist_description,playlist_tags),
  FULLTEXT KEY relation_id (relation_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_playlist'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_playlist_comments'
-- 

DROP TABLE IF EXISTS music_playlist_comments;
CREATE TABLE music_playlist_comments (
  playlist_comment_id bigint(20) NOT NULL auto_increment,
  playlist_comment_main_id bigint(20) NOT NULL default '0',
  playlist_id bigint(20) default NULL,
  comment_user_id bigint(20) default NULL,
  `comment` text,
  comment_status enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (playlist_comment_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_playlist_comments'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_playlist_favorite'
-- 

DROP TABLE IF EXISTS music_playlist_favorite;
CREATE TABLE music_playlist_favorite (
  music_playlist_favorite_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  playlist_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (music_playlist_favorite_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_playlist_favorite'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_playlist_featured'
-- 

DROP TABLE IF EXISTS music_playlist_featured;
CREATE TABLE music_playlist_featured (
  music_playlist_featured_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  playlist_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (music_playlist_featured_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_playlist_featured'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_playlist_listened'
-- 

DROP TABLE IF EXISTS music_playlist_listened;
CREATE TABLE music_playlist_listened (
  playlist_listened_id bigint(20) NOT NULL auto_increment,
  playlist_id bigint(20) default NULL,
  user_id bigint(20) default NULL,
  playlist_owner_id bigint(20) NOT NULL,
  total_visits bigint(20) NOT NULL default '0',
  last_listened datetime default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (playlist_listened_id),
  KEY playlist_id (playlist_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_playlist_listened'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_playlist_rating'
-- 

DROP TABLE IF EXISTS music_playlist_rating;
CREATE TABLE music_playlist_rating (
  rating_id bigint(20) NOT NULL auto_increment,
  playlist_id bigint(20) NOT NULL default '0',
  user_id bigint(20) NOT NULL default '0',
  rate int(2) NOT NULL default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (rating_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_playlist_rating'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_playlist_tags'
-- 

DROP TABLE IF EXISTS music_playlist_tags;
CREATE TABLE music_playlist_tags (
  music_tag_id bigint(20) NOT NULL auto_increment,
  tag_name varchar(255) NOT NULL,
  search_count bigint(20) NOT NULL default '0',
  result_count bigint(20) NOT NULL default '0',
  last_searched datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (music_tag_id),
  UNIQUE KEY tag_name (tag_name),
  KEY result_count (result_count)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_playlist_tags'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_playlist_viewed'
-- 

DROP TABLE IF EXISTS music_playlist_viewed;
CREATE TABLE music_playlist_viewed (
  playlist_viewed_id bigint(20) NOT NULL auto_increment,
  playlist_id bigint(20) default NULL,
  user_id bigint(20) default NULL,
  playlist_owner_id bigint(20) NOT NULL,
  total_views bigint(20) NOT NULL,
  last_viewed datetime default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (playlist_viewed_id),
  KEY ind_playlist_id (playlist_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_playlist_viewed'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_purchase_user_details'
-- 

DROP TABLE IF EXISTS music_purchase_user_details;
CREATE TABLE music_purchase_user_details (
  music_purchase_user_details_id int(11) NOT NULL auto_increment,
  music_order_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  owner_id int(11) NOT NULL,
  music_id int(11) NOT NULL,
  album_id int(11) NOT NULL,
  price double NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (music_purchase_user_details_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_purchase_user_details'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_rating'
-- 

DROP TABLE IF EXISTS music_rating;
CREATE TABLE music_rating (
  rating_id bigint(20) NOT NULL auto_increment,
  music_id bigint(20) NOT NULL default '0',
  user_id bigint(20) NOT NULL default '0',
  rate int(2) NOT NULL default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (rating_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_rating'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_song_top_chart'
-- 

DROP TABLE IF EXISTS music_song_top_chart;
CREATE TABLE music_song_top_chart (
  music_top_chart_id bigint(20) NOT NULL auto_increment,
  music_id bigint(20) NOT NULL,
  top_chart_cron_id bigint(20) NOT NULL,
  total_sales bigint(20) NOT NULL,
  current_position int(11) NOT NULL,
  old_position int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY  (music_top_chart_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_song_top_chart'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_tags'
-- 

DROP TABLE IF EXISTS music_tags;
CREATE TABLE music_tags (
  music_tag_id bigint(20) NOT NULL auto_increment,
  tag_name varchar(255) NOT NULL,
  search_count bigint(20) NOT NULL default '0',
  result_count bigint(20) NOT NULL default '0',
  last_searched datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (music_tag_id),
  UNIQUE KEY tag_name (tag_name),
  KEY result_count (result_count)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_tags'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_top_chart_cron'
-- 

DROP TABLE IF EXISTS music_top_chart_cron;
CREATE TABLE music_top_chart_cron (
  top_chart_cron_id bigint(20) NOT NULL auto_increment,
  top_chart_type enum('Music','Album','Artist') NOT NULL default 'Music',
  date_started datetime NOT NULL,
  date_ended datetime NOT NULL,
  PRIMARY KEY  (top_chart_cron_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_top_chart_cron'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_user_default_settings'
-- 

DROP TABLE IF EXISTS music_user_default_settings;
CREATE TABLE music_user_default_settings (
  music_user_default_settings_id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  music_category_id int(11) NOT NULL default '1',
  music_sub_category_id int(11) NOT NULL,
  music_tags text,
  music_access_type enum('Public','Private') default NULL,
  allow_comments enum('Yes','No','Kinda') NOT NULL default 'Yes',
  allow_ratings enum('Yes','No') NOT NULL default 'Yes',
  allow_download enum('Yes','No') NOT NULL default 'Yes',
  allow_embed enum('Yes','No') NOT NULL default 'Yes',
  allow_lyrics enum('Yes','No') NOT NULL default 'Yes',
  for_sale enum('Yes','No') NOT NULL default 'No',
  music_price double NOT NULL,
  music_language varchar(25) NOT NULL,
  relation_id text NOT NULL,
  preview_start int(11) NOT NULL,
  preview_end int(11) NOT NULL,
  PRIMARY KEY  (music_user_default_settings_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_user_default_settings'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_user_payment_settings'
-- 

DROP TABLE IF EXISTS music_user_payment_settings;
CREATE TABLE music_user_payment_settings (
  music_user_payment_settings_id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  paypal_id varchar(255) NOT NULL,
  total_revenue double NOT NULL,
  pending_amount double NOT NULL,
  commission_amount double NOT NULL,
  withdrawl_amount double NOT NULL,
  threshold_amount double NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (music_user_payment_settings_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_user_payment_settings'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_user_settings'
-- 

DROP TABLE IF EXISTS music_user_settings;
CREATE TABLE music_user_settings (
  id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  is_music_upload_background_image enum('Yes','No') NOT NULL default 'No',
  music_background_ext varchar(5) default NULL,
  music_background_offset int(11) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_user_settings'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'music_viewed'
-- 

DROP TABLE IF EXISTS music_viewed;
CREATE TABLE music_viewed (
  music_viewed_id bigint(20) NOT NULL auto_increment,
  music_id bigint(20) default NULL,
  user_id bigint(20) default NULL,
  music_owner_id bigint(20) NOT NULL,
  total_views bigint(20) NOT NULL,
  last_viewed datetime default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (music_viewed_id),
  KEY ind_music_id (music_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'music_viewed'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'network'
-- 

DROP TABLE IF EXISTS network;
CREATE TABLE network (
  network_id bigint(20) unsigned NOT NULL auto_increment,
  owner_id bigint(20) unsigned NOT NULL,
  friend_id bigint(20) unsigned NOT NULL,
  network_relation enum('Fan','Mutual') NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (network_id),
  UNIQUE KEY owner_id (owner_id,friend_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'network'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'news_blog'
-- 

DROP TABLE IF EXISTS news_blog;
CREATE TABLE news_blog (
  news_blog_id bigint(20) NOT NULL auto_increment,
  title text,
  description longtext,
  `status` enum('Activate','Toactivate') NOT NULL default 'Toactivate',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (news_blog_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'news_blog'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'news_letter'
-- 

DROP TABLE IF EXISTS news_letter;
CREATE TABLE news_letter (
  news_letter_id bigint(20) NOT NULL auto_increment,
  `subject` varchar(200) default NULL,
  body text,
  date_added datetime default NULL,
  upto_user_id bigint(20) default '0',
  total_sent bigint(20) default '0',
  `status` enum('Pending','Started','Finished') default 'Pending',
  sql_condition text,
  PRIMARY KEY  (news_letter_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'news_letter'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'notification'
-- 

DROP TABLE IF EXISTS notification;
CREATE TABLE notification (
  notification_id int(11) NOT NULL auto_increment,
  module varchar(100) NOT NULL,
  notification varchar(100) NOT NULL,
  default_status enum('Yes','No') NOT NULL default 'Yes',
  changeable_by_user enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime NOT NULL,
  PRIMARY KEY  (notification_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'notification'
-- 

INSERT INTO notification (notification_id, module, notification, default_status, changeable_by_user, date_added) VALUES (1, 'general', 'friends_birthdays', 'Yes', 'Yes', '2010-05-05 12:28:25');
INSERT INTO notification (notification_id, module, notification, default_status, changeable_by_user, date_added) VALUES (2, 'general', 'friend_suggestion', 'Yes', 'Yes', '2010-05-05 12:28:25');
INSERT INTO notification (notification_id, module, notification, default_status, changeable_by_user, date_added) VALUES (3, 'general', 'friend_invitation', 'Yes', 'Yes', '2010-05-05 12:29:21');
INSERT INTO notification (notification_id, module, notification, default_status, changeable_by_user, date_added) VALUES (4, 'general', 'new_mail_inbox', 'Yes', 'Yes', '2010-05-05 12:29:21');
INSERT INTO notification (notification_id, module, notification, default_status, changeable_by_user, date_added) VALUES (5, 'general', 'new_profile_scrap', 'Yes', 'Yes', '2010-05-05 12:29:21');
INSERT INTO notification (notification_id, module, notification, default_status, changeable_by_user, date_added) VALUES (6, 'general', 'newsletter', 'Yes', 'Yes', '2010-05-05 12:29:21');

-- --------------------------------------------------------

-- 
-- Table structure for table 'notification_settings'
-- 

DROP TABLE IF EXISTS notification_settings;
CREATE TABLE notification_settings (
  notification_settings_id int(11) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  notification_id int(11) NOT NULL,
  `status` enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime NOT NULL,
  PRIMARY KEY  (notification_settings_id),
  UNIQUE KEY user_id (user_id,notification_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'notification_settings'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'package'
-- 

DROP TABLE IF EXISTS package;
CREATE TABLE package (
  package_id int(11) NOT NULL auto_increment,
  package_name varchar(100) NOT NULL,
  description text,
  space double NOT NULL default '0',
  bandwidth double NOT NULL default '0',
  price double NOT NULL default '0',
  video_limit int(11) NOT NULL default '0',
  subscription_period varchar(100) NOT NULL,
  `status` enum('Activate','Toactivate') NOT NULL default 'Activate',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (package_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'package'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'paypal_transaction'
-- 

DROP TABLE IF EXISTS paypal_transaction;
CREATE TABLE paypal_transaction (
  id bigint(20) NOT NULL auto_increment,
  music_order_id int(11) NOT NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  ip varchar(15) NOT NULL,
  user_id bigint(20) NOT NULL default '0',
  currency_type varchar(12) NOT NULL,
  txn_id varchar(50) default NULL,
  payer_email varchar(150) default NULL,
  payment_date varchar(30) default NULL,
  payment_gross double(50,5) default NULL,
  payment_fee double(50,5) default NULL,
  mc_currency varchar(12) NOT NULL,
  payment_status varchar(20) default NULL,
  pending_reason varchar(20) default NULL,
  receiver_email varchar(100) default NULL,
  paypal_response varchar(20) default NULL,
  error_no tinyint(4) NOT NULL default '0',
  memo text,
  paypal_post_vars text,
  PRIMARY KEY  (id),
  KEY txn_id (txn_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='PayPal Transaction Log Details';

-- 
-- Dumping data for table 'paypal_transaction'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo'
-- 

DROP TABLE IF EXISTS photo;
CREATE TABLE photo (
  photo_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  photo_album_id bigint(20) NOT NULL default '0',
  photo_file_name_id bigint(20) NOT NULL,
  photo_ext varchar(5) default NULL,
  photo_size double NOT NULL default '0',
  photo_category_id bigint(20) default NULL,
  photo_sub_category_id int(11) NOT NULL default '0',
  photo_title varchar(200) default NULL,
  photo_caption text,
  photo_original_filename varchar(255) NOT NULL,
  photo_tags text,
  photo_access_type enum('Public','Private') default NULL,
  relation_id text,
  allow_comments enum('Yes','No','Kinda') NOT NULL default 'Yes',
  allow_ratings enum('Yes','No') NOT NULL default 'Yes',
  allow_tags enum('Yes','No') NOT NULL default 'Yes',
  allow_download enum('Yes','No') NOT NULL default 'Yes',
  allow_embed enum('Yes','No') NOT NULL default 'Yes',
  date_recorded datetime NOT NULL default '0000-00-00 00:00:00',
  location_recorded text NOT NULL,
  google_map_latitude double NOT NULL default '0',
  google_map_longtitude double NOT NULL default '0',
  rating_total bigint(20) NOT NULL default '0',
  rating_count bigint(20) NOT NULL default '0',
  date_added datetime default NULL,
  is_downloadable enum('no','yes') NOT NULL default 'yes',
  total_views bigint(20) default '0',
  total_comments bigint(20) NOT NULL default '0',
  total_favorites bigint(20) NOT NULL default '0',
  total_featured bigint(20) NOT NULL,
  total_downloads int(11) NOT NULL default '0',
  total_people_tags int(11) NOT NULL default '0',
  last_view_date datetime default NULL,
  t_width int(11) default '0',
  t_height int(11) default '0',
  m_width bigint(20) NOT NULL,
  m_height bigint(20) NOT NULL,
  s_width int(11) default '0',
  s_height int(11) default '0',
  l_width int(11) default '0',
  l_height int(11) default '0',
  photo_server_url varchar(250) default NULL,
  photo_upload_type enum('Normal','Capture','external','MultiUpload') NOT NULL default 'Normal',
  personalized_url text,
  featured enum('Yes','No') NOT NULL default 'No',
  index_photo enum('Yes','No') NOT NULL default 'No',
  photo_status enum('Ok','Locked','Deleted') NOT NULL default 'Locked',
  flagged_status enum('','Yes','No') NOT NULL,
  mass_upload enum('Yes','No') NOT NULL default 'No',
  total_responded int(10) NOT NULL default '0',
  total_linked int(10) NOT NULL default '0',
  price double NOT NULL default '0',
  external_photo_url text NOT NULL,
  featured_photo_order_id bigint(20) NOT NULL,
  PRIMARY KEY  (photo_id),
  KEY photo_status (photo_status,photo_id,user_id),
  KEY photo_status_last_view_photo (photo_status,last_view_date),
  KEY photo_category_id (photo_category_id),
  KEY photo_status_category_id (photo_status,photo_category_id),
  KEY user_id (user_id,photo_id),
  FULLTEXT KEY photo_tags (photo_tags)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_activity'
-- 

DROP TABLE IF EXISTS photo_activity;
CREATE TABLE photo_activity (
  id bigint(20) NOT NULL auto_increment,
  parent_id bigint(20) NOT NULL,
  content_id bigint(20) NOT NULL,
  action_key varchar(255) NOT NULL,
  action_value text,
  actor_id bigint(20) NOT NULL,
  owner_id bigint(20) NOT NULL,
  `status` enum('Yes','Deleted') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_activity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_album'
-- 

DROP TABLE IF EXISTS photo_album;
CREATE TABLE photo_album (
  photo_album_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  photo_album_title varchar(200) default NULL,
  photo_album_description text NOT NULL,
  thumb_photo_id bigint(20) default NULL,
  date_added datetime default NULL,
  total_album_views bigint(20) default '0',
  album_access_type enum('Public','Private') NOT NULL default 'Public',
  PRIMARY KEY  (photo_album_id),
  KEY user_id (user_id,thumb_photo_id,date_added)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_album'
-- 

INSERT INTO photo_album (photo_album_id, user_id, photo_album_title, photo_album_description, thumb_photo_id, date_added, total_album_views, album_access_type) VALUES (1, 1, 'Public', '', NULL, '2010-01-08 10:33:57', 0, 'Public');

-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_album_viewed'
-- 

DROP TABLE IF EXISTS photo_album_viewed;
CREATE TABLE photo_album_viewed (
  photo_album_viewed_id bigint(20) NOT NULL,
  user_id bigint(20) default NULL,
  photo_album_id bigint(20) default NULL,
  total_views bigint(20) NOT NULL,
  viewed_date datetime default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (photo_album_viewed_id),
  KEY album_id (photo_album_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_album_viewed'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_category'
-- 

DROP TABLE IF EXISTS photo_category;
CREATE TABLE photo_category (
  photo_category_id bigint(20) NOT NULL auto_increment,
  parent_category_id int(11) NOT NULL default '0',
  photo_category_name varchar(200) default NULL,
  photo_category_type enum('Porn','General') NOT NULL default 'General',
  photo_category_description text,
  photo_category_ext varchar(5) NOT NULL,
  allow_post enum('Yes','No') NOT NULL default 'Yes',
  photo_category_status enum('Yes','No') default 'Yes',
  priority int(11) NOT NULL default '0',
  date_added datetime default NULL,
  PRIMARY KEY  (photo_category_id),
  KEY parent_category_id (parent_category_id),
  KEY photo_category_type (photo_category_type),
  KEY parent_photo_category_id (parent_category_id,photo_category_name),
  KEY parent_photo_category_id_priority (parent_category_id,priority)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_category'
-- 

INSERT INTO photo_category (photo_category_id, parent_category_id, photo_category_name, photo_category_type, photo_category_description, photo_category_ext, allow_post, photo_category_status, priority, date_added) VALUES (1, 0, 'test category', 'General', 'Test Category', 'jpg', 'Yes', 'Yes', 1, '2009-12-08 16:12:05');
INSERT INTO photo_category (photo_category_id, parent_category_id, photo_category_name, photo_category_type, photo_category_description, photo_category_ext, allow_post, photo_category_status, priority, date_added) VALUES (2, 0, 'nature', 'General', 'Nature Category', 'jpg', 'Yes', 'Yes', 2, '2009-12-08 16:18:05');

-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_comments'
-- 

DROP TABLE IF EXISTS photo_comments;
CREATE TABLE photo_comments (
  photo_comment_id bigint(20) NOT NULL auto_increment,
  photo_comment_main_id bigint(20) NOT NULL default '0',
  photo_id bigint(20) default NULL,
  comment_user_id bigint(20) default NULL,
  `comment` text,
  comment_status enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (photo_comment_id),
  KEY ind_photo_id (photo_id,photo_comment_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_comments'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_favorite'
-- 

DROP TABLE IF EXISTS photo_favorite;
CREATE TABLE photo_favorite (
  photo_favorite_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  photo_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (photo_favorite_id),
  KEY photo_favorite_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_favorite'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_featured'
-- 

DROP TABLE IF EXISTS photo_featured;
CREATE TABLE photo_featured (
  photo_featured_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  photo_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (photo_featured_id),
  KEY ind_photo_featured_id (photo_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_featured'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_files_settings'
-- 

DROP TABLE IF EXISTS photo_files_settings;
CREATE TABLE photo_files_settings (
  photo_file_id bigint(20) NOT NULL auto_increment,
  file_name varchar(30) NOT NULL,
  file_type enum('Photo') NOT NULL default 'Photo',
  `status` enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (photo_file_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_files_settings'
-- 

INSERT INTO photo_files_settings (photo_file_id, file_name, file_type, status, date_added) VALUES (1, '', 'Photo', 'Yes', '2009-12-10 11:17:39');

-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_flagged_contents'
-- 

DROP TABLE IF EXISTS photo_flagged_contents;
CREATE TABLE photo_flagged_contents (
  flag_id bigint(20) NOT NULL auto_increment,
  content_id bigint(20) NOT NULL default '0',
  flag varchar(200) NOT NULL,
  flag_comment text,
  reporter_id bigint(20) NOT NULL,
  `status` enum('Ok','Deleted') NOT NULL default 'Ok',
  date_added datetime default NULL,
  PRIMARY KEY  (flag_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_flagged_contents'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_in_playlist'
-- 

DROP TABLE IF EXISTS photo_in_playlist;
CREATE TABLE photo_in_playlist (
  photo_in_playlist_id bigint(20) NOT NULL auto_increment,
  photo_playlist_id bigint(20) NOT NULL,
  photo_id bigint(20) NOT NULL,
  order_id bigint(20) NOT NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (photo_in_playlist_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_in_playlist'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_meta_data'
-- 

DROP TABLE IF EXISTS photo_meta_data;
CREATE TABLE photo_meta_data (
  meta_data_id bigint(20) NOT NULL auto_increment,
  photo_id bigint(20) NOT NULL,
  meta_data text NOT NULL,
  PRIMARY KEY  (meta_data_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_meta_data'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_people_tag'
-- 

DROP TABLE IF EXISTS photo_people_tag;
CREATE TABLE photo_people_tag (
  photo_people_tag_id int(11) NOT NULL auto_increment,
  photo_id bigint(20) NOT NULL,
  photo_owner_id bigint(20) NOT NULL,
  tag_name varchar(50) NOT NULL,
  x int(11) NOT NULL,
  y int(11) NOT NULL,
  width int(11) NOT NULL,
  height int(11) NOT NULL,
  email_id varchar(250) default NULL,
  associate_user_id bigint(20) NOT NULL default '0',
  tagged_by_user_id bigint(20) NOT NULL,
  date_added timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (photo_people_tag_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_people_tag'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_playlist'
-- 

DROP TABLE IF EXISTS photo_playlist;
CREATE TABLE photo_playlist (
  photo_playlist_id bigint(20) NOT NULL auto_increment,
  photo_playlist_name varchar(250) NOT NULL,
  photo_playlist_description text NOT NULL,
  created_by_user_id bigint(20) NOT NULL,
  total_photos bigint(20) NOT NULL,
  featured enum('Yes','No') NOT NULL default 'No',
  date_added datetime NOT NULL,
  total_views bigint(20) NOT NULL default '0',
  photo_playlist_status enum('Yes','No') NOT NULL default 'Yes',
  last_viewed_date datetime NOT NULL,
  PRIMARY KEY  (photo_playlist_id),
  KEY playlist_user_id (created_by_user_id,photo_playlist_name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_playlist'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_playlist_viewed'
-- 

DROP TABLE IF EXISTS photo_playlist_viewed;
CREATE TABLE photo_playlist_viewed (
  photo_playlist_viewed_id bigint(20) NOT NULL auto_increment,
  photo_playlist_id bigint(20) default NULL,
  user_id bigint(20) default NULL,
  playlist_owner_id bigint(20) NOT NULL,
  total_views bigint(20) NOT NULL default '0',
  viewed_date datetime default NULL,
  PRIMARY KEY  (photo_playlist_viewed_id),
  KEY playlist_id (photo_playlist_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_playlist_viewed'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_rating'
-- 

DROP TABLE IF EXISTS photo_rating;
CREATE TABLE photo_rating (
  photo_rating_id bigint(20) NOT NULL auto_increment,
  photo_id bigint(20) NOT NULL default '0',
  user_id bigint(20) NOT NULL default '0',
  rate int(2) NOT NULL default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (photo_rating_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_rating'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_tags'
-- 

DROP TABLE IF EXISTS photo_tags;
CREATE TABLE photo_tags (
  photo_tag_id bigint(20) NOT NULL auto_increment,
  tag_name varchar(255) NOT NULL,
  search_count bigint(20) NOT NULL default '0',
  result_count bigint(20) NOT NULL default '0',
  last_searched datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (photo_tag_id),
  UNIQUE KEY tag_name (tag_name),
  KEY result_count (result_count)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_tags'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_user_default_setting'
-- 

DROP TABLE IF EXISTS photo_user_default_setting;
CREATE TABLE photo_user_default_setting (
  photo_default_setting_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  album_id bigint(20) NOT NULL,
  photo_category_id bigint(20) NOT NULL,
  photo_sub_category_id bigint(20) NOT NULL,
  photo_tags text NOT NULL,
  allow_tags enum('Yes','No') NOT NULL default 'Yes',
  photo_access_type enum('Public','Private') NOT NULL default 'Public',
  allow_comments enum('Yes','No','Kinda') NOT NULL default 'Yes',
  allow_ratings enum('Yes','No') NOT NULL default 'Yes',
  allow_embed enum('Yes','No') NOT NULL default 'Yes',
  relation_id text NOT NULL,
  PRIMARY KEY  (photo_default_setting_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_user_default_setting'
-- 

INSERT INTO photo_user_default_setting (photo_default_setting_id, user_id, album_id, photo_category_id, photo_sub_category_id, photo_tags, allow_tags, photo_access_type, allow_comments, allow_ratings, allow_embed, relation_id) VALUES (1, 1, 1, 1, 0, 'webmaster', 'Yes', 'Public', 'Yes', 'Yes', 'Yes', '');

-- --------------------------------------------------------

-- 
-- Table structure for table 'photo_viewed'
-- 

DROP TABLE IF EXISTS photo_viewed;
CREATE TABLE photo_viewed (
  photo_viewed_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  photo_id bigint(20) default NULL,
  photo_owner_id bigint(20) NOT NULL,
  total_views bigint(20) NOT NULL,
  view_date datetime default NULL,
  PRIMARY KEY  (photo_viewed_id),
  KEY ind_photo_id (photo_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'photo_viewed'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'profile_block'
-- 

DROP TABLE IF EXISTS profile_block;
CREATE TABLE profile_block (
  profile_block_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  module_name varchar(50) default NULL,
  block_name varchar(50) default NULL,
  block_description text,
  order_no int(11) NOT NULL default '0',
  position enum('left','right') default NULL,
  display enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  profile_category_id int(11) NOT NULL,
  PRIMARY KEY  (profile_block_id),
  KEY display_order_no (display,order_no)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'profile_block'
-- 
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(1, 1, 'default', 'myscraps', 'myscraps', 4, 'right', 'Yes', '2009-04-09 16:34:10', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(2, 1, 'default', 'myotherinfo', 'myotherinfo', 3, 'left', 'No', '2009-04-09 16:34:19', 2);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(3, 1, 'default', 'mypersonalinfo', 'mypersonalinfo', 5, 'left', 'Yes', '2009-04-09 15:18:38', 1);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(4, 1, 'default', 'myfriends', 'myfriends', 3, 'right', 'Yes', '2009-04-09 15:19:18', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(5, 1, 'default', 'aboutme', 'aboutme', 1, 'right', 'Yes', '2009-05-12 18:57:06', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(6, 1, 'default', 'mysubscribers', 'mysubscribers', 2, 'right', 'No', '2010-04-02 12:08:02', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(7, 1, 'music', 'mymusic', 'mymusic', 2, 'left', 'Yes', '2009-05-12 18:57:06', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(8, 1, 'music', 'featuredmusic', 'featuredmusic', 0, 'right', 'No', '2009-05-12 18:57:06', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(9, 1, 'music', 'myalbum', 'myalbum', 0, 'left', 'No', '2010-01-07 12:03:10', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(10, 1, 'photo', 'myphoto', 'Photo Self', 3, 'left', 'Yes', '2010-02-23 16:24:59', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(11, 1, 'photo', 'myphotoalbum', 'Album Self', 5, 'left', 'No', '2010-02-23 16:25:32', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(12, 1, 'photo', 'myfeaturedphoto', 'Featured Photo', 1, 'right', 'No', '2010-03-10 15:52:58', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(13, 1, 'video', 'myvideo', 'myvideo', 1, 'left', 'Yes', '2009-03-05 19:24:21', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(14, 1, 'video', 'featuredvideo', 'featuredvideo', 0, 'right', 'No', '2009-04-09 15:19:18', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(17, 1, 'default', 'recentblogarticleforum', 'recentblogarticleforum', 4, 'left', 'Yes', '2010-07-24 11:02:08', 0);
INSERT INTO `profile_block` (profile_block_id, user_id, module_name, block_name, block_description, order_no, position, display, date_added, profile_category_id) VALUES(18, 1, 'default', 'featuredmedia', 'featuredmedia', 2, 'right', 'Yes', '2010-07-24 11:02:08', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table 'profile_cam_image'
-- 

DROP TABLE IF EXISTS profile_cam_image;
CREATE TABLE profile_cam_image (
  profile_cam_image_id bigint(11) NOT NULL auto_increment,
  user_id bigint(11) NOT NULL,
  profile_image_name varchar(50) NOT NULL,
  profile_image_extension varchar(50) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (profile_cam_image_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'profile_cam_image'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'receive_bugs'
-- 

DROP TABLE IF EXISTS receive_bugs;
CREATE TABLE receive_bugs (
  bug_id bigint(20) NOT NULL auto_increment,
  client_bug_id bigint(20) NOT NULL,
  bug_subject text NOT NULL,
  bug_content text NOT NULL,
  bug_site text NOT NULL,
  secret_key varchar(252) NOT NULL,
  parent_id bigint(20) NOT NULL default '0',
  reply_from varchar(200) default NULL,
  `status` enum('Open','Closed') NOT NULL default 'Open',
  date_added datetime NOT NULL,
  date_closed datetime NOT NULL,
  PRIMARY KEY  (bug_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'receive_bugs'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'reencode_video'
-- 

DROP TABLE IF EXISTS reencode_video;
CREATE TABLE reencode_video (
  encode_id bigint(20) NOT NULL auto_increment,
  video_id bigint(20) NOT NULL,
  encode_command text,
  encode_added_date datetime NOT NULL,
  encode_via_cron enum('Yes','No') NOT NULL,
  encode_status enum('Yes','No') default NULL,
  move enum('Yes','No') default NULL,
  PRIMARY KEY  (encode_id),
  KEY video_id (video_id),
  KEY encode_status (encode_status)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'reencode_video'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'reported_users'
-- 

DROP TABLE IF EXISTS reported_users;
CREATE TABLE reported_users (
  report_id bigint(20) NOT NULL auto_increment,
  reported_user_id bigint(20) NOT NULL,
  reporter_id bigint(20) NOT NULL,
  custom_message text NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (report_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'reported_users'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'reported_users_info'
-- 

DROP TABLE IF EXISTS reported_users_info;
CREATE TABLE reported_users_info (
  reported_users_info_id bigint(20) NOT NULL auto_increment,
  report_id bigint(20) NOT NULL,
  flag enum('Nudity','Racist','HateSpeech','Cyberbullying','Threatensmeorothers','UnwantedContact') NOT NULL,
  PRIMARY KEY  (reported_users_info_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'reported_users_info'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'search_settings'
-- 

DROP TABLE IF EXISTS search_settings;
CREATE TABLE search_settings (
  id bigint(20) NOT NULL auto_increment,
  module varchar(50) NOT NULL,
  label varchar(255) NOT NULL,
  file_name varchar(150) NOT NULL,
  normal_querystring varchar(150) NOT NULL,
  seo_querystring varchar(150) NOT NULL,
  default_search tinyint(1) NOT NULL default '0',
  priority tinyint(4) NOT NULL default '0',
  `status` enum('Yes','No') NOT NULL default 'No',
  PRIMARY KEY  (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'search_settings'
-- 

INSERT INTO search_settings (id, module, label, file_name, normal_querystring, seo_querystring, default_search, priority, status) VALUES (1, 'general', 'Members', 'memberslist', '?tags=', '?tags=', 0, 1, 'Yes');
INSERT INTO search_settings (id, module, label, file_name, normal_querystring, seo_querystring, default_search, priority, status) VALUES (2, 'music', 'Music', 'musiclist', '?pg=musicnew&tags=', 'musicnew/?tags=', 1, 0, 'Yes');
INSERT INTO search_settings (id, module, label, file_name, normal_querystring, seo_querystring, default_search, priority, status) VALUES (3, 'photo', 'Photos', 'photolist', 'pg=photonew&tags=', 'photonew.html?tags=', 1, 2, 'Yes');
INSERT INTO search_settings (id, module, label, file_name, normal_querystring, seo_querystring, default_search, priority, status) VALUES (4, 'video', 'Video', 'videolist', '?pg=videonew&tags=', 'videonew/?tags=', 1, 0, 'Yes');

-- --------------------------------------------------------

-- 
-- Table structure for table 'server_settings'
-- 

DROP TABLE IF EXISTS server_settings;
CREATE TABLE server_settings (
  server_id bigint(20) NOT NULL auto_increment,
  server_url varchar(200) default NULL,
  server_for varchar(100) default NULL,
  category int(11) NOT NULL default '0',
  server_status enum('Yes','No') default NULL,
  ftp_server varchar(200) default NULL,
  ftp_folder text,
  ftp_usrename varchar(100) default NULL,
  ftp_password varchar(100) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (server_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'server_settings'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'shoutout'
-- 

DROP TABLE IF EXISTS shoutout;
CREATE TABLE shoutout (
  shoutout_id bigint(20) NOT NULL auto_increment,
  shoutout text,
  moods_id int(11) default NULL,
  user_id bigint(20) default NULL,
  `status` enum('Ok','Blocked') NOT NULL default 'Ok',
  date_added datetime default NULL,
  PRIMARY KEY  (shoutout_id),
  KEY ind_date_user_id (date_added,user_id),
  KEY ind_user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'shoutout'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'static_pages'
-- 

DROP TABLE IF EXISTS static_pages;
CREATE TABLE static_pages (
  page_name varchar(100) NOT NULL,
  title varchar(100) NOT NULL,
  content blob NOT NULL,
  main_page_content longtext,
  display_in enum('Root','Member','Both') NOT NULL default 'Both',
  `status` enum('Activate','Toactivate','Main') NOT NULL default 'Toactivate',
  date_added datetime NOT NULL,
  PRIMARY KEY  (page_name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'static_pages'
-- 

INSERT INTO static_pages (page_name, title, content, main_page_content, display_in, status, date_added) VALUES ('useterms', 'useterms', 0x3c703e5465726d73206f662075736520636f6d657320686572653c2f703e, '', 'Both', 'Activate', '2008-03-12 11:32:19');
INSERT INTO static_pages (page_name, title, content, main_page_content, display_in, status, date_added) VALUES ('sitemap', 'sitemap', 0x64756d6d79207465787420616464656420666f7220736974656d61703c62723e, '', 'Both', 'Activate', '2008-03-12 11:31:17');
INSERT INTO static_pages (page_name, title, content, main_page_content, display_in, status, date_added) VALUES ('copyright', 'copyright', 0x3c703e436f7079726967687420636f6e74656e7420636f6d657320686572652e2e3c2f703e, '', 'Both', 'Activate', '2008-03-12 10:24:37');
INSERT INTO static_pages (page_name, title, content, main_page_content, display_in, status, date_added) VALUES ('author', 'author', 0x64756d6d79207465787420666f7220617574686f723c62723e, '', 'Both', 'Activate', '2008-03-12 11:09:05');
INSERT INTO static_pages (page_name, title, content, main_page_content, display_in, status, date_added) VALUES ('privacy', 'privacy', 0x3c703e5072697661637920706f6c69637920636f6d657320686572653c2f703e, '', 'Both', 'Activate', '2008-03-12 11:33:54');
INSERT INTO static_pages (page_name, title, content, main_page_content, display_in, status, date_added) VALUES ('accessibility', 'accessibility', 0x64756d6d79207465787420616464656420666f72206163636573736962696c6974793c62723e, '', 'Both', 'Activate', '2008-03-12 11:34:40');
INSERT INTO static_pages (page_name, title, content, main_page_content, display_in, status, date_added) VALUES ('prohibitedcontent', 'Prohibited Content', 0x3c703e50726f6869626974656420436f6e74656e7420636f6d657320686572653c2f703e, NULL, 'Both', 'Activate', '2009-12-23 16:59:52');
INSERT INTO static_pages (page_name, title, content, main_page_content, display_in, status, date_added) VALUES ('faq', 'Faq', 0x3c6469762069643d2273656c466171416e7377657273223e0d0a3c6469763e0d0a3c68323e4661712d416e73776572733c2f68323e0d0a3c2f6469763e0d0a3c68333e3c61206e616d653d2266617131223e3c2f613e5175657374696f6e3a20413f3c2f68333e0d0a3c703e416e7377657220666f7220412e3c2f703e0d0a3c68333e3c61206e616d653d2266617132223e3c2f613e5175657374696f6e3a20423f3c2f68333e0d0a3c703e416e7377657220666f7220422e3c2f703e0d0a3c68333e3c61206e616d653d2266617133223e3c2f613e5175657374696f6e3a20433f3c2f68333e0d0a3c703e416e7377657220666f7220432e3c2f703e0d0a3c68333e3c61206e616d653d2266617134223e3c2f613e5175657374696f6e3a20443f3c2f68333e0d0a3c703e416e7377657220666f7220442e3c2f703e0d0a3c68333e3c61206e616d653d2266617135223e3c2f613e5175657374696f6e3a20453f3c2f68333e0d0a3c703e416e7377657220666f7220452e3c2f703e0d0a3c2f6469763e, NULL, 'Both', 'Activate', '2010-05-25 20:44:13');

-- --------------------------------------------------------

-- 
-- Table structure for table 'subscription'
-- 

DROP TABLE IF EXISTS subscription;
CREATE TABLE subscription (
  id bigint(20) NOT NULL auto_increment,
  owner_id bigint(20) NOT NULL,
  category_id bigint(20) NOT NULL,
  tag_name varchar(255) NOT NULL,
  subscriber_id bigint(20) NOT NULL,
  subscription_type enum('User','Category','Tag') NOT NULL,
  module varchar(75) NOT NULL,
  `status` enum('Yes','No','Deleted') NOT NULL default 'Yes',
  date_subscribed datetime NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'subscription'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'subscription_activity'
-- 

DROP TABLE IF EXISTS subscription_activity;
CREATE TABLE subscription_activity (
  id bigint(20) NOT NULL auto_increment,
  owner_id bigint(20) default NULL,
  category_id bigint(20) default NULL,
  sub_category_id bigint(20) default NULL,
  tag_name text,
  content_id bigint(20) NOT NULL,
  module varchar(75) NOT NULL,
  `status` enum('Yes','Deleted') NOT NULL default 'Yes',
  date_activated datetime NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'subscription_activity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'subscription_mail'
-- 

DROP TABLE IF EXISTS subscription_mail;
CREATE TABLE subscription_mail (
  id bigint(20) NOT NULL auto_increment,
  upto_user_id bigint(20) NOT NULL,
  subscription_type enum('User','Category','Tag') NOT NULL,
  `status` enum('Ok','Deleted') NOT NULL default 'Ok',
  date_added datetime NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'subscription_mail'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'subscription_subscriber_status'
-- 

DROP TABLE IF EXISTS subscription_subscriber_status;
CREATE TABLE subscription_subscriber_status (
  subscriber_id bigint(20) NOT NULL,
  mail_datetime datetime NOT NULL,
  PRIMARY KEY  (subscriber_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'subscription_subscriber_status'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'tags_video'
-- 

DROP TABLE IF EXISTS tags_video;
CREATE TABLE tags_video (
  video_tag_id bigint(20) NOT NULL auto_increment,
  tag_name varchar(255) NOT NULL,
  search_count bigint(20) NOT NULL default '0',
  result_count bigint(20) NOT NULL default '0',
  last_searched datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (video_tag_id),
  UNIQUE KEY tag_name (tag_name),
  KEY result_count (result_count)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'tags_video'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'talk'
-- 

DROP TABLE IF EXISTS talk;
CREATE TABLE talk (
  talk_id int(11) NOT NULL auto_increment,
  user_id int(11) NOT NULL,
  talk_message text,
  date_added timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (talk_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'talk'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'tariff'
-- 

DROP TABLE IF EXISTS tariff;
CREATE TABLE tariff (
  tariff_id int(11) NOT NULL auto_increment,
  tariff_for varchar(25) NOT NULL,
  tariff_name varchar(50) NOT NULL,
  group_name varchar(255) NOT NULL,
  amount double NOT NULL default '0',
  discount double NOT NULL default '0',
  valid_days int(11) NOT NULL,
  `status` enum('Ok','Locked') NOT NULL default 'Ok',
  date_added datetime NOT NULL,
  PRIMARY KEY  (tariff_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'tariff'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'top_friends'
-- 

DROP TABLE IF EXISTS top_friends;
CREATE TABLE top_friends (
  top_friend_id int(11) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  friend_id bigint(20) NOT NULL,
  friend_order int(11) NOT NULL,
  PRIMARY KEY  (top_friend_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'top_friends'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'transaction'
-- 

DROP TABLE IF EXISTS transaction;
CREATE TABLE `transaction` (
  id int(11) NOT NULL auto_increment,
  txn_id varchar(50) NOT NULL,
  user_id int(11) NOT NULL default '0',
  tariff_id int(11) NOT NULL default '0',
  gateway varchar(50) NOT NULL,
  price varchar(20) NOT NULL default '0',
  currency_code varchar(12) NOT NULL default 'GBP',
  `status` varchar(30) NOT NULL default 'Unpaid',
  txn_date date default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='"Trading Transaction Table"';

-- 
-- Dumping data for table 'transaction'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'transaction_history'
-- 

DROP TABLE IF EXISTS transaction_history;
CREATE TABLE transaction_history (
  history_id bigint(20) unsigned NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  gateway enum('Auth') NOT NULL default 'Auth',
  card_no varchar(50) NOT NULL,
  tra_id varchar(50) NOT NULL,
  tra_amount double NOT NULL default '0',
  tra_type enum('Group','Venue') NOT NULL default 'Group',
  tra_status enum('Accept','Reject') NOT NULL default 'Reject',
  tra_request longtext,
  tra_response longtext,
  tra_response_code tinyint(3) unsigned NOT NULL default '0',
  tra_date datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (history_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'transaction_history'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'trim_music_cron'
-- 

DROP TABLE IF EXISTS trim_music_cron;
CREATE TABLE trim_music_cron (
  trim_music_cron_id bigint(20) NOT NULL auto_increment,
  upto_music_id int(11) NOT NULL,
  date_added datetime NOT NULL,
  preview_start int(11) NOT NULL,
  preview_length int(11) NOT NULL,
  `status` enum('Inactive','Started','Completed','Deleted') NOT NULL default 'Inactive',
  PRIMARY KEY  (trim_music_cron_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'trim_music_cron'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'user_actions'
-- 

DROP TABLE IF EXISTS user_actions;
CREATE TABLE user_actions (
  action_id bigint(20) NOT NULL auto_increment,
  action_name varchar(100) NOT NULL,
  action_type varchar(50) NOT NULL,
  action_values text NOT NULL,
  action_default text NOT NULL,
  display_order tinyint(4) NOT NULL default '0',
  action_status enum('Active','Inactive') NOT NULL default 'Active',
  PRIMARY KEY  (action_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'user_actions'
-- 

INSERT INTO user_actions (action_id, action_name, action_type, action_values, action_default, display_order, action_status) VALUES (1, 'admin_access', 'radio', 'Yes, No', 'Yes', 5, 'Active');
INSERT INTO user_actions (action_id, action_name, action_type, action_values, action_default, display_order, action_status) VALUES (2, 'settings', 'checkbox', 'General, Feature, Language, Payment, Mailer, Module, Myhome, Captcha, Fieldsize', 'Language, Mailer, Myhome, Captcha, Fieldsize', 10, 'Active');
INSERT INTO user_actions (action_id, action_name, action_type, action_values, action_default, display_order, action_status) VALUES (3, 'user_manage', 'checkbox', 'Activate, Inactivate, Delete, Add, Edit, Featured, View', 'Activate, Add', 15, 'Active');
INSERT INTO user_actions (action_id, action_name, action_type, action_values, action_default, display_order, action_status) VALUES (4, 'compose_mail', 'radio', 'Yes, No', 'No', 20, 'Active');
INSERT INTO user_actions (action_id, action_name, action_type, action_values, action_default, display_order, action_status) VALUES (5, 'report_users', 'radio', 'Yes, No', 'Yes', 25, 'Active');
INSERT INTO user_actions (action_id, action_name, action_type, action_values, action_default, display_order, action_status) VALUES (6, 'subscribe_users', 'radio', 'Yes, No', 'Yes', 30, 'Active');
INSERT INTO user_actions (action_id, action_name, action_type, action_values, action_default, display_order, action_status) VALUES (7, 'total_requests', 'textbox', '', '10', 35, 'Active');
INSERT INTO user_actions (action_id, action_name, action_type, action_values, action_default, display_order, action_status) VALUES (8, 'requests_perday', 'textbox', '', 'UL', 40, 'Active');

-- --------------------------------------------------------

-- 
-- Table structure for table 'user_identity'
-- 

DROP TABLE IF EXISTS user_identity;
CREATE TABLE user_identity (
  identity_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  identity varchar(255) NOT NULL,
  hashcode varchar(255) NOT NULL,
  identity_from enum('openid','facebook','imap','pop3') NOT NULL default 'openid',
  `status` enum('ToActivate','Ok') NOT NULL default 'ToActivate',
  PRIMARY KEY  (identity_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'user_identity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'user_package'
-- 

DROP TABLE IF EXISTS user_package;
CREATE TABLE user_package (
  user_id bigint(20) NOT NULL auto_increment,
  remaining_space double NOT NULL default '0',
  remaining_video_limit bigint(20) NOT NULL default '0',
  subscription_end_date datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'user_package'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'user_transaction_log'
-- 

DROP TABLE IF EXISTS user_transaction_log;
CREATE TABLE user_transaction_log (
  user_transaction_log_id int(11) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  paypal_transaction_id int(11) NOT NULL,
  paypal_id varchar(100) NOT NULL,
  disbursement_amount double NOT NULL,
  commission_amount double NOT NULL,
  txn_id varchar(50) NOT NULL,
  payment_status varchar(50) NOT NULL,
  currency varchar(10) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (user_transaction_log_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'user_transaction_log'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'user_type_settings'
-- 

DROP TABLE IF EXISTS user_type_settings;
CREATE TABLE user_type_settings (
  type_id bigint(20) NOT NULL auto_increment,
  type_name varchar(50) NOT NULL,
  type_actions text NOT NULL,
  default_type enum('Yes','No') NOT NULL default 'No',
  type_added_date datetime NOT NULL,
  type_status enum('Active','Inactive') NOT NULL default 'Active',
  type_total_used int(11) NOT NULL default '0',
  PRIMARY KEY  (type_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'user_type_settings'
-- 

INSERT INTO user_type_settings (type_id, type_name, type_actions, default_type, type_added_date, type_status, type_total_used) VALUES (1, 'User', 'a:8:{s:12:"admin_access";s:2:"No";s:8:"settings";a:9:{s:7:"General";s:0:"";s:7:"Feature";s:0:"";s:8:"Language";s:0:"";s:7:"Payment";s:0:"";s:6:"Mailer";s:0:"";s:6:"Module";s:0:"";s:6:"Myhome";s:0:"";s:7:"Captcha";s:0:"";s:9:"Fieldsize";s:0:"";}s:11:"user_manage";a:7:{s:8:"Activate";s:0:"";s:10:"Inactivate";s:0:"";s:6:"Delete";s:0:"";s:3:"Add";s:0:"";s:4:"Edit";s:0:"";s:8:"Featured";s:0:"";s:4:"View";s:0:"";}s:12:"compose_mail";s:3:"Yes";s:12:"report_users";s:2:"No";s:15:"subscribe_users";s:2:"No";s:14:"total_requests";s:1:"5";s:15:"requests_perday";s:1:"1";}', 'Yes', '2010-07-28 09:16:59', 'Active', 0);
INSERT INTO user_type_settings (type_id, type_name, type_actions, default_type, type_added_date, type_status, type_total_used) VALUES (2, 'Exclusive', 'a:8:{s:12:"admin_access";s:2:"No";s:8:"settings";a:9:{s:7:"General";s:0:"";s:7:"Feature";s:0:"";s:8:"Language";s:0:"";s:7:"Payment";s:0:"";s:6:"Mailer";s:0:"";s:6:"Module";s:0:"";s:6:"Myhome";s:0:"";s:7:"Captcha";s:0:"";s:9:"Fieldsize";s:0:"";}s:11:"user_manage";a:5:{s:8:"Activate";s:0:"";s:10:"Inactivate";s:0:"";s:6:"Delete";s:0:"";s:3:"Add";s:0:"";s:4:"Edit";s:0:"";}s:12:"compose_mail";s:3:"Yes";s:12:"report_users";s:3:"Yes";s:15:"subscribe_users";s:3:"Yes";s:14:"total_requests";s:2:"UL";s:15:"requests_perday";s:1:"5";}', 'No', '2010-07-28 09:16:59', 'Active', 0);
INSERT INTO user_type_settings (type_id, type_name, type_actions, default_type, type_added_date, type_status, type_total_used) VALUES (3, 'Moderator', 'a:8:{s:12:"admin_access";s:3:"Yes";s:8:"settings";a:9:{s:7:"General";s:0:"";s:7:"Feature";s:0:"";s:8:"Language";s:8:"Language";s:7:"Payment";s:0:"";s:6:"Mailer";s:6:"Mailer";s:6:"Module";s:6:"Module";s:6:"Myhome";s:0:"";s:7:"Captcha";s:7:"Captcha";s:9:"Fieldsize";s:9:"Fieldsize";}s:11:"user_manage";a:7:{s:8:"Activate";s:8:"Activate";s:10:"Inactivate";s:10:"Inactivate";s:6:"Delete";s:0:"";s:3:"Add";s:0:"";s:4:"Edit";s:0:"";s:8:"Featured";s:8:"Featured";s:4:"View";s:0:"";}s:12:"compose_mail";s:3:"Yes";s:12:"report_users";s:3:"Yes";s:15:"subscribe_users";s:3:"Yes";s:14:"total_requests";s:2:"UL";s:15:"requests_perday";s:2:"UL";}', 'No', '2010-07-28 09:16:59', 'Active', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table 'users'
-- 

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  user_id bigint(20) NOT NULL auto_increment,
  user_name varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL,
  bba_token varchar(40) default NULL,
  total_failure_attempt int(11) NOT NULL,
  last_failure_attempt_date datetime NOT NULL,
  email varchar(255) NOT NULL,
  referrer_id bigint(20) NOT NULL default '0',
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  sex enum('male','female') NOT NULL,
  dob date NOT NULL,
  openid_used enum('Yes','No','FB') NOT NULL default 'No',
  openid_type varchar(50) NOT NULL,
  show_dob enum('0','1') default NULL,
  age smallint(1) default NULL,
  verification_level tinyint(4) NOT NULL default '0',
  usr_access enum('User','Admin') NOT NULL default 'User',
  usr_status enum('Ok','ToActivate','Locked','Deleted') NOT NULL default 'ToActivate',
  membership_expiry_date datetime NOT NULL,
  group_name varchar(100) NOT NULL default 'free',
  image_server_url varchar(255) NOT NULL,
  image_name varchar(50) NOT NULL,
  image_ext varchar(10) NOT NULL,
  mini_width bigint(20) NOT NULL,
  mini_height bigint(20) NOT NULL,
  small_width int(11) NOT NULL,
  small_height int(11) NOT NULL,
  thumb_width int(11) NOT NULL,
  thumb_height int(11) NOT NULL,
  large_width int(11) NOT NULL,
  large_height int(11) NOT NULL,
  postal_code varchar(20) NOT NULL,
  doj datetime NOT NULL default '0000-00-00 00:00:00',
  last_logged datetime NOT NULL default '0000-00-00 00:00:00',
  num_visits bigint(20) NOT NULL default '0',
  cookie varchar(32) NOT NULL,
  `session` varchar(32) NOT NULL,
  ip varchar(15) NOT NULL,
  signup_ip varchar(15) NOT NULL,
  time_zone tinyint(4) NOT NULL default '0',
  pref_lang varchar(10) NOT NULL,
  pref_template varchar(100) NOT NULL,
  profile_tags text,
  web_url varchar(200) NOT NULL,
  icon_type enum('Avatar','Photo','Video') NOT NULL default 'Avatar',
  phone varchar(30) NOT NULL,
  fax varchar(30) NOT NULL,
  address varchar(100) NOT NULL,
  city varchar(50) NOT NULL,
  state varchar(50) NOT NULL,
  country varchar(3) default NULL,
  hometown varchar(100) NOT NULL,
  zip varchar(15) NOT NULL,
  theme varchar(20) NOT NULL,
  privacy enum('Online','Offline','Custom') NOT NULL default 'Online',
  status_msg_id int(11) NOT NULL default '0',
  allow_bulletin enum('Yes','No') NOT NULL default 'Yes',
  show_profile enum('All','Members','Friends') NOT NULL default 'All',
  facebook_image enum('Yes','No') NOT NULL default 'No',
  allow_comment enum('Yes','No') NOT NULL default 'Yes',
  allow_article enum('Yes','No') NOT NULL default 'Yes',
  content_filter enum('Nothing','On','Off') NOT NULL default 'Off',
  featured enum('No','Yes') NOT NULL default 'No',
  profile_hits bigint(20) default '0',
  total_videos bigint(20) default '0',
  total_musics bigint(20) NOT NULL default '0',
  total_games bigint(20) NOT NULL default '0',
  total_photos bigint(20) default '0',
  total_articles bigint(20) NOT NULL default '0',
  total_friends bigint(20) default '0',
  total_posts bigint(20) default '0',
  blog_status enum('Yes','No') NOT NULL default 'No',
  news_letter enum('No','Yes') NOT NULL default 'Yes',
  network_view enum('Public','Private','Network') NOT NULL default 'Public',
  total_befriends int(11) NOT NULL default '0',
  new_mails bigint(20) NOT NULL default '0',
  new_requests bigint(20) NOT NULL default '0',
  icon_id bigint(20) NOT NULL default '0',
  browse_criteria text,
  last_active datetime NOT NULL default '0000-00-00 00:00:00',
  logged_in enum('1','0') NOT NULL default '0',
  icon_use_last_uploaded enum('No','Photo','Video','Both') NOT NULL default 'No',
  about_me text,
  relation_status varchar(3) default NULL,
  is_affiliate_type enum('Yes','No') NOT NULL default 'No',
  featured_description text,
  is_upload_background_image enum('Yes','No') NOT NULL default 'No',
  background_ext varchar(20) NOT NULL,
  background_offset int(11) NOT NULL default '0',
  is_paid_member enum('Yes','No') NOT NULL default 'No',
  usr_type int(11) NOT NULL default '0',
  music_user_type enum('Artist','Listener') NOT NULL default 'Listener',
  music_artist_category_id int(11) NOT NULL,
  music_artist_sub_category_id int(11) NOT NULL,
  PRIMARY KEY  (user_id),
  KEY usr_status (usr_status,total_videos),
  KEY user_status_doj (usr_status,doj),
  KEY usr_status_user_id (usr_status,user_id),
  KEY usr_status_last_active (usr_status,last_active),
  FULLTEXT KEY profile_tags (profile_tags)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users'
-- 

INSERT INTO users (user_id, user_name, password, bba_token, total_failure_attempt, last_failure_attempt_date, email, referrer_id, first_name, last_name, sex, dob, openid_used, openid_type, show_dob, age, verification_level, usr_access, usr_status, membership_expiry_date, group_name, image_server_url, image_name, image_ext, mini_width, mini_height, small_width, small_height, thumb_width, thumb_height, large_width, large_height, postal_code, doj, last_logged, num_visits, cookie, session, ip, signup_ip, time_zone, pref_lang, pref_template, profile_tags, web_url, icon_type, phone, fax, address, city, state, country, hometown, zip, theme, privacy, status_msg_id, allow_bulletin, show_profile, facebook_image, allow_comment, allow_article, content_filter, featured, profile_hits, total_videos, total_musics, total_games, total_photos, total_articles, total_friends, total_posts, blog_status, news_letter, network_view, total_befriends, new_mails, new_requests, icon_id, browse_criteria, last_active, logged_in, icon_use_last_uploaded, about_me, relation_status, is_affiliate_type, featured_description, is_upload_background_image, background_ext, background_offset, is_paid_member, usr_type, music_user_type, music_artist_category_id, music_artist_sub_category_id) VALUES (1, 'webmaster', '50a9c7dbf0fa09e8969978317dca12e8', NULL, 0, '0000-00-00 00:00:00', 'rayzzdev@gmail.com', 0, 'admin', 'admin', 'male', '1980-05-08', 'No', '', '0', 29, 0, 'Admin', 'Ok', '0000-00-00 00:00:00', 'free', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, '622303', '2006-09-18 16:18:09', '2009-04-21 18:06:50', 1, '', '9680c8efd40904fb942c2411bad57055', '127.0.0.1', '61.8.145.170', 0, '', '', '', '', 'Avatar', '', '', '', '', '', 'IN', '', '', '', 'Online', 0, 'Yes', 'All', 'No', 'Yes', 'No', 'Off', 'No', 1, 0, 0, 0, 0, 0, 0, 0, 'No', 'Yes', 'Public', 0, 0, 0, 0, '', '2009-05-06 14:18:23', '1', 'Photo', '', 'SIN', 'No', '', 'Yes', '', 0, 'Yes', 0, 'Listener', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table 'users_featured'
-- 

DROP TABLE IF EXISTS users_featured;
CREATE TABLE users_featured (
  featured_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  PRIMARY KEY  (featured_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_featured'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'users_group_invitation'
-- 

DROP TABLE IF EXISTS users_group_invitation;
CREATE TABLE users_group_invitation (
  group_invitation_id bigint(20) NOT NULL auto_increment,
  invitation_id bigint(20) NOT NULL default '0',
  group_id bigint(20) NOT NULL default '0',
  group_attempts int(11) default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (group_invitation_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_group_invitation'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'users_invitation'
-- 

DROP TABLE IF EXISTS users_invitation;
CREATE TABLE users_invitation (
  invitation_id bigint(20) NOT NULL auto_increment,
  is_member enum('0','1') NOT NULL default '0',
  for_groups enum('0','1') NOT NULL default '0',
  for_friend enum('0','1') NOT NULL default '0',
  user_id bigint(20) NOT NULL default '0',
  invitation_code varchar(50) NOT NULL,
  email varchar(255) default NULL,
  attempts int(11) default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (invitation_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_invitation'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'users_profile_background'
-- 

DROP TABLE IF EXISTS users_profile_background;
CREATE TABLE users_profile_background (
  id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  background_color varchar(25) default NULL,
  background_ext varchar(25) default NULL,
  background_offset varchar(100) default NULL,
  background_repeat enum('Yes','No') NOT NULL default 'No',
  PRIMARY KEY  (id),
  UNIQUE KEY user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_profile_background'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'users_profile_block'
-- 

DROP TABLE IF EXISTS users_profile_block;
CREATE TABLE users_profile_block (
  profile_block_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  module_name varchar(50) default NULL,
  block_name varchar(50) default NULL,
  order_no int(11) NOT NULL default '0',
  position enum('left','right') default NULL,
  PRIMARY KEY  (profile_block_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_profile_block'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'users_profile_category'
-- 

DROP TABLE IF EXISTS users_profile_category;
CREATE TABLE users_profile_category (
  id int(11) NOT NULL auto_increment,
  title varchar(200) default NULL,
  description text,
  submit_label varchar(100) default NULL,
  `mode` enum('db','email','both') default NULL,
  theme varchar(100) default NULL,
  user_id bigint(20) NOT NULL default '0',
  lang varchar(6) default NULL,
  `status` enum('Yes','No') NOT NULL default 'Yes',
  search_field_status enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (id),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_profile_category'
-- 

INSERT INTO users_profile_category (id, title, description, submit_label, mode, theme, user_id, lang, status, search_field_status, date_added) VALUES (1, 'Personal Info', 'Users Personal Information Questions', 'Submit', 'db', 'default', 1, 'en', 'Yes', 'Yes', '2009-04-07 11:02:59');
INSERT INTO users_profile_category (id, title, description, submit_label, mode, theme, user_id, lang, status, search_field_status, date_added) VALUES (2, 'Other Info', 'Users Other Information Questions', 'Submit', 'db', 'default', 0, 'en', 'Yes', 'Yes', '2009-02-28 15:56:38');

-- --------------------------------------------------------

-- 
-- Table structure for table 'users_profile_comments'
-- 

DROP TABLE IF EXISTS users_profile_comments;
CREATE TABLE users_profile_comments (
  users_profile_comment_id bigint(20) NOT NULL auto_increment,
  profile_user_id bigint(20) default NULL,
  `comment` text,
  comment_user_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (users_profile_comment_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_profile_comments'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'users_profile_info'
-- 

DROP TABLE IF EXISTS users_profile_info;
CREATE TABLE users_profile_info (
  id int(11) NOT NULL auto_increment,
  question_id int(11) default NULL,
  answer text,
  user_id bigint(20) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY user_id (user_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_profile_info'
-- 

INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (1, 1, 'My Friends', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (2, 9, 'Mobile', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (3, 5, 'Keyboard', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (4, 13, 'Average', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (5, 14, '170cm', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (6, 15, 'No Answer', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (7, 16, 'Straight', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (8, 17, 'Friends', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (9, 18, 'No Answer', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (10, 19, 'No Answer', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (11, 20, 'No Answer', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (12, 21, 'No', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (13, 22, 'No', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (14, 12, 'No Answer', 1);
INSERT INTO users_profile_info (id, question_id, answer, user_id) VALUES (15, 17, 'Dating', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table 'users_profile_info_checkbox'
-- 

DROP TABLE IF EXISTS users_profile_info_checkbox;
CREATE TABLE users_profile_info_checkbox (
  id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  question_id bigint(20) NOT NULL default '0',
  date_added datetime default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_profile_info_checkbox'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'users_profile_question'
-- 

DROP TABLE IF EXISTS users_profile_question;
CREATE TABLE users_profile_question (
  id int(11) NOT NULL auto_increment,
  form_id int(11) default NULL,
  question varchar(200) default NULL,
  question_type varchar(50) default NULL,
  order_no int(11) default NULL,
  instruction text,
  options text,
  answer_required varchar(2) default NULL,
  error_message text,
  default_value text,
  extra_settings text,
  specify_allowed varchar(2) default NULL,
  specify_label varchar(100) default NULL,
  max_length int(11) default NULL,
  rule varchar(100) default NULL,
  cdatetime datetime default NULL,
  mdatetime datetime default NULL,
  `rows` int(11) default NULL,
  display enum('horizontal','vertical') default NULL,
  width int(11) default NULL,
  PRIMARY KEY  (id),
  KEY form_id_order (form_id,order_no)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_profile_question'
-- 

INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (1, 2, 'I would like to meet', 'textarea', 1, 'Who would you Like to Meet', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:01:54', '2009-03-11 16:01:54', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (2, 2, 'On campus i will be', 'textarea', 2, 'On Campus I am usually around', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:03:04', '2009-03-11 16:03:04', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (3, 2, 'The dumbest thing i ever said in class was', 'textarea', 3, 'Tell us the dumbest thing you ever said in class', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:03:56', '2009-03-11 16:03:56', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (4, 2, 'After graduation I will..', 'textarea', 4, 'After Graduation what you will', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:05:11', '2009-03-11 16:05:11', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (5, 2, 'Things i''m passionate about', 'textarea', 5, 'Things you are passionate about', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:06:10', '2009-03-11 16:06:10', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (6, 2, 'Things that turn me off', 'textarea', 6, 'Things that turn you off', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:06:51', '2009-03-11 16:06:51', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (7, 2, 'When i go on a date i..', 'textarea', 7, 'When go on a date', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:07:32', '2009-03-11 16:07:32', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (8, 2, 'My friends call me', 'textarea', 8, 'How your Friends call you', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:07:58', '2009-03-11 16:07:58', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (9, 2, 'In my bedroom you will find..', 'textarea', 9, 'What we will find in your bedroom', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:08:41', '2009-03-11 16:08:41', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (10, 2, 'Last time i got lucky was', 'textarea', 10, 'When you got the last lucky', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:09:46', '2009-03-11 16:09:46', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (11, 2, 'I need to get lucky again', 'textarea', 11, 'Do you need to get lucky again.why?', NULL, '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-03-11 16:10:40', '2009-03-11 16:10:40', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (12, 1, 'Ethnicity', 'select', 2, 'Your Ethnicity', 'No Answer\nAsian\nBlack/African\nEast Indian\nLatino/Hispanic\nMiddle Eastern\nNative American\nPacific Islander\nWhite', '0', NULL, 'No Answer', NULL, '0', NULL, NULL, NULL, '2009-04-07 05:38:24', '2009-04-07 05:38:24', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (13, 1, 'Body type', 'radio', 3, 'Your Body Type', 'No Answer\nAverage\nSlim/Slender\nAtheletic\nLittle extra\nMore to Love\nBody Builder', '0', NULL, 'No Answer', NULL, '0', NULL, NULL, NULL, '2009-04-07 05:41:37', '2009-04-07 05:41:37', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (14, 1, 'Height', 'select', 4, 'Please select Height.', 'No Answer\r\n50cm\r\n51cm\r\n52cm\r\n53cm\r\n54cm\r\n55cm\r\n56cm\r\n57cm\r\n58cm\r\n59cm\r\n60cm\r\n61cm\r\n62cm\r\n63cm\r\n64cm\r\n65cm\r\n66cm\r\n67cm\r\n68cm\r\n69cm\r\n70cm\r\n71cm\r\n72cm\r\n73cm\r\n74cm\r\n75cm\r\n76cm\r\n77cm\r\n78cm\r\n79cm\r\n80cm\r\n81cm\r\n82cm\r\n83cm\r\n84cm\r\n85cm\r\n86cm\r\n87cm\r\n88cm\r\n89cm\r\n90cm\r\n91cm\r\n92cm\r\n93cm\r\n94cm\r\n95cm\r\n96cm\r\n97cm\r\n98cm\r\n99cm\r\n100cm\r\n101cm\r\n102cm\r\n103cm\r\n104cm\r\n105cm\r\n106cm\r\n107cm\r\n108cm\r\n109cm\r\n110cm\r\n111cm\r\n112cm\r\n113cm\r\n114cm\r\n115cm\r\n116cm\r\n117cm\r\n118cm\r\n119cm\r\n120cm\r\n121cm\r\n122cm\r\n123cm\r\n124cm\r\n125cm\r\n126cm\r\n127cm\r\n128cm\r\n129cm\r\n130cm\r\n131cm\r\n132cm\r\n133cm\r\n134cm\r\n135cm\r\n136cm\r\n137cm\r\n138cm\r\n139cm\r\n140cm\r\n141cm\r\n142cm\r\n143cm\r\n144cm\r\n145cm\r\n146cm\r\n147cm\r\n148cm\r\n149cm\r\n150cm\r\n151cm\r\n152cm\r\n153cm\r\n154cm\r\n155cm\r\n156cm\r\n157cm\r\n158cm\r\n159cm\r\n160cm\r\n161cm\r\n162cm\r\n163cm\r\n164cm\r\n165cm\r\n166cm\r\n167cm\r\n168cm\r\n169cm\r\n170cm\r\n171cm\r\n172cm\r\n173cm\r\n174cm\r\n175cm\r\n176cm\r\n177cm\r\n178cm\r\n179cm\r\n180cm\r\n181cm\r\n182cm\r\n183cm\r\n184cm\r\n185cm\r\n186cm\r\n187cm\r\n188cm\r\n189cm\r\n190cm\r\n191cm\r\n192cm\r\n193cm\r\n194cm\r\n195cm\r\n196cm\r\n197cm\r\n198cm\r\n199cm\r\n200cm\r\n201cm\r\n202cm\r\n203cm\r\n204cm\r\n205cm\r\n206cm\r\n207cm\r\n208cm\r\n209cm\r\n210cm\r\n211cm\r\n212cm\r\n213cm\r\n214cm\r\n215cm\r\n216cm\r\n217cm\r\n218cm\r\n219cm\r\n220cm\r\n221cm\r\n222cm\r\n223cm\r\n224cm\r\n225cm\r\n226cm\r\n227cm\r\n228cm\r\n229cm\r\n230cm\r\n231cm\r\n232cm\r\n233cm\r\n234cm\r\n235cm\r\n236cm\r\n237cm\r\n238cm\r\n239cm\r\n240cm', '0', NULL, 'No Answer', NULL, '0', NULL, NULL, NULL, '2009-04-07 05:45:36', '2009-04-07 05:45:36', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (15, 1, 'Children', 'select', 5, 'Children', 'No Answer\nI dont Want Kids\nSomeday\nUndecided\nLove kids, but not for me\nProud Parent\nNo\nYes', '0', NULL, 'No Answer', NULL, '0', NULL, NULL, NULL, '2009-04-07 05:53:55', '2009-04-07 05:53:55', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (16, 1, 'I am here for', 'checkbox', 7, 'Why Here', 'Relationships\nFriends\nNetworking', '0', NULL, NULL, NULL, '0', NULL, NULL, NULL, '2009-04-07 06:00:30', '2009-04-07 06:00:30', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (17, 1, 'Education', 'select', 8, 'Your Education', 'No Answer\nElementary\nHigh School\nSome college\nIn College\nCollege grad\nPost grad\nPh.D.\nPost Doctoral', '0', NULL, 'No Answer', NULL, '0', NULL, NULL, NULL, '2009-04-07 06:28:50', '2009-04-07 06:28:50', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (18, 1, 'Religion', 'select', 9, 'Your Religion', 'No Answer\nAgnostic\nAthiest\nBuddhist\nCatholic\nChristian\nHindu\nJewish\nMormon\nMuslim\nProtestant\nTaoist\nWICCAN\nScientologist\nOther', '0', NULL, 'No Answer', NULL, '0', NULL, NULL, NULL, '2009-04-07 06:34:34', '2009-04-07 06:34:34', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (19, 1, 'Smoking', 'radio', 10, 'Do you smoke?', 'No Answer\nNo\nYes\nOftenly', '0', NULL, 'No Answer', NULL, '0', NULL, NULL, NULL, '2009-04-07 06:37:33', '2009-04-07 06:37:33', NULL, 'vertical', NULL);
INSERT INTO users_profile_question (id, form_id, question, question_type, order_no, instruction, options, answer_required, error_message, default_value, extra_settings, specify_allowed, specify_label, max_length, rule, cdatetime, mdatetime, rows, display, width) VALUES (20, 1, 'Drinking', 'radio', 11, 'Do you drink?', 'No Answer\nNo\nYes\nOftenly', '0', NULL, 'No Answer', NULL, '0', NULL, NULL, NULL, '2009-04-07 06:38:28', '2009-04-07 06:38:28', NULL, 'vertical', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table 'users_profile_theme'
-- 

DROP TABLE IF EXISTS users_profile_theme;
CREATE TABLE users_profile_theme (
  theme_id int(11) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  theme_status enum('1','0') NOT NULL default '1',
  display_videos enum('1','0') NOT NULL default '1',
  display_photos enum('1','0') NOT NULL default '1',
  display_friends enum('1','0') NOT NULL default '1',
  display_comments enum('1','0') NOT NULL default '1',
  style text,
  style_tags text,
  user_style text,
  bg_image varchar(255) default NULL,
  PRIMARY KEY  (theme_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_profile_theme'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'users_status_messages'
-- 

DROP TABLE IF EXISTS users_status_messages;
CREATE TABLE users_status_messages (
  status_msg_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  message varchar(200) NOT NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (status_msg_id),
  KEY user_id (user_id),
  KEY ind_user_msg_id (user_id,status_msg_id),
  KEY ind_userid_date (user_id,date_added)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_status_messages'
-- 

INSERT INTO users_status_messages (status_msg_id, user_id, message, date_added) VALUES (1, 0, 'Busy', '0000-00-00 00:00:00');
INSERT INTO users_status_messages (status_msg_id, user_id, message, date_added) VALUES (2, 0, 'Not At my Desk', '0000-00-00 00:00:00');
INSERT INTO users_status_messages (status_msg_id, user_id, message, date_added) VALUES (3, 0, 'Stepped Out', '0000-00-00 00:00:00');
INSERT INTO users_status_messages (status_msg_id, user_id, message, date_added) VALUES (4, 0, 'Be Right Back', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table 'users_tips'
-- 

DROP TABLE IF EXISTS users_tips;
CREATE TABLE users_tips (
  users_tips_id bigint(20) NOT NULL auto_increment,
  users_tips_name varchar(200) default NULL,
  users_tips_description text,
  users_tips_link_normal text,
  users_tips_link_htaccess text,
  users_tips_ext varchar(5) NOT NULL,
  users_tips_status enum('Yes','No') default NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (users_tips_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_tips'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'users_views'
-- 

DROP TABLE IF EXISTS users_views;
CREATE TABLE users_views (
  users_views_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  viewed_user_id bigint(20) default '0',
  total_views bigint(20) default NULL,
  last_viewed_date datetime default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (users_views_id),
  KEY viewed_user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'users_views'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video'
-- 

DROP TABLE IF EXISTS video;
CREATE TABLE video (
  video_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  video_album_id bigint(20) NOT NULL default '0',
  thumb_name_id bigint(20) NOT NULL default '0',
  video_file_name_id bigint(20) NOT NULL default '0',
  trimed_video_name_id bigint(20) NOT NULL default '0',
  video_ext varchar(5) default NULL,
  video_size double NOT NULL default '0',
  playing_time varchar(25) NOT NULL,
  video_category_id bigint(20) default NULL,
  video_sub_category_id int(11) NOT NULL default '0',
  video_title varchar(200) default NULL,
  video_caption text,
  video_tags text,
  video_access_type enum('Public','Private') default NULL,
  relation_id text,
  allow_comments enum('Yes','No','Kinda') NOT NULL default 'Yes',
  allow_ratings enum('Yes','No') NOT NULL default 'Yes',
  allow_download enum('Yes','No') NOT NULL default 'Yes',
  allow_embed enum('Yes','No') NOT NULL default 'Yes',
  date_recorded date NOT NULL default '0000-00-00',
  location_recorded varchar(50) NOT NULL,
  country_recorded varchar(50) NOT NULL,
  zip_code_recorded varchar(50) NOT NULL,
  rating_total bigint(20) NOT NULL default '0',
  rating_count bigint(20) NOT NULL default '0',
  date_added datetime default NULL,
  is_gif_animated enum('no','yes','skip') NOT NULL default 'no',
  animated_gif_file_names varchar(200) NOT NULL,
  video_available_formats varchar(45) NOT NULL,
  video_url text,
  is_downloaded enum('no','yes') NOT NULL default 'yes',
  total_views bigint(20) default '0',
  total_watch bigint(20) NOT NULL default '0',
  total_comments bigint(20) NOT NULL default '0',
  total_favorites bigint(20) NOT NULL default '0',
  total_featured bigint(20) NOT NULL,
  total_downloads int(11) NOT NULL default '0',
  last_view_date datetime default NULL,
  t_width int(11) default '0',
  t_height int(11) default '0',
  s_width int(11) default '0',
  s_height int(11) default '0',
  l_width int(11) default '0',
  l_height int(11) default '0',
  video_server_url varchar(250) default NULL,
  video_flv_url text NOT NULL,
  flv_upload_type enum('Normal','Capture','externalsitevideourl') NOT NULL default 'Normal',
  personalized_url text,
  featured enum('Yes','No') NOT NULL default 'No',
  index_video enum('Yes','No') NOT NULL default 'No',
  video_status enum('Ok','Locked','Deleted') NOT NULL default 'Locked',
  video_encoded_status enum('No','Partial','Yes') NOT NULL default 'No',
  flagged_status enum('','Yes','No') NOT NULL,
  mass_upload enum('Yes','No') NOT NULL default 'No',
  total_responded int(10) NOT NULL default '0',
  total_linked int(10) NOT NULL default '0',
  location text,
  price double NOT NULL default '0',
  is_external_embed_video enum('Yes','No') NOT NULL default 'No',
  embed_video_image_ext varchar(20) NOT NULL,
  form_upload_type enum('Normal','externalsitevideourl','embed','capture') NOT NULL,
  external_site_video_url text NOT NULL,
  external_site_flv_path text NOT NULL,
  video_country varchar(25) NOT NULL,
  video_language varchar(25) NOT NULL,
  allow_response enum('Yes','No','Kinda') NOT NULL default 'Yes',
  video_external_embed_code text,
  video_page_title varchar(250) default NULL,
  video_meta_keyword varchar(250) default NULL,
  video_meta_description varchar(250) default NULL,
  featured_video_order_id bigint(20) NOT NULL,
  PRIMARY KEY  (video_id),
  KEY video_status (video_status,video_id,user_id),
  KEY video_status_last_view_video (video_status,last_view_date),
  KEY video_category_id (video_category_id),
  KEY video_status_category_id (video_status,video_category_id),
  KEY user_id (user_id,video_id),
  FULLTEXT KEY video_tags (video_tags)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_activity'
-- 

DROP TABLE IF EXISTS video_activity;
CREATE TABLE video_activity (
  id bigint(20) NOT NULL auto_increment,
  parent_id bigint(20) NOT NULL,
  content_id bigint(20) NOT NULL,
  action_key varchar(255) NOT NULL,
  action_value text,
  actor_id bigint(20) NOT NULL,
  owner_id bigint(20) NOT NULL,
  `status` enum('Yes','Deleted') NOT NULL default 'Yes',
  date_added datetime NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_activity'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_advertisement'
-- 

DROP TABLE IF EXISTS video_advertisement;
CREATE TABLE video_advertisement (
  advertisement_id int(11) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL default '0',
  advertisement_name varchar(100) NOT NULL,
  advertisement_description text,
  advertisement_url text,
  advertisement_duration int(11) NOT NULL default '0',
  advertisement_expiry_date datetime NOT NULL default '0000-00-00 00:00:00',
  advertisement_impressions int(11) NOT NULL default '0',
  advertisement_channel text,
  advertisement_image varchar(100) NOT NULL,
  advertisement_ext varchar(10) NOT NULL,
  advertisement_show_at enum('Begining','Ending','Both') NOT NULL default 'Begining',
  advertisement_status enum('Activate','Inactive') NOT NULL default 'Inactive',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  advertisement_current_impressions int(11) NOT NULL default '0',
  views_revenue double NOT NULL default '0',
  clicks_revenue double NOT NULL default '0',
  total_views bigint(20) NOT NULL default '0',
  total_clicks bigint(20) NOT NULL default '0',
  members_earnings double NOT NULL default '0',
  site_earnings double NOT NULL default '0',
  add_type enum('Porn','General') NOT NULL default 'General',
  PRIMARY KEY  (advertisement_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_advertisement'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_album'
-- 

DROP TABLE IF EXISTS video_album;
CREATE TABLE video_album (
  video_album_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  relation_id text,
  album_title varchar(200) default NULL,
  album_description text,
  album_access_type enum('Public','Private') default NULL,
  video_id bigint(20) NOT NULL,
  s_width int(11) NOT NULL,
  s_height int(11) NOT NULL,
  video_server_url varchar(100) NOT NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (video_album_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_album'
-- 

INSERT INTO video_album (video_album_id, user_id, relation_id, album_title, album_description, album_access_type, video_id, s_width, s_height, video_server_url, date_added) VALUES (1, 2, '', 'Public', NULL, 'Public', 0, 0, 0, '', '2007-09-17 13:43:15');

-- --------------------------------------------------------

-- 
-- Table structure for table 'video_category'
-- 

DROP TABLE IF EXISTS video_category;
CREATE TABLE video_category (
  video_category_id bigint(20) NOT NULL auto_increment,
  parent_category_id int(11) NOT NULL default '0',
  video_category_name varchar(200) default NULL,
  video_category_type enum('Porn','General') NOT NULL default 'General',
  allow_post enum('Yes','No') NOT NULL default 'Yes',
  video_category_description text,
  video_category_ext varchar(5) NOT NULL,
  video_category_status enum('Yes','No') default NULL,
  priority int(11) NOT NULL default '0',
  date_added datetime default NULL,
  PRIMARY KEY  (video_category_id),
  KEY parent_category_id (parent_category_id),
  KEY video_category_type (video_category_type),
  KEY parent_video_category_id (parent_category_id,video_category_name),
  KEY parent_category_id_priority (parent_category_id,priority)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_category'
-- 

INSERT INTO video_category (video_category_id, parent_category_id, video_category_name, video_category_type, allow_post, video_category_description, video_category_ext, video_category_status, priority, date_added) VALUES (1, 0, 'test', 'General', 'Yes', 'General Things', 'jpg', 'Yes', 0, '2007-09-14 18:25:08');

-- --------------------------------------------------------

-- 
-- Table structure for table 'video_comments'
-- 

DROP TABLE IF EXISTS video_comments;
CREATE TABLE video_comments (
  video_comment_id bigint(20) NOT NULL auto_increment,
  video_comment_main_id bigint(20) NOT NULL default '0',
  video_id bigint(20) default NULL,
  comment_user_id bigint(20) default NULL,
  moods_id int(11) default NULL,
  `comment` text,
  comment_status enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (video_comment_id),
  KEY ind_video_id (video_id,video_comment_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_comments'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_favorite'
-- 

DROP TABLE IF EXISTS video_favorite;
CREATE TABLE video_favorite (
  video_favorite_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  video_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (video_favorite_id),
  KEY user_id (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_favorite'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_featured'
-- 

DROP TABLE IF EXISTS video_featured;
CREATE TABLE video_featured (
  video_featured_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  video_id bigint(20) default NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (video_featured_id),
  KEY ind_video_id (video_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_featured'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_files_settings'
-- 

DROP TABLE IF EXISTS video_files_settings;
CREATE TABLE video_files_settings (
  video_file_id bigint(20) NOT NULL auto_increment,
  file_name varchar(30) NOT NULL,
  file_type enum('Thumb','Video','Trimed') NOT NULL default 'Thumb',
  `status` enum('Yes','No') NOT NULL default 'Yes',
  date_added datetime default NULL,
  PRIMARY KEY  (video_file_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_files_settings'
-- 

INSERT INTO video_files_settings (video_file_id, file_name, file_type, status, date_added) VALUES (1, '', 'Thumb', 'Yes', '2009-05-23 17:17:39');
INSERT INTO video_files_settings (video_file_id, file_name, file_type, status, date_added) VALUES (2, '', 'Video', 'Yes', '2009-05-23 17:17:39');
INSERT INTO video_files_settings (video_file_id, file_name, file_type, status, date_added) VALUES (3, 'trim', 'Trimed', 'Yes', '2009-05-23 17:17:39');

-- --------------------------------------------------------

-- 
-- Table structure for table 'video_home_page_settings'
-- 

DROP TABLE IF EXISTS video_home_page_settings;
CREATE TABLE video_home_page_settings (
  id bigint(20) NOT NULL auto_increment,
  block_name varchar(255) NOT NULL,
  location enum('mainblock','sidebar') NOT NULL,
  PRIMARY KEY  (id),
  UNIQUE KEY block_name (block_name)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_home_page_settings'
-- 

INSERT INTO video_home_page_settings (id, block_name, location) VALUES (1, 'RandomVideo', 'mainblock');

-- --------------------------------------------------------

-- 
-- Table structure for table 'video_in_playlist'
-- 

DROP TABLE IF EXISTS video_in_playlist;
CREATE TABLE video_in_playlist (
  id bigint(20) NOT NULL auto_increment,
  playlist_id bigint(20) NOT NULL,
  video_id bigint(20) NOT NULL,
  date_added datetime NOT NULL,
  order_id bigint(20) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_in_playlist'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_logo'
-- 

DROP TABLE IF EXISTS video_logo;
CREATE TABLE video_logo (
  logo_id tinyint(4) NOT NULL auto_increment,
  logo_name varchar(100) NOT NULL,
  logo_description text,
  logo_url text,
  logo_position enum('Left_bottom','Left_top','Right_bottom','Right_top') NOT NULL default 'Left_bottom',
  logo_transparency int(11) NOT NULL default '0',
  logo_rollover_transparency int(11) NOT NULL default '0',
  animated_logo enum('yes','no') NOT NULL default 'no',
  logo_image varchar(100) NOT NULL,
  logo_ext varchar(10) NOT NULL,
  mini_logo_image varchar(100) NOT NULL,
  mini_logo enum('1','0') NOT NULL default '1',
  main_logo enum('yes','no') NOT NULL default 'no',
  mini_logo_ext varchar(10) NOT NULL,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (logo_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_logo'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_other_format_downloads'
-- 

DROP TABLE IF EXISTS video_other_format_downloads;
CREATE TABLE video_other_format_downloads (
  video_other_format_downloads_id bigint(20) NOT NULL auto_increment,
  video_id bigint(20) NOT NULL default '0',
  video_type varchar(5) NOT NULL,
  total_downloads int(10) NOT NULL default '0',
  PRIMARY KEY  (video_other_format_downloads_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_other_format_downloads'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_player_settings'
-- 

DROP TABLE IF EXISTS video_player_settings;
CREATE TABLE video_player_settings (
  player_settings_id int(11) NOT NULL auto_increment,
  play_settings enum('1','0') NOT NULL default '1',
  title enum('1','0') NOT NULL default '1',
  share_link enum('1','0') NOT NULL default '1',
  repeat_link enum('1','0') NOT NULL default '1',
  skin varchar(50) NOT NULL,
  play_list_settings enum('1','0') NOT NULL default '1',
  show_play_list_by enum('tags','channel','random') NOT NULL default 'tags',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (player_settings_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_player_settings'
-- 

INSERT INTO video_player_settings (player_settings_id, play_settings, title, share_link, repeat_link, skin, play_list_settings, show_play_list_by, date_added) VALUES (2, '0', '1', '1', '1', 'black_themes', '1', 'random', '2008-12-30 14:13:58');

-- --------------------------------------------------------

-- 
-- Table structure for table 'video_playlist'
-- 

DROP TABLE IF EXISTS video_playlist;
CREATE TABLE video_playlist (
  playlist_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) NOT NULL,
  playlist_name varchar(250) NOT NULL,
  playlist_description text character set latin1 collate latin1_general_ci,
  playlist_tags text character set latin1 collate latin1_general_ci,
  playlist_access_type enum('Public','Private') NOT NULL,
  date_added datetime NOT NULL,
  total_videos int(11) NOT NULL default '0',
  total_views bigint(20) NOT NULL default '0',
  total_comments bigint(20) NOT NULL,
  rating_total bigint(20) NOT NULL,
  rating_count bigint(20) NOT NULL,
  last_viewed_date datetime NOT NULL,
  thumb_video_id bigint(20) NOT NULL,
  thumb_ext varchar(20) NOT NULL,
  relation_id text,
  playlist_status enum('Yes','No') NOT NULL default 'Yes',
  PRIMARY KEY  (playlist_id),
  KEY user_id (user_id,playlist_name),
  KEY thumb_video_id (thumb_video_id),
  FULLTEXT KEY playlist_description (playlist_description,playlist_tags),
  FULLTEXT KEY relation_id (relation_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_playlist'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_rating'
-- 

DROP TABLE IF EXISTS video_rating;
CREATE TABLE video_rating (
  rating_id bigint(20) NOT NULL auto_increment,
  video_id bigint(20) NOT NULL default '0',
  user_id bigint(20) NOT NULL default '0',
  rate int(2) NOT NULL default '0',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (rating_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_rating'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_render'
-- 

DROP TABLE IF EXISTS video_render;
CREATE TABLE video_render (
  uid bigint(20) NOT NULL auto_increment COMMENT 'primary key',
  video_id bigint(20) NOT NULL COMMENT 'Campaign ID',
  video_owner_id bigint(20) NOT NULL COMMENT 'video owner id',
  ip_render varchar(20) NOT NULL,
  clicked_video enum('yes','no') NOT NULL,
  date_time_render datetime NOT NULL COMMENT 'date time of the render, need to be updated when we creating new record',
  referer_render varchar(200) NOT NULL,
  PRIMARY KEY  (uid),
  KEY video_id (video_id,referer_render)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_render'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_responses'
-- 

DROP TABLE IF EXISTS video_responses;
CREATE TABLE video_responses (
  video_responses_id bigint(20) NOT NULL auto_increment,
  video_id bigint(20) default NULL,
  video_responses_video_id bigint(20) default NULL,
  video_responses_text text,
  video_responses_status enum('Yes','No') NOT NULL default 'Yes',
  responder_id bigint(20) NOT NULL,
  date_added datetime default NULL,
  PRIMARY KEY  (video_responses_id),
  KEY video_responses (video_responses_video_id,video_responses_id),
  KEY ind_video_id (video_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_responses'
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table 'video_viewed'
-- 

DROP TABLE IF EXISTS video_viewed;
CREATE TABLE video_viewed (
  video_viewed_id bigint(20) NOT NULL auto_increment,
  user_id bigint(20) default NULL,
  video_id bigint(20) default NULL,
  video_owner_id bigint(20) NOT NULL,
  total_views bigint(20) NOT NULL,
  view_date datetime default NULL,
  PRIMARY KEY  (video_viewed_id),
  KEY ind_video_id (video_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table 'video_viewed'
-- 

ALTER TABLE discuzz_boards ADD rating_total BIGINT NOT NULL , ADD rating_count BIGINT NOT NULL ;

ALTER TABLE discuzz_solutions ADD rating_total BIGINT NOT NULL , ADD rating_count BIGINT NOT NULL ;

DROP TABLE IF EXISTS discuzz_board_rating;

CREATE TABLE discuzz_board_rating (   board_rating_id bigint(20) NOT NULL auto_increment,   board_id bigint(20) NOT NULL default '0',   user_id bigint(20) NOT NULL default '0',   rate int(2) NOT NULL default '0',   date_added datetime NOT NULL default '0000-00-00 00:00:00',   PRIMARY KEY  (board_rating_id) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS discuzz_solution_rating;

CREATE TABLE discuzz_solution_rating (   solution_rating_id bigint(20) NOT NULL auto_increment,   solution_id bigint(20) NOT NULL default '0',   user_id bigint(20) NOT NULL default '0',   rate int(2) NOT NULL default '0',   date_added datetime NOT NULL default '0000-00-00 00:00:00',   PRIMARY KEY  (solution_rating_id) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;



