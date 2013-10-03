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
 * @author 		karthiselvam_045at09
 * @copyright 	Copyright (c) 2009 - 2010 {@link http://www.agriya.com Agriya Infoway}
 * @license		http://www.agriya.com Agriya Infoway Licence
 * @version
 * @since 		2009-08-11
 */

/**
 * @var string Music
 * @cfg_label Share playlist subject <ul><li>VAR_USER_NAME</li></ul>
 * @cfg_sec_name Music related Email Templates
 * @cfg_key music_playlist_share_subject
 */
$LANG['music_playlist_share_subject'] = 'VAR_USER_NAME sent you a playlist!';
/**
 * @var string MusicPlaylist
 * @cfg_label Share playlist content <ul><li>VAR_USER_NAME</li><li>VAR_PLAYLIST_NAME</li><li>VAR_MUSIC_PLAYLIST_IMAGE</li><li>VAR_MUSIC_PLAYLIST_DESCRIPTION</li><li>VAR_PERSONAL_MESSAGE</li><li>VAR_LINK</li><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_playlist_share_content
 */
$LANG['music_playlist_share_content'] = 'VAR_USER_NAME wants to share the following playlist with you:
VAR_PLAYLIST_NAME

VAR_PLAYLIST_IMAGE

<b>Playlist Description</b>

VAR_MUSIC_PLAYLIST_DESCRIPTION

<b>Personal Message</b>

VAR_PERSONAL_MESSAGE

To learn more, please visit VAR_LINK

Regards,
VAR_USER_NAME
VAR_SITE_NAME';
/**
 * @var string Audio file activated
 * @cfg_label Audio file activated subject <ul><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_activate_subject
 */
$LANG['music_activate_subject'] = 'Audio activated - VAR_SITE_NAME';
/**
 * @var string Music file activated
 * @cfg_label Music file activated content <ul><li>VAR_USER_NAME</li><li>VAR_MUSIC_TITLE</li><li>VAR_MUSIC_LINK</li><li>VAR_LINK</li><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_activate_content
 */
$LANG['music_activate_content'] = 'Dear VAR_USER_NAME,

Your audio file(VAR_MUSIC_TITLE) is activated,

VAR_MUSIC_LINK

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME';
/**
 * @var string Music
 * @cfg_label Share music subject <ul><li>VAR_USER_NAME</li></ul>
 * @cfg_key music_share_subject
 */
$LANG['music_share_subject'] = 'VAR_USER_NAME sent you a Music!';
/**
 * @var string Music
 * @cfg_label Share Music content <ul></li>VAR_USER_NAME</li><li>VAR_MUSIC_IMAGE</li><li>VAR_MUSIC_DESCRIPTION</li><li>VAR_PERSONAL_MESSAGE</li><li>VAR_LINK</li><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_share_content
 */
$LANG['music_share_content'] = 'VAR_USER_NAME wants to share the following music with you:

VAR_MUSIC_IMAGE

<b>Music Description</b>

VAR_MUSIC_DESCRIPTION

<b>Personal Message</b>

VAR_PERSONAL_MESSAGE

To learn more, please visit VAR_LINK

Regards,
VAR_USER_NAME
VAR_SITE_NAME';
/**
 * @var string Music
 * @cfg_label Flagged music subject <ul><li>VAR_USER_NAME</li><li>VAR_MUSIC_TITLE</li></ul>
 * @cfg_key music_flagged_subject
 */
$LANG['music_flagged_subject'] = 'VAR_USER_NAME flagged this music VAR_MUSIC_TITLE!';
/**
 * @var string Music
 * @cfg_label Flagged music content <ul><li>VAR_USER_NAME</li><li>VAR_MUSIC_IMAGE</li><li>VAR_MUSIC_TITLE</li><li>VAR_MUSIC_DESCRIPTION</li><li>VAR_FLAGGED_TITLE</li><li>VAR_FLAGGED_CONTENT</li><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_flagged_content
 */
$LANG['music_flagged_content'] = '

VAR_MUSIC_IMAGE

<b>Music Title</b>
VAR_MUSIC_TITLE

<b>Music Description</b>

VAR_MUSIC_DESCRIPTION

VAR_FLAGGED_TITLE

VAR_FLAGGED_CONTENT

By,
<b>VAR_USER_NAME</b>
VAR_SITE_NAME
';

/**
 * @var string Deleted Music
 * @cfg_label Deleted your music subject <ul><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_delete_subject
 */
$LANG['music_delete_subject'] = 'Delete your music - VAR_SITE_NAME';
/**
 * @var string Deleted Music
 * @cfg_label Deleted your music content <ul><li>VAR_USER_NAME</li><li>VAR_MUSIC_TITLE</li><li>VAR_LINK</li><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_delete_content
 */
$LANG['music_delete_content'] = 'Dear VAR_USER_NAME,

Sorry, some problem in your music, so we have to delete your music(VAR_MUSIC_TITLE)

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME';

/**
 * @var string Purchased Music
 * @cfg_label Purchased your music subject <ul><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_purchased_subject
 */
$LANG['music_purchased_subject'] = 'Purchased Your Music - VAR_SITE_NAME';
/**
 * @var string Purchased Music
 * @cfg_label Purchased your music content <ul><li>VAR_USER_NAME</li><li>VAR_MUSIC_TITLE</li><li>VAR_MUSIC_LINK</li><li>VAR_LINK</li><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_purchased_content
 */
$LANG['music_purchased_content'] = 'Dear VAR_USER_NAME,
Your Music has been purchased(VAR_MUSIC_TITLE)
VAR_MUSIC_LINK
To learn more, please visit VAR_LINK
Regards,
VAR_SITE_NAME';

/**
 * @var string Purchased Album
 * @cfg_label Purchased your album subject <ul><li>VAR_SITE_NAME</li></ul>
 * @cfg_key album_purchased_subject
 */
$LANG['album_purchased_subject'] = 'Purchased Your Album - VAR_SITE_NAME';
/**
 * @var string Purchased Music
 * @cfg_label Purchased your music content <ul><li>VAR_USER_NAME</li><li>VAR_ALBUM_TITLE</li><li>VAR_ALBUM_LINK</li><li>VAR_LINK</li><li>VAR_SITE_NAME</li></ul>
 * @cfg_key album_purchased_content
 */
$LANG['album_purchased_content'] = 'Dear VAR_USER_NAME,
Your Album has been purchased(VAR_ALBUM_TITLE)
VAR_ALBUM_LINK
To learn more, please visit VAR_LINK
Regards,
VAR_SITE_NAME';

/**
 * @var string Music Comment Received
 * @cfg_label Comment received for Music subject <ul><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_comment_received_subject
 */
$LANG['music_comment_received_subject'] = 'User commented your Music - VAR_SITE_NAME';
/**
 * @var string Music Comment Received
 * @cfg_label Comment received for Music content <ul><li>VAR_USER_NAME</li><li>VAR_USER</li><li>VAR_MUSIC_TITLE</li><li>VAR_COMMENT</li><li>VAR_MUSIC_LINK</li><li>VAR_LINK</li><li>VAR_SITE_NAME</li></ul>
 * @cfg_key music_comment_received_content
 */
$LANG['music_comment_received_content'] = 'Dear VAR_USER_NAME,

VAR_USER commented your music (VAR_MUSIC_TITLE),

Comment:
	VAR_COMMENT

To view more go to the following link:
VAR_MUSIC_LINK

To learn more, please visit VAR_LINK

Regards,
VAR_SITE_NAME';
?>