{* http://www.komposta.net/article/accordion-menu *}
{if !isset($modvars.Zgoodies.accmenu_saveState) || $modvars.Zgoodies.accmenu_saveState}{pageaddvar name='javascript' value='javascript/jquery-plugins/accordion-menu/js/jquery.cookie.js'}{/if}
{if isset($modvars.Zgoodies.accmenu_eventType) && $modvars.Zgoodies.accmenu_eventType == 'hover'}{pageaddvar name='javascript' value='javascript/jquery-plugins/accordion-menu/js/jquery.hoverIntent.minified.js'}{/if}
{pageaddvar name='javascript' value='javascript/jquery-plugins/accordion-menu/js/jquery.dcjqaccordion.2.7.min.js'}
{pageaddvar name="stylesheet" value='javascript/jquery-plugins/accordion-menu/css/como.css'}
{if isset($modvars.Zgoodies.accmenu_skin) && $modvars.Zgoodies.accmenu_skin}
    {assign var='accmenucss' value=$modvars.Zgoodies.accmenu_skin}
    {assign var='accmenuclass' value=$modvars.Zgoodies.accmenu_skin|pathinfo:$smarty.const.PATHINFO_FILENAME}
{else}
    {assign var='accmenucss' value='grey.css'}
    {assign var='accmenuclass' value='grey'}
{/if}
{pageaddvar name="stylesheet" value='javascript/jquery-plugins/accordion-menu/css/skins/'|cat:$accmenucss}
<div id="accmenu-{$blockinfo.bid}" class="accmenuwrap {$accmenuclass}">
    {if isset($modvars.Zgoodies.accmenu_autoExpand) && $modvars.Zgoodies.accmenu_autoExpand}{menutree data=$menutree_content id='menu'|cat:$blockinfo.bid class='accordion' ext=true extopt='first,last,single,toExpand,childless,level'}{else}{menutree data=$menutree_content id='menu'|cat:$blockinfo.bid class='accordion'}{/if}
    {if $menutree_editlinks}
    <ul>
        <li><a href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid addurl=1}#menutree_tabs" title="{gt text='Add the current URL as new link in this block'}">{gt text='Add current URL'}</a></li>
        <li><a href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid fromblock=1}" title="{gt text='Edit this block' }">{gt text='Edit this block'}</a></li>
    </ul>
    {/if}
</div>
<script type="text/javascript">
jQuery(document).ready(function() {
    jQuery('#menu{{$blockinfo.bid}}').dcAccordion({ {{if isset($modvars.Zgoodies.accmenu_speed)}}speed: '{{$modvars.Zgoodies.accmenu_speed}}',{{/if}}
        {{if isset($modvars.Zgoodies.accmenu_saveState) && !$modvars.Zgoodies.accmenu_saveState}}saveState: false,{{else}}cookie: 'accmenu{{$blockinfo.bid}}',{{/if}}
        {{if isset($modvars.Zgoodies.accmenu_eventType) && $modvars.Zgoodies.accmenu_eventType == 'hover'}}eventType: 'hover', menuClose: true, hoverDelay: {{if $modvars.Zgoodies.accmenu_hoverDelay}}{{$modvars.Zgoodies.accmenu_hoverDelay}}{{else}}0{{/if}},{{/if}}
        {{if isset($modvars.Zgoodies.accmenu_autoExpand) && $modvars.Zgoodies.accmenu_autoExpand}}autoExpand: true, classExpand: 'toExpand', {{/if}}autoClose: {{if isset($modvars.Zgoodies.accmenu_autoClose) && $modvars.Zgoodies.accmenu_autoClose}}true{{else}}false{{/if}},
        showCount: {{if isset($modvars.Zgoodies.accmenu_showCount) && $modvars.Zgoodies.accmenu_showCount}}true{{else}}false{{/if}}
    });
});
</script>
