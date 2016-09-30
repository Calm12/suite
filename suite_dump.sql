CREATE DATABASE  IF NOT EXISTS `suite` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `suite`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: suite
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('60fe5f52-f51a-12ce-c534-57c6d0e7541e','CGimpel','2016-08-31 12:41:50','2016-09-22 23:47:04','1','1','описание',0,'1','Analyst','Apparel','21000000',NULL,'проспект Энергетиков','Санкт-Петербург','Ленинградская','195112','Россия',NULL,'123456',NULL,'http://cgimpel.ru',NULL,'17',NULL,'площадь Карла Фаберже','Санкт-Петербург','Ленинградская','195112','Россия','',NULL,''),('7c4b49df-70cd-c7de-b590-57d8525c48f7','Lockheed Martin Corporation','2016-09-13 19:24:15','2016-09-13 19:24:15','1','1','описание локхид',0,'1','Investor','Machinery','$2.92 млрд','','улица','Бетесда','Мэриленд','645789','США',NULL,'',NULL,'http://www.lockheedmartin.com/',NULL,'120000',NULL,'улица','Бетесда','Мэриленд','645789','США','60fe5f52-f51a-12ce-c534-57c6d0e7541e',NULL,''),('8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','Sigizmund Inc.','2016-09-04 19:51:06','2016-09-22 12:47:28','1','1','описание',0,'1','Analyst','Hospitality','25',NULL,'улица','Брно','область','123354','Чехия',NULL,NULL,NULL,'http://brno.cz',NULL,NULL,NULL,'улица','Брно','область','123354','Чехия','60fe5f52-f51a-12ce-c534-57c6d0e7541e',NULL,'');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_audit`
--

DROP TABLE IF EXISTS `accounts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_audit`
--

LOCK TABLES `accounts_audit` WRITE;
/*!40000 ALTER TABLE `accounts_audit` DISABLE KEYS */;
INSERT INTO `accounts_audit` VALUES ('1de9fc22-1eb9-0fbf-8437-57d19eb0aa1f','8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','2016-09-08 17:24:27','1','name','name','Сигизмунд','Sigizmund Inc.',NULL,NULL),('70a29844-7579-5a83-5ef0-57cc7b7c35f6','8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','2016-09-04 19:52:33','1','parent_id','id','','60fe5f52-f51a-12ce-c534-57c6d0e7541e',NULL,NULL),('c83ae177-702e-4c97-0d6b-57d1a062f712','60fe5f52-f51a-12ce-c534-57c6d0e7541e','2016-09-08 17:29:35','1','name','name','Vasya','CGimpel',NULL,NULL);
/*!40000 ALTER TABLE `accounts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bugs`
--

DROP TABLE IF EXISTS `accounts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bugs`
--

LOCK TABLES `accounts_bugs` WRITE;
/*!40000 ALTER TABLE `accounts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cases`
--

DROP TABLE IF EXISTS `accounts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cases`
--

LOCK TABLES `accounts_cases` WRITE;
/*!40000 ALTER TABLE `accounts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_contacts`
--

DROP TABLE IF EXISTS `accounts_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_contacts`
--

LOCK TABLES `accounts_contacts` WRITE;
/*!40000 ALTER TABLE `accounts_contacts` DISABLE KEYS */;
INSERT INTO `accounts_contacts` VALUES ('24910905-f6a6-bf28-08fd-57d4248a6b3f','cfe14298-3ef7-f8ce-e0b8-57d4247a557c','8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','2016-09-23 00:06:17',0),('30af8719-3862-6688-4871-57cc7b373e01','8c309073-96e9-ba90-79b2-57cc79f1a6f3','8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','2016-09-23 01:12:52',0),('5dd8227f-6323-62ce-ab5e-57e3d2c54e6a','bf592272-f781-794c-d5b5-57d2e75d0cc4','8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','2016-09-22 12:49:35',1),('ba0b0616-52b0-8660-6293-57e548059a58','8008bb98-86ab-d06b-46a5-57e5487865cd','7c4b49df-70cd-c7de-b590-57d8525c48f7','2016-09-23 15:21:11',0),('bade2b4c-4bb4-2c39-0084-57cc79d7842f','8c309073-96e9-ba90-79b2-57cc79f1a6f3','60fe5f52-f51a-12ce-c534-57c6d0e7541e','2016-09-04 19:54:21',1),('d2fb5bca-3f15-2c0d-7c77-57d2e77fdd9a','bf592272-f781-794c-d5b5-57d2e75d0cc4','60fe5f52-f51a-12ce-c534-57c6d0e7541e','2016-09-22 12:49:35',1),('e1dd6dd4-4bba-4b85-947f-57e3d71a7c5a','bf592272-f781-794c-d5b5-57d2e75d0cc4','60fe5f52-f51a-12ce-c534-57c6d0e7541e','2016-09-22 21:33:01',0);
/*!40000 ALTER TABLE `accounts_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cstm`
--

DROP TABLE IF EXISTS `accounts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cstm`
--

LOCK TABLES `accounts_cstm` WRITE;
/*!40000 ALTER TABLE `accounts_cstm` DISABLE KEYS */;
INSERT INTO `accounts_cstm` VALUES ('60fe5f52-f51a-12ce-c534-57c6d0e7541e',0.00000000,0.00000000,'ZERO_RESULTS','улица, город, область, 123456, страна'),('7c4b49df-70cd-c7de-b590-57d8525c48f7',-77.11170959,39.01947784,'OK','улица, Бетесда, Мэриленд, 645789, США'),('8029cf32-1c4d-efdf-9f2f-57cc7b064b8e',0.00000000,0.00000000,'ZERO_RESULTS','улица, Брно, область, 123354, Чехия');
/*!40000 ALTER TABLE `accounts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_opportunities`
--

DROP TABLE IF EXISTS `accounts_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_opportunities`
--

LOCK TABLES `accounts_opportunities` WRITE;
/*!40000 ALTER TABLE `accounts_opportunities` DISABLE KEYS */;
INSERT INTO `accounts_opportunities` VALUES ('3015f279-da2b-db1f-cf8e-57cc05b0b532','2cd7cb8a-e9b9-761d-df86-57cc0563d21a','60fe5f52-f51a-12ce-c534-57c6d0e7541e','2016-09-04 11:28:14',0);
/*!40000 ALTER TABLE `accounts_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions`
--

LOCK TABLES `acl_actions` WRITE;
/*!40000 ALTER TABLE `acl_actions` DISABLE KEYS */;
INSERT INTO `acl_actions` VALUES ('103c9c19-73d2-a462-b9c5-57c5d477108c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','jjwg_Areas','module',90,0),('104039dd-91cf-3469-b3f8-57c5d48619fb','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOS_Invoices','module',90,0),('10900317-bf98-5114-89b3-57c5d484a6a3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOS_Invoices','module',89,0),('11ef033a-2839-134c-709f-57c5d4802a3f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Prospects','module',90,0),('1203b6a2-9e84-8fc9-1246-57c5d44fcf17','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','ProjectTask','module',90,0),('121a33f6-cc17-f3c8-8ad5-57c5d4ca8234','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Calls','module',90,0),('1244e56e-748c-2b70-a4c2-57c5d46e3119','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Contacts','module',90,0),('12ddba18-4dd5-fea2-4f33-57c5d464e630','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','jjwg_Markers','module',90,0),('13374141-94bd-631e-f8b5-57c5d477df0c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','OutboundEmailAccounts','module',90,0),('138eca22-a55b-c557-cd06-57c5d441efc0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOS_Quotes','module',90,0),('140009c1-c2d7-90a6-8b07-57c5d47c38a0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AM_TaskTemplates','module',89,0),('14495f75-74fb-20a2-21d8-57c5d421cfd3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Campaigns','module',89,0),('15165cb5-4dd4-de14-51c5-57c5d44f8ad8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Documents','module',90,0),('1533bc83-a25e-dab9-00a4-57c5d4e4774b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOR_Reports','module',90,0),('153594a2-b1e5-1148-58f3-57c5d4a8d70b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Spots','module',90,0),('1537a1a0-e830-25b6-db66-57c5d4625c19','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','FP_events','module',90,0),('1546e6a3-a0cd-5182-587c-57c5d43814d2','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOR_Scheduled_Reports','module',90,0),('15803fbe-2450-1808-f20c-57c5d4078e64','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Calls_Reschedule','module',90,0),('177a30f0-f25b-ef5e-d85c-57c5d453b6eb','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Accounts','module',90,0),('17c3e286-a05b-1268-2616-57c5d4d964f9','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Notes','module',90,0),('17ca9ad9-0881-5bd8-f844-57c5d472bad9','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Meetings','module',90,0),('17f3b1d3-a2ff-629a-5568-57c5d40bddae','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOBH_BusinessHours','module',90,0),('180e066b-bfa1-a689-b273-57c5d469e6a7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','TemplateSectionLine','module',90,0),('18130d77-1cdb-e5fb-7692-57c5d484a7a4','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','EAPM','module',90,0),('1823e80b-3079-1cdf-0f58-57c5d4d4d6e5','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AM_TaskTemplates','module',90,0),('1a20003f-ed38-6027-5dc6-57c5d4b9ddee','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Cases','module',90,0),('1a6159e4-d54c-33bf-d6fc-57c5d4ad2410','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','ProspectLists','module',90,0),('1ab81008-e1ce-85c2-9b2e-57c5d4cfd976','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Emails','module',90,0),('1b07566e-8912-ab84-04c1-57c5d4a5d1ab','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOP_Case_Events','module',90,0),('1b477726-d0be-715e-8d0b-57c5d46e85ec','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','jjwg_Address_Cache','module',90,0),('1c9d9304-050c-e07b-99ab-57c5d47899a3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Cases','module',90,0),('1cdac519-f12c-4963-b67a-57c69ecf1d11','2016-08-31 09:07:14','2016-08-31 09:07:14','1','1','import','test1_FirstModule','module',90,0),('1cfe373f-12f4-48d1-1ebc-57c5d4ed1d2d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Project','module',90,0),('1d0963e5-0743-3628-58ba-57c5d45e0c33','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','EmailTemplates','module',90,0),('1d2988b5-e2e7-c4ec-0d67-57c5d47c867b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Calls','module',90,0),('1d60b4e5-009f-8e8a-bfd6-57c5d42eaaf4','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOS_Invoices','module',90,0),('1d6700ff-f93b-53f4-4ff4-57c5d41f36db','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','EmailTemplates','module',90,0),('1da00b89-6a46-8e8f-1fc7-57c5d461e61a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Accounts','module',90,0),('1dab5e5d-c361-b7c8-8ba3-57c5d4f6465e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','TemplateSectionLine','module',90,0),('1dceaaf1-d5cc-67ee-9031-57c5d4b25019','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOP_Case_Updates','module',90,0),('1dec144b-034a-e977-e6a4-57c5d47803a6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','jjwg_Areas','module',90,0),('1e31057e-4d5a-d96e-a6b9-57c5d41c6d83','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Project','module',90,0),('1ed4ffd3-027f-3463-7b84-57c5d48eb39b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Bugs','module',89,0),('1ef56ae5-65d0-35f3-b653-57c5d4f4b92f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Tasks','module',90,0),('1f126778-fc31-3af2-5ad9-57c5d48f82c9','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AM_ProjectTemplates','module',89,0),('1f90ac28-cd57-2213-55a5-57c5d4e2d7b0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','ProjectTask','module',90,0),('1fafd5dd-90d5-9dd1-29af-57c5d4aaa8d5','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Campaigns','module',90,0),('1fc002a8-08cb-80eb-e367-57c5d48d6a50','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Prospects','module',90,0),('1fe9499d-e478-89e7-b013-57c5d42c8f04','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Contacts','module',90,0),('20010798-ca76-7f3a-3165-57c5d4cd2272','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Spots','module',90,0),('2039e4ee-1fce-a11a-3035-57c5d479a194','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Documents','module',90,0),('206c21b1-e2ea-7c81-fc27-57c5d4a1372e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','jjwg_Markers','module',90,0),('207cabbe-6606-edb2-e37d-57c5d4992190','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','FP_events','module',90,0),('20a005d0-b045-a43b-e88e-57c5d4691e50','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','OutboundEmailAccounts','module',90,0),('2294a81a-206e-543f-2c71-57c5d4de395e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOBH_BusinessHours','module',90,0),('22aca061-563b-46b7-8b1e-57c5d47943b0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','EAPM','module',90,0),('22b4f3f3-5837-a891-3913-57c5d46ad1ed','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Meetings','module',90,0),('22d25ff3-203d-742b-9226-57c5d4a0a31c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Favorites','module',90,0),('22e4666e-75c4-b54d-fdce-57c5d45e2b62','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AM_TaskTemplates','module',90,0),('22f18e11-13b6-295f-7a70-57c5d4e22920','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOR_Reports','module',90,0),('22fb0715-10b9-ab45-3978-57c5d4e68df1','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOR_Scheduled_Reports','module',90,0),('23830d7d-fb1f-653d-0aac-57c5d48a5c21','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOBH_BusinessHours','module',90,0),('24a608b8-22db-725a-50b7-57c5d4c4f4d7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOP_Case_Updates','module',90,0),('252f21a3-a56d-023f-67df-57c5d4cf7b9c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Accounts','module',90,0),('25b55b4f-324f-d495-d848-57c5d43b0e99','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOP_Case_Events','module',90,0),('25d00eb4-b10f-7a49-a1f2-57c5d4ba65fd','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Emails','module',90,0),('26060a3f-28f4-70f8-c5c1-57c5d442f09a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','EAPM','module',90,0),('27ba8363-0813-28d9-a85d-57c5d4fd3a24','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','ProspectLists','module',90,0),('27e3039e-8b63-ac48-09c7-57c5d47e6186','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOP_Case_Events','module',90,0),('2813abb6-a674-64a5-5ac3-57c5d4a442a2','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Tasks','module',90,0),('28181e05-aa1b-ad8d-5335-57c5d44c15e0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Emails','module',90,0),('28bf1a5d-2d1e-93b5-a0cd-57c5d4fcd2d7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','jjwg_Address_Cache','module',90,0),('2a547c57-3cad-2770-2e8a-57c5d460d44c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Cases','module',90,0),('2a82cb79-744c-a70e-4ac4-57c5d4c5305d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Calls','module',90,0),('2ab7ac4a-ae63-a3fe-f198-57c5d4bff2af','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Spots','module',90,0),('2ac61345-97d2-f655-7d05-57c5d4b0d5b8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Documents','module',90,0),('2af82699-4402-4202-086f-57c5d462b5f3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AM_ProjectTemplates','module',90,0),('2b106775-cad6-8a3c-88c0-57c5d4d240db','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','FP_events','module',90,0),('2b4840fa-7eec-9507-f878-57c5d48bbfcd','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOS_Invoices','module',90,0),('2b7ca81c-4c74-3cb8-110a-57c5d43a34ee','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','jjwg_Areas','module',90,0),('2b821881-0dff-af28-a2e1-57c5d4da75f4','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','TemplateSectionLine','module',90,0),('2bb00e01-0227-278b-1a73-57c5d4d88ee6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Favorites','module',90,0),('2c7d2084-0175-2d9a-1c0b-57c5d4844f38','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','EmailMarketing','module',89,0),('2c860577-4783-31b0-d7f0-57c5d41205e1','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','jjwg_Areas','module',90,0),('2d1376dc-3dbe-e0cb-119f-57c5d43682bb','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Prospects','module',90,0),('2d36a95a-600f-e562-6e1b-57c5d46841fc','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Campaigns','module',90,0),('2d411079-3db8-701d-6e6b-57c69ec120ce','2016-08-31 09:07:14','2016-08-31 09:07:14','1','1','export','test1_FirstModule','module',90,0),('2d4204fe-dd4c-790d-59a1-57c5d45231e2','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','ProjectTask','module',90,0),('2d425271-3b9a-a6ed-6f7b-57c5d48db2e8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Contacts','module',90,0),('2d517901-10f9-ccae-e1a5-57c5d47d1e0b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Bugs','module',90,0),('2d89dd8a-43fc-3661-39f1-57c5d46f1f59','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Notes','module',90,0),('2d9d2510-7e60-059b-52c2-57c5d483995d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Favorites','module',90,0),('2dc549e6-7525-e0d9-7101-57c5d4b435cb','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','EAPM','module',90,0),('2dc77342-4753-8a6d-58be-57c5d4c0d691','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AM_TaskTemplates','module',90,0),('2e1393c0-b8eb-5388-1447-57c5d4537b12','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','OutboundEmailAccounts','module',90,0),('300162d7-c7be-2c63-0e67-57c5d4ed04af','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Meetings','module',90,0),('305ed642-8971-2234-1f23-57c5d47a423a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOR_Scheduled_Reports','module',90,0),('30683461-2927-84f9-3060-57c5d4aaad56','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOR_Reports','module',90,0),('307e031e-d54d-2da5-ec72-57c5d45ce41c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Alerts','module',90,0),('30ee1f5d-c188-0a73-0ee8-57c5d4ebb0b2','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','SecurityGroups','module',90,0),('31e9974f-dba8-869f-8eb2-57c5d46a1fea','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOS_Products','module',89,0),('322db8df-cbd4-5931-a9e6-57c5d4ba7de0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOS_PDF_Templates','module',89,0),('3303b25f-8b71-b0aa-c5b4-57c5d42ab510','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Tasks','module',90,0),('331b5b36-20e9-9899-be15-57c5d4fe43b1','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOP_Case_Events','module',90,0),('35719082-0ef3-20ec-d4e9-57c5d4b126f8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','ProspectLists','module',90,0),('35be8856-221d-872d-e43d-57c5d43370c0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Emails','module',90,0),('35c35421-a082-086f-58ac-57c5d40b1e6c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Spots','module',90,0),('35c6027a-ae71-2fa2-f688-57c5d4646038','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Calls','module',90,0),('361b54e4-75db-2796-6d0b-57c5d49d5ab0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AM_ProjectTemplates','module',90,0),('36790141-09d9-0ab9-a604-57c5d4e906da','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','jjwg_Address_Cache','module',90,0),('36e2893e-ab2f-746b-8f8e-57c5d47a6758','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOS_Quotes','module',90,0),('37c541c8-5268-4278-513c-57c5d4733420','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Cases','module',90,0),('38851bb3-5da6-b874-c552-57c5d4ab005f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOS_Invoices','module',90,0),('38b8e51b-70e0-0655-84c0-57c5d46d3aae','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AM_TaskTemplates','module',90,0),('390f2a67-b3ba-de41-09f4-57c5d4ae6b72','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','jjwg_Areas','module',90,0),('3a400d27-61d3-34e5-b654-57c5d4abf37d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','jjwg_Address_Cache','module',90,0),('3a8c4239-d222-5f6f-0971-57c5d4b7e9e8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','ProjectTask','module',90,0),('3a8da456-cde4-38d9-c700-57c5d402e599','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Campaigns','module',90,0),('3ac5de90-4db7-a420-5c5a-57c5d4af8930','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Prospects','module',90,0),('3b095253-9be5-ced2-fb1e-57c5d48cf72c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','EmailMarketing','module',90,0),('3b3bc0a4-cd76-4e0e-c5e5-57c5d47526f0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Contacts','module',90,0),('3b6001d5-2ed8-5a4c-af79-57c5d4abae03','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Meetings','module',90,0),('3b75796d-0ede-c4d5-e2d1-57c5d48f98b6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','OutboundEmailAccounts','module',90,0),('3bb101dd-a697-e7ef-6e5f-57c5d4eeb823','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Contacts','module',89,0),('3cb6b420-e0de-6df2-b21e-57c69ec86113','2016-08-31 09:07:14','2016-08-31 09:07:14','1','1','massupdate','test1_FirstModule','module',90,0),('3dd452e0-7409-8879-513e-57c5d41016d8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Tasks','module',90,0),('3e18624e-49de-a2f5-cce3-57c5d449eaf3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOP_Case_Events','module',90,0),('3e2fee89-4e40-6793-719d-57c5d42b0b0f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOR_Scheduled_Reports','module',90,0),('3e30c67c-a397-7f60-77b0-57c5d4e342e4','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOR_Reports','module',90,0),('3e3cdd48-96a6-2f61-a138-57c5d4f5687c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOP_Case_Updates','module',90,0),('3e824ea4-9434-85be-5560-57c5d4a72489','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOS_Products','module',90,0),('40636cf0-91da-b58f-64f9-57c5d44379f1','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Spots','module',90,0),('407e552e-5691-1faa-1836-57c5d493a3be','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AM_ProjectTemplates','module',90,0),('41074b7f-c13a-d3c0-cc46-57c5d4a80bed','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOS_PDF_Templates','module',90,0),('4113d133-73aa-1378-b6b2-57c5d46109f5','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOS_Quotes','module',90,0),('42cce77e-fca8-cf21-ce62-57c5d41f0375','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','ProspectLists','module',90,0),('43012464-b72e-afb4-2001-57c5d4a5aecb','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Calls','module',90,0),('437a6526-1841-c90e-9922-57c5d4d1e4ee','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AM_TaskTemplates','module',90,0),('43a93101-071c-287a-17bb-57c5d4451e11','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','TemplateSectionLine','module',90,0),('4503c9d7-8171-1996-7b8a-57c5d4b4f91c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOS_Product_Categories','module',89,0),('4523bcd8-80f4-d20d-1b54-57c5d45bd2ca','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOW_WorkFlow','module',89,0),('457a3fb6-e179-4a2a-77ca-57c5d48db706','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Cases','module',90,0),('464f2f20-a984-fc84-55a0-57c5d4f7b45f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOS_Invoices','module',90,0),('46610797-f443-b7a2-726a-57c5d4e826e6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','ProjectTask','module',90,0),('48525da6-8e44-4d87-a3f0-57c5d45f295b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','ProjectTask','module',90,0),('485f7ebc-3a92-ee3d-23cd-57c5d4452049','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Contacts','module',90,0),('487249f9-b914-28da-f562-57c5d4ede337','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Meetings','module',90,0),('48851e1a-76f2-950e-1856-57c5d42bbabc','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Campaigns','module',90,0),('489ab1af-fe07-9bc2-3ce3-57c5d4d1734a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','EmailMarketing','module',90,0),('48c7fa1f-42a1-54a6-5063-57c5d4799a3a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Bugs','module',90,0),('49435d75-217b-c617-2257-57c5d4cca200','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','OutboundEmailAccounts','module',90,0),('49620760-06be-4baa-f32c-57c5d4e34cd2','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Calls','module',90,0),('4ae9a7de-9848-e2cf-c9c3-57c5d420c98b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Leads','module',90,0),('4b641d22-1a21-a7f9-093a-57c5d4a31e2d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Spots','module',90,0),('4b942830-1491-ee78-e4c0-57c5d424a6eb','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOP_Case_Events','module',90,0),('4ba3590f-24f0-b17f-d25b-57c5d470f12e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AM_ProjectTemplates','module',90,0),('4bb2370c-dace-1731-4e7d-57c5d4a46c9e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOR_Scheduled_Reports','module',90,0),('4c130b4e-c3ce-9def-2162-57c5d4ff902c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Prospects','module',90,0),('4c810cbc-6cd3-11f8-d71c-57c5d4c9bb00','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Notes','module',90,0),('4e2955cb-5a1d-d7c1-9049-57c5d484bdec','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AM_TaskTemplates','module',90,0),('4e59104b-d0cd-299a-45ad-57c5d463e0a2','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOS_Quotes','module',90,0),('4ea0e878-52a3-c756-dea6-57c5d4ed16ce','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOS_PDF_Templates','module',90,0),('508c998c-4cb5-0fb6-5eca-57c5d480f552','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','ProspectLists','module',90,0),('513e79b3-61b9-1f49-f705-57c5d47e55e5','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','TemplateSectionLine','module',90,0),('51466687-e7f3-6032-6a9e-57c5d49a703b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOW_WorkFlow','module',90,0),('514768b1-5708-bd43-b5fe-57c5d42b05c0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOS_Product_Categories','module',90,0),('531fac40-8e0b-bfd4-c2dc-57c5d4886bf7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Cases','module',90,0),('539b5270-0f32-6405-6d7c-57c5d41dc3ea','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Meetings','module',90,0),('53b8e8e3-9468-b41d-f855-57c5d4c0243f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOS_Invoices','module',90,0),('5535f719-06db-829c-3174-57c5d4287ce2','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOW_Processed','module',89,0),('55500ef7-7dfa-fe21-22ed-57c5d474f61b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','jjwg_Markers','module',90,0),('55a7e8be-b676-2a45-ada4-57c5d4c03945','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Campaigns','module',90,0),('55b535fd-13e1-3716-ec95-57c5d48fae0b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Bugs','module',90,0),('55e83e87-a9aa-b786-a53e-57c5d4a8ee35','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','EmailMarketing','module',90,0),('55fae38f-e479-c366-3841-57c5d4570873','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Contacts','module',90,0),('561324bb-398a-287d-4d96-57c5d49fe426','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Notes','module',90,0),('5622213f-f68c-670c-6311-57c5d4850e6f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Spots','module',90,0),('5642ac0d-977b-3468-1b82-57c5d4cea763','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AM_ProjectTemplates','module',90,0),('569b045b-a5ee-db29-d207-57c5d487655d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','OutboundEmailAccounts','module',90,0),('5b606321-ce41-f4ce-f41d-57c5d49f2210','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Leads','module',90,0),('5b86276b-0c2b-7210-f4d6-57c5d459400e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Opportunities','module',89,0),('5be9dd5e-ffcb-7086-0b1f-57c5d44e0c95','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOS_PDF_Templates','module',90,0),('5c2f4438-e4d7-879c-250d-57c5d4d2ba28','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOS_Quotes','module',90,0),('5e04b436-110c-a84d-1596-57c5d4e36db7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','ProspectLists','module',90,0),('5ec690bf-85fb-b4ef-fd53-57c5d420a981','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOS_Product_Categories','module',90,0),('5ed2fe3a-2bb1-4a47-05db-57c5d438beff','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOS_Products','module',90,0),('5ee7709c-a0cf-e4e1-1e1c-57c5d42d55e1','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOW_WorkFlow','module',90,0),('60227296-68d2-2250-1a54-57c5d479b006','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOK_KnowledgeBase','module',89,0),('602f7211-2b6b-6d2d-e339-57c5d4b473c2','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','jjwg_Maps','module',89,0),('60f590cf-13c0-43c0-f638-57c5d429912e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Meetings','module',90,0),('615bef83-37d9-53c6-0100-57c5d444615f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AM_ProjectTemplates','module',90,0),('61731447-c7b1-eccf-a9a4-57c5d471b04d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOS_Invoices','module',90,0),('61bc745f-187f-1725-2700-57c5d4f7004f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOW_Processed','module',90,0),('6345bcbe-5faa-fd27-7604-57c5d43ce703','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','TemplateSectionLine','module',90,0),('63690ca5-7d2b-3383-7ea0-57c5d466bf7b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Campaigns','module',90,0),('6373b6fd-9180-90b4-0112-57c5d4d6e39b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Bugs','module',90,0),('637f8fa7-4c23-d067-bcaf-57c5d4545bd6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Contacts','module',90,0),('63ca957e-92c1-5d46-a86f-57c5d48205ca','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Notes','module',90,0),('63cb98aa-7ea1-29e6-5ac8-57c5d4c22978','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','EmailMarketing','module',90,0),('648b6f25-0b70-0721-2eb7-57c5d458f4c1','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','OutboundEmailAccounts','module',90,0),('66080e46-c706-8bc5-a06e-57c5d4dcf656','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Leads','module',90,0),('667227a5-4595-05ce-cba4-57c5d4466086','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Opportunities','module',90,0),('69aba0ce-26b9-4093-7a41-57c5d4bed2a7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOS_Products','module',90,0),('69b7e360-e2d5-2968-15a5-57c5d498234a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOS_Quotes','module',90,0),('69d00176-289d-6454-82cd-57c5d4bff84b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','OutboundEmailAccounts','module',89,0),('69dd645d-44f2-7a00-cf05-57c5d46e4cce','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOS_PDF_Templates','module',90,0),('6b2e087f-8cdf-19d9-5128-57c5d470975e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOS_Quotes','module',89,0),('6c2301f0-44b6-21be-9efd-57c5d41e634e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AM_ProjectTemplates','module',90,0),('6c5ddd9d-1247-9cc1-891a-57c5d4364525','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOS_Product_Categories','module',90,0),('6c600c91-3130-6707-b4dd-57c5d4e042de','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOK_KnowledgeBase','module',90,0),('6cbeb46a-0e9c-5ed8-4807-57c5d47b3eb6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','jjwg_Maps','module',90,0),('6e369698-2b54-6292-0489-57c5d47789d7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Leads','module',90,0),('6e78e678-611a-4d36-387d-57c5d4affd37','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','ProspectLists','module',90,0),('6ee5f9c0-3a6e-77cc-b359-57c5d49d7844','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOW_Processed','module',90,0),('6f189d34-af9e-c5e3-ca9d-57c5d4da67f6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','TemplateSectionLine','module',90,0),('70b99cdd-ea11-a53d-a7e2-57c5d42c3dd8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Bugs','module',90,0),('712b2f81-f215-9694-d919-57c5d46c4183','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','EmailMarketing','module',90,0),('7130b7ca-89f3-284e-246a-57c5d4140feb','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Notes','module',90,0),('73e6aa2c-9053-9732-d324-57c5d4e8789f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Opportunities','module',90,0),('76f6de9a-ce01-8dc6-003d-57c5d438793b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOBH_BusinessHours','module',90,0),('7714a9cf-a75f-eee5-0cb0-57c5d486be14','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOK_KnowledgeBase','module',90,0),('771c3f65-90a5-a9d3-7722-57c5d449dd26','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOS_Products','module',90,0),('77236c79-ba1b-fe69-f028-57c5d45c013e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOS_PDF_Templates','module',90,0),('773ef0a5-dc18-5ab7-dacd-57c5d49c88e3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOS_Quotes','module',90,0),('78819b9d-b4ff-8cac-9a69-57c5d4d05194','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Users','module',89,0),('79e28846-d692-3c7b-2c05-57c5d483b92a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOS_Product_Categories','module',90,0),('79e517a5-8e6c-bb2e-f489-57c5d4110998','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','jjwg_Maps','module',90,0),('7ca51187-dd28-fd69-47ec-57c5d4c2ee51','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOW_Processed','module',90,0),('7d5e6329-7872-8425-d892-57c5d492cc31','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOW_WorkFlow','module',90,0),('7da20927-202f-9fb5-3e8e-57c5d465f49a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOR_Reports','module',90,0),('7de2e14e-8d4d-bf33-5662-57c5d41ba420','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOD_Index','module',89,0),('7eee3ccc-1dd0-f8c1-76c8-57c5d40a21c5','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','EmailMarketing','module',90,0),('806ac356-38a2-71ab-dc8b-57c5d451cf53','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOK_Knowledge_Base_Categories','module',89,0),('80838c25-b60f-2c58-6261-57c5d4faa0a3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Bugs','module',90,0),('81815c63-7c70-27a9-d92a-57c5d492d44e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Opportunities','module',90,0),('81b4475a-5da4-9af2-06eb-57c5d4da2644','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOK_KnowledgeBase','module',90,0),('82400802-9433-aa30-a478-57c5d4a504ab','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Calls_Reschedule','module',90,0),('84dc5228-2e02-39dd-4024-57c5d4906765','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOS_Products','module',90,0),('84df893f-e07e-26e8-6365-57c5d4973a0a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOS_PDF_Templates','module',90,0),('873808f7-2b68-d6f2-2182-57c5d41f9824','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOS_Product_Categories','module',90,0),('87878316-d7b9-8eb2-233d-57c5d476c7be','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','jjwg_Maps','module',90,0),('87929733-58e5-0e8d-7db9-57c5d4edea7f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOW_WorkFlow','module',90,0),('879f9076-125f-3c32-827d-57c5d44b7417','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOD_Index','module',90,0),('88c7d571-488a-f1aa-e671-57c5d4a5ca23','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','SecurityGroups','module',89,0),('8a0be2a5-2b0e-31e5-72a1-57c5d42f4acc','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOW_Processed','module',90,0),('8c3b930d-3bb3-cd9d-e726-57c5d4d93f4a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','EmailMarketing','module',90,0),('8cbd29a0-7fa8-23d9-ed20-57c5d490b985','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOK_KnowledgeBase','module',90,0),('8ce74b31-2716-a32f-4372-57c5d4735c8a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOK_Knowledge_Base_Categories','module',90,0),('8f0d4dc4-fe14-81b5-a436-57c5d428ae6c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Opportunities','module',90,0),('9221210f-d27a-faf7-2d27-57c5d48aed7e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOD_Index','module',90,0),('922a90dc-5530-3f2d-3fd5-57c5d46f1747','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOS_Products','module',90,0),('92481582-ae73-4a1f-fb94-57c5d43d76b3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOS_PDF_Templates','module',90,0),('9388ba21-67b9-5d8c-54f5-57c5d46d20a3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Documents','module',89,0),('93da97f3-79f7-7298-1c97-57c5d466faa0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Bugs','module',90,0),('93f00d5b-9eb6-a727-441e-57c5d4e422f5','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Spots','module',89,0),('94aa87fa-40f3-3521-0d4e-57c5d4ddc756','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Users','module',90,0),('94fbe291-bc2c-4d6f-2eca-57c5d45541d0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOS_Product_Categories','module',90,0),('95041f7d-fc53-672a-0a66-57c5d46c6fd1','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','jjwg_Maps','module',90,0),('950c7b58-0891-3088-a3e4-57c5d479516b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOW_WorkFlow','module',90,0),('95333a0c-ca82-0ee3-e0dc-57c5d4f3b6ff','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','SecurityGroups','module',90,0),('96942b21-d40d-9400-d3f9-57c5d42f5858','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOD_IndexEvent','module',89,0),('9746dc79-708a-136a-3346-57c5d4b44d0a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOK_Knowledge_Base_Categories','module',90,0),('9764f046-ac0a-dc7a-c00d-57c5d481f4e1','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOK_KnowledgeBase','module',90,0),('97ae8acf-58f0-2a6f-2cd6-57c5d456cc20','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Leads','module',90,0),('97fb536e-afa2-9ffa-d914-57c5d453edba','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOW_Processed','module',90,0),('9c6c387b-1b53-ecc1-9fcb-57c5d4c77589','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Opportunities','module',90,0),('9d18f37c-1c48-45c0-2406-57c5d4ef1d7e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOD_Index','module',90,0),('9e6056de-3cfc-09a5-9289-57c5d4991163','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOS_Contracts','module',89,0),('9e912b75-75f3-ae09-9365-57c5d4d12610','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','FP_Event_Locations','module',89,0),('9f2dd683-b728-669e-44b1-57c5d4189d96','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Users','module',90,0),('9f918686-4c19-325d-7a0d-57c5d47f17bc','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Documents','module',90,0),('9fdec56f-866d-e292-4abc-57c5d4dd278b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOS_Products','module',90,0),('a0df0a86-be7b-07b5-1e19-57c5d469126a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Accounts','module',90,0),('a256e9c9-499f-8fa7-ae91-57c5d429f26b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOK_Knowledge_Base_Categories','module',90,0),('a2571ab2-cf8b-02d1-18a7-57c5d46a813e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOK_KnowledgeBase','module',90,0),('a27a9482-0de6-ee09-266d-57c5d43ed48a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOS_Product_Categories','module',90,0),('a28c9334-87ae-d4e7-64a8-57c5d4881b73','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','SecurityGroups','module',90,0),('a294293d-13b1-65c6-9bb6-57c5d4f5762d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOW_WorkFlow','module',90,0),('a2cdb1f5-3e9a-a12f-b2ba-57c5d4701349','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOD_IndexEvent','module',90,0),('a2ee2cf9-2cc6-e42a-a978-57c5d4e1dac0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','jjwg_Maps','module',90,0),('a526fa00-22b0-6038-2924-57c5d4922253','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOW_Processed','module',90,0),('a6820270-8aca-a55f-4d8e-57c5d44d876b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Documents','module',90,0),('a7554fe7-5104-12a6-c2fc-57c5d4ab2b0b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Leads','module',90,0),('a7c0d72c-e860-0404-72ee-57c5d4a0f463','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOD_Index','module',90,0),('a8f39fc8-0d91-5b9a-de93-57c5d4ca8b75','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Accounts','module',89,0),('a92c3d81-0218-f791-68ee-57c5d4f8c050','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Alerts','module',89,0),('aa280cb9-b7e8-2225-2083-57c5d4c8df14','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Users','module',90,0),('aa5b6533-ac1b-2321-78c4-57c5d43d27a0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Opportunities','module',90,0),('aa967584-5c85-5964-01fc-57c5d4de9b66','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','FP_Event_Locations','module',90,0),('ac3e021f-cc4d-9e3a-8ef5-57c5d4b861ec','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','FP_events','module',90,0),('ac739a14-bdf8-051c-e2d8-57c5d4881f64','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Calls_Reschedule','module',89,0),('ad091756-edcb-7b1e-5f9b-57c5d4b66fe0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOK_KnowledgeBase','module',90,0),('ad240300-7d95-ad80-f474-57c5d420a22a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOBH_BusinessHours','module',90,0),('ad469d5f-6b4f-e363-a7f8-57c5d4322b64','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOK_Knowledge_Base_Categories','module',90,0),('ad5f3490-63d8-409c-a218-57c5d4b5674c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOD_IndexEvent','module',90,0),('ad9e76fb-9543-0e13-63f4-57c5d438a145','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOS_Contracts','module',90,0),('adcb0183-1b03-11c5-95b5-57c5d49fc8e0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOS_Contracts','module',90,0),('ae0b072d-8d51-1976-50d4-57c5d4770c67','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOR_Scheduled_Reports','module',90,0),('b00723c2-1dc7-8c7e-20de-57c5d4ba31ec','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOW_WorkFlow','module',90,0),('b010ad63-cee2-2222-f795-57c5d4d20668','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','jjwg_Maps','module',90,0),('b088918d-4e5d-1e8e-18f5-57c5d438148b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','SecurityGroups','module',90,0),('b1209b54-ae7a-963c-92c1-57c5d4a85e90','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Project','module',89,0),('b1999e38-7c20-5def-8904-57c5d4d6eda0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOP_Case_Events','module',89,0),('b1cf14e1-c652-586c-4979-57c5d4bba131','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Leads','module',90,0),('b310e039-9283-b0c2-1e10-57c5d4c979d0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOD_Index','module',90,0),('b32b71be-28b6-1890-40d4-57c69e619b9d','2016-08-31 09:07:14','2016-08-31 09:07:14','1','1','access','test1_FirstModule','module',89,0),('b32e7a1a-5df1-195a-453a-57c5d45a4dbd','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOW_Processed','module',90,0),('b3fec9f3-c3fd-09bc-fe34-57c5d47b35c3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','EmailTemplates','module',89,0),('b412908c-c7fa-ca28-f436-57c5d443aafe','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Favorites','module',89,0),('b55f3c96-0d18-fd0c-e9a6-57c5d462986e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Accounts','module',90,0),('b58ab3a4-2d69-9284-26bb-57c5d49c2e29','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Alerts','module',90,0),('b5af64d0-1ce4-27bf-da1d-57c5d495ded3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','FP_Event_Locations','module',90,0),('b5e0ab3f-3419-da5b-dd92-57c5d4d632ff','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Notes','module',89,0),('b6e340fb-806e-4e65-1027-57c5d49a5382','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','jjwg_Markers','module',89,0),('b778861d-13dd-cf18-3968-57c5d4ae882f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Users','module',90,0),('b7931b73-2566-67b6-6e58-57c5d4c1d6dd','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Opportunities','module',90,0),('b800a8fb-b4c0-e947-830d-57c5d4e4f11d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Documents','module',90,0),('b800c1a0-ce7e-a25c-4886-57c5d482cf19','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOK_Knowledge_Base_Categories','module',90,0),('b84d9f94-061f-88b3-60d5-57c5d409c2ae','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOD_IndexEvent','module',90,0),('b889fcf0-dae4-6d60-3687-57c5d4a63bc6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Calls_Reschedule','module',90,0),('b9b6039b-eddc-3fcd-8c63-57c5d48c15f7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','ProspectLists','module',89,0),('bb1cb4f2-3eee-105e-aedb-57c5d4cc6518','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOS_Contracts','module',90,0),('bc7bdd34-cde9-4c83-ad27-57c5d482d7e0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','jjwg_Address_Cache','module',89,0),('bcd9542a-c1fb-b8c1-63d1-57c5d493cdb3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Campaigns','module',90,0),('bd6572bb-dcbd-5998-2aa7-57c5d4fdb9d2','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOD_Index','module',90,0),('bd9b6836-ac91-839d-0b3f-57c5d44a9cd8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','SecurityGroups','module',90,0),('bde41ae0-de15-de44-0dbe-57c5d47f8e9d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','jjwg_Maps','module',90,0),('bea501ea-f0bd-18ff-bf15-57c5d4dab270','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Meetings','module',89,0),('bf384121-4c45-6636-ebde-57c5d408985d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOP_Case_Updates','module',89,0),('bfe35926-8782-a2df-8ef1-57c5d4ce856b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Project','module',90,0),('bff026df-7e91-e51d-7cf4-57c5d459364c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','EmailTemplates','module',90,0),('c0206605-0f67-d20a-61ff-57c5d4957100','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','FP_Event_Locations','module',90,0),('c09d16da-f554-3d20-0161-57c5d49d7b7a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Favorites','module',90,0),('c2564b79-a9f2-7f17-de2b-57c5d4338965','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Accounts','module',90,0),('c2c60c6c-5a78-b587-b10c-57c5d49a916d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Alerts','module',90,0),('c2ffdae8-de4c-b2bc-5b55-57c5d42d859b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOK_Knowledge_Base_Categories','module',90,0),('c31c93de-ba27-6122-eee8-57c5d409984d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOD_IndexEvent','module',90,0),('c38ad14b-c8d4-3c7b-412c-57c5d4b8da17','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','jjwg_Markers','module',90,0),('c5354e02-86d4-e50c-d586-57c5d40bf2eb','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Users','module',90,0),('c62bf10c-66f7-433c-32ee-57c5d48754e8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Calls_Reschedule','module',90,0),('c8696012-e761-3789-9ecc-57c5d40ec762','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOS_Contracts','module',90,0),('c88092fd-db60-4e1d-f7a8-57c5d4782c6e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOD_Index','module',90,0),('c9330d26-1e50-5f45-3930-57c5d4c640dd','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','jjwg_Address_Cache','module',90,0),('cae93a38-eb2c-48c6-c111-57c5d47b69e7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Favorites','module',90,0),('cb2002fb-c877-c7e4-cf18-57c69e3bc6be','2016-08-31 09:07:14','2016-08-31 09:07:14','1','1','delete','test1_FirstModule','module',90,0),('cb48dfe4-3409-eade-99fd-57c5d40c4517','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','FP_Event_Locations','module',90,0),('cb6b6fa8-7a34-18bd-6a67-57c5d4c4fd7c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','SecurityGroups','module',90,0),('cc7b50b2-2750-5653-5307-57c5d4799655','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Tasks','module',89,0),('cd4e684e-d5ff-fec0-8ce5-57c5d4920867','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Project','module',90,0),('cd7c2a46-733f-577d-bbac-57c5d40e6f2d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','EmailTemplates','module',90,0),('cdbb6946-9e10-7605-881a-57c5d478e8fa','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOK_Knowledge_Base_Categories','module',90,0),('cdca6ba7-a4b3-3936-bce2-57c5d4a1423d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOD_IndexEvent','module',90,0),('cddfae38-4b5a-8fcd-07ae-57c5d441bf5f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Alerts','module',90,0),('ce043178-9c4c-3330-7605-57c5d4d1f002','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOP_Case_Updates','module',90,0),('ceab0a2a-c639-cbbb-a20a-57c5d4cedba5','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','EAPM','module',90,0),('cee3b9d5-6ab4-1a03-e5f6-57c5d473a395','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Prospects','module',89,0),('cf183716-3a0a-e2e4-ea97-57c5d493bedc','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Emails','module',89,0),('cf75c8b5-e725-d293-32ac-57c5d4a9fe50','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','jjwg_Areas','module',89,0),('cf77929b-8ba1-fbfd-62cc-57c69e95a257','2016-08-31 09:07:14','2016-08-31 09:07:14','1','1','view','test1_FirstModule','module',90,0),('d01520f0-fcf5-4f96-af30-57c5d4e6c18b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Accounts','module',90,0),('d0190470-df7d-182f-914d-57c5d4e383e7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOBH_BusinessHours','module',90,0),('d085fcb2-c301-1330-bca2-57c5d4223181','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','jjwg_Markers','module',90,0),('d1e4e2f8-808e-21e2-8f2d-57c5d4b2f280','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOR_Reports','module',89,0),('d2261cf3-8c2f-1a19-fe1c-57c5d4c69006','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','FP_events','module',89,0),('d297c341-a0cd-c03f-16f1-57c5d4bae5cc','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Users','module',90,0),('d378632b-bc56-71b1-14f9-57c5d4a35c6d','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Calls_Reschedule','module',90,0),('d3d1081f-273c-e66c-4030-57c5d4cef0b0','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AM_TaskTemplates','module',90,0),('d48c9668-42b1-fbfa-2334-57c5d40b8e97','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','EAPM','module',89,0),('d5dbb769-c1e9-1f67-aee6-57c5d48dd911','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','AOS_Contracts','module',90,0),('d6147ff1-6843-b5fc-f83e-57c5d44a7ec9','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Favorites','module',90,0),('d7dd03ae-1fca-ce3c-e235-57c5d4b85598','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','jjwg_Address_Cache','module',90,0),('d8110d0d-be58-5655-b0c2-57c5d4852779','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','FP_Event_Locations','module',90,0),('d8909e6f-ed40-494d-12a6-57c5d4c1ba4e','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Tasks','module',90,0),('d8d29f55-9e3a-cc6b-a94a-57c5d498247f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','SecurityGroups','module',90,0),('d8d9b27d-071d-082c-95d9-57c5d4a61383','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOD_IndexEvent','module',90,0),('dae85273-b20e-f492-22f6-57c5d4467119','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','EmailTemplates','module',90,0),('db0c1144-f0b4-c0d6-7272-57c5d4677368','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Project','module',90,0),('db1dc4e3-187c-edfa-6d22-57c5d48587db','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Alerts','module',90,0),('db5fe61f-3d07-cab6-6e8a-57c5d47c5574','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOP_Case_Updates','module',90,0),('db8198ed-7ebe-468e-e7da-57c5d42c20e8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Emails','module',90,0),('dc1c266c-3b99-3e89-18c6-57c5d473f98b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','jjwg_Areas','module',90,0),('dc7df21c-ff8b-92b0-69cd-57c5d4649e9c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','ProjectTask','module',89,0),('dcf815b7-bcb9-d8ba-31fa-57c5d4d0c2af','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOBH_BusinessHours','module',89,0),('ddba811e-825f-1a15-fea2-57c5d454dc1c','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Prospects','module',90,0),('de1e1af1-0f40-0129-49d8-57c5d478f235','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','FP_events','module',90,0),('de4e37d0-6266-4f69-2256-57c5d4bfdf02','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','jjwg_Markers','module',90,0),('df3b296c-364d-fbcb-6568-57c5d465fe23','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Calls','module',89,0),('dff86816-04fb-36bd-f4b7-57c5d47f7f27','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','AOR_Scheduled_Reports','module',89,0),('dfffe574-093c-0aa9-5429-57c5d48bc763','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','TemplateSectionLine','module',89,0),('e08234e4-ef4b-a7f1-14f2-57c5d4a15a5a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Users','module',90,0),('e0de9bca-ce29-2b04-91c5-57c5d4958748','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','EAPM','module',90,0),('e0ff1fe3-33b9-2299-7810-57c5d4efeabb','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOR_Reports','module',90,0),('e143bae2-d165-99c8-7a59-57c5d46b73c1','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Calls_Reschedule','module',90,0),('e3792582-5436-77a3-dc63-57c5d432db30','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','AOD_IndexEvent','module',90,0),('e37aa311-11fd-dbe3-811a-57c5d4e9b7a8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','FP_Event_Locations','module',90,0),('e37ce1a9-e214-aa4e-8da5-57c69ec52da0','2016-08-31 09:07:14','2016-08-31 09:07:14','1','1','list','test1_FirstModule','module',90,0),('e39aefa7-571a-a109-12f3-57c5d41ec954','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOS_Contracts','module',90,0),('e3b8ff27-5f29-97ae-027b-57c5d4eadfb6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOP_Case_Events','module',90,0),('e5fb6b88-cd5d-3e79-9cbb-57c5d48c78ed','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Tasks','module',90,0),('e64f6187-a23e-0526-3555-57c5d44c8ee6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Favorites','module',90,0),('e69170e2-f1a2-31fc-e49a-57c5d42f953a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','jjwg_Address_Cache','module',90,0),('e83c4b28-ce40-5ac4-d948-57c5d47b5f7f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Project','module',90,0),('e8cd62c0-ef8f-49e8-ba81-57c5d4e862c6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','AOP_Case_Updates','module',90,0),('e8ce1808-d210-aaed-169d-57c5d42e2a47','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Emails','module',90,0),('e8d1aaea-a3ab-5014-535b-57c5d4ff21b3','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','EmailTemplates','module',90,0),('e9012214-4632-04bd-5b64-57c5d41ea5c8','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Alerts','module',90,0),('e904eeec-b23d-bf9b-db07-57c5d46fb7ca','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','FP_events','module',90,0),('e940f6f3-6d0e-260f-f7ce-57c5d463805a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','jjwg_Areas','module',90,0),('ea3e1563-4ed5-d9c7-60ae-57c5d44989e9','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Cases','module',89,0),('eae401ae-cc16-b48f-2bca-57c5d43f53a9','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','access','Leads','module',89,0),('eb23dc32-0c3a-83fc-7f21-57c5d4d304b6','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOBH_BusinessHours','module',90,0),('eb25cdd8-5699-47ad-dad6-57c5d4cc5655','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Prospects','module',90,0),('eb377d85-9773-9913-13d6-57c5d45cc1fc','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','ProjectTask','module',90,0),('eb8cd159-8c3f-df85-8967-57c5d4a516db','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Calls','module',90,0),('eb8ce0c6-6115-e6cc-ed27-57c5d4963462','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','EAPM','module',90,0),('eba0a1ed-b011-b27f-1e6b-57c5d48874a7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','jjwg_Markers','module',90,0),('ee2dc641-040b-e0a9-bf3a-57c5d4dc4b7b','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','FP_Event_Locations','module',90,0),('ee51859e-6b7d-570d-176b-57c5d4a44b32','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','AOR_Reports','module',90,0),('ee61e60d-1134-35e9-4a78-57c5d4b34e41','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','Notes','module',90,0),('ee9b1502-b952-e207-d822-57c5d47e789a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','Calls_Reschedule','module',90,0),('ef97d59d-0245-96aa-4e92-57c69e158453','2016-08-31 09:07:14','2016-08-31 09:07:14','1','1','edit','test1_FirstModule','module',90,0),('f137fa79-4452-f971-a259-57c5d4adf394','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','AOS_Contracts','module',90,0),('f18b9b7a-1f62-356c-86b1-57c5d448bf99','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Documents','module',90,0),('f1cad96b-785b-2643-63e2-57c5d409623a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','view','AOR_Scheduled_Reports','module',90,0),('f3c872a9-d288-7811-3123-57c5d4233f4f','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','Tasks','module',90,0),('f3ef9beb-2003-2ba0-38a6-57c5d48e1038','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','edit','FP_events','module',90,0),('f4cb0d7c-097b-a784-9fc4-57c5d4cb0769','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','Project','module',90,0),('f4fb0804-d1c5-de3b-338f-57c5d47ea028','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','list','Cases','module',90,0),('f88504a6-b37d-7b86-242a-57c5d4bad1d5','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','export','EmailTemplates','module',90,0),('f99c05b7-a10f-c4fe-37c1-57c5d43c4af4','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','delete','Emails','module',90,0),('fa2f013d-d452-467e-e694-57c5d4dac427','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','massupdate','Alerts','module',90,0),('fcbd0000-5860-7a9c-1b9f-57c5d4a4210a','2016-08-30 18:46:06','2016-08-30 18:46:06','1','','import','AOP_Case_Updates','module',90,0);
/*!40000 ALTER TABLE `acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_actions`
--

DROP TABLE IF EXISTS `acl_roles_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_actions`
--

LOCK TABLES `acl_roles_actions` WRITE;
/*!40000 ALTER TABLE `acl_roles_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_users`
--

DROP TABLE IF EXISTS `acl_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_users`
--

LOCK TABLES `acl_roles_users` WRITE;
/*!40000 ALTER TABLE `acl_roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `target_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url_redirect` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates`
--

DROP TABLE IF EXISTS `am_projecttemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `priority` varchar(100) DEFAULT 'High',
  `override_business_hours` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates`
--

LOCK TABLES `am_projecttemplates` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_audit`
--

DROP TABLE IF EXISTS `am_projecttemplates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_am_projecttemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_audit`
--

LOCK TABLES `am_projecttemplates_audit` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_contacts_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_contacts_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_contacts_1_alt` (`am_projecttemplates_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_contacts_1_c`
--

LOCK TABLES `am_projecttemplates_contacts_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_contacts_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_contacts_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_project_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_project_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_project_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_project_1_c`
--

LOCK TABLES `am_projecttemplates_project_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_project_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_project_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_projecttemplates_users_1_c`
--

DROP TABLE IF EXISTS `am_projecttemplates_users_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_projecttemplates_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_users_1_alt` (`am_projecttemplates_ida`,`users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_projecttemplates_users_1_c`
--

LOCK TABLES `am_projecttemplates_users_1_c` WRITE;
/*!40000 ALTER TABLE `am_projecttemplates_users_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_projecttemplates_users_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates`
--

DROP TABLE IF EXISTS `am_tasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_tasktemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `priority` varchar(100) DEFAULT 'High',
  `percent_complete` int(255) DEFAULT '0',
  `predecessors` int(255) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT '0',
  `relationship_type` varchar(100) DEFAULT 'FS',
  `task_number` int(255) DEFAULT NULL,
  `order_number` int(255) DEFAULT NULL,
  `estimated_effort` int(255) DEFAULT NULL,
  `utilization` varchar(100) DEFAULT '0',
  `duration` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates`
--

LOCK TABLES `am_tasktemplates` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates_am_projecttemplates_c`
--

DROP TABLE IF EXISTS `am_tasktemplates_am_projecttemplates_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates_am_projecttemplates_c`
--

LOCK TABLES `am_tasktemplates_am_projecttemplates_c` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates_am_projecttemplates_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates_am_projecttemplates_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `am_tasktemplates_audit`
--

DROP TABLE IF EXISTS `am_tasktemplates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `am_tasktemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_am_tasktemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `am_tasktemplates_audit`
--

LOCK TABLES `am_tasktemplates_audit` WRITE;
/*!40000 ALTER TABLE `am_tasktemplates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `am_tasktemplates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aobh_businesshours`
--

DROP TABLE IF EXISTS `aobh_businesshours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aobh_businesshours` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opening_hours` varchar(100) DEFAULT '1',
  `closing_hours` varchar(100) DEFAULT '1',
  `open` tinyint(1) DEFAULT NULL,
  `day` varchar(100) DEFAULT 'monday',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aobh_businesshours`
--

LOCK TABLES `aobh_businesshours` WRITE;
/*!40000 ALTER TABLE `aobh_businesshours` DISABLE KEYS */;
/*!40000 ALTER TABLE `aobh_businesshours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aobh_businesshours_audit`
--

DROP TABLE IF EXISTS `aobh_businesshours_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aobh_businesshours_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aobh_businesshours_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aobh_businesshours_audit`
--

LOCK TABLES `aobh_businesshours_audit` WRITE;
/*!40000 ALTER TABLE `aobh_businesshours_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aobh_businesshours_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_index`
--

DROP TABLE IF EXISTS `aod_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_index` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `last_optimised` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_index`
--

LOCK TABLES `aod_index` WRITE;
/*!40000 ALTER TABLE `aod_index` DISABLE KEYS */;
INSERT INTO `aod_index` VALUES ('1','Index','2016-08-30 18:51:06','2016-08-30 18:51:06','1','1',NULL,0,NULL,NULL,'modules/AOD_Index/Index/Index');
/*!40000 ALTER TABLE `aod_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_index_audit`
--

DROP TABLE IF EXISTS `aod_index_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_index_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aod_index_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_index_audit`
--

LOCK TABLES `aod_index_audit` WRITE;
/*!40000 ALTER TABLE `aod_index_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_index_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_indexevent`
--

DROP TABLE IF EXISTS `aod_indexevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_indexevent` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `success` tinyint(1) DEFAULT '0',
  `record_id` char(36) DEFAULT NULL,
  `record_module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_record_module` (`record_module`),
  KEY `idx_record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_indexevent`
--

LOCK TABLES `aod_indexevent` WRITE;
/*!40000 ALTER TABLE `aod_indexevent` DISABLE KEYS */;
INSERT INTO `aod_indexevent` VALUES ('12e9aeb5-35b7-db4b-5b18-57e54307a2e3','','2016-09-23 14:59:48','2016-09-23 15:34:03','1','1',NULL,0,'',NULL,1,'55bb02d9-2c8d-a1e4-76f0-57e543342bc8','AOR_Fields'),('1520560f-2177-fe07-a56d-57e7f407b4a6','Г-н. Бернард Лоу Монтгомери','2016-09-25 15:59:57','2016-09-27 14:49:16','1','1',NULL,0,'',NULL,1,'89febbda-b24a-38cb-68e5-57e7f4a09252','Contacts'),('1d072343-bfed-5f59-fe17-57c69f830b2c','Запись1','2016-08-31 09:13:19','2016-08-31 09:13:19','1','1',NULL,0,NULL,NULL,1,'2393261f-c4e5-8d3d-548c-57c69f158b4e','test1_FirstModule'),('1d69054a-ed53-114e-8872-57e3dd285eb1','Обращение Бисмарка.docx','2016-09-22 13:33:38','2016-09-22 13:33:38','1','1',NULL,0,NULL,NULL,1,'88b50b24-b72e-36e1-5d2b-57e3ddf0dd39','DocumentRevisions'),('2e9c00e6-3632-ed67-01ab-57e54369da10','Диаграмма1','2016-09-23 14:59:51','2016-09-23 15:34:04','1','1',NULL,0,'',NULL,1,'79b52eb6-8a8f-5674-f94f-57e543be5881','AOR_Charts'),('3ebe6471-4523-15ad-c967-57c6d2c15dfa','Call','2016-08-31 12:51:59','2016-08-31 12:51:59','1','1',NULL,0,NULL,NULL,1,'ae5509a4-673e-97af-23d8-57c6d23f02ed','Calls'),('42cc2208-6be4-b932-376e-57e3d91b7780','Contacts bf592272-f781-794c-d5b5-57d2e75d0cc4 1','2016-09-22 13:15:37','2016-09-22 13:15:37','1','1',NULL,0,NULL,NULL,1,'39d85248-dfe8-3190-127b-57e3d915246a','Favorites'),('4de2b02a-fc47-ef44-dec6-57d1638722da','Заметка1','2016-09-08 13:09:20','2016-09-08 13:10:25','1','1',NULL,0,'',NULL,1,'4d21c04d-04c4-05bb-640d-57d163b6005f','Notes'),('627e4b8c-3fd5-a1ef-fcfb-57d8540e7179','Feed Test 2','2016-09-13 19:33:15','2016-09-13 19:33:15','1','1',NULL,0,NULL,NULL,1,'7e89598f-1da0-d83f-e47b-57d854fcd064','test1_FirstModule'),('69d7fa8b-8817-f9f5-aa7f-57d424e21cf2','Г-н. Франклин Рузвельт','2016-09-10 15:19:09','2016-09-23 00:06:19','1','1',NULL,0,'',NULL,1,'cfe14298-3ef7-f8ce-e0b8-57d4247a557c','Contacts'),('6f7cde3a-e971-c9fe-26b4-57cc79d9ab9d','Г-н. Карл Густав Маннергейм','2016-09-04 19:45:04','2016-09-23 01:12:54','1','1',NULL,0,'',NULL,1,'8c309073-96e9-ba90-79b2-57cc79f1a6f3','Contacts'),('7122da7f-3442-d8ad-f882-57ceefa85462','Г-н. Шарль де Голль','2016-09-06 16:33:26','2016-09-12 18:16:48','1','1',NULL,0,'',NULL,1,'23b3056d-bbe2-ebcc-85af-57ceef165e36','Leads'),('84e3c9d2-8fd9-6c3c-d77e-57e3d9815003','Contacts bf592272-f781-794c-d5b5-57d2e75d0cc4 1','2016-09-22 13:15:49','2016-09-22 13:15:49','1','1',NULL,0,NULL,NULL,1,'b0906a85-ef37-32b3-d509-57e3d9d4644f','Favorites'),('92730bfe-bde9-6781-4310-57d188782a88','Задача1','2016-09-08 15:50:07','2016-09-08 16:13:28','1','1',NULL,0,'',NULL,1,'a60baf26-7877-ac5f-469f-57d188d4584b','Tasks'),('93ebc0a9-f4e3-e9d5-c6d1-57e5484f0daf','Г-н. Пауль фон Гинденбург','2016-09-23 15:21:14','2016-09-23 15:21:14','1','1',NULL,0,NULL,NULL,1,'8008bb98-86ab-d06b-46a5-57e5487865cd','Contacts'),('a467378b-ddaf-0eaa-1cd8-57e543bba199','','2016-09-23 14:59:45','2016-09-23 15:34:03','1','1',NULL,0,'',NULL,1,'968aa104-8a82-c97f-2cdd-57e54374206f','AOR_Fields'),('b22febb6-2980-762d-7475-57d852f5fb66','Lockheed Martin Corporation','2016-09-13 19:24:16','2016-09-13 19:24:16','1','1',NULL,0,NULL,NULL,1,'7c4b49df-70cd-c7de-b590-57d8525c48f7','Accounts'),('b760c5f8-c5ca-482d-6d51-57d2e7404c1d','Г-н. Отто фон Бисмарк','2016-09-09 16:45:13','2016-09-22 21:33:04','1','1',NULL,0,'',NULL,1,'bf592272-f781-794c-d5b5-57d2e75d0cc4','Contacts'),('b7bd003c-a418-7b4f-e098-57e291112f7f','Фердинанд Фош','2016-09-21 13:55:27','2016-09-21 13:55:27','89433a57-572b-0ba3-ed4d-57d991245a69','89433a57-572b-0ba3-ed4d-57d991245a69',NULL,0,NULL,NULL,1,'a2e4f8e5-faa8-12e4-dc70-57e29184ab84','Leads'),('bf54a653-afa7-713c-87c6-57e3ddcf45cc','Акт о провозглашении Германской империи','2016-09-22 13:33:39','2016-09-22 13:33:39','1','1',NULL,0,NULL,NULL,1,'e298e8c7-f0f2-714d-91e5-57e3dd2a19dc','Documents'),('c1c02441-b91c-9c2d-872f-57c6d0f85508','CGimpel','2016-08-31 12:41:50','2016-09-22 23:47:06','1','1',NULL,0,'',NULL,1,'60fe5f52-f51a-12ce-c534-57c6d0e7541e','Accounts'),('c9084f1c-6c63-7482-ac99-57e28f65e124','John Mertic','2016-09-21 13:47:41','2016-09-21 13:47:41','89433a57-572b-0ba3-ed4d-57d991245a69','89433a57-572b-0ba3-ed4d-57d991245a69',NULL,0,NULL,NULL,1,'157a630c-659e-f02a-32a2-57e28f9a6679','Leads'),('d724434f-d9c1-5cc7-d916-57cc056f8b37','Deal1','2016-09-04 11:28:16','2016-09-04 11:28:16','1','1',NULL,0,NULL,NULL,1,'2cd7cb8a-e9b9-761d-df86-57cc0563d21a','Opportunities'),('da9721fb-9561-56cc-d6ed-57e543705c68','','2016-09-23 14:59:49','2016-09-23 15:34:03','1','1',NULL,0,'',NULL,1,'2af1a14b-2d37-c6c4-5a91-57e543953045','AOR_Fields'),('dbded9c8-bcd1-10f1-be50-57cc7b1478b2','Sigizmund Inc.','2016-09-04 19:51:06','2016-09-22 12:47:31','1','1',NULL,0,'',NULL,1,'8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','Accounts'),('dca6181a-542d-e7d4-1804-57e54314c07f','Отчет1','2016-09-23 14:59:37','2016-09-23 15:34:02','1','1',NULL,0,'',NULL,1,'9b3aa569-3016-7fd1-e6e7-57e543e13023','AOR_Reports'),('de403073-d9d3-6f16-ba9e-57c7ea2630a4','Event1','2016-09-01 08:45:24','2016-09-01 08:45:24','1','1',NULL,0,NULL,NULL,1,'1f665e48-b48e-8f6f-7ea9-57c7ea10a262','FP_events');
/*!40000 ALTER TABLE `aod_indexevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aod_indexevent_audit`
--

DROP TABLE IF EXISTS `aod_indexevent_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aod_indexevent_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aod_indexevent_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aod_indexevent_audit`
--

LOCK TABLES `aod_indexevent_audit` WRITE;
/*!40000 ALTER TABLE `aod_indexevent_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aod_indexevent_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledge_base_categories`
--

DROP TABLE IF EXISTS `aok_knowledge_base_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledge_base_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledge_base_categories`
--

LOCK TABLES `aok_knowledge_base_categories` WRITE;
/*!40000 ALTER TABLE `aok_knowledge_base_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledge_base_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledge_base_categories_audit`
--

DROP TABLE IF EXISTS `aok_knowledge_base_categories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledge_base_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledge_base_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledge_base_categories_audit`
--

LOCK TABLES `aok_knowledge_base_categories_audit` WRITE;
/*!40000 ALTER TABLE `aok_knowledge_base_categories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledge_base_categories_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase`
--

DROP TABLE IF EXISTS `aok_knowledgebase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledgebase` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `revision` varchar(255) DEFAULT NULL,
  `additional_info` text,
  `user_id_c` char(36) DEFAULT NULL,
  `user_id1_c` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase`
--

LOCK TABLES `aok_knowledgebase` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase_audit`
--

DROP TABLE IF EXISTS `aok_knowledgebase_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledgebase_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledgebase_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase_audit`
--

LOCK TABLES `aok_knowledgebase_audit` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aok_knowledgebase_categories`
--

DROP TABLE IF EXISTS `aok_knowledgebase_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aok_knowledgebase_categories` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aok_knowledgebase_id` varchar(36) DEFAULT NULL,
  `aok_knowledge_base_categories_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aok_knowledgebase_categories_alt` (`aok_knowledgebase_id`,`aok_knowledge_base_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aok_knowledgebase_categories`
--

LOCK TABLES `aok_knowledgebase_categories` WRITE;
/*!40000 ALTER TABLE `aok_knowledgebase_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aok_knowledgebase_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events`
--

DROP TABLE IF EXISTS `aop_case_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events`
--

LOCK TABLES `aop_case_events` WRITE;
/*!40000 ALTER TABLE `aop_case_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events_audit`
--

DROP TABLE IF EXISTS `aop_case_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events_audit`
--

LOCK TABLES `aop_case_events_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates`
--

DROP TABLE IF EXISTS `aop_case_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_updates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates`
--

LOCK TABLES `aop_case_updates` WRITE;
/*!40000 ALTER TABLE `aop_case_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates_audit`
--

DROP TABLE IF EXISTS `aop_case_updates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_updates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_updates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates_audit`
--

LOCK TABLES `aop_case_updates_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_updates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_charts`
--

DROP TABLE IF EXISTS `aor_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_charts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `x_field` int(11) DEFAULT NULL,
  `y_field` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_charts`
--

LOCK TABLES `aor_charts` WRITE;
/*!40000 ALTER TABLE `aor_charts` DISABLE KEYS */;
INSERT INTO `aor_charts` VALUES ('79b52eb6-8a8f-5674-f94f-57e543be5881','Диаграмма1','2016-09-23 14:59:35','2016-09-23 15:34:01','1','1',NULL,0,'9b3aa569-3016-7fd1-e6e7-57e543e13023','grouped_bar',0,2);
/*!40000 ALTER TABLE `aor_charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_conditions`
--

DROP TABLE IF EXISTS `aor_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `logic_op` varchar(255) DEFAULT NULL,
  `parenthesis` varchar(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `parameter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_conditions_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_conditions`
--

LOCK TABLES `aor_conditions` WRITE;
/*!40000 ALTER TABLE `aor_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_fields`
--

DROP TABLE IF EXISTS `aor_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_fields` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `field_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `link` tinyint(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `field_function` varchar(100) DEFAULT NULL,
  `sort_by` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `group_by` tinyint(1) DEFAULT NULL,
  `group_order` varchar(100) DEFAULT NULL,
  `group_display` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_fields_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_fields`
--

LOCK TABLES `aor_fields` WRITE;
/*!40000 ALTER TABLE `aor_fields` DISABLE KEYS */;
INSERT INTO `aor_fields` VALUES ('2af1a14b-2d37-c6c4-5a91-57e543953045','','2016-09-23 14:59:35','2016-09-23 15:34:01','1','1',NULL,0,'9b3aa569-3016-7fd1-e6e7-57e543e13023',2,'YToxOntpOjA7czowOiIiO30=','last_name',1,0,'Фамилия','COUNT',NULL,NULL,'COUNT',NULL,0,NULL,NULL),('55bb02d9-2c8d-a1e4-76f0-57e543342bc8','','2016-09-23 14:59:35','2016-09-23 15:34:01','1','1',NULL,0,'9b3aa569-3016-7fd1-e6e7-57e543e13023',1,'YToxOntpOjA7czowOiIiO30=','id',0,0,'ID',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),('968aa104-8a82-c97f-2cdd-57e54374206f','','2016-09-23 14:59:35','2016-09-23 15:34:01','1','1',NULL,0,'9b3aa569-3016-7fd1-e6e7-57e543e13023',0,'YToxOntpOjA7czowOiIiO30=','primary_address_country',1,0,'Основной адрес - страна',NULL,'ASC',NULL,NULL,NULL,1,NULL,1);
/*!40000 ALTER TABLE `aor_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports`
--

DROP TABLE IF EXISTS `aor_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `report_module` varchar(100) DEFAULT NULL,
  `graphs_per_row` int(11) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports`
--

LOCK TABLES `aor_reports` WRITE;
/*!40000 ALTER TABLE `aor_reports` DISABLE KEYS */;
INSERT INTO `aor_reports` VALUES ('9b3aa569-3016-7fd1-e6e7-57e543e13023','Отчет1','2016-09-23 14:59:35','2016-09-23 15:34:01','1','1',NULL,0,'1','Contacts',2);
/*!40000 ALTER TABLE `aor_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports_audit`
--

DROP TABLE IF EXISTS `aor_reports_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aor_reports_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports_audit`
--

LOCK TABLES `aor_reports_audit` WRITE;
/*!40000 ALTER TABLE `aor_reports_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_reports_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_scheduled_reports`
--

DROP TABLE IF EXISTS `aor_scheduled_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_scheduled_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `schedule` varchar(100) DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `email_recipients` longtext,
  `aor_report_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_scheduled_reports`
--

LOCK TABLES `aor_scheduled_reports` WRITE;
/*!40000 ALTER TABLE `aor_scheduled_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_scheduled_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts`
--

DROP TABLE IF EXISTS `aos_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_contract_value` decimal(26,6) DEFAULT NULL,
  `total_contract_value_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `customer_signed_date` date DEFAULT NULL,
  `company_signed_date` date DEFAULT NULL,
  `renewal_reminder_date` datetime DEFAULT NULL,
  `contract_type` varchar(100) DEFAULT 'Type',
  `contract_account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts`
--

LOCK TABLES `aos_contracts` WRITE;
/*!40000 ALTER TABLE `aos_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_audit`
--

DROP TABLE IF EXISTS `aos_contracts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_contracts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_audit`
--

LOCK TABLES `aos_contracts_audit` WRITE;
/*!40000 ALTER TABLE `aos_contracts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_documents`
--

DROP TABLE IF EXISTS `aos_contracts_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_documents`
--

LOCK TABLES `aos_contracts_documents` WRITE;
/*!40000 ALTER TABLE `aos_contracts_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices`
--

DROP TABLE IF EXISTS `aos_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_invoices` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `quote_number` int(11) DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `template_ddown_c` text,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices`
--

LOCK TABLES `aos_invoices` WRITE;
/*!40000 ALTER TABLE `aos_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices_audit`
--

DROP TABLE IF EXISTS `aos_invoices_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_invoices_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_invoices_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices_audit`
--

LOCK TABLES `aos_invoices_audit` WRITE;
/*!40000 ALTER TABLE `aos_invoices_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups`
--

DROP TABLE IF EXISTS `aos_line_item_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_line_item_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups`
--

LOCK TABLES `aos_line_item_groups` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups_audit`
--

DROP TABLE IF EXISTS `aos_line_item_groups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_line_item_groups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_line_item_groups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups_audit`
--

LOCK TABLES `aos_line_item_groups_audit` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates`
--

DROP TABLE IF EXISTS `aos_pdf_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_pdf_templates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `type` varchar(100) DEFAULT NULL,
  `pdfheader` text,
  `pdffooter` text,
  `margin_left` int(255) DEFAULT '15',
  `margin_right` int(255) DEFAULT '15',
  `margin_top` int(255) DEFAULT '16',
  `margin_bottom` int(255) DEFAULT '16',
  `margin_header` int(255) DEFAULT '9',
  `margin_footer` int(255) DEFAULT '9',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates`
--

LOCK TABLES `aos_pdf_templates` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates_audit`
--

DROP TABLE IF EXISTS `aos_pdf_templates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_pdf_templates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_pdf_templates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates_audit`
--

LOCK TABLES `aos_pdf_templates_audit` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories`
--

DROP TABLE IF EXISTS `aos_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_product_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '0',
  `parent_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories`
--

LOCK TABLES `aos_product_categories` WRITE;
/*!40000 ALTER TABLE `aos_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories_audit`
--

DROP TABLE IF EXISTS `aos_product_categories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_product_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_product_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories_audit`
--

LOCK TABLES `aos_product_categories_audit` WRITE;
/*!40000 ALTER TABLE `aos_product_categories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products`
--

DROP TABLE IF EXISTS `aos_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `maincode` varchar(100) DEFAULT 'XXXX',
  `part_number` varchar(25) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'Good',
  `cost` decimal(26,6) DEFAULT NULL,
  `cost_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `price` decimal(26,6) DEFAULT NULL,
  `price_usdollar` decimal(26,6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `aos_product_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products`
--

LOCK TABLES `aos_products` WRITE;
/*!40000 ALTER TABLE `aos_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_audit`
--

DROP TABLE IF EXISTS `aos_products_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_audit`
--

LOCK TABLES `aos_products_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes`
--

DROP TABLE IF EXISTS `aos_products_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_quotes` (
  `id` char(36) NOT NULL,
  `name` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `item_description` text,
  `number` int(11) DEFAULT NULL,
  `product_qty` decimal(18,4) DEFAULT NULL,
  `product_cost_price` decimal(26,6) DEFAULT NULL,
  `product_cost_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_list_price` decimal(26,6) DEFAULT NULL,
  `product_list_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount` decimal(26,6) DEFAULT NULL,
  `product_discount_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount_amount` decimal(26,6) DEFAULT NULL,
  `product_discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount` varchar(255) DEFAULT 'Percentage',
  `product_unit_price` decimal(26,6) DEFAULT NULL,
  `product_unit_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat_amt` decimal(26,6) DEFAULT NULL,
  `vat_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `product_total_price` decimal(26,6) DEFAULT NULL,
  `product_total_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat` varchar(100) DEFAULT '5.0',
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes`
--

LOCK TABLES `aos_products_quotes` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes_audit`
--

DROP TABLE IF EXISTS `aos_products_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes_audit`
--

LOCK TABLES `aos_products_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes`
--

DROP TABLE IF EXISTS `aos_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `approval_issue` text,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `number` int(11) NOT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `template_ddown_c` text,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `stage` varchar(100) DEFAULT 'Draft',
  `term` varchar(100) DEFAULT NULL,
  `terms_c` text,
  `approval_status` varchar(100) DEFAULT NULL,
  `invoice_status` varchar(100) DEFAULT 'Not Invoiced',
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes`
--

LOCK TABLES `aos_quotes` WRITE;
/*!40000 ALTER TABLE `aos_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_aos_invoices_c`
--

DROP TABLE IF EXISTS `aos_quotes_aos_invoices_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_aos_invoices_c`
--

LOCK TABLES `aos_quotes_aos_invoices_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_audit`
--

DROP TABLE IF EXISTS `aos_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_audit`
--

LOCK TABLES `aos_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_os_contracts_c`
--

DROP TABLE IF EXISTS `aos_quotes_os_contracts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_os_contracts_c`
--

LOCK TABLES `aos_quotes_os_contracts_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_project_c`
--

DROP TABLE IF EXISTS `aos_quotes_project_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_project_c`
--

LOCK TABLES `aos_quotes_project_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_project_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_project_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_actions`
--

DROP TABLE IF EXISTS `aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_actions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `action_order` int(255) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `parameters` longtext,
  PRIMARY KEY (`id`),
  KEY `aow_action_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_actions`
--

LOCK TABLES `aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_conditions`
--

DROP TABLE IF EXISTS `aow_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_conditions`
--

LOCK TABLES `aow_conditions` WRITE;
/*!40000 ALTER TABLE `aow_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed`
--

DROP TABLE IF EXISTS `aow_processed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_processed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `aow_processed_index_workflow` (`aow_workflow_id`,`status`,`parent_id`,`deleted`),
  KEY `aow_processed_index_status` (`status`),
  KEY `aow_processed_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed`
--

LOCK TABLES `aow_processed` WRITE;
/*!40000 ALTER TABLE `aow_processed` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed_aow_actions`
--

DROP TABLE IF EXISTS `aow_processed_aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_processed_aow_actions` (
  `id` varchar(36) NOT NULL,
  `aow_processed_id` varchar(36) DEFAULT NULL,
  `aow_action_id` varchar(36) DEFAULT NULL,
  `status` varchar(36) DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed_aow_actions`
--

LOCK TABLES `aow_processed_aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_processed_aow_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed_aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow`
--

DROP TABLE IF EXISTS `aow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_workflow` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `flow_module` varchar(100) DEFAULT NULL,
  `flow_run_on` varchar(100) DEFAULT '0',
  `status` varchar(100) DEFAULT 'Active',
  `run_when` varchar(100) DEFAULT 'Always',
  `multiple_runs` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aow_workflow_index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow`
--

LOCK TABLES `aow_workflow` WRITE;
/*!40000 ALTER TABLE `aow_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow_audit`
--

DROP TABLE IF EXISTS `aow_workflow_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_workflow_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aow_workflow_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow_audit`
--

LOCK TABLES `aow_workflow_audit` WRITE;
/*!40000 ALTER TABLE `aow_workflow_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_workflow_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs`
--

LOCK TABLES `bugs` WRITE;
/*!40000 ALTER TABLE `bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_audit`
--

DROP TABLE IF EXISTS `bugs_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_audit`
--

LOCK TABLES `bugs_audit` WRITE;
/*!40000 ALTER TABLE `bugs_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
INSERT INTO `calls` VALUES ('ae5509a4-673e-97af-23d8-57c6d23f02ed','Call','2016-08-31 12:51:58','2016-08-31 12:51:58','1','1','',0,'1',1,15,'2016-08-31 13:00:00','2016-08-31 14:15:00','Accounts','Planned','Inbound','60fe5f52-f51a-12ce-c534-57c6d0e7541e',-1,-1,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_contacts`
--

DROP TABLE IF EXISTS `calls_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_contacts`
--

LOCK TABLES `calls_contacts` WRITE;
/*!40000 ALTER TABLE `calls_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_leads`
--

DROP TABLE IF EXISTS `calls_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_leads`
--

LOCK TABLES `calls_leads` WRITE;
/*!40000 ALTER TABLE `calls_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule`
--

DROP TABLE IF EXISTS `calls_reschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_reschedule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule`
--

LOCK TABLES `calls_reschedule` WRITE;
/*!40000 ALTER TABLE `calls_reschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule_audit`
--

DROP TABLE IF EXISTS `calls_reschedule_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_reschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_calls_reschedule_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule_audit`
--

LOCK TABLES `calls_reschedule_audit` WRITE;
/*!40000 ALTER TABLE `calls_reschedule_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_users`
--

DROP TABLE IF EXISTS `calls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_users`
--

LOCK TABLES `calls_users` WRITE;
/*!40000 ALTER TABLE `calls_users` DISABLE KEYS */;
INSERT INTO `calls_users` VALUES ('7ba3cd70-5093-247c-7650-57c6d2d9eb83','ae5509a4-673e-97af-23d8-57c6d23f02ed','1','1','accept','2016-08-31 12:51:58',0);
/*!40000 ALTER TABLE `calls_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_log`
--

DROP TABLE IF EXISTS `campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_log`
--

LOCK TABLES `campaign_log` WRITE;
/*!40000 ALTER TABLE `campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_trkrs`
--

DROP TABLE IF EXISTS `campaign_trkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_trkrs`
--

LOCK TABLES `campaign_trkrs` WRITE;
/*!40000 ALTER TABLE `campaign_trkrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_trkrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_audit`
--

DROP TABLE IF EXISTS `campaigns_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_audit`
--

LOCK TABLES `campaigns_audit` WRITE;
/*!40000 ALTER TABLE `campaigns_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  `state` varchar(100) DEFAULT 'Open',
  `contact_created_by_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_audit`
--

DROP TABLE IF EXISTS `cases_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_audit`
--

LOCK TABLES `cases_audit` WRITE;
/*!40000 ALTER TABLE `cases_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_bugs`
--

DROP TABLE IF EXISTS `cases_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_bugs`
--

LOCK TABLES `cases_bugs` WRITE;
/*!40000 ALTER TABLE `cases_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_cstm`
--

DROP TABLE IF EXISTS `cases_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_cstm`
--

LOCK TABLES `cases_cstm` WRITE;
/*!40000 ALTER TABLE `cases_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('notify','fromaddress','do_not_reply@example.com'),('notify','fromname','SuiteCRM'),('notify','send_by_default','1'),('notify','on','1'),('notify','send_from_assigning_user','0'),('info','sugar_version','6.5.24'),('MySettings','tab','YTozNjp7czo0OiJIb21lIjtzOjQ6IkhvbWUiO3M6ODoiQWNjb3VudHMiO3M6ODoiQWNjb3VudHMiO3M6ODoiQ29udGFjdHMiO3M6ODoiQ29udGFjdHMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6NToiTGVhZHMiO3M6NToiTGVhZHMiO3M6MTA6IkFPU19RdW90ZXMiO3M6MTA6IkFPU19RdW90ZXMiO3M6ODoiQ2FsZW5kYXIiO3M6ODoiQ2FsZW5kYXIiO3M6OToiRG9jdW1lbnRzIjtzOjk6IkRvY3VtZW50cyI7czo2OiJFbWFpbHMiO3M6NjoiRW1haWxzIjtzOjU6IlNwb3RzIjtzOjU6IlNwb3RzIjtzOjk6IkNhbXBhaWducyI7czo5OiJDYW1wYWlnbnMiO3M6NToiQ2FsbHMiO3M6NToiQ2FsbHMiO3M6ODoiTWVldGluZ3MiO3M6ODoiTWVldGluZ3MiO3M6NToiVGFza3MiO3M6NToiVGFza3MiO3M6NToiTm90ZXMiO3M6NToiTm90ZXMiO3M6MTI6IkFPU19JbnZvaWNlcyI7czoxMjoiQU9TX0ludm9pY2VzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjU6IkNhc2VzIjtzOjU6IkNhc2VzIjtzOjk6IlByb3NwZWN0cyI7czo5OiJQcm9zcGVjdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6NzoiUHJvamVjdCI7czo3OiJQcm9qZWN0IjtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtzOjk6IkZQX2V2ZW50cyI7czo5OiJGUF9ldmVudHMiO3M6MTg6IkZQX0V2ZW50X0xvY2F0aW9ucyI7czoxODoiRlBfRXZlbnRfTG9jYXRpb25zIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6MTI6IkFPU19Qcm9kdWN0cyI7czoyMjoiQU9TX1Byb2R1Y3RfQ2F0ZWdvcmllcyI7czoyMjoiQU9TX1Byb2R1Y3RfQ2F0ZWdvcmllcyI7czoxNzoiQU9TX1BERl9UZW1wbGF0ZXMiO3M6MTc6IkFPU19QREZfVGVtcGxhdGVzIjtzOjk6Impqd2dfTWFwcyI7czo5OiJqandnX01hcHMiO3M6MTI6Impqd2dfTWFya2VycyI7czoxMjoiamp3Z19NYXJrZXJzIjtzOjEwOiJqandnX0FyZWFzIjtzOjEwOiJqandnX0FyZWFzIjtzOjE4OiJqandnX0FkZHJlc3NfQ2FjaGUiO3M6MTg6Impqd2dfQWRkcmVzc19DYWNoZSI7czoxMToiQU9SX1JlcG9ydHMiO3M6MTE6IkFPUl9SZXBvcnRzIjtzOjEyOiJBT1dfV29ya0Zsb3ciO3M6MTI6IkFPV19Xb3JrRmxvdyI7czoxNzoiQU9LX0tub3dsZWRnZUJhc2UiO3M6MTc6IkFPS19Lbm93bGVkZ2VCYXNlIjtzOjI5OiJBT0tfS25vd2xlZGdlX0Jhc2VfQ2F0ZWdvcmllcyI7czoyOToiQU9LX0tub3dsZWRnZV9CYXNlX0NhdGVnb3JpZXMiO3M6MTc6InRlc3QxX0ZpcnN0TW9kdWxlIjtzOjE3OiJ0ZXN0MV9GaXJzdE1vZHVsZSI7fQ=='),('portal','on','0'),('tracker','Tracker','1'),('system','skypeout_on','1'),('sugarfeed','enabled','1'),('sugarfeed','module_UserFeed','1'),('sugarfeed','module_Cases','1'),('sugarfeed','module_Contacts','1'),('sugarfeed','module_Leads','1'),('sugarfeed','module_Opportunities','1'),('Update','CheckUpdates','manual'),('system','name','SuiteCRM'),('system','adminwizard','1'),('proxy','on','0'),('proxy','host',''),('proxy','port',''),('proxy','auth','0'),('proxy','username',''),('proxy','password',''),('sugarfeed','module_Accounts','1'),('sugarfeed','module_Facebook','0'),('sugarfeed','module_Twitter','0'),('sugarfeed','module_test1_FirstModule','1'),('system','test01_on','1'),('system','test01','true'),('jjwg','valid_geocode_modules','Accounts, Contacts, Leads, Opportunities, Cases, Project, Meetings, Prospects'),('jjwg','valid_geocode_tables','accounts, contacts, leads, opportunities, cases, project, meetings, prospects'),('jjwg','address_type_Accounts','billing'),('jjwg','address_type_Contacts','primary'),('jjwg','address_type_Leads','primary'),('jjwg','address_type_Opportunities','billing'),('jjwg','address_type_Cases','billing'),('jjwg','address_type_Project','billing'),('jjwg','address_type_Meetings','flex_relate'),('jjwg','address_type_Prospects','primary'),('jjwg','grouping_field_Accounts','industry'),('jjwg','grouping_field_Contacts','assigned_user_name'),('jjwg','grouping_field_Leads','status'),('jjwg','grouping_field_Opportunities','sales_stage'),('jjwg','grouping_field_Cases','priority'),('jjwg','grouping_field_Project','assigned_user_name'),('jjwg','grouping_field_Meetings','assigned_user_name'),('jjwg','grouping_field_Prospects','assigned_user_name'),('jjwg','geocoding_limit','250'),('jjwg','google_geocoding_limit','100'),('jjwg','map_markers_limit','1000'),('jjwg','map_default_distance','250'),('jjwg','export_addresses_limit','50000'),('jjwg','map_clusterer_grid_size','50'),('jjwg','map_clusterer_max_zoom','14'),('jjwg','address_cache_get_enabled','1'),('jjwg','address_cache_save_enabled','1'),('jjwg','logic_hooks_enabled','0'),('jjwg','allow_approximate_location_type','1'),('jjwg','map_default_unit_type','mi'),('jjwg','map_duplicate_marker_adjustment','2.0E-5'),('jjwg','map_default_center_latitude','39.5'),('jjwg','map_default_center_longitude','-99.5'),('jjwg','geocoding_api_url','https://maps.googleapis.com/maps/api/geocode/json?sensor=false'),('jjwg','geocoding_api_secret','');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `joomla_account_id` varchar(255) DEFAULT NULL,
  `portal_account_disabled` tinyint(1) DEFAULT NULL,
  `portal_user_type` varchar(100) DEFAULT 'Single',
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES ('8008bb98-86ab-d06b-46a5-57e5487865cd','2016-09-23 15:21:11','2016-09-23 15:21:11','1','1','описание Гинденбург',0,'1','Mr.','Пауль','фон Гинденбург','Президент Веймарской республики',NULL,'',0,NULL,'','',NULL,'','Веттергассе','Марбург','Гессен','35037','Германия','Веттергассе','Марбург','Гессен','35037','Германия',NULL,NULL,'','','1847-09-30','',NULL,NULL,'Single'),('89febbda-b24a-38cb-68e5-57e7f4a09252','2016-09-25 15:59:55','2016-09-27 14:49:15','1','1','Монтгомери описание',0,'1','Mr.','Бернард Лоу','Монтгомери','Фельдмаршал',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Кенсингтон-Хай-Стрит','Лондон','Большой Лондон','W8','Великобритания',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','1887-09-29','',NULL,0,'Single'),('8c309073-96e9-ba90-79b2-57cc79f1a6f3','2016-08-25 19:45:01','2016-09-23 01:12:52','1','1','Описаниее',0,'1','Mr.','Карл Густав','Маннергейм','Фельдмаршал',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'улица','Хельсинки','область','00200','Финляндия','улица','Хельсинки','область','00200','Финляндия',NULL,NULL,'Word of mouth','8c309073-96e9-ba90-79b2-57cc79f1a6f3','1867-09-26','',NULL,0,'Single'),('bf592272-f781-794c-d5b5-57d2e75d0cc4','2016-08-26 16:45:09','2016-09-22 21:33:01','1','1','описание',0,'1','Mr.','Отто','фон Бисмарк','Рейхсканцлер',NULL,NULL,0,NULL,NULL,'123456',NULL,NULL,'Шайдеманштрассе','Берлин','область','123456','Германия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Conference','','1815-09-27','',NULL,0,'Single'),('cfe14298-3ef7-f8ce-e0b8-57d4247a557c','2016-08-27 15:19:06','2016-09-23 00:06:17','1','1','описание Рузвельт',0,'1','Mr.','Франклин','Рузвельт','Президент',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Пенсильвания-авеню','Вашингтон','округ Колумбия','20500','США','Пенсильвания-авеню','Вашингтон','округ Колумбия','20500','США',NULL,NULL,'Existing Customer','','1882-09-28','',NULL,0,'Single');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_audit`
--

DROP TABLE IF EXISTS `contacts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_audit`
--

LOCK TABLES `contacts_audit` WRITE;
/*!40000 ALTER TABLE `contacts_audit` DISABLE KEYS */;
INSERT INTO `contacts_audit` VALUES ('e2381bcf-51ad-9d83-f2d6-57cc7bcf8e0b','8c309073-96e9-ba90-79b2-57cc79f1a6f3','2016-09-04 19:54:21','1','phone_work','phone','123456','',NULL,NULL);
/*!40000 ALTER TABLE `contacts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_bugs`
--

DROP TABLE IF EXISTS `contacts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_bugs`
--

LOCK TABLES `contacts_bugs` WRITE;
/*!40000 ALTER TABLE `contacts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cases`
--

DROP TABLE IF EXISTS `contacts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cases`
--

LOCK TABLES `contacts_cases` WRITE;
/*!40000 ALTER TABLE `contacts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cstm`
--

DROP TABLE IF EXISTS `contacts_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cstm`
--

LOCK TABLES `contacts_cstm` WRITE;
/*!40000 ALTER TABLE `contacts_cstm` DISABLE KEYS */;
INSERT INTO `contacts_cstm` VALUES ('8008bb98-86ab-d06b-46a5-57e5487865cd',8.77079582,50.81020737,'OK','Веттергассе, Марбург, Гессен, 35037, Германия'),('89febbda-b24a-38cb-68e5-57e7f4a09252',-0.19460650,51.50044250,'OK','Кенсингтон-Хай-Стрит, Лондон, Большой Лондон, W8, Великобритания'),('8c309073-96e9-ba90-79b2-57cc79f1a6f3',0.00000000,0.00000000,'ZERO_RESULTS','улица, Хельсинки, область, 123354, Финляндия'),('bf592272-f781-794c-d5b5-57d2e75d0cc4',13.37344551,52.51777267,'OK','Шайдеманштрассе, Берлин, область, 123456, Германия'),('cfe14298-3ef7-f8ce-e0b8-57d4247a557c',0.00000000,0.00000000,'ZERO_RESULTS','улица, Вашингтон, область, 123354, США');
/*!40000 ALTER TABLE `contacts_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_users`
--

DROP TABLE IF EXISTS `contacts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_users`
--

LOCK TABLES `contacts_users` WRITE;
/*!40000 ALTER TABLE `contacts_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_remove_documents`
--

DROP TABLE IF EXISTS `cron_remove_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_remove_documents`
--

LOCK TABLES `cron_remove_documents` WRITE;
/*!40000 ALTER TABLE `cron_remove_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_remove_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_revisions`
--

DROP TABLE IF EXISTS `document_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_revisions`
--

LOCK TABLES `document_revisions` WRITE;
/*!40000 ALTER TABLE `document_revisions` DISABLE KEYS */;
INSERT INTO `document_revisions` VALUES ('88b50b24-b72e-36e1-5d2b-57e3ddf0dd39','Документ создан','e298e8c7-f0f2-714d-91e5-57e3dd2a19dc','','Sugar','','2016-09-22 13:33:37','1','Обращение Бисмарка.docx','docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','1',0,'2016-09-22 13:33:37');
/*!40000 ALTER TABLE `document_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES ('e298e8c7-f0f2-714d-91e5-57e3dd2a19dc','2016-09-22 13:33:37','2016-09-22 13:33:37','1','1','18/01/1871',0,NULL,'Акт о провозглашении Германской империи','','Sugar','','1971-01-18',NULL,'',NULL,'Expired','88b50b24-b72e-36e1-5d2b-57e3ddf0dd39',NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_accounts`
--

DROP TABLE IF EXISTS `documents_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_accounts`
--

LOCK TABLES `documents_accounts` WRITE;
/*!40000 ALTER TABLE `documents_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_bugs`
--

DROP TABLE IF EXISTS `documents_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_bugs`
--

LOCK TABLES `documents_bugs` WRITE;
/*!40000 ALTER TABLE `documents_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_cases`
--

DROP TABLE IF EXISTS `documents_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cases`
--

LOCK TABLES `documents_cases` WRITE;
/*!40000 ALTER TABLE `documents_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_contacts`
--

DROP TABLE IF EXISTS `documents_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_contacts`
--

LOCK TABLES `documents_contacts` WRITE;
/*!40000 ALTER TABLE `documents_contacts` DISABLE KEYS */;
INSERT INTO `documents_contacts` VALUES ('6777522a-e8a2-0ec6-6bb8-57e3dd1cc4c4','2016-09-22 13:33:37',0,'e298e8c7-f0f2-714d-91e5-57e3dd2a19dc','bf592272-f781-794c-d5b5-57d2e75d0cc4');
/*!40000 ALTER TABLE `documents_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_opportunities`
--

DROP TABLE IF EXISTS `documents_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_opportunities`
--

LOCK TABLES `documents_opportunities` WRITE;
/*!40000 ALTER TABLE `documents_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eapm`
--

DROP TABLE IF EXISTS `eapm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eapm`
--

LOCK TABLES `eapm` WRITE;
/*!40000 ALTER TABLE `eapm` DISABLE KEYS */;
/*!40000 ALTER TABLE `eapm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addr_bean_rel`
--

DROP TABLE IF EXISTS `email_addr_bean_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addr_bean_rel`
--

LOCK TABLES `email_addr_bean_rel` WRITE;
/*!40000 ALTER TABLE `email_addr_bean_rel` DISABLE KEYS */;
INSERT INTO `email_addr_bean_rel` VALUES ('10a53a3a-8b92-061f-0a71-57e44e7c77e9','8e9f4b24-a3b1-7923-52e3-57d6f1c62a6b','bf592272-f781-794c-d5b5-57d2e75d0cc4','Contacts',1,0,'2016-09-22 21:33:01','2016-09-22 21:33:01',0),('285807c2-46d1-76bc-f4f9-57e1b7b46154','8e9f4b24-a3b1-7923-52e3-57d6f1c62a6b','89433a57-572b-0ba3-ed4d-57d991245a69','Users',1,0,'2016-09-20 22:24:00','2016-09-20 22:24:00',0),('303bd211-d8b1-52ad-942f-57e7f4cbf2c5','30829983-954b-138e-5e7c-57e7f4c29636','89febbda-b24a-38cb-68e5-57e7f4a09252','Contacts',1,0,'2016-09-25 15:59:55','2016-09-25 15:59:55',0),('389f1cfc-c482-c517-05f8-57e3d9f67be5','c6150b88-9f1a-6962-cdfd-57d2e76f8304','bf592272-f781-794c-d5b5-57d2e75d0cc4','Contacts',1,0,'2016-09-22 13:17:22','2016-09-22 13:17:22',1),('633f17a0-74a0-11cc-a14c-57d6f03ba7ec','63a85a60-2aeb-a893-b519-57d6f0f98461','23b3056d-bbe2-ebcc-85af-57ceef165e36','Leads',1,0,'2016-09-12 18:15:44','2016-09-12 18:15:44',0),('76c61eef-58f5-070f-435f-57d424cebcb6','76ecab39-358c-4df3-593a-57d424a5a2b4','cfe14298-3ef7-f8ce-e0b8-57d4247a557c','Contacts',1,0,'2016-09-10 15:19:06','2016-09-10 15:19:06',0),('7a4b61af-46df-b4f8-654e-57d566a43ca3','7a9b4672-d0fb-f587-39c0-57d566f4d8ee','8c309073-96e9-ba90-79b2-57cc79f1a6f3','Contacts',1,0,'2016-09-11 14:15:21','2016-09-11 14:15:21',0),('81211e58-4f23-6dc8-d2f1-57ceefad0beb','814a65c0-5690-5db0-02d3-57ceefb83158','23b3056d-bbe2-ebcc-85af-57ceef165e36','Leads',1,0,'2016-09-06 16:33:25','2016-09-06 16:33:25',1),('8e28550d-5078-af93-89b2-57d6f1e8a659','8e9f4b24-a3b1-7923-52e3-57d6f1c62a6b','60fe5f52-f51a-12ce-c534-57c6d0e7541e','Accounts',1,0,'2016-09-12 18:20:37','2016-09-12 18:20:37',0),('9b670c1a-988a-5ff4-6b27-57cc79cf6953','9b8ba4d9-b205-ba03-73c9-57cc7988c2c9','8c309073-96e9-ba90-79b2-57cc79f1a6f3','Contacts',1,0,'2016-09-04 19:45:01','2016-09-04 19:45:01',1),('aa6c1467-797c-0291-c5aa-57d188cc8cfb','aab7f01b-d81c-e5e1-0812-57d188f6ca5c','8c309073-96e9-ba90-79b2-57cc79f1a6f3','Contacts',1,0,'2016-09-08 15:49:12','2016-09-08 15:49:12',1),('af1c9a6b-9644-f4f9-470b-57e5482834d9','af48ca1d-55f0-8141-97cd-57e54889a9db','8008bb98-86ab-d06b-46a5-57e5487865cd','Contacts',1,0,'2016-09-23 15:21:11','2016-09-23 15:21:11',0),('bdc36ae3-bbfc-ecc4-863d-57c5d49cf4bf','bdf06f53-e494-9020-7e39-57c5d492336b','1','Users',1,0,'2016-08-30 18:46:06','2016-08-30 18:46:06',0),('c5ec92ca-e1a3-320f-b98b-57d2e7c1f6a4','c6150b88-9f1a-6962-cdfd-57d2e76f8304','bf592272-f781-794c-d5b5-57d2e75d0cc4','Contacts',1,0,'2016-09-09 16:45:09','2016-09-22 12:49:35',1),('cd455c3a-e6f0-21f0-10f6-57d9919a7982','cd6e9222-aa22-80d8-2556-57d991b00846','89433a57-572b-0ba3-ed4d-57d991245a69','Users',1,0,'2016-09-14 18:04:13','2016-09-14 18:04:13',1),('d1d7a641-bf1e-60f2-c253-57d1a0e7fd4e','d231db63-909b-e444-e368-57d1a090b726','60fe5f52-f51a-12ce-c534-57c6d0e7541e','Accounts',1,0,'2016-09-08 17:29:35','2016-09-08 17:29:35',1),('d1eabe4b-b167-3b0d-705b-57c6d0e5b4aa','d216c319-3ef7-9756-5675-57c6d0e9f402','60fe5f52-f51a-12ce-c534-57c6d0e7541e','Accounts',1,0,'2016-08-31 12:41:50','2016-08-31 12:41:50',1),('da9b683d-0802-a7f3-8370-57d852a07a02','daca27f0-5f7b-ee48-6b06-57d852835a0e','7c4b49df-70cd-c7de-b590-57d8525c48f7','Accounts',1,0,'2016-09-13 19:24:15','2016-09-13 19:24:15',0),('eb20ab54-2df7-7195-23eb-57cc7b63fd6b','eb49999b-4ed4-84e4-4cbf-57cc7bd58cff','8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','Accounts',1,0,'2016-09-04 19:51:06','2016-09-04 19:51:06',0);
/*!40000 ALTER TABLE `email_addr_bean_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES ('30829983-954b-138e-5e7c-57e7f4c29636','montgomery@gmail.com','MONTGOMERY@GMAIL.COM',0,0,'2016-09-25 15:59:55','2016-09-25 15:59:55',0),('63a85a60-2aeb-a893-b519-57d6f0f98461','degaullel@gmail.com','DEGAULLEL@GMAIL.COM',0,0,'2016-09-12 18:15:44','2016-09-12 18:15:44',0),('76ecab39-358c-4df3-593a-57d424a5a2b4','roosevelt@gmail.com','ROOSEVELT@GMAIL.COM',0,0,'2016-09-10 15:19:06','2016-09-10 15:19:06',0),('7a9b4672-d0fb-f587-39c0-57d566f4d8ee','mannerheim@gmail.com','MANNERHEIM@GMAIL.COM',0,0,'2016-09-11 14:15:21','2016-09-11 14:15:21',0),('814a65c0-5690-5db0-02d3-57ceefb83158','degoll@gmail.com','DEGOLL@GMAIL.COM',0,0,'2016-09-06 16:33:25','2016-09-06 16:33:25',0),('8e9f4b24-a3b1-7923-52e3-57d6f1c62a6b','cgimpel.ru@gmail.com','CGIMPEL.RU@GMAIL.COM',0,0,'2016-09-12 18:20:37','2016-09-12 18:20:37',0),('903171ee-50ec-06ec-78cc-57d99142fd6a','do_not_reply@example.com','DO_NOT_REPLY@EXAMPLE.COM',0,0,'2016-09-14 18:04:13','2016-09-14 18:04:13',0),('9b8ba4d9-b205-ba03-73c9-57cc7988c2c9','mannergeim@gmail.com','MANNERGEIM@GMAIL.COM',0,0,'2016-09-04 19:45:01','2016-09-04 19:45:01',0),('aab7f01b-d81c-e5e1-0812-57d188f6ca5c','1calm.photo@gmail.com','1CALM.PHOTO@GMAIL.COM',0,0,'2016-09-08 15:49:12','2016-09-08 15:49:12',0),('af48ca1d-55f0-8141-97cd-57e54889a9db','hindenburg@gmail.com','HINDENBURG@GMAIL.COM',0,0,'2016-09-23 15:21:11','2016-09-23 15:21:11',0),('bdf06f53-e494-9020-7e39-57c5d492336b','1calm2@gmail.com','1CALM2@GMAIL.COM',0,0,'2016-08-30 18:46:06','2016-08-30 18:46:06',0),('c6150b88-9f1a-6962-cdfd-57d2e76f8304','bismark@gmail.com','BISMARK@GMAIL.COM',0,0,'2016-09-09 16:45:09','2016-09-09 16:45:09',0),('cd6e9222-aa22-80d8-2556-57d991b00846','guests@sugar.ru','GUESTS@SUGAR.RU',0,0,'2016-09-14 18:04:13','2016-09-14 18:04:13',0),('d216c319-3ef7-9756-5675-57c6d0e9f402','vasya@gmail.com','VASYA@GMAIL.COM',0,0,'2016-08-31 12:41:50','2016-08-31 12:41:50',0),('d231db63-909b-e444-e368-57d1a090b726','cgimpel@gmail.com','CGIMPEL@GMAIL.COM',0,0,'2016-09-08 17:29:35','2016-09-08 17:29:35',0),('daca27f0-5f7b-ee48-6b06-57d852835a0e','info@lockheed.com','INFO@LOCKHEED.COM',0,0,'2016-09-13 19:24:15','2016-09-13 19:24:15',0),('eb49999b-4ed4-84e4-4cbf-57cc7bd58cff','sigizmund@gmail.com','SIGIZMUND@GMAIL.COM',0,0,'2016-09-04 19:51:06','2016-09-04 19:51:06',0);
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_cache`
--

DROP TABLE IF EXISTS `email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_cache`
--

LOCK TABLES `email_cache` WRITE;
/*!40000 ALTER TABLE `email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing`
--

DROP TABLE IF EXISTS `email_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `outbound_email_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing`
--

LOCK TABLES `email_marketing` WRITE;
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_prospect_lists`
--

DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_prospect_lists`
--

LOCK TABLES `email_marketing_prospect_lists` WRITE;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES ('3eb70e75-6e51-1ad5-625f-57c5d4512cec','2013-05-24 14:31:45','2016-08-30 18:46:06','1','1','off','Event Invite Template','Default event invite template.','You have been invited to $fp_events_name','Dear $contact_name,\r\nYou have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end\r\n$fp_events_description\r\nYours Sincerely,\r\n','\r\n<p>Dear $contact_name,</p>\r\n<p>You have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end</p>\r\n<p>$fp_events_description</p>\r\n<p>If you would like to accept this invititation please click accept.</p>\r\n<p> $fp_events_link or $fp_events_link_declined</p>\r\n<p>Yours Sincerely,</p>\r\n',0,NULL,NULL,'email'),('4a9efda7-ece6-148b-e4f2-57c5d4b91d54','2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','off','Case Closure','Template for informing a contact that their case has been closed.','$acase_name [CASE:$acase_case_number] closed','Hi $contact_first_name $contact_last_name,\r\n\r\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\r\n					   Status:				$acase_status\r\n					   Reference:			$acase_case_number\r\n					   Resolution:			$acase_resolution','<p> Hi $contact_first_name $contact_last_name,</p>\r\n					    <p>Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\r\n					    <table border=\"0\"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Resolution</td><td>$acase_resolution</td></tr></tbody></table>',0,NULL,NULL,NULL),('5c67d151-5af3-dfa5-26d3-57c5d4744404','2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','off','Joomla Account Creation','Template used when informing a contact that they\'ve been given an account on the joomla portal.','Support Portal Account Created','Hi $contact_name,\r\n					   An account has been created for you at $portal_address.\r\n					   You may login using this email address and the password $joomla_pass','<p>Hi $contact_name,</p>\r\n					    <p>An account has been created for you at <a href=\"$portal_address\">$portal_address</a>.</p>\r\n					    <p>You may login using this email address and the password $joomla_pass</p>',0,NULL,NULL,NULL),('6d6f99a9-9e99-f052-fdad-57c5d4bf87ef','2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','off','Case Creation','Template to send to a contact when a case is received from them.','$acase_name [CASE:$acase_case_number]','Hi $contact_first_name $contact_last_name,\r\n\r\n					   We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\r\n					   Status:		$acase_status\r\n					   Reference:	$acase_case_number\r\n					   Description:	$acase_description','<p> Hi $contact_first_name $contact_last_name,</p>\r\n					    <p>We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered</p>\r\n					    <table border=\"0\"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Description</td><td>$acase_description</td></tr></tbody></table>',0,NULL,NULL,NULL),('800f3d34-9f56-c29b-11af-57c5d44a03cd','2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','off','Contact Case Update','Template to send to a contact when their case is updated.','$acase_name update [CASE:$acase_case_number]','Hi $user_first_name $user_last_name,\r\n\r\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description','<p>Hi $contact_first_name $contact_last_name,</p>\r\n					    <p> </p>\r\n					    <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\r\n					    <p style=\"padding-left:30px;\">$aop_case_updates_description</p>',0,NULL,NULL,NULL),('8f8c2ade-d197-a3fa-8ace-57c5d44a4226','2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','off','System-generated password email','This template is used when the System Administrator sends a new password to a user.','New account information','\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL),('95ac8c81-9e6a-d8c9-7ba8-57c5d4c96cc7','2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','off','User Case Update','Email template to send to a Sugar user when their case is updated.','$acase_name (# $acase_case_number) update','Hi $user_first_name $user_last_name,\r\n\r\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\r\n					       $contact_first_name $contact_last_name, said:\r\n					               $aop_case_updates_description\r\n                        You may review this Case at:\r\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;','<p>Hi $user_first_name $user_last_name,</p>\r\n					   <p> </p>\r\n					   <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\r\n					   <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\r\n					   <p style=\"padding-left:30px;\">$aop_case_updates_description</p>\r\n					   <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>\r\n					   ',0,NULL,NULL,NULL),('9dc3d2b3-27d7-4265-dcdd-57c5d424e347','2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','off','Forgot Password email','This template is used to send a user a link to click to reset the user\'s account password.','Reset your account password','\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailman`
--

DROP TABLE IF EXISTS `emailman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailman`
--

LOCK TABLES `emailman` WRITE;
/*!40000 ALTER TABLE `emailman` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES ('2efffd4b-d505-b835-4624-57e1b7b2becb','2016-09-20 22:25:53','2016-09-20 22:25:53',NULL,NULL,NULL,0,'2016-09-20 22:25:53',NULL,'Reset your account password','archived','sent',NULL,NULL,'pick',NULL,'User',NULL),('6a0dfe08-616e-d771-19f5-57d9911cc0e2','2016-09-14 18:04:13','2016-09-14 18:04:13',NULL,'1','1',0,'2016-09-14 18:04:13',NULL,'New account information','archived','sent',NULL,NULL,'pick',NULL,'User',NULL),('e29df778-3641-19e5-06e3-57d6f49fdf3f','2016-09-12 18:32:11','2016-09-12 18:32:11','1','1','1',0,'2016-09-12 18:32:00',NULL,'test msg','out','sent',NULL,NULL,'pick',NULL,'Accounts','60fe5f52-f51a-12ce-c534-57c6d0e7541e');
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_beans`
--

DROP TABLE IF EXISTS `emails_beans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_beans`
--

LOCK TABLES `emails_beans` WRITE;
/*!40000 ALTER TABLE `emails_beans` DISABLE KEYS */;
INSERT INTO `emails_beans` VALUES ('b546df6c-8792-c338-f855-57d6f403c580','e29df778-3641-19e5-06e3-57d6f49fdf3f','60fe5f52-f51a-12ce-c534-57c6d0e7541e','Accounts',NULL,'2016-09-12 18:32:11',0);
/*!40000 ALTER TABLE `emails_beans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_email_addr_rel`
--

DROP TABLE IF EXISTS `emails_email_addr_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_email_addr_rel`
--

LOCK TABLES `emails_email_addr_rel` WRITE;
/*!40000 ALTER TABLE `emails_email_addr_rel` DISABLE KEYS */;
INSERT INTO `emails_email_addr_rel` VALUES ('19134ff9-1917-782e-b5dd-57d6f4579d91','e29df778-3641-19e5-06e3-57d6f49fdf3f','from','bdf06f53-e494-9020-7e39-57c5d492336b',0),('27fe3bc3-93a9-50f4-86d3-57d6f48fe9e2','e29df778-3641-19e5-06e3-57d6f49fdf3f','to','8e9f4b24-a3b1-7923-52e3-57d6f1c62a6b',0),('a206044b-ac69-681c-0261-57d991332253','6a0dfe08-616e-d771-19f5-57d9911cc0e2','from','903171ee-50ec-06ec-78cc-57d99142fd6a',0),('bb31fbee-bd92-2f1e-7cd0-57e1b7e7e46a','2efffd4b-d505-b835-4624-57e1b7b2becb','from','903171ee-50ec-06ec-78cc-57d99142fd6a',0);
/*!40000 ALTER TABLE `emails_email_addr_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_text`
--

DROP TABLE IF EXISTS `emails_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_text`
--

LOCK TABLES `emails_text` WRITE;
/*!40000 ALTER TABLE `emails_text` DISABLE KEYS */;
INSERT INTO `emails_text` VALUES ('e29df778-3641-19e5-06e3-57d6f49fdf3f','Administrator <1calm2@gmail.com>','','CGimpel <cgimpel.ru@gmail.com>','','','sdasdsaflkjshadkjfhasdkjf hjkasdhf jashdf jhf jshdfj afj jkhs hsajsdfk sakf hjkdh fjaskhf jkasdfa a df','<p>sdasdsaflkjshadkjfhasdkjf hjkasdhf jashdf jhf jshdfj afj jkhs hsajsdfk sakf hjkdh fjaskhf jkasdfa a df</p>',NULL,0),('6a0dfe08-616e-d771-19f5-57d9911cc0e2','','','','','','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : guest </p><p>Password : qnf4km </p><br /><p>http://suite/</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>',NULL,NULL,0),('2efffd4b-d505-b835-4624-57e1b7b2becb','','','','','','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on 2016-09-20 22:25:53 to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> http://suite//index.php?entryPoint=Changenewpassword&guid=aa18b0f3-93a0-0116-f0e6-57e1b7273a0a </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>',NULL,NULL,0);
/*!40000 ALTER TABLE `emails_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('39d85248-dfe8-3190-127b-57e3d915246a','Contacts bf592272-f781-794c-d5b5-57d2e75d0cc4 1','2016-09-22 13:15:35','2016-09-22 13:15:45','1','1',NULL,1,'1','bf592272-f781-794c-d5b5-57d2e75d0cc4','Contacts'),('b0906a85-ef37-32b3-d509-57e3d9d4644f','Contacts bf592272-f781-794c-d5b5-57d2e75d0cc4 1','2016-09-22 13:15:49','2016-09-22 13:15:49','1','1',NULL,0,'1','bf592272-f781-794c-d5b5-57d2e75d0cc4','Contacts');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_meta_data`
--

DROP TABLE IF EXISTS `fields_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_meta_data`
--

LOCK TABLES `fields_meta_data` WRITE;
/*!40000 ALTER TABLE `fields_meta_data` DISABLE KEYS */;
INSERT INTO `fields_meta_data` VALUES ('Accountsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Accounts','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Accountsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Accounts','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Accountsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Accounts','float',10,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Accountsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Accounts','float',11,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Casesjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Cases','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Casesjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Cases','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Casesjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Cases','float',10,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Casesjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Cases','float',11,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Contactsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Contacts','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Contactsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Contacts','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Contactsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Contacts','float',10,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Contactsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Contacts','float',11,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Leadsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Leads','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Leadsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Leads','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Leadsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Leads','float',10,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Leadsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Leads','float',11,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Meetingsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Meetings','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Meetingsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Meetings','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Meetingsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Meetings','float',10,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Meetingsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Meetings','float',11,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Opportunitiesjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Opportunities','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Opportunitiesjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Opportunities','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Opportunitiesjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Opportunities','float',10,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Opportunitiesjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Opportunities','float',11,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Projectjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Project','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Projectjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Project','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Projectjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Project','float',10,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Projectjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Project','float',11,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Prospectsjjwg_maps_address_c','jjwg_maps_address_c','LBL_JJWG_MAPS_ADDRESS','Address','Address','Prospects','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Prospectsjjwg_maps_geocode_status_c','jjwg_maps_geocode_status_c','LBL_JJWG_MAPS_GEOCODE_STATUS','Geocode Status','Geocode Status','Prospects','varchar',255,0,NULL,'2016-08-30 18:46:06',0,0,0,0,1,'true',NULL,'','',''),('Prospectsjjwg_maps_lat_c','jjwg_maps_lat_c','LBL_JJWG_MAPS_LAT','','Latitude','Prospects','float',10,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','',''),('Prospectsjjwg_maps_lng_c','jjwg_maps_lng_c','LBL_JJWG_MAPS_LNG','','Longitude','Prospects','float',11,0,'0.00000000','2016-08-30 18:46:06',0,0,0,0,1,'true','8','','','');
/*!40000 ALTER TABLE `fields_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` VALUES ('89060e98-aceb-08a3-4392-57c5dab51fa9','Моя архивная почта','archived','9d2395f2-880a-dd1a-a3ac-57c5da1262f3',0,0,1,'','','1','1',0),('9d2395f2-880a-dd1a-a3ac-57c5da1262f3','Моя почта','inbound','',1,0,1,'SELECT emails.id polymorphic_id, \'Emails\' polymorphic_module FROM emails\n								   JOIN emails_text on emails.id = emails_text.email_id\n                                   WHERE (type = \'inbound\' OR status = \'inbound\') AND assigned_user_id = \'1\' AND emails.deleted = \'0\' AND status NOT IN (\'sent\', \'archived\', \'draft\') AND type NOT IN (\'out\', \'archived\', \'draft\')','','1','1',0),('b3773244-b465-bb79-ac77-57c5da069f0f','Мои черновики','draft','9d2395f2-880a-dd1a-a3ac-57c5da1262f3',0,0,1,'SELECT emails.id polymorphic_id, \'Emails\' polymorphic_module FROM emails\n								   JOIN emails_text on emails.id = emails_text.email_id\n                                   WHERE (type = \'draft\' OR status = \'draft\') AND assigned_user_id = \'1\' AND emails.deleted = \'0\' AND status NOT IN (\'archived\') AND type NOT IN (\'archived\')','','1','1',0),('dc5f6c7e-35ea-2c31-8b44-57c5daa07b27','Отправленные E-mail','sent','9d2395f2-880a-dd1a-a3ac-57c5da1262f3',0,0,1,'SELECT emails.id polymorphic_id, \'Emails\' polymorphic_module FROM emails\n								   JOIN emails_text on emails.id = emails_text.email_id\n                                   WHERE (type = \'out\' OR status = \'sent\') AND assigned_user_id = \'1\' AND emails.deleted = \'0\' AND status NOT IN (\'archived\') AND type NOT IN (\'archived\')','','1','1',0);
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_rel`
--

DROP TABLE IF EXISTS `folders_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_rel`
--

LOCK TABLES `folders_rel` WRITE;
/*!40000 ALTER TABLE `folders_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_subscriptions`
--

DROP TABLE IF EXISTS `folders_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_subscriptions`
--

LOCK TABLES `folders_subscriptions` WRITE;
/*!40000 ALTER TABLE `folders_subscriptions` DISABLE KEYS */;
INSERT INTO `folders_subscriptions` VALUES ('89ef08e3-0b91-925c-d9b0-57c5da0aa29e','89060e98-aceb-08a3-4392-57c5dab51fa9','1'),('9d31fa67-712f-5d20-1375-57c5da0ddc3d','9d2395f2-880a-dd1a-a3ac-57c5da1262f3','1'),('b385bd7d-6fb5-fb9e-679b-57c5da81985b','b3773244-b465-bb79-ac77-57c5da069f0f','1'),('dc6e201e-f3f8-4cc6-b2d8-57c5daacae72','dc5f6c7e-35ea-2c31-8b44-57c5daa07b27','1');
/*!40000 ALTER TABLE `folders_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations`
--

DROP TABLE IF EXISTS `fp_event_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations`
--

LOCK TABLES `fp_event_locations` WRITE;
/*!40000 ALTER TABLE `fp_event_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_audit`
--

DROP TABLE IF EXISTS `fp_event_locations_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_event_locations_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_audit`
--

LOCK TABLES `fp_event_locations_audit` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_fp_events_1_c`
--

DROP TABLE IF EXISTS `fp_event_locations_fp_events_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_fp_events_1_c`
--

LOCK TABLES `fp_event_locations_fp_events_1_c` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events`
--

DROP TABLE IF EXISTS `fp_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `budget` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `invite_templates` varchar(100) DEFAULT NULL,
  `accept_redirect` varchar(255) DEFAULT NULL,
  `decline_redirect` varchar(255) DEFAULT NULL,
  `activity_status_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events`
--

LOCK TABLES `fp_events` WRITE;
/*!40000 ALTER TABLE `fp_events` DISABLE KEYS */;
INSERT INTO `fp_events` VALUES ('1f665e48-b48e-8f6f-7ea9-57c7ea10a262','Event1','2016-09-01 08:45:23','2016-09-01 08:45:23','1','1','',0,'1',1,0,'2016-09-01 09:45:00','2016-09-01 10:45:00',50.000000,NULL,'','http://','http://','');
/*!40000 ALTER TABLE `fp_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_audit`
--

DROP TABLE IF EXISTS `fp_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_audit`
--

LOCK TABLES `fp_events_audit` WRITE;
/*!40000 ALTER TABLE `fp_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_contacts_c`
--

DROP TABLE IF EXISTS `fp_events_contacts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_contactsfp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_contacts_c`
--

LOCK TABLES `fp_events_contacts_c` WRITE;
/*!40000 ALTER TABLE `fp_events_contacts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_contacts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_delegates_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_delegates_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_delegates_1_c`
--

LOCK TABLES `fp_events_fp_event_delegates_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_locations_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_locations_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_locations_1_c`
--

LOCK TABLES `fp_events_fp_event_locations_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_leads_1_c`
--

DROP TABLE IF EXISTS `fp_events_leads_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_leads_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_leads_1_c`
--

LOCK TABLES `fp_events_leads_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_leads_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_leads_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_prospects_1_c`
--

DROP TABLE IF EXISTS `fp_events_prospects_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_prospects_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_prospects_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_prospects_1_c`
--

LOCK TABLES `fp_events_prospects_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_maps`
--

DROP TABLE IF EXISTS `import_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_maps`
--

LOCK TABLES `import_maps` WRITE;
/*!40000 ALTER TABLE `import_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email`
--

DROP TABLE IF EXISTS `inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email`
--

LOCK TABLES `inbound_email` WRITE;
/*!40000 ALTER TABLE `inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_autoreply`
--

DROP TABLE IF EXISTS `inbound_email_autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_autoreply`
--

LOCK TABLES `inbound_email_autoreply` WRITE;
/*!40000 ALTER TABLE `inbound_email_autoreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_cache_ts`
--

DROP TABLE IF EXISTS `inbound_email_cache_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_cache_ts`
--

LOCK TABLES `inbound_email_cache_ts` WRITE;
/*!40000 ALTER TABLE `inbound_email_cache_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_cache_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache`
--

DROP TABLE IF EXISTS `jjwg_address_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_address_cache` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `lat` float(10,8) DEFAULT NULL,
  `lng` float(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache`
--

LOCK TABLES `jjwg_address_cache` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache` DISABLE KEYS */;
INSERT INTO `jjwg_address_cache` VALUES ('21b2f622-13f6-fb84-d078-57e863b89a43','Кенсингтон-Хай-Стрит, Лондон, Большой Лондон, W8, Великобритания','2016-09-25 23:54:27','2016-09-25 23:54:27','1','1','',0,'1',51.50044250,-0.19460650),('41383f87-6ccd-2667-6e7d-57e863c0bb64','Веттергассе, Марбург, Гессен, 35037, Германия','2016-09-25 23:54:27','2016-09-25 23:54:27','1','1','',0,'1',50.81020737,8.77079582);
/*!40000 ALTER TABLE `jjwg_address_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache_audit`
--

DROP TABLE IF EXISTS `jjwg_address_cache_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_address_cache_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_address_cache_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache_audit`
--

LOCK TABLES `jjwg_address_cache_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas`
--

DROP TABLE IF EXISTS `jjwg_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_areas` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `coordinates` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas`
--

LOCK TABLES `jjwg_areas` WRITE;
/*!40000 ALTER TABLE `jjwg_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas_audit`
--

DROP TABLE IF EXISTS `jjwg_areas_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_areas_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_areas_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas_audit`
--

LOCK TABLES `jjwg_areas_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_areas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps`
--

DROP TABLE IF EXISTS `jjwg_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `distance` float(9,4) DEFAULT NULL,
  `unit_type` varchar(100) DEFAULT 'mi',
  `module_type` varchar(100) DEFAULT 'Accounts',
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps`
--

LOCK TABLES `jjwg_maps` WRITE;
/*!40000 ALTER TABLE `jjwg_maps` DISABLE KEYS */;
INSERT INTO `jjwg_maps` VALUES ('3a77fa4f-07c6-0350-1711-57e53532f9e3','Контакты*','2016-09-23 14:00:43','2016-09-23 14:00:43','1','1','',0,'1',15000.0000,'mi','Contacts','Contacts','bf592272-f781-794c-d5b5-57d2e75d0cc4'),('484da321-542b-1f40-38b8-57cd733c3a91','Карта 1','2016-09-05 13:32:04','2016-09-23 14:04:06','1','1','описание',0,'1',50.0000,'mi','Contacts','Contacts','8c309073-96e9-ba90-79b2-57cc79f1a6f3'),('df87066e-d1ad-5b23-0461-57e53669c72b','Контрагент1','2016-09-23 14:05:39','2016-09-23 14:05:39','1','1','',0,'1',250.0000,'mi','Accounts','Accounts','7c4b49df-70cd-c7de-b590-57d8525c48f7');
/*!40000 ALTER TABLE `jjwg_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_audit`
--

DROP TABLE IF EXISTS `jjwg_maps_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_maps_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_audit`
--

LOCK TABLES `jjwg_maps_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_audit` DISABLE KEYS */;
INSERT INTO `jjwg_maps_audit` VALUES ('ad88827b-e7d1-7404-eb55-57e5368be9e5','484da321-542b-1f40-38b8-57cd733c3a91','2016-09-23 14:04:06','1','module_type','enum','Accounts','Contacts',NULL,NULL);
/*!40000 ALTER TABLE `jjwg_maps_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_areas_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_areas_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_areas_c`
--

LOCK TABLES `jjwg_maps_jjwg_areas_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_markers_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_markers_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_markers_c`
--

LOCK TABLES `jjwg_maps_jjwg_markers_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers`
--

DROP TABLE IF EXISTS `jjwg_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_markers` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `jjwg_maps_lat` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_lng` float(11,8) DEFAULT '0.00000000',
  `marker_image` varchar(100) DEFAULT 'company',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers`
--

LOCK TABLES `jjwg_markers` WRITE;
/*!40000 ALTER TABLE `jjwg_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers_audit`
--

DROP TABLE IF EXISTS `jjwg_markers_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_markers_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_markers_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers_audit`
--

LOCK TABLES `jjwg_markers_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_markers_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
INSERT INTO `job_queue` VALUES ('1','13ef03ca-c4bc-3e2a-3244-57d19e89433c','Process Workflow Tasks',0,'2016-09-08 17:22:33','2016-09-08 17:22:33','f10f781d-75ff-bb7b-b77d-57c5d4d47cde','2016-09-08 17:22:00','done','success','Warning [2]: Invalid argument supplied for foreach() in C:\\OpenServer\\domains\\suite\\modules\\AOW_WorkFlow\\AOW_WorkFlow.php on line 124\r\n','function::processAOW_Workflow',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:14764',NULL),('1','26c7e49f-9d16-c01b-1a0e-57d19d74ea7b','Process Workflow Tasks',0,'2016-09-08 17:20:05','2016-09-08 17:20:05','f10f781d-75ff-bb7b-b77d-57c5d4d47cde','2016-09-08 17:20:00','done','success','Warning [2]: Invalid argument supplied for foreach() in C:\\OpenServer\\domains\\suite\\modules\\AOW_WorkFlow\\AOW_WorkFlow.php on line 124\r\n','function::processAOW_Workflow',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:24480',NULL),('1','440f9116-c181-1d63-6505-57d19d9df3f0','Run Report Generation Scheduled Tasks',0,'2016-09-08 17:20:05','2016-09-08 17:20:05','11fc1ecf-7846-4eaa-7765-57c5d4cfbc7a','2016-09-08 17:20:00','done','success','Warning [2]: Invalid argument supplied for foreach() in C:\\OpenServer\\domains\\suite\\modules\\Schedulers\\_AddJobsHere.php on line 727\r\n','function::aorRunScheduledReports',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:24480',NULL),('1','563aee17-dd05-d0b9-1ce0-57d19e78ceea','Run Report Generation Scheduled Tasks',0,'2016-09-08 17:22:33','2016-09-08 17:22:33','11fc1ecf-7846-4eaa-7765-57c5d4cfbc7a','2016-09-08 17:22:00','done','success','Warning [2]: Invalid argument supplied for foreach() in C:\\OpenServer\\domains\\suite\\modules\\Schedulers\\_AddJobsHere.php on line 727\r\n','function::aorRunScheduledReports',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:14764',NULL),('1','82eb48af-ee87-26ad-ad18-57d19dfca228','Check Inbound Mailboxes',0,'2016-09-08 17:20:05','2016-09-08 17:20:05','2e8cc0ef-4a51-b231-f62d-57c5d40daa53','2016-09-08 17:20:00','done','success',NULL,'function::pollMonitoredInboxesAOP',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:24480',NULL),('1','88bb43ca-06ad-424a-1aa0-57d19ef25721','Check Inbound Mailboxes',0,'2016-09-08 17:22:33','2016-09-08 17:22:33','2e8cc0ef-4a51-b231-f62d-57c5d40daa53','2016-09-08 17:22:00','done','success',NULL,'function::pollMonitoredInboxesAOP',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:14764',NULL),('1','91552ef1-e5dc-c048-5862-57d19d535443','Run Nightly Process Bounced Campaign Emails',0,'2016-09-08 17:20:05','2016-09-08 17:20:05','4cec4cf7-160b-8108-7211-57c5d4bd4822','2016-09-08 17:20:00','done','success',NULL,'function::pollMonitoredInboxesForBouncedCampaignEmails',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:24480',NULL),('1','a116a46a-d72f-834e-7dd4-57d19d5a0377','Run Nightly Mass Email Campaigns',0,'2016-09-08 17:20:05','2016-09-08 17:20:05','59ca8955-638c-ee5f-4d98-57c5d4731294','2016-09-08 17:20:00','done','success',NULL,'function::runMassEmailCampaign',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:24480',NULL),('1','b3393edb-902b-1de1-f419-57d19e37f5a1','TestSheduledTask',0,'2016-09-08 17:22:33','2016-09-08 17:22:33','78b4f742-ae54-58dd-e198-57d194104249','2016-09-08 17:22:00','done','success',NULL,'url::http://suite/cron2.php',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:14764',NULL),('1','c8662eba-182a-c80c-e553-57d19d3722bb','TestSheduledTask',0,'2016-09-08 17:20:05','2016-09-08 17:20:05','78b4f742-ae54-58dd-e198-57d194104249','2016-09-08 17:20:00','done','failure','6\n','url::cron2.php',NULL,0,NULL,1,0,'CRON8046422122c096eac5a33bc32edf61a9:24480',NULL),('1','d38d123f-38df-5a31-e113-57d19e1eaba6','Run Email Reminder Notifications',0,'2016-09-08 17:22:33','2016-09-08 17:22:33','90321d4d-b73b-09b7-048b-57c5d4cdd788','2016-09-08 17:22:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:14764',NULL),('1','f3c22d1d-d580-eb7e-f961-57d19d33515a','Run Email Reminder Notifications',0,'2016-09-08 17:20:05','2016-09-08 17:20:05','90321d4d-b73b-09b7-048b-57c5d4cdd788','2016-09-08 17:20:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRON8046422122c096eac5a33bc32edf61a9:24480',NULL);
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` char(36) NOT NULL DEFAULT '',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES ('23b3056d-bbe2-ebcc-85af-57ceef165e36','2016-09-06 16:33:25','2016-09-12 18:16:47','1','1','описание123',0,'1','Mr.','Шарль','де Голль','Президент',NULL,'отдел',0,NULL,NULL,NULL,NULL,NULL,'адрес','Париж','область','987987','Франция','адрес','Париж','область','987987','Франция',NULL,NULL,0,NULL,'Conference','описание источника','Assigned','описение статуса','','Sigizmund Inc.',NULL,'','','',NULL,'15','',NULL,NULL,NULL,NULL),('a2e4f8e5-faa8-12e4-dc70-57e29184ab84','2016-09-21 13:55:23','2016-09-21 13:55:23','89433a57-572b-0ba3-ed4d-57d991245a69','89433a57-572b-0ba3-ed4d-57d991245a69','Главнокомандующий союзными войсками после начала весеннего наступления 1918.',0,NULL,NULL,'Фердинанд','Фош','Маршал Франции',NULL,'Сухопутные силы',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'New',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'http://foch.fr');
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `suite`.`leads_BEFORE_INSERT` BEFORE INSERT ON `leads` FOR EACH ROW
BEGIN
 IF NEW.id = '' THEN
 SET NEW.id = UUID();
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `leads_audit`
--

DROP TABLE IF EXISTS `leads_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_audit`
--

LOCK TABLES `leads_audit` WRITE;
/*!40000 ALTER TABLE `leads_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_cstm`
--

DROP TABLE IF EXISTS `leads_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_cstm`
--

LOCK TABLES `leads_cstm` WRITE;
/*!40000 ALTER TABLE `leads_cstm` DISABLE KEYS */;
INSERT INTO `leads_cstm` VALUES ('157a630c-659e-f02a-32a2-57e28f9a6679',0.00000000,0.00000000,NULL,NULL),('23b3056d-bbe2-ebcc-85af-57ceef165e36',0.00000000,0.00000000,'ZERO_RESULTS','адрес, Париж, область, 987987, Франция'),('6d5e487b-8de7-f3c9-c771-57d98e91ccf4',0.00000000,0.00000000,NULL,NULL),('7105014d-8dfe-e904-e3ba-57e28f3cf84c',0.00000000,0.00000000,NULL,NULL),('a2e4f8e5-faa8-12e4-dc70-57e29184ab84',0.00000000,0.00000000,'Empty','');
/*!40000 ALTER TABLE `leads_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_documents`
--

DROP TABLE IF EXISTS `linked_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_documents`
--

LOCK TABLES `linked_documents` WRITE;
/*!40000 ALTER TABLE `linked_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_contacts`
--

DROP TABLE IF EXISTS `meetings_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_contacts`
--

LOCK TABLES `meetings_contacts` WRITE;
/*!40000 ALTER TABLE `meetings_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_cstm`
--

DROP TABLE IF EXISTS `meetings_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_cstm`
--

LOCK TABLES `meetings_cstm` WRITE;
/*!40000 ALTER TABLE `meetings_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_leads`
--

DROP TABLE IF EXISTS `meetings_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_leads`
--

LOCK TABLES `meetings_leads` WRITE;
/*!40000 ALTER TABLE `meetings_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_users`
--

DROP TABLE IF EXISTS `meetings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_users`
--

LOCK TABLES `meetings_users` WRITE;
/*!40000 ALTER TABLE `meetings_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES ('1','4d21c04d-04c4-05bb-640d-57d163b6005f','2016-09-08 13:09:20','2016-09-08 13:10:25','1','1','Заметка1','image/png','Alt_View.png','Accounts','8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','8c309073-96e9-ba90-79b2-57cc79f1a6f3',0,0,'фывфывыфвафы ыфва фваф ываф ывафы а',0);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_tokens`
--

DROP TABLE IF EXISTS `oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_tokens`
--

LOCK TABLES `oauth_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
INSERT INTO `opportunities` VALUES ('2cd7cb8a-e9b9-761d-df86-57cc0563d21a','Deal1','2016-09-04 11:28:14','2016-09-04 11:28:14','1','1','описание',0,'1','Existing Business','','Partner',100,100,'-99','2016-09-05','след шаг','Needs Analysis',25);
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_audit`
--

DROP TABLE IF EXISTS `opportunities_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_audit`
--

LOCK TABLES `opportunities_audit` WRITE;
/*!40000 ALTER TABLE `opportunities_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_contacts`
--

DROP TABLE IF EXISTS `opportunities_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_contacts`
--

LOCK TABLES `opportunities_contacts` WRITE;
/*!40000 ALTER TABLE `opportunities_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_cstm`
--

DROP TABLE IF EXISTS `opportunities_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_cstm`
--

LOCK TABLES `opportunities_cstm` WRITE;
/*!40000 ALTER TABLE `opportunities_cstm` DISABLE KEYS */;
INSERT INTO `opportunities_cstm` VALUES ('2cd7cb8a-e9b9-761d-df86-57cc0563d21a',0.00000000,0.00000000,'ZERO_RESULTS','улица, город, область, 123456, страна');
/*!40000 ALTER TABLE `opportunities_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email`
--

DROP TABLE IF EXISTS `outbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email`
--

LOCK TABLES `outbound_email` WRITE;
/*!40000 ALTER TABLE `outbound_email` DISABLE KEYS */;
INSERT INTO `outbound_email` VALUES ('32ad8337-0c9c-4282-5377-57c5d4b9bb49','system',NULL,NULL,NULL,NULL,0,NULL,'system-override','1','SMTP','other','smtp.gmail.com',587,'la2stalker@gmail.com','Vd48yQ8VKLtIql3170FfnQ==',1,'2'),('ee020fe0-d54e-4d85-101e-57c5d4891e0f','system',NULL,NULL,NULL,NULL,0,NULL,'system','1','SMTP','other','smtp.gmail.com',587,'la2stalker@gmail.com','Vd48yQ8VKLtIql3170FfnQ==',1,'2');
/*!40000 ALTER TABLE `outbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email_audit`
--

DROP TABLE IF EXISTS `outbound_email_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_outbound_email_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email_audit`
--

LOCK TABLES `outbound_email_audit` WRITE;
/*!40000 ALTER TABLE `outbound_email_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbound_email_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `override_business_hours` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_contacts_1_c`
--

DROP TABLE IF EXISTS `project_contacts_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_contacts_1project_ida` varchar(36) DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_contacts_1_c`
--

LOCK TABLES `project_contacts_1_c` WRITE;
/*!40000 ALTER TABLE `project_contacts_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_contacts_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_cstm`
--

DROP TABLE IF EXISTS `project_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_cstm`
--

LOCK TABLES `project_cstm` WRITE;
/*!40000 ALTER TABLE `project_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task`
--

DROP TABLE IF EXISTS `project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `relationship_type` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task`
--

LOCK TABLES `project_task` WRITE;
/*!40000 ALTER TABLE `project_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task_audit`
--

DROP TABLE IF EXISTS `project_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task_audit`
--

LOCK TABLES `project_task_audit` WRITE;
/*!40000 ALTER TABLE `project_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_users_1_c`
--

DROP TABLE IF EXISTS `project_users_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_users_1project_ida` varchar(36) DEFAULT NULL,
  `project_users_1users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_users_1_c`
--

LOCK TABLES `project_users_1_c` WRITE;
/*!40000 ALTER TABLE `project_users_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_users_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_accounts`
--

DROP TABLE IF EXISTS `projects_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_accounts`
--

LOCK TABLES `projects_accounts` WRITE;
/*!40000 ALTER TABLE `projects_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_bugs`
--

DROP TABLE IF EXISTS `projects_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_bugs`
--

LOCK TABLES `projects_bugs` WRITE;
/*!40000 ALTER TABLE `projects_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_cases`
--

DROP TABLE IF EXISTS `projects_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_cases`
--

LOCK TABLES `projects_cases` WRITE;
/*!40000 ALTER TABLE `projects_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_contacts`
--

DROP TABLE IF EXISTS `projects_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_contacts`
--

LOCK TABLES `projects_contacts` WRITE;
/*!40000 ALTER TABLE `projects_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_opportunities`
--

DROP TABLE IF EXISTS `projects_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_opportunities`
--

LOCK TABLES `projects_opportunities` WRITE;
/*!40000 ALTER TABLE `projects_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_products`
--

DROP TABLE IF EXISTS `projects_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_products`
--

LOCK TABLES `projects_products` WRITE;
/*!40000 ALTER TABLE `projects_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_list_campaigns`
--

DROP TABLE IF EXISTS `prospect_list_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_list_campaigns`
--

LOCK TABLES `prospect_list_campaigns` WRITE;
/*!40000 ALTER TABLE `prospect_list_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_list_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists`
--

DROP TABLE IF EXISTS `prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists`
--

LOCK TABLES `prospect_lists` WRITE;
/*!40000 ALTER TABLE `prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists_prospects`
--

DROP TABLE IF EXISTS `prospect_lists_prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists_prospects`
--

LOCK TABLES `prospect_lists_prospects` WRITE;
/*!40000 ALTER TABLE `prospect_lists_prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists_prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects`
--

DROP TABLE IF EXISTS `prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects`
--

LOCK TABLES `prospects` WRITE;
/*!40000 ALTER TABLE `prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects_cstm`
--

DROP TABLE IF EXISTS `prospects_cstm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects_cstm`
--

LOCK TABLES `prospects_cstm` WRITE;
/*!40000 ALTER TABLE `prospects_cstm` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects_cstm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES ('117e31ce-736f-90ec-f04e-57e7f6734b6d','prospect_campaign_log','Prospects','prospects','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Prospects',0,0),('11ab4bea-58c0-f68d-db88-57e7f61da3aa','aos_quotes_assigned_user','Users','users','id','AOS_Quotes','aos_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('11c8daf5-7938-9aed-d4b5-57e7f6ea7f4d','account_leads','Accounts','accounts','id','Leads','leads','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('12019f2d-dd38-66d7-f87d-57e7f609e4e5','jjwg_Maps_prospects','jjwg_Maps','jjwg_Maps','parent_id','Prospects','prospects','id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('121843b3-1a9a-824a-ad74-57e7f6a44c54','aop_case_updates_modified_user','Users','users','id','AOP_Case_Updates','aop_case_updates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('12886ed0-bfd9-488c-4543-57e7f67390cc','aos_contracts_aos_products_quotes','AOS_Contracts','aos_contracts','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('14660ed6-3e25-eab5-ce28-57e7f61d2a2d','securitygroups_leads','SecurityGroups','securitygroups','id','Leads','leads','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Leads',0,0),('146ca5d4-377e-a75a-40f9-57e7f60d1c95','calls_reschedule_modified_user','Users','users','id','Calls_Reschedule','calls_reschedule','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('146fde76-a603-78bf-8706-57e7f63f2049','meetings_assigned_user','Users','users','id','Meetings','meetings','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('14950738-bf49-516a-68e9-57e7f6d0db9a','spots_created_by','Users','users','id','Spots','spots','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('14b1473b-6a19-7721-a16c-57e7f6d81e15','acl_roles_actions','ACLRoles','acl_roles','id','ACLActions','acl_actions','id','acl_roles_actions','role_id','action_id','many-to-many',NULL,NULL,0,0),('14c1d8dc-3280-107c-74b6-57e7f667ffc1','alerts_modified_user','Users','users','id','Alerts','alerts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('163e0094-6db9-9bbc-2704-57e7f6b66071','campaign_emailman','Campaigns','campaigns','id','EmailMan','emailman','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('16e8dc64-d1da-8992-817b-57e7f652d8cb','contact_notes_parent','Contacts','contacts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('170eb948-7743-5500-626c-57e7f6382bcc','securitygroups_spots','SecurityGroups','securitygroups','id','Spots','spots','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Spots',0,0),('1713af25-db60-cccf-0b1d-57e7f6c91375','securitygroups_cases','SecurityGroups','securitygroups','id','Cases','cases','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Cases',0,0),('1714381d-88c7-05f0-d60a-57e7f6a65dc6','campaign_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1726bb2d-d28b-0a02-45f4-57e7f6c7e96b','fp_event_locations_assigned_user','Users','users','id','FP_Event_Locations','fp_event_locations','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('173fd638-9fb2-6eb5-49dd-57e7f6171889','securitygroups_calls','SecurityGroups','securitygroups','id','Calls','calls','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Calls',0,0),('17560df4-14d9-6a15-5965-57e7f62c8edf','securitygroups_aos_product_categories','SecurityGroups','securitygroups','id','AOS_Product_Categories','aos_product_categories','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Product_Categories',0,0),('176a48c3-8033-b89f-0447-57e7f65b518c','fp_events_contacts','FP_events','fp_events','id','Contacts','contacts','id','fp_events_contacts_c','fp_events_contactsfp_events_ida','fp_events_contactscontacts_idb','many-to-many',NULL,NULL,0,0),('178d72f8-607c-b8c0-2323-57e7f6978994','emails_opportunities_rel','Emails','emails','id','Opportunities','opportunities','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Opportunities',0,0),('17948585-f630-e2e3-47ea-57e7f601fb4a','leads_email_addresses_primary','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('17a3cc84-4421-3f4c-9f30-57e7f64022b3','user_direct_reports','Users','users','id','Users','users','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('19bd4113-6fb9-275d-1bf8-57e7f694447c','opportunity_currencies','Opportunities','opportunities','currency_id','Currencies','currencies','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1a74feb7-1467-8b2d-f439-57e7f662cc43','securitygroups_aok_knowledgebase','SecurityGroups','securitygroups','id','AOK_KnowledgeBase','aok_knowledgebase','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOK_KnowledgeBase',0,0),('1aa1c58f-f74f-bf65-c0ac-57e7f6c777f7','aor_fields_created_by','Users','users','id','AOR_Fields','aor_fields','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1abf9034-adc5-c257-4c67-57e7f68e420b','am_projecttemplates_modified_user','Users','users','id','AM_ProjectTemplates','am_projecttemplates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1c340347-4c65-65d7-7c00-57e7f6d105ea','aow_processed_aow_actions','AOW_Processed','aow_processed','id','AOW_Actions','aow_actions','id','aow_processed_aow_actions','aow_processed_id','aow_action_id','many-to-many',NULL,NULL,0,0),('1c75dbb8-9ee7-b64a-db91-57e7f6d73fee','aop_case_updates_created_by','Users','users','id','AOP_Case_Updates','aop_case_updates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1cbde5f4-62a7-6e06-3ed0-57e7f6d102c5','securitygroups_aos_quotes','SecurityGroups','securitygroups','id','AOS_Quotes','aos_quotes','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Quotes',0,0),('1ec74660-59a4-4408-adb4-57e7f6f3e69f','email_template_email_marketings','EmailTemplates','email_templates','id','EmailMarketing','email_marketing','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1f29f7ed-06d7-ce1b-19ba-57e7f6991064','calls_reschedule_created_by','Users','users','id','Calls_Reschedule','calls_reschedule','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1f54173c-2830-289e-0193-57e7f6e774f5','acl_roles_users','ACLRoles','acl_roles','id','Users','users','id','acl_roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('1f9792e0-39ce-e7ee-eb4e-57e7f6471234','securitygroups_projecttask','SecurityGroups','securitygroups','id','ProjectTask','project_task','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProjectTask',0,0),('1fc70cbe-9208-0567-23e9-57e7f60fa7f5','aok_knowledgebase_created_by','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('206ae8d1-155a-1d58-840f-57e7f6d6e8c3','aos_products_modified_user','Users','users','id','AOS_Products','aos_products','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('21bc2085-e016-6531-c1c3-57e7f66ba801','case_calls','Cases','cases','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('21c28c19-a8fd-b6af-edc8-57e7f6f7400f','securitygroups_fp_event_locations','SecurityGroups','securitygroups','id','FP_Event_Locations','fp_event_locations','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','FP_Event_Locations',0,0),('21ca728f-5cb1-2ef6-a033-57e7f6d8b70c','campaign_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('21d5b248-9bda-a17f-3814-57e7f6cbf526','lead_direct_reports','Leads','leads','id','Leads','leads','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('21f8416c-d020-ed04-1946-57e7f6f0c556','contact_campaign_log','Contacts','contacts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Contacts',0,0),('221daa79-ef83-1e6b-19ce-57e7f6951388','fp_events_fp_event_locations_1','FP_events','fp_events','id','FP_Event_Locations','fp_event_locations','id','fp_events_fp_event_locations_1_c','fp_events_fp_event_locations_1fp_events_ida','fp_events_fp_event_locations_1fp_event_locations_idb','many-to-many',NULL,NULL,0,0),('24a4feda-cec9-a847-ee50-57e7f66bbb8b','alerts_created_by','Users','users','id','Alerts','alerts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('24b05e97-a5a8-431c-34a2-57e7f60fc750','calls_notes','Calls','calls','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Calls',0,0),('24d7b7a4-a40e-a46c-81b7-57e7f68a3bcc','opportunities_campaign','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('25c375d1-8e5d-54d7-3f35-57e7f68d50d4','emails_tasks_rel','Emails','emails','id','Tasks','tasks','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Tasks',0,0),('27607c2d-a73d-1952-eff5-57e7f61c225e','aos_quotes_aos_product_quotes','AOS_Quotes','aos_quotes','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('27651421-fa61-99f8-77ac-57e7f61968da','am_projecttemplates_created_by','Users','users','id','AM_ProjectTemplates','am_projecttemplates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('277fe240-1f44-c131-6132-57e7f632d74a','aop_case_updates_assigned_user','Users','users','id','AOP_Case_Updates','aop_case_updates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('29d765df-5600-c7f9-ff8a-57e7f6900591','aobh_businesshours_modified_user','Users','users','id','AOBH_BusinessHours','aobh_businesshours','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('29d972c8-7210-d4d6-4a7d-57e7f68fe789','project_tasks_notes','ProjectTask','project_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('2a07e4ea-ffb0-86c9-fb3f-57e7f6286439','users_email_addresses','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Users',0,0),('2a2845f5-d978-2dce-21ed-57e7f697c9e2','account_campaign_log','Accounts','accounts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Accounts',0,0),('2a29a0c8-3afb-8b67-4c09-57e7f64c588f','calls_reschedule_assigned_user','Users','users','id','Calls_Reschedule','calls_reschedule','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2a6f73b7-a1ba-5b26-2205-57e7f6c978ce','email_marketing_prospect_lists','EmailMarketing','email_marketing','id','ProspectLists','prospect_lists','id','email_marketing_prospect_lists','email_marketing_id','prospect_list_id','many-to-many',NULL,NULL,0,0),('2a9aef21-3fec-b589-a771-57e7f6034a8c','aor_charts_modified_user','Users','users','id','AOR_Charts','aor_charts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2c3cfc5d-5d0c-673a-6926-57e7f6a72d65','campaign_campaigntrakers','Campaigns','campaigns','id','CampaignTrackers','campaign_trkrs','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2c8c823a-d022-0f03-05ed-57e7f6508b9a','lead_tasks','Leads','leads','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('2cc4206b-dd81-1698-9db9-57e7f6e1c394','aos_products_created_by','Users','users','id','AOS_Products','aos_products','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2cc61950-5d7b-b770-6600-57e7f6843616','case_tasks','Cases','cases','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('2cdc17c0-ede7-45fe-85de-57e7f6297a1e','optimistic_locking',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('2d29dbd4-db31-c9e1-82aa-57e7f6d13fe5','fp_events_leads_1','FP_events','fp_events','id','Leads','leads','id','fp_events_leads_1_c','fp_events_leads_1fp_events_ida','fp_events_leads_1leads_idb','many-to-many',NULL,NULL,0,0),('2eae4e44-7542-17c9-d74d-57e7f6b19d2c','aos_contracts_aos_line_item_groups','AOS_Contracts','aos_contracts','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2f3a7e48-e7fa-a516-b906-57e7f6810d4a','aow_processed_modified_user','Users','users','id','AOW_Processed','aow_processed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2f79e354-2d74-42ee-f459-57e7f6462ceb','opportunity_aos_quotes','Opportunities','opportunities','id','AOS_Quotes','aos_quotes','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2fa02bd7-02ca-592e-8802-57e7f6d20dbf','calls_reschedule','Calls','calls','id','Calls_Reschedule','calls_reschedule','call_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2fb8da8c-2ea7-7fa2-d72a-57e7f6dab534','emails_users_rel','Emails','emails','id','Users','users','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Users',0,0),('321ce3f3-3d76-3027-9f8d-57e7f6eb7e75','am_projecttemplates_assigned_user','Users','users','id','AM_ProjectTemplates','am_projecttemplates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('32246fe5-824a-0ca3-3b9f-57e7f6c7dbad','cases_aop_case_updates','Cases','cases','id','AOP_Case_Updates','aop_case_updates','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('326a03b8-53a4-c876-9a38-57e7f6d507b8','aos_quotes_aos_line_item_groups','AOS_Quotes','aos_quotes','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('33504e4a-e031-163b-8b6a-57e7f6d25fa1','prospectlists_assigned_user','Users','users','id','prospectlists','prospect_lists','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('34dc33a0-909b-fa9b-f495-57e7f68cc435','project_tasks_tasks','ProjectTask','project_task','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('34f3bc48-bbc6-ae8b-b7b0-57e7f62e0c6c','aobh_businesshours_created_by','Users','users','id','AOBH_BusinessHours','aobh_businesshours','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('35fa30c4-ba0e-dab8-af18-57e7f609b4b7','contact_aos_quotes','Contacts','contacts','id','AOS_Quotes','aos_quotes','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3751055e-1b91-963d-252a-57e7f676b1fb','reminders_modified_user','Users','users','id','Reminders','reminders','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3778524a-8793-b376-48b6-57e7f6029000','case_notes','Cases','cases','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('378446db-cfba-6e18-c3ba-57e7f6e6fe92','unified_search',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('379308bf-b262-53b0-e16a-57e7f68cd30e','lead_notes','Leads','leads','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('37958253-bc5a-7a42-73fb-57e7f6e0964e','aor_charts_created_by','Users','users','id','AOR_Charts','aor_charts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('37d159e5-fcc3-8f45-9ff1-57e7f674eaf9','fp_events_prospects_1','FP_events','fp_events','id','Prospects','prospects','id','fp_events_prospects_1_c','fp_events_prospects_1fp_events_ida','fp_events_prospects_1prospects_idb','many-to-many',NULL,NULL,0,0),('37d1f154-e025-1d3a-0b82-57e7f60a2305','aos_products_assigned_user','Users','users','id','AOS_Products','aos_products','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('399af3ec-87df-6335-8331-57e7f64eea54','jjwg_markers_modified_user','Users','users','id','jjwg_Markers','jjwg_markers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3a608ba4-d0c4-2279-3866-57e7f66654df','emails_project_task_rel','Emails','emails','id','ProjectTask','project_task','id','emails_beans','email_id','bean_id','many-to-many','bean_module','ProjectTask',0,0),('3a894248-a498-2490-0ac2-57e7f6917ad9','opportunity_aos_contracts','Opportunities','opportunities','id','AOS_Contracts','aos_contracts','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3b8c53cd-65ed-3785-f63d-57e7f6fc71c1','users_email_addresses_primary','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('3cfbb610-0a26-fca3-ae72-57e7f6ad6e94','securitygroups_prospectlists','SecurityGroups','securitygroups','id','ProspectLists','prospect_lists','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProspectLists',0,0),('3d31c473-007b-49eb-ea11-57e7f61325bd','account_aos_quotes','Accounts','accounts','id','AOS_Quotes','aos_quotes','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3d5a91aa-c763-24dc-fc91-57e7f64a4bce','aop_case_updates_notes','AOP_Case_Updates','aop_case_updates','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOP_Case_Updates',0,0),('3d995bef-139a-26b8-c27e-57e7f6f76f17','alerts_assigned_user','Users','users','id','Alerts','alerts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3da5c018-22df-7ebb-8ba4-57e7f63177c0','securitygroups_modified_user','Users','users','id','SecurityGroups','securitygroups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3daaf383-1ece-ee63-a3ac-57e7f67ee777','securitygroups_emails','SecurityGroups','securitygroups','id','Emails','emails','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Emails',0,0),('3f8e64af-30c8-b4fd-f194-57e7f64b8376','project_tasks_meetings','ProjectTask','project_task','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('3fcb112e-9d93-0af7-5696-57e7f6ecbf6d','aobh_businesshours_assigned_user','Users','users','id','AOBH_BusinessHours','aobh_businesshours','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('40c80c40-6517-72af-9ed3-57e7f62ec652','opportunity_emails','Opportunities','opportunities','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('418007d1-0960-8974-f62b-57e7f6caa119','cases_created_by','Users','users','id','Cases','cases','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('41b20535-feff-691e-29a3-57e7f6f024bf','prospect_emails','Prospects','prospects','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('423fa0d0-c8d5-ec9b-cfa8-57e7f62400ca','lead_meetings','Leads','leads','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('427205c1-f8d5-cb04-43f9-57e7f64412e4','securitygroups_aos_products','SecurityGroups','securitygroups','id','AOS_Products','aos_products','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Products',0,0),('42769da6-3d84-b86b-a9dc-57e7f6ffb349','contact_aos_invoices','Contacts','contacts','id','AOS_Invoices','aos_invoices','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4285d91a-4d55-f851-5abe-57e7f6d7f5c7','case_meetings','Cases','cases','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('42a2cfa6-72ab-42e4-83dd-57e7f6b5aa7e','aor_charts_aor_reports','AOR_Reports','aor_reports','id','AOR_Charts','aor_charts','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('42b20bbd-0182-4e15-7863-57e7f68d5735','test1_firstmodule_assigned_user','Users','users','id','test1_FirstModule','test1_firstmodule','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('42d91dcb-5941-10bd-fa16-57e7f6fa9ce6','jjwg_maps_jjwg_areas','jjwg_Maps','jjwg_maps','id','jjwg_Areas','jjwg_areas','id','jjwg_maps_jjwg_areas_c','jjwg_maps_5304wg_maps_ida','jjwg_maps_41f2g_areas_idb','many-to-many',NULL,NULL,0,0),('43ca2ff0-5ec7-b5ca-b3a6-57e7f6ebf17f','schedulers_created_by_rel','Users','users','id','Schedulers','schedulers','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('443da477-29ae-fe88-62db-57e7f6eed275','aow_actions_modified_user','Users','users','id','AOW_Actions','aow_actions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('444bc1da-2b8c-50fe-650a-57e7f618a842','leads_documents','Leads','leads','id','Documents','documents','id','linked_documents','parent_id','document_id','many-to-many','parent_type','Leads',0,0),('4574f694-58a5-111f-08e3-57e7f64eb614','emails_projects_rel','Emails','emails','id','Project','project','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Project',0,0),('47d38c82-4c3f-1c2f-e856-57e7f6476e3d','securitygroups_meetings','SecurityGroups','securitygroups','id','Meetings','meetings','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Meetings',0,0),('47f48d21-e1f2-eb6f-762d-57e7f6a0446b','aow_processed_created_by','Users','users','id','AOW_Processed','aow_processed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('480ee29a-e905-dc11-759c-57e7f6233cd2','emails_assigned_user','Users','users','id','Emails','emails','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('48165242-8005-1dd9-c947-57e7f6e86389','securitygroups_created_by','Users','users','id','SecurityGroups','securitygroups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4a95b14c-f5a5-f29a-d046-57e7f631eff3','project_tasks_calls','ProjectTask','project_task','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('4bc6f262-511e-f837-6340-57e7f6ea626d','account_aos_invoices','Accounts','accounts','id','AOS_Invoices','aos_invoices','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4c3cfa29-76a1-5e29-6d3d-57e7f68c392a','am_tasktemplates_modified_user','Users','users','id','AM_TaskTemplates','am_tasktemplates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4d30c130-ba1b-ee3a-94bf-57e7f63e1c06','case_emails','Cases','cases','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('4d83619b-f9fd-3625-4715-57e7f6823c3d','product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Products','aos_products','aos_product_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4d8a83c9-7ee9-fdca-45d4-57e7f699b08d','jjwg_maps_jjwg_markers','jjwg_Maps','jjwg_maps','id','jjwg_Markers','jjwg_markers','id','jjwg_maps_jjwg_markers_c','jjwg_maps_b229wg_maps_ida','jjwg_maps_2e31markers_idb','many-to-many',NULL,NULL,0,0),('4d8ec853-2655-4cc5-80bc-57e7f63accd6','securitygroups_emailtemplates','SecurityGroups','securitygroups','id','EmailTemplates','email_templates','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','EmailTemplates',0,0),('4eb6e1d9-2f50-1f3e-27b4-57e7f66ff83a','aos_invoices_modified_user','Users','users','id','AOS_Invoices','aos_invoices','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4fdaba20-7a01-cd2c-8afd-57e7f6ad42b0','contact_aos_contracts','Contacts','contacts','id','AOS_Contracts','aos_contracts','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5003b36d-ea09-a951-5a2d-57e7f6671b91','accounts_bugs','Accounts','accounts','id','Bugs','bugs','id','accounts_bugs','account_id','bug_id','many-to-many',NULL,NULL,0,0),('5018d9ce-dd10-972e-ee76-57e7f6df2433','emails_prospects_rel','Emails','emails','id','Prospects','prospects','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Prospects',0,0),('50458d85-af47-5ae2-6fb4-57e7f66246a0','aow_actions_created_by','Users','users','id','AOW_Actions','aow_actions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('51955534-1e3d-6c2b-0536-57e7f6455412','campaignlog_contact','CampaignLog','campaign_log','related_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('51b662c1-9764-8c4d-9f1b-57e7f63ed8af','schedulers_modified_user_id_rel','Users','users','id','Schedulers','schedulers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('52be30d1-fc4e-a76e-c68a-57e7f6eb5a1c','sugarfeed_modified_user','Users','users','id','SugarFeed','sugarfeed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('52be4914-1e7d-bb01-be68-57e7f6b791a0','emails_modified_user','Users','users','id','Emails','emails','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('52bf8b06-5b67-dbcb-6d15-57e7f67dc214','securitygroups_assigned_user','Users','users','id','SecurityGroups','securitygroups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('530f62ac-237d-a5a3-7409-57e7f682e327','aod_indexevent_modified_user','Users','users','id','AOD_IndexEvent','aod_indexevent','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('53d0f9a5-7da4-625e-b810-57e7f6d5dbf1','aor_reports_modified_user','Users','users','id','AOR_Reports','aor_reports','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('54debced-21a7-9b93-55b8-57e7f67c52c5','aor_conditions_modified_user','Users','users','id','AOR_Conditions','aor_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('550c21c0-67a2-88d7-a27c-57e7f6a98f08','prospects_modified_user','Users','users','id','Prospects','prospects','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('556ec4b8-e027-659a-175a-57e7f6423a66','project_tasks_emails','ProjectTask','project_task','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('56ae0a8f-629d-e9ff-7124-57e7f68a24e2','documents_accounts','Documents','documents','id','Accounts','accounts','id','documents_accounts','document_id','account_id','many-to-many',NULL,NULL,0,0),('57efec79-f3a1-099c-a1a8-57e7f67c0fcd','lead_calls','Leads','leads','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('581b736c-e9cc-86f0-85ca-57e7f6d423ab','am_tasktemplates_created_by','Users','users','id','AM_TaskTemplates','am_tasktemplates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('583ffb40-eb07-82e1-52d9-57e7f677fce2','cases_created_contact','Contacts','contacts','id','Cases','cases','contact_created_by_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('588ce434-e48e-ba15-28cc-57e7f6bda897','project_contacts_1','Project','project','id','Contacts','contacts','id','project_contacts_1_c','project_contacts_1project_ida','project_contacts_1contacts_idb','many-to-many',NULL,NULL,0,0),('5a557a43-55e5-d0f8-bc9b-57e7f69d68cf','emailtemplates_assigned_user','Users','users','id','EmailTemplates','email_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5abe757e-305d-52f7-2d3f-57e7f688b1b5','campaignlog_lead','CampaignLog','campaign_log','related_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5ad85851-d06e-de8b-3e0b-57e7f636b146','schedulers_jobs_rel','Schedulers','schedulers','id','SchedulersJobs','job_queue','scheduler_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5ae9783b-9742-bdca-6ffa-57e7f624bdc1','contacts_aop_case_updates','Contacts','contacts','id','AOP_Case_Updates','aop_case_updates','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5b0bcae9-4d22-2f66-9ab1-57e7f6525b2d','accounts_contacts','Accounts','accounts','id','Contacts','contacts','id','accounts_contacts','account_id','contact_id','many-to-many',NULL,NULL,0,0),('5b352878-85b6-88c5-2f98-57e7f6bdc599','meetings_contacts','Meetings','meetings','id','Contacts','contacts','id','meetings_contacts','meeting_id','contact_id','many-to-many',NULL,NULL,0,0),('5db63867-32a3-888b-868e-57e7f6e78e47','sugarfeed_created_by','Users','users','id','SugarFeed','sugarfeed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5dc2d6f7-70ab-f252-2d0c-57e7f68a7d0e','emails_created_by','Users','users','id','Emails','emails','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5e831e37-23ad-edef-f9d2-57e7f6888dc6','aos_invoices_created_by','Users','users','id','AOS_Invoices','aos_invoices','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('601f3672-463c-ab89-fb18-57e7f6616608','project_tasks_assigned_user','Users','users','id','ProjectTask','project_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('60788399-0a3c-abfe-2a2d-57e7f6617615','documents_modified_user','Users','users','id','Documents','documents','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('608d3ec1-2303-5f00-5f37-57e7f6b249dc','aor_reports_created_by','Users','users','id','AOR_Reports','aor_reports','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('62ae8e1e-e743-3d8a-5233-57e7f6288106','outbound_email_modified_user','Users','users','id','OutboundEmailAccounts','outbound_email','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('632489e6-dd85-37d2-734b-57e7f6597ae4','am_tasktemplates_assigned_user','Users','users','id','AM_TaskTemplates','am_tasktemplates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('63288e90-d7b7-074b-9146-57e7f6572558','aor_conditions_created_by','Users','users','id','AOR_Conditions','aor_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('643bb2d2-5f02-4cb3-f3a6-57e7f6e200a5','aow_workflow_modified_user','Users','users','id','AOW_WorkFlow','aow_workflow','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('64ff8bb1-5ad4-e3f0-40c0-57e7f6233e5d','aow_conditions_modified_user','Users','users','id','AOW_Conditions','aow_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('65978e39-1a2f-0413-60fc-57e7f6bea325','campaignlog_created_opportunities','CampaignLog','campaign_log','related_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('65a4034d-bed6-2877-6740-57e7f6164c29','meetings_notes','Meetings','meetings','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('65b6f9be-2eeb-cac8-0062-57e7f66d2098','accounts_opportunities','Accounts','accounts','id','Opportunities','opportunities','id','accounts_opportunities','account_id','opportunity_id','many-to-many',NULL,NULL,0,0),('65b87a78-6d40-d700-2a00-57e7f6ca3348','project_users_1','Project','project','id','Users','users','id','project_users_1_c','project_users_1project_ida','project_users_1users_idb','many-to-many',NULL,NULL,0,0),('65cfd65c-fba1-e153-5435-57e7f6244354','meetings_users','Meetings','meetings','id','Users','users','id','meetings_users','meeting_id','user_id','many-to-many',NULL,NULL,0,0),('65e87511-a042-32b9-f355-57e7f614dd72','account_aos_contracts','Accounts','accounts','id','AOS_Contracts','aos_contracts','contract_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('67f6dfdb-776b-4940-8963-57e7f6ee2e59','documents_contacts','Documents','documents','id','Contacts','contacts','id','documents_contacts','document_id','contact_id','many-to-many',NULL,NULL,0,0),('683b5b97-a5ce-0df0-275e-57e7f64f748d','lead_emails','Leads','leads','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('6860c084-8938-213e-a2c2-57e7f6cec897','sugarfeed_assigned_user','Users','users','id','SugarFeed','sugarfeed','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('686f1c53-f539-447e-31a1-57e7f6166a37','aos_invoices_assigned_user','Users','users','id','AOS_Invoices','aos_invoices','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6872e0f0-65d7-d58f-1f8d-57e7f66ccc8b','emails_notes_rel','Emails','emails','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('68e27c60-98da-2c55-f37e-57e7f69e491c','schedulersjobs_assigned_user','Users','users','id','SchedulersJobs','schedulersjobs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('691ab1eb-3688-1c02-dea0-57e7f6e67319','reminders_created_by','Users','users','id','Reminders','reminders','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6b215cb4-9d3d-4f81-c85a-57e7f6cbf493','project_tasks_modified_user','Users','users','id','ProjectTask','project_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6b3773fb-59ba-ea8c-be67-57e7f61b795f','aor_reports_assigned_user','Users','users','id','AOR_Reports','aor_reports','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6b71056f-56c4-a1f3-bd2f-57e7f68d50f2','bugs_fixed_in_release','Releases','releases','id','Bugs','bugs','fixed_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6bf30671-8557-69e2-5016-57e7f631f08d','account_emails','Accounts','accounts','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('6ced41e2-dc61-b8d1-0d1d-57e7f6bccd16','bugs_modified_user','Users','users','id','Bugs','bugs','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6dbe0cc8-447b-7b3b-3cff-57e7f6caaead','jjwg_Maps_meetings','jjwg_Maps','jjwg_Maps','parent_id','Meetings','meetings','id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('6ded838f-ccc9-d2b0-9e67-57e7f6531014','documents_created_by','Users','users','id','Documents','documents','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6f1e4b0e-6b6d-26c7-a72e-57e7f6309585','notes_assigned_user','Users','users','id','Notes','notes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6f3303da-8683-9d54-6282-57e7f678b760','aos_quotes_created_by','Users','users','id','AOS_Quotes','aos_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6f40099f-653a-809d-211e-57e7f684f27f','oauthtokens_assigned_user','Users','users','id','OAuthTokens','oauth_tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6fb4e51c-fc27-67c5-0661-57e7f60d87e3','jjwg_markers_created_by','Users','users','id','jjwg_Markers','jjwg_markers','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('70ca8fb3-4e4c-e31a-40cc-57e7f62f53d5','securitygroups_acl_roles','SecurityGroups','securitygroups','id','ACLRoles','acl_roles','id','securitygroups_acl_roles','securitygroup_id','role_id','many-to-many',NULL,NULL,0,0),('70cf7265-a23c-ff4c-8656-57e7f6be53d1','aow_workflow_created_by','Users','users','id','AOW_WorkFlow','aow_workflow','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('70d0ef9e-1d36-ed00-acbb-57e7f6283727','calls_contacts','Calls','calls','id','Contacts','contacts','id','calls_contacts','call_id','contact_id','many-to-many',NULL,NULL,0,0),('70d8d93c-14af-c876-d166-57e7f6d2f6dc','meetings_leads','Meetings','meetings','id','Leads','leads','id','meetings_leads','meeting_id','lead_id','many-to-many',NULL,NULL,0,0),('71c21ca2-195e-8c02-2c61-57e7f66bb65b','aos_products_quotes_modified_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7353db24-79b8-b998-7637-57e7f6747808','reminders_assigned_user','Users','users','id','Reminders','reminders','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('73583f65-da09-67a9-a960-57e7f69aa8c7','campaignlog_targeted_users','CampaignLog','campaign_log','target_id','Users','users','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('737dd7ca-030d-fad1-67af-57e7f61f85c1','securitygroups_aos_invoices','SecurityGroups','securitygroups','id','AOS_Invoices','aos_invoices','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Invoices',0,0),('73837936-9272-898e-daf5-57e7f62cd92f','emails_contacts_rel','Emails','emails','id','Contacts','contacts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Contacts',0,0),('73a5777b-3005-acaa-83a6-57e7f6818d7e','documents_opportunities','Documents','documents','id','Opportunities','opportunities','id','documents_opportunities','document_id','opportunity_id','many-to-many',NULL,NULL,0,0),('743d0362-18d8-abcf-be0c-57e7f66ac708','aow_conditions_created_by','Users','users','id','AOW_Conditions','aow_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('74a7206e-06cc-67d6-ced0-57e7f60bbe5f','contacts_modified_user','Users','users','id','Contacts','contacts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('74affd0b-c79b-9506-478d-57e7f65d2f84','aor_scheduled_reports_modified_user','Users','users','id','AOR_Scheduled_Reports','aor_scheduled_reports','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('74eaf056-8737-cefc-111e-57e7f6aafaf7','accounts_modified_user','Users','users','id','Accounts','accounts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('75d47f8f-ec96-edb0-2803-57e7f61aa6ef','project_tasks_created_by','Users','users','id','ProjectTask','project_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('761c665c-27aa-49f2-7e8f-57e7f6edc3d8','bugs_created_by','Users','users','id','Bugs','bugs','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('763eaa02-2898-84f5-e332-57e7f6526cf3','securitygroups_aor_reports','SecurityGroups','securitygroups','id','AOR_Reports','aor_reports','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOR_Reports',0,0),('76cb0f08-38c6-0186-37bf-57e7f6e026fc','favorites_modified_user','Users','users','id','Favorites','favorites','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7893331d-f913-583d-9c96-57e7f611e2ce','documents_assigned_user','Users','users','id','Documents','documents','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7b603cd6-fbdb-cd1e-191a-57e7f66d59bf','jjwg_markers_assigned_user','Users','users','id','jjwg_Markers','jjwg_markers','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7b724b86-c136-105a-94bc-57e7f6646860','calls_users','Calls','calls','id','Users','users','id','calls_users','call_id','user_id','many-to-many',NULL,NULL,0,0),('7b79d906-f560-fd38-caf0-57e7f699ebeb','aow_workflow_assigned_user','Users','users','id','AOW_WorkFlow','aow_workflow','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7b96d0ff-df74-7323-c308-57e7f6f74ddb','opportunities_contacts','Opportunities','opportunities','id','Contacts','contacts','id','opportunities_contacts','opportunity_id','contact_id','many-to-many',NULL,NULL,0,0),('7d02bb44-7431-9921-2b4a-57e7f6e96e95','securitygroups_project_task','SecurityGroups','securitygroups','id','ProjectTask','project_task','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProjectTask',0,0),('7d932a4b-2c3a-e19f-b1a5-57e7f6ef9045','aod_indexevent_created_by','Users','users','id','AOD_IndexEvent','aod_indexevent','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7e299c34-e530-394e-70d9-57e7f61fc574','aos_invoices_aos_product_quotes','AOS_Invoices','aos_invoices','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7e2fd2a3-66c2-bc5f-6e6a-57e7f6ce26af','emails_accounts_rel','Emails','emails','id','Accounts','accounts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Accounts',0,0),('7e450a71-fab9-4931-0238-57e7f6781647','documents_cases','Documents','documents','id','Cases','cases','id','documents_cases','document_id','case_id','many-to-many',NULL,NULL,0,0),('7e4735ec-3384-bd04-654f-57e7f66b4f1a','accounts_created_by','Users','users','id','Accounts','accounts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('806a0d26-67c3-72f6-91de-57e7f6694d6b','eapm_modified_user','Users','users','id','EAPM','eapm','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('809eed43-ae66-d91a-07b1-57e7f687c3a6','lead_campaign_log','Leads','leads','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Leads',0,0),('80b0439b-28c7-d634-0bcc-57e7f6ba8aa9','contacts_created_by','Users','users','id','Contacts','contacts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('80bf933c-7d6e-3e1e-ca25-57e7f6ed85df','campaignlog_sent_emails','CampaignLog','campaign_log','related_id','Emails','emails','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('80cf2dd4-3966-8b44-4767-57e7f6f4f581','bugs_assigned_user','Users','users','id','Bugs','bugs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('80ef7ac3-1057-7181-221a-57e7f6989b14','aor_reports_aor_fields','AOR_Reports','aor_reports','id','AOR_Fields','aor_fields','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81137f20-77ff-9b93-c3dd-57e7f672734e','aor_scheduled_reports_created_by','Users','users','id','AOR_Scheduled_Reports','aor_scheduled_reports','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('839d20b7-9c01-4d05-eed6-57e7f69d31fa','securitygroups_documents','SecurityGroups','securitygroups','id','Documents','documents','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Documents',0,0),('8446f98d-1529-b921-ab08-57e7f6e84465','reminders_invitees_modified_user','Users','users','id','Reminders_Invitees','reminders_invitees','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8665eb48-27b7-03a6-b3a4-57e7f6de7121','securitygroups_jjwg_markers','SecurityGroups','securitygroups','id','jjwg_Markers','jjwg_markers','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Markers',0,0),('8684464c-bc0e-5d13-bade-57e7f6e0f3be','favorites_created_by','Users','users','id','Favorites','favorites','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('868677a4-a1fd-c625-7da6-57e7f6efe526','securitygroups_aow_workflow','SecurityGroups','securitygroups','id','AOW_WorkFlow','aow_workflow','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOW_WorkFlow',0,0),('8696de8f-feba-2194-cdad-57e7f62198f2','prospect_list_campaigns','ProspectLists','prospect_lists','id','Campaigns','campaigns','id','prospect_list_campaigns','prospect_list_id','campaign_id','many-to-many',NULL,NULL,0,0),('86f94d34-2bf4-f8ef-78c4-57e7f6728974','campaigns_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8735142c-02c0-12e3-5bb9-57e7f6f8e3a6','aos_products_quotes_created_by','Users','users','id','AOS_Products_Quotes','aos_products_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('874cde47-ab85-5794-26a4-57e7f64db3fe','prospects_created_by','Users','users','id','Prospects','prospects','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('88eeab8d-fc2d-619d-3977-57e7f6da878c','accounts_assigned_user','Users','users','id','Accounts','accounts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('892b553d-30f1-6739-7c39-57e7f6e65246','opportunities_modified_user','Users','users','id','Opportunities','opportunities','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('892c98ed-2eb1-a6c5-abe8-57e7f60cf235','outbound_email_created_by','Users','users','id','OutboundEmailAccounts','outbound_email','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('892d4819-91e0-0c10-4a33-57e7f686c53f','aos_invoices_aos_line_item_groups','AOS_Invoices','aos_invoices','id','AOS_Line_Item_Groups','aos_line_item_groups','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('892f6c03-3484-1b2f-f489-57e7f6d2f04d','aod_indexevent_assigned_user','Users','users','id','AOD_IndexEvent','aod_indexevent','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('89333ae7-d50b-3f23-e636-57e7f68a5b32','emails_leads_rel','Emails','emails','id','Leads','leads','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Leads',0,0),('894d8aaf-f358-0170-b391-57e7f683681f','documents_bugs','Documents','documents','id','Bugs','bugs','id','documents_bugs','document_id','bug_id','many-to-many',NULL,NULL,0,0),('8bb68dc2-351c-a569-3df2-57e7f67b75d5','contacts_assigned_user','Users','users','id','Contacts','contacts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8bd66102-1524-848a-d167-57e7f60a398e','securitygroups_bugs','SecurityGroups','securitygroups','id','Bugs','bugs','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Bugs',0,0),('8bea78e5-31bd-05a0-7428-57e7f66b6def','aor_reports_aor_conditions','AOR_Reports','aor_reports','id','AOR_Conditions','aor_conditions','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ea0f869-cb2d-f677-478e-57e7f61d632b','calls_leads','Calls','calls','id','Leads','leads','id','calls_leads','call_id','lead_id','many-to-many',NULL,NULL,0,0),('8eee7e6e-fb27-3d2a-228b-57e7f6360f5e','jjwg_maps_modified_user','Users','users','id','jjwg_Maps','jjwg_maps','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8efe74a2-5799-d3a5-3052-57e7f6348ef1','document_revisions','Documents','documents','id','DocumentRevisions','document_revisions','document_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8fafc6c5-cb55-8264-bbbf-57e7f6a6c14d','securitygroups_prospect_lists','SecurityGroups','securitygroups','id','ProspectLists','prospect_lists','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProspectLists',0,0),('912f6fb7-7496-b442-0a98-57e7f6fabf1b','aow_workflow_aow_conditions','AOW_WorkFlow','aow_workflow','id','AOW_Conditions','aow_conditions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('913ba24c-2667-4210-132c-57e7f6fd6377','prospect_list_contacts','ProspectLists','prospect_lists','id','Contacts','contacts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Contacts',0,0),('93c7cf5c-3c1e-ccaa-1abf-57e7f6ec3a75','campaigns_created_by','Users','users','id','Campaigns','campaigns','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('93ccab6d-7a65-fdc4-f2d6-57e7f653b070','outbound_email_assigned_user','Users','users','id','OutboundEmailAccounts','outbound_email','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('93d9a7f3-9fdb-7d30-4fcf-57e7f633aeae','emails_aos_contracts_rel','Emails','emails','id','AOS_Contracts','aos_contracts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','AOS_Contracts',0,0),('93fa3c75-2a78-107b-55fe-57e7f671421f','securitygroups_accounts','SecurityGroups','securitygroups','id','Accounts','accounts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Accounts',0,0),('941c2763-38ac-50ce-6184-57e7f6abb235','aok_knowledgebase_categories','AOK_KnowledgeBase','aok_knowledgebase','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','id','aok_knowledgebase_categories','aok_knowledgebase_id','aok_knowledge_base_categories_id','many-to-many',NULL,NULL,0,0),('94c0c4fb-9f41-a30c-0d2e-57e7f662813e','aos_products_quotes_assigned_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('95a20e8a-3c7b-eede-430a-57e7f6b51906','securitygroups_project','SecurityGroups','securitygroups','id','Project','project','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Project',0,0),('96842828-6898-3d9f-e0d4-57e7f671b418','bug_tasks','Bugs','bugs','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('96a3ee74-662f-5a3c-aa29-57e7f622df51','aor_scheduled_reports_aor_reports','AOR_Reports','aor_reports','id','AOR_Scheduled_Reports','aor_scheduled_reports','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('96d27183-54c9-734d-a221-57e7f613e836','aos_contracts_modified_user','Users','users','id','AOS_Contracts','aos_contracts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('96f10322-f4df-adab-9e10-57e7f601a574','emails_cases_rel','Emails','emails','id','Cases','cases','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Cases',0,0),('97c40489-29c0-26d0-9f5b-57e7f6f6626a','projects_created_by','Users','users','id','Project','project','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('98240236-086a-7e53-75f3-57e7f6d0080a','contact_tasks_parent','Contacts','contacts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('98d206f9-f252-2d98-2671-57e7f6c45587','meetings_created_by','Users','users','id','Meetings','meetings','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('991966c2-81fb-c5d7-e4d6-57e7f6cff611','securitygroups_contacts','SecurityGroups','securitygroups','id','Contacts','contacts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Contacts',0,0),('993f6912-5412-cda4-9e9c-57e7f632f194','prospects_assigned_user','Users','users','id','Prospects','prospects','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('995062e7-6af9-a547-84e6-57e7f6050e90','opportunities_created_by','Users','users','id','Opportunities','opportunities','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('996ca440-2e93-cb42-b9bd-57e7f68af8ad','reminders_invitees_created_by','Users','users','id','Reminders_Invitees','reminders_invitees','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('998614f1-396b-4a5c-9474-57e7f662c467','jjwg_maps_created_by','Users','users','id','jjwg_Maps','jjwg_maps','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('998bbba7-fef7-71f0-f4f8-57e7f6695d98','securitygroups_users','SecurityGroups','securitygroups','id','Users','users','id','securitygroups_users','securitygroup_id','user_id','many-to-many',NULL,NULL,0,0),('99f60c37-40e8-50a0-5f3f-57e7f6b61111','projects_opportunities','Project','project','id','Opportunities','opportunities','id','projects_opportunities','project_id','opportunity_id','many-to-many',NULL,NULL,0,0),('9acadd84-363d-816e-fd86-57e7f6efe62a','tasks_modified_user','Users','users','id','Tasks','tasks','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9b9ee4ce-5356-9f42-7c40-57e7f6791945','revisions_created_by','Users','users','id','DocumentRevisions','document_revisions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c44bc18-a208-ea41-f32d-57e7f6ab263a','prospect_list_prospects','ProspectLists','prospect_lists','id','Prospects','prospects','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Prospects',0,0),('9c478f11-e779-320e-daa7-57e7f654733b','aow_workflow_aow_actions','AOW_WorkFlow','aow_workflow','id','AOW_Actions','aow_actions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9ce2bab3-5411-d248-cecb-57e7f61e2063','aos_pdf_templates_modified_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9ea13ebd-4e6b-7f07-a86b-57e7f61726db','accounts_email_addresses','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Accounts',0,0),('9ec8b52b-9342-5c48-ebbe-57e7f62ac03f','campaigns_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9ee2cc91-cc66-dd69-db8c-57e7f653e27b','cases_bugs','Cases','cases','id','Bugs','bugs','id','cases_bugs','case_id','bug_id','many-to-many',NULL,NULL,0,0),('9eedbfe6-0839-e390-479e-57e7f6ba7703','emails_meetings_rel','Emails','emails','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9efa64e1-b361-c32e-bf01-57e7f6fcf889','aos_product_quotes_aos_products','AOS_Products','aos_products','id','AOS_Products_Quotes','aos_products_quotes','product_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9f188bab-eb66-e211-b7e6-57e7f6681da9','am_projecttemplates_project_1','AM_ProjectTemplates','am_projecttemplates','id','Project','project','id','am_projecttemplates_project_1_c','am_projecttemplates_project_1am_projecttemplates_ida','am_projecttemplates_project_1project_idb','many-to-many',NULL,NULL,0,0),('9f2a46ac-7a0f-3a63-c4e7-57e7f6426d9c','jjwg_areas_modified_user','Users','users','id','jjwg_Areas','jjwg_areas','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a14995df-0112-f74e-d175-57e7f6f074b5','bug_meetings','Bugs','bugs','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('a16501d4-21de-c114-1877-57e7f608a9fa','projects_notes','Project','project','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('a17d5738-d683-f467-b93c-57e7f665f9af','eapm_created_by','Users','users','id','EAPM','eapm','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a3f70484-6cd4-8518-2102-57e7f626f816','opportunities_assigned_user','Users','users','id','Opportunities','opportunities','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a418a1c5-5073-f022-b2bd-57e7f6191d94','securitygroups_prospects','SecurityGroups','securitygroups','id','Prospects','prospects','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Prospects',0,0),('a421db11-c879-f8f2-902f-57e7f67e31d4','contacts_email_addresses','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Contacts',0,0),('a436b4ee-a4b9-c163-88be-57e7f6afcba8','jjwg_maps_assigned_user','Users','users','id','jjwg_Maps','jjwg_maps','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a43af13f-e69c-d29d-f885-57e7f60fa39e','favorites_assigned_user','Users','users','id','Favorites','favorites','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a4541b29-0be5-80fd-02ea-57e7f614f196','test1_firstmodule_notes','test1_FirstModule','test1_firstmodule','id','Notes','notes','id','test1_firstmodule_notes_c','test1_firstmodule_notestest1_firstmodule_ida','test1_firstmodule_notesnotes_idb','many-to-many',NULL,NULL,0,0),('a699c253-99c5-cc32-2a83-57e7f607b659','aod_index_modified_user','Users','users','id','AOD_Index','aod_index','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a6e6ffb6-f547-2cb3-474c-57e7f6d6a43e','aow_workflow_aow_processed','AOW_WorkFlow','aow_workflow','id','AOW_Processed','aow_processed','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a6e9c1c8-2631-849a-dfab-57e7f63a58f0','prospect_list_leads','ProspectLists','prospect_lists','id','Leads','leads','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Leads',0,0),('a77e44bf-4fcf-b270-bc76-57e7f67146b1','reminders_invitees_assigned_user','Users','users','id','Reminders_Invitees','reminders_invitees','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a7c8d3ad-9cca-ace7-220f-57e7f693efa3','cases_modified_user','Users','users','id','Cases','cases','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a968b296-f235-7a22-cc07-57e7f64d709f','securitygroups_campaigns','SecurityGroups','securitygroups','id','Campaigns','campaigns','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Campaigns',0,0),('a997afd3-9e71-1e22-18db-57e7f614a3d9','contacts_bugs','Contacts','contacts','id','Bugs','bugs','id','contacts_bugs','contact_id','bug_id','many-to-many',NULL,NULL,0,0),('a9a513a0-6257-1c72-8672-57e7f6266053','accounts_email_addresses_primary','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('a9bb392d-e247-0023-fcef-57e7f61decb8','am_projecttemplates_contacts_1','AM_ProjectTemplates','am_projecttemplates','id','Contacts','contacts','id','am_projecttemplates_contacts_1_c','am_projecttemplates_ida','contacts_idb','many-to-many',NULL,NULL,0,0),('a9bc6768-45d9-049c-9799-57e7f6554ca0','jjwg_areas_created_by','Users','users','id','jjwg_Areas','jjwg_areas','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a9c96e71-d817-6168-bb16-57e7f6b944a6','aos_pdf_templates_created_by','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aa12425d-9bc6-3300-3969-57e7f6b044ad','tasks_created_by','Users','users','id','Tasks','tasks','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ab07db02-d769-86bc-0c99-57e7f635705b','templatesectionline_modified_user','Users','users','id','TemplateSectionLine','templatesectionline','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ac5c7e1e-c835-9784-f7ba-57e7f63a4a24','projects_tasks','Project','project','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('aefad179-19db-6974-b181-57e7f6e620b3','prospects_email_addresses','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Prospects',0,0),('af028697-975d-e32d-ac99-57e7f6086f0f','securitygroups_opportunities','SecurityGroups','securitygroups','id','Opportunities','opportunities','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Opportunities',0,0),('af15fc3b-ea92-fd55-8669-57e7f6092f61','aos_contracts_created_by','Users','users','id','AOS_Contracts','aos_contracts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('af3922db-9ca7-abca-6be1-57e7f67bc2b2','securitygroups_jjwg_maps','SecurityGroups','securitygroups','id','jjwg_Maps','jjwg_maps','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Maps',0,0),('af94d2b7-d5e5-8749-d0f2-57e7f612256d','eapm_assigned_user','Users','users','id','EAPM','eapm','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b17a22b1-19df-2aa5-3258-57e7f65efa61','bug_calls','Bugs','bugs','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('b17d3143-87a5-3b3e-eaad-57e7f6249d8e','contacts_email_addresses_primary','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('b1e822c5-2a1e-57d0-47a7-57e7f6f24619','aod_index_created_by','Users','users','id','AOD_Index','aod_index','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b1f03c15-87e8-64c0-b2a2-57e7f60e6901','prospect_list_users','ProspectLists','prospect_lists','id','Users','users','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Users',0,0),('b21d930e-9602-bc78-6591-57e7f67b0ae8','inbound_email_created_by','Users','users','id','InboundEmail','inbound_email','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('b468f400-9b59-02c7-b5bd-57e7f616eded','campaign_accounts','Campaigns','campaigns','id','Accounts','accounts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b469e969-662d-c31b-cc86-57e7f6045bd5','jjwg_areas_assigned_user','Users','users','id','jjwg_Areas','jjwg_areas','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b47cf5d5-9620-c272-f533-57e7f6c81e08','aos_pdf_templates_assigned_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b4c3bdc8-f7ee-8cb7-23a5-57e7f64462ef','am_projecttemplates_users_1','AM_ProjectTemplates','am_projecttemplates','id','Users','users','id','am_projecttemplates_users_1_c','am_projecttemplates_ida','users_idb','many-to-many',NULL,NULL,0,0),('b5491d09-b4c7-3628-9349-57e7f64bbfe7','aos_line_item_groups_modified_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b59bb18c-9b4d-163a-03e6-57e7f6159df9','securitygroups_notes','SecurityGroups','securitygroups','id','Notes','notes','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Notes',0,0),('b6fea8c1-2707-554d-7a20-57e7f66d8a11','projects_meetings','Project','project','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('b7097325-5593-ef24-f14f-57e7f6a7f193','meetings_modified_user','Users','users','id','Meetings','meetings','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b71a90f3-c5fb-b00a-4ec2-57e7f6116943','member_accounts','Accounts','accounts','id','Accounts','accounts','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b9c0d81d-3005-5d93-dd5b-57e7f65f06c2','aos_contracts_assigned_user','Users','users','id','AOS_Contracts','aos_contracts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b9e3b510-32ef-b1a0-3a2f-57e7f61244b8','jjwg_Maps_accounts','jjwg_Maps','jjwg_Maps','parent_id','Accounts','accounts','id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('ba308d9c-7e82-2a85-4aea-57e7f6b3006a','aok_knowledge_base_categories_modified_user','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ba633a9c-f0a8-933f-6992-57e7f60a39fa','tasks_assigned_user','Users','users','id','Tasks','tasks','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bc60dbe8-2d62-3c92-0761-57e7f6080e7f','opportunity_calls','Opportunities','opportunities','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('bc6984e4-f300-b5a8-02b7-57e7f624edb2','prospects_email_addresses_primary','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('bc97dd70-25fc-8b38-845f-57e7f6e29836','aod_index_assigned_user','Users','users','id','AOD_Index','aod_index','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bca3ebc2-be79-b1dc-d023-57e7f698d3aa','prospect_list_accounts','ProspectLists','prospect_lists','id','Accounts','accounts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Accounts',0,0),('bcb40a7a-6f48-9b25-52d8-57e7f60dd931','fp_events_modified_user','Users','users','id','FP_events','fp_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bcbbf350-b300-5e32-9c86-57e7f6803c63','contacts_cases','Contacts','contacts','id','Cases','cases','id','contacts_cases','contact_id','case_id','many-to-many',NULL,NULL,0,0),('bf2360b1-dd04-d140-fc66-57e7f6e1a67d','campaign_contacts','Campaigns','campaigns','id','Contacts','contacts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('bf70f662-dac1-0c59-dc48-57e7f63fded2','am_tasktemplates_am_projecttemplates','AM_ProjectTemplates','am_projecttemplates','id','AM_TaskTemplates','am_tasktemplates','id','am_tasktemplates_am_projecttemplates_c','am_tasktemplates_am_projecttemplatesam_projecttemplates_ida','am_tasktemplates_am_projecttemplatesam_tasktemplates_idb','many-to-many',NULL,NULL,0,0),('bf751dd1-c21b-18e3-d99c-57e7f63a06b2','securitygroups_jjwg_areas','SecurityGroups','securitygroups','id','jjwg_Areas','jjwg_areas','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','jjwg_Areas',0,0),('bf752818-6e11-54ba-b3ba-57e7f6a7c5cc','inbound_email_modified_user_id','Users','users','id','InboundEmail','inbound_email','modified_user_id',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('bf824615-575b-c716-ee41-57e7f6492e07','securitygroups_aos_pdf_templates','SecurityGroups','securitygroups','id','AOS_PDF_Templates','aos_pdf_templates','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_PDF_Templates',0,0),('c0ed07b6-4e63-fc49-0a95-57e7f646a547','campaign_campaignlog','Campaigns','campaigns','id','CampaignLog','campaign_log','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c17c002f-25a1-80b9-417c-57e7f60bb78a','fp_event_locations_created_by','Users','users','id','FP_Event_Locations','fp_event_locations','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c1e86587-b327-8934-f0c7-57e7f6aff732','notes_modified_user','Users','users','id','Notes','notes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c2096b5e-6d5b-3e1b-2ce4-57e7f6d2c699','projects_calls','Project','project','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('c20d15cc-83b5-4b21-d716-57e7f6f224eb','aos_line_item_groups_created_by','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c20ddddc-fac2-4fec-4eb6-57e7f695e1e8','account_cases','Accounts','accounts','id','Cases','cases','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c21b05c1-cfc2-2401-2051-57e7f6507f2c','sub_product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Product_Categories','aos_product_categories','parent_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c3e2073a-9d9d-2560-cc4f-57e7f667ee21','calls_assigned_user','Users','users','id','Calls','calls','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c419609b-6408-df77-dee4-57e7f6e49cdf','bug_emails','Bugs','bugs','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('c4afc5de-b2e0-e408-0e84-57e7f67a557e','aok_knowledge_base_categories_created_by','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c4c6fdc7-9728-3d29-de60-57e7f68c0747','securitygroups_aos_contracts','SecurityGroups','securitygroups','id','AOS_Contracts','aos_contracts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','AOS_Contracts',0,0),('c4f3ace6-d0c4-529a-d3cf-57e7f60b1d58','jjwg_Maps_contacts','jjwg_Maps','jjwg_Maps','parent_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('c55904ae-8025-321a-029d-57e7f68e225d','leads_email_addresses','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Leads',0,0),('c5c7b694-f85b-83a1-aa17-57e7f6da606e','templatesectionline_created_by','Users','users','id','TemplateSectionLine','templatesectionline','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c6020014-9deb-a173-124f-57e7f655d169','spots_assigned_user','Users','users','id','Spots','spots','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c68dca2c-27ff-645a-37d2-57e7f6d24a7d','oauthkeys_modified_user','Users','users','id','OAuthKeys','oauthkeys','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c6a60fd1-95b8-faab-2a8a-57e7f644c3cb','fp_event_locations_fp_events_1','FP_Event_Locations','fp_event_locations','id','FP_events','fp_events','id','fp_event_locations_fp_events_1_c','fp_event_locations_fp_events_1fp_event_locations_ida','fp_event_locations_fp_events_1fp_events_idb','many-to-many',NULL,NULL,0,0),('c769c03c-bf52-713e-75f2-57e7f6a40497','fp_events_created_by','Users','users','id','FP_events','fp_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c76ac494-ac45-1453-3328-57e7f62f1601','prospect_tasks','Prospects','prospects','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('c7b556f0-5ff2-6499-cfbe-57e7f6130ba9','roles_users','Roles','roles','id','Users','users','id','roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('c956f809-d95f-8f16-848e-57e7f67cbf10','aor_fields_modified_user','Users','users','id','AOR_Fields','aor_fields','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ca269272-f90f-712e-1c80-57e7f6bc1827','campaign_leads','Campaigns','campaigns','id','Leads','leads','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ca773a54-7a26-d9c5-817d-57e7f62f4f4b','aos_contracts_documents','AOS_Contracts','aos_contracts','id','Documents','documents','id','aos_contracts_documents','aos_contracts_id','documents_id','many-to-many',NULL,NULL,0,0),('caad0f4b-5d86-aeec-3a37-57e7f68b72e6','securitygroups_tasks','SecurityGroups','securitygroups','id','Tasks','tasks','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Tasks',0,0),('cb218717-6081-825b-cf92-57e7f65a9e2f','contact_direct_reports','Contacts','contacts','id','Contacts','contacts','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ccb6b530-87e4-a70d-e148-57e7f6740da0','projects_emails','Project','project','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('ccb95795-5fe6-05bf-d24f-57e7f6690a4a','aos_line_item_groups_assigned_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ccbce1ba-5592-c871-2106-57e7f6120c40','account_tasks','Accounts','accounts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('cdd4ac6e-c163-876b-ee51-57e7f6a4991b','aop_case_events_modified_user','Users','users','id','AOP_Case_Events','aop_case_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cf16dcd0-9051-c2f6-9781-57e7f63d3e9c','saved_search_assigned_user','Users','users','id','SavedSearch','saved_search','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cf6d11c2-3c07-ed3e-f4cc-57e7f638697a','aos_contracts_tasks','AOS_Contracts','aos_contracts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('cf9f500e-ee44-f215-b39f-57e7f6b2caf0','jjwg_Maps_leads','jjwg_Maps','jjwg_Maps','parent_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('cfaeb704-3d9b-73f7-82f1-57e7f67ab250','notes_created_by','Users','users','id','Notes','notes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('cfc73b0a-833a-a933-44f8-57e7f6cf6e26','templatesectionline_assigned_user','Users','users','id','TemplateSectionLine','templatesectionline','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d026def5-8816-a571-5206-57e7f663f695','aok_knowledge_base_categories_assigned_user','Users','users','id','AOK_Knowledge_Base_Categories','aok_knowledge_base_categories','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d1f132a3-adec-8f5f-dcda-57e7f6f546b1','leads_modified_user','Users','users','id','Leads','leads','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d22f9c78-d5e4-67b6-c5b5-57e7f605aca4','bug_notes','Bugs','bugs','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('d25eb854-c998-6e35-7789-57e7f6452e95','projects_bugs','Project','project','id','Bugs','bugs','id','projects_bugs','project_id','bug_id','many-to-many',NULL,NULL,0,0),('d2832bf9-7520-6ae1-85bf-57e7f67cff89','fp_events_assigned_user','Users','users','id','FP_events','fp_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d2d2ec8d-6056-1e1b-7bbd-57e7f6af3c21','aos_product_categories_modified_user','Users','users','id','AOS_Product_Categories','aos_product_categories','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d363a91b-eeea-0623-d55a-57e7f60ce98a','contacts_users','Contacts','contacts','id','Users','users','id','contacts_users','contact_id','user_id','many-to-many',NULL,NULL,0,0),('d4bd7b4f-9f4e-30c4-3165-57e7f6e5d521','prospect_notes','Prospects','prospects','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('d4c9f843-ebb9-6e5c-4fdc-57e7f6302695','campaign_prospects','Campaigns','campaigns','id','Prospects','prospects','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d51b6fc4-0da0-23e6-c0e5-57e7f614e32c','opportunity_meetings','Opportunities','opportunities','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('d51c20eb-9d74-4656-48be-57e7f6efd55c','aos_quotes_aos_contracts','AOS_Quotes','aos_quotes','id','AOS_Contracts','aos_contracts','id','aos_quotes_os_contracts_c','aos_quotese81e_quotes_ida','aos_quotes4dc0ntracts_idb','many-to-many',NULL,NULL,0,0),('d78a1380-5a10-aca5-633a-57e7f65614d5','jjwg_address_cache_modified_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d7c3e9d6-8fcd-4e02-b3e5-57e7f6440d26','projects_project_tasks','Project','project','id','ProjectTask','project_task','project_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d7c8b563-a5f6-9b33-cc2d-57e7f6a453ed','groups_aos_product_quotes','AOS_Line_Item_Groups','aos_line_item_groups','id','AOS_Products_Quotes','aos_products_quotes','group_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d7d6f8f5-f136-1f3e-ba09-57e7f620d486','account_notes','Accounts','accounts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('d8417c1b-896e-3dc1-9c33-57e7f6875b77','oauthkeys_created_by','Users','users','id','OAuthKeys','oauthkeys','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('da598562-3705-15de-8dd1-57e7f60a4e3a','contact_leads','Contacts','contacts','id','Leads','leads','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('da7f77a7-fe28-47cf-538c-57e7f695f485','aos_contracts_notes','AOS_Contracts','aos_contracts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('daa5e24d-64e7-a2c8-bbf3-57e7f604b417','jjwg_Maps_opportunities','jjwg_Maps','jjwg_Maps','parent_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('daee25bf-4870-0762-8180-57e7f6e31661','tasks_notes','Tasks','tasks','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dd0f678e-4bcd-14fd-7ea8-57e7f6da3dba','aop_case_events_created_by','Users','users','id','AOP_Case_Events','aop_case_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dd19d604-96da-81e0-5874-57e7f6d74059','securitygroups_fp_events','SecurityGroups','securitygroups','id','FP_events','fp_events','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','FP_events',0,0),('dd71aaa4-1d9b-8618-208c-57e7f6a63f2d','projects_cases','Project','project','id','Cases','cases','id','projects_cases','project_id','case_id','many-to-many',NULL,NULL,0,0),('dfd3d5a1-e741-b62a-958d-57e7f60fa495','prospect_meetings','Prospects','prospects','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('dfd50a4f-f9d6-d652-db2d-57e7f6713307','campaign_opportunities','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dfeea5cc-d71a-92e0-0758-57e7f63c1527','aos_product_categories_created_by','Users','users','id','AOS_Product_Categories','aos_product_categories','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e025a6d6-23cd-54fb-12f0-57e7f677fe32','leads_created_by','Users','users','id','Leads','leads','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e0308ccb-9ad7-f4dc-a368-57e7f6f2a28a','aos_quotes_aos_invoices','AOS_Quotes','aos_quotes','id','AOS_Invoices','aos_invoices','id','aos_quotes_aos_invoices_c','aos_quotes77d9_quotes_ida','aos_quotes6b83nvoices_idb','many-to-many',NULL,NULL,0,0),('e26ec0fa-c221-89c3-b61f-57e7f65a60b3','projects_assigned_user','Users','users','id','Project','project','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e285c872-46c8-d438-c9d1-57e7f6e851f5','opportunity_tasks','Opportunities','opportunities','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('e2a6a50e-43d2-7950-b487-57e7f6a5f408','oauthkeys_assigned_user','Users','users','id','OAuthKeys','oauthkeys','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e2cd0a18-55a1-6af6-dfbc-57e7f614d2e6','jjwg_address_cache_created_by','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e3334063-f68b-9db3-d6ae-57e7f640875a','test1_firstmodule_modified_user','Users','users','id','test1_FirstModule','test1_firstmodule','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e522cecb-f5f9-da65-b52d-57e7f6e2b527','aos_contracts_meetings','AOS_Contracts','aos_contracts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('e5338eb5-2233-0843-a789-57e7f606973d','account_meetings','Accounts','accounts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('e54adca1-93f4-ffbd-8083-57e7f66d2704','contact_notes','Contacts','contacts','id','Notes','notes','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e55c3cf2-39b0-1a5c-44db-57e7f69e4bc2','jjwg_Maps_cases','jjwg_Maps','jjwg_Maps','parent_id','Cases','cases','id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('e7c04924-52a4-e8c9-c2df-57e7f6d2e6d3','bugs_release','Releases','releases','id','Bugs','bugs','found_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e7f63742-d424-ff79-6fee-57e7f6fa403c','calls_modified_user','Users','users','id','Calls','calls','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e80c48e4-8746-ac7e-c0a5-57e7f6780bed','aop_case_events_assigned_user','Users','users','id','AOP_Case_Events','aop_case_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e8169f8d-5490-2e09-e9f5-57e7f65e0bf4','projects_accounts','Project','project','id','Accounts','accounts','id','projects_accounts','project_id','account_id','many-to-many',NULL,NULL,0,0),('e965ae9d-d970-ff2f-e843-57e7f62c30ec','spots_modified_user','Users','users','id','Spots','spots','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e979adb6-6fb8-b017-8145-57e7f6af88e4','aok_knowledgebase_modified_user','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ea81c88d-c179-0aad-261b-57e7f6b36dcc','campaign_email_marketing','Campaigns','campaigns','id','EmailMarketing','email_marketing','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ea927d6e-96f9-99b7-3b4f-57e7f631cb36','aos_product_categories_assigned_user','Users','users','id','AOS_Product_Categories','aos_product_categories','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eac12d39-e046-bef2-8733-57e7f6bd243e','leads_assigned_user','Users','users','id','Leads','leads','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ead8f551-cd31-6166-226c-57e7f60acbde','aos_quotes_project','AOS_Quotes','aos_quotes','id','Project','project','id','aos_quotes_project_c','aos_quotes1112_quotes_ida','aos_quotes7207project_idb','many-to-many',NULL,NULL,0,0),('eb6b037b-4cd8-36c0-f475-57e7f6845273','cases_assigned_user','Users','users','id','Cases','cases','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ec03b2d0-222e-9ccc-53f8-57e7f6f7ec2d','emails_bugs_rel','Emails','emails','id','Bugs','bugs','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Bugs',0,0),('ed340224-b548-3b6f-7579-57e7f6273835','prospect_calls','Prospects','prospects','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('ed716289-60cf-ece0-a289-57e7f6c4c8a6','jjwg_address_cache_assigned_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed75f195-ae8f-77aa-371c-57e7f6fd879a','projects_modified_user','Users','users','id','Project','project','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed8e3cd4-0b1d-de47-599a-57e7f60634ed','opportunity_notes','Opportunities','opportunities','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('edad3913-aecc-064e-a0dd-57e7f6e2f341','test1_firstmodule_created_by','Users','users','id','test1_FirstModule','test1_firstmodule','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ee0822af-486c-3d15-0cae-57e7f6413f34','aos_quotes_modified_user','Users','users','id','AOS_Quotes','aos_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('eface1e8-250a-3f3c-9161-57e7f6a461bb','consumer_tokens','OAuthKeys','oauth_consumer','id','OAuthTokens','oauth_tokens','consumer',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f02e7da6-7db0-a9ff-af6d-57e7f6fcc7c8','account_calls','Accounts','accounts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('f035a5c8-2f32-77a0-6eb6-57e7f6cc5d56','aos_contracts_calls','AOS_Contracts','aos_contracts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOS_Contracts',0,0),('f05c9153-cb44-67f7-bec9-57e7f6fa42b1','jjwg_Maps_projects','jjwg_Maps','jjwg_Maps','parent_id','Project','project','id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('f0c6fadb-b1ce-47ab-4d63-57e7f65a3159','fp_event_locations_modified_user','Users','users','id','FP_Event_Locations','fp_event_locations','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f1980183-7f4d-678b-1e0c-57e7f69175bf','opportunity_leads','Opportunities','opportunities','id','Leads','leads','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f2ad7809-7767-6f19-0f52-57e7f645df36','contact_tasks','Contacts','contacts','id','Tasks','tasks','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f2b15851-8fa0-d879-6d27-57e7f6a74460','cases_aop_case_events','Cases','cases','id','AOP_Case_Events','aop_case_events','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f2f61256-004a-a657-bdc1-57e7f6c824a6','calls_created_by','Users','users','id','Calls','calls','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f328ac3b-4e67-2052-9ac5-57e7f6ab498c','projects_contacts','Project','project','id','Contacts','contacts','id','projects_contacts','project_id','contact_id','many-to-many',NULL,NULL,0,0),('f4380f3a-e4cb-a78f-8147-57e7f6ddd5e5','securitygroups_test1_firstmodule','SecurityGroups','securitygroups','id','test1_FirstModule','test1_firstmodule','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','test1_FirstModule',0,0),('f9db0f51-b795-86f0-155a-57e7f68c4476','aok_knowledgebase_assigned_user','Users','users','id','AOK_KnowledgeBase','aok_knowledgebase','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `popup` tinyint(1) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timer_popup` varchar(32) DEFAULT NULL,
  `timer_email` varchar(32) DEFAULT NULL,
  `related_event_module` varchar(32) DEFAULT NULL,
  `related_event_module_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_name` (`name`),
  KEY `idx_reminder_deleted` (`deleted`),
  KEY `idx_reminder_related_event_module` (`related_event_module`),
  KEY `idx_reminder_related_event_module_id` (`related_event_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
INSERT INTO `reminders` VALUES ('4f95d402-ff7a-f6e8-5a3b-57c6d262acc2','','2016-08-31 12:51:58','2016-08-31 12:51:58','1','1',NULL,0,NULL,1,0,0,'300','3600','Calls','ae5509a4-673e-97af-23d8-57c6d23f02ed');
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders_invitees`
--

DROP TABLE IF EXISTS `reminders_invitees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders_invitees` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reminder_id` char(36) NOT NULL,
  `related_invitee_module` varchar(32) DEFAULT NULL,
  `related_invitee_module_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_invitee_name` (`name`),
  KEY `idx_reminder_invitee_assigned_user_id` (`assigned_user_id`),
  KEY `idx_reminder_invitee_reminder_id` (`reminder_id`),
  KEY `idx_reminder_invitee_related_invitee_module` (`related_invitee_module`),
  KEY `idx_reminder_invitee_related_invitee_module_id` (`related_invitee_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders_invitees`
--

LOCK TABLES `reminders_invitees` WRITE;
/*!40000 ALTER TABLE `reminders_invitees` DISABLE KEYS */;
INSERT INTO `reminders_invitees` VALUES ('5de61cde-57fb-2a0b-5487-57c6d2cf6b6f','','2016-08-31 12:51:58','2016-08-31 12:51:58','1','1',NULL,0,NULL,'4f95d402-ff7a-f6e8-5a3b-57c6d262acc2','Users','1');
/*!40000 ALTER TABLE `reminders_invitees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_modules`
--

DROP TABLE IF EXISTS `roles_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_modules`
--

LOCK TABLES `roles_modules` WRITE;
/*!40000 ALTER TABLE `roles_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_search`
--

LOCK TABLES `saved_search` WRITE;
/*!40000 ALTER TABLE `saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulers`
--

DROP TABLE IF EXISTS `schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulers`
--

LOCK TABLES `schedulers` WRITE;
/*!40000 ALTER TABLE `schedulers` DISABLE KEYS */;
INSERT INTO `schedulers` VALUES ('11fc1ecf-7846-4eaa-7765-57c5d4cfbc7a',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Run Report Generation Scheduled Tasks','function::aorRunScheduledReports','2015-01-01 09:30:01',NULL,'*::*::*::*::*',NULL,NULL,'2016-09-08 17:22:33','Active',1),('20a4afe3-0d2d-578d-2fad-57c5d4e81783',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Prune Tracker Tables','function::trimTracker','2015-01-01 18:30:01',NULL,'0::2::1::*::*',NULL,NULL,NULL,'Active',1),('2e8cc0ef-4a51-b231-f62d-57c5d40daa53',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Check Inbound Mailboxes','function::pollMonitoredInboxesAOP','2015-01-01 10:30:01',NULL,'*::*::*::*::*',NULL,NULL,'2016-09-08 17:22:33','Active',0),('4cec4cf7-160b-8108-7211-57c5d4bd4822',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Run Nightly Process Bounced Campaign Emails','function::pollMonitoredInboxesForBouncedCampaignEmails','2015-01-01 18:00:01',NULL,'0::2-6::*::*::*',NULL,NULL,'2016-09-08 17:20:05','Active',1),('59ca8955-638c-ee5f-4d98-57c5d4731294',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Run Nightly Mass Email Campaigns','function::runMassEmailCampaign','2015-01-01 11:30:01',NULL,'0::2-6::*::*::*',NULL,NULL,'2016-09-08 17:20:05','Active',1),('672ceb09-2465-8453-2ff4-57c5d4a05a11',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Prune Database on 1st of Month','function::pruneDatabase','2015-01-01 15:30:01',NULL,'0::4::1::*::*',NULL,NULL,NULL,'Inactive',0),('74fd5e24-903e-178d-fac2-57c5d4a32597',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Perform Lucene Index','function::aodIndexUnindexed','2015-01-01 15:30:01',NULL,'0::0::*::*::*',NULL,NULL,NULL,'Active',0),('78b4f742-ae54-58dd-e198-57d194104249',0,'2016-09-08 16:38:34','2016-09-08 17:22:06','1','1','TestSheduledTask','url::http://suite/cron2.php','2016-09-07 15:45:00','2016-09-09 18:30:00','*/1::*::*::*::*',NULL,NULL,'2016-09-08 17:22:33','Active',0),('8257a5da-ee2c-89ad-a25e-57c5d4862a49',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Optimise AOD Index','function::aodOptimiseIndex','2015-01-01 07:30:01',NULL,'0::*/3::*::*::*',NULL,NULL,NULL,'Active',0),('90321d4d-b73b-09b7-048b-57c5d4cdd788',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Run Email Reminder Notifications','function::sendEmailReminders','2015-01-01 10:00:01',NULL,'*::*::*::*::*',NULL,NULL,'2016-09-08 17:22:33','Active',0),('9d9916b8-9b78-55e0-9317-57c5d4987827',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Clean Jobs Queue','function::cleanJobQueue','2015-01-01 09:45:01',NULL,'0::5::*::*::*',NULL,NULL,NULL,'Active',0),('ab2b8500-ec3c-121f-11e5-57c5d442af37',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Removal of documents from filesystem','function::removeDocumentsFromFS','2015-01-01 13:30:01',NULL,'0::3::1::*::*',NULL,NULL,NULL,'Active',0),('b884c6b9-a6be-49e7-f981-57c5d4153e34',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Prune SuiteCRM Feed Tables','function::trimSugarFeeds','2015-01-01 12:45:01',NULL,'0::2::1::*::*',NULL,NULL,NULL,'Active',1),('f10f781d-75ff-bb7b-b77d-57c5d4d47cde',0,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','1','Process Workflow Tasks','function::processAOW_Workflow','2015-01-01 17:30:01',NULL,'*::*::*::*::*',NULL,NULL,'2016-09-08 17:22:33','Active',1);
/*!40000 ALTER TABLE `schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups`
--

DROP TABLE IF EXISTS `securitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups`
--

LOCK TABLES `securitygroups` WRITE;
/*!40000 ALTER TABLE `securitygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_acl_roles`
--

DROP TABLE IF EXISTS `securitygroups_acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_acl_roles`
--

LOCK TABLES `securitygroups_acl_roles` WRITE;
/*!40000 ALTER TABLE `securitygroups_acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_audit`
--

DROP TABLE IF EXISTS `securitygroups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_audit`
--

LOCK TABLES `securitygroups_audit` WRITE;
/*!40000 ALTER TABLE `securitygroups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_default`
--

DROP TABLE IF EXISTS `securitygroups_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_default`
--

LOCK TABLES `securitygroups_default` WRITE;
/*!40000 ALTER TABLE `securitygroups_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_records`
--

DROP TABLE IF EXISTS `securitygroups_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_records` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `record_id` char(36) DEFAULT NULL,
  `module` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_records`
--

LOCK TABLES `securitygroups_records` WRITE;
/*!40000 ALTER TABLE `securitygroups_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_users`
--

DROP TABLE IF EXISTS `securitygroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_users` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `securitygroup_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `securitygroups_users_idxa` (`securitygroup_id`),
  KEY `securitygroups_users_idxb` (`user_id`),
  KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_users`
--

LOCK TABLES `securitygroups_users` WRITE;
/*!40000 ALTER TABLE `securitygroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spots`
--

DROP TABLE IF EXISTS `spots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spots` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `config` longtext,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spots`
--

LOCK TABLES `spots` WRITE;
/*!40000 ALTER TABLE `spots` DISABLE KEYS */;
/*!40000 ALTER TABLE `spots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spots_audit`
--

DROP TABLE IF EXISTS `spots_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spots_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_spots_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spots_audit`
--

LOCK TABLES `spots_audit` WRITE;
/*!40000 ALTER TABLE `spots_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `spots_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugarfeed`
--

DROP TABLE IF EXISTS `sugarfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugarfeed`
--

LOCK TABLES `sugarfeed` WRITE;
/*!40000 ALTER TABLE `sugarfeed` DISABLE KEYS */;
INSERT INTO `sugarfeed` VALUES ('126dda1d-7993-84ac-ffc2-57d98eab40fe','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:6d5e487b-8de7-f3c9-c771-57d98e91ccf4:фывы фыввйц]','2016-09-14 17:54:31','2016-09-20 22:35:48','1','1',NULL,1,'1','Leads','6d5e487b-8de7-f3c9-c771-57d98e91ccf4',NULL,NULL),('4d18d342-a7f0-e9a4-7ad3-57cc799631b1','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_CONTACT} [Contacts:8c309073-96e9-ba90-79b2-57cc79f1a6f3:Карл Густав Маннергейм]','2016-09-04 19:45:01','2016-09-04 19:45:01','1','1',NULL,0,'1','Contacts','8c309073-96e9-ba90-79b2-57cc79f1a6f3',NULL,NULL),('5df8c7bb-fee8-2cf0-b8b8-57d2e712218e','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_CONTACT} [Contacts:bf592272-f781-794c-d5b5-57d2e75d0cc4:Отто Бисмарк]','2016-09-09 16:45:09','2016-09-09 16:45:09','1','1',NULL,0,'1','Contacts','bf592272-f781-794c-d5b5-57d2e75d0cc4',NULL,NULL),('689879f4-656f-1e82-a475-57d564e8f4b6','<b>{this.CREATED_BY}</b> asdsad','2016-09-11 14:06:33','2016-09-11 14:06:33','1','1',NULL,0,'1','UserFeed','1',NULL,NULL),('68fee0aa-815f-b4ae-a18f-57ceef723aff','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:23b3056d-bbe2-ebcc-85af-57ceef165e36:Шарль де Голль]','2016-09-06 16:33:25','2016-09-06 16:33:25','1','1',NULL,0,'1','Leads','23b3056d-bbe2-ebcc-85af-57ceef165e36',NULL,NULL),('6d44c4bc-872e-4471-bec9-57eab78821e6','<b>{this.CREATED_BY}</b> фывфыв','2016-09-27 18:16:34','2016-09-30 09:51:23','1','1',NULL,1,'1','UserFeed','1',NULL,NULL),('74bafd26-05d2-dbfd-a42e-57e28fc7d574','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:7105014d-8dfe-e904-e3ba-57e28f3cf84c:John Mertic]','2016-09-21 13:49:03','2016-09-21 13:57:23','1','89433a57-572b-0ba3-ed4d-57d991245a69',NULL,1,NULL,'Leads','7105014d-8dfe-e904-e3ba-57e28f3cf84c',NULL,NULL),('79d7572d-0d23-2f36-e6dd-57e28f9555cb','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:157a630c-659e-f02a-32a2-57e28f9a6679:John Mertic]','2016-09-21 13:47:17','2016-09-21 13:57:17','1','89433a57-572b-0ba3-ed4d-57d991245a69',NULL,1,NULL,'Leads','157a630c-659e-f02a-32a2-57e28f9a6679',NULL,NULL),('83edeafa-3e11-80c9-3332-57d424f0b13a','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_CONTACT} [Contacts:cfe14298-3ef7-f8ce-e0b8-57d4247a557c:Франклин Рузвельт]','2016-09-10 15:19:06','2016-09-10 15:19:06','1','1',NULL,0,'1','Contacts','cfe14298-3ef7-f8ce-e0b8-57d4247a557c',NULL,NULL),('89b856c2-ffa3-064f-c844-57d8546062a7','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_FIRST} [test1_FirstModule:7e89598f-1da0-d83f-e47b-57d854fcd064:Feed Test 2]','2016-09-13 19:33:15','2016-09-13 19:33:15','1','1',NULL,0,'1','test1_FirstModule','7e89598f-1da0-d83f-e47b-57d854fcd064',NULL,NULL),('a69e47e9-ec7c-59e2-2151-57e2915b4bb9','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:a2e4f8e5-faa8-12e4-dc70-57e29184ab84:Фердинанд Фош]','2016-09-21 13:55:23','2016-09-21 13:55:23','89433a57-572b-0ba3-ed4d-57d991245a69','89433a57-572b-0ba3-ed4d-57d991245a69',NULL,0,NULL,'Leads','a2e4f8e5-faa8-12e4-dc70-57e29184ab84',NULL,NULL),('ae676ca9-4d9b-589f-1e7b-57cc050964ea','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_OPPORTUNITY} [Opportunities:2cd7cb8a-e9b9-761d-df86-57cc0563d21a:Deal1] {SugarFeed.WITH} [Accounts:60fe5f52-f51a-12ce-c534-57c6d0e7541e:Vasya] {SugarFeed.FOR} $100.00','2016-09-04 11:28:14','2016-09-04 11:28:14','1','1',NULL,0,'1','Opportunities','2cd7cb8a-e9b9-761d-df86-57cc0563d21a',NULL,NULL),('b2468b61-cb40-b725-da07-57d85243a44a','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_ACCOUNT} [Accounts:7c4b49df-70cd-c7de-b590-57d8525c48f7:Lockheed Martin Corporation]','2016-09-13 19:24:15','2016-09-13 19:24:15','1','1',NULL,0,'1','Accounts','7c4b49df-70cd-c7de-b590-57d8525c48f7',NULL,NULL),('b4f6aa1d-56ff-93df-c514-57eab77a08a0','<b>{this.CREATED_BY}</b> вфывфыв','2016-09-27 18:17:40','2016-09-30 09:51:06','1','1',NULL,1,'1','UserFeed','1',NULL,NULL),('d039fabe-a2bb-7d1f-a06b-57e54837c99c','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_CONTACT} [Contacts:8008bb98-86ab-d06b-46a5-57e5487865cd:Пауль фон Гинденбург]','2016-09-23 15:21:11','2016-09-23 15:21:11','1','1',NULL,0,'1','Contacts','8008bb98-86ab-d06b-46a5-57e5487865cd',NULL,NULL),('f074ea73-34d1-8ec0-59d9-57e7f45e017e','<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_CONTACT} [Contacts:89febbda-b24a-38cb-68e5-57e7f4a09252:Бернард Лоу Монтгомери]','2016-09-25 15:59:55','2016-09-25 15:59:55','1','1',NULL,0,'1','Contacts','89febbda-b24a-38cb-68e5-57e7f4a09252',NULL,NULL);
/*!40000 ALTER TABLE `sugarfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES ('a60baf26-7877-ac5f-469f-57d188d4584b','Задача1','2016-09-08 15:50:07','2016-09-08 16:13:28','1','1','описаниеее задачи',0,'1','Not Started',0,'2016-09-08 16:30:00',0,'2016-09-08 16:15:00','Accounts','8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','8c309073-96e9-ba90-79b2-57cc79f1a6f3','High');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatesectionline`
--

DROP TABLE IF EXISTS `templatesectionline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatesectionline` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `grp` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatesectionline`
--

LOCK TABLES `templatesectionline` WRITE;
/*!40000 ALTER TABLE `templatesectionline` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatesectionline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatesectionline_audit`
--

DROP TABLE IF EXISTS `templatesectionline_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatesectionline_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_templatesectionline_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatesectionline_audit`
--

LOCK TABLES `templatesectionline_audit` WRITE;
/*!40000 ALTER TABLE `templatesectionline_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatesectionline_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1_firstmodule`
--

DROP TABLE IF EXISTS `test1_firstmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_firstmodule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `monthly_limit` int(255) DEFAULT '7',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1_firstmodule`
--

LOCK TABLES `test1_firstmodule` WRITE;
/*!40000 ALTER TABLE `test1_firstmodule` DISABLE KEYS */;
INSERT INTO `test1_firstmodule` VALUES ('2393261f-c4e5-8d3d-548c-57c69f158b4e','Запись1','2016-08-31 09:13:18','2016-08-31 09:13:18','1','1','ыфвафывафыва фывфыв. фывфывф фыафыафыв',0,'1',7),('7e89598f-1da0-d83f-e47b-57d854fcd064','Feed Test 2','2016-09-13 19:33:15','2016-09-13 19:33:15','1','1','First module node who was created for testing sugarfeed',0,'1',7);
/*!40000 ALTER TABLE `test1_firstmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1_firstmodule_audit`
--

DROP TABLE IF EXISTS `test1_firstmodule_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_firstmodule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_test1_firstmodule_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1_firstmodule_audit`
--

LOCK TABLES `test1_firstmodule_audit` WRITE;
/*!40000 ALTER TABLE `test1_firstmodule_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `test1_firstmodule_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1_firstmodule_notes_c`
--

DROP TABLE IF EXISTS `test1_firstmodule_notes_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1_firstmodule_notes_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `test1_firstmodule_notestest1_firstmodule_ida` varchar(36) DEFAULT NULL,
  `test1_firstmodule_notesnotes_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `test1_firstmodule_notes_ida1` (`test1_firstmodule_notestest1_firstmodule_ida`),
  KEY `test1_firstmodule_notes_alt` (`test1_firstmodule_notesnotes_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1_firstmodule_notes_c`
--

LOCK TABLES `test1_firstmodule_notes_c` WRITE;
/*!40000 ALTER TABLE `test1_firstmodule_notes_c` DISABLE KEYS */;
INSERT INTO `test1_firstmodule_notes_c` VALUES ('50f3491f-78a9-0bb4-1431-57d1639992fb','2016-09-08 13:09:20',0,'2393261f-c4e5-8d3d-548c-57c69f158b4e','4d21c04d-04c4-05bb-640d-57d163b6005f');
/*!40000 ALTER TABLE `test1_firstmodule_notes_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
INSERT INTO `tracker` VALUES (16,'8014f2c1-b1b6-de45-fadf-57c7ea076761','1','FP_events','1f665e48-b48e-8f6f-7ea9-57c7ea10a262','Event1','2016-09-01 08:45:28','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(100,'5efd24a6-70b3-5d05-e3f7-57d19476a2f3','1','Tasks','a60baf26-7877-ac5f-469f-57d188d4584b','Задача1','2016-09-08 16:39:23','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(139,'b6f48f41-a9f0-f173-9999-57d19e48dbcd','1','Schedulers','78b4f742-ae54-58dd-e198-57d194104249','TestSheduledTask','2016-09-08 17:22:09','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(276,'cce4c912-ab26-9959-c8a4-57d7307061bc','1','Notes','4d21c04d-04c4-05bb-640d-57d163b6005f','Заметка1','2016-09-12 22:48:08','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(280,'74a6ff2e-3fc2-6893-2327-57d7cdf9e2d3','1','test1_FirstModule','2393261f-c4e5-8d3d-548c-57c69f158b4e','Запись1','2016-09-13 09:57:58','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(282,'b887a958-956d-d153-ea24-57d7ce947a99','1','Calls','ae5509a4-673e-97af-23d8-57c6d23f02ed','Call','2016-09-13 10:01:36','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(288,'35e546e8-8a32-1fc2-c148-57d85452776f','1','test1_FirstModule','7e89598f-1da0-d83f-e47b-57d854fcd064','Feed Test 2','2016-09-13 19:33:19','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(294,'d2cb58ef-52fb-121d-2bf1-57d992e2ab4f','1','Leads','6d5e487b-8de7-f3c9-c771-57d98e91ccf4','Г-н. фывы фыввйц','2016-09-14 18:09:49','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(298,'4daa1b08-fffc-e85a-045f-57de84c56e4b','1','Leads','cee0dcf1-7ab8-11e6-a47c-3085a90d4e29','Г-н. vasaaaaa eqwexz','2016-09-18 12:12:24','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(300,'e55c3a04-e4a3-29be-557f-57e1b74bf34e','1','Users','89433a57-572b-0ba3-ed4d-57d991245a69','random guest','2016-09-20 22:24:07','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(301,'7aa998bf-2158-2f8d-e818-57e1c0194612','89433a57-572b-0ba3-ed4d-57d991245a69','Users','89433a57-572b-0ba3-ed4d-57d991245a69','random guest','2016-09-20 23:04:08','editview','evace5tc6hvkgajikgqg733413',1,0),(302,'113ea26a-671c-37e4-4a17-57e291a3a1c4','1','Leads','a2e4f8e5-faa8-12e4-dc70-57e29184ab84','Фердинанд Фош','2016-09-21 13:57:35','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(319,'d58c24db-92c3-df4b-4c0a-57e29cfc0dbf','89433a57-572b-0ba3-ed4d-57d991245a69','Contacts','8c309073-96e9-ba90-79b2-57cc79f1a6f3','Г-н. Карл Густав Маннергейм','2016-09-21 14:43:09','detailview','ep7r2g527pee0kt48dnfjdn4t4',1,0),(354,'14ea5c65-4974-4929-2676-57e3d3cf5685','1','Contacts','bf592272-f781-794c-d5b5-57d2e75d0cc4','Г-н. Отто фон Бисмарк','2016-09-22 12:48:55','detailview','fib2ji779irs1k0ubd8coh3cb1',0,0),(388,'a875584a-d54e-03b5-5be6-57e4465d125e','1','Users','1','Administrator','2016-09-22 21:00:24','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(405,'3de08def-1237-bc09-0e53-57e460f07c8c','1','OutboundEmailAccounts','32ad8337-0c9c-4282-5377-57c5d4b9bb49','system','2016-09-22 22:49:40','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(406,'cdb0d270-67cb-1a65-d69c-57e4609b08c2','1','OutboundEmailAccounts','ee020fe0-d54e-4d85-101e-57c5d4891e0f','system','2016-09-22 22:50:14','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(408,'c7c74ac7-29ab-1bf2-05f7-57e46d51cb11','1','Accounts','60fe5f52-f51a-12ce-c534-57c6d0e7541e','CGimpel','2016-09-22 23:47:15','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(409,'75670380-3e1c-c02d-e9f5-57e470ef3290','1','jjwg_Address_Cache','9dea557d-7cd1-219d-feb9-57e460a03038','улица, Бетесда, Мэриленд, 645789, США','2016-09-22 23:59:53','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(477,'1dad0eaf-98b3-910b-5cec-57e521f5a33b','1','Contacts','8c309073-96e9-ba90-79b2-57cc79f1a6f3','Г-н. Карл Густав Маннергейм','2016-09-23 12:35:15','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(480,'741f1449-19b5-810a-cc84-57e536152a1e','1','jjwg_Maps','484da321-542b-1f40-38b8-57cd733c3a91','Карта 1','2016-09-23 14:04:11','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(487,'d407afd2-374f-c671-50c0-57e5493e6b78','1','Leads','23b3056d-bbe2-ebcc-85af-57ceef165e36','Г-н. Шарль де Голль','2016-09-23 15:23:47','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(493,'cb20fa4c-a59b-0ff5-0533-57e550a02065','1','AOR_Reports','9b3aa569-3016-7fd1-e6e7-57e543e13023','Отчет1','2016-09-23 15:54:11','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(495,'f0eb4077-e4d5-a0e0-e178-57e5516809c9','1','Opportunities','2cd7cb8a-e9b9-761d-df86-57cc0563d21a','Deal1','2016-09-23 15:59:15','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(500,'9b9b6629-5c55-6acf-2932-57e7f2d85f5e','1','Contacts','8008bb98-86ab-d06b-46a5-57e5487865cd','Г-н. Пауль фон Гинденбург','2016-09-25 15:52:07','detailview','fib2ji779irs1k0ubd8coh3cb1',1,0),(506,'c66b129f-8fd8-2adf-c3f2-57ea414ef0f4','1','Emails','e29df778-3641-19e5-06e3-57d6f49fdf3f','test msg','2016-09-27 09:52:37','detailview','rq641bo42brkcdjf5li24s1b10',1,0),(507,'7f0fb22f-5c6b-60b2-266e-57ea42a8a63c','1','Contacts','bf592272-f781-794c-d5b5-57d2e75d0cc4','Г-н. Отто фон Бисмарк','2016-09-27 09:57:45','detailview','rq641bo42brkcdjf5li24s1b10',1,0),(517,'a2cda0e7-620b-29a7-937f-57ea7ffd2106','1','Accounts','8029cf32-1c4d-efdf-9f2f-57cc7b064b8e','Sigizmund Inc.','2016-09-27 14:17:13','detailview','rq641bo42brkcdjf5li24s1b10',1,0),(519,'48063d53-53e0-983c-9d4b-57ec073b4f56','1','Contacts','cfe14298-3ef7-f8ce-e0b8-57d4247a557c','Г-н. Франклин Рузвельт','2016-09-28 18:08:02','detailview','rq641bo42brkcdjf5li24s1b10',1,0),(520,'176ffa12-f814-b6d6-2dd1-57ec2e5df1b1','1','Accounts','7c4b49df-70cd-c7de-b590-57d8525c48f7','Lockheed Martin Corporation','2016-09-28 20:56:48','detailview','rq641bo42brkcdjf5li24s1b10',1,0),(524,'395638b8-0b03-dbf4-02fc-57ee3af20c86','1','Contacts','89febbda-b24a-38cb-68e5-57e7f4a09252','Г-н. Бернард Лоу Монтгомери','2016-09-30 10:11:33','editview','rq641bo42brkcdjf5li24s1b10',1,0);
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_history`
--

DROP TABLE IF EXISTS `upgrade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_history`
--

LOCK TABLES `upgrade_history` WRITE;
/*!40000 ALTER TABLE `upgrade_history` DISABLE KEYS */;
INSERT INTO `upgrade_history` VALUES ('82ac92c7-74b3-f1e0-476a-57c5d9058151','upload/upgrades/langpack/ru.zip','a2be7f5c5ec9c56b08d70bd13ed100ef','langpack','installed','7.7.1.1','Russian (Russia)','Translation: www.crowdin.com/project/suitecrmtranslations','ru_RU','YTozOntzOjg6Im1hbmlmZXN0IjthOjk6e3M6NDoibmFtZSI7czoxNjoiUnVzc2lhbiAoUnVzc2lhKSI7czoxMToiZGVzY3JpcHRpb24iO3M6NTc6IlRyYW5zbGF0aW9uOiB3d3cuY3Jvd2Rpbi5jb20vcHJvamVjdC9zdWl0ZWNybXRyYW5zbGF0aW9ucyI7czo0OiJ0eXBlIjtzOjg6ImxhbmdwYWNrIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtzOjM6IlllcyI7czoyNToiYWNjZXB0YWJsZV9zdWdhcl92ZXJzaW9ucyI7YTowOnt9czoyNDoiYWNjZXB0YWJsZV9zdWdhcl9mbGF2b3JzIjthOjE6e2k6MDtzOjI6IkNFIjt9czo2OiJhdXRob3IiO3M6MTg6IlN1aXRlQ1JNIENvbW11bml0eSI7czo3OiJ2ZXJzaW9uIjtzOjc6IjcuNy4xLjEiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjEwOiIyMDE2LTA4LTExIjt9czoxMToiaW5zdGFsbGRlZnMiO2E6Mzp7czoyOiJpZCI7czo1OiJydV9SVSI7czo5OiJpbWFnZV9kaXIiO3M6MTc6IjxiYXNlcGF0aD4vaW1hZ2VzIjtzOjQ6ImNvcHkiO2E6Mzp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjE4OiI8YmFzZXBhdGg+L2luY2x1ZGUiO3M6MjoidG8iO3M6NzoiaW5jbHVkZSI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czoxODoiPGJhc2VwYXRoPi9tb2R1bGVzIjtzOjI6InRvIjtzOjc6Im1vZHVsZXMiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6MTg6IjxiYXNlcGF0aD4vaW5zdGFsbCI7czoyOiJ0byI7czo3OiJpbnN0YWxsIjt9fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==','2016-08-30 19:07:57',1),('88c8863d-b433-17ff-9a5a-57c6a818c0d9','upload/upgrades/module/test_pocket2016_08_31_125042.zip','be9adf7b0328da2bf346a26b66a3787d','module','installed','1472637041','test_pocket','this is testing of creating modules','test_pocket','YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6NToidGVzdDEiO3M6NjoiYXV0aG9yIjtzOjQ6IkNhbG0iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjM1OiJ0aGlzIGlzIHRlc3Rpbmcgb2YgY3JlYXRpbmcgbW9kdWxlcyI7czo0OiJpY29uIjtzOjA6IiI7czoxNjoiaXNfdW5pbnN0YWxsYWJsZSI7YjoxO3M6NDoibmFtZSI7czoxMToidGVzdF9wb2NrZXQiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjE5OiIyMDE2LTA4LTMxIDA5OjUwOjQxIjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjc6InZlcnNpb24iO2k6MTQ3MjYzNzA0MTtzOjEzOiJyZW1vdmVfdGFibGVzIjtzOjY6InByb21wdCI7fXM6MTE6Imluc3RhbGxkZWZzIjthOjk6e3M6MjoiaWQiO3M6MTE6InRlc3RfcG9ja2V0IjtzOjU6ImJlYW5zIjthOjE6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjE3OiJ0ZXN0MV9GaXJzdE1vZHVsZSI7czo1OiJjbGFzcyI7czoxNzoidGVzdDFfRmlyc3RNb2R1bGUiO3M6NDoicGF0aCI7czo0NzoibW9kdWxlcy90ZXN0MV9GaXJzdE1vZHVsZS90ZXN0MV9GaXJzdE1vZHVsZS5waHAiO3M6MzoidGFiIjtiOjE7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo5NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL3Rlc3QxX2ZpcnN0bW9kdWxlX25vdGVzX3Rlc3QxX0ZpcnN0TW9kdWxlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTc6InRlc3QxX0ZpcnN0TW9kdWxlIjt9fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6MTp7aTowO2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6ODc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy90ZXN0MV9maXJzdG1vZHVsZV9ub3Rlc01ldGFEYXRhLnBocCI7fX1zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo0OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy90ZXN0MV9GaXJzdE1vZHVsZSI7czoyOiJ0byI7czoyNToibW9kdWxlcy90ZXN0MV9GaXJzdE1vZHVsZSI7fX1zOjg6Imxhbmd1YWdlIjthOjY6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Ob3Rlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6Ik5vdGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxO2E6Mzp7czo0OiJmcm9tIjtzOjU2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL05vdGVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTm90ZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfUlUiO31pOjI7YTozOntzOjQ6ImZyb20iO3M6Njg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvdGVzdDFfRmlyc3RNb2R1bGUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNzoidGVzdDFfRmlyc3RNb2R1bGUiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjM7YTozOntzOjQ6ImZyb20iO3M6Njg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvdGVzdDFfRmlyc3RNb2R1bGUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNzoidGVzdDFfRmlyc3RNb2R1bGUiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfUlUiO31pOjQ7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL2FwcGxpY2F0aW9uL2VuX3VzLmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjU7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL2FwcGxpY2F0aW9uL3J1X1JVLmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfUlUiO319czo3OiJ2YXJkZWZzIjthOjI6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo3OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3Rlc3QxX2ZpcnN0bW9kdWxlX25vdGVzX05vdGVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTm90ZXMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6OTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy90ZXN0MV9maXJzdG1vZHVsZV9ub3Rlc190ZXN0MV9GaXJzdE1vZHVsZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE3OiJ0ZXN0MV9GaXJzdE1vZHVsZSI7fX1zOjEyOiJsYXlvdXRmaWVsZHMiO2E6MTp7aTowO2E6MTp7czoxNzoiYWRkaXRpb25hbF9maWVsZHMiO2E6MTp7czo1OiJOb3RlcyI7czoyODoidGVzdDFfZmlyc3Rtb2R1bGVfbm90ZXNfbmFtZSI7fX19fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9','2016-08-31 09:50:41',1);
/*!40000 ALTER TABLE `upgrade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES ('104f6a2c-27cd-7b5a-5392-57e1b8cc7bee','Home2_OPPORTUNITY',0,'2016-09-20 22:28:23','2016-09-20 22:28:23','89433a57-572b-0ba3-ed4d-57d991245a69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1582825d-5488-27c2-c7f4-57c5d5fddb74','Home2_SUGARFEED',0,'2016-08-30 18:51:06','2016-08-30 18:51:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('1cd30760-fe55-816e-a952-57cc7b6b5e98','Campaigns2_CAMPAIGN',0,'2016-09-04 19:52:14','2016-09-04 19:52:14','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('21cb6def-7777-4270-b05c-57c9bfe8087c','Users2_USER',0,'2016-09-02 18:05:24','2016-09-02 18:05:24','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('21d0ec9c-fec6-bd98-d310-57e1b7247728','ETag',0,'2016-09-20 22:24:00','2016-09-20 22:28:06','89433a57-572b-0ba3-ed4d-57d991245a69','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mjt9'),('245c6fd0-4668-23de-9693-57e1b8645e1f','Home2_ACCOUNT',0,'2016-09-20 22:28:23','2016-09-20 22:28:23','89433a57-572b-0ba3-ed4d-57d991245a69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('267db5b2-f0ea-2d32-060c-57c7ead0ad17','FP_events2_FP_EVENTS',0,'2016-09-01 08:44:38','2016-09-01 08:44:38','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2d9aabb2-506a-dbbe-4046-57c69fe60f37','test1_FirstModule2_TEST1_FIRSTMODULE',0,'2016-08-31 09:12:12','2016-08-31 09:12:12','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('2ec401b7-64fc-2e4a-33b9-57e7d1fdc356','Home2_DOCUMENT',0,'2016-09-25 13:32:44','2016-09-25 13:32:44','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('358aa54d-869d-02aa-e66c-57c6a7f09ca6','AOR_Reports2_AOR_REPORT',0,'2016-08-31 09:46:14','2016-08-31 09:46:14','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('444e0399-e4b6-121e-2af0-57e5341a4060','Spots2_SPOTS',0,'2016-09-23 13:58:07','2016-09-23 13:58:07','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('471bbdd8-d068-9c08-a8a2-57c9bffb27fc','Employees2_EMPLOYEE',0,'2016-09-02 18:05:13','2016-09-02 18:05:13','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('49715c96-8694-550f-8ca0-57e1b802875d','Home2_LEAD',0,'2016-09-20 22:28:23','2016-09-20 22:28:23','89433a57-572b-0ba3-ed4d-57d991245a69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('49b586d3-0933-afb8-9c02-57d16274b1a7','Notes2_NOTE',0,'2016-09-08 13:07:59','2016-09-08 13:07:59','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('4b4c9352-bb07-4283-c879-57c69feece7c','Contacts2_CONTACT',0,'2016-08-31 09:14:11','2016-09-25 16:06:16','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czo0OiJuYW1lIjtzOjk6InNvcnRPcmRlciI7czozOiJBU0MiO319'),('59400e4b-e42b-8d43-c2a6-57d18e579208','Schedulers2_SCHEDULER',0,'2016-09-08 16:15:08','2016-09-08 16:15:08','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('5da63882-faa4-b09a-e5b2-57ceef753b5a','Leads2_LEAD',0,'2016-09-06 16:30:53','2016-09-06 16:30:53','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('606bc3bc-93d4-2b17-ff1f-57e1b89e2441','Home2_SUGARFEED',0,'2016-09-20 22:28:23','2016-09-20 22:28:23','89433a57-572b-0ba3-ed4d-57d991245a69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('6ae2512d-b99c-72e0-060f-57e45f9ac4c4','OutboundEmailAccounts2_OUTBOUNDEMAILACCOUNTS',0,'2016-09-22 22:49:21','2016-09-22 22:49:21','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('770a0683-5c56-6cbe-570a-57c5d53f21c4','Home2_LEAD',0,'2016-08-30 18:51:06','2016-08-30 18:51:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('7cf3aa2d-7fa4-2752-ca44-57c5da249adf','Emails',0,'2016-08-30 19:11:02','2016-08-30 19:13:19','1','YToxOntzOjExOiJmb2N1c0ZvbGRlciI7czoxMDU6ImE6Mjp7czo0OiJpZUlkIjtzOjM2OiI5ZDIzOTVmMi04ODBhLWRkMWEtYTNhYy01N2M1ZGExMjYyZjMiO3M6NjoiZm9sZGVyIjtzOjIzOiJTVUdBUi7QnNC+0Y8g0L/QvtGH0YLQsCI7fSI7fQ=='),('7d60667e-483b-2e98-d31e-57e534625746','FP_Event_Locations2_FP_EVENT_LOCATIONS',0,'2016-09-23 13:58:11','2016-09-23 13:58:11','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('8a23584f-ff66-6efe-23a8-57e1b8f01732','Home',0,'2016-09-20 22:28:23','2016-09-20 22:28:23','89433a57-572b-0ba3-ed4d-57d991245a69','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjkzMTVmNmU0LTVjNGYtM2NmNy0yZDdlLTU3ZTFiODFjYWU4NiI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjlkZmFlZmMzLWFmM2UtOGEyMS0yYzZkLTU3ZTFiODVlZWMxYyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImE5YzhhMDEzLTljNDUtMTkyOC00OTIwLTU3ZTFiODMwMTRjOCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImI1NjZkYTJlLTRlODctN2JlYy0wZGQxLTU3ZTFiODM1M2NkYiI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMTJjYmE3NzctNWNhZi1iNDQwLWE3MjItNTdlMWI4Y2NhZjZkIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMjEwZmFhYTEtNDUyNC1jNjNmLWRhOTMtNTdlMWI4ZmU5NGEyIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI5ZGZhZWZjMy1hZjNlLThhMjEtMmM2ZC01N2UxYjg1ZWVjMWMiO2k6MTtzOjM2OiJhOWM4YTAxMy05YzQ1LTE5MjgtNDkyMC01N2UxYjgzMDE0YzgiO2k6MjtzOjM2OiJiNTY2ZGEyZS00ZTg3LTdiZWMtMGRkMS01N2UxYjgzNTNjZGIiO2k6MztzOjM2OiIxMmNiYTc3Ny01Y2FmLWI0NDAtYTcyMi01N2UxYjhjY2FmNmQiO2k6NDtzOjM2OiIyMTBmYWFhMS00NTI0LWM2M2YtZGE5My01N2UxYjhmZTk0YTIiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjkzMTVmNmU0LTVjNGYtM2NmNy0yZDdlLTU3ZTFiODFjYWU4NiI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('8f4a3363-822b-bb4e-07c9-57c7e94e034f','SugarFeed2_SUGARFEED',0,'2016-09-01 08:41:50','2016-09-01 08:41:50','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('90567d78-ea7e-8a39-08d2-57d991826f2a','SecurityGroups2_SECURITYGROUP',0,'2016-09-14 18:04:35','2016-09-14 18:04:35','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('996b6e96-6f69-df5c-1cf3-57cd73c0e394','jjwg_Maps2_JJWG_MAPS',0,'2016-09-05 13:30:43','2016-09-05 13:30:43','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a411878e-fe7e-4bc9-3d73-57e470589bc4','jjwg_Markers2_JJWG_MARKERS',0,'2016-09-22 23:59:20','2016-09-22 23:59:20','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a6b8ef58-d714-7c0c-03bc-57e551432398','AOK_Knowledge_Base_Categories2_AOK_KNOWLEDGE_BASE_',0,'2016-09-23 15:58:50','2016-09-23 15:58:50','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a6ecfe40-984c-f89f-9417-57cc04dc033e','AOK_KnowledgeBase2_AOK_KNOWLEDGEBASE',0,'2016-09-04 11:26:28','2016-09-04 11:26:28','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('a9ca6337-9e1c-d4a2-88b8-57e1b9ef9d4b','Leads2_LEAD',0,'2016-09-20 22:34:13','2016-09-20 22:34:13','89433a57-572b-0ba3-ed4d-57d991245a69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('ae4845b6-40ea-dc1f-df24-57c5d50bead7','Home',0,'2016-08-30 18:51:06','2016-09-25 16:20:12','1','YToyOntzOjg6ImRhc2hsZXRzIjthOjE4OntzOjM2OiI3ZGEwYTJkOC04MDg3LTc5MWEtODVlZi01N2M1ZDU5ZjUxMTYiO2E6NDp7czo5OiJjbGFzc05hbWUiO3M6MTY6IlN1Z2FyRmVlZERhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjk6IlN1Z2FyRmVlZCI7czoxMToiZm9yY2VDb2x1bW4iO2k6MTtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NjQ6Im1vZHVsZXMvU3VnYXJGZWVkL0Rhc2hsZXRzL1N1Z2FyRmVlZERhc2hsZXQvU3VnYXJGZWVkRGFzaGxldC5waHAiO31zOjM2OiI3ZTY0ZWI0MS1kMDczLWU2NjktYzZlMy01N2M1ZDU1Zjk3NzEiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTQ6Ik15Q2FsbHNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo1OiJDYWxscyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NTY6Im1vZHVsZXMvQ2FsbHMvRGFzaGxldHMvTXlDYWxsc0Rhc2hsZXQvTXlDYWxsc0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX1zOjM2OiI3ZjZiYjA4ZS1jYzM3LTg4NzgtZTYwZS01N2M1ZDVhNmM4YjQiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MTc6Ik15TWVldGluZ3NEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo4OiJNZWV0aW5ncyI7czoxMToiZm9yY2VDb2x1bW4iO2k6MDtzOjEyOiJmaWxlTG9jYXRpb24iO3M6NjU6Im1vZHVsZXMvTWVldGluZ3MvRGFzaGxldHMvTXlNZWV0aW5nc0Rhc2hsZXQvTXlNZWV0aW5nc0Rhc2hsZXQucGhwIjtzOjc6Im9wdGlvbnMiO2E6MDp7fX1zOjM2OiI3ZmVjYWRjNi1mNjAwLTU5NjktNTZjMC01N2M1ZDVkZTQ4ODQiO2E6NTp7czo5OiJjbGFzc05hbWUiO3M6MjI6Ik15T3Bwb3J0dW5pdGllc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo4MDoibW9kdWxlcy9PcHBvcnR1bml0aWVzL0Rhc2hsZXRzL015T3Bwb3J0dW5pdGllc0Rhc2hsZXQvTXlPcHBvcnR1bml0aWVzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjgwYWExYTMyLTA1MzUtZjU3ZC05OGE1LTU3YzVkNTdkNGQ4MCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlBY2NvdW50c0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9BY2NvdW50cy9EYXNobGV0cy9NeUFjY291bnRzRGFzaGxldC9NeUFjY291bnRzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjgxNTExYjhiLWVkZGItOTcwMy1mODc3LTU3YzVkNWMwNDk3MCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlMZWFkc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkxlYWRzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9MZWFkcy9EYXNobGV0cy9NeUxlYWRzRGFzaGxldC9NeUxlYWRzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjgzYzk5NjBkLTJhNDctZDliYy1jN2NkLTU3ZTdkMTllMGMxNyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjc6Im9wdGlvbnMiO2E6MDp7fXM6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO31zOjM2OiJiMGY1NWVmYS1jY2FiLTk1ZmUtZTBkNy01N2U3ZDFiZDk3NmQiO2E6NDp7czo5OiJjbGFzc05hbWUiO3M6MTc6Ik15TWVldGluZ3NEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo4OiJNZWV0aW5ncyI7czo3OiJvcHRpb25zIjthOjA6e31zOjEyOiJmaWxlTG9jYXRpb24iO3M6NjU6Im1vZHVsZXMvTWVldGluZ3MvRGFzaGxldHMvTXlNZWV0aW5nc0Rhc2hsZXQvTXlNZWV0aW5nc0Rhc2hsZXQucGhwIjt9czozNjoiOTY4NDc5ZWMtMDFiNi1iZDc2LTI1ZjUtNTdlN2QxNDQ5MzliIjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjIyOiJNeU9wcG9ydHVuaXRpZXNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo3OiJvcHRpb25zIjthOjA6e31zOjEyOiJmaWxlTG9jYXRpb24iO3M6ODA6Im1vZHVsZXMvT3Bwb3J0dW5pdGllcy9EYXNobGV0cy9NeU9wcG9ydHVuaXRpZXNEYXNobGV0L015T3Bwb3J0dW5pdGllc0Rhc2hsZXQucGhwIjt9czozNjoiM2E2OThlNjctZTczMi1lMmI2LTFjOGYtNTdlN2QxNmRiY2QyIjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6Nzoib3B0aW9ucyI7YTowOnt9czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7fXM6MzY6IjRiZjM0MDY0LTY5MzUtMjNlOS1kOTkzLTU3ZTdkMWM3NTczOSI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlBY2NvdW50c0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjc6Im9wdGlvbnMiO2E6MDp7fXM6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9BY2NvdW50cy9EYXNobGV0cy9NeUFjY291bnRzRGFzaGxldC9NeUFjY291bnRzRGFzaGxldC5waHAiO31zOjM2OiI5NjU1ZTQzOC1hM2IwLTIyOTgtMzAxZC01N2U3ZGFkYjA0YWQiO2E6NDp7czo5OiJjbGFzc05hbWUiO3M6MjQ6IkNvbnRhY3RzQnlDb3VudHJ5RGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6Nzoib3B0aW9ucyI7YToyOntzOjU6InRpdGxlIjtzOjM2OiLQmtC+0L3RgtCw0LrRgtGLINC/0L4g0YHRgtGA0LDQvdCw0LwiO3M6MTE6ImF1dG9SZWZyZXNoIjtzOjI6Ii0xIjt9czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgyOiJjdXN0b20vbW9kdWxlcy9DaGFydHMvRGFzaGxldHMvQ291bnRyeUNvbnRhY3RzRGFzaGxldC9Db250YWN0c0J5Q291bnRyeURhc2hsZXQucGhwIjt9czozNjoiM2U0ZTQ4NWEtODU0My0zNjM0LWYxZmUtNTdlN2U0OWE2YjYxIjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUNhbGxzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiQ2FsbHMiO3M6Nzoib3B0aW9ucyI7YTowOnt9czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0NhbGxzL0Rhc2hsZXRzL015Q2FsbHNEYXNobGV0L015Q2FsbHNEYXNobGV0LnBocCI7fXM6MzY6IjM5MjliYzNhLWUyMmEtYTRhMi1mNDA4LTU3ZTdlNDA0ZjlhNyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6Nzoib3B0aW9ucyI7YTowOnt9czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7fXM6MzY6ImQyMjE1NzI2LWEyZDItNzFiNS02YjAyLTU3ZTdlNDgyMjQyZSI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjc6Im9wdGlvbnMiO2E6MDp7fXM6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO31zOjM2OiIyZGEwNDUwYS0xNzE5LTQwYjMtN2ZkZS01N2U3ZTRlMmQ1ZTIiO2E6NDp7czo5OiJjbGFzc05hbWUiO3M6MTc6Ik15QWNjb3VudHNEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo4OiJBY2NvdW50cyI7czo3OiJvcHRpb25zIjthOjA6e31zOjEyOiJmaWxlTG9jYXRpb24iO3M6NjU6Im1vZHVsZXMvQWNjb3VudHMvRGFzaGxldHMvTXlBY2NvdW50c0Rhc2hsZXQvTXlBY2NvdW50c0Rhc2hsZXQucGhwIjt9czozNjoiMTVkZjA2Y2YtN2FmNy00ZjFmLTQ1Y2MtNTdlN2U0MTg5ZmY1IjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6Nzoib3B0aW9ucyI7YTowOnt9czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7fXM6MzY6IjZlZGMzMWViLWU5NjQtOTAxYS02ZDg1LTU3ZTdlYjQ2NjA3NCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoyNDoiQ29udGFjdHNCeUNvdW50cnlEYXNobGV0IjtzOjY6Im1vZHVsZSI7czo4OiJDb250YWN0cyI7czo3OiJvcHRpb25zIjthOjI6e3M6NToidGl0bGUiO3M6MzY6ItCa0L7QvdGC0LDQutGC0Ysg0L/QviDRgdGC0YDQsNC90LDQvCI7czoxMToiYXV0b1JlZnJlc2giO3M6MjoiLTEiO31zOjEyOiJmaWxlTG9jYXRpb24iO3M6ODI6ImN1c3RvbS9tb2R1bGVzL0NoYXJ0cy9EYXNobGV0cy9Db3VudHJ5Q29udGFjdHNEYXNobGV0L0NvbnRhY3RzQnlDb3VudHJ5RGFzaGxldC5waHAiO319czo1OiJwYWdlcyI7YToyOntpOjA7YTozOntzOjc6ImNvbHVtbnMiO2E6Mjp7aTowO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI2MCUiO3M6ODoiZGFzaGxldHMiO2E6NTp7aTowO3M6MzY6IjNlNGU0ODVhLTg1NDMtMzYzNC1mMWZlLTU3ZTdlNDlhNmI2MSI7aToxO3M6MzY6IjM5MjliYzNhLWUyMmEtYTRhMi1mNDA4LTU3ZTdlNDA0ZjlhNyI7aToyO3M6MzY6ImQyMjE1NzI2LWEyZDItNzFiNS02YjAyLTU3ZTdlNDgyMjQyZSI7aTozO3M6MzY6IjJkYTA0NTBhLTE3MTktNDBiMy03ZmRlLTU3ZTdlNGUyZDVlMiI7aTo0O3M6MzY6IjE1ZGYwNmNmLTdhZjctNGYxZi00NWNjLTU3ZTdlNDE4OWZmNSI7fX1pOjE7YToyOntzOjU6IndpZHRoIjtzOjM6IjQwJSI7czo4OiJkYXNobGV0cyI7YToxOntpOjA7czozNjoiN2RhMGEyZDgtODA4Ny03OTFhLTg1ZWYtNTdjNWQ1OWY1MTE2Ijt9fX1zOjEwOiJudW1Db2x1bW5zIjtzOjE6IjMiO3M6MTQ6InBhZ2VUaXRsZUxhYmVsIjtzOjIwOiJMQkxfSE9NRV9QQUdFXzFfTkFNRSI7fWk6MTthOjM6e3M6NzoiY29sdW1ucyI7YToxOntpOjA7YToyOntzOjg6ImRhc2hsZXRzIjthOjI6e2k6MDtzOjM2OiJhY2ExY2ZkNS01ZmQ5LWI0YzUtMTM1YS01N2U3Zjk0YjNlODQiO2k6MTtzOjM2OiI2ZWRjMzFlYi1lOTY0LTkwMWEtNmQ4NS01N2U3ZWI0NjYwNzQiO31zOjU6IndpZHRoIjtzOjQ6IjEwMCUiO319czo5OiJwYWdlVGl0bGUiO3M6MjA6ItCh0YLQsNGC0LjRgdGC0LjQutCwIjtzOjEwOiJudW1Db2x1bW5zIjtzOjE6IjEiO319fQ=='),('b05cd5c2-cab3-dbe6-438e-57e29cc15366','Contacts2_CONTACT',0,'2016-09-21 14:42:41','2016-09-21 14:42:41','89433a57-572b-0ba3-ed4d-57d991245a69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('b3e2b466-30dd-c9bb-48d6-57cc0420b242','Opportunities2_OPPORTUNITY',0,'2016-09-04 11:26:31','2016-09-04 11:26:31','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('b440aa97-8bd2-e528-fd3e-57d18aec159b','Tasks2_TASK',0,'2016-09-08 15:59:34','2016-09-08 15:59:34','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('c0013165-45ba-8571-d42a-57c5d546a738','Home2_CALL',0,'2016-08-30 18:51:06','2016-08-30 18:51:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('c1b93d6b-45ef-d394-07cc-57c6d6d1b4b7','Calls',0,'2016-08-31 13:08:51','2016-08-31 13:08:51','1','YToxOntzOjE0OiJzdWJwYW5lbExheW91dCI7YTo1OntpOjA7czo1OiJ1c2VycyI7aToxO3M6ODoiY29udGFjdHMiO2k6MjtzOjU6ImxlYWRzIjtpOjM7czo3OiJoaXN0b3J5IjtpOjQ7czoxNDoic2VjdXJpdHlncm91cHMiO319'),('c7bfdf14-5497-b45b-eae0-57e470c47186','jjwg_Address_Cache2_JJWG_ADDRESS_CACHE',0,'2016-09-22 23:59:16','2016-09-22 23:59:16','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('c9d64266-df5e-7ac4-d1c6-57e1b82be871','Home2_CALL',0,'2016-09-20 22:28:23','2016-09-20 22:28:23','89433a57-572b-0ba3-ed4d-57d991245a69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('cde0358e-49b8-e43b-9aa5-57c5d5b6156f','Home2_MEETING',0,'2016-08-30 18:51:06','2016-08-30 18:51:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('d55d2baf-63bd-eb71-65a4-57e7d9baad04','Home2_CONTACT',0,'2016-09-25 14:05:41','2016-09-25 14:05:41','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('dcf80452-9300-a63f-634d-57e4708f866f','jjwg_Areas2_JJWG_AREAS',0,'2016-09-22 23:59:12','2016-09-22 23:59:12','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('ddcd53a8-23d6-1a5a-c8bd-57c5d5fba474','Home2_OPPORTUNITY',0,'2016-08-30 18:51:06','2016-08-30 18:51:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('e11daa34-4b6e-c17f-2924-57d43b771ee7','ACLRoles2_ACLROLE',0,'2016-09-10 16:58:05','2016-09-10 16:58:05','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('e244b9b8-36fa-3101-8285-57c5d48d47ec','global',0,'2016-08-30 18:46:06','2016-09-28 20:54:25','1','YTozNzp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6ImUyMDA4ZDA5LWE5MWItMTMzYi1lMDM1LTU3YzVkNGEwNTU0NSI7czo4OiJ0aW1lem9uZSI7czoxMzoiRXVyb3BlL01vc2NvdyI7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjA6IiI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjEzOiJyZW1pbmRlcl90aW1lIjtpOjE4MDA7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTozNjAwO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMSI7czoyMjoiZW1haWxfcmVtaW5kZXJfY2hlY2tlZCI7TjtzOjI6InV0IjtzOjE6IjEiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6MTU6Im1haWxfc210cHNlcnZlciI7czoxNDoic210cC5nbWFpbC5jb20iO3M6MTM6Im1haWxfc210cHBvcnQiO3M6MzoiNTg3IjtzOjEzOiJtYWlsX3NtdHB1c2VyIjtzOjIwOiJsYTJzdGFsa2VyQGdtYWlsLmNvbSI7czoxMzoibWFpbF9zbXRwcGFzcyI7czoxMDoiMjk2ZTJjYzQ3MSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjE6IjEiO3M6MTI6Im1haWxfc210cHNzbCI7aToxO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czoyMToiZGVmYXVsdF9lbWFpbF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjY6ItCS0YHQtSI7czoxMDoiRW1wbG95ZWVzUSI7YTozOntzOjY6Im1vZHVsZSI7czo5OiJFbXBsb3llZXMiO3M6NjoiYWN0aW9uIjtzOjU6ImluZGV4IjtzOjU6InF1ZXJ5IjtzOjQ6InRydWUiO31zOjE5OiJMZWFkc19MRUFEX09SREVSX0JZIjtzOjIzOiJsZWFkcy5kYXRlX2VudGVyZWQgZGVzYyI7czoxMDoiamp3Z19NYXBzUSI7YToxMDp7czo2OiJtb2R1bGUiO3M6OToiamp3Z19NYXBzIjtzOjY6ImFjdGlvbiI7czo1OiJpbmRleCI7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjtzOjU6InF1ZXJ5IjtzOjQ6InRydWUiO3M6Nzoib3JkZXJCeSI7czowOiIiO3M6OToic29ydE9yZGVyIjtzOjA6IiI7czoxMDoibmFtZV9iYXNpYyI7czowOiIiO3M6MTc6Im1vZHVsZV90eXBlX2Jhc2ljIjthOjE6e2k6MDtzOjg6IkFjY291bnRzIjt9czoyMzoiY3VycmVudF91c2VyX29ubHlfYmFzaWMiO3M6MToiMCI7czo2OiJidXR0b24iO3M6MTA6ItCd0LDQudGC0LgiO31zOjEyOiJ1c2VyUHJpdkd1aWQiO3M6MzY6IjcwNzlhODNkLWRjMWEtNTIwYy05YzM1LTU3ZTdkYWQzYTQ2ZSI7czo5OiJDb250YWN0c1EiO2E6MjM6e3M6NjoibW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjY6ImFjdGlvbiI7czo1OiJpbmRleCI7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxNToiYWR2YW5jZWRfc2VhcmNoIjtzOjU6InF1ZXJ5IjtzOjQ6InRydWUiO3M6MTk6ImZpcnN0X25hbWVfYWR2YW5jZWQiO3M6MDoiIjtzOjE0OiJlbWFpbF9hZHZhbmNlZCI7czowOiIiO3M6MTQ6InBob25lX2FkdmFuY2VkIjtzOjA6IiI7czoxODoibGFzdF9uYW1lX2FkdmFuY2VkIjtzOjA6IiI7czoyMzoiYWRkcmVzc19zdHJlZXRfYWR2YW5jZWQiO3M6MDoiIjtzOjIxOiJhZGRyZXNzX2NpdHlfYWR2YW5jZWQiO3M6MDoiIjtzOjIxOiJhY2NvdW50X25hbWVfYWR2YW5jZWQiO3M6MDoiIjtzOjIyOiJhZGRyZXNzX3N0YXRlX2FkdmFuY2VkIjtzOjA6IiI7czoyNzoiYWRkcmVzc19wb3N0YWxjb2RlX2FkdmFuY2VkIjtzOjA6IiI7czozMjoicHJpbWFyeV9hZGRyZXNzX2NvdW50cnlfYWR2YW5jZWQiO3M6MDoiIjtzOjk6InNob3dTU0RJViI7czoyOiJubyI7czoxNzoic2F2ZWRfc2VhcmNoX25hbWUiO3M6MDoiIjtzOjEzOiJzZWFyY2hfbW9kdWxlIjtzOjA6IiI7czoxOToic2F2ZWRfc2VhcmNoX2FjdGlvbiI7czowOiIiO3M6MTQ6ImRpc3BsYXlDb2x1bW5zIjtzOjc3OiJOQU1FfEFDQ09VTlRfTkFNRXxFTUFJTDF8UEhPTkVfV09SS3xBU1NJR05FRF9VU0VSX05BTUV8QklSVEhEQVRFfERBVEVfRU5URVJFRCI7czo4OiJoaWRlVGFicyI7czozMjU6IkRFUEFSVE1FTlR8RE9fTk9UX0NBTEx8UEhPTkVfSE9NRXxQSE9ORV9NT0JJTEV8UEhPTkVfT1RIRVJ8UEhPTkVfRkFYfEVNQUlMMnxFTUFJTF9PUFRfT1VUfFBSSU1BUllfQUREUkVTU19TVFJFRVR8UFJJTUFSWV9BRERSRVNTX0NJVFl8UFJJTUFSWV9BRERSRVNTX1NUQVRFfFBSSU1BUllfQUREUkVTU19QT1NUQUxDT0RFfEFMVF9BRERSRVNTX0NPVU5UUll8QUxUX0FERFJFU1NfU1RSRUVUfEFMVF9BRERSRVNTX0NJVFl8QUxUX0FERFJFU1NfU1RBVEV8QUxUX0FERFJFU1NfUE9TVEFMQ09ERXxDUkVBVEVEX0JZX05BTUV8TU9ESUZJRURfQllfTkFNRXxTWU5DX0NPTlRBQ1QiO3M6Nzoib3JkZXJCeSI7czo0OiJOQU1FIjtzOjk6InNvcnRPcmRlciI7czozOiJBU0MiO3M6NjoiYnV0dG9uIjtzOjEwOiLQndCw0LnRgtC4Ijt9czoyNToiUmVsZWFzZXNfUkVMRUFTRV9PUkRFUl9CWSI7czoxMDoibGlzdF9vcmRlciI7fQ=='),('e6e6e96b-951f-b68a-f08c-57d9914fe066','global',0,'2016-09-14 18:04:13','2016-09-20 23:21:03','89433a57-572b-0ba3-ed4d-57d991245a69','YTozOTp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjA6IiI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjEzOiJyZW1pbmRlcl90aW1lIjtpOjE4MDA7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTozNjAwO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMSI7czoyMjoiZW1haWxfcmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjg6InRpbWV6b25lIjtzOjEzOiJFdXJvcGUvTW9zY293IjtzOjI6InV0IjtzOjE6IjEiO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo0OiJmZG93IjtzOjE6IjAiO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoxNToibWFpbF9zbXRwc2VydmVyIjtzOjE0OiJzbXRwLmdtYWlsLmNvbSI7czoxMzoibWFpbF9zbXRwdXNlciI7czowOiIiO3M6MTM6Im1haWxfc210cHBhc3MiO3M6MDoiIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6ImU2NjBiMjg0LWM5MGYtYTRiNy1hODNmLTU3ZDk5MWVkNzA5NCI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6Njoi0JLRgdC1Ijt9'),('eb9eb0fe-0b5d-24cc-6e0d-57c5d5464ab6','Home2_ACCOUNT',0,'2016-08-30 18:51:06','2016-08-30 18:51:06','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('eedb1070-cdd9-501e-7c75-57c5d47feed9','ETag',0,'2016-08-30 18:46:06','2016-08-31 09:50:41','1','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mzt9'),('f01363ce-432a-3e6c-8ce1-57c6cfed07fd','Accounts2_ACCOUNT',0,'2016-08-31 12:38:40','2016-08-31 12:38:40','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('f3a746ad-805f-6949-ae2c-57e1b8dcda91','Home2_MEETING',0,'2016-09-20 22:28:23','2016-09-20 22:28:23','89433a57-572b-0ba3-ed4d-57d991245a69','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('f3ccc38d-fcab-d112-736e-57e7f5d49825','Contacts',0,'2016-09-25 16:06:16','2016-09-25 16:06:16','1','YToxOntzOjIyOiJMaXN0Vmlld0Rpc3BsYXlDb2x1bW5zIjthOjA6e319');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','admin','$1$Oy/.91/.$hksllb.t2jM4EsnKYH0ja1',0,NULL,NULL,1,NULL,'Administrator',1,0,1,NULL,'2016-08-30 18:46:06','2016-08-30 18:46:06','1','','Administrator',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,1,'Active',NULL,NULL,'',0),('89433a57-572b-0ba3-ed4d-57d991245a69','guest','$1$OH4.9o..$ReSDeJOl3lfdBnDFcSLjc0',0,'2016-09-20 22:27:00',NULL,1,'random','guest',0,0,1,NULL,'2016-09-14 18:04:13','2016-09-20 22:28:06','89433a57-572b-0ba3-ed4d-57d991245a69','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,0,0,0,'Active',NULL,NULL,'',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_feeds`
--

DROP TABLE IF EXISTS `users_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_feeds`
--

LOCK TABLES `users_feeds` WRITE;
/*!40000 ALTER TABLE `users_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_last_import`
--

DROP TABLE IF EXISTS `users_last_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_last_import`
--

LOCK TABLES `users_last_import` WRITE;
/*!40000 ALTER TABLE `users_last_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_last_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_password_link`
--

DROP TABLE IF EXISTS `users_password_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_password_link`
--

LOCK TABLES `users_password_link` WRITE;
/*!40000 ALTER TABLE `users_password_link` DISABLE KEYS */;
INSERT INTO `users_password_link` VALUES ('aa18b0f3-93a0-0116-f0e6-57e1b7273a0a','guest','2016-09-20 22:25:53',1);
/*!40000 ALTER TABLE `users_password_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_signatures`
--

DROP TABLE IF EXISTS `users_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_signatures`
--

LOCK TABLES `users_signatures` WRITE;
/*!40000 ALTER TABLE `users_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcals`
--

DROP TABLE IF EXISTS `vcals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcals`
--

LOCK TABLES `vcals` WRITE;
/*!40000 ALTER TABLE `vcals` DISABLE KEYS */;
INSERT INTO `vcals` VALUES ('941252e2-99f7-7435-54aa-57c6d2744785',0,'2016-08-31 12:51:58','2016-08-31 12:51:58','1','vfb','sugar','BEGIN:VCALENDAR\r\nVERSION:2.0\r\nPRODID:-//SugarCRM//SugarCRM Calendar//EN\r\nBEGIN:VFREEBUSY\r\nORGANIZER;CN=Administrator:VFREEBUSY\r\nDTSTART:2016-08-29 21:00:00\r\nDTEND:2016-10-29 21:00:00\r\nFREEBUSY:20160831T130000Z/20160831T141500Z\r\nX-FREEBUSY-ID:ae5509a4-673e-97af-23d8-57c6d23f02ed\r\nX-FREEBUSY-TYPE:Call\r\nDTSTAMP:2016-08-31 12:51:58\r\nEND:VFREEBUSY\r\nEND:VCALENDAR\r\n');
/*!40000 ALTER TABLE `vcals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-30 14:04:46
