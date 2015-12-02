<fieldset>
    <legend>{gt text='Block display'}</legend>
    <div class="z-formrow">
        <label for="block_template">{gt text="Template to use"}</label>
        <select id="block_template" name="block_template">
            <option value="marquee.tpl"{if $vars.block_template eq 'marquee.tpl'} selected="selected"{/if}>marquee.tpl</option>
            {assign var='templatealternate' value='marquee-'|cat:$bid|cat:'.tpl'}
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
        <label for="marquee_content_editor">{gt text='Load visual editor'}</label>
        <div>
            <input type="checkbox" id="marquee_content_editor" name="marquee_content_editor"  value="1" {if $vars.marquee_content_editor} checked="checked"{/if} />
            <p class="z-formnote z-sub">{gt text='When checked, visual editor will load on next block edit.'}</p>
        </div>
    </div>
    <fieldset>
        <legend>{gt text="Marquee content (HTML allowed)"}</legend>
        {foreach from=$languages key=code item=name}
        <div class="z-formrow">
            <label for="marquee_content_{$code}">{$name}</label>
            <textarea id="marquee_content_{$code}" name="marquee_content[{$code}]" cols="50" rows="4"{if !$vars.marquee_content_editor} class="noeditor"{/if}>{$vars.marquee_content.$code|safetext}</textarea>
        </div>
        {/foreach}
    </fieldset>
    <div class="z-formrow">
        <label for="marquee_duration">{gt text='Marquee duration (ms)'}</label>
        <input id="marquee_duration" type="text" name="marquee_duration" value="{$vars.marquee_duration|safetext}" />
    </div>
    <div class="z-formrow">
        <label for="marquee_gap">{gt text='Marquee gap (cahrs)'}</label>
        <input id="marquee_gap" type="text" name="marquee_gap" value="{$vars.marquee_gap|safetext}" />
    </div>
    <div class="z-formrow">
        <label for="marquee_delayBeforeStart">{gt text='Marquee delay before start (ms)'}</label>
        <input id="marquee_delayBeforeStart" type="text" name="marquee_delayBeforeStart" value="{$vars.marquee_delayBeforeStart|safetext}" />
    </div>
    <div class="z-formrow">
        <label for="marquee_direction">{gt text="Marquee direction"}</label>
        <select id="marquee_direction" name="marquee_direction">
            <option value="left"{if $vars.marquee_direction eq 'left'} selected="selected"{/if}>{gt text="left"}</option>
            <option value="right"{if $vars.marquee_direction eq 'right'} selected="selected"{/if}>{gt text="right"}</option>
            <option value="up"{if $vars.marquee_direction eq 'up'} selected="selected"{/if}>{gt text="up"}</option>
            <option value="down"{if $vars.marquee_direction eq 'down'} selected="selected"{/if}>{gt text="down"}</option>
        </select>
    </div>
    <div class="z-formrow">
        <label for="marquee_duplicated">{gt text="Marquee duplicated"}</label>
        <select id="marquee_duplicated" name="marquee_duplicated">
            <option value="1"{if $vars.marquee_duplicated} selected="selected"{/if}>{gt text="Yes" domain='zikula'}</option>
            <option value="0"{if !$vars.marquee_duplicated} selected="selected"{/if}>{gt text="No" domain='zikula'}</option>
        </select>
    </div>
    <div class="z-formrow">
        <label for="marquee_pauseOnHover">{gt text="Pause on hover"}</label>
        <select id="marquee_pauseOnHover" name="marquee_pauseOnHover">
            <option value="1"{if $vars.marquee_pauseOnHover} selected="selected"{/if}>{gt text="Yes" domain='zikula'}</option>
            <option value="0"{if !$vars.marquee_pauseOnHover} selected="selected"{/if}>{gt text="No" domain='zikula'}</option>
        </select>
    </div>
    <div class="z-formrow">
        <label for="marquee_pauseOnCycle">{gt text="Pause on cycle"}</label>
        <select id="marquee_pauseOnCycle" name="marquee_pauseOnCycle">
            <option value="1"{if $vars.marquee_pauseOnCycle} selected="selected"{/if}>{gt text="Yes" domain='zikula'}</option>
            <option value="0"{if !$vars.marquee_pauseOnCycle} selected="selected"{/if}>{gt text="No" domain='zikula'}</option>
        </select>
    </div>
</fieldset>
{notifydisplayhooks eventname='blocks.ui_hooks.htmlblock.content.form_edit' id=$bid}
