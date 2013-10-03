<?php
header('P3P:CP="IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT"');
/**
 * This file to handle facebook authentication
 *
 * PHP version 5.0
 *
 * @category	Rayzz
 * @package		Members
 */
require_once('./common/functions.php'); //configurations
require_once('./tools/facebook/facebook.php');

$facebook = new Facebook(array(
  'appId'  => '283180601731744',
  'secret' => '0dcab83de37bc5727c90c6bdcdbcb36e',
   'cookie' => true
));

$loginUrl   = $facebook->getLoginUrl(
    array(
        //'scope'         => 'email,offline_access,publish_stream,user_birthday,user_location,user_work_history,user_about_me,user_hometown',
        'redirect_uri'  => 'http://www.afriville.com/fackbookauth.php'
    )
);

//echo $loginUrl;
//exit;
$user = $facebook->getUser();
/*if ($user) {
  try {
    // Proceed knowing you have a logged in user who's authenticated.
    $user_profile = $facebook->api('/me');
    echo "<pre>" . $user_profile . "</pre>";
    exit;
  } catch (FacebookApiException $e) {
    error_log($e);
    $user = null;
  }
}*/
Redirect2URL($loginUrl);
?>