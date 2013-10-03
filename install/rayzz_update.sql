-- File to save the changes to sql
-- Format
-- Comment line -- Added by
-- Date and time added
-- alter query

--
-- alert Query of table `video` for add 'featured_video_order_id' field
-- Added by Ramkumar
-- Date and time : 10 July 2010 03:30pm


ALTER TABLE `video` ADD `featured_video_order_id` BIGINT NOT NULL ;

--
--  Query to Rename table from tags_article to article_tags
--

RENAME TABLE `tags_article`  TO `article_tags`;


--
--  Query to add 'album_featured' field in 'music_album' table
--
ALTER TABLE `music_album` ADD `album_featured` ENUM( 'Yes', 'No' ) NOT NULL DEFAULT 'No';


--
-- insert Query for adding block in table `profile_block`
-- Added by Ramkumar
-- Date and time : 19 July 2010 10:10am

INSERT INTO `profile_block` (`user_id`, `module_name`, `block_name`, `block_description`, `order_no`, `position`, `display`, `date_added`, `profile_category_id`) VALUES
( 1,'default', 'recentblogarticleforum', 'recentblogarticleforum', 6, 'right', 'Yes', '2010-07-17 14:34:08', 0);


--
-- insert Query for adding Config variable for discussion module in table `config_data`
-- Added by Ramkumar
-- Date and time : 19 July 2010 10:10am

INSERT INTO config_data SET dim1 = 'admin', dim2 = 'module', dim3 = 'discussions', dim4 = '', config_value = '1', config_type = 'Boolean', config_category = 'module', config_section = 'module_settings', config_section_order = '50', editable = 'Yes', edit_order = '999', description = 'Enable Discussion Module', help_text = 'Enable Discussion Module';

--
--  Update query to modify 'temp_media' folder path
--
Update query to modify temp_media folder path from 'files/temp_files' to 'temp_files/';

--
-- update Query for screen folder Config variable of discussion module  in table `config_data_discussions`
-- Added by Ramkumar
-- Date and time : 21 July 2010 11:50am


UPDATE `rayzz3`.`config_data_discussions` SET `config_value` = 'screen_outlook' WHERE `config_data_discussions`.`config_data_id` =14 LIMIT 1 ;

--
-- update Query for profile count of music Config variable of music module  in table `config_data_music`
-- Added by Ramkumar
-- Date and time : 23 July 2010 11:50am


UPDATE `rayzz3`.`config_data_music` SET `config_value` = '4' WHERE `config_data_music`.`config_data_id` = 48;

--
-- insert Query for adding Featured block in table `profile_block`
-- Added by Ramkumar
-- Date and time : 24 July 2010 11:10am

INSERT INTO `rayzz_new`.`profile_block` (`profile_block_id` ,`user_id` ,`module_name` ,`block_name` ,`block_description` ,`order_no` ,`position` ,`display` ,`date_added` ,`profile_category_id`)VALUES (NULL , '1', 'default', 'featuredmedia', 'featuredmedia', '7', 'right', 'Yes', '2010-07-24 11:02:08', '1');

--
-- alert query of discuzz_boards and discuzz_solutions tables for including rating_total and rating_count
-- Added by Ramkumar
-- Date and time : 29 July 2010 1:00pm

ALTER TABLE `discuzz_boards` ADD `rating_total` BIGINT NOT NULL DEFAULT '0',
ADD `rating_count` BIGINT NOT NULL DEFAULT '0';

ALTER TABLE `discuzz_solutions` ADD `rating_total` BIGINT NOT NULL DEFAULT '0',
ADD `rating_count` BIGINT NOT NULL DEFAULT '0';

--
-- create discuzz_board_rating and discuzz_solution_rating tables for rating
-- Added by Ramkumar
-- Date and time : 29 July 2010 1:00pm

DROP TABLE IF EXISTS `discuzz_solution_rating`;
CREATE TABLE IF NOT EXISTS `discuzz_solution_rating` (
  `solution_rating_id` bigint(20) NOT NULL auto_increment,
  `solution_id` bigint(20) NOT NULL default '0',
  `user_id` bigint(20) NOT NULL default '0',
  `rate` int(2) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`solution_rating_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `discuzz_board_rating`;
CREATE TABLE IF NOT EXISTS `discuzz_board_rating` (
  `board_rating_id` bigint(20) NOT NULL auto_increment,
  `board_id` bigint(20) NOT NULL default '0',
  `user_id` bigint(20) NOT NULL default '0',
  `rate` int(2) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`board_rating_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


--
-- delete query added for config_data_music.sql to remove 'upload_youtube_flv', & 'upload_capture_flv' variables ie., not used in amy pages.
-- Added by J.Jeya Sharmila
-- Date and time : 03 August 2010 11:30 AM
--

DELETE FROM `config_data_music` WHERE `config_data_music`.`config_data_id` = 33 AND CONVERT(`config_data_music`.`dim1` USING utf8) = 'admin' AND CONVERT(`config_data_music`.`dim2` USING utf8) = 'musics' AND CONVERT(`config_data_music`.`dim3` USING utf8) = 'upload_youtube_flv' AND CONVERT(`config_data_music`.`dim4` USING utf8) = '' AND CONVERT(`config_data_music`.`config_value` USING utf8) = '1' AND CONVERT(`config_data_music`.`config_type` USING utf8) = 'Boolean' AND CONVERT(`config_data_music`.`config_category` USING utf8) = 'music_setting' AND CONVERT(`config_data_music`.`config_section` USING utf8) = 'Uploader Settings' AND `config_data_music`.`config_section_order` = 7 AND CONVERT(`config_data_music`.`editable` USING utf8) = 'Yes' AND `config_data_music`.`edit_order` = 999 AND CONVERT(`config_data_music`.`description` USING utf8) = 'External upload' AND CONVERT(`config_data_music`.`help_text` USING utf8) = 'External upload' AND `config_data_music`.`date_added` = '0000-00-00 00:00:00' LIMIT 1;
DELETE FROM `config_data_music` WHERE `config_data_music`.`config_data_id` = 34 AND CONVERT(`config_data_music`.`dim1` USING utf8) = 'admin' AND CONVERT(`config_data_music`.`dim2` USING utf8) = 'musics' AND CONVERT(`config_data_music`.`dim3` USING utf8) = 'upload_capture_flv' AND CONVERT(`config_data_music`.`dim4` USING utf8) = '' AND CONVERT(`config_data_music`.`config_value` USING utf8) = '1' AND CONVERT(`config_data_music`.`config_type` USING utf8) = 'Boolean' AND CONVERT(`config_data_music`.`config_category` USING utf8) = 'music_setting' AND CONVERT(`config_data_music`.`config_section` USING utf8) = 'Uploader Settings' AND `config_data_music`.`config_section_order` = 7 AND CONVERT(`config_data_music`.`editable` USING utf8) = 'Yes' AND `config_data_music`.`edit_order` = 999 AND CONVERT(`config_data_music`.`description` USING utf8) = 'Record audio' AND CONVERT(`config_data_music`.`help_text` USING utf8) = 'Record audio' AND `config_data_music`.`date_added` = '0000-00-00 00:00:00' LIMIT 1;
