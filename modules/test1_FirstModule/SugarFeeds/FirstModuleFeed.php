<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('modules/SugarFeed/feedLogicBase.php');
 
class FirstModuleFeed extends FeedLogicBase{
    var $module = 'FirstModule';
    function pushFeed($bean, $event, $arguments){
    	global $locale;
        $text = '';
        if(empty($bean->fetched_row)){
            $text =  '{SugarFeed.CREATED_FIRST} [' . $bean->module_dir . ':' . $bean->id . ':' .$bean->name . ']';
        }
        if(!empty($text)){ 
			SugarFeed::pushFeed2($text, $bean);
        }
    }
}
?>