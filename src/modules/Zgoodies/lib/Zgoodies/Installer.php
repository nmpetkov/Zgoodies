<?php
/**
 * Zgoodies Zikula Module
 *
 * @copyright Nikolay Petkov
 * @license GNU/GPL
 */
class Zgoodies_Installer extends Zikula_AbstractInstaller
{
    /**
     * Initializes a new install
     *
     * @return  boolean    true/false
     */
    public function install()
    {
        // Register for hooks subscribing
        HookUtil::registerSubscriberBundles($this->version->getHookSubscriberBundles());

        return true;
    }

    /**
     * Upgrade module
     *
     * @param   string    $oldversion
     * @return  boolean   true/false
     */
    public function upgrade($oldversion)
    {
        switch ($oldversion) {
            case '1.0.0':
                //future upgrade routines
        }

        return true;
    }

    /**
     * Delete module
     *
     * @return  boolean    true/false
     */
    public function uninstall()
    {
        // Remove hooks
        HookUtil::unregisterSubscriberBundles($this->version->getHookSubscriberBundles());

        return true;
    }
}