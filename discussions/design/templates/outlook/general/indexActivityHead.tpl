{$myobj->setTemplateFolder('general/', 'discussions')}
{include file="box.tpl" opt="whatsgoing_top"}
<div class="clsWhatgoingHeading clsOverflow">
	<span class="clsRightBarWidgetTitle">{$LANG.sidebar_discussion_activities_label}</span>
    <div class="clsRightBarWidgetTab" id="indexActivitesTabs">
        <ul class="clsFloatRight">
        	{if isMember()}
            <li><a href="index.php?activity_type=My">{$LANG.sidebar_my_label}</a></li>
            <li><a href="index.php?activity_type=Friends">{$LANG.sidebar_friends_label}</a></li>
            {/if}
            <li><a href="index.php?activity_type=All">{$LANG.sidebar_everyone_label}</a></li>
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
{$myobj->setTemplateFolder('general/', 'discussions')}
{include file="box.tpl" opt="whatsgoing_bottom"}