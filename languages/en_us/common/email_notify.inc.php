<?php
/**
 * Language file to handle email templates
 *
 * This file has the email messages necessary for mail sending for various
 * pages. The admin can change the email template values from the admin interface.
 *
 * PHP version 5.0
 *
 * @category	###Framework###
 * @package		###Common/Email_templates###
 * @author 		selvaraj_47ag04
 * @copyright 	Copyright (c) 2008 {@link http://www.agriya.com Agriya Infoway}
 * @license		http://www.agriya.com Agriya Infoway Licence
 * @version		SVN: $Id: email_notify.inc.php 138 2008-03-31 07:43:22Z selvaraj_47ag04 $
 * @since 		2008-04-02
 */
/**
 * @var string Registration Activation Code Subject
 * @cfg_label Subject
 * @cfg_key activation_subject
 * @cfg_sub_head Registration Activation Code <ul><li>VAR_USER_NAME</li><li>VAR_ACTIVATION_LINK</li><li>VAR_LINK</li></ul>
 * @cfg_sec_name Allowed common variables inside the template subject and content <ul><li>VAR_SITE_NAME</li><li>VAR_SITE_URL</li><li>VAR_SITE_HOST</li></ul>
 * @cfg_section general
 */
$LANG['activation_subject'] = 'Your activation code';
/**
 * @var string Registration Activation Code Content
 * @cfg_label Content
 * @cfg_key activation_message
 */
$LANG['activation_message'] = 'Dear VAR_USER_NAME ,

Your account is almost ready.

Please click the link below to confirm your email address and activate your account.
VAR_ACTIVATION_LINK

To learn more, please visit  VAR_LINK

Regards,
VAR_SITE_NAME';
/**
 * @var string welcome email subject
 * @cfg_label Subject
 * @cfg_sub_head Welcome email <ul><li>VAR_USER_NAME</li></ul>
 * @cfg_key welcome_email_subject
 */
$LANG['welcome_email_subject'] = 'Welcome VAR_SITE_NAME';
/**
 * @var string welcome email content
 * @cfg_label Content
 * @cfg_key welcome_email_content
 */
$LANG['welcome_email_content'] = 'Dear VAR_USER_NAME ,

welcome to the VAR_SITE_NAME ,

visit url: VAR_SITE_URL

by
VAR_SITE_NAME';
/**
 * @#var string This is used in groupInvite.php. This is used while sending invitation to join group for internal messages
 * @#cfg_label Subject
 * @#cfg_sub_head Sending invitation to join group for internal messages <ul><li>VAR_GROUP_NAME</li><li>VAR_FRIEND_NAME</li><li>VAR_USER_NAME</li><li>VAR_ACCEPTANCE_FORM</li><li>VAR_ADMIN_NAME</li></ul>
 * @#cfg_key mail_group_invite_member_subject
 */
$LANG['mail_group_invite_member_subject'] = 'Invitation to Join group  VAR_GROUP_NAME ';
/**
 * @#var string This is used in groupInvite.php. This is used while sending invitation to join group for internal messages
 * @#cfg_label Content
 * @#cfg_key mail_group_invite_member_message
 */
$LANG['mail_group_invite_member_message'] = 'Dear VAR_FRIEND_NAME ,

VAR_USER_NAME invites you to join VAR_GROUP_NAME .

VAR_ACCEPTANCE_FORM

Regards,
VAR_ADMIN_NAME ';
/**
 * @var string New mail received
 * @cfg_label Subject
 * @cfg_sub_head New mail received <ul><li>VAR_RECEIVER_NAME</li><li>VAR_SENDER_NAME</li><li>VAR_MAIL_LINK</li></ul>
 * @cfg_key new_mail_received_subject
 */
$LANG['new_mail_received_subject'] = 'New mail received - VAR_SITE_NAME';
/**
 * @var string New mail received
 * @cfg_label Content
 * @cfg_key new_mail_received_content
 */
$LANG['new_mail_received_content'] = 'Dear VAR_RECEIVER_NAME ,

You have received a mail from VAR_SENDER_NAME ,

VAR_MAIL_LINK

To learn more, please visit VAR_SITE_URL
Regards,
VAR_SITE_NAME';
/**
 * @var string This is used on mailInboxRead.php.This is used while send notification mail
 * @cfg_label Subject
 * @cfg_sub_head Send notification mail <ul><li>VAR_NAME</li><li>VAR_DATETIME</li></ul>
 * @cfg_key mail_opened_notify_subject
 */
$LANG['mail_opened_notify_subject'] = 'Message Notification for';
/**
 * @var string This is used on mailInboxRead.php. This is used while send notification mail
 * @cfg_label Content
 * @cfg_key mail_opened_notify_message
 */
$LANG['mail_opened_notify_message'] = 'Message Notification:

Your mail message to VAR_NAME has been opened on VAR_DATETIME';
/**
 * @var string Friends request subject
 * @cfg_label Subject
 * @cfg_sub_head Friends request <ul><li>VAR_FRIEND_NAME</li><li>VAR_USER_NAME</li><li>VAR_BE_FRIEND_URL</li></ul>
 * @cfg_key friend_request_subject
 */
$LANG['friend_request_subject'] = 'Friends request from VAR_SITE_NAME';
/**
 * @var string Friends request content
 * @cfg_label Content
 * @cfg_key friend_request_content
 */
$LANG['friend_request_content'] = 'Hi VAR_FRIEND_NAME ,

VAR_USER_NAME would like to join in your friends circle, click the below link to accept/reject the request.

VAR_BE_FRIEND_URL

To learn more, please visit VAR_SITE_URL
Regards,
VAR_SITE_NAME';
/**
 * @var string Reject Friends
 * @cfg_label Subject
 * @cfg_sub_head Declined to join in your Friends Circle <ul><li>VAR_USER_NAME</li><li>VAR_FRIEND_NAME</li><li>VAR_USER_PROFILE_LINK</li></ul>
 * @cfg_key decline_friend_subject
 */
$LANG['decline_friend_subject'] = 'VAR_USER_NAME  - declined to join in your Friends Circle';
/**
 * @var string Reject Friends
 * @cfg_label Content
 * @cfg_key decline_friend_content
 */
$LANG['decline_friend_content'] = 'Dear VAR_FRIEND_NAME ,
VAR_USER_NAME declined to join in your Friends Circle.
VAR_USER_PROFILE_LINK';
/**
 * @var string Login Reactivation Code Subject
 * @cfg_label Subject
 * @cfg_sub_head Login Reactivation Code <ul><li>VAR_USER_NAME</li><li>VAR_ACTIVATION_LINK</li><li>VAR_LINK</li></ul>
 * @cfg_key reactivation_login_subject
 */
$LANG['reactivation_login_subject'] = 'Your activation code';
/**
 * @var string Login Reactivation Code Content
 * @cfg_label Content
 * @cfg_key reactivation_login_message
 */
$LANG['reactivation_login_message'] = 'Dear VAR_USER_NAME ,

Your activation code. Please click the following link to activate:
VAR_ACTIVATION_LINK

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME';
/**
 * @var string Forgot Password Reactivation Code Subject
 * @cfg_label Subject
 * @cfg_sub_head Forgot Password Reactivation Code <ul><li>VAR_USER_NAME</li><li>VAR_ACTIVATION_LINK</li><li>VAR_LINK</li></ul>
 * @cfg_key reactivation_forgotpass_subject
 */
$LANG['reactivation_forgotpass_subject'] = 'Your activation code';
/**
 * @var string Forgot Password Reactivation Code Content
 * @cfg_label Content
 * @cfg_key reactivation_forgotpass_message
 */
$LANG['reactivation_forgotpass_message'] = 'Dear VAR_USER_NAME ,

Your activation code. Please click the following link to activate:
VAR_ACTIVATION_LINK

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME';
/**
 * @var string Forgot Password Code Subject
 * @cfg_label Subject
 * @cfg_sub_head Forgot Password Code <ul><li>VAR_USER_NAME</li><li>VAR_ACTIVATION_LINK</li><li>VAR_LINK</li></ul>
 * @cfg_key forgot_subject
 */
$LANG['forgot_subject'] = 'Forgot Password code';
/**
 * @var string Forgot Password Code Content
 * @cfg_label Content
 * @cfg_key forgot_message
 */
$LANG['forgot_message'] = 'Dear VAR_USER_NAME ,

Account username: VAR_USER_NAME

Please click on the following link to reset your password

You will be asked to provide your username and the new password.

VAR_ACTIVATION_LINK

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME';
/**
 * @var string Invite Friends
 * @cfg_label Subject
 * @cfg_sub_head Request to Join in your Friends Circle <ul><li>VAR_FRIEND_NAME</li><li>VAR_USER_NAME</li><li>VAR_USER_MESSAGE</li><li>VAR_ACCEPTANCE_FORM</li><li>VAR_FRIEND_PROFILE_LINK</li></ul>
 * @cfg_key request_friend_subject
 */
$LANG['request_friend_subject'] = 'VAR_FRIEND_NAME - Request to Join in your Friends Circle';
/**
 * @var string Invite Friends
 * @cfg_label Content
 * @cfg_key request_friend_content
 */
$LANG['request_friend_content'] = 'Dear VAR_USER_NAME,
I would like to join in your friends Circle.

VAR_USER_MESSAGE

Please accept my request.
VAR_ACCEPTANCE_FORM

Regards,
VAR_FRIEND_PROFILE_LINK';
/**
 * @var string New friend request received
 * @cfg_label Subject
 * @cfg_sub_head New friend request received <ul><li>VAR_RECEIVER_NAME</li><li>VAR_SENDER_NAME</li><li>VAR_MAIL_LINK</li><li>VAR_LINK</li></ul>
 * @cfg_key new_friend_request_received_subject
 */
$LANG['new_friend_request_received_subject'] = 'New friend request received - VAR_SITE_NAME';
/**
 * @var string New friend request received
 * @cfg_label Content
 * @cfg_key new_friend_request_received_content
 */
$LANG['new_friend_request_received_content'] = 'Dear VAR_RECEIVER_NAME ,
You have received a friend request from VAR_SENDER_NAME ,

VAR_MAIL_LINK

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME';
/**
 * @var string Invite Friends
 * @cfg_label Subject
 * @cfg_sub_head Invite Friends <ul><li>VAR_USER_NAME</li><li>VAR_FRIEND_NAME</li><li>VAR_PERSONAL_MESSAGE</li><li>VAR_LINK</li><li>VAR_BLOCK_LINK</li></ul>
 * @cfg_key invite_friend_subject
 */
$LANG['invite_friend_subject'] = 'VAR_USER_NAME  - Join with me in VAR_SITE_NAME';
/**
 * @var string Invite Friends
 * @cfg_label Content
 * @cfg_key invite_friend_content
 */
$LANG['invite_friend_content'] = 'Dear VAR_FRIEND_NAME ,

I am a member of VAR_SITE_NAME .
And i would love to offer you the same opportunity!

VAR_PERSONAL_MESSAGE

To learn more, please visit VAR_LINK
Regards,
VAR_USER_NAME
VAR_SITE_NAME

You can block VAR_USER_NAME from sending email by visting:
VAR_BLOCK_LINK

You can block all VAR_SITE_NAME users from sending you email by visiting:

VAR_BLOCK_LINK';
/**
 * @var string Default friend added subject
 * @cfg_label Subject
 * @cfg_sub_head Default friend added <ul><li>VAR_USER_NAME</li><li>VAR_FRIEND_NAME</li></ul>
 * @cfg_key default_friend_joined_subject
 */
$LANG['default_friend_joined_subject'] = 'VAR_FRIEND_NAME Welcomes You to VAR_SITE_NAME !';
/**
 * @var string Default friend added
 * @cfg_label Content
 * @cfg_key default_friend_joined_content
 */
$LANG['default_friend_joined_content'] = 'Hi VAR_USER_NAME ,

Welcome to VAR_SITE_NAME , the greatest place to share media and connect with friends!

I\'m VAR_FRIEND_NAME , and I am here to help you with VAR_SITE_NAME and to answer any questions you have. As a new member, automatically I become your friend. If there is anything you need, if you just want to say \'Hi\' or if you have recommendations, send me a message anytime!

<b>How Can I Help Out?</b>
<li>You can check out my circle of friends and add them if you wish.</li>
<li>If you have any difficulties navigating the site, let me know.</li>
<li>Or, if you don\'t need my help, you can delete me as a friend whenever you want.</li>

I\'ll see you on VAR_SITE_NAME !

Regards,
VAR_FRIEND_NAME';
/**
 * @var string Accept Friends
 * @cfg_label Subject
 * @cfg_sub_head Joined in your Friends Circle <ul><li>VAR_USER_NAME</li><li>VAR_FRIEND_NAME</li><li>VAR_USER_PROFILE_LINK</li></ul>
 * @cfg_key accept_friend_subject
 */
$LANG['accept_friend_subject'] = 'VAR_USER_NAME - joined in your Friends Circle';
/**
 * @var string Accept Friends
 * @cfg_label Content
 * @cfg_key accept_friend_content
 */
$LANG['accept_friend_content'] = 'Dear VAR_FRIEND_NAME ,
VAR_USER_NAME Joined in your Friends Circle.
VAR_USER_PROFILE_LINK';
/**
 * @var string New User Welcome Message
 * @cfg_label Subject
 * @cfg_sub_head New User Welcome Message <ul><li>VAR_USER_NAME</li></ul>
 * @cfg_key welcome_message_subject
 */
$LANG['welcome_message_subject'] = 'welcome to VAR_SITE_NAME';
/**
 * @var string New User Welcome Message
 * @cfg_label Content
 * @cfg_key welcome_message_content
 */
$LANG['welcome_message_content'] = 'Dear VAR_USER_NAME ,

welcome to the VAR_SITE_NAME .

Regards,
VAR_SITE_NAME';
/**
 * @#var string Problem in video file
 * @#cfg_label Subject
 * @#cfg_sub_head Problem in video file upload <ul><li>VAR_USER_NAME</li><li>VAR_VIDEO_TITLE</li><li>VAR_LINK</li></ul>
 * @#cfg_key video_invalid_upload_subject
 */
$LANG['video_invalid_upload_subject'] = 'Invalid Uploaded File - VAR_SITE_NAME ';
/**
 * @#var string Problem in video file
 * @#cfg_label Content
 * @#cfg_key video_invalid_upload_content
 */
$LANG['video_invalid_upload_content'] = 'Dear VAR_USER_NAME ,

Sorry, some problem in your uploaded video file( VAR_VIDEO_TITLE ),
so we couldnt activate the file

To learn more, please visit VAR_LINK
Regards,
VAR_SITE_NAME ';
/**
 * @#var string Video file activated
 * @#cfg_label Subject
 * @#cfg_sub_head Video file activated <ul><li>VAR_USER_NAME</li><li>VAR_VIDEO_TITLE</li><li>VAR_VIDEO_LINK</li><li>VAR_LINK</li></ul>
 * @#cfg_key video_activate_subject
 */
$LANG['video_activate_subject'] = 'Video activated - VAR_SITE_NAME ';
/**
 * @#var string Video file activated
 * @#cfg_label Content
 * @#cfg_key video_activate_content
 */
$LANG['video_activate_content'] = 'Dear VAR_USER_NAME ,

Your video file( VAR_VIDEO_TITLE ) activated,

 VAR_VIDEO_LINK

To learn more, please visit VAR_LINK
Regards,
VAR_SITE_NAME ';
/**
 * @var string Registration By Admin Subject
 * @cfg_label Subject
 * @cfg_sub_head Registration By Admin <ul><li>VAR_USER_NAME</li><li>VAR_PASSWORD</li><li>VAR_ACTIVATION_LINK</li><li>VAR_LINK</li></ul>
 * @cfg_key activation_admin_subject
 */
$LANG['activation_admin_subject'] = 'Your activation code';
/**
 * @var string Registration By Admin Content
 * @cfg_label Content
 * @cfg_key activation_admin_message
 */
$LANG['activation_admin_message'] = 'Dear VAR_USER_NAME ,

Your membership created by the site admin.

Information

  User name: VAR_USER_NAME
  Password:  VAR_PASSWORD

Your activation code. Please click the following link to activate:
 VAR_ACTIVATION_LINK

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME';
/**
 * @#var string Membership approve subject
 * @#cfg_label Subject
 * @#cfg_sub_head Membership approve <ul><li>VAR_USER_NAME</li><li>VAR_LINK</li></ul>
 * @#cfg_key membership_welcome_email_subject
 */
$LANG['membership_welcome_email_subject']='Your Membership approved';
/**
 * @#var string Membership approve Content
 * @#cfg_label Content
 * @#cfg_key membership_welcome_email_content
 */
$LANG['membership_welcome_email_content']='Dear VAR_USER_NAME ,

Your membership has been approved, You can now watch the full length video.

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME ';
/**
 * @#var string Report bugs subject
 * @#cfg_label Subject
 * @#cfg_sub_head Report bugs <ul><li>VAR_CATEGORY</li><li>VAR_REPORTER_NAME</li><li>VAR_REPORTER_EMAIL</li><li>VAR_SITE_IP</li><li>VAR_CONTENT</li></ul>
 * @#cfg_key report_bugs_email_subject
 */
$LANG['report_bugs_email_subject'] = 'Report bug - VAR_CATEGORY - VAR_SITE_URL';
/**
 * @#var string report bugs content
 * @#cfg_label Content
 * @#cfg_key report_bugs_email_content
 */
$LANG['report_bugs_email_content'] = 'Hi VAR_SITE_NAME,

Reporter Name: VAR_REPORTER_NAME

Reporter Email: VAR_REPORTER_EMAIL

Site Url: VAR_SITE_URL

IP: VAR_SITE_IP

Bug Category: VAR_CATEGORY

VAR_CONTENT ';
/**
 * @var string Profile Comment Received subject
 * @cfg_label Subject
 * @cfg_sub_head Profile Comment received <ul><li>VAR_USER_NAME</li><li>VAR_FROM_USER_NAME</li><li>VAR_SCRAP</li><li>VAR_PROFILE_LINK</li><li>VAR_LINK</li></ul>
 * @cfg_key profile_comment_received_subject
 */
$LANG['profile_comment_received_subject'] = 'New scrap for you';
/**
 * @var string Profile Comment Received
 * @cfg_label Content
 * @cfg_key profile_comment_received_content
 */
$LANG['profile_comment_received_content'] = 'Dear VAR_USER_NAME ,

You have received a Scrap from VAR_FROM_USER_NAME,

Scrap Message:
	VAR_SCRAP

To read more go to the following link:
 VAR_PROFILE_LINK

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME';
/**
 * @var string Subscription Notification
 * @cfg_label Subject
 * @cfg_sub_head Subscription Notification <ul><li>VAR_SUBSCRIBER</li><li>VAR_CONTENT</li><li>VAR_LINK</li></ul>
 * @cfg_key subscription_notification_subject
 */
$LANG['subscription_notification_subject'] = 'Subscription Updates';
/**
 * @var string Subscription Notification
 * @cfg_label Content
 * @cfg_key subscription_notification_content
 */
$LANG['subscription_notification_content'] = 'Dear VAR_SUBSCRIBER ,

Your subscriptions,

VAR_CONTENT

To learn more, please visit VAR_LINK
Regards,
VAR_SITE_NAME';
/**
 * @var string Friends birthday reminder
 * @cfg_label Subject
 * @cfg_sub_head Friends birthday reminder <ul><li>VAR_BIRTH_PERSION_NAME</li><li>VAR_FRIEND_USER_NAME</li><li>VAR_LINK_BIRTH_PERSION_NAME</li><li>VAR_BIRTHDATE</li></ul>
 * @cfg_key friends_birthday_reminder_subject
 */
$LANG['friends_birthday_reminder_subject'] = 'VAR_BIRTH_PERSION_NAME birthday is close VAR_FRIEND_USER_NAME';
/**
 * @var string Friends birthday reminder
 * @cfg_label Friends Content
 * @cfg_key friends_birthday_reminder_content
 */
$LANG['friends_birthday_reminder_content'] = 'Hi VAR_FRIEND_USER_NAME,

VAR_LINK_BIRTH_PERSION_NAME birthday is on VAR_BIRTHDATE

To learn more, please visit VAR_SITE_URL
Regards,
VAR_SITE_NAME';
/**
 * @var string Friend suggestion
 * @cfg_label Subject
 * @cfg_sub_head Firends suggestion <ul><li>VAR_USER_NAME</li><li>VAR_SUGGESTION_COUNT</li><li>VAR_SUGGESTION_CONTENT</li></ul>
 * @cfg_key friend_suggestion_subject
 */
$LANG['friend_suggestion_subject'] = 'Friends suggestion for you - VAR_SITE_NAME';
/**
 * @var string Firends suggestion
 * @cfg_label Content
 * @cfg_key friend_suggestion_content
 */
$LANG['friend_suggestion_content'] = 'Dear VAR_USER_NAME ,

Your are having VAR_SUGGESTION_COUNT friends suggestion,

VAR_SUGGESTION_CONTENT

To learn more, please visit VAR_SITE_URL
Regards,
VAR_SITE_NAME';
?>