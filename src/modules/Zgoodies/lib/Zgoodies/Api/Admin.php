<?php
/**
 * Zgoodies Zikula Module
 *
 * @copyright Nikolay Petkov
 * @license GNU/GPL
 */
class Zgoodies_Api_Admin extends Zikula_AbstractApi
{
    /**
     * Get available admin panel links.
     *
     * @return array Array of admin links.
     */
    public function getLinks()
    {
        $links = array();

        $links[] = array(
            'url' => ModUtil::url($this->name, 'admin', 'info'),
            'text' => $this->__('Information'),
            'class' => 'z-icon-es-info');
        if (SecurityUtil::checkPermission('Zgoodies::', '::', ACCESS_ADMIN)) {
            $links[] = array(
                'url' => ModUtil::url($this->name, 'admin', 'modifyconfig'),
                'text' => $this->__('Settings'),
                'class' => 'z-icon-es-config');
        }
        if (SecurityUtil::checkPermission('Zgoodies::', '::', ACCESS_ADMIN)) {
            $links[] = array(
                'url' => 'https://github.com/nmpetkov/Zgoodies/wiki',
                'text' => $this->__('Wiki'),
                'class' => 'z-icon-es-help');
        }

        return $links;
    }
}
