{pageaddvar name='javascript' value='javascript/jquery-plugins/navgoco/jquery.cookie.js'}{* http://www.komposta.net/article/navgoco *}
{pageaddvar name='javascript' value='javascript/jquery-plugins/navgoco/jquery.navgoco.js'}
{pageaddvar name="stylesheet" value='javascript/jquery-plugins/navgoco/jquery.navgoco-como.css'}
<div id="navcomo-{$blockinfo.bid}" class="navcomowrap">
    {menutree data=$menutree_content id='menu'|cat:$blockinfo.bid class='navcomo'}
    {if $menutree_editlinks}
    <ul>
        <li><a href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid addurl=1}#menutree_tabs" title="{gt text='Add the current URL as new link in this block'}">{gt text='Add current URL'}</a></li>
        <li><a href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid fromblock=1}" title="{gt text='Edit this block' }">{gt text='Edit this block'}</a></li>
    </ul>
    {/if}
</div>
<script type="text/javascript">
jQuery(document).ready(function() {
    jQuery('#menu{{$blockinfo.bid}}').navgoco({ accordion: false });
});
</script>
