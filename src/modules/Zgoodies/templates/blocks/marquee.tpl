{pageaddvar name='javascript' value='javascript/jquery-plugins/jQuery-Marquee/jquery.marquee.min.js'}
{pageaddvar name="stylesheet" value="modules/Zgoodies/style/style.css"}
{pageaddvarblock}
<script type="text/javascript">
jQuery(document).ready(function () {
    jQuery('.marquee-{{$bid}}').marquee({
        duration: {{$vars.marquee_duration}},
        gap: {{$vars.marquee_gap}},
        delayBeforeStart: {{$vars.marquee_delayBeforeStart}},
        direction: '{{$vars.marquee_direction}}',
        duplicated: {{if $vars.marquee_duplicated}}true{{else}}false{{/if}},
        pauseOnHover: {{if $vars.marquee_pauseOnHover}}true{{else}}false{{/if}},
        pauseOnCycle: {{if $vars.marquee_pauseOnCycle}}true{{else}}false{{/if}}
    });
 });
</script>
{/pageaddvarblock}
<div class="marquee marquee-{$bid}">
    {$vars.marquee_content_lang|safehtml}
</div>
