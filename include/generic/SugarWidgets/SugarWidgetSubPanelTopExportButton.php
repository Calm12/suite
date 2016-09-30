<?php
    if(!defined('sugarEntry') || !sugarEntry){
        die('Not A Valid Entry Point');
    }

    class SugarWidgetSubPanelTopExportButton extends SugarWidgetSubPanelTopButton {

        function display($widget_data, $additionalFormFields = null, $nonbutton = false){

            $title = 'export_button';
            $value = 'Экспорт людей';

            $name = $widget_data['focus']->name;
            $id = $widget_data['focus']->id;

            return '<input type="button" name="export_button" value="' . $value . '" onclick="
                window.open(\'index.php?module=Contacts&action=ContactsFromAccExport&acc_id='.$id.'&acc_name='.$name.'\');
            ">';
        }
    }

?>