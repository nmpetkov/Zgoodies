{gt text='My account' assign='templatetitle'}
{include file='users_user_menu.tpl'}

<ul class="list-group" style="margin: 5px 10px 10px 0;">
{foreach item='accountLink' from=$accountLinks}
    <li class="list-group-item">
        <a href="{$accountLink.url|safetext}">
            <div class="media">
                <div class="media-left">
                {if $modvars.Users.accountdisplaygraphics eq 1}
                    {if isset($accountLink.set) && !empty($accountLink.set)}
                        {assign var="iconset" value=$accountLink.set}
                    {else}
                        {assign var="iconset" value=null}
                    {/if}
                    {img src=$accountLink.icon modname=$accountLink.module set=$iconset width=48 height=48 class="media-object" }
                {/if}
                </div>
                <div class="media-body">
                    <h3><strong>{$accountLink.title|safetext}</strong></h3>
                </div>
            </div>
        </a>
    </li>
{/foreach}
</ul>
