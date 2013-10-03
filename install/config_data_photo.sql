-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 28, 2010 at 09:02 AM
-- Server version: 5.0.33
-- PHP Version: 5.2.1
--
-- Database: 'rayzz_utf8'
--

-- --------------------------------------------------------

--
-- Table structure for table 'config_data_photo'
--

DROP TABLE IF EXISTS config_data_photo;
CREATE TABLE config_data_photo (
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
-- Dumping data for table 'config_data_photo'
--

INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (1, 'admin', 'photos', 'photo_auto_activate', '', '1', 'Boolean', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Allow auto activation of photos', 'Allow auto activation of photos', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (2, 'admin', 'photos', 'watermark_apply', '', '1', 'Boolean', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Apply watermark to photos(Use watermark settings to set the Image)', 'Apply watermark to photos(Use watermark settings to set the Image)', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (3, 'admin', 'watermark', 'watermark_image_position', '', 'bottom_right', 'String', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Watermark Image Position(''top_left'', ''top_right'', ''bottom_left'', ''bottom_right'', ''center'')', 'Watermark Image Position(''top_left'', ''top_right'', ''bottom_left'', ''bottom_right'', ''center'')', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (4, 'admin', 'photos', 'allow_quick_mixs', '', '1', 'Boolean', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Allow photos to be added to QuickView', 'Allow photos to be added to QuickView', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (5, 'admin', 'photos', 'no_of_free_uploads', '', '', 'String', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Allowed no of uploads for Free members(Leave as empty for no limit)', 'Allowed no of uploads for Free members(Leave as empty for no limit)', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (6, 'admin', 'photos', 'captcha', '', '0', 'Boolean', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Enable captcha for Photo Comment', 'Enable captcha for Photo Comment', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (7, 'admin', 'photos', 'captcha_method', '', 'image', 'String', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Captcha Method for Photo Comment (''image'' / ''honeypot'')', 'Captcha Method for Photo Comment (''image'' / ''honeypot'')', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (8, 'admin', 'photos', 'photo_next_prev', '', '1', 'Boolean', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Enable Photo Next Previous Options', 'Enable Photo Next Previous Options', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (9, 'admin', 'photos', 'photo_next_prev_type', '', 'user', 'String', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Photo Next Previous Type (''user'' / ''related'' / ''album'')', 'Photo Next Previous Type (''user'' / ''related'' / ''album'')', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (10, 'admin', 'photos', 'album_image_swap', '', '1', 'Boolean', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'Swap images on mouse over album image', 'Swap images on mouse over album image', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (11, 'admin', 'photos', 'album_image_swap_total_record', '', '5', 'Int', 'photo feature settings', 'photo_feature_settings', 1, 'Yes', 999, 'No of images to be swapped for the above', 'No of images to be swapped for the above', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (12, 'admin', 'module', 'photos_subscription', '', '0', 'Boolean', 'photo feature settings', 'photo_feature_settings', 1, 'No', 999, 'Enable Photo Subscription module', 'Enable Photo Subscription module', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (13, 'admin', 'photos', 'upload_photo_multiupload', '', '1', 'Boolean', 'photo upload settings', 'photo_upload_settings', 2, 'Yes', 999, 'Allow MultiUpload', 'Allow MultiUpload', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (14, 'admin', 'photos', 'upload_photo_normalupload', '', '1', 'Boolean', 'photo upload settings', 'photo_upload_settings', 2, 'Yes', 999, 'Allow NormalUpload', 'Allow NormalUpload', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (15, 'admin', 'photos', 'upload_photo_externalupload', '', '1', 'Boolean', 'photo upload settings', 'photo_upload_settings', 2, 'Yes', 999, 'Allow ExternalUpload', 'Allow ExternalUpload', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (16, 'admin', 'photos', 'upload_photo_capture', '', '1', 'Boolean', 'photo upload settings', 'photo_upload_settings', 2, 'Yes', 999, 'Allow Mugshot Capture', 'Allow Mugshot Capture', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (17, 'admin', 'photos', 'max_size', '', '5', 'Int', 'photo upload settings', 'photo_upload_settings', 2, 'Yes', 999, 'Allowed maximum size in MB', 'Allowed maximum size in MB', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (18, 'admin', 'photos', 'add_photo_location', '', '0', 'Boolean', 'google map location settings', 'location_settings', 3, 'Yes', 999, 'Allow members to set the location of Photo using Google Maps', 'Allow members to set the location of Photo using Google Maps', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (19, 'admin', 'photos', 'google_map_key', '', '', 'String', 'google map location settings', 'location_settings', 3, 'Yes', 999, 'Google Map Api Key', 'Google Map Api Key', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (20, 'admin', 'photos', 'save_original_file_to_download', '', '1', 'Boolean', 'photo feature settings', 'photo_feature_settings', 4, 'Yes', 999, 'Save Original File', 'Save Original File', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (21, 'admin', 'photos', 'recommendedphoto', '', '1', 'Boolean', 'index page settings', 'index_page_photo_settings', 5, 'No', 999, 'Show Recommended Photos', 'Show Recommended Photos', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (22, 'admin', 'photos', 'topratedphoto', '', '1', 'Boolean', 'index page settings', 'index_page_photo_settings', 5, 'No', 999, 'Show Toprated photo', 'Show Toprated photo', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (23, 'admin', 'photos', 'mostfavoritephoto', '', '1', 'Boolean', 'index page settings', 'index_page_photo_settings', 5, 'No', 999, 'Show Most Favorite Photo', 'Show Most Favorite Photo', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (24, 'admin', 'photos', 'mostrecentphoto', '', '1', 'Boolean', 'index page settings', 'index_page_photo_settings', 5, 'No', 999, 'Show Recently added photo', 'Show Recently added photo', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (25, 'admin', 'photos', 'index_show_featured_member', '', '1', 'Boolean', 'index page settings', 'index_page_photo_settings', 5, 'No', 999, 'Show Featured Member', 'Show Featured Member', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (26, 'admin', 'photos', 'index_featured_photo_behavior', '', 'fade', 'String', 'index page settings', 'index_page_photo_settings', 5, 'No', 999, 'Webmaster Picks Content Style (&quot;slide-hori / slide-vert / resize / fade&quot;)', 'Webmaster Picks Content Style (&quot;slide-hori / slide-vert / resize / fade&quot;)', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (27, 'admin', 'photos', 'photo_category_list_priority', '', '1', 'Boolean', 'photo feature settings', 'photo_feature_settings', 6, 'Yes', 999, 'List photo categories by priority', 'List photo categories by priority', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (28, 'admin', 'photos', 'adult_content_view', '', 'Yes', 'String', 'other settings', 'other_settings', 6, 'No', 999, 'Display adult content to members(''Yes'', ''No'', ''Confirmation'')', 'Display adult content to members(''Yes'', ''No'', ''Confirmation'')', '0000-00-00 00:00:00');
INSERT INTO config_data_photo (config_data_id, dim1, dim2, dim3, dim4, config_value, config_type, config_category, config_section, config_section_order, editable, edit_order, description, help_text, date_added) VALUES (29, 'admin', 'photos', 'adult_minimum_age', '', '18', 'Int', 'other settings', 'other_settings', 6, 'No', 999, 'Adult Minimum Age', 'Adult Minimum Age', '0000-00-00 00:00:00');


--
-- Alter data in table 'config_data_photo'
--
update config_data_photo set `config_category` ='photo_feature_settings' where config_category = 'photo feature settings';
update config_data_photo set `config_category` ='photo_upload_settings' where config_category = 'photo upload settings';
update config_data_photo set `config_category` ='google_map_location_settings' where config_category = 'google map location settings';
update config_data_photo set `config_category` ='index_page_settings' where config_category = 'index page settings';
update config_data_photo set `config_category` ='other_settings' where config_category = 'other settings';