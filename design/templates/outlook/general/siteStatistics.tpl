<div class="clsStatsContainer">
<div style="right:0">
    <div class="clsStatsRight">
        <div class="clsStatsLeft">
        	<div class="clsStatsContent">
                <p class="clsStatsHeading">{$LANG.index_site_statistics_title} :</p>
                {* STORE THE ARRAY COUNT AND DISPLAY THE  , EXCEPT FOR THE LAST ONE, SECTION INDEX STARTS WITH 0 *}
                {assign var=stats_count value=$statistics|@count}
                {section name=count loop=$statistics}
                    <p>
                        <span>{$statistics[count].value}</span> {$statistics[count].lang}
						{if (($stats_count-1) != $smarty.section.count.index)},&nbsp;{/if}
                    </p>
                {/section}
            </div>
        </div>
    </div>
	</div>
</div>