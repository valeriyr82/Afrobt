<?php
/**
 * File to handle the page title information
 *
 * Using this file the title of the pages can be modified easily.
 *
 * PHP version 5.0
 *
 * @category	###Framework###
 * @package		###Commmo###
 * @author 		rajesh_04ag02
 * @copyright 	Copyright (c) 2008 {@link http://www.agriya.com Agriya Infoway}
 * @license		http://www.agriya.com Agriya Infoway Licence
 * @version		Release: @package_version@
 * @since 		2006--dd
 */
//for easy edit of page titles....
global $Site_Name;

if ($title=='XXXXXXX')
		$title = 'XXXXXX';


//append site name...
if ($title=='Site Index')
	$title = $Site_Name;
  else if ($Site_Name)
	$title = $Site_Name. ' - ' . $title;
?>