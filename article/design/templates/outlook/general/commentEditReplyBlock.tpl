<div class="clsEditCommentTextArea clsButtonHolder">
    <form name="{$commentEditReply.name}{$commentEditReply.comment_id}" id="{$commentEditReply.name}_{$commentEditReply.comment_id}" method="post" action="{$myobj->getCurrentUrl()}" autocomplete="off">
    <table>
        <tr>
            <td class="clsTextareaWidth">
                <textarea name="comment_{$commentEditReply.comment_id}" id="comment_{$commentEditReply.comment_id}" rows="5" cols="90">{$myobj->getComment()}</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
               <p class="clsEditButton"> <span><input class="clsCommentDiscard" type="button" onClick="return {$commentEditReply.sumbitFunction}({$commentEditReply.comment_id}, '{$commentEditReply.editReplyUrl}')" name="post_comment" id="post_comment" tabindex="{smartyTabIndex}" value="{$LANG.postcomment_post_comment}" /></span></p>
               <p class="clsDeleteButton"> <span><input class="clsCommentDiscard" type="button" onClick="return {$commentEditReply.cancelFunction}({$commentEditReply.comment_id})" name="cancel" id="cancel" tabindex="{smartyTabIndex}"
                value="{$LANG.postcomment_cancel}" /></span></p>
            </td>
        </tr>
    </table>
    </form>
</div>
