<?php
/**
 * Zgoodies Zikula Module
 *
 * @copyright Nikolay Petkov
 * @license GNU/GPL
 */
class Zgoodies_Version extends Zikula_AbstractVersion
{
    public function getMetaData()
    {
        $meta = array();
        $meta['displayname']    = $this->__('Zgoodies');
        $meta['url']            = $this->__('zgoodies');
        $meta['description']    = $this->__('Goodies for Zikula');
        $meta['version']        = '1.0.0';
        $meta['capabilities']   = array(HookUtil::SUBSCRIBER_CAPABLE => array('enabled' => true));
        $meta['securityschema'] = array('Zgoodies::' => '::');
        $meta['core_min']       = '1.3.0';

        return $meta;
    }

    protected function setupHookBundles()
    {
        // Register hooks
        $bundle = new Zikula_HookManager_SubscriberBundle($this->name, 'subscriber.zgoodies.ui_hooks.items', 'ui_hooks', $this->__('Zgoodies Items Hooks'));
        $bundle->addEvent('display_view', 'zgoodies.ui_hooks.items.display_view');
        $bundle->addEvent('form_edit', 'zgoodies.ui_hooks.items.form_edit');
        $bundle->addEvent('form_delete', 'zgoodies.ui_hooks.items.form_delete');
        $this->registerHookSubscriberBundle($bundle);
    }
}