{$menu}
<div id="z-admincontainer" class="z-admin-content">
    <h2>{$category.name|safetext}</h2>
    <div class="z-admincategorydescription">{$category.description|safetext}</div>

    {if !empty($adminlinks)}
        <ul class="list-group" style="margin: 5px 10px 10px 0;">
        {foreach from=$adminlinks name=adminlink item=adminlink}
            <li class="list-group-item">
                <a title="{$adminlink.menutexttitle}" href="{$adminlink.menutexturl|safetext}">
                    <div class="media">
                        <div class="media-left">
                        {if $modvars.Admin.admingraphic eq 1}
                            <img class="media-object" src="{$adminlink.adminicon}" title="{$adminlink.menutext|safetext}" alt="{$adminlink.menutext|safetext}" />
                        {/if}
                        </div>
                        <div class="media-body">
                            <h3><strong>{$adminlink.menutext|safetext}</strong></h3>
                            {$adminlink.menutexttitle|safetext}
                        </div>
                    </div>
                </a>
            </li>
        {/foreach}
        </ul>
    {else}
        <p class="z-bold z-center">{gt text="There are currently no modules in this category."}</p>
    {/if}
</div>

<div class="z-admin-coreversion z-right">Zikula {$coredata.version_num}</div>

