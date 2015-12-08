{*ajaxheader modname='zgoodies' filename='zgoodies_admin_display.js' nobehaviour=true noscriptaculous=true effects=true*}
{adminheader}
<div class="z-admin-content-pagetitle">
    {icon type="config" size="small"}
    <h3>{gt text='Module settings'}</h3>
</div>

<form class="z-form" action="{modurl modname='Zgoodies' type='admin' func='updateconfig'}" method="post" enctype="application/x-www-form-urlencoded">
    <input type="hidden" name="csrftoken" value="{insert name='csrftoken'}" />
    <fieldset>
        <legend>{gt text='jQuery Navgoco Menu'}</legend>
        <div class="z-informationmsg z-formnote">
            {gt text='Project'}: <a href="https://github.com/tefra/navgoco">GitHub</a>, <a href="http://www.komposta.net/article/navgoco">http://www.komposta.net/article/navgoco</a>
        </div>
        <div class="z-formrow">
            <label for="navgoco_save">{gt text="Save menu state"}</label>
            <select id="navgoco_save" name="navgoco_save" size="1">
                <option value="1"{if $vars.navgoco_save == "1"} selected="selected"{/if}>{gt text="Yes (uses cookies)"}</option>
                <option value="0"{if $vars.navgoco_save == "0"} selected="selected"{/if}>{gt text="No"}</option>
            </select>
        </div>
        <div class="z-formrow">
            <label for="navgoco_accordion">{gt text="Enable accordion mode"}</label>
            <select id="navgoco_accordion" name="navgoco_accordion" size="1">
                <option value="0"{if $vars.navgoco_accordion == "0"} selected="selected"{/if}>{gt text="No"}</option>
                <option value="1"{if $vars.navgoco_accordion == "1"} selected="selected"{/if}>{gt text="Yes"}</option>
            </select>
        </div>
        <div class="z-formrow">
            <label for="navgoco_caretHtml">{gt text='Caret HTML'}</label>
            <input id="navgoco_caretHtml" type="text" name="navgoco_caretHtml" value="{$vars.navgoco_caretHtml|safetext}" />
            <div class="z-sub z-formnote">
                {gt text='Raw html to inserted in the caret markup of the parent links.'}
            </div>
        </div>
        <div class="z-formrow">
            <label for="navgoco_openClass">{gt text='Open class'}</label>
            <input id="navgoco_openClass" type="text" name="navgoco_openClass" value="{$vars.navgoco_openClass|safetext}" />
            <div class="z-sub z-formnote">
                {gt text='CSS class to be added in open parent li.'}
            </div>
        </div>
        <div class="z-formrow">
            <label for="navgoco_slideduration">{gt text='Slide duration'}</label>
            <input id="navgoco_slideduration" type="text" name="navgoco_slideduration" value="{$vars.navgoco_slideduration|safetext}" />
            <div class="z-sub z-formnote">
                {gt text='Slide duration in milliseconds, default 400.'}
            </div>
        </div>
        <div class="z-formrow">
            <label for="navgoco_slideeasing">{gt text='Slide easing function'}</label>
            <input id="navgoco_slideeasing" type="text" name="navgoco_slideeasing" value="{$vars.navgoco_slideeasing|safetext}" />
            <div class="z-sub z-formnote">
                {gt text='Slide easing function (linear|swing) for the transition, default is swing.'}
            </div>
        </div>
    </fieldset>

    <fieldset>
        <legend>{gt text='jQuery Vertical Accordion Menu'}</legend>
        <div class="z-informationmsg z-formnote">
            {gt text='Project'}: <a href="http://www.designchemical.com/lab/jquery-vertical-accordion-menu-plugin/">http://www.designchemical.com/lab/jquery-vertical-accordion-menu-plugin/</a>
        </div>
        <div class="z-formrow">
            <label for="accmenu_skin">{gt text="Skin"}</label>
            <select id="accmenu_skin" name="accmenu_skin">
                {foreach from=$pluginskins item=pluginskin}
                <option value="{$pluginskin}"{if $vars.accmenu_skin eq $pluginskin} selected="selected"{/if}>{$pluginskin}</option>
                {/foreach}
            </select>
        </div>
        <div class="z-formrow">
            <label for="accmenu_saveState">{gt text="Save menu state"}</label>
            <select id="accmenu_saveState" name="accmenu_saveState" size="1">
                <option value="1"{if $vars.accmenu_saveState == "1"} selected="selected"{/if}>{gt text="Yes (uses cookies)"}</option>
                <option value="0"{if $vars.accmenu_saveState == "0"} selected="selected"{/if}>{gt text="No"}</option>
            </select>
        </div>
        <div class="z-formrow">
            <label for="accmenu_autoClose">{gt text="Auto close"}</label>
            <select id="accmenu_autoClose" name="accmenu_autoClose" size="1">
                <option value="1"{if $vars.accmenu_autoClose == "1"} selected="selected"{/if}>{gt text="Yes (only one sub-menu open at any time)"}</option>
                <option value="0"{if $vars.accmenu_autoClose == "0"} selected="selected"{/if}>{gt text="No"}</option>
            </select>
        </div>
        <div class="z-formrow">
            <label for="accmenu_autoExpand">{gt text="Auto expand"}</label>
            <select id="accmenu_autoExpand" name="accmenu_autoExpand" size="1">
                <option value="1"{if $vars.accmenu_autoExpand == "1"} selected="selected"{/if}>{gt text="Yes (show number of links under each parent menu item)"}</option>
                <option value="0"{if $vars.accmenu_autoExpand == "0"} selected="selected"{/if}>{gt text="No"}</option>
            </select>
        </div>
        <div class="z-formrow">
            <label for="accmenu_showCount">{gt text="Show count"}</label>
            <select id="accmenu_showCount" name="accmenu_showCount" size="1">
                <option value="1"{if $vars.accmenu_showCount == "1"} selected="selected"{/if}>{gt text="Yes"}</option>
                <option value="0"{if $vars.accmenu_showCount == "0"} selected="selected"{/if}>{gt text="No"}</option>
            </select>
        </div>
        <div class="z-formrow">
            <label for="accmenu_hoverDelay">{gt text='Speed'}</label>
            <select id="accmenu_speed" name="accmenu_speed" size="1">
                <option value="slow"{if $vars.accmenu_speed == "slow"} selected="selected"{/if}>{gt text="Slow"}</option>
                <option value="fast"{if $vars.accmenu_speed == "fast"} selected="selected"{/if}>{gt text="Fast"}</option>
            </select>
        </div>
        <div class="z-formrow">
            <label for="accmenu_eventType">{gt text="Event for activating menu"}</label>
            <select id="accmenu_eventType" name="accmenu_eventType" size="1">
                <option value="click"{if $vars.accmenu_eventType == "click"} selected="selected"{/if}>{gt text="Click"}</option>
                <option value="hover"{if $vars.accmenu_eventType == "hover"} selected="selected"{/if}>{gt text="Hover"}</option>
            </select>
        </div>
        <div class="z-formrow">
            <label for="accmenu_hoverDelay">{gt text='Hover delay'}</label>
            <input id="accmenu_hoverDelay" type="text" name="accmenu_hoverDelay" value="{$vars.accmenu_hoverDelay|safetext}" />
            <div class="z-sub z-formnote">
                {gt text='Hover delay in milliseconds, default 300.'}
            </div>
        </div>
    </fieldset>

    <div class="z-buttons z-formbuttons">
        {button src="button_ok.png" set="icons/extrasmall" __alt="Save" __title="Save" __text="Save"}
        <a href="{modurl modname="Zgoodies" type="admin" func='main'}" title="{gt text="Cancel"}">{img modname=core src="button_cancel.png" set="icons/extrasmall" __alt="Cancel" __title="Cancel"} {gt text="Cancel"}</a>
    </div>
</form>
{adminfooter}