<nav class="navbar navbar-default" role="navigation">
    <div class="collapse navbar-collapse extmenu-horizontal extmenu-{$blockinfo.bid}">
        {menu from=$menuitems item='item' name='extmenu' class='nav navbar-nav'}
            {if $item.name != '' && $item.url != ''}
            <li{if $item.url|replace:$baseurl:'' eq $currenturi|urldecode} class="active"{/if}>
                <a href="{$item.url|safetext}" title="{$item.title}">
                    {if $item.image}<img src="{$item.image}" alt="{$item.title}" />{/if}
                    {$item.name}
                </a>
            </li>
            {else}
            <li></li>
            {/if}
        {/menu}
    </div>
</nav>
