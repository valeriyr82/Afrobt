<?php
/**
 * File handling the signup for the new user
 *
 * There user has to enter their valid details for successful signup. After successful
 * signup the user will receive the mail with a link to activate the account. By clicking
 * the link the user can activate his account.
 *
 * PHP version 5.0
 * @category	Rayzz
 * @package		Index
 */

require_once('./common/configs/config.inc.php');
$CFG['lang']['include_files'][] = 'languages/%s/root/signup.php';
$CFG['lang']['include_files'][] = 'languages/%s/common/email_notify.inc.php';
$CFG['lang']['include_files'][] = 'languages/%s/lists_array/countries_list_array.inc.php';
$CFG['lang']['include_files'][] = 'languages/%s/lists_array/gender_list_array.inc.php';
$CFG['lang']['include_files'][] = 'languages/%s/lists_array/months_list_array.inc.php';
$CFG['mods']['include_files'][] = 'common/classes/class_SignupAndLoginHandler.lib.php';
$CFG['mods']['include_files'][] = 'common/classes/recaptchalib.php';
$CFG['html']['header'] = 'general/html_header.php';
$CFG['html']['footer'] = 'general/html_footer.php';
$CFG['mods']['is_include_only']['html_header'] = false;
$CFG['html']['is_use_header'] = false;
$CFG['auth']['is_authenticate'] = 'root';
//To load Calendar related JS files
$CFG['admin']['calendar_page'] = true;
require($CFG['site']['project_path'].'common/application_top.inc.php');
require_once($CFG['site']['project_path'].'general/signup.php');
?>