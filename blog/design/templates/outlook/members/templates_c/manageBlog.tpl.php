<?php /* Smarty version 2.6.18, created on 2012-09-11 02:08:33
         compiled from manageBlog.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'smartyTabIndex', 'manageBlog.tpl', 18, false),)), $this); ?>
<?php echo $this->_tpl_vars['myobj']->setTemplateFolder('general/','blog'); ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'box.tpl', 'smarty_include_vars' => array('opt' => 'display_top')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div class="clsPageHeading">
	<h2><?php echo $this->_tpl_vars['LANG']['manageblog_title']; ?>
</h2>
</div>

<?php echo $this->_tpl_vars['myobj']->setTemplateFolder('general/','blog'); ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "information.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<!-- confirmation box start-->
	<div id="selMsgConfirm" class="clsPopupConfirmation" style="display:none;">
		<p id="confirmMessage"></p>
		<form name="msgConfirmform" id="msgConfirmform" method="post" action="<?php echo $this->_tpl_vars['myobj']->getCurrentUrl(true); ?>
">
			<table summary="<?php echo $this->_tpl_vars['LANG']['manageblog_tbl_summary']; ?>
">
				<tr>
					<td>
						<input type="submit" class="clsSubmitButton" name="confirm_action" id="confirm_action" tabindex="<?php echo smartyTabIndex(array(), $this);?>
" value="<?php echo $this->_tpl_vars['LANG']['common_confirm']; ?>
" />
						&nbsp;
						<input type="button" class="clsCancelButton" name="cancel" id="cancel" tabindex="<?php echo smartyTabIndex(array(), $this);?>
" value="<?php echo $this->_tpl_vars['LANG']['common_cancel']; ?>
"  onClick="return hideAllBlocks('selFormForums');" />
						<input type="hidden" name="action" id="action" value="delete" />
					</td>
				</tr>
			</table>
		</form>
	</div>
<p class="ClsMandatoryText"><?php echo $this->_tpl_vars['LANG']['common_mandatory_hint_1']; ?>
<span class="clsMandatoryFieldIconInText">*</span><?php echo $this->_tpl_vars['LANG']['common_mandatory_hint_2']; ?>
</p>
<!-- End -->
<form name="manageBlogFrm" id="manageBlogFrm" action="<?php echo $this->_tpl_vars['myobj']->getCurrentUrl(false); ?>
" method="post" enctype="multipart/form-data">
    <div class="clsDataTable">
        <table summary="<?php echo $this->_tpl_vars['LANG']['manageblog_tbl_summary']; ?>
">
         <tr>
            <td class="<?php echo $this->_tpl_vars['myobj']->getCSSFormLabelCellClass('blog_name'); ?>
">
               <label for="blog_name"><?php echo $this->_tpl_vars['myobj']->manageblog_blog_name_lang; ?>
</label>
			   <?php echo $this->_tpl_vars['myobj']->displayCompulsoryIcon(); ?>

            </td>
            <td class="<?php echo $this->_tpl_vars['myobj']->getCSSFormFieldCellClass('blog_title'); ?>
" >
            	<input type="text" class="clsTextBox" name="blog_name" id="blog_name" value="<?php echo $this->_tpl_vars['myobj']->getFormField('blog_name'); ?>
" tabindex="<?php echo smartyTabIndex(array(), $this);?>
" maxlength="<?php echo $this->_tpl_vars['CFG']['fieldsize']['blog_name']['max']; ?>
" />
                <?php echo $this->_tpl_vars['myobj']->getFormFieldErrorTip('blog_name'); ?>

                <?php echo $this->_tpl_vars['myobj']->ShowHelpTip('blog_name'); ?>

            </td>
        </tr>
        <tr>
            <td class="<?php echo $this->_tpl_vars['myobj']->getCSSFormLabelCellClass('blog_title'); ?>
">
               <label for="blog_title"><?php echo $this->_tpl_vars['LANG']['manageblog_blog_title']; ?>
</label>
	       <?php echo $this->_tpl_vars['myobj']->displayCompulsoryIcon(); ?>

            </td>
            <td class="<?php echo $this->_tpl_vars['myobj']->getCSSFormFieldCellClass('blog_title'); ?>
" >
            	<input type="text" class="clsTextBox" name="blog_title" id="blog_title" value="<?php echo $this->_tpl_vars['myobj']->getFormField('blog_title'); ?>
" tabindex="<?php echo smartyTabIndex(array(), $this);?>
" maxlength="<?php echo $this->_tpl_vars['CFG']['fieldsize']['blog_slogan']['max']; ?>
" />
                <?php echo $this->_tpl_vars['myobj']->getFormFieldErrorTip('blog_title'); ?>

                <?php echo $this->_tpl_vars['myobj']->ShowHelpTip('blog_title'); ?>

            </td>
        </tr>
        <tr>
            <td class="<?php echo $this->_tpl_vars['myobj']->getCSSFormLabelCellClass('blog_slogan'); ?>
">
               <label for="blog_slogan"><?php echo $this->_tpl_vars['LANG']['manageblog_blog_slogan']; ?>
</label>
            </td>
            <td class="<?php echo $this->_tpl_vars['myobj']->getCSSFormFieldCellClass('blog_slogan'); ?>
" >
            	<input type="text" class="clsTextBox" name="blog_slogan" id="blog_slogan" value="<?php echo $this->_tpl_vars['myobj']->getFormField('blog_slogan'); ?>
" tabindex="<?php echo smartyTabIndex(array(), $this);?>
" />
                <?php echo $this->_tpl_vars['myobj']->getFormFieldErrorTip('blog_slogan'); ?>

                <?php echo $this->_tpl_vars['myobj']->ShowHelpTip('blog_slogan'); ?>

            </td>
        </tr>
        <tr>
            <td class="<?php echo $this->_tpl_vars['myobj']->getCSSFormLabelCellClass('blog_logo_image'); ?>
 clsManageBackgroundLabel"><label for="blog_logo_image"><?php echo $this->_tpl_vars['LANG']['manageblog_blog_logo']; ?>
</label></td>
            <td class="<?php echo $this->_tpl_vars['myobj']->getCSSFormFieldCellClass('blog_logo_image'); ?>
">
            <input type="file" class="clsFileBox" name="blog_logo_image" id="blog_logo_image" tabindex="<?php echo smartyTabIndex(array(), $this);?>
" />
            <p>[<?php echo $this->_tpl_vars['LANG']['manageblog_image_allowed']; ?>
:&nbsp;<?php echo $this->_tpl_vars['myobj']->imageFormat; ?>
]</p>
            <p>[<?php echo $this->_tpl_vars['LANG']['manageblog_maxsize']; ?>
:&nbsp;<?php echo $this->_tpl_vars['CFG']['admin']['blog']['logo_max_size']; ?>
&nbsp;KB]</p>
            <div><!-- -->
            <?php echo $this->_tpl_vars['myobj']->getFormFieldErrorTip('blog_logo_image'); ?>

            </div>
            <?php echo $this->_tpl_vars['myobj']->ShowHelpTip('blog_logo_image'); ?>

            </td>
        </tr>
        <tr>
        	<td><!-- --></td>
        	<td>
                <?php if ($this->_tpl_vars['myobj']->isShowPageBlock('block_logo_image_display')): ?>
                    <div class="clsOverflow">
                        <p class="clsViewThumbImage"><span><img src="<?php echo $this->_tpl_vars['myobj']->logo_image_path; ?>
" alt="<?php echo $this->_tpl_vars['LANG']['manageblog_logo_alttag']; ?>
"></span></p>
                    </div>
                    <div class="clsDeleteBackground">
                    	<a href="javascript:void(0)" onclick="Confirmation('selMsgConfirm', 'msgConfirmform', Array('confirmMessage'), Array('<?php echo $this->_tpl_vars['LANG']['manageblog_delete_confirmation']; ?>
'), Array('innerHTML'));"><?php echo $this->_tpl_vars['LANG']['manageblog_delete_logo_image']; ?>
</a>
                    </div>
                <?php endif; ?>
            </td>
        </tr>
        <tr>
        	<td></td>
            <td ><div class="clsSubmitLeft"><div class="clsSubmitRight">
            <?php if (! $this->_tpl_vars['myobj']->blogadded): ?>
            <input type="submit" name="addBlog" value="<?php echo $this->_tpl_vars['LANG']['manageblog_submit']; ?>
" tabindex="<?php echo smartyTabIndex(array(), $this);?>
">
            <?php else: ?>
            <input type="submit" name="updateBlog" value="<?php echo $this->_tpl_vars['LANG']['manageblog_update']; ?>
" tabindex="<?php echo smartyTabIndex(array(), $this);?>
">
            <?php endif; ?>
            </div></div>
                 <div class="clsCancelMargin">
					 <div class="clsCancelLeft">
						 <div class="clsCancelRight">
						 	<input type="button" name="cancelBlogMangage" value="<?php echo $this->_tpl_vars['LANG']['common_cancel']; ?>
" onclick="cancelRedirect()" tabindex="<?php echo smartyTabIndex(array(), $this);?>
">
						 </div>
					 </div>
				 </div>
	         </td>
        </tr>
        </table>
    </div>
</form>
<?php echo $this->_tpl_vars['myobj']->setTemplateFolder('general/','blog'); ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'box.tpl', 'smarty_include_vars' => array('opt' => 'display_bottom')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>