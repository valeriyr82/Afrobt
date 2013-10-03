<?php /* Smarty version 2.6.18, created on 2012-10-10 06:27:06
         compiled from topUpload.tpl */ ?>
<div class="clsTopUpload">
<ul>
    <li class="selDropDownLink">
        <span class="clsTopUploadLink"><?php echo $this->_tpl_vars['LANG']['common_upload']; ?>
</span>
        <ul class="clsTopUploadDropdownList">
        	<li class="clsSearchDropDown">
                    <ul>
                       <?php echo $this->_tpl_vars['header']->displayEnabledModuleUploadLinks(); ?>

                    </ul>
            </li>
        </ul>
    </li>
</ul>
</div>