<?php
/**
 * config to include template related styles
 *
 * ..
 *
 * PHP version 5.0
 *
 * @category	..
 * @package		..
 * @copyright 	Copyright (c) 2008 {@link http://www.agriya.com Agriya Infoway}
 * @license		http://www.agriya.com Agriya Infoway Licence
 * @filesource
 **/

$config_file_name = 'config_'.$CFG['html']['template']['default'].'_styles.inc.php';
if(file_exists($CFG['site']['project_path'].'common/configs/templates_configs/'.$config_file_name))
	require_once($CFG['site']['project_path'].'common/configs/templates_configs/'.$config_file_name);
?>