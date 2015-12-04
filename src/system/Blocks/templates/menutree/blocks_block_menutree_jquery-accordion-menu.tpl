{pageaddvar name='javascript' value='javascript/jquery-plugins/accordion-menu/js/jquery.cookie.js'}{* http://www.komposta.net/article/accordion-menu *}
{*pageaddvar name='javascript' value='javascript/jquery-plugins/accordion-menu/js/jquery.hoverIntent.minified.js'*}
{pageaddvar name='javascript' value='javascript/jquery-plugins/accordion-menu/js/jquery.dcjqaccordion.2.7.min.js'}
{pageaddvar name="stylesheet" value='javascript/jquery-plugins/accordion-menu/css/como.css'}
{pageaddvar name="stylesheet" value='javascript/jquery-plugins/accordion-menu/css/skins/grey.css'}
<div id="accmenu-{$blockinfo.bid}" class="accmenuwrap grey">
    {menutree data=$menutree_content id='menu'|cat:$blockinfo.bid class='accordion'}
    {if $menutree_editlinks}
    <ul>
        <li><a href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid addurl=1}#menutree_tabs" title="{gt text='Add the current URL as new link in this block'}">{gt text='Add current URL'}</a></li>
        <li><a href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid fromblock=1}" title="{gt text='Edit this block' }">{gt text='Edit this block'}</a></li>
    </ul>
    {/if}
</div>
<script type="text/javascript">
jQuery(document).ready(function() {
    jQuery('#menu{{$blockinfo.bid}}').dcAccordion();
});
</script>
