<!DOCTYPE HTML>
<html lang="{lang}">
    <head>
        <meta charset="utf-8" />
        <title>{pagegetvar name='title'}</title>
        <meta name="description" content="{$metatags.description}" />
        <meta name="keywords" content="{$metatags.keywords}" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable = yes" />

        {servergetvar name='SERVER_NAME' default='' assign='server_name'}
        {assign var='bootstrappath' value=$themepath|cat:'/bootstrap'}
        {assign var='fontawesomepath' value=$themepath|cat:'/font-awesome'}
        {if $server_name == $alt_domain}{assign var='color_set' value=$alt_colorset}{else}{assign var='color_set' value=$colorset}{/if}
        <link href="{$bootstrappath}/css/bootstrap{if $color_set != 'default'}-{$color_set}{/if}.css" rel="stylesheet" />{* colors *}
        <link href="{$bootstrappath}/css/overrides.css" rel="stylesheet" />
        <link href="{$fontawesomepath}/css/font-awesome.min.css" rel="stylesheet" />

        {pageaddvar name='javascript' value='jquery-1.11.2'}
        {pageaddvar name='javascript' value=$themepath|cat:'/javascript/theme_mobilebootstrap.js'}

        {* Scroll to top start https://github.com/markgoodyear/scrollup ==> *}{pageaddvar name='javascript' value=$themepath|cat:'/javascript/scrollup/jquery.scrollUp.min.js'}
        {pageaddvar name="stylesheet" value=$themepath|cat:'/javascript/scrollup/css/themes/image.css'}
        {pageaddvarblock}
<script type="text/javascript">
jQuery(document).ready(function () {
    jQuery.scrollUp({scrollName: 'scrollUp',scrollDistance: 100, scrollFrom: 'top', scrollText: '', scrollTitle: '{{gt text='Scroll to top'}}', scrollImg: true});
});
</script>
        {/pageaddvarblock}{* Scroll to top end *}

        {if $server_name == $alt_domain}{assign var='fav_icon_ico' value=$alt_favicon_ico}{else}{assign var='fav_icon_ico' value=$favicon_ico}{/if}
        {if $fav_icon_ico}<link rel="shortcut icon" href="{$fav_icon_ico}" type="image/x-icon" />{/if}
        {if $server_name == $alt_domain}{assign var='fav_icon_png' value=$alt_favicon_png}{else}{assign var='fav_icon_png' value=$favicon_png}{/if}
        <link rel="icon" type="image/png" href="/{$fav_icon_png}">
        {if file_exists($themepath|cat:'/templates/includes/headtag_end.tpl')}{* specific include, for example google analitics code, ajaxheader*}
            {include file='includes/'|cat:'headtag_end.tpl'}
        {/if}
    </head>
    {pagegetvar name='bodyonloadfn' assign='bodyonloadfn'}
    <body{if $bodyonloadfn} onload="{$bodyonloadfn}"{/if}>
    <div id="theme_page_container">
        {if file_exists($themepath|cat:'/templates/includes/topmenu_before.tpl')}{* specific include, for example second menu*}
            {include file='includes/'|cat:'topmenu_before.tpl'}
            {assign var='navbar_type' value='default'}
        {else}
            {assign var='navbar_type' value='fixed-top'}
        {/if}

        {blockposition name=menumobile assign='bl_menumobile'}
        {if empty($bl_menumobile) || $pagetype == 'admin'}

        {if $server_name == $alt_domain}{assign var='class_navbar' value=$alt_classnavbar}{else}{assign var='class_navbar' value=$classnavbar}{/if}
        <div class="navbar navbar-{$navbar_type} {$class_navbar}" id="topmenu">{* navbar-default / navbar-inverse *}
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarmain" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">{gt text='Toggle navigation'}</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                {if $server_name == $alt_domain}{assign var='logo_mobile' value=$alt_logomobile}{else}{assign var='logo_mobile' value=$logomobile}{/if}
                {if $logo_mobile}
                    <a class="navbar-brand" href="{homepage}" title="{$modvars.ZConfig.sitename}"><img class="img-responsive" alt="" src="images/{$logo_mobile}" /></a>
                {else}
                    <a class="navbar-brand" href="{homepage}" title="{$modvars.ZConfig.slogan}">{$modvars.ZConfig.sitename}</a>
                {/if}
            </div>
            <div class="collapse navbar-collapse" id="navbarmain">
                <ul class="nav navbar-nav" id="nav">
                {if $pagetype == 'admin'}
                    <li><a href="{homepage}">{gt text='Home'}</a></li>
                    {checkpermission component='Settings::' instance='::' level='ACCESS_ADMIN' assign='okAccess'}
                    {if $okAccess}
                    <li><a href="{modurl modname='Settings' type='admin' func='main'}">{gt text="Settings"}</a></li>
                    {/if}
                    {checkpermission component='Extensions::' instance='::' level='ACCESS_ADMIN' assign='okAccess'}
                    {if $okAccess}
                    <li><a href="{modurl modname='Extensions' type='admin' func='main'}">{gt text="Extensions"}</a></li>
                    {/if}
                    {checkpermission component='Blocks::' instance='::' level='ACCESS_EDIT' assign='okAccess'}
                    {if $okAccess}
                    <li><a href="{modurl modname='Blocks' type='admin' func='main'}">{gt text="Blocks"}</a></li>
                    {/if}
                    {checkpermission component='Users::' instance='::' level='ACCESS_MODERATE' assign='okAccess'}
                    {if $okAccess}
                    <li><a href="{modurl modname='Users' type='admin' func='main'}">{gt text="Users"}</a></li>
                    {/if}
                    {checkpermission component='Groups::' instance='::' level='ACCESS_EDIT' assign='okAccess'}
                    {if $okAccess}
                    <li><a href="{modurl modname='Groups' type='admin' func='main'}">{gt text="Groups"}</a></li>
                    {/if}
                    {checkpermission component='Permissions::' instance='::' level='ACCESS_ADMIN' assign='okAccess'}
                    {if $okAccess}
                    <li><a href="{modurl modname='Permissions' type='admin' func='main'}">{gt text="Permission rules"}</a></li>
                    {/if}
                    {checkpermission component='Theme::' instance='::' level='ACCESS_EDIT' assign='okAccess'}
                    {if $okAccess}
                    <li><a href="{modurl modname='Theme' type='admin' func='main'}">{gt text="Themes"}</a></li>
                    {if $modvars.Theme.enable_mobile_theme}
                    <li><a href="{modurl modname='Theme' type='user' func='disableMobileTheme'}" title="{gt text='Full site version'}">{gt text='Full version'}</a></li>
                    {/if}
                    {/if}
                {else}
                    {* custom menu - if file exists! *}
                    {if $server_name == $alt_domain}{assign var='topmenu_custom' value=$alt_topmenucustom}{else}{assign var='topmenu_custom' value=$topmenucustom}{/if}
                    {if file_exists($themepath|cat:'/templates/includes/'|cat:$topmenu_custom)}
                        {include file='includes/'|cat:$topmenu_custom}
                    {else}
                        {include file='includes/topmenu.tpl'}
                    {/if}
                {/if}
                {if file_exists($themepath|cat:'/templates/includes/topmenu_add.tpl')}
                    {include file='includes/topmenu_add.tpl'}
                {else}
                    {if $coredata.logged_in}
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-user"></i> {user|ucwords}{*userwelcome|ucwords*}<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                            {checkpermissionblock component='.*' instance='.*' level=ACCESS_ADMIN}
                                <li><a href="{modurl modname='Admin' type='admin' func='adminpanel'}">{gt text='Administration'}</a></li>
                                {/checkpermissionblock}
                                <li><a href="{modurl modname='Users' type='user' func='main'}">{gt text="My account"}</a></li>			   
                                <li><a href="{modurl modname='Profile' type='user' func='view'}">{gt text="My profile"}</a></li>				
                                <li class="divider"></li>
                                <li><a href="{modurl modname='Users' type='user' func='logout'}" >{gt text="Sign out"}</a></li>
                            </ul>
                        </li>
                    {/if}
                {/if}
                </ul>
            </div><!--/navbarmain -->
        </div>

        {else}
            {$bl_menumobile}
        {/if}

        {if file_exists($themepath|cat:'/templates/includes/topmenu_after.tpl')}{* specific include, for example second menu*}
            {include file='includes/'|cat:'topmenu_after.tpl'}
        {/if}

        {blockposition name=menumobile}

        <div class="container-fluid">
            <div class="row">
                {if $pagetype eq 'admin'}
                    <div class="col-md-12">
                        {$maincontent}
                    </div>
                {elseif $pagetype eq 'home'}
                    {blockposition name=left assign='bl_left'}
                    {blockposition name=right assign='bl_right'}
                    {if empty($bl_left) && empty($bl_right)}
                        <div class="col-md-12">
                            {blockposition name=center}
                            {blockposition name=mobile}
                            {$maincontent}
                        </div>
                    {else}
                        <div class="col-md-9">
                            {blockposition name=center}
                            {blockposition name=mobile}
                            {$maincontent}
                        </div>
                        <div class="col-md-3">
                            <div class="well sidebar-nav">
                                {$bl_left}
                                {$bl_right}
                            </div>
                        </div>
                    {/if}
                {else}
                    {blockposition name=left assign='bl_left'}
                    {if empty($bl_left)}
                        <div class="col-md-12">
                            {$maincontent}
                        </div>
                    {else}
                        <div class="col-md-9">
                            {$maincontent}
                        </div>
                        <div class="col-md-3">
                            <div class="well sidebar-nav">
                                {$bl_left}
                            </div>
                        </div>
                    {/if}
                {/if}
            </div><!--/row-fluid-->
        </div><!--/container-fluid-->

        {if $server_name == $alt_domain}{assign var='footer_type' value=$alt_footertype}{else}{assign var='footer_type' value=$footertype}{/if}
        {if $footer_type}
        <footer class="well">
            <div class="row">
                <div class="col-md-6">
                    <div class="pull-left">
                        &copy; {$modvars.ZConfig.sitename}
                        {if $modvars.Theme.enable_mobile_theme}
                            &nbsp;|&nbsp;<a href="{modurl modname='Theme' type='user' func='disableMobileTheme'}">{gt text='Full site version'}</a>
                        {/if}
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="pull-right">
                        <a href="http://www.cmstory.com" title="{gt text='Design'} CoMo">CoMo</a>
                    </div>
                </div>
            </div>
        </footer>
        {/if}

    </div>
        {* javascripts are here to load faster, css are here to take precedence *}
        <script src="{$bootstrappath}/js/bootstrap.min.js"></script>

        {if $server_name == $alt_domain}{assign var='site_style' value=$alt_sitestyle}{else}{assign var='site_style' value=$sitestyle}{/if}
        {if $site_style && file_exists($themepath|cat:'/'|cat:$site_style)}{* typically parts from main site style and overrides *}
            {pageaddvar name="stylesheet" value=$themepath|cat:"/"|cat:$site_style}
        {/if}
    </body>
</html>
