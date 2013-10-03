<?php
/**
 * This file is use for manage lyrics
 *
 * This file is having list lyrics, chagne status, delete and set as main lyrics for show music viewpage.
 *
 *
 * @category	Rayzz/Music
 * @package		member
  * @copyright 	Copyright (c) 2009 - 2010 {@link http://www.agriya.com Agriya Infoway}
 **/
require_once('../common/configs/config.inc.php');
require_once('../common/configs/config_music_fieldsize.inc.php');
$CFG['lang']['include_files'][] = 'languages/%s/music/manageLyrics.php';
$CFG['lang']['include_files'][] = 'languages/%s/music/help.inc.php';
$CFG['mods']['include_files'][] = 'common/classes/class_ListRecordsHandler.lib.php';
$CFG['mods']['include_files'][] = 'common/classes/class_MediaHandler.lib.php';
$CFG['mods']['include_files'][] = 'common/classes/class_MusicHandler.lib.php';
$CFG['html']['header'] = 'general/html_header.php';
$CFG['html']['footer'] = 'general/html_footer.php';
$CFG['site']['is_module_page']='music';
$CFG['auth']['is_authenticate'] = 'members';
$CFG['mods']['is_include_only']['html_header'] = false;
$CFG['html']['is_use_header'] = false;
require($CFG['site']['project_path'].'common/application_top.inc.php');
//--------------class musicLyricsManage--------------->>>//
/**
 * This class is used to manage music Lyrics
 *
 * @category	Rayzz
 * @package		manage music Lyrics
 */
class musicLyricsManage extends MusicHandler
	{

		/**
		  * musicLyricsManage::setTableAndColumns()
		  *
		  * @return
		  */
		 public function setTableAndColumns()
		 	{
				switch ($this->fields_arr['pg'])
					{
						default:
							//Heading
							//Query
							$this->setTableNames(array($this->CFG['db']['tbl']['music_lyric'].' as ml JOIN '.$this->CFG['db']['tbl']['users'].' as u ON ml.user_id=u.user_id'));
							$this->setReturnColumns(array('ml.music_lyric_id', 'ml.lyric', 'ml.lyric_status', 'ml.best_lyric', 'u.user_id', 'u.user_name'));
							$this->sql_condition = 'u.usr_status=\'Ok\' AND ml.music_id='.$this->fields_arr['music_id'];
							$this->sql_sort = 'ml.date_added DESC';
						break;
					}
			}

		/**
		 * musicLyricsManage::displayLyrics()
		 *
		 * @return
		 */
		public function displayLyrics()
			{
				$displayLyrics_arr = array();
				$inc = 0;
				while($row = $this->fetchResultRecord())
					{
						$displayLyrics_arr[$inc]['lyrics'] = wordWrap_mb_ManualWithSpace($row['lyric'], $this->CFG['admin']['musics']['member_lyrics_length'], $this->CFG['admin']['musics']['member_lyrics_total_length']);
						$displayLyrics_arr[$inc]['record'] = $row;
						$displayLyrics_arr[$inc]['lyrics_post_user_url'] = getMemberProfileUrl($row['user_id'], $row['user_name']);
						$displayLyrics_arr[$inc]['viewLyrics_url'] = getUrl('viewlyrics', '?music_id='.$this->fields_arr['music_id'].'&amp;music_lyric_id='.$row['music_lyric_id'], '?music_id='.$this->fields_arr['music_id'].'&amp;music_lyric_id='.$row['music_lyric_id'], '', 'music');
						$displayLyrics_arr[$inc]['editLyrics_url'] = getUrl('editlyrics', '?music_id='.$this->fields_arr['music_id'].'&amp;music_lyric_id='.$row['music_lyric_id'], '?music_id='.$this->fields_arr['music_id'].'&amp;music_lyric_id='.$row['music_lyric_id'], '', 'music');
						$inc++;
					}
				return $displayLyrics_arr;
			}


	}

//<<<<<-------------- Class musicLyricsManage end ---------------//
//-------------------- Code begins -------------->>>>>//
$musicLyricsManage = new musicLyricsManage();
if(!chkAllowedModule(array('music')))
	Redirect2URL($CFG['redirect']['dsabled_module_url']);
$musicLyricsManage->setPageBlockNames(array('list_lyrics_block'));
$musicLyricsManage->setAllPageBlocksHide();
$musicLyricsManage->setFormField('music_id', '');
$musicLyricsManage->setFormField('pg', '');
$musicLyricsManage->setFormField('action', '');
$musicLyricsManage->setFormField('music_lyric_id', '');
$musicLyricsManage->setFormField('start', '0');
$musicLyricsManage->setFormField('numpg', $CFG['data_tbl']['numpg']);
$musicLyricsManage->sanitizeFormInputs($_REQUEST);
//Check validMusicID...//
if($musicLyricsManage->getFormField('music_id')!='')
	{
		if($musicLyricsManage->isValidMusicID($musicLyricsManage->getFormField('music_id')))
			{
				$musicLyricsManage->setPageBlockShow('list_lyrics_block');
			}
		else
			{
				$musicLyricsManage->setAllPageBlocksHide();
				$musicLyricsManage->setCommonErrorMsg($LANG['managelyrics_invalid_id']);
				$musicLyricsManage->setPageBlockShow('block_msg_form_error');
			}
	}
else
	{
		$musicLyricsManage->setAllPageBlocksHide();
		$musicLyricsManage->setCommonErrorMsg($LANG['managelyrics_invalid_id']);
		$musicLyricsManage->setPageBlockShow('block_msg_form_error');
	}
//Action
if($musicLyricsManage->getFormField('action')!='')
	{
		switch($musicLyricsManage->getFormField('action'))
			{
				case 'Delete':
					$musicLyricsManage->deleteLyrics();
					$musicLyricsManage->setCommonSuccessMsg($LANG['managelyrics_delete_successfully']);
					$musicLyricsManage->setPageBlockShow('block_msg_form_success');
				break;

				case 'Inactive':
					$musicLyricsManage->changeStatusLyrics('No');
					$musicLyricsManage->setCommonSuccessMsg($LANG['managelyrics_inactive_successfully']);
					$musicLyricsManage->setPageBlockShow('block_msg_form_success');
				break;

				case 'Active':
					$musicLyricsManage->changeStatusLyrics('Yes');
					$musicLyricsManage->setCommonSuccessMsg($LANG['managelyrics_active_successfully']);
					$musicLyricsManage->setPageBlockShow('block_msg_form_success');
				break;

				case 'best_lyric':
					$musicLyricsManage->setAsBestLyrics();
					$musicLyricsManage->setCommonSuccessMsg($LANG['managelyrics_setbest_successfully']);
					$musicLyricsManage->setPageBlockShow('block_msg_form_success');
				break;

				case 'remove_best_lyric':
					$musicLyricsManage->removeBestLyrics();
					$musicLyricsManage->setCommonSuccessMsg($LANG['managelyrics_removebest_successfully']);
					$musicLyricsManage->setPageBlockShow('block_msg_form_success');
				break;
			}
		$musicLyricsManage->setFormField('action', '');
	}
//<<<<<-------------- Code end ----------------------------------------------//
//-------------------- Page block templates begins -------------------->>>>>//
//Show lyrics list...//
if ($musicLyricsManage->isShowPageBlock('list_lyrics_block'))
	{
		$musicLyricsManage->setTableAndColumns();
		$musicLyricsManage->buildSelectQuery();
		$musicLyricsManage->buildQuery();
		$musicLyricsManage->executeQuery();
		$musicLyricsManage->list_lyrics_block['displayLyrics'] = array();
		if($musicLyricsManage->isResultsFound())
			{
				$musicLyricsManage->list_lyrics_block['action_arr'] = array("Active" => $LANG['common_display_active'],
																		"Inactive" => $LANG['common_display_inactive'],
																		"Delete" => $LANG['common_delete']);

				$musicLyricsManage->list_lyrics_block['displayLyrics'] = $musicLyricsManage->displayLyrics();
				$musicLyricsManage->hidden_array = array('music_id');
				$musicLyricsManage->hidden_arr = array('music_id', 'start');
				$smartyObj->assign('smarty_paging_list', $musicLyricsManage->populatePageLinksGET($musicLyricsManage->getFormField('start'), $musicLyricsManage->hidden_array));
			}
	}
//include the header file
$musicLyricsManage->includeHeader();
//include the content of the page
setTemplateFolder('members/','music');
$smartyObj->display('manageLyrics.tpl');
?>
<script language="javascript"   type="text/javascript">
var block_arr= new Array('selMsgConfirmSingle');
var confirm_message = '';
var please_select_action = '<?php echo $LANG['err_tip_select_action'];?>';
function getAction()
	{
		var act_value = document.selFormLyrics.action_val.value;
		if(act_value)
			{
				switch (act_value)
					{
						case 'Delete':
							confirm_message = '<?php echo $LANG['managelyrics_delete_confirm_message'];?>';
							break;
						case 'Active':
							confirm_message = '<?php echo $LANG['managelyrics_active_confirm_message'];?>';
							break;
						case 'Inactive':
							confirm_message = '<?php echo $LANG['managelyrics_inactive_confirm_message'];?>';
							break;
					}
				$Jq('#confirmMessageSingle').html(confirm_message);
				document.msgConfirmformSingle.action.value = act_value;
				Confirmation('selMsgConfirmSingle', 'msgConfirmformSingle', Array('music_lyric_id'), Array(multiCheckValue), Array('value'), 'selFormForums');
			}
			else
				alert_manual(please_select_action);
	}
</script>
<?php
$musicLyricsManage->includeFooter();
?>