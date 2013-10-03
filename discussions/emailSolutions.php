<?php
/**
 * This file handles the Email this Board page
 *
 * PHP version 5.0
 *
 * @category	Discuzz
 * @package		emailSolutions
 * @author 		shankar_76ag08
 * @copyright 	Copyright (c) 2009 - 2010 {@link http://www.agriya.com Agriya Infoway}
 * @license		http://www.agriya.com Agriya Infoway Licence
 * @version		SVN: $Id: $
 * @since 		2007-12-22
 */
require_once('../common/configs/config.inc.php');
$CFG['lang']['include_files'][] = 'languages/%s/discussions/email_notify.inc.php';
$CFG['lang']['include_files'][] = 'languages/%s/'.$CFG['admin']['index']['home_module'].'/emailSolutions.php';
$CFG['html']['header'] = 'general/html_header_no_header.php';
$CFG['html']['footer'] = 'general/html_footer_no_footer.php';
$CFG['site']['is_module_page']='discussions';
$CFG['mods']['include_files'][] = 'common/classes/class_ListRecordsHandler.lib.php';
$CFG['mods']['include_files'][] = 'common/classes/class_DiscussionHandler.lib.php';
$CFG['mods']['include_files'][] = 'common/classes/class_DiscussionsActivityHandler.lib.php';
//compulsory
$CFG['mods']['is_include_only']['html_header'] = false;
$CFG['html']['is_use_header'] = false;

/**
 * To include application top file
 */
require_once($CFG['site']['project_path'].'common/application_top.inc.php');
//FOR RAYZZ INTEGRATION
if(class_exists('DiscussionHandler'))
	{
		$discussionHandler = new DiscussionHandler();
		$smartyObj->assign_by_ref('discussion', $discussionHandler);
	}
require('general/emailSolutions.php');
?>