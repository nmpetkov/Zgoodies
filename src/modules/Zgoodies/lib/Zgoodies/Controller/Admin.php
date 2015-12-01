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

        return $this->view->fetch('admin/modifyconfig.tpl');
    }
    /**
     * Update module Config
     */
    public function updateconfig()
    {
        $this->checkCsrfToken();
        
        $this->throwForbiddenUnless(SecurityUtil::checkPermission('Zgoodies::', '::', ACCESS_ADMIN), LogUtil::getErrorMsgPermission());

        $modvars = array();
        $modvars['zgoodies_type'] = FormUtil::getPassedValue('zgoodies_type', 1);

        // set the new variables
        $this->setVars($modvars);
    
        // clear the cache
        $this->view->clear_cache();
    
        LogUtil::registerStatus($this->__('Done! Updated the Zgoodies configuration.'));
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