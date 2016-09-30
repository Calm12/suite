<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('modules/SugarFeed/feedLogicBase.php');
 
class AccountFeed extends FeedLogicBase{
    var $module = 'Accounts';
    function pushFeed($bean, $event, $arguments){
    	global $locale;
        $text = '';
        if(empty($bean->fetched_row)){
            $text =  '{SugarFeed.CREATED_ACCOUNT} [' . $bean->module_dir . ':' . $bean->id . ':' .$bean->name . ']';
        }
        if(!empty($text)){ 
			SugarFeed::pushFeed2($text, $bean);
        }
    }
}
?>