<?php
// created: 2016-08-31 12:50:42
$dictionary["Note"]["fields"]["test1_firstmodule_notes"] = array (
  'name' => 'test1_firstmodule_notes',
  'type' => 'link',
  'relationship' => 'test1_firstmodule_notes',
  'source' => 'non-db',
  'module' => 'test1_FirstModule',
  'bean_name' => 'test1_FirstModule',
  'vname' => 'LBL_TEST1_FIRSTMODULE_NOTES_FROM_TEST1_FIRSTMODULE_TITLE',
  'id_name' => 'test1_firstmodule_notestest1_firstmodule_ida',
);
$dictionary["Note"]["fields"]["test1_firstmodule_notes_name"] = array (
  'name' => 'test1_firstmodule_notes_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_TEST1_FIRSTMODULE_NOTES_FROM_TEST1_FIRSTMODULE_TITLE',
  'save' => true,
  'id_name' => 'test1_firstmodule_notestest1_firstmodule_ida',
  'link' => 'test1_firstmodule_notes',
  'table' => 'test1_firstmodule',
  'module' => 'test1_FirstModule',
  'rname' => 'name',
);
$dictionary["Note"]["fields"]["test1_firstmodule_notestest1_firstmodule_ida"] = array (
  'name' => 'test1_firstmodule_notestest1_firstmodule_ida',
  'type' => 'link',
  'relationship' => 'test1_firstmodule_notes',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_TEST1_FIRSTMODULE_NOTES_FROM_NOTES_TITLE',
);
