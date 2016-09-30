<?php
 // created: 2016-08-31 12:50:42
$layout_defs["test1_FirstModule"]["subpanel_setup"]['test1_firstmodule_notes'] = array (
  'order' => 100,
  'module' => 'Notes',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_TEST1_FIRSTMODULE_NOTES_FROM_NOTES_TITLE',
  'get_subpanel_data' => 'test1_firstmodule_notes',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);
