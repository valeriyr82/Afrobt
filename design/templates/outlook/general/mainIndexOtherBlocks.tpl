{if (chkAllowedModule(array('discussions'))) || (chkAllowedModule(array('blog'))) || (chkAllowedModule(array('article'))) }
{$myobj->setTemplateFolder('general')}
{include file="box.tpl" opt="otherblock_top"}
<div class="clsIndexOtherBlocksContainer">
    <div class="clsJQCarousel" id="recentListTabs">
        <ul class="clsJQCarouselTabs clsOverflow clsOtherTabs">
        	{if (chkAllowedModule(array('article')))}
            <li><a href="index.php?showtab=recentarticle">{$LANG.common_article}</a></li>
            {/if}        	
           	{if (chkAllowedModule(array('blog')))}
            <li><a href="index.php?showtab=recentblog">{$LANG.common_blogs}</a></li>
            {/if}
            {if (chkAllowedModule(array('discussions')))}
            <li><a href="index.php?showtab=recentboard">{$LANG.common_boards}</a></li>
            {/if}
        </ul>
    </div>
</div>
<script type="text/javascript">
	{literal}
	$Jq(window).load(function(){
		attachJqueryTabs('recentListTabs');
	});
	{/literal}
</script>
{$myobj->setTemplateFolder('general')}
{include file="box.tpl" opt="otherblock_bottom"}
{/if}
