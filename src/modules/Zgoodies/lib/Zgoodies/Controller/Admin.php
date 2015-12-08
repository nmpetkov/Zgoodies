<?php
/**
 * Zgoodies Zikula Module
 *
 * @copyright Nikolay Petkov
 * @license GNU/GPL
 */
class Zgoodies_Controller_Admin extends Zikula_AbstractController
{
    /**
     * Main administration function
     */
    public function main()
    {
        return $this->info();
    }

    /**
     * Modify module Config
     */
    public function modifyconfig()
    {
        $this->throwForbiddenUnless(SecurityUtil::checkPermission('Zgoodies::', '::', ACCESS_ADMIN), LogUtil::getErrorMsgPermission());

        // Get module configuration vars
        $vars = $this->getVars();
        if (!isset($vars['navgoco_save'])) {
            $vars['navgoco_save'] = 1;
        }
        if (!isset($vars['navgoco_accordion'])) {
            $vars['navgoco_accordion'] = 0;
        }
        if (!isset($vars['navgoco_caretHtml'])) {
            $vars['navgoco_caretHtml'] = '';
        }
        if (!isset($vars['navgoco_openClass'])) {
            $vars['navgoco_openClass'] = '';
        }
        if (!isset($vars['navgoco_slideduration'])) {
            $vars['navgoco_slideduration'] = '';
        }
        if (!isset($vars['navgoco_slideeasing'])) {
            $vars['navgoco_slideeasing'] = '';
        }
        if (!isset($vars['accmenu_eventType'])) {
            $vars['accmenu_eventType'] = 'click';
        }
        if (!isset($vars['accmenu_skin'])) {
            $vars['accmenu_skin'] = 'grey.css';
        }
        if (!isset($vars['accmenu_speed'])) {
            $vars['accmenu_speed'] = 'slow';
        }
        if (!isset($vars['accmenu_saveState'])) {
            $vars['accmenu_saveState'] = 1;
        }
        if (!isset($vars['accmenu_autoClose'])) {
            $vars['accmenu_autoClose'] = 1;
        }
        if (!isset($vars['accmenu_autoExpand'])) {
            $vars['accmenu_autoExpand'] = 0;
        }
        if (!isset($vars['accmenu_showCount'])) {
            $vars['accmenu_showCount'] = 0;
        }
        if (!isset($vars['accmenu_hoverDelay'])) {
            $vars['accmenu_hoverDelay'] = 300;
        }

        // Javascript plugin skins
        $pluginskins = FileUtil::getFiles('javascript/jquery-plugins/accordion-menu/css/skins', false, true, null, 'f');

        $this->view->assign('vars', $vars);
        $this->view->assign('pluginskins', $pluginskins);

        return $this->view->fetch('admin/modifyconfig.tpl');
    }

    /**
     * Update module Config
     */
    public function updateconfig()
    {
        $this->checkCsrfToken();
        $this->throwForbiddenUnless(SecurityUtil::checkPermission('Zgoodies::', '::', ACCESS_ADMIN), LogUtil::getErrorMsgPermission());

        $vars = array();
        $vars['navgoco_save'] = FormUtil::getPassedValue('navgoco_save', 1);
        $vars['navgoco_accordion'] = FormUtil::getPassedValue('navgoco_accordion', 0);
        $vars['navgoco_caretHtml'] = FormUtil::getPassedValue('navgoco_caretHtml', '');
        $vars['navgoco_openClass'] = FormUtil::getPassedValue('navgoco_openClass', '');
        $vars['navgoco_slideduration'] = FormUtil::getPassedValue('navgoco_slideduration', '');
        $vars['navgoco_slideeasing'] = FormUtil::getPassedValue('navgoco_slideeasing', '');
        $vars['accmenu_eventType'] = FormUtil::getPassedValue('accmenu_eventType', 'click');
        $vars['accmenu_skin'] = FormUtil::getPassedValue('accmenu_skin', 'grey.css');
        $vars['accmenu_speed'] = FormUtil::getPassedValue('accmenu_speed', 'slow');
        $vars['accmenu_saveState'] = FormUtil::getPassedValue('accmenu_saveState', 1);
        $vars['accmenu_autoClose'] = FormUtil::getPassedValue('accmenu_autoClose', 1);
        $vars['accmenu_autoExpand'] = FormUtil::getPassedValue('accmenu_autoExpand', 0);
        $vars['accmenu_showCount'] = FormUtil::getPassedValue('accmenu_showCount', 0);
        $vars['accmenu_hoverDelay'] = FormUtil::getPassedValue('accmenu_hoverDelay', 300);

        // set the new values
        $this->setVars($vars);

        // clear the cache
        $this->view->clear_cache();

        LogUtil::registerStatus($this->__('Done! Updated configuration.'));
        return $this->modifyconfig();
    }

    /**
     * Display module information
     */
    public function info()
    {
        $this->throwForbiddenUnless(SecurityUtil::checkPermission('Zgoodies::', '::', ACCESS_ADMIN), LogUtil::getErrorMsgPermission());

        return $this->view->fetch('admin/info.tpl');
    }
}