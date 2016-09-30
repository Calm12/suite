<?php
    if(!defined('sugarEntry') || !sugarEntry){
        die('Not A Valid Entry Point');
    }

    class SugarWidgetSubPanelTopTestButton extends SugarWidgetSubPanelTopButton {

        function display($widget_data, $additionalFormFields = null, $nonbutton = false){

            $title = 'test_button';
            $value = 'Еще контакты';

            $name = $widget_data['focus']->name;

            $url = 'http://google.com/search?q='.$name.' партнеры';

            return '<input type="button" name="google_search_button" value="'.$value.'" onclick="window.open(\''.$url.'\',\'Поиск дополнительных контактов\',\'width=800,height=600\');">';
        }
    }

?>