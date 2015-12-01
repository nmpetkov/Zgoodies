    {menutree data=$menutree_content id='menu'|cat:$blockinfo.bid class='nav navbar-nav' ext=true}
    {if $menutree_editlinks}
    <ul class="nav navbar-nav navbar-right">
        <li><a class="fa fa-plus" href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid addurl=1}#menutree_tabs" title="{gt text='Add the current URL as new link in this block'}"></a></li>
        <li><a class="fa fa-pencil" href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid fromblock=1}" title="{gt text='Edit this block'}"></a></li>
    </ul>
    {/if}
