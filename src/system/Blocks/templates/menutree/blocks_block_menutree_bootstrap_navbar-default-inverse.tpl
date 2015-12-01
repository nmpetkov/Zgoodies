        <div class="navbar navbar-default navbar-inverse" id="top">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarmain" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="{homepage}" title="{$modvars.ZConfig.slogan}">{$modvars.ZConfig.sitename}</a>
            </div>
            <div class="collapse navbar-collapse" id="navbarmain">
                {menutree data=$menutree_content id='menu'|cat:$blockinfo.bid class='nav navbar-nav' ext=true}
                {if $menutree_editlinks}
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="fa fa-plus" href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid addurl=1}#menutree_tabs" title="{gt text='Add the current URL as new link in this block'}"></a></li>
                    <li><a class="fa fa-pencil" href="{modurl modname=Blocks type=admin func=modify bid=$blockinfo.bid fromblock=1}" title="{gt text='Edit this block'}"></a></li>
                </ul>
                {/if}
            </div>
        </div>
