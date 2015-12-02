<?php
/**
 * Zgoodies Zikula Module
 *
 * @copyright Nikolay Petkov
 * @license GNU/GPL
 */
class Zgoodies_Block_Slider extends Zikula_Controller_AbstractBlock
{
    /**
     * Initialise block
     */
    public function init()
    {
        SecurityUtil::registerPermissionSchema('Zgoodies:sliderblock:', 'Block ID::');
    }
    
    /**
     * Return array with block information
     */
    public function info()
    {
        return array(
            'module'           => 'Zgoodies',
            'text_type'        => 'Slider',
            'text_type_long'   => $this->__('Zgoodies Nivo Slider block'),
            'allow_multiple'   => true,
            'form_content'     => false,
            'form_refresh'     => false,
            'show_preview'     => true,
            'admin_tableless'  => true);
    }
    
    /**
     * Display block
     */
    public function display($blockinfo)
    {
        if (!SecurityUtil::checkPermission('Zgoodies:sliderblock:', "$blockinfo[bid]::", ACCESS_OVERVIEW)) {
            return;
        }
        if (!ModUtil::available('Zgoodies')) {
            return;
        }
        $vars = BlockUtil::varsFromContent($blockinfo['content']);

        // block title
        $lang = ZLanguage::getLanguageCode();
        if (isset($vars['block_title'][$lang]) && !empty($vars['block_title'][$lang])) {
            $blockinfo['title'] = $vars['block_title'][$lang];
        }

        // slider content
        if (isset($vars['slider_content'][$lang]) && !empty($vars['slider_content'][$lang])) {
            $vars['slider_content_lang'] = $vars['slider_content'][$lang];
        }
        if (!isset($vars['slider_content'])) {
            $vars['slider_content_lang'] = '';
        }
        if (isset($vars['slider_htmlcaption'][$lang]) && !empty($vars['slider_htmlcaption'][$lang])) {
            $vars['slider_htmlcaption_lang'] = html_entity_decode($vars['slider_htmlcaption'][$lang], null, 'UTF-8');
        }
        if (!isset($vars['slider_htmlcaption'])) {
            $vars['slider_htmlcaption_lang'] = '';
        }

        $this->view->assign('vars', $vars);
        $this->view->assign('bid', $blockinfo['bid']);

        $blockinfo['content'] = $this->view->fetch('blocks/' . $vars['block_template']);

        if (isset($vars['block_wrap']) && !$vars['block_wrap']) {
            if (empty($blockinfo['title'])) {
                return $blockinfo['content'];
            } else {
                return '<h4>' . DataUtil::formatForDisplayHTML($blockinfo['title']) . '</h4>' . "\n" .
                    $blockinfo['content'];
            }
        }

        return BlockUtil::themeBlock($blockinfo);
    }
    
    /**
     * modify block settings
     */
    public function modify($blockinfo)
    {
        // get variable values from database
        $vars = BlockUtil::varsFromContent($blockinfo['content']);

        // installed languages
        $languages = ZLanguage::getInstalledLanguageNames();
        
        // Javascript plugin data
        $plugindir = 'javascript/jquery-plugins/Nivo-Slider';
        $pluginthemes = FileUtil::getFiles($plugindir . '/themes', false, true, null, 'd');

        // set default values - block
        if (!isset($vars['block_template'])) {
            $vars['block_template'] = 'slider.tpl';
        }
        if (!isset($vars['block_title']) || !is_array($vars['block_title'])) {
            $vars['block_title'] = array();
        }
        foreach (array_keys($languages) as $lang) {
            if (!array_key_exists($lang, $vars['block_title'])) {
                $vars['block_title'][$lang] = '';
            }
        }
        if (!isset($vars['block_wrap'])) {
            $vars['block_wrap'] = true;
        }

        // set default values - content
        if (!isset($vars['slider_content']) || !is_array($vars['slider_content'])) {
            $vars['slider_content'] = array();
        }
        foreach (array_keys($languages) as $lang) {
            if (!array_key_exists($lang, $vars['slider_content'])) {
                $vars['slider_content'][$lang] = '';
            }
        }
        if (!isset($vars['slider_htmlcaption']) || !is_array($vars['slider_htmlcaption'])) {
            $vars['slider_htmlcaption'] = array();
        }
        foreach (array_keys($languages) as $lang) {
            if (!array_key_exists($lang, $vars['slider_htmlcaption'])) {
                $vars['slider_htmlcaption'][$lang] = '';
            }
        }
        if (!isset($vars['slider_content_editor'])) {
            $vars['slider_content_editor'] = true;
        }
        if (!isset($vars['slider_theme'])) {
            $vars['slider_theme'] = 'default';
        }
        if (!isset($vars['slider_effect'])) {
            $vars['slider_effect'] = 'random';
        }
        if (!isset($vars['slider_slices'])) {
            $vars['slider_slices'] = 15;
        }
        if (!isset($vars['slider_boxCols'])) {
            $vars['slider_boxCols'] = 8;
        }
        if (!isset($vars['slider_boxRows'])) {
            $vars['slider_boxRows'] = 4;
        }
        if (!isset($vars['slider_animSpeed'])) {
            $vars['slider_animSpeed'] = 500;
        }
        if (!isset($vars['slider_pauseTime'])) {
            $vars['slider_pauseTime'] = 3000;
        }
        if (!isset($vars['slider_startSlide'])) {
            $vars['slider_startSlide'] = 0;
        }
        if (!isset($vars['slider_directionNav'])) {
            $vars['slider_directionNav'] = true;
        }
        if (!isset($vars['slider_controlNav'])) {
            $vars['slider_controlNav'] = true;
        }
        if (!isset($vars['slider_controlNavThumbs'])) {
            $vars['slider_controlNavThumbs'] = false;
        }
        if (!isset($vars['slider_pauseOnHover'])) {
            $vars['slider_pauseOnHover'] = true;
        }
        if (!isset($vars['slider_manualAdvance'])) {
            $vars['slider_manualAdvance'] = false;
        }
        if (!isset($vars['slider_randomStart'])) {
            $vars['slider_randomStart'] = false;
        }

        $this->view->assign('vars', $vars);
        $this->view->assign('bid', $blockinfo['bid']);
        $this->view->assign('languages', $languages);
        $this->view->assign('plugindir', $plugindir);
        $this->view->assign('pluginthemes', $pluginthemes);
        $this->view->assign('plugineffects', array('sliceDown', 'sliceDownLeft', 'sliceUp', 'sliceUpLeft', 'sliceUpDown', 'sliceUpDownLeft', 'fold', 'fade', 'random', 'slideInRight', 'slideInLeft', 'boxRandom', 'boxRain', 'boxRainReverse', 'boxRainGrow', 'boxRainGrowReverse'));

        return $this->view->fetch('blocks/slider_modify.tpl');
    }
    
    /**
     * update block settings
     */
    public function update($blockinfo)
    {
        // get old variable values from database
        $vars = BlockUtil::varsFromContent($blockinfo['content']);

        // get new variable values from form
        $vars['block_template'] = FormUtil::getPassedValue('block_template', 'slider.tpl', 'POST');
        $vars['block_title'] = FormUtil::getPassedValue('block_title', array(), 'POST');
        $vars['block_wrap'] = FormUtil::getPassedValue('block_wrap', true, 'POST');
        $vars['slider_content'] = FormUtil::getPassedValue('slider_content', array(), 'POST');
        $vars['slider_htmlcaption'] = FormUtil::getPassedValue('slider_htmlcaption', array(), 'POST');
        $vars['slider_content_editor'] = FormUtil::getPassedValue('slider_content_editor', false, 'POST');
        $vars['slider_theme'] = FormUtil::getPassedValue('slider_theme', 'default', 'POST');
        $vars['slider_effect'] = FormUtil::getPassedValue('slider_effect', 'random', 'POST');
        $vars['slider_slices'] = FormUtil::getPassedValue('slider_slices', 15, 'POST');
        $vars['slider_boxCols'] = FormUtil::getPassedValue('slider_boxCols', 8, 'POST');
        $vars['slider_boxRows'] = FormUtil::getPassedValue('slider_boxRows', 4, 'POST');
        $vars['slider_animSpeed'] = FormUtil::getPassedValue('slider_animSpeed', 500, 'POST');
        $vars['slider_pauseTime'] = FormUtil::getPassedValue('slider_pauseTime', 3000, 'POST');
        $vars['slider_startSlide'] = FormUtil::getPassedValue('slider_startSlide', 0, 'POST');
        $vars['slider_directionNav'] = FormUtil::getPassedValue('slider_directionNav', true, 'POST');
        $vars['slider_controlNav'] = FormUtil::getPassedValue('slider_controlNav', true, 'POST');
        $vars['slider_controlNavThumbs'] = FormUtil::getPassedValue('slider_controlNavThumbs', false, 'POST');
        $vars['slider_pauseOnHover'] = FormUtil::getPassedValue('slider_pauseOnHover', true, 'POST');
        $vars['slider_manualAdvance'] = FormUtil::getPassedValue('slider_manualAdvance', false, 'POST');
        $vars['slider_randomStart'] = FormUtil::getPassedValue('slider_randomStart', false, 'POST');

        // write new values
        $blockinfo['content'] = BlockUtil::varsToContent($vars);

        // clear the block cache
        $this->view->clear_cache('blocks/slider.tpl');
    
        return $blockinfo;
    }
}