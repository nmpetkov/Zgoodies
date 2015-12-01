{pageaddvar name='javascript' value='javascript/jquery-plugins/Nivo-Slider/jquery.nivo.slider.pack.js'}
{pageaddvar name="stylesheet" value="javascript/jquery-plugins/Nivo-Slider/nivo-slider.css"}
{pageaddvar name="stylesheet" value="javascript/jquery-plugins/Nivo-Slider/themes/"|cat:$vars.slider_theme|cat:"/"|cat:$vars.slider_theme|cat:".css"}
{pageaddvar name="stylesheet" value="modules/Zgoodies/style/style.css"}
{pageaddvarblock}
<script type="text/javascript">
jQuery(window).load(function() {
    jQuery('#nivoslider-{{$bid}}').nivoSlider({
        effect: '{{$vars.slider_effect}}',
        {{if $vars.slider_slices != 15}}slices: {{$vars.slider_slices}},{{/if}} {{if $vars.slider_boxCols != 8}}boxCols: {{$vars.slider_boxCols}},{{/if}} {{if $vars.slider_boxRows != 4}}boxRows: {{$vars.slider_boxRows}},{{/if}}
        animSpeed: {{$vars.slider_animSpeed}},
        pauseTime: {{$vars.slider_pauseTime}},
        {{if $vars.slider_startSlide != 0}}startSlide: {{$vars.slider_startSlide}},{{/if}}
        {{if !$vars.slider_directionNav}}directionNav: false,{{/if}} {{if !$vars.slider_controlNav}}controlNav: false,{{/if}} {{if $vars.slider_controlNavThumbs}}controlNavThumbs: true,{{/if}}
        {{if !$vars.slider_pauseOnHover}}pauseOnHover: false,{{/if}} {{if $vars.slider_manualAdvance}}manualAdvance: true,{{/if}}
        {{if $vars.slider_randomStart}}randomStart: true,{{/if}} prevText: '{{gt text='Prev'}}', nextText: '{{gt text='Next'}}'
    });
});
</script>
{/pageaddvarblock}
<div class="slider-wrapper theme-{$vars.slider_theme}">
    <div class="ribbon"></div>
    <div id="nivoslider-{$bid}" class="nivoSlider">
        {$vars.slider_content|safehtml}
    </div>
</div>
