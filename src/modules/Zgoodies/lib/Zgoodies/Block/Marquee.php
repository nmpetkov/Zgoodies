<?php
/**
 * Zgoodies Zikula Module
 *
 * @copyright Nikolay Petkov
 * @license GNU/GPL
 */
class Zgoodies_Block_Marquee extends Zikula_Controller_AbstractBlock
{
    /**
     * Initialise block
     */
    public function init()
    {
        SecurityUtil::registerPermissionSchema('Zgoodies:marqueeblock:', 'Block ID::');
    }
    
    /**
     * Return array with block information
     */
    public function info()
    {
        return array(
            'module'           => 'Zgoodies',
            'text_type'        => 'Marquee',
            'text_type_long'   => $this->__('Zgoodies Marquee block'),
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
        if (!SecurityUtil::checkPermission('Zgoodies:marqueeblock:', "$blockinfo[bid]::", ACCESS_OVERVIEW)) {
            return;
        }
        if (!ModUtil::available('Zgoodies')) {
            return;
        }
        $vars = BlockUtil::varsFromContent($blockinfo['content']);

        $lang = ZLanguage::getLanguageCode();

        // block title
        if (isset($vars['block_title'][$lang]) && !empty($vars['block_title'][$lang])) {
            $blockinfo['title'] = $vars['block_title'][$lang];
        }

        // marquee content
        if (isset($vars['marquee_content'][$lang]) && !empty($vars['marquee_content'][$lang])) {
            $vars['marquee_content_lang'] = $vars['marquee_content'][$lang];
        }
        if (!isset($vars['marquee_content'])) {
            $vars['marquee_content_lang'] = '';
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

        // set default values - block
        if (!isset($vars['block_template'])) {
            $vars['block_template'] = 'marquee.tpl';
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
        if (!isset($vars['marquee_content']) || !is_array($vars['marquee_content'])) {
            $vars['marquee_content'] = array();
        }
        foreach (array_keys($languages) as $lang) {
            if (!array_key_exists($lang, $vars['marquee_content'])) {
                $vars['marquee_content'][$lang] = '';
            }
        }
        if (!isset($vars['marquee_content_editor'])) {
            $vars['marquee_content_editor'] = true;
        }
        if (!isset($vars['marquee_duration'])) {
            $vars['marquee_duration'] = 15000;
        }
        if (!isset($vars['marquee_gap'])) {
            $vars['marquee_gap'] = 200;
        }
        if (!isset($vars['marquee_delayBeforeStart'])) {
            $vars['marquee_delayBeforeStart'] = 0;
        }
        if (!isset($vars['marquee_direction'])) {
            $vars['marquee_direction'] = 'left';
        }
        if (!isset($vars['marquee_duplicated'])) {
            $vars['marquee_duplicated'] = true;
        }
        if (!isset($vars['marquee_pauseOnHover'])) {
            $vars['marquee_pauseOnHover'] = true;
        }
        if (!isset($vars['marquee_pauseOnCycle'])) {
            $vars['marquee_pauseOnCycle'] = false;
        }

        $this->view->assign('vars', $vars);
        $this->view->assign('bid', $blockinfo['bid']);
        $this->view->assign('languages', $languages);

        return $this->view->fetch('blocks/marquee_modify.tpl');
    }
    
    /**
     * update block settings
     */
    public function update($blockinfo)
    {
        // get old variable values from database
        $vars = BlockUtil::varsFromContent($blockinfo['content']);

        // get new variable values from form
        $vars['block_template'] = FormUtil::getPassedValue('block_template', 'marquee.tpl', 'POST');
        $vars['block_title'] = FormUtil::getPassedValue('block_title', array(), 'POST');
        $vars['block_wrap'] = FormUtil::getPassedValue('block_wrap', true, 'POST');
        $vars['marquee_content'] = FormUtil::getPassedValue('marquee_content', array(), 'POST');
        $vars['marquee_content_editor'] = FormUtil::getPassedValue('marquee_content_editor', false, 'POST');
        $vars['marquee_duration'] = FormUtil::getPassedValue('marquee_duration', 15000, 'POST');
        $vars['marquee_gap'] = FormUtil::getPassedValue('marquee_gap', 200, 'POST');
        $vars['marquee_delayBeforeStart'] = FormUtil::getPassedValue('marquee_delayBeforeStart', 0, 'POST');
        $vars['marquee_direction'] = FormUtil::getPassedValue('marquee_direction', 'left', 'POST');
        $vars['marquee_duplicated'] = FormUtil::getPassedValue('marquee_duplicated', true, 'POST');
        $vars['marquee_pauseOnHover'] = FormUtil::getPassedValue('marquee_pauseOnHover', true, 'POST');
        $vars['marquee_pauseOnCycle'] = FormUtil::getPassedValue('marquee_pauseOnCycle', false, 'POST');

        // write new values
        $blockinfo['content'] = BlockUtil::varsToContent($vars);

        // clear the block cache
        $this->view->clear_cache('blocks/marquee.tpl');
    
        return $blockinfo;
    }
}