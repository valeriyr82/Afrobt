{if $myobj->isShowPageBlock('subcription_option')}
	{if $myobj->getFormField('category_id')}
            {if $myobj->subscription_status == 'yes'}
                 <span id="unsubscribe_{$myobj->getFormField('category_id')}"><a href="javascript:void(0);" id="anchor_subscribe" onclick="subscription_sep_action({$myobj->getFormField('category_id')}, 'No', '{$myobj->getFormField('sub_module')}', 'Category');" class="clsUnSubscribeIcon"  title="{$LANG.common_unsubscribe}">{$LANG.common_unsubscribe}</a></span>
                 <span id="subscribe_{$myobj->getFormField('category_id')}" style="display:none"><a href="javascript:void(0);" id="anchor_subscribe" onclick="subscription_sep_action({$myobj->getFormField('category_id')}, 'Yes', '{$myobj->getFormField('sub_module')}', 'Category');" class="clsSubscribeIcon" title="{$LANG.common_subscribe}">{$LANG.common_subscribe}</a></span>
            {else}
                 <span id="subscribe_{$myobj->getFormField('category_id')}"><a href="javascript:void(0);" id="anchor_subscribe" onclick="subscription_sep_action({$myobj->getFormField('category_id')}, 'Yes', '{$myobj->getFormField('sub_module')}', 'Category');" class="clsSubscribeIcon" title="{$LANG.common_subscribe}">{$LANG.common_subscribe}</a></span>
                 <span id="unsubscribe_{$myobj->getFormField('category_id')}" style="display:none"><a href="javascript:void(0);" id="anchor_subscribe" onclick="subscription_sep_action({$myobj->getFormField('category_id')}, 'No', '{$myobj->getFormField('sub_module')}', 'Category');" class="clsUnSubscribeIcon" title="{$LANG.common_unsubscribe}">{$LANG.common_unsubscribe}</a></span>
            {/if}
	{elseif $myobj->getFormField('tag')}
            {if $myobj->subscription_status == 'yes'}
                 <span id="unsubscribe_{$myobj->getFormField('tag')}"><a href="javascript:void(0);" id="anchor_subscribe" onmouseover="showTagDetail({$myobj->getFormField('add_slash_tag')});" onmouseout="hideTagDetail({$myobj->getFormField('add_slash_tag')})" onclick="subscription_sep_action('{$myobj->getFormField('add_slash_tag')}', 'No', '{$myobj->getFormField('sub_module')}', 'Tag');" class="clsUnSubscribeIcon clsPhotoVideoEditLinks" title="{$LANG.common_unsubscribe}">{$LANG.common_unsubscribe}</a></span>
                 <span id="subscribe_{$myobj->getFormField('tag')}" style="display:none"><a href="javascript:void(0);" id="anchor_subscribe" onmouseover="showTagDetail({$myobj->getFormField('add_slash_tag')});" onmouseout="hideTagDetail({$myobj->getFormField('add_slash_tag')})" onclick="subscription_sep_action('{$myobj->getFormField('add_slash_tag')}', 'Yes', '{$myobj->getFormField('sub_module')}', 'Tag');" class="clsSubscribeIcon clsPhotoVideoEditLinks" title="{$LANG.common_subscribe}">{$LANG.common_subscribe}</a></span>
            {else}
                 <span id="subscribe_{$myobj->getFormField('tag')}"><a href="javascript:void(0);" id="anchor_subscribe" onmouseover="showTagDetail({$myobj->getFormField('add_slash_tag')});" onmouseout="hideTagDetail({$myobj->getFormField('add_slash_tag')})"  onclick="subscription_sep_action('{$myobj->getFormField('add_slash_tag')}', 'Yes', '{$myobj->getFormField('sub_module')}', 'Tag');" class="clsSubscribeIcon clsPhotoVideoEditLinks" title="{$LANG.common_subscribe}">{$LANG.common_subscribe}</a></span>
                 <span id="unsubscribe_{$myobj->getFormField('tag')}" style="display:none"><a href="javascript:void(0);" id="anchor_subscribe" onmouseover="showTagDetail({$myobj->getFormField('add_slash_tag')});" onmouseout="hideTagDetail({$myobj->getFormField('add_slash_tag')})" onclick="subscription_sep_action('{$myobj->getFormField('add_slash_tag')}', 'No', '{$myobj->getFormField('sub_module')}', 'Tag');" class="clsUnSubscribeIcon clsPhotoVideoEditLinks" title="{$LANG.common_unsubscribe}">{$LANG.common_unsubscribe}</a></span>
            {/if}
      {/if}
{/if}