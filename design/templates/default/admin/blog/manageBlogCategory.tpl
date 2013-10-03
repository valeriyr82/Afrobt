<div id="selmanageBlogcategory">
  	<h2><span>{$LANG.manageblogcategory_title}</span></h2>
    <div id="selMsgConfirm" class="clsPopupConfirmation" style="display:none;">
		<p id="confirmMessage"></p>
		<form name="msgConfirmform" id="msgConfirmform" method="post" action="{$myobj->getCurrentUrl(true)}">
			<table summary="{$LANG.manageblogcategory_confirm_tbl_summary}">
				<tr>
					<td>
					<input type="submit" class="clsSubmitButton" name="confirm_action" id="confirm_action" tabindex="{smartyTabIndex}" value="{$LANG.common_yes_option}" />&nbsp;
					<input type="button" class="clsSubmitButton" name="cancel" id="cancel" tabindex="{smartyTabIndex}" value="{$LANG.common_no_option}" onClick="return hideAllBlocks();" />
					<input type="hidden" name="category_ids" id="category_ids" />
                    <input type="hidden" name="category_id" id="category_id" />
				    <input type="hidden" name="action" id="action" />{$myobj->populateHidden($myobj->hidden_arr1)}
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="selMsgConfirmSub" class="clsPopupConfirmation" style="display:none;">
		<p id="confirmMessageSub"></p>
		<form name="msgConfirmformSub" id="msgConfirmformSub" method="post" action="{$myobj->getCurrentUrl()}">
			<table summary="{$LANG.manageblogcategory_confirm_tbl_summary}" class="clsNoBorder">
				<tr>
					<td>
						<input type="submit" class="clsSubmitButton" name="confirm_actionSub" id="confirm_actionSub" tabindex="{smartyTabIndex}" value="{$LANG.common_yes_option}" />&nbsp;
						<input type="button" class="clsSubmitButton" name="cancelSub" id="cancelSub" tabindex="{smartyTabIndex}" value="{$LANG.common_no_option}"
						onClick="return hideAllBlocks();" />
						<input type="hidden" name="category_ids" id="category_ids" />
						<input type="hidden" name="action" id="action" />{$myobj->populateHidden($myobj->hidden_arr2)}
					</td>
				</tr>
			</table>
		</form>
	</div>

    <div class="clsLeftNavigation" id="selLeftNavigation">
    	{$myobj->setTemplateFolder('admin/')}
        {include file='information.tpl'}
        {if $myobj->isShowPageBlock('form_create_category')}
        <div id="selCreateCategory">
        	<form name="selCreateCategoryfrm" id="selCreateCategoryfrm" enctype="multipart/form-data" method="post" action="{$myobj->getCurrentUrl(false)}" autocomplete="off">
            	<table class="clsNoBorder" summary="{$LANG.manageblogcategory_create_tbl_summary}">
                	<tr>
                    	<td class="clsSmallWidth {$myobj->getCSSFormLabelCellClass('category')}">
                        	<label for="category">{$LANG.manageblogcategory_category_name}&nbsp;{$LANG.manageblogcategory_important}&nbsp;</label>
                    	</td>
                        <td class="{$myobj->getCSSFormFieldCellClass('category')}">
                            <p><input type="text" class="clsTextBox" name="category" id="category" value="{$myobj->getFormField('category')}" tabindex="{smartyTabIndex}" />
                            <p>{$myobj->getFormFieldErrorTip('category')}</p><p>{$myobj->ShowHelpTip('category')}</p>
                        </td>
                    </tr>
                    <tr>
                        <td class="{$myobj->getCSSFormLabelCellClass('category_image')}">
                           <label for="category_image">{$LANG.manageblogcategory_category_image}</label><br />
                           ({$myobj->imageFormat}) &nbsp;{$CFG.admin.blog.category_image_max_size} KB
                        </td>
                        <td class="{$myobj->getCSSFormFieldCellClass('category_image')}">
                        	<input type="file" class="clsFileBox" name="category_image" id="category_image" tabindex="{smartyTabIndex}" />
							<p>{$myobj->getFormFieldErrorTip('category_image')}</p><p>{$myobj->ShowHelpTip('category_image')}</p>
                           {if $myobj->getFormField('category_id') && $myobj->getFormField(blog_category_ext)!=''}
                                <img src="{$myobj->category_image}" alt="{$myobj->getFormField('category_image')}" /><br/>
                                <a href="javascript:void(0);" onclick="return Confirmation('selMsgConfirm', 'msgConfirmform',Array('action', 'confirmMessage'), Array('delete_category_image', '{$LANG.manageblogcategory_image_delete_confirmation}'), Array('value', 'innerHTML'), -100, -500);">{$LANG.manageblogcategory_image_delete}</a>
                           {/if}
                           {if $myobj->getFormField(blog_category_ext)=='' && $myobj->getFormField('category_id')}
                                <img src="{$CFG.site.url}blog/design/templates/{$CFG.html.template.default}/root/images/{$CFG.html.stylesheet.screen.default}/no_image/icon-nocategory.jpg" />
                           {/if}
                        </td>
                    </tr>
                    <tr>
                        <td class="{$myobj->getCSSFormLabelCellClass('category_description')}">
                            <label for="category_description">{$LANG.manageblogcategory_category_description}&nbsp;{$LANG.manageblogcategory_important}&nbsp;</label>
                        </td>
                        <td class="{$myobj->getCSSFormFieldCellClass('category_description')}">
                            <textarea rows="4" cols="50" name="category_description" id="category_description" tabindex="{smartyTabIndex}">{$myobj->getFormField('category_description')}</textarea>
                            <p>{$myobj->getFormFieldErrorTip('category_description')}</p><p>{$myobj->ShowHelpTip('category_description')}</p>
                        </td>
                    </tr>

                   {if $myobj->chkAllowedModule(array('content_filter'))}
                    <tr id="selDateLocationRow" class="clsAllowOptions">
                        <td class="{$myobj->getCSSFormLabelCellClass('allow_post')}"><label for="allow_post1">{$LANG.manageblogcategory_allow_post}</label></td>
                        <td class="{$myobj->getCSSFormFieldCellClass('allow_post')}">
                            <input type="radio" class="clsCheckRadio" name="allow_post" id="allow_post1" value="Yes" tabindex="{smartyTabIndex}" {$myobj->isCheckedRadio('allow_post','Yes')} />&nbsp;<label for="allow_post1">{$LANG.common_yes_option}</label>	&nbsp;&nbsp;
                            <input type="radio" class="clsCheckRadio" name="allow_post" id="allow_post2" value="No" tabindex="{smartyTabIndex}"{$myobj->isCheckedRadio('allow_post','No')} />&nbsp;
                            <label for="allow_post2">{$LANG.common_no_option}</label><p>{$myobj->getFormFieldErrorTip('allow_post')}</p></td>
                    </tr>
                    <tr id="selDateLocationRow" class="clsAllowOptions">
                        <td class="{$myobj->getCSSFormLabelCellClass('blog_category_type')}"><label for="blog_category_type1">{$LANG.manageblogcategory_blog_category_type}</label></td>
                        <td class="{$myobj->getCSSFormFieldCellClass('blog_category_type')}">
                            <input type="radio" class="clsCheckRadio" name="blog_category_type" id="blog_category_type1" value="Porn" tabindex="{smartyTabIndex}"{$myobj->isCheckedRadio('blog_category_type','Porn')} />&nbsp;<label for="blog_category_type1" >{$LANG.porn}</label>&nbsp;&nbsp;
                            <input type="radio" class="clsCheckRadio" name="blog_category_type" id="blog_category_type2" value="General" tabindex="{smartyTabIndex}"{$myobj->isCheckedRadio('blog_category_type','General')}/>&nbsp;<label for="blog_category_type2">{$LANG.general}</label></td>
                            <p>{$myobj->getFormFieldErrorTip('blog_category_type')}</p>
                    </tr>
					{/if}


                    <tr>
                        <td class="{$myobj->getCSSFormLabelCellClass('status')}">
                            <label for="status_yes">{$LANG.manageblogcategory_category_status}</label>
                        </td>
                        <td class="{$myobj->getCSSFormFieldCellClass('status')}">
                            <input type="radio" class="clsCheckRadio" name="status" id="status_yes" value="Yes" {if $myobj->getFormField('status') == 'Yes'} CHECKED {/if} tabindex="{smartyTabIndex}" />&nbsp;<label for="status_yes">{$LANG.manageblogcategory_status_yes}</label>&nbsp;&nbsp;
                            <input type="radio" class="clsCheckRadio" name="status" id="status_no" value="No" {if $myobj->getFormField('status') == 'No'} CHECKED {/if} tabindex="{smartyTabIndex}" />&nbsp;<label for="status_no">{$LANG.manageblogcategory_status_no}</label>
                        </td>
                    </tr>
                    <tr>
                      <td class="{$myobj->getCSSFormLabelCellClass('priority')}">
                            <label for="priority">{$LANG.manageblogcategory_priority}</label>
                      </td>
                      <td class="{$myobj->getCSSFormFieldCellClass('priority')}">
                            <input type="text" class="clsTextBox" name="priority" id="priority"  value="{$myobj->getFormField('priority')}"/>
                            <p>{$myobj->getFormFieldErrorTip('priority')}</p><p>{$myobj->ShowHelpTip('about_priority', 'priority')}</p>
                      </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="{$myobj->getCSSFormFieldCellClass('category_submit')}">
                    {if $myobj->chkIsEditMode()}
                            <input type="submit" class="clsSubmitButton" name="category_submit" id="category_submit" tabindex="{smartyTabIndex}" value="{$LANG.manageblogcategory_update_submit}" />
                            <input type="submit" class="clsCancelButton" name="category_cancel" id="category_cancel" tabindex="{smartyTabIndex}" value="{$LANG.manageblogcategory_cancel_submit}" />
                    {else}
                            <input type="submit" class="clsSubmitButton" name="category_submit" id="category_submit" tabindex="{smartyTabIndex}" value="{$LANG.manageblogcategory_add_submit}" />
                    {/if}</td>
                    </tr>
                </table>
            	{$myobj->populateHidden($myobj->form_create_category.hidden_arr)}
           	</form>
        </div>
        {/if}

        {if $myobj->isShowPageBlock('form_show_category')}
		<form name="selFormCategory" id="selFormCategory" method="post" action="{$myobj->getCurrentUrl()}">
    	{$myobj->populateHidden($myobj->form_show_category.hidden_arr)}

        <div id="selShowCategories">
            {if $myobj->isResultsFound()}
                {if $CFG.admin.navigation.top}
                    {$myobj->setTemplateFolder('admin/')}
                    {include file='pagination.tpl'}
                {/if}
                <table summary="{$LANG.manageblogcategory_tbl_summary}">
                    <tr>
                        <th><input type="checkbox" class="clsCheckRadio" name="check_all" id="check_all" tabindex="{smartyTabIndex}" onClick="CheckAll(document.selFormCategory.name, document.selFormCategory.check_all.name)"/></th>
                        <th>{$LANG.manageblogcategory_category_id}</th>
                        <th>{$LANG.manageblogcategory_category}</th>
                        <th>{$LANG.manageblogcategory_category_type}</th>
                        <th>{$LANG.manageblogcategory_post_count}</th>
                        <th>{$LANG.manageblogcategory_description}</th>
                        <th>{$LANG.manageblogcategory_allow_post}</th>
                        <th>{$LANG.manageblogcategory_status}</th>
                        <th>{$LANG.manageblogcategory_date_added}</th>
                        <th>&nbsp;</th>
                    </tr>
                {foreach key=scKey item=scValue from=$showCategories_arr}
                    <tr>
                        <td class="clsAlignCenter"><input type="checkbox" class="clsCheckRadio" name="category_ids[]" value="{$scValue.record.blog_category_id}" tabindex="{smartyTabIndex}" {$scValue.checked} onClick="checkCheckBox(this.form, 'check_all');"/>                        </td>
                        <td>{$scValue.record.blog_category_id}</td>
                        <td>
                            <p id="categoryName">{$scValue.record.blog_category_name}</p>                        </td>
                        <td>{$scValue.record.blog_category_type}</td>
                        <td>{$myobj->getBlogPostCount($scValue.record.blog_category_id)}</td>

                        <td>{$scValue.record.blog_category_description}</td>
                        <td>{$scValue.record.allow_post}</td>
                        <td>
                            <p>{$scValue.record.blog_category_status}</p>                        </td>
                        <td>
                            <p>{$scValue.record.date_added}</p>                        </td>
                        <td>
                            <p id="edit"><a href="manageBlogCategory.php?category_id={$scValue.record.blog_category_id}&amp;start={$myobj->getFormField('start')}">{$LANG.manageblogcategory_edit}</a>                            </p>
                            <p>
                            <a href="manageBlogCategory.php?category_id={$scValue.record.blog_category_id}&amp;opt=sub">{$LANG.manageblogcategory_subcategorylink}</a>                            </p>                        </td>
                    </tr>
                {/foreach}
                    <tr>
                        <td colspan="10" class="{$myobj->getCSSFormFieldCellClass('delete')}">
                            <a href="#" id="dAltMlti"></a>
                            <select name="blog_options" id="blog_options" tabindex="{smartyTabIndex}" >
                                <option value="Enable">{$LANG.manageblogcategory_action_enable}</option>
                                <option value="Disable">{$LANG.manageblogcategory_action_disable}</option>
                                <option value="Delete">{$LANG.manageblogcategory_action_delete}</option>
                            </select>
                            <input type="button" class="clsSubmitButton" name="action_submit" id="action_submit" tabindex="{smartyTabIndex}" value="{$LANG.manageblogcategory_submit}" onClick="if(getMultiCheckBoxValue('selFormCategory', 'check_all', '{$LANG.manageblogcategory_err_tip_select_category}', 'dAltMlti', -25, -290)) {literal} { {/literal} Confirmation('selMsgConfirm', 'msgConfirmform', Array('category_ids', 'action', 'confirmMessage'), Array(multiCheckValue, document.selFormCategory.blog_options.value, '{$LANG.manageblogcategory_confirm_message}'), Array('value', 'value', 'innerHTML'), -25, -290); {literal} } {/literal}" />                        </td>
                    </tr>
                </table>
          {if $CFG.admin.navigation.bottom}
                    {$myobj->setTemplateFolder('admin/')}
                    {include file='pagination.tpl'}
                {/if}
            {else}
                <div id="selMsgAlert">
                    <p>{$LANG.manageblogcategory_no_category}</td>
                </div>
            {/if}
        </div>
		</form>
		{/if}

        {if $myobj->isShowPageBlock('form_create_sub_category')}
		<p class="clsPageLink" >{$LANG.manageblogcategory_managesubcategorytitle}</p>
		<p class="clsPageLink"><a href="{$myobj->getCurrentUrl(false)}">{$LANG.manageblogcategory_back_to_main}</a></p>
		<div id="selCreateSubCategory">
            <form name="selCreateSubCategoryfrm" id="selCreateSubCategoryfrm" enctype="multipart/form-data" method="post" action="{$myobj->getCurrentUrl(true)}" autocomplete="off">
            <table class="clsNoBorder" summary="{$LANG.manageblogcategory_create_tbl_summary}">
                <tr>
                    <td class="clsWidthSmall {$myobj->getCSSFormLabelCellClass('sub_category')}"><label for="sub_category">{$LANG.manageblogsubcategory_subcategory_name}&nbsp;{$LANG.manageblogcategory_important}&nbsp;</label></td>
                    <td class="{$myobj->getCSSFormFieldCellClass('sub_category')}">
                        <input type="text" class="clsTextBox" name="sub_category" id="sub_category" value="{$myobj->getFormField('sub_category')}" tabindex="{smartyTabIndex}" />
                        <p>{$myobj->getFormFieldErrorTip('sub_category')}</p><p>{$myobj->ShowHelpTip('sub_category')}</p></td>
                </tr>
                <tr>
                    <td class="{$myobj->getCSSFormLabelCellClass('sub_category_image')}">
                    <label for="sub_category_image">{$LANG.manageblogsubcategory_subcategory_image}
                    </label><br />({$myobj->imageFormat}) &nbsp;{$CFG.admin.blog.category_image_max_size} KB
                    </td>
                    <td class="{$myobj->getCSSFormFieldCellClass('sub_category_image')}">
                    	<input type="file" class="clsFileBox" name="sub_category_image" id="sub_category_image" tabindex="{smartyTabIndex}" />
                        <p>{$myobj->getFormFieldErrorTip('sub_category_image')}</p><p>{$myobj->ShowHelpTip('sub_category_image')}</p>
                        {if $myobj->getFormField('sub_category_id') && $myobj->getFormField(blog_category_ext)!=''}
                            <img src="{$myobj->sub_category_image}"/><br/>
                            <a href="javascript:void(0);" onclick="return Confirmation('selMsgConfirmSub', 'msgConfirmformSub',Array('action', 'confirmMessageSub'), Array('delete_subcategory_image', '{$LANG.manageblogcategory_image_delete_confirmation}'), Array('value', 'innerHTML'), -100, -500);">{$LANG.manageblogcategory_image_delete}</a>
                        {/if}
                    	{if $myobj->getFormField(blog_category_ext)=='' && $myobj->getFormField('sub_category_id')}
                        	<img src="{$CFG.site.url}blog/design/templates/{$CFG.html.template.default}/root/images/{$CFG.html.stylesheet.screen.default}/no_image/icon-nocategory.jpg" />
                        {/if}
                    </td>
                </tr>
                <tr>
                  <td class="{$myobj->getCSSFormLabelCellClass('priority')}"><label for="priority">{$LANG.manageblogcategory_priority}</label></td>
                  <td class="{$myobj->getCSSFormFieldCellClass('priority')}">
                    <input class="clsTextBox" type="text" name="priority" id="priority"  value="{$myobj->getFormField('priority')}"/>
                   <p>{$myobj->getFormFieldErrorTip('priority')}</p>
                    <p>{$myobj->ShowHelpTip('about_priority', 'priority')}</p>
                  </td>
                </tr>
                <tr>
                    <td colspan="2" class="{$myobj->getCSSFormFieldCellClass('category_submit')}">
                    {if $myobj->chkIsEditModeSub()}
                        <input type="submit" class="clsSubmitButton" name="update_category_submit" id="sub_category_submit" tabindex="{smartyTabIndex}" value="{$LANG.manageblogcategory_update_submit}" />
                        <input type="submit" class="clsCancelButton" name="sub_category_cancel" id="sub_category_cancel" tabindex="{smartyTabIndex}" value="{$LANG.manageblogcategory_cancel_submit}" />
                    {else}
                        <input type="submit" class="clsSubmitButton" name="sub_category_submit" id="sub_category_submit" tabindex="{smartyTabIndex}" value="{$LANG.manageblogcategory_add_submit}" />
                    {/if}</td>
                </tr>
            </table>
            {$myobj->populateHidden($myobj->form_create_sub_category.hidden_arr)}
            <input type="hidden" id="category_id" name="category_id" value="{$myobj->getFormField('category_id')}" />
            <input type="hidden" id="sub_category_id" name="sub_category_id" value="{$myobj->getFormField('sub_category_id')}" />
            <input type="hidden" id="blog_category_ext" name="blog_category_ext" value="{$myobj->getFormField('blog_category_ext')}" />
            <input type="hidden" name="start" value="{$myobj->getFormField('start')}" />
            </form>
		</div>
		{/if}

        {if $myobj->isShowPageBlock('form_show_sub_category')}
            {if $populateSubCategories_arr.rs_PO_RecordCount}
                <form name="selFormSubCategory" id="selFormSubCategory" method="post" action="{$myobj->getCurrentUrl(true)}">
                <table>
                    <tr>
                        <th class="clsSelectAllItems"><input type="checkbox" class="clsCheckRadio" name="check_all" id="check_all" tabindex="{smartyTabIndex}" onClick="CheckAll(document.selFormSubCategory.name, document.selFormSubCategory.check_all.name)"/></th>
                        <th>{$LANG.manageblogcategory_subcategory_id}</th>
                        <th>{$LANG.manageblogcategory_subcategory_name}</th>
                        <th>{$LANG.manageblogcategory_date_added}</th>
                        <th>&nbsp;</th>
                    </tr>
                {foreach item=pscValue from=$populateSubCategories_arr.row}
                    <tr>
                        <td class="clsAlignCenter clsSelectAllItems"><input type="checkbox" class="clsCheckRadio" name="category_ids[]" value="{$pscValue.record.blog_category_id}" tabindex="{smartyTabIndex}" {$pscValue.checked} onClick="disableHeading('flaggedForm');"/></td>
                        <td>{$pscValue.record.blog_category_id}</td>
                        <td>
                            <p id="categoryName">{$pscValue.record.blog_category_name}</p>                        </td>
                        <td class="clsSmallWidth">{$pscValue.record.date_added}</td>
                        <td class="clsSmallWidth"><p id="edit"><a href="manageBlogCategory.php?category_id={$myobj->getFormField('category_id')}&amp;sub_category_id={$pscValue.record.blog_category_id}&amp;opt=subedit">{$LANG.manageblogcategory_edit}</a></p></td>
                    </tr>
                {/foreach}
                    <tr>
                        <td colspan="5">
                            <a href="#" id="dAltMltiSub" name="dAltMltiSub"></a>
                            <input type="button" class="clsSubmitButton" value="{$LANG.manageblogcategory_action_delete}" onClick="if(getMultiCheckBoxValue('selFormSubCategory', 'check_all', '{$LANG.manageblogcategory_err_tip_select_category}', 'dAltMltiSub', -25, -290)) {literal} { {/literal} Confirmation('selMsgConfirmSub', 'msgConfirmformSub', Array('category_ids', 'action', 'category_id', 'confirmMessageSub'), Array(multiCheckValue, 'delete', '{$myobj->getFormField('category_id')}', '{$LANG.manageblogcategory_confirm_message}'), Array('value', 'value', 'value', 'innerHTML'), -25, -290); {literal} } {/literal}" />                        </td>
                    </tr>
                </table>
      </form>
            {else}
                <div id="selMsgAlert">
                    <p>{$LANG.manageblogcategory_no_sub_category}</td>
                </div>
            {/if}
        {/if}
    </div>
</div>