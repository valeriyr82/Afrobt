{$myobj->setTemplateFolder('general/', 'article')}
{include file="box.tpl" opt="whatsgoing_top"}
<div class="clsWhatgoingHeading clsOverflow">
    <span class="clsRightBarWidgetTitle">{$LANG.sidebar_activities_label}</span>
    <div class="clsRightBarWidgetTab" id="indexActivitesTabs">
        <ul class="clsFloatRight">
        	{if isMember()}
            <li><a href="index.php?activity_type=My"><span>{$LANG.sidebar_my_label}</span></a></li>
            <li><a href="index.php?activity_type=Friends"><span>{$LANG.sidebar_friends_label}</span></a></li>
            {/if}
            <li><a href="index.php?activity_type=All"><span>{$LANG.sidebar_articleactivity_all_label}</span></a></li>
        </ul>
    </div>
    <script type="text/javascript">
		{literal}
		$Jq(window).load(function(){
			attachJqueryTabs('indexActivitesTabs');
		});
		{/literal}
	</script>
</div>
{$myobj->setTemplateFolder('general/', 'article')}
{include file="box.tpl" opt="whatsgoing_bottom"}