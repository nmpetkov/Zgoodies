{* http://www.komposta.net/article/navgoco *}
{if !isset($modvars.Zgoodies.navgoco_save) || $modvars.Zgoodies.navgoco_save}{pageaddvar name='javascript' value='javascript/jquery-plugins/navgoco/jquery.cookie.js'}{/if}
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
    jQuery('#menu{{$blockinfo.bid}}').navgoco({ {{if isset($modvars.Zgoodies.navgoco_caretHtml) && $modvars.Zgoodies.navgoco_caretHtml}}caretHtml: '{{$modvars.Zgoodies.navgoco_caretHtml}}',{{/if}} {{if isset($modvars.Zgoodies.navgoco_openClass) && $modvars.Zgoodies.navgoco_openClass}}openClass: '{{$modvars.Zgoodies.navgoco_openClass}}',{{/if}}
        {{if isset($modvars.Zgoodies.navgoco_save) && !$modvars.Zgoodies.navgoco_save}}save: false,{{else}}cookie: {name: 'navgoco{{$blockinfo.bid}}', expires: false, path: '/'},{{/if}}
        slide: {duration: {{if isset($modvars.Zgoodies.navgoco_slideduration) && $modvars.Zgoodies.navgoco_slideduration}}{{$modvars.Zgoodies.navgoco_slideduration}}{{else}}400{{/if}}, easing: '{{if isset($modvars.Zgoodies.navgoco_slideeasing) && $modvars.Zgoodies.navgoco_slideeasing}}{{$modvars.Zgoodies.navgoco_slideeasing}}{{else}}swing{{/if}}'},
        accordion: {{if isset($modvars.Zgoodies.navgoco_accordion) && $modvars.Zgoodies.navgoco_accordion}}true{{else}}false{{/if}}
    });
});
</script>
