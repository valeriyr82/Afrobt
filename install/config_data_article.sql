-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 28, 2010 at 12:04 PM
-- Server version: 5.0.33
-- PHP Version: 5.2.1
--
-- Database: 'rayzz_utf8'
--

-- --------------------------------------------------------

--
-- Table structure for table 'config_data_article'
--

DROP TABLE IF EXISTS config_data_article;
CREATE TABLE config_data_article (
  config_data_id bigint(20) NOT NULL auto_increment,
  dim1 varchar(100) NOT NULL,
  dim2 varchar(100) NOT NULL,
  dim3 varchar(100) NOT NULL,
  dim4 varchar(100) NOT NULL,
  config_value text NOT NULL,
  config_type enum('Int','Real','String','Boolean','Array','Intwithsymbol','Email','Website') NOT NULL default 'String',
  config_category varchar(100) NOT NULL,
  config_section varchar(100) NOT NULL,
  config_section_order int(11) NOT NULL default '100',
  editable enum('Yes','No') NOT NULL default 'No',
  edit_order int(11) NOT NULL default '999',
  description text NOT NULL,
  help_text text NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY  (config_data_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'config_data_article'
--

INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (1, 'admin', 'articles', 'auto_activate', '', '1', 'Boolean', 'article_feature_settings', 'article_feature_settings', 1, 'Yes', 999, 'Allow auto activation of articles', 'Allow auto activation of articles', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (2, 'admin', 'articles', 'no_of_free_uploads', '', '2', 'String', 'article_feature_settings', 'article_feature_settings', 1, 'Yes', 999, 'Allowed no of uploads for Free members(Leave as empty for no limit)', 'Allowed no of uploads for Free members(Leave as empty for no limit)', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (3, 'admin', 'articles', 'more_articles_expand_collapse', '', '1', 'Boolean', 'article_feature_settings', 'article_feature_settings', 1, 'No', 999, 'Show More Articles expand/collapse option in View Article page', 'Show More Articles expand/collapse option in View Article page', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (4, 'admin', 'articles', 'more_articles_default_content', '', 'User', 'String', 'article_feature_settings', 'article_feature_settings', 1, 'Yes', 999, 'Default tab for More Articles in View Article page (&quot;User / Related / Top &quot;)', 'Default tab for More Articles in View Article page (&quot;User / Related / Top &quot;)', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (5, 'admin', 'articles', 'captcha', '', '1', 'Boolean', 'article_feature_settings', 'captcha_settings', 2, 'Yes', 999, 'Enable Captcha', 'Enable Captcha', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (6, 'admin', 'articles', 'captcha_method', '', '1', 'Boolean', 'article_feature_settings', 'captcha_settings', 2, 'No', 999, 'Captcha method Set(&quot; image / honeypot&quot;)', 'Captcha method Set(&quot; image / honeypot&quot;)', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (7, 'admin', 'articles', 'article_insert_image', '', '1', 'Boolean', 'article_feature_settings', 'article_upload_settings', 3, 'Yes', 999, 'Allow insert image inside article', 'Allow insert image inside article', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (8, 'admin', 'articles', 'article_attachment', '', '1', 'Boolean', 'article_feature_settings', 'article_upload_settings', 3, 'Yes', 999, 'Allow article attachment', 'Allow article attachment', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (9, 'admin', 'articles', 'article_total_attachments', '', '5', 'Int', 'article_feature_settings', 'article_upload_settings', 3, 'Yes', 999, 'Article total attachments', 'Article total attachments', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (10, 'admin', 'articles', 'attachment_format_arr', '', 'doc, docx, ppt, pptx, txt, rtf, xls, xlsx, pdf', 'Array', 'article_feature_settings', 'article_upload_settings', 3, 'Yes', 999, 'Article Attachment File Formats', 'Article Attachment File Formats', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (11, 'admin', 'articles', 'attachment_max_size', '', '500', 'Int', 'article_feature_settings', 'article_upload_settings', 3, 'No', 999, 'Article attachment maximum size in KB', 'Article attachment maximum size in KB', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (12, 'admin', 'articles', 'allow_edit_article_to_approve', '', '1', 'Boolean', 'article_feature_settings', 'article_edit_settings', 4, 'Yes', 999, 'Allow article to be approved by admin while editing  (Note: Allow auto activation of articles setting should be off)', 'Allow article to be approved by admin while editing  (Note: Allow auto activation of articles setting should be off)', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (13, 'admin', 'articles', 'allow_edit_article_attachment', '', '1', 'Boolean', 'article_feature_settings', 'article_edit_settings', 4, 'Yes', 999, 'Allow add/replace article attachment while editing', 'Allow add/replace article attachment while editing', '0000-00-00 00:00:00');
INSERT INTO config_data_article (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (14, 'admin', 'articles', 'article_category_list_priority', '', '1', 'Boolean', 'article_feature_settings', 'other_settings', 5, 'Yes', 999, 'List article categories by priority', 'List article categories by priority', '0000-00-00 00:00:00');

--
-- Alter table data for  'config_data_article'
--

update config_data_article set `config_category` ='article_feature_settings' where config_category = 'article feature settings';
update config_data_article set `config_category` ='captcha_settings' where config_category = 'captcha settings';
update config_data_article set `config_category` ='article_upload_settings' where config_category = 'article upload settings';
update config_data_article set `config_category` ='article_edit_settings' where config_category = 'article edit settings';
update config_data_article set `config_category` ='other_settings' where config_category = 'other settings';

--
-- Added update query to modify captcha method config setting default value and its config type
--

UPDATE `config_data_article` SET `config_value` = 'image',`config_type` = 'String',`editable` = 'Yes' WHERE `config_data_article`.`config_data_id` =6;
