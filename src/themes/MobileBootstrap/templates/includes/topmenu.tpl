<li><a href="{homepage}">{gt text='Home'}</a></li>
{if !$coredata.logged_in}
    <li><a href="{modurl modname='Users' type='user' func='main'}">{gt text='My account'}</a></li>
{/if}
<li><a href="{modurl modname='Search' type='user' func='main'}">{gt text='Site search'}</a></li>
<li><a href="{modurl modname='Formicula' type='user' func='main'}">{gt text='Contact'}</a></li>
{if $lang != 'bg'}<li><a href="{langchange lang='bg'}">Bulgarian</a></li>{/if}
{if $lang != 'en'}<li><a href="{langchange lang='en'}">English</a></li>{/if}
{if $modvars.Theme.enable_mobile_theme}
<li><a href="{modurl modname='Theme' type='user' func='disableMobileTheme'}" title="{gt text='Full site version'}">{gt text='Full version'}</a></li>
{/if}
