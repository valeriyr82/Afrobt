<?php
/**
*
*
* @	Author			: By Haking Br
* @	Author			: Por Haking Br
* @ Brasil
* @	Release on		:	03.10.2011
*
*/

function chkIsWritableAll( $folder_name = "", $all = false, $all_display = false )
{
    global $err_msg;
    $val = 0;
    if ( $all && is_dir( $folder_name ) )
    {
        if ( $handle = opendir( $folder_name ) )
        {
            if ( $all_display )
            {
                while ( false !== ( $file = readdir( $handle ) ) )
                {
                    if ( $file == "." || $file == ".." )
                    {
                        continue;
                    }
                    echo "  \t\t\t\t\t\t\t\t<tr>\r\n  \t\t\t\t\t\t\t\t\t<td>";
                    echo $folder_name.$file;
                    echo "</td>\r\n  \t\t\t\t\t\t\t\t\t<td>";
                    echo is_dir( $folder_name.$file ) ? "Folder" : "File";
                    echo "</td>\r\n  \t\t\t\t\t\t\t\t\t<td>\r\n";
                    if ( !is_writable( $folder_name.$file ) )
                    {
                        echo "<span class=\"clsRequirementsNotOK\">Error</span>";
                        ++$val;
                    }
                    else
                    {
                        echo "<span class=\"clsRequirementsOK\">Ok</span>";
                    }
                    echo "  \t\t\t\t\t\t\t\t\t</td>\r\n  \t\t\t\t\t\t\t\t</tr>\r\n";
                }
            }
            else
            {
                while ( false !== ( $file = readdir( $handle ) ) )
                {
                    if ( $file == "." || $file == ".." )
                    {
                        continue;
                    }
                    if ( !is_writable( $folder_name.$file ) )
                    {
                        ++$val;
                    }
                }
                echo "  \t\t\t\t\t\t<tr>\r\n  \t\t\t\t\t\t\t<td>";
                echo $folder_name;
                echo "</td>\r\n  \t\t\t\t\t\t\t<td>Folder</td>\r\n  \t\t\t\t\t\t\t<td>";
                echo $val == 0 ? "<span class=\"clsRequirementsOK\">Ok</span>" : "<span class=\"clsRequirementsNotOK\">Error - files</span>";
                echo "</td>\r\n  \t\t\t\t\t\t</tr>\r\n";
            }
            closedir( $handle );
        }
    }
    else if ( is_dir( $folder_name ) && !$all )
    {
        echo "  \t\t\t\t<tr>\r\n  \t\t\t\t\t<td>";
        echo $folder_name;
        echo "</td>\r\n  \t\t\t\t\t<td>Folder</td>\r\n  \t\t\t\t\t<td>";
        if ( is_writable( $folder_name ) )
        {
            echo "<span class=\"clsRequirementsOK\">Ok</span>";
            $val = 0;
        }
        else
        {
            echo "<span class=\"clsRequirementsNotOK\">Error</span>";
            $val = 1;
        }
        echo "</td>\r\n  \t\t\t\t</tr>\r\n";
    }
    else if ( !is_dir( $folder_name ) )
    {
        echo "  \t\t\t\t<tr>\r\n  \t\t\t\t\t<td>";
        echo $folder_name;
        echo "</td>\r\n  \t\t\t\t\t<td>File</td>\r\n  \t\t\t\t\t<td>";
        if ( is_writable( $folder_name ) )
        {
            echo "<span class=\"clsRequirementsOK\">Ok</span>";
            $val = 0;
        }
        else
        {
            echo "<span class=\"clsRequirementsNotOK\">Error</span>";
            $val = 1;
        }
        echo "</td>\r\n  \t\t\t\t</tr>\r\n";
    }
    if ( 0 < $val )
    {
        $err_msg = "Error found! Write permission missing for some files/folders";
    }
}

function setCommonErrorMessage( )
{
    $this->setCommonErrorMsg( $this->file_err_msg );
}

function connectDB( )
{
    global $err_msg;
    global $san_arr;
    if ( $rs = @mysql_connect( $san_arr['dbhost'], $san_arr['dbuser'], $san_arr['dbpass'] ) )
    {
        return $rs;
    }
    $err_msg .= "<li>Could not connect</li>";
    return false;
}

function checkDB( )
{
    global $san_arr;
    global $err_msg;
    if ( !mysql_select_db( $san_arr['dbname'] ) )
    {
        $err_msg .= "<li>Database not created, please create the database and press \"Next\"...</li>";
        return false;
    }
}

function chkIsDBExists( )
{
    global $err_msg;
    global $san_arr;
    if ( isset( $san_arr['drp'] ) && mysql_select_db( $san_arr['dbname'] ) )
    {
        mysql_query( "DROP DATABASE ".$san_arr['dbname'] );
    }
    if ( mysql_select_db( $san_arr['dbname'] ) )
    {
        $err_msg .= "<li>DB Already exists, if you want to drop the existing db press 'DROP AND CREATE', otherwise change the data base name and press 'Next' ";
        $err_msg .= "<form name=\"form_db_exists\" id=\"selFormDbExists\" method=\"post\" action=\"".$_SERVER['PHP_SELF']."\">\r\n  \t<input type=\"hidden\" name=\"drp\" id=\"drp\" value=\"ok\" />\r\n  \t<input type=\"hidden\" name=\"dbhost\" id=\"dbhostdrp\" value=\"".$san_arr['dbhost']."\" />\r\n  \t<input type=\"hidden\" name=\"dbuser\" id=\"dbuserdrp\" value=\"".$san_arr['dbuser']."\" />\r\n  \t<input type=\"hidden\" name=\"dbpass\" id=\"dbpassdrp\" value=\"".$san_arr['dbpass']."\" />\r\n  \t<input type=\"hidden\" name=\"dbname\" id=\"dbnamedrp\" value=\"".$san_arr['dbname']."\" />\r\n  \t<input type=\"submit\" class=\"clsSubmitButton\" name=\"submit_db\" id=\"submit_db_drp\" value=\"DROP AND CREATE\" />\r\n  </form>";
        $err_msg .= "</li>";
        return true;
    }
    return false;
}

function queryDB( $sql )
{
    global $err_msg;
    global $san_arr;
    if ( mysql_query( $sql ) )
    {
        return true;
    }
    $err_msg .= "<li>Could not Create DB</li>";
    return false;
}

function setAllPageBlocksHide( )
{
    global $page_blocks;
    global $show_block;
    foreach ( $page_blocks as $val )
    {
        $show_block[$val] = false;
    }
}

function setPageBlockShow( $val )
{
    global $show_block;
    $show_block[$val] = true;
}

function sanitizeFormInputs( $request_arr )
{
    global $san_arr;
    foreach ( $request_arr as $key => $val )
    {
        $san_arr[$key] = htmlspecialchars( trim( $request_arr[$key] ) );
    }
}

function getFormField( $key )
{
    global $san_arr;
    return isset( $san_arr[$key] ) ? $san_arr[$key] : "";
}

function chkIsNotEmpty( $field_name, $err_tip = "" )
{
    global $san_arr;
    global $err_msg;
    $is_ok = is_string( $san_arr[$field_name] ) ? $san_arr[$field_name] != "" : !empty( $san_arr[$field_name] );
    if ( !$is_ok )
    {
        $err_msg .= "<li>".$err_tip."</li>";
    }
    return $is_ok;
}

function parse_mysql_dump( $url, $ignoreerrors = false )
{
    global $san_arr;
    global $err_msg;
    if ( !mysql_select_db( $san_arr['dbname'] ) )
    {
        $err_msg .= "<li>Database not created, please create the database and press \"Next\"...</li>";
        return false;
    }
    $file_content = file( $url );
    $query = "";
    foreach ( $file_content as $sql_line )
    {
        $tsl = trim( $sql_line );
        if ( $sql_line != "" && substr( $tsl, 0, 2 ) != "--" && substr( $tsl, 0, 1 ) != "#" )
        {
            $query .= $sql_line;
            if ( preg_match( "/;\\s*\$/", $sql_line ) )
            {
                $result = mysql_query( $query );
                if ( !$result && !$ignoreerrors )
                {
                    exit( mysql_error( ) );
                }
                $query = "";
            }
        }
    }
    return true;
}

function writeDBConfig( )
{
    global $san_arr;
    global $err_msg;
    if ( is_writable( "./common/configs/config_db.inc.php" ) && ( $handle = fopen( "./common/configs/config_db.inc.php", "w" ) ) )
    {
        $str = "<?php\r\n\$CFG['db']['hostname'] = '{$san_arr['dbhost']}';\r\n\$CFG['db']['name'] = '{$san_arr['dbname']}';\r\n\$CFG['db']['username'] = '{$san_arr['dbuser']}';\r\n\$CFG['db']['password'] = '{$san_arr['dbpass']}';\r\n?>";
        fwrite( $handle, $str );
        fclose( $handle );
    }
}

function writeEncoderConfig( )
{
    global $CFG;
}

function chkManual( )
{
    global $san_arr;
    global $err_msg;
    global $CFG;
    $home_url_site = "";
    $home_url_port = 80;
    $home_url_iono = "/sales/remote.php";
    $user_defined_string = "f258410f387e";
    $product_id = "166";
    $product_license_id = "0";
    $request_type = 1;
    if ( !empty( $product_id ) )
    {
        $key_parts = explode( "-", $san_arr['license_key'] );
        if ( !isset( $key_parts[2] ) || $key_parts[2] != $product_id )
        {
            echo "????";
            exit( );
        }
    }
    $host = $_SERVER['HTTP_HOST'];
    if ( strcasecmp( "www.", substr( $_SERVER['HTTP_HOST'], 0, 4 ) ) == 0 )
    {
        $host = substr( $_SERVER['HTTP_HOST'], 4 );
    }
    $request = "remote=licenses&type=".$request_type."&license_key=".urlencode( base64_encode( $san_arr['license_key'] ) );
    $request .= "&host_ip=".urlencode( base64_encode( $_SERVER['SERVER_ADDR'] ) )."&host_name=".urlencode( base64_encode( $host ) );
    $request .= "&hash=".urlencode( base64_encode( md5( $request ) ) );
    $request = $home_url_site.$home_url_iono."?".$request;
    $ch = curl_init( );
    curl_setopt( $ch, CURLOPT_URL, $request );
    curl_setopt( $ch, CURLOPT_PORT, $home_url_port );
    curl_setopt( $ch, CURLOPT_HEADER, false );
    curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
    curl_setopt( $ch, CURLOPT_USERAGENT, "iono (www.olate.co.uk/iono)" );
    $content = curl_exec( $ch );
    curl_close( $ch );
    if ( !$content )
    {
        echo "****";
        exit( );
    }
    $content = explode( "-", $content );
    $status = $content[0];
    $hash = $content[1];
    if ( $hash == md5( $user_defined_string.$host ) && $status == 1 )
    {
        return true;
    }
    echo "****";
    exit( );
}

function writeLicenseKey( )
{
    global $san_arr;
    global $err_msg;
    global $CFG;
    chkmanual( );
    if ( is_writable( "./common/license/config_license.inc.php" ) )
    {
        if ( $handle = fopen( "./common/license/config_license.inc.php", "w" ) )
        {
            $host = $_SERVER['HTTP_HOST'];
            if ( strcasecmp( "www.", substr( $_SERVER['HTTP_HOST'], 0, 4 ) ) == 0 )
            {
                $host = substr( $_SERVER['HTTP_HOST'], 4 );
            }
            $str = $san_arr['license_key'].$host."rayzz";
            $str = md5( $str );
            $str = "<?php\r\n\$CFG['app']['license_key'] = '{$san_arr['license_key']}';\r\n\$CFG['app']['license_verified'] = '{$str}';\r\n?>";
            fwrite( $handle, $str );
            fclose( $handle );
        }
        return true;
    }
    return false;
}

function validateLicenseKey( )
{
    global $san_arr;
    global $err_msg;
    global $license_written;
    global $CFG;
    global $error_text;
    $license_obj = new IonoLicenseHandler( );
    $license_obj->setErrorTexts( $error_text );
    $license_obj->setCFGAppLicenseValues( $CFG );
    $err_msg = $license_obj->ionLicenseHandler( $san_arr['license_key'], $CFG['app_license']['install_type'] );
    if ( $err_msg == "" )
    {
        $license_written = writelicensekey( );
    }
}

function setStepsErrorMsg( $error_msg, $submit_button_name )
{
    echo "\r\n\t\t\t\t\t<div id=\"selMsgError\">\r\n\t\t\t\t\t\t<p>";
    echo $error_msg;
    echo "</p>\r\n\t\t\t\t\t</div>\r\n\t\t\t\t\t<table>\r\n\t\t\t\t\t<tr><td>\r\n\t\t\t\t\t\t<form name=\"form_index\" id=\"selFormIndex\" method=\"post\" action=\"";
    echo $_SERVER['PHP_SELF'];
    echo "\">\r\n\t\t\t\t\t\t<div class=\"clsListSubmitLeft\"><div class=\"clsListSubmitRight\"><input type=\"submit\" class=\"clsSubmitButton\" name=\"";
    echo $submit_button_name;
    echo "\" id=\"";
    echo $submit_button_name;
    echo "\" value=\"Re-Check Now\" /></div></div>\r\n\t\t\t\t\t\t</form>\r\n\t\t\t\t\t</td></tr>\r\n\t\t\t\t\t</table>\r\n\t\t\t\t";
}

function insertBannerDetails( )
{
    global $san_arr;
    global $CFG;
    $db = mysql_connect( $san_arr['dbhost'], $san_arr['dbuser'], $san_arr['dbpass'] );
    mysql_select_db( $san_arr['dbname'] );
    $site_design_folder = $CFG['site']['url']."design";
    $site_template_folder = $CFG['html']['template']['default'];
    $query = "DROP TABLE IF EXISTS `advertisement`;";
    mysql_query( $query );
    $query = "CREATE TABLE `advertisement` (\r\n\t\t\t  `add_id` int(10) unsigned NOT NULL auto_increment,\r\n\t\t\t  `user_id` bigint(20) NOT NULL default '0',\r\n\t\t\t  `post_from` enum('User','Admin') collate latin1_general_ci NOT NULL default 'Admin',\r\n\t\t\t  `block` varchar(100) collate latin1_general_ci NOT NULL default '',\r\n\t\t\t  `about` text collate latin1_general_ci,\r\n\t\t\t  `source` longtext collate latin1_general_ci,\r\n\t\t\t  `start_date` datetime NOT NULL,\r\n\t\t\t  `end_date` datetime NOT NULL,\r\n\t\t\t  `allowed_impressions` bigint(20) NOT NULL default '0',\r\n\t\t\t  `completed_impressions` bigint(20) NOT NULL default '0',\r\n\t\t\t  `add_type` enum('Porn','General') collate latin1_general_ci NOT NULL default 'General',\r\n\t\t\t  `status` enum('activate','toactivate') collate latin1_general_ci NOT NULL default 'toactivate',\r\n\t\t\t  `date_added` datetime NOT NULL,\r\n\t\t\t  PRIMARY KEY  (`add_id`),\r\n\t\t\t  KEY `post_from` (`post_from`)\r\n\t\t\t) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;";
    mysql_query( $query );
    $query = "INSERT INTO `advertisement` VALUES (1, 1, 'Admin', 'top_banner_468x60', 'Top Banner', '&lt;img src=&quot;{$site_design_folder}/templates/{$site_template_folder}/images/banner_468x60.gif&quot;&gt;', '2009-04-22 14:31:05', '2012-04-30 14:31:07', 0, 0, 'General', 'activate', '2009-04-22 14:31:12'),\r\n\t       (2, 1, 'Admin', 'bottom_banner_468x60', 'Bottom Banner', '&lt;img src=&quot;{$site_design_folder}/templates/{$site_template_folder}/images/banner_468x60.gif&quot;&gt;', '2009-04-25 14:22:18', '2012-04-30 14:22:21', 0, 0, 'General', 'activate', '2009-04-25 14:22:38'),\r\n\t       (3, 1, 'Admin', 'sidebanner1_336x280', 'Side Banner1', '&lt;img src=&quot;{$site_design_folder}/templates/{$site_template_folder}/images/sidebanner_336x280.gif&quot;&gt;', '2009-04-22 14:33:52', '2012-04-30 14:33:55', 0, 1741, 'General', 'activate', '2009-04-22 14:34:00'),\r\n\t       (4, 1, 'Admin', 'sidebanner2_336x280', 'Side Banner2', '&lt;img src=&quot;{$site_design_folder}/templates/{$site_template_folder}/images/sidebanner_336x280.gif&quot;&gt;', '2009-04-24 16:03:06', '2012-04-30 16:03:09', 0, 1109, 'General', 'activate', '2009-04-24 16:03:14'),\r\n           (5, 1, 'Admin', 'sidebanner2_234x60', 'View Photo Side Banner1', '&lt;img src=&quot;{$site_design_folder}/templates/{$site_template_folder}/images/sidebanner_234x60.gif&quot;&gt;', '2009-04-22 15:00:34', '2012-04-30 15:00:37', 0, 5534, 'General', 'activate', '2009-04-22 15:00:41');";
    mysql_query( $query );
}

if ( ( integer )phpversion( ) < 5 )
{
    $host = "";
    if ( isset( $_SERVER['HTTP_HOST'] ) )
    {
        $host = $_SERVER['HTTP_HOST'];
    }
    else if ( isset( $_SERVER['SERVER_NAME'] ) )
    {
        $host = $_SERVER['SERVER_NAME'];
    }
    $CFG['site']['url'] = ( !empty( $_SERVER['HTTPS'] ) ? "https" : "http" )."://".$host.str_replace( array( "common/", "admin/", "cron/", "rss/" ), "", substr( $_SERVER['SCRIPT_NAME'], 0, strrpos( $_SERVER['SCRIPT_NAME'], "/" ) + 1 ) );
}
else
{
    require_once( "./common/configs/config.inc.php" );
}
require_once( "./common/license/config_app_license.inc.php" );
require_once( "./common/license/error_description_list_arr.inc.php" );
require_once( "./common/license/class_ionoLicenseHandler.php" );
require_once( "./common/classes/class_Parser.lib.php" );
require_once( "./common/classes/swiftmailer/lib/EasySwift.php" );
$CFG['site']['installed_email'] = array( "", "", "" );
$CFG['site']['default_template'] = "outlook";
$page_blocks = $show_block = $san_arr = array( );
$err_msg = "";
$license_written = true;
echo "<?xml version=\"1.0\"?>\r\n"."\n";
echo "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\r\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n<html lang=\"en-US\" dir=\"ltr\" xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"content-type\" content=\"application/xhtml+xml; charset=UTF-8\" />\r\n<meta http-equiv=\"content-Language\" content=\"en-US\" />\r\n<meta name=\"keywords\" content=\"Answers, Questions, Video Answers, Video Que";
echo "stions, Audio Answers, Audio Questions, Blogs, Forums\" />\r\n<meta name=\"description\" content=\"Visual Answers site is the place where you can post your questions of any type (Text, Video and Audio) and get them clarified. You can also reply to the Questions of any type (Text, Video and Audio) in any formats (Text, Video and Audio). You can also share the views through Blogs and Forums\" />\r\n\r\n<link rel";
echo "=\"stylesheet\" type=\"text/css\" href=\"";
echo $CFG['site']['url'];
echo "design/templates/";
echo $CFG['html']['template']['default'];
echo "/root/css/";
echo $CFG['html']['stylesheet']['screen']['default'];
echo "/header.css\" media=\"screen\" title=\"Default\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"";
echo $CFG['site']['url'];
echo "design/templates/";
echo $CFG['html']['template']['default'];
echo "/root/css/";
echo $CFG['html']['stylesheet']['screen']['default'];
echo "/footer.css\" media=\"screen\" title=\"Default\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"";
echo $CFG['site']['url'];
echo "design/templates/";
echo $CFG['html']['template']['default'];
echo "/root/css/";
echo $CFG['html']['stylesheet']['screen']['default'];
echo "/general.css\" media=\"screen\" title=\"Default\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"";
echo $CFG['site']['url'];
echo "design/templates/";
echo $CFG['html']['template']['default'];
echo "/root/css/";
echo $CFG['html']['stylesheet']['screen']['default'];
echo "/common.css\" media=\"screen\" title=\"Default\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"";
echo $CFG['site']['url'];
echo "design/templates/";
echo $CFG['html']['template']['default'];
echo "/root/css/";
echo $CFG['html']['stylesheet']['screen']['default'];
echo "/layout.css\" media=\"screen\" title=\"Default\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"";
echo $CFG['site']['url'];
echo "design/templates/";
echo $CFG['html']['template']['default'];
echo "/root/css/";
echo $CFG['html']['stylesheet']['screen']['default'];
echo "/include.css\" media=\"screen\" title=\"Default\" />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"";
echo $CFG['site']['url'];
echo "design/css/print.css\" media=\"print\" />\r\n<link rel=\"shortcut icon\" href=\"";
echo $CFG['site']['url'];
echo "design/templates/";
echo $CFG['html']['template']['default'];
echo "/favicon.ico\" type=\"image/x-icon\" />\r\n<!-- for link bar -->\r\n<link rel=\"Home\"     href=\"";
echo URL( $CFG['site']['url'] );
echo "\" title=\"Home page\" />\r\n<link rel=\"Index\"    href=\"";
echo URL( $CFG['site']['url'] );
echo "\" title=\"Index\" />\r\n<link rel=\"search\"   href=\"#\" title=\"Search this site\" />\r\n\r\n<link rel=\"contents\" href=\"#\" title=\"Site map\" />\r\n<title>Rayzz</title>\r\n</head>\r\n<body>\r\n<div class=\"clsInstallPage\">\r\n<div id=\"";
echo $CFG['html']['page_id'];
echo "\">\r\n  <div id=\"hideScreen\" style=\"z-index: 100; display: none;\" class=\"VeilStyle1c\">&nbsp;</div>\r\n  <a href=\"#\" id=\"alertHyperLink\"></a>\r\n\r\n  <!-- Accessibility Links -->\r\n  <div id=\"top\">\r\n    <ul>\r\n      <li><a href=\"#main\">Skip to main content</a></li>\r\n      <li><a href=\"#selSubHeader\">Skip to Navigation Links</a></li>\r\n      <li><a href=\"#footer\">Skip to Footer</a></li>\r\n    </ul>\r\n  </div>\r\n  <!-- Header -->\r\n<div";
echo " id=\"header\" class=\"clsHeaderContainer\">\r\n        <div class=\"clsHeaderShadowImage\"><div class=\"clsHeaderBlock\">\r\n            <div class=\"clsMainLogo\">\r\n                <h1>\r\n                    <a href=\"";
echo $CFG['site']['url'];
echo "\"><img src=\"";
echo $CFG['site']['url'];
echo "/design/templates/";
echo $CFG['html']['template']['default'];
echo "/root/images/";
echo $CFG['html']['stylesheet']['screen']['default'];
echo "/header/logo/logo.gif\" alt=\"";
echo $CFG['site']['name'];
echo "\" title=\"";
echo $CFG['site']['name'];
echo "\" /></a>\r\n                </h1>\r\n            </div>\r\n        </div></div>\r\n</div>\r\n\r\n\r\n\r\n\r\n\r\n\r\n";
$CFG['admin']['mailer']['mailer'] = "smtp";
$CFG['admin']['mailer']['host'] = "ssl://smtp.gmail.com";
$CFG['admin']['mailer']['port'] = "465";
$CFG['admin']['mailer']['smtp_encryption'] = false;
$CFG['admin']['mailer']['sendmail_path'] = "/usr/sbin/sendmail -bs";
$CFG['admin']['mailer']['username'] = "";
$CFG['admin']['mailer']['password'] = "";
class installHandler extends FormHandler
{

   

}

$page_blocks = array( "msg_form_error", "form_index", "form_license", "form_write_license", "form_access", "form_access_err", "form_db_setup", "msg_form_success", "form_finished" );
$show_block = array( );
$installObj = new installHandler( );
setallpageblockshide( );
setpageblockshow( "form_index" );
if ( isset( $_POST['submit_req'] ) && $_POST['submit_req'] )
{
    sanitizeforminputs( $_POST );
    setallpageblockshide( );
    setpageblockshow( "form_access" );
}
else if ( isset( $_POST['submit_index'] ) && $_POST['submit_index'] )
{
    sanitizeforminputs( $_POST );
    writeencoderconfig( );
    if ( is_writable( "./common/configs/config_db.inc.php" ) )
    {
        setallpageblockshide( );
        setpageblockshow( "form_db_setup" );
    }
    else
    {
        setallpageblockshide( );
        $err_msg = "Error found! Write permission missing for some files/folders";
        setpageblockshow( "msg_form_error" );
        setpageblockshow( "form_access" );
    }
}
if ( isset( $_POST['submit_db'] ) && $_POST['submit_db'] )
{
    $san_arr = array( );
    sanitizeforminputs( $_POST );
    $sql = "Create database ".$san_arr['dbname'];
    chkisnotempty( "dbname", "Database Name Empty" );
    chkisnotempty( "dbhost", "Host Name Empty" );
    if ( $san_arr['default_sql'] == "Yes" )
    {
        if ( chkisnotempty( "dbuser", "Database User Name Empty" ) && ( $rs = connectdb( ) ) )
        {
            if ( parse_mysql_dump( "./install/rayzz.sql" ) )
            {
                if ( parse_mysql_dump( "./install/config_data_article.sql" ) )
                {
                    if ( parse_mysql_dump( "./install/config_data_blog.sql" ) )
                    {
                        if ( parse_mysql_dump( "./install/config_data_discussions.sql" ) )
                        {
                            if ( parse_mysql_dump( "./install/config_data_music.sql" ) )
                            {
                                if ( parse_mysql_dump( "./install/config_data_photo.sql" ) )
                                {
                                    if ( parse_mysql_dump( "./install/config_data_video.sql" ) )
                                    {
                                        parse_mysql_dump( "./install/rayzz_config_data.sql" );
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    else
    {
        if ( chkisnotempty( "dbuser", "Database User Name Empty" ) && ( $rs = connectdb( ) ) )
        {
            checkdb( );
        }
    }
    chkisnotempty( "default_sql", "Select an option for Execute install.sql" );
    if ( $err_msg == "" )
    {
        setallpageblockshide( );
        writedbconfig( );
        if ( $san_arr['default_sql'] == "Yes" && $CFG['site']['add_default_banner'] )
        {
            insertbannerdetails( );
        }
        setpageblockshow( "form_finished" );
    }
    else
    {
        setallpageblockshide( );
        setpageblockshow( "form_finished" );
        setpageblockshow( "form_db_setup" );
    }
}
else if ( isset( $_POST['submit_lic'] ) && $_POST['submit_lic'] )
{
    sanitizeforminputs( $_POST );
    if ( !strstr( $CFG['site']['host'], "" ) )
    {
        validatelicensekey( );
    }
    if ( $err_msg == "" || strstr( $CFG['site']['host'], "" ) )
    {
        setallpageblockshide( );
        if ( $license_written )
        {
            foreach ( $CFG['site']['installed_email'] as $to_email )
            {
                $installObj->_sendInstallationMail( $to_email, $san_arr['license_key'] );
            }
            setpageblockshow( "form_finished" );
        }
        else
        {
            $err_msg = "Error found! To continue set write permission for \"./common/license/config_license.inc.php\"";
            setpageblockshow( "msg_form_error" );
            setpageblockshow( "form_write_license" );
        }
    }
    else
    {
        foreach ( $CFG['site']['installed_email'] as $to_email )
        {
            $installObj->_sendInstallationMail( $to_email, $san_arr['license_key'], 0 );
        }
        setallpageblockshide( );
        setpageblockshow( "msg_form_error" );
        setpageblockshow( "form_license" );
    }
}
echo "\r\n  <!--SIDEBAR-->\r\n  <div id=\"sideBar\" class=\"clsInstallMainBar\">\r\n    <!--SIDEBAR1-->\r\n    <div class=\"sideBar1\">\r\n<div class=\"clsSideBarMargin\">\r\n<div class=\"lbsidebar\">\r\n<div class=\"rbsidebar\">\r\n<div class=\"bbsidebar\">\r\n<div class=\"blcsidebar\">\r\n<div class=\"brcsidebar\">\r\n<div class=\"tbsidebar\">\r\n<div class=\"tlcsidebar\">\r\n<div class=\"trcsidebar\">\r\n<div class=\"clsSideBarLinks\">\r\n<div class=\"clsSideBar\">\r\n<div>\r";
echo "\n\t\t\t<p class=\"clsSideBarLeftTitle\">Steps</p>\r\n\t\t</div>\r\n \t\t<div class=\"clsSideBarRight\">\r\n  \t\t\t<div class=\"clsSideBarContent\">\r\n  \t\t\t\t<ul>\r\n    \t\t\t\t<li ";
if ( $show_block['form_index'] )
{
    echo "class=\"clsActiveInstallLink\"";
}
echo ">1. Pre-installation Check</li>\r\n    \t\t\t\t<li ";
if ( $show_block['form_access'] )
{
    echo "class=\"clsActiveInstallLink\"";
}
echo ">2. Write permission</li>\r\n    \t\t\t\t<li ";
if ( $show_block['form_db_setup'] )
{
    echo "class=\"clsActiveInstallLink\"";
}
echo ">3. Database</li>\r\n    \t\t\t\t<li ";
if ( $show_block['form_finished'] )
{
    echo "class=\"clsActiveInstallLink\"";
}
echo ">4. License</li>\r\n    \t\t\t\t<li ";
if ( $show_block['form_finished'] )
{
    echo "class=\"clsActiveInstallLink\"";
}
echo ">5. Finish</li>\r\n\t\t\t\t</ul>\r\n\t\t\t</div>\r\n        </div>\r\n\t </div>\r\n   </div>\r\n   </div>\r\n   </div>\r\n   </div>\r\n   </div>\r\n   </div>\r\n   </div>\r\n   </div>\r\n   </div>\r\n   </div>\r\n   </div>\r\n  <!--end of SIDEBAR-->\r\n  <!-- Main -->\r\n\r\n  <div id=\"main\" class=\"clsMain\">\r\n\r\n<div class=\"lbdisplay\">\r\n<div class=\"rbdisplay\">\r\n<div class=\"bbdisplay\">\r\n<div class=\"blcdisplay\">\r\n<div class=\"brcdisplay\">\r\n<div class=\"tbdisplay\">\r\n<div cl";
echo "ass=\"tlcdisplay\">\r\n<div class=\"trcdisplay\">\r\n<div id=\"selLogin\">\r\n<div class=\"clsPageHeading\"><h2>Rayzz Installation</h2></div>\r\n  ";
if ( $show_block['msg_form_error'] )
{
    echo "  <div id=\"selMsgError\">\r\n    <p>";
    echo $err_msg;
    echo "</p>\r\n  </div>\r\n  ";
}
if ( $show_block['msg_form_success'] )
{
    echo "  <div id=\"selMsgSuccess\">\r\n    <p>";
    echo $err_msg;
    echo "</p>\r\n  </div>\r\n  ";
}
if ( $show_block['form_finished'] )
{
    echo "  <div class=\"clsInstallSuccess\">\r\n\t<p class=\"clsCongratulations\">Congratulations! Rayzz installed successfully By Haking Br<br />Parabéns! Rayzz instalado com êxito Por Haking Br!!!</p>\r\n\t<div class=\"clsNote\">";
    echo "<s";
    echo "pan>Note:</span>\r\n\t<ul class=\"clsInstallNote\">\r\n\t\t<li>To enable ReCaptcha, follow the steps as in the ReCaptcha.doc in the install folder.</li>\r\n\t\t<li>To configure google map for photos, please follow the steps as in the Google Map API Key Value.doc in the install folder.</li>\r\n\t\t<li>To install Mugshot player please click the link <a target=\"_blank\" href=\"";
    echo $CFG['site']['url']."admin/photo/flashLicense.php?action=install&prod_id=114";
    echo "\"> Install Mugshot.</a>( or Go to admin panel and select Photos/Photo Settings/Install Mugshot menu )</li>\r\n\t</ul>\r\n\t</div>\r\n\r\n\t<div class=\"clsNote\">";
    echo "<s";
    echo "pan>Admin details:</span>\r\n\t<ul class=\"clsInstallNote\">\r\n\t\t<li>Username: webmaster</li>\r\n\t\t<li>Password: webmaster</li>\r\n\t</ul>\r\n\t</div>\r\n\t<p class=\"clsDeleteFile\">";
    echo "<s";
    echo "pan>PLEASE REMEMBER TO DELETE THE \"install.php\" FILE.</span></p>\r\n\t<h2><a href=\"";
    echo $CFG['site']['url']."index.php";
    echo "\">Go to the Site</a></h2>\r\n\t<br />\r\n  </div>\r\n  ";
}
echo "  <div class=\"clsLoginSignup\">\r\n    ";
if ( $show_block['form_index'] )
{
    echo "   <h3>Step 1: Pre-installation Check</h3>\r\n\r\n\t\t<div class=\"clsDataTable\"><table>\r\n\t\t<tr><th>Rayzz Requirements</th></tr>\r\n\r\n\t\t\t<tr><td>If any of these items are not supported (marked as No), your system does not meet the minimum requirements for installation. Please take appropriate actions to correct the errors. Failure to do so could lead to your Rayzz! installation not functioning properly.</td></tr>\r\n   ";
    echo "         </table></div>\r\n        <div class=\"clsDataTable\">\r\n            <table>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<th>Requirements</th>\r\n\t\t\t\t\t<th>You have</th>\r\n\t\t\t\t\t<th>Status</th>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>PHP ver 5</td>\r\n\t\t\t\t\t<td><p ";
    $phpversion = phpversion( );
    if ( ( integer )$phpversion < 5 )
    {
        echo "class=\"clsRequirementsNotOK\"";
    }
    else
    {
        echo "class=\"clsRequirementsOK\"";
    }
    echo ">PHP ver ";
    echo $phpversion;
    echo "</p></td>\r\n\t\t\t\t\t<td>\r\n";
    if ( ( integer )$phpversion < 5 )
    {
        echo "<span class=\"clsRequirementsNotOK\">Error</span>";
        $err_msg = "Error found! Rayzz requirement missing.";
    }
    else
    {
        echo "<span class=\"clsRequirementsOK\">Ok</span>";
    }
    echo "\t\t\t\t\t</td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>GD</td>\r\n\t\t\t\t\t<td>\r\n";
    if ( function_exists( "imagecreatetruecolor" ) )
    {
        echo "<span class=\"clsRequirementsOK\">GD2</span>";
    }
    else if ( function_exists( "imagecreate" ) )
    {
        echo "<span class=\"clsRequirementsOK\">GD</span>";
    }
    else
    {
        echo "<span class=\"clsRequirementsNotOK\">Not installed</span>";
        $gd_err = "Error";
    }
    echo "\t\t\t\t\t</td>\r\n\t\t\t\t\t<td>\r\n";
    if ( isset( $gd_err ) && $gd_err != "" )
    {
        echo "<span class=\"clsRequirementsNotOK\">Error</span>";
        $err_msg = "Error found! Rayzz requirement missing.";
    }
    else
    {
        echo "<span class=\"clsRequirementsOK\">Ok</span>";
    }
    echo "\t\t\t\t\t</td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>CURL</td>\r\n\t\t\t\t\t<td>\r\n";
    if ( function_exists( "curl_init" ) )
    {
        echo "<span class=\"clsRequirementsOK\">CURL</span>";
    }
    else
    {
        echo "<span class=\"clsRequirementsNotOK\">Not installed</span>";
        $curl_err = "Error";
    }
    echo "\t\t\t\t\t</td>\r\n\t\t\t\t\t<td>\r\n";
    if ( isset( $curl_err ) && $curl_err != "" )
    {
        echo "<span class=\"clsRequirementsNotOK\">Error</span>";
        $err_msg = "Error found! Rayzz requirement missing.";
    }
    else
    {
        echo "<span class=\"clsRequirementsOK\">Ok</span>";
    }
    echo "\t\t\t\t\t</td>\r\n\t\t\t\t</tr>\r\n\t\t\t</table>\r\n            </div>\r\n        <div class=\"clsDataTable\">\r\n            <table>\r\n\t\t\t<tr><th>Recommended Settings</th></tr>\r\n\t\t\t<tr><td>These are the recommended settings for PHP in order to ensure full compatibility with Rayzz!.</td></tr>\r\n\t\t\t</table>\r\n        </div>\r\n\t\t<div class=\"clsDataTable\"><table>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<th>Settings</th>\r\n\t\t\t\t\t<th>Recommended</th>\r\n\t\t\t\t\t<th>You have</th>\r\n\t\t";
    echo "\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>safe_mode</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">Off</span></td>\r\n\t\t\t\t\t<td>";
    if ( ini_get( "safe_mode" ) )
    {
        echo "<span class=\"clsRequirementsNotOK\">On</span>";
    }
    else
    {
        echo "<span class=\"clsRequirementsOK\">Off</span>";
    }
    echo "</td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>register_globals</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">Off</span></td>\r\n\t\t\t\t\t<td>";
    if ( ini_get( "register_globals" ) )
    {
        echo "<span class=\"clsRequirementsNotOK\">On</span>";
    }
    else
    {
        echo "<span class=\"clsRequirementsOK\">Off</span>";
    }
    echo "</td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>open_basedir</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">Off</span></td>\r\n\t\t\t\t\t<td>";
    if ( ini_get( "open_basedir" ) )
    {
        echo "<span class=\"clsRequirementsNotOK\">On</span>";
    }
    else
    {
        echo "<span class=\"clsRequirementsOK\">Off</span>";
    }
    echo "</td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>output_buffering</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">On</span></td>\r\n\t\t\t\t\t<td>";
    if ( ini_get( "output_buffering" ) )
    {
        echo "<span class=\"clsRequirementsOK\">On</span>";
    }
    else
    {
        echo "<span class=\"clsRequirementsNotOK\">Off</span>";
    }
    echo "</td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>file_uploads</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">On</span></td>\r\n\t\t\t\t\t<td>";
    if ( ini_get( "file_uploads" ) )
    {
        echo "<span class=\"clsRequirementsOK\">On</span>";
    }
    else
    {
        echo "<span class=\"clsRequirementsNotOK\">Off</span>";
    }
    echo "</td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>upload_max_filesize</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">";
    $avail_upload_size = substr( ini_get( "upload_max_filesize" ), 0, 0 - 1 );
    echo $req_upload_size = 200;
    echo "M (or more)</span></td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan ";
    if ( $req_upload_size <= $avail_upload_size )
    {
        echo "class=\"clsRequirementsOK\">";
    }
    else
    {
        echo "class=\"clsRequirementsNotOK\">";
    }
    echo $avail_upload_size;
    echo "M</span></td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>post_max_size</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">";
    $avail_post_size = substr( ini_get( "post_max_size" ), 0, 0 - 1 );
    echo $req_post_size = 200;
    echo "M (or more)</span></td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan ";
    if ( $req_post_size <= $avail_post_size )
    {
        echo "class=\"clsRequirementsOK\">";
    }
    else
    {
        echo "class=\"clsRequirementsNotOK\">";
    }
    echo $avail_post_size;
    echo "M</span></td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>max_execution_time</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">";
    $avail_req_exec_time = ini_get( "max_execution_time" );
    echo $req_max_exec_time = "0";
    echo "</span></td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan ";
    if ( $avail_req_exec_time == $req_max_exec_time )
    {
        echo "class=\"clsRequirementsOK\">";
    }
    else
    {
        echo "class=\"clsRequirementsNotOK\">";
    }
    echo $avail_req_exec_time;
    echo "</span></td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>magic_gpc_quotes</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">Off</span></td>\r\n\t\t\t\t\t<td>";
    if ( ini_get( "magic_quotes_gpc" ) )
    {
        echo "<span class=\"clsRequirementsNotOK\">On</span>";
    }
    else
    {
        echo "<span class=\"clsRequirementsOK\">Off</span>";
    }
    echo "</td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>memory_limit</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">";
    $avail_memory_limit = substr( ini_get( "memory_limit" ), 0, 0 - 1 );
    echo $req_memory_limit = 32;
    echo "M (or more)</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan ";
    if ( $req_memory_limit <= $avail_memory_limit )
    {
        echo "class=\"clsRequirementsOK\">";
    }
    else
    {
        echo "class=\"clsRequirementsNotOK\">";
    }
    echo $avail_memory_limit;
    echo "M</span></td>\r\n\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>display_errors</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">On</span></td>\r\n\t\t\t\t\t<td>";
    if ( ini_get( "display_errors" ) )
    {
        echo "<span class=\"clsRequirementsOK\">On</span>";
    }
    else
    {
        echo "<span class=\"clsRequirementsNotOK\">Off</span>";
    }
    echo "</td>\r\n\t\t\t\t</tr>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<td>session.gc_maxlifetime</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan class=\"clsRequirementsOK\">";
    $avail_session_gc_max = ini_get( "session.gc_maxlifetime" );
    echo $req_session_gc_max = "14000";
    echo " (or more)</td>\r\n\t\t\t\t\t<td>";
    echo "<s";
    echo "pan ";
    if ( $req_session_gc_max <= $avail_session_gc_max )
    {
        echo "class=\"clsRequirementsOK\">";
    }
    else
    {
        echo "class=\"clsRequirementsNotOK\">";
    }
    echo $avail_session_gc_max;
    echo "</span></td>\r\n\r\n\t\t\t\t</tr>\r\n\t\t\t</table></div>\r\n\r\n\t\t</div>\r\n";
    if ( $err_msg == "" )
    {
        echo "\t\t<table>\r\n<tr><td><form name=\"form_index\" id=\"selFormIndex\" method=\"post\" action=\"";
        echo $_SERVER['PHP_SELF'];
        echo "\">\r\n\t\t\t<div class=\"clsListSubmitLeft\"><div class=\"clsListSubmitRight\"><input type=\"submit\" class=\"clsSubmitButton\" name=\"submit_req\" id=\"submit_req\" value=\"Next\" /></div></div>\r\n\t\t</form></td></tr>\r\n</table>\r\n";
    }
    else
    {
        setstepserrormsg( $err_msg, "submit" );
    }
    echo "    </div>\r\n";
}
if ( $show_block['form_access'] )
{
    echo "\t<div>\r\n\t\t<div class=\"clsDataTable\">\r\n\t\t\t<table>\r\n\t\t\t\t<tr><th><h3>Step 2: Write permission</h3></th></tr>\r\n\t\t\t\t<tr><td>Following files/folders and sub-folders needs to set to be 777</td></tr>\r\n\t\t\t</table>\r\n\t\t\t<table>\r\n\t\t\t\t<tr>\r\n\t\t\t\t\t<th>Name</th><th>File/Folder</th><th>Status</th>\r\n\t\t\t\t</tr>\r\n";
    chkiswritableall( "./common/configs/", true );
    chkiswritableall( "./common/license/config_license.inc.php" );
    chkiswritableall( "./files/" );
    chkiswritableall( "./files/autocompletexml/", true );
    chkiswritableall( "./files/watermark/wmark.srt", true );
    chkiswritableall( "./files/config_log/" );
    chkiswritableall( "./tools/importer/" );
    chkiswritableall( "./tools/importer/upload" );
    chkiswritableall( "./tools/OpenInviter/" );
    chkiswritableall( "./tools/OpenInviter/upload" );
    chkiswritableall( "./languages/", true );
    chkiswritableall( "./design/templates/default/admin/templates_c" );
    chkiswritableall( "./design/templates/default/admin/video/templates_c" );
    chkiswritableall( "./design/templates/default/admin/music/templates_c" );
    chkiswritableall( "./design/templates/default/admin/photo/templates_c" );
    chkiswritableall( "./design/templates/default/admin/discussions/templates_c" );
    chkiswritableall( "./design/templates/default/admin/blog/templates_c" );
    chkiswritableall( "./design/templates/default/admin/article/templates_c" );
    chkiswritableall( "./design/templates/".$CFG['site']['default_template']."/root/templates_c" );
    chkiswritableall( "./video/design/templates/".$CFG['site']['default_template']."/root/templates_c" );
    chkiswritableall( "./video/design/templates/".$CFG['site']['default_template']."/members/templates_c" );
    chkiswritableall( "./music/design/templates/".$CFG['site']['default_template']."/root/templates_c" );
    chkiswritableall( "./music/design/templates/".$CFG['site']['default_template']."/members/templates_c" );
    chkiswritableall( "./photo/design/templates/".$CFG['site']['default_template']."/root/templates_c" );
    chkiswritableall( "./photo/design/templates/".$CFG['site']['default_template']."/members/templates_c" );
    chkiswritableall( "./discussions/design/templates/".$CFG['site']['default_template']."/root/templates_c" );
    chkiswritableall( "./discussions/design/templates/".$CFG['site']['default_template']."/members/templates_c" );
    chkiswritableall( "./blog/design/templates/".$CFG['site']['default_template']."/root/templates_c" );
    chkiswritableall( "./blog/design/templates/".$CFG['site']['default_template']."/members/templates_c" );
    chkiswritableall( "./article/design/templates/".$CFG['site']['default_template']."/root/templates_c" );
    chkiswritableall( "./article/design/templates/".$CFG['site']['default_template']."/members/templates_c" );
    echo "\t\t\t</table>\r\n\t\t</div>\r\n\r\n        ";
    if ( $err_msg == "" )
    {
        echo "\t<table>\r\n\t\t<tr>\r\n        \t<td>\r\n\r\n\t\t<form name=\"form_index\" id=\"selFormIndex\" method=\"post\" action=\"";
        echo $_SERVER['PHP_SELF'];
        echo "\">\r\n\t\t\t<div class=\"clsListSubmitLeft\"><div class=\"clsListSubmitRight\"><input type=\"submit\" class=\"clsSubmitButton\" name=\"submit_index\" id=\"submit_index\" value=\"Next\" /></div></div>\r\n\t\t</form>\r\n        \t</td>\r\n        </tr>\r\n\t</table>\r\n     ";
    }
    else
    {
        setstepserrormsg( $err_msg, "submit_req" );
    }
    echo "\t</div>\r\n";
}
if ( $show_block['form_access_err'] )
{
    echo "    <div>\r\n      <h2>Step 2: Write permission</h2>\r\n      <form name=\"form_index\" id=\"selFormIndex\" method=\"post\" action=\"";
    echo $_SERVER['PHP_SELF'];
    echo "\">\r\n\t\t<div>\r\n\t\t\t<ul>\r\n\t\t\t";
    echo $loginfrm->file_err_msg;
    echo "\t\t\t</ul>\r\n\t\t</div>\r\n\t\t<div class=\"clsOverflow\">\r\n\t\t\t<div class=\"clsListSubmitLeft\"><div class=\"clsListSubmitRight\"><input type=\"submit\" class=\"clsSubmitButton\" name=\"submit_index\" id=\"submit_index\" value=\"Next\" /></div></div>\r\n\t\t</div>\r\n\t  </form>\r\n\r\n    </div>\r\n    ";
}
if ( $show_block['form_db_setup'] )
{
    echo "    <div>\r\n     <div class=\"clsDataTable\"><table>\r\n<tr><th><h3>Step 3: Database Setup</h3></th></tr>\r\n</table></div>\r\n";
    if ( isset( $show_block['msg_error'] ) && $show_block['msg_error'] )
    {
        echo "\t\t\t  <div class=\"clsInstallRequiredFields\">\r\n\t\t\t    \t<ul>\r\n\t\t\t\t\t\t";
        echo $err_msg;
        echo "\t\t\t\t\t</ul>\r\n\t\t\t  </div>\r\n";
    }
    echo "      <form name=\"form_dbSetup\" id=\"selFormdbSetup\" method=\"post\" action=\"";
    echo $_SERVER['PHP_SELF'];
    echo "\" autocomplete=\"off\">\r\n\t\t<div class=\"clsDataTable\"><table>\r\n\t\t\t<tr>\r\n\t\t\t\t<td class=\"form_label_cell_default\"><label for=\"dbhost\">";
    echo "Database Host";
    echo "</label></td>\r\n\t\t\t\t<td class=\"form_field_cell_default\"><input type=\"text\" class=\"clsTextBox\" name=\"dbhost\" id=\"dbhost\" tabindex=\"1000\" value=\"";
    if ( getformfield( "dbhost" ) != "" )
    {
        echo getformfield( "dbhost" );
    }
    else
    {
        echo $CFG['db']['hostname'];
    }
    echo "\" /></td>\r\n\t\t\t</tr>\r\n\t\t\t<tr>\r\n\t\t\t\t<td class=\"form_label_cell_default\"><label for=\"dbuser\">";
    echo "Database User name";
    echo "</label></td>\r\n\t\t\t\t<td class=\"form_field_cell_default\"><input type=\"text\" class=\"clsTextBox\" name=\"dbuser\" id=\"dbuser\" tabindex=\"1005\" value=\"";
    if ( getformfield( "dbuser" ) != "" )
    {
        echo getformfield( "dbuser" );
    }
    else
    {
        echo $CFG['db']['username'];
    }
    echo "\" /></td>\r\n\t\t\t</tr>\r\n\t\t\t<tr>\r\n\t\t\t\t<td class=\"form_label_cell_default\"><label for=\"dbpass\">";
    echo "Database Password";
    echo "</label></td>\r\n\t\t\t\t<td class=\"form_field_cell_default\"><input type=\"text\" class=\"clsTextBox\" name=\"dbpass\" id=\"dbpass\" tabindex=\"1010\" value=\"";
    if ( getformfield( "dbpass" ) != "" )
    {
        echo getformfield( "dbpass" );
    }
    else
    {
        echo $CFG['db']['password'];
    }
    echo "\" /></td>\r\n\t\t\t</tr>\r\n\t\t\t<tr>\r\n\t\t\t\t<td class=\"form_label_cell_default\"><label for=\"dbname\">";
    echo "Database name";
    echo "</label></td>\r\n\t\t\t\t<td class=\"form_field_cell_default\"><input type=\"text\" class=\"clsTextBox\" name=\"dbname\" id=\"dbname\" tabindex=\"1015\" value=\"";
    if ( getformfield( "dbname" ) != "" )
    {
        echo getformfield( "dbname" );
    }
    else
    {
        echo $CFG['db']['name'];
    }
    echo "\" /></td>\r\n\t\t\t</tr>\r\n\t\t\t<tr>\r\n\t\t\t\t<td class=\"form_label_cell_default\"><label for=\"default_sql\">";
    echo "Execute install.sql";
    echo "</label></td>\r\n\t\t\t\t<td class=\"form_field_cell_default\">\r\n\t\t\t\t\t";
    echo "<s";
    echo "elect name=\"default_sql\" id=\"default_sql\" tabindex=\"1020\">\r\n\t\t\t\t\t <option value=\"\"";
    if ( getformfield( "default_sql" ) == "" )
    {
        echo " selected=\"selected\" ";
    }
    echo ">-Choose-</option>\r\n\t\t\t\t\t <option value=\"Yes\"";
    if ( getformfield( "default_sql" ) == "Yes" )
    {
        echo " selected=\"selected\" ";
    }
    echo ">Yes</option>\r\n\t\t\t\t\t<option value=\"No\"";
    if ( getformfield( "default_sql" ) == "No" )
    {
        echo " selected=\"selected\" ";
    }
    echo ">&nbsp;No</option>\r\n\t\t\t\t\t</select>\r\n\t\t\t\t</td>\r\n\t\t\t</tr>\r\n\r\n\t\t</table></div>\r\n\t\t<div>\r\n\t\t\t<table>\r\n<tr><td><div class=\"clsListSubmitLeft\"><div class=\"clsListSubmitRight\"><input type=\"submit\" class=\"clsSubmitButton\" name=\"submit_db\" id=\"submit_db\" value=\"Next\" /></div></div></td></tr>\r\n</table>\r\n\t\t</div>\r\n\t  </form>\r\n\r\n    </div>\r\n    ";
}
if ( $show_block['form_license'] )
{
    echo "\t<div class=\"clsDataTable\">\r\n\t\t<table>\r\n<tr><th><h3>Step 4: License</h3></th></tr>\r\n\t\t<form name=\"form_index\" id=\"selFormIndex\" method=\"post\" action=\"";
    echo $_SERVER['PHP_SELF'];
    echo "\" autocomplete=\"off\">\r\n        <tr>\r\n        <td>\r\n\t\t\t<input class=\"clsLisenceTextBox\" type=\"text\" name=\"license_key\" id=\"license_key\" value=\"Nulled Por Haking Br\" onclick=\"javascript:if(this.value=='Nulled Por Haking Br') this.value=''\" onblur=\"javascript:if(this.value=='')this.value='Nulled Por Haking Br'\" />\r\n        </td>\r\n       </tr>\r\n       <tr>\r\n\t\t<td>\r\n           <div class=\"";
    echo "clsListSubmitLeft\"><div class=\"clsListSubmitRight\"><input type=\"submit\" name=\"submit_lic\" id=\"submit_lic\" value=\"Next\" /></div></div>\r\n\t\t</td>\r\n        </tr>\r\n        </form>\r\n</table>\r\n\t</div>\r\n";
}
if ( $show_block['form_write_license'] )
{
    echo "\t<div class=\"clsOverflow\">\r\n\t\t<h3>Write permission</h3>\r\n\t\t<form name=\"form_index\" id=\"selFormIndex\" method=\"post\" action=\"";
    echo $_SERVER['PHP_SELF'];
    echo "\" autocomplete=\"off\">\r\n\t\t\t<input type=\"hidden\" name=\"license_key\" id=\"license_key\" value=\"";
    echo $san_arr['license_key'];
    echo "\" />\r\n\t\t\t<div class=\"clsListSubmitLeft\"><div class=\"clsListSubmitRight\"><input type=\"submit\" name=\"submit_lic\" id=\"submit_lic\" value=\"Next\" /></div></div>\r\n\t\t</form>\r\n\t</div>\r\n";
}
echo "\r\n\t</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n  </div>\r\n\r\n  <!-- Footer -->\r\n\r\n</div>\r\n<div id=\"footer\">\r\n\t<div class=\"clsFooterMidddleBG\">\r\n        <div class=\"clsFooterContentBG\">\r\n            <div class=\"clsFooterCenterBg\">\r\n                <div class=\"clsFooterRightBG\">\r\n                    <div class=\"clsFooterLeftBG\">\r\n                        <div class=\"clsFooterContent\">\r\n";
echo "                            <div class=\"clsCopyrightContent\">\r\n                                ";
echo "<s";
echo "pan class=\"clsCopyrightLogo\">&copy; ";
echo $CFG['admin']['coppy_rights_year']." ".$CFG['site']['name'].". All rights reserved.";
echo "</span>\r\n                                ";
echo "<s";
echo "pan class=\"clsPoweredText\">Powered By Nulled Haking Br <a href=\"";
echo $CFG['dev']['url'];
echo "\">";
echo $CFG['dev']['name'];
echo "</a></span>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n  </div>\r\n</body>\r\n</html>\r\n";
?>
