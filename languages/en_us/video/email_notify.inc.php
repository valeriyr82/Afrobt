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
 * @copyright Copyright (c) 2008 {@link http://www.agriya.com Agriya Infoway}
 * @license		http://www.agriya.com Agriya Infoway Licence
 * @version		SVN: $Id: email_notify.inc.php 138 2008-03-31 07:43:22Z selvaraj_47ag04 $
 * @since 		2008-04-02
 */
/**
 * @var string Problem in video file
 * @cfg_label Problem in video file upload subject -- {site_name}
 * @cfg_sec_name Video related Email Templates
 * @cfg_key video_invalid_upload_subject
 */
$LANG['video_invalid_upload_subject'] = 'Invalid Uploaded File - VAR_SITE_NAME';
/**
 * @var string Problem in video file
 * @cfg_label Problem in video file upload content -- {user_name}{video_title}{link}{site_name}
 * @cfg_key video_invalid_upload_content
 */
$LANG['video_invalid_upload_content'] = 'Dear VAR_USER_NAME,

Sorry, there were some problems in the uploaded video file(VAR_VIDEO_TITLE),
so we couldn\t activate the file

To learn more, please visit VAR_LINK
Regards,
VAR_SITE_NAME';
/**
 * @var string Video file activated
 * @cfg_label Video file activated subject -- {site_name}
 * @cfg_key video_activate_subject
 */
$LANG['video_activate_subject'] = 'Video activated - VAR_SITE_NAME';
/**
 * @var string Video file activated
 * @cfg_label Video file activated content -- {user_name}{video_title}{video_link}{link}{site_name}
 * @cfg_key video_activate_content
 */
$LANG['video_activate_content'] = 'Dear {user_name},

Your video file({video_title}) is activated,

{video_link}

To learn more, please visit {link}
Regards,
{site_name}';
/**
 * @var string Video
 * @cfg_label Share video subject -- {user_name}
 * @cfg_key video_share_subject
 */
$LANG['video_share_subject'] = 'VAR_USER_NAME sent you a video!';
/**
 * @var string Video
 * @cfg_label Share video content -- {user_name}{video_image}{video_description}{personal_message}{link}{user_name}{site_name}
 * @cfg_key video_share_content
 */
$LANG['video_share_content'] = 'VAR_USER_NAME wants to share the following video with you:

VAR_VIDEO_IMAGE

<b>Video Description</b>

VAR_VIDEO_DESCRIPTION

<b>Personal Message</b>

VAR_PERSONAL_MESSAGE

To learn more, please visit VAR_SITE_URL

Regards,
VAR_USER_NAME
VAR_SITE_NAME';
/**
 * @var string Video
 * @cfg_label Flagged video subject -- {user_name}{video_title}
 * @cfg_key video_flagged_subject
 */
$LANG['video_flagged_subject'] = 'VAR_USER_NAME flagged this video VAR_VIDEO_TITLE!';

/**
 * @var string Video
 * @cfg_label Flagged video content -- {user_name}{video_image}{video_title}{video_description}{flagged_title}{flagged_content}{user_name}{site_name}
 * @cfg_key video_flagged_content
 */
$LANG['video_flagged_content'] = '

VAR_VIDEO_IMAGE

<b>Video Title</b>
VAR_VIDEO_TITLE
<b>Video Description</b>

VAR_VIDEO_DESCRITPTION

VAR_FLAGGED_TITLE

VAR_FLAGGED_CONTENT

By,
<b>VAR_USER_NAME</b>
VAR_SITE_NAME
';
/**
 * @var string Video
 * @cfg_label Request for video activation subject -- {user_name}{video_title}
 * @cfg_key video_activate_request_subject
 */
$LANG['video_activate_request_subject'] = 'VAR_USER_NAME wants to activate this video VAR_VIDEO_TITLE!';
/**
 * @var string Video
 * @cfg_label Request for video activation subject -- {user_name}{video_image}{video_title}{video_description}{user_name}{site_name}{video_title_admin_link}
 * @cfg_key video_activate_request_content
 */
$LANG['video_activate_request_content'] = '

<b>Video Title</b>
VAR_VIDEO_TITLE
<b>Video Description</b>

VAR_VIDEO_DESCRIPTION

VAR_USER_NAME want to VAR_VIDEO_TITLE_ADMIN_LINK this video VAR_VIDEO_TITLE

By,
<b>VAR_USER_NAME</b>
VAR_SITE_NAME
';

/**
 * @var string Deleted Video
 * @cfg_label Deleted your video subject -- {site_name}
 * @cfg_key video_delete_subject
 */
$LANG['video_delete_subject'] = 'Delete your video - VAR_SITE_NAME';
/**
 * @var string Deleted Video
 * @cfg_label Deleted your video content -- {user_name}{video_title}{link}{site_name}
 * @cfg_key video_delete_content
 */
$LANG['video_delete_content'] = 'Dear VAR_USER_NAME,

Sorry, some problem in your video, so we have to delete your video(VAR_VIDEO_TITLE)

To learn more, please visit VAR_LINK
Regards,
VAR_SITE_NAME';

/**
 * @var string Video Comment Received
 * @cfg_label Comment received for Video subject -- {site_name}
 * @cfg_key video_comment_received_subject
 */
$LANG['video_comment_received_subject'] = 'User commented your Video - {site_name}';
/**
 * @var string Video Comment Received
 * @cfg_label Comment received for Video content -- {user_name}{video_title}{video_link}{link}{site_name}
 * @cfg_key video_comment_received_content
 */
$LANG['video_comment_received_content'] = 'Dear VAR_USER_NAME,

VAR_USER commented your video (VAR_VIDEO_TITLE),

Comment:
	VAR_COMMENT

To view more go to the following link:
VAR_VIDEO_LINK

To learn more, please visit VAR_LINK
Regards,
VAR_SITE_NAME';

/**
 * @var string Video Response Received
 * @cfg_label Response received for Video subject -- {site_name}
 * @cfg_key video_response_received_subject
 */
$LANG['video_response_received_subject'] = 'User Responded to your Video - VAR_SITE_NAME';
/**
 * @var string Video Response Received
 * @cfg_label Response received for Video content -- {user_name}{video_title}{video_link}{link}{site_name}
 * @cfg_key video_response_received_content
 */
$LANG['video_response_received_content'] = 'Dear VAR_USER_NAME,

VAR_USER responded to your video (VAR_VIDEO_TITLE),

	RESPONDED_VIDEO_IMG  <br />
	RESPONDED_VIDEO_TITLE

To know more go to the following link:
VAR_VIDEO_LINK

To learn more, please visit VAR_LINK
Regards,
VAR_SITE_NAME';


?>