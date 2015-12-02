<fieldset>
    <legend>{gt text='Block display'}</legend>
    <div class="z-formrow">
        <label for="block_template">{gt text="Template to use"}</label>
        <select id="block_template" name="block_template">
            <option value="slider.tpl"{if $vars.block_template eq 'slider.tpl'} selected="selected"{/if}>slider.tpl</option>
            {assign var='templatealternate' value='slider-'|cat:$bid|cat:'.tpl'}
            <option value="{$templatealternate}"{if $vars.block_template eq $templatealternate} selected="selected"{/if}>{$templatealternate}</option>
        </select>
    </div>
    <div class="z-formrow">
        <label for="block_wrap">{gt text="Wrap block"}</label>
        <select id="block_wrap" name="block_wrap">
        <option value="1"{if $vars.block_wrap} selected="selected"{/if}>{gt text="Yes" domain='zikula'} ({' &lt;div class="z-block z-block-nn"&gt;...&lt;/div&gt;'|htmlentities})</option>
        <option value="0"{if !$vars.block_wrap} selected="selected"{/if}>{gt text="No" domain='zikula'} ({gt text="direct display"})</option>
        </select>
    </div>
    <fieldset>
        <legend>{gt text="Block title (can be blank, HTML allowed)"}</legend>
        {foreach from=$languages key=code item=name}
        <div class="z-formrow">
            <label for="block_title_{$code}">{$name}</label>
            <input id="block_title_{$code}" type="text" name="block_title[{$code}]" value="{$vars.block_title.$code|safehtml}" />
        </div>
        {/foreach}
    </fieldset>
</fieldset>
<fieldset>
    <legend>{gt text='Block content'}</legend>
    <div class="z-formrow">
        <label for="slider_content_editor">{gt text='Load visual editor'}</label>
        <div>
            <input type="checkbox" id="slider_content_editor" name="slider_content_editor"  value="1" {if $vars.slider_content_editor} checked="checked"{/if} />
            <p class="z-formnote z-sub">{gt text='When checked, visual editor will load on next block edit.'}</p>
        </div>
    </div>
    <fieldset>
        <legend>{gt text="Slider content (HTML allowed)"}</legend>
        <div class="z-informationmsg z-formnote nl-round">
            {gt text="One or more valid images (image tags). They are source for slides."}<br />
            {gt text="Title attribute is optional, and if exists - will show title on the respective slide."}
        </div>
        {foreach from=$languages key=code item=name}
        <div class="z-formrow">
            <label for="slider_content_{$code}">{$name}</label>
            <textarea id="slider_content_{$code}" name="slider_content[{$code}]" cols="50" rows="4"{if !$vars.slider_content_editor} class="noeditor"{/if}>{$vars.slider_content.$code|safehtml}</textarea>
        </div>
        {/foreach}
    </fieldset>
        <div class="z-formrow">
        <label for="slider_theme">{gt text="Nivo Slider Theme"}</label>
        <select id="slider_theme" name="slider_theme">
            {foreach from=$pluginthemes item=plugintheme}
            <option value="{$plugintheme}"{if $vars.slider_theme eq $plugintheme} selected="selected"{/if}>{$plugintheme}</option>
            {/foreach}
        </select>
    </div>
    <div class="z-formrow">
        <label for="slider_effect">{gt text="Effect"}</label>
        <input id="slider_effect" type="text" name="slider_effect" value="{$vars.slider_effect|safetext}" />
        <div class="z-informationmsg z-formnote nl-round">{gt text="One or more keywords (comma delimited list). Allowed: "}<br />
            {foreach from=$plugineffects item=plugineffect name='plugineffects'}
                {$plugineffect}{if !$smarty.foreach.plugineffects.last}, {/if}
            {/foreach}
        </div>
    </div>
    <div class="z-formrow">
        <label for="slider_slices">{gt text='Slices (for slice animations)'}</label>
        <input id="slider_slices" type="text" name="slider_slices" value="{$vars.slider_slices|safetext}" />
    </div>
    <div class="z-formrow">
        <label for="slider_boxCols">{gt text='Box columns (for box animations)'}</label>
        <input id="slider_boxCols" type="text" name="slider_boxCols" value="{$vars.slider_boxCols|safetext}" />
    </div>
    <div class="z-formrow">
        <label for="slider_boxRows">{gt text='Box rows (for box animations)'}</label>
        <input id="slider_boxRows" type="text" name="slider_boxRows" value="{$vars.slider_boxRows|safetext}" />
    </div>
    <div class="z-formrow">
        <label for="slider_animSpeed">{gt text='Slide transition speed (ms)'}</label>
        <input id="slider_animSpeed" type="text" name="slider_animSpeed" value="{$vars.slider_animSpeed|safetext}" />
    </div>
    <div class="z-formrow">
        <label for="slider_pauseTime">{gt text='How long each slide will show (ms)'}</label>
        <input id="slider_pauseTime" type="text" name="slider_pauseTime" value="{$vars.slider_pauseTime|safetext}" />
    </div>
    <div class="z-formrow">
        <label for="slider_startSlide">{gt text='Starting Slide (0 is first)'}</label>
        <input id="slider_startSlide" type="text" name="slider_startSlide" value="{$vars.slider_startSlide|safetext}" />
    </div>
    <div class="z-formrow">
        <label for="slider_randomStart">{gt text='Random start'}</label>
        <select id="slider_randomStart" name="slider_randomStart">
            <option value="1"{if $vars.slider_randomStart} selected="selected"{/if}>{gt text="Yes" domain='zikula'}</option>
            <option value="0"{if !$vars.slider_randomStart} selected="selected"{/if}>{gt text="No" domain='zikula'}</option>
        </select>
    </div>
    <div class="z-formrow">
        <label for="slider_directionNav">{gt text='Next & Prev navigation'}</label>
        <select id="slider_directionNav" name="slider_directionNav">
            <option value="1"{if $vars.slider_directionNav} selected="selected"{/if}>{gt text="Yes" domain='zikula'}</option>
            <option value="0"{if !$vars.slider_directionNav} selected="selected"{/if}>{gt text="No" domain='zikula'}</option>
        </select>
    </div>
    <div class="z-formrow">
        <label for="slider_controlNav">{gt text='1,2,3... navigation'}</label>
        <select id="slider_controlNav" name="slider_controlNav">
            <option value="1"{if $vars.slider_controlNav} selected="selected"{/if}>{gt text="Yes" domain='zikula'}</option>
            <option value="0"{if !$vars.slider_controlNav} selected="selected"{/if}>{gt text="No" domain='zikula'}</option>
        </select>
    </div>
    <div class="z-formrow">
        <label for="slider_controlNavThumbs">{gt text='Thumbnails for navigation'}</label>
        <select id="slider_controlNavThumbs" name="slider_controlNavThumbs">
            <option value="1"{if $vars.slider_controlNavThumbs} selected="selected"{/if}>{gt text="Yes" domain='zikula'}</option>
            <option value="0"{if !$vars.slider_controlNavThumbs} selected="selected"{/if}>{gt text="No" domain='zikula'}</option>
        </select>
    </div>
    <div class="z-formrow">
        <label for="slider_pauseOnHover">{gt text='Stop on hover'}</label>
        <select id="slider_pauseOnHover" name="slider_pauseOnHover">
            <option value="1"{if $vars.slider_pauseOnHover} selected="selected"{/if}>{gt text="Yes" domain='zikula'}</option>
            <option value="0"{if !$vars.slider_pauseOnHover} selected="selected"{/if}>{gt text="No" domain='zikula'}</option>
        </select>
    </div>
    <div class="z-formrow">
        <label for="slider_manualAdvance">{gt text='Force manual transitions'}</label>
        <select id="slider_manualAdvance" name="slider_manualAdvance">
            <option value="1"{if $vars.slider_manualAdvance} selected="selected"{/if}>{gt text="Yes" domain='zikula'}</option>
            <option value="0"{if !$vars.slider_manualAdvance} selected="selected"{/if}>{gt text="No" domain='zikula'}</option>
        </select>
    </div>
</fieldset>
{notifydisplayhooks eventname='blocks.ui_hooks.htmlblock.content.form_edit' id=$bid}
