<?php
$hook_version = 1; 
$hook_array = Array(); 

$hook_array['before_save'][] = Array(1, 'Push firstmodule feed', 'modules\test1_FirstModule\SugarFeeds\FirstModuleFeed.php','FirstModuleFeed', 'pushFeed'); 

?>