<?php
    require_once('custom/include/Dashlets/DashletGenericPieChart.php');

    class ContactsByCountryDashlet extends DashletGenericPieChart {
        protected $_seedName = 'Contacts';
        protected $groupBy = array( 'country' );

        protected function getDataset(){

            global $db;

            $sql = "SELECT primary_address_country, COUNT(*) as count FROM contacts group by primary_address_country;";
            $result = $db->query($sql, true);

            $returnArray = array();
            while(($row = $db->fetchByAssoc($result)) != null){
                $returnArray[] = array(
                    'country' => $row['primary_address_country'],
                    'total' => $row['count'],
                );
            }

            return $returnArray;
        }
    }
