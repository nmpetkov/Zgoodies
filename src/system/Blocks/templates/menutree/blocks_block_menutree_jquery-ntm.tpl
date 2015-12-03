{pageaddvar name='javascript' value='javascript/jquery-plugins/jquery.ntm/js/jquery.ntm.js'}
{pageaddvar name="stylesheet" value='javascript/jquery-plugins/jquery.ntm/themes/como/css/theme.css'}
<div class="tree-menu" id="tree-menu-{$blockinfo.bid}">
    {menutree data=$menutree_content id='menu'|cat:$blockinfo.bid class=''}
    {if $menutree_editlinks}
    <ul>
        <li><a href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid addurl=1}#menutree_tabs" title="{gt text='Add the current URL as new link in this block'}">{gt text='Add current URL'}</a></li>
        <li><a href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid fromblock=1}" title="{gt text='Edit this block' }">{gt text='Edit this block'}</a></li>
    </ul>
    {/if}
</div>
<script type="text/javascript">
jQuery(document).ready(function() {
    jQuery('#tree-menu-{{$blockinfo.bid}}').ntm();
});
</script>
