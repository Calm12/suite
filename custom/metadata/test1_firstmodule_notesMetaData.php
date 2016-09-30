<?php
// created: 2016-08-31 12:50:42
$dictionary["test1_firstmodule_notes"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'test1_firstmodule_notes' => 
    array (
      'lhs_module' => 'test1_FirstModule',
      'lhs_table' => 'test1_firstmodule',
      'lhs_key' => 'id',
      'rhs_module' => 'Notes',
      'rhs_table' => 'notes',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'test1_firstmodule_notes_c',
      'join_key_lhs' => 'test1_firstmodule_notestest1_firstmodule_ida',
      'join_key_rhs' => 'test1_firstmodule_notesnotes_idb',
    ),
  ),
  'table' => 'test1_firstmodule_notes_c',
  'fields' => 
  array (
    0 => 
    array (
      'name' => 'id',
      'type' => 'varchar',
      'len' => 36,
    ),
    1 => 
    array (
      'name' => 'date_modified',
      'type' => 'datetime',
    ),
    2 => 
    array (
      'name' => 'deleted',
      'type' => 'bool',
      'len' => '1',
      'default' => '0',
      'required' => true,
    ),
    3 => 
    array (
      'name' => 'test1_firstmodule_notestest1_firstmodule_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'test1_firstmodule_notesnotes_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'test1_firstmodule_notesspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'test1_firstmodule_notes_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'test1_firstmodule_notestest1_firstmodule_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'test1_firstmodule_notes_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'test1_firstmodule_notesnotes_idb',
      ),
    ),
  ),
);