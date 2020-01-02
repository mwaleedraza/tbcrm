-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2019 at 08:43 AM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tcsalescrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
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
  `campaign_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_audit`
--

CREATE TABLE IF NOT EXISTS `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_bugs`
--

CREATE TABLE IF NOT EXISTS `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cases`
--

CREATE TABLE IF NOT EXISTS `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_contacts`
--

CREATE TABLE IF NOT EXISTS `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cstm`
--

CREATE TABLE IF NOT EXISTS `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_opportunities`
--

CREATE TABLE IF NOT EXISTS `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_actions`
--

CREATE TABLE IF NOT EXISTS `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_actions`
--

INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('10027b4e-e962-7c81-c39e-5de4ceaaf5c7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Users', 'module', 90, 0),
('103a8de7-cdf1-1c3b-4740-5de4ce56e22b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOP_Case_Events', 'module', 90, 0),
('10b3a3e1-b240-ad9e-e8f9-5de4ceb2919b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Surveys', 'module', 90, 0),
('11a43a40-9e05-4328-9364-5de4ceceb5fd', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Users', 'module', 90, 0),
('121214b8-cdee-f99d-299e-5de4cea3d822', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'FP_events', 'module', 90, 0),
('126b1c93-ed7a-5163-50be-5de4ce6dad09', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Surveys', 'module', 90, 0),
('13493506-3896-cec8-7ce5-5de4ce40d3e7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Users', 'module', 90, 0),
('14700d5b-bc5f-25b9-92c3-5de4ce3f0e6b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Surveys', 'module', 90, 0),
('14ed4411-fc9b-207e-fafa-5de4ce07b2b4', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Users', 'module', 90, 0),
('14f86afb-6760-07bf-6f9e-5de4ce28784e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Tasks', 'module', 89, 0),
('15ccf207-cef3-16bb-f34c-5de4ce00dba0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'FP_events', 'module', 90, 0),
('16db50b8-9da8-906b-00cc-5de4ce0c7322', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Users', 'module', 90, 0),
('173f8a5b-df0e-88c5-1f2a-5de4ce146028', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Tasks', 'module', 90, 0),
('175fff00-5ffe-acf5-67b0-5de4cecd2399', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOS_Product_Categories', 'module', 89, 0),
('182be10d-5c47-67b9-30f1-5de4ce638871', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'FP_events', 'module', 90, 0),
('18b00b21-5a45-4160-e74d-5de4ce5f6853', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Users', 'module', 90, 0),
('193b2686-d495-913c-cff4-5de4cea8b6f9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Tasks', 'module', 90, 0),
('19795793-d6c1-7d45-4e2e-5de4ce37e9b7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOS_Product_Categories', 'module', 90, 0),
('1b07b92c-a2e9-7dd0-e14f-5de4ce6d3294', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Tasks', 'module', 90, 0),
('1b736389-e1e9-d8b0-7926-5de4ce07b3b7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'jjwg_Areas', 'module', 89, 0),
('1ba80824-b28f-7bd5-ab8b-5de4ceae05db', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOS_Product_Categories', 'module', 90, 0),
('1d4ddbbc-dc3b-e5e0-2efb-5de4ce7d2d76', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Tasks', 'module', 90, 0),
('1da2532a-1342-353f-bdc6-5de4ce6c12d0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'jjwg_Areas', 'module', 90, 0),
('1db8d2d2-384d-1366-3520-5de4ce530ded', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOS_Product_Categories', 'module', 90, 0),
('1e948447-35b4-301b-be9d-5de4cefec01d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AM_ProjectTemplates', 'module', 89, 0),
('1f520adb-a365-42d8-1b59-5de4ce9c6301', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'jjwg_Areas', 'module', 90, 0),
('1f625cab-e3c2-df1e-0711-5de4ce285d45', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'FP_events', 'module', 90, 0),
('1f62c833-5b1d-e540-3f5f-5de4ce6327df', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Tasks', 'module', 90, 0),
('1f9eb947-fad2-856d-1cbf-5de4ceeb9aee', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'SurveyQuestionResponses', 'module', 89, 0),
('1fd28278-bff0-5300-28ca-5de4ce5849d6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOS_Product_Categories', 'module', 90, 0),
('20e6aeff-72e5-4681-dfaf-5de4ce620372', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AM_ProjectTemplates', 'module', 90, 0),
('214d772e-cb00-b7ad-2ad4-5de4cea84ed2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'jjwg_Areas', 'module', 90, 0),
('2192c0ab-20cd-ed14-fa55-5de4cec01a2b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'SurveyQuestionResponses', 'module', 90, 0),
('21ad5d6b-2fb5-c5de-710a-5de4cef58022', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Tasks', 'module', 90, 0),
('21b6079c-525b-1195-e480-5de4ce723676', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOS_PDF_Templates', 'module', 90, 0),
('21b69304-e94d-741f-9df2-5de4ce007503', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOS_Product_Categories', 'module', 90, 0),
('22ec1376-fc9a-544c-5278-5de4ceec8e7b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'jjwg_Areas', 'module', 90, 0),
('22f0f5e5-3d50-5155-7e17-5de4ceed8bb4', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AM_ProjectTemplates', 'module', 90, 0),
('2351695e-9edf-c96c-70c4-5de4cef2355c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'SurveyQuestionResponses', 'module', 90, 0),
('2394983b-fc9c-9383-0c13-5de4ce5b8375', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Tasks', 'module', 90, 0),
('23957efe-a9b1-93a1-ba70-5de4ce3a1caa', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOS_Product_Categories', 'module', 90, 0),
('24db67ff-9c5e-7536-9652-5de4ce9b3b12', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'jjwg_Areas', 'module', 90, 0),
('25480dce-3b59-f9e4-d805-5de4ce683dbf', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'EAPM', 'module', 90, 0),
('2569aa63-51a5-a4d3-7584-5de4ce9829ea', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'SurveyQuestionResponses', 'module', 90, 0),
('258174c5-9be9-438b-3ba6-5de4ce20262b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AM_ProjectTemplates', 'module', 90, 0),
('25b3d27a-f1e2-4400-da71-5de4ced9f4a6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOS_Product_Categories', 'module', 90, 0),
('25c10c7d-b6f1-d4cd-7cee-5de4ce143627', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'jjwg_Markers', 'module', 89, 0),
('26d7d3fa-f321-23d3-b262-5de4ce59aa3e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'jjwg_Areas', 'module', 90, 0),
('27066953-0116-8bd2-2b2b-5de4ce080add', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'FP_events', 'module', 90, 0),
('2717142a-749e-fce7-eb09-5de4cec08d06', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'SurveyQuestionResponses', 'module', 90, 0),
('274957e0-8d40-7b5d-797b-5de4cee0cd0a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AM_ProjectTemplates', 'module', 90, 0),
('28c47435-ce39-1c15-c6e7-5de4ce8e6798', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'jjwg_Areas', 'module', 90, 0),
('29235d9a-423b-3c1b-d27a-5de4ce93f7c9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'SurveyQuestionResponses', 'module', 90, 0),
('29663f22-d417-5f99-2a26-5de4ceb7d398', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AM_ProjectTemplates', 'module', 90, 0),
('29700354-7eaf-678e-7726-5de4ce4ebf15', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Meetings', 'module', 90, 0),
('2aaa6428-bd96-5f61-b87c-5de4ce51bb66', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'FP_events', 'module', 90, 0),
('2ae954bd-2c4d-d4b1-be07-5de4ce57ad23', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'SurveyQuestionResponses', 'module', 90, 0),
('2b05c8ca-b026-3400-eb4c-5de4ce4f6ba5', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AM_ProjectTemplates', 'module', 90, 0),
('2bb864f2-e010-57ac-45fd-5de4ce98f670', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOP_Case_Updates', 'module', 89, 0),
('2bccc5f5-4942-6801-9c7f-5de4cefc4bf1', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Contacts', 'module', 89, 0),
('2c040ca6-32d7-8148-8890-5de4ceae56b8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOP_Case_Events', 'module', 90, 0),
('2d0cc82c-fa63-dcc1-1282-5de4ce8dddc2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'FP_events', 'module', 90, 0),
('2d168d6d-b65c-816c-5263-5de4cee391b5', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'SurveyQuestionResponses', 'module', 90, 0),
('2db0faca-5100-bf5f-f28e-5de4ce1403a1', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Contacts', 'module', 90, 0),
('2dc36fff-f65b-a3c2-cafc-5de4ce2a2a8b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOP_Case_Updates', 'module', 90, 0),
('2dcfd848-0431-3375-8095-5de4ceaf6723', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AM_ProjectTemplates', 'module', 90, 0),
('2f743a2e-b0ec-5973-c4bb-5de4ce8c05fa', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Contacts', 'module', 90, 0),
('2f9ba319-9e47-e504-993f-5de4ceecdf96', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOP_Case_Updates', 'module', 90, 0),
('315b9713-e8ba-0051-027a-5de4ce95a513', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Contacts', 'module', 90, 0),
('32b038b6-2312-6ce3-be31-5de4ce3855f7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOS_Products', 'module', 89, 0),
('33242c35-54c6-a552-9d9b-5de4ce805582', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Contacts', 'module', 90, 0),
('33cbd76f-66a0-c568-67ce-5de4cec17bd7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'jjwg_Address_Cache', 'module', 89, 0),
('3408f15e-e3e6-4de1-b01d-5de4ce609e11', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Project', 'module', 89, 0),
('340a9452-96ac-5b86-a2a0-5de4ce735ae6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOP_Case_Updates', 'module', 90, 0),
('3524d2f6-60ab-97a0-dfdf-5de4ce22cc3d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Contacts', 'module', 90, 0),
('35f21495-3b9a-f7c0-9e82-5de4ce3c5b98', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'jjwg_Address_Cache', 'module', 90, 0),
('361c04b6-5028-b246-b637-5de4ceb00d0f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Project', 'module', 90, 0),
('367c4a6b-ecc4-b5d7-ae87-5de4cebca400', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOS_Products', 'module', 90, 0),
('368ec9ee-3add-448c-3997-5de4cef950d8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'SurveyQuestions', 'module', 89, 0),
('36e599eb-414a-365f-35cc-5de4ce71a74f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Contacts', 'module', 90, 0),
('3707174b-5f20-43f3-a1af-5de4ceda1fed', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOP_Case_Updates', 'module', 90, 0),
('3818acae-0b26-327d-db4b-5de4ce4c710c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Project', 'module', 90, 0),
('385c8e8e-6ba2-7d04-8e95-5de4ce199f92', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'jjwg_Address_Cache', 'module', 90, 0),
('38982644-e444-0a9b-cbe0-5de4ce942cdf', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'SurveyQuestions', 'module', 90, 0),
('38d1c685-e432-07ea-c937-5de4cebc2a88', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOS_Products', 'module', 90, 0),
('38f818ee-42b8-ade8-5513-5de4cea4a149', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'FP_Event_Locations', 'module', 89, 0),
('38fbb70e-a1ab-a46e-d016-5de4cea210e1', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Contacts', 'module', 90, 0),
('397771cb-809c-0636-d38d-5de4ce6b2ad6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOP_Case_Updates', 'module', 90, 0),
('39f6ac18-34a7-9e67-ed32-5de4ce369ede', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Project', 'module', 90, 0),
('3a4cab3d-3741-a9e2-3edf-5de4ce26ff1f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'SurveyQuestions', 'module', 90, 0),
('3aacd6f6-fca7-e9fe-2021-5de4ce722dcc', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOS_Products', 'module', 90, 0),
('3abd5dc6-805c-3622-7a61-5de4ce4c6c70', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'FP_Event_Locations', 'module', 90, 0),
('3b63ae8c-4f4d-7f08-23ed-5de4ce512541', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOP_Case_Updates', 'module', 90, 0),
('3b9a9ccf-5063-ba0e-13cd-5de4cee2e0ba', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Project', 'module', 90, 0),
('3ba42edd-fb80-2b9f-d6d6-5de4ce001553', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'jjwg_Address_Cache', 'module', 90, 0),
('3c716df4-6e13-8a2b-565b-5de4ce282752', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'SurveyQuestions', 'module', 90, 0),
('3cde9429-adcc-f9ec-a44b-5de4ce88ad01', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOS_Products', 'module', 90, 0),
('3cff39fd-c91b-03a0-16a6-5de4ce10a931', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'FP_Event_Locations', 'module', 90, 0),
('3d68fe8c-88b6-c73f-ac91-5de4ce189b0e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Project', 'module', 90, 0),
('3de11769-574a-e77b-e159-5de4cead044b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOP_Case_Updates', 'module', 90, 0),
('3e25e84f-c0d1-d958-1064-5de4cefa1b4e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'jjwg_Address_Cache', 'module', 90, 0),
('3e40d05f-7a00-a8dd-8512-5de4ce9f8774', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'SurveyQuestions', 'module', 90, 0),
('3eb27b2b-942d-1726-0ac1-5de4ce0df4b9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOS_Products', 'module', 90, 0),
('3eebe65d-b48b-c426-cadb-5de4ced54f0c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'FP_Event_Locations', 'module', 90, 0),
('3f7b3baf-8a1d-cf21-c62d-5de4cec07f83', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Project', 'module', 90, 0),
('3ffcc857-1023-d4fd-234b-5de4ced0318a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'SurveyQuestions', 'module', 90, 0),
('403464e2-0a28-9e4c-0252-5de4cea46c48', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'jjwg_Address_Cache', 'module', 90, 0),
('4112ecda-aa8b-7b82-7295-5de4ce688124', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'FP_Event_Locations', 'module', 90, 0),
('414bf881-5041-a9c7-2d87-5de4ce39ad8e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Project', 'module', 90, 0),
('4160bee0-3ecc-f613-0bd0-5de4ce663a28', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOS_Products', 'module', 90, 0),
('41da45ee-e9cb-5e94-c430-5de4ce7be730', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'SurveyQuestions', 'module', 90, 0),
('424709b8-60c9-f968-7b38-5de4cecbcb28', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'jjwg_Markers', 'module', 90, 0),
('431aacd2-bea9-3469-3dad-5de4ce92d7f0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'jjwg_Address_Cache', 'module', 90, 0),
('4337c61c-951d-6d75-7c08-5de4cea098c3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOS_Products', 'module', 90, 0),
('4348754f-8941-4f48-cf53-5de4ce9e544b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AM_TaskTemplates', 'module', 89, 0),
('434c7a24-37ac-0148-6c0c-5de4cedb0abd', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'FP_Event_Locations', 'module', 90, 0),
('43dbb14e-7992-51d1-1ea8-5de4ce908a3f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'SurveyQuestions', 'module', 90, 0),
('45ef7e4e-eb9c-1717-5cad-5de4cebd5047', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'FP_Event_Locations', 'module', 90, 0),
('46179aa1-4a4b-a606-7bf1-5de4ceedef82', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'jjwg_Address_Cache', 'module', 90, 0),
('47eb226b-6a8c-b443-39d6-5de4ce3e54ae', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AM_TaskTemplates', 'module', 90, 0),
('486e4bcb-3ec3-ca26-724c-5de4cea53d3e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'FP_Event_Locations', 'module', 90, 0),
('4b47087f-feec-78b8-eae5-5de4cec31b90', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOR_Reports', 'module', 89, 0),
('4c008fda-5996-cf41-988a-5de4ce2baa37', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Alerts', 'module', 89, 0),
('4c1c0e1d-31fe-cf31-70ad-5de4ce54f8cb', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Meetings', 'module', 90, 0),
('4c7a126b-b1d1-66df-17a7-5de4ceb5554e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AM_TaskTemplates', 'module', 90, 0),
('4dfc9f5b-1bcc-c3f5-437f-5de4cef5609e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Accounts', 'module', 89, 0),
('4e239b70-53e5-8b15-2993-5de4ce42fd34', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Alerts', 'module', 90, 0),
('4e4c126f-c6c6-3551-311d-5de4ceb8557c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'SurveyQuestionOptions', 'module', 89, 0),
('4f638c5b-a7e6-bb3f-ce40-5de4ce1591b6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOR_Reports', 'module', 90, 0),
('4fad6e86-e376-01ed-5276-5de4cee8fad0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Alerts', 'module', 90, 0),
('4fd895bc-5dfe-49fc-795a-5de4ce9c32eb', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Accounts', 'module', 90, 0),
('5008e176-63e8-6752-3832-5de4ce4aafd9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'ProjectTask', 'module', 89, 0),
('500b0c5b-348b-4803-a79b-5de4ced38881', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'SurveyQuestionOptions', 'module', 90, 0),
('5027b680-afbb-1466-dded-5de4cea89a76', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AM_TaskTemplates', 'module', 90, 0),
('50cb0a54-b78a-52c4-8cc9-5de4ce944982', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOS_PDF_Templates', 'module', 90, 0),
('521c0ba5-9a16-2321-3020-5de4cefb5e4e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOR_Reports', 'module', 90, 0),
('5226e805-798d-9a77-de18-5de4cee99a43', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Alerts', 'module', 90, 0),
('5236081d-ad68-8494-78cc-5de4ce9ed20a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'ProjectTask', 'module', 90, 0),
('5244235b-9496-d5cf-c036-5de4ce2446cf', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'SurveyQuestionOptions', 'module', 90, 0),
('538e0872-29bb-8ccb-5acd-5de4cec30b75', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Accounts', 'module', 90, 0),
('53a75e4b-0d80-eabb-5914-5de4cec2f23e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AM_TaskTemplates', 'module', 90, 0),
('53bd8afd-b2c5-1ac4-ab91-5de4ce505f53', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Alerts', 'module', 90, 0),
('53debf69-59ad-1787-0aa3-5de4ce6f2973', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'ProjectTask', 'module', 90, 0),
('53e2fa4f-3903-3ac7-8e6d-5de4ce85ee65', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'SurveyQuestionOptions', 'module', 90, 0),
('540d8f96-e77f-cddb-0140-5de4ce8d722c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOR_Reports', 'module', 90, 0),
('54b50bc7-caee-5712-0605-5de4ce0fd895', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'EAPM', 'module', 90, 0),
('55a7333e-9484-a4d3-2e45-5de4ce9388da', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Calls_Reschedule', 'module', 89, 0),
('55b401cc-0c36-40b5-cdb5-5de4ce602e4b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOP_Case_Events', 'module', 90, 0),
('55be0f4f-fc8c-d342-df65-5de4cef9497e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Accounts', 'module', 90, 0),
('55cf9dcc-cbd9-95a8-284f-5de4cefbbe2f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'ProjectTask', 'module', 90, 0),
('56001088-2fbc-4ef6-d166-5de4ce53cfb9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'SurveyQuestionOptions', 'module', 90, 0),
('564d08cf-0db3-f996-edae-5de4cec6e5ea', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Surveys', 'module', 89, 0),
('565ffbf4-6a1e-1059-f1ea-5de4ce587837', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Alerts', 'module', 90, 0),
('57119c53-30c9-791c-3979-5de4ce8240eb', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOR_Reports', 'module', 90, 0),
('575faa11-ef8d-29c2-6916-5de4cefa6298', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Accounts', 'module', 90, 0),
('576eec78-f108-aea8-473e-5de4ce1b9433', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'ProjectTask', 'module', 90, 0),
('5774a4a1-b015-50fb-16a3-5de4ce482a09', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AM_TaskTemplates', 'module', 90, 0),
('57a8cf4f-ef3c-f331-74ba-5de4ce6e77c9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'SurveyQuestionOptions', 'module', 90, 0),
('57afbb18-2939-5ad7-27fc-5de4cee20ad0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOD_IndexEvent', 'module', 89, 0),
('58248340-6dc4-eb2a-40f2-5de4ce1acb5e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Alerts', 'module', 90, 0),
('59201181-c6a8-8dc0-d715-5de4ce9bdff3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOR_Reports', 'module', 90, 0),
('59293394-734b-d5e7-1731-5de4cee95686', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Calls_Reschedule', 'module', 90, 0),
('598d496b-a248-c82d-e575-5de4cec78c31', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'ProjectTask', 'module', 90, 0),
('59a79366-d03f-7ea9-bfa0-5de4ce232bb0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Accounts', 'module', 90, 0),
('59af5018-c43a-f8d4-07e5-5de4cef4cf21', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'SurveyQuestionOptions', 'module', 90, 0),
('5a38bb35-95cf-9b91-2c96-5de4ce05b47c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOD_IndexEvent', 'module', 90, 0),
('5aa728e1-950f-09b3-ce8c-5de4ce1e7795', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Alerts', 'module', 90, 0),
('5ae4c061-efe1-eb62-a5a8-5de4ce004bdf', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOR_Reports', 'module', 90, 0),
('5b1aa1c2-1612-e4f8-467b-5de4ced5c50c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AM_TaskTemplates', 'module', 90, 0),
('5b49ac2a-a4a6-bce4-43e6-5de4ce9079d7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Accounts', 'module', 90, 0),
('5b6d1e5e-fe5f-8ab1-98d2-5de4cead5fa8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'SurveyQuestionOptions', 'module', 90, 0),
('5b891f2c-28d0-1ac5-ac3a-5de4cefd2510', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'ProjectTask', 'module', 90, 0),
('5bda3b61-9ed5-f2d3-e19c-5de4ce69c0c0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'access', 'Employees', 'module', 89, 0),
('5c7d2bea-730b-e55a-3843-5de4ce204529', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOR_Reports', 'module', 90, 0),
('5c8bbfb1-829b-26ac-2674-5de4cea7a01f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOD_IndexEvent', 'module', 90, 0),
('5cc10838-5130-c05e-bd32-5de4ce0cb3a4', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'jjwg_Markers', 'module', 90, 0),
('5cc688d5-c8d4-158e-8b29-5de4ceaa7454', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Calls_Reschedule', 'module', 90, 0),
('5cf6e85c-615c-8140-9187-5de4cec5346a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Accounts', 'module', 90, 0),
('5d8de5ab-76f7-cb9a-cb89-5de4ce3a2dbb', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'ProjectTask', 'module', 90, 0),
('5df0e9cd-dc76-1776-9e40-5de4ce7fa0ed', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'view', 'Employees', 'module', 90, 0),
('5f393fa9-9108-4913-06a0-5de4ceb1b1f6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AM_TaskTemplates', 'module', 90, 0),
('5f48a1df-1986-04ff-e953-5de4ce5785d3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOD_IndexEvent', 'module', 90, 0),
('5fb2f5f2-980f-a098-5e2f-5de4ce1fa5b7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'list', 'Employees', 'module', 90, 0),
('61010856-e299-3132-b737-5de4ceea2859', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Calls_Reschedule', 'module', 90, 0),
('616e5aeb-08ca-9c51-dde2-5de4ce4ea5e3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'edit', 'Employees', 'module', 90, 0),
('622cd94a-a435-f131-49f3-5de4ceff9907', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOD_IndexEvent', 'module', 90, 0),
('6377c45e-900e-5729-f330-5de4ce475d3c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'delete', 'Employees', 'module', 90, 0),
('64c59d45-582b-381e-c644-5de4ce20792f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOD_IndexEvent', 'module', 90, 0),
('653a8f14-c5f4-c175-64eb-5de4cea80a36', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Calls_Reschedule', 'module', 90, 0),
('65575485-8ede-dfe7-b9c4-5de4ce7c46e3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'import', 'Employees', 'module', 90, 0),
('677d31a3-f2fe-a843-4381-5de4ce493c21', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'export', 'Employees', 'module', 90, 0),
('683d75a5-ab71-f0f3-a9d0-5de4cee5a949', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Documents', 'module', 89, 0),
('685cafa1-ed0a-af55-9bd1-5de4ce17158c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOD_IndexEvent', 'module', 90, 0),
('69441e4b-1531-c303-019d-5de4cec6f3fc', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'massupdate', 'Employees', 'module', 90, 0),
('69485adb-45c5-6e39-28f2-5de4ce25ad8e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Calls_Reschedule', 'module', 90, 0),
('6ac3adc1-28b8-aa3b-1a3d-5de4ce5c1739', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Documents', 'module', 90, 0),
('6b6b1677-b438-1916-f6e3-5de4ced3d7e8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOS_Quotes', 'module', 89, 0),
('6c6d30af-14ca-445b-33bd-5de4ce74c0d2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Documents', 'module', 90, 0),
('6c9e0174-a97b-52ab-d093-5de4cea3e022', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Meetings', 'module', 90, 0),
('6d55503f-ac11-99b1-54f2-5de4ce2e5e7e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOD_IndexEvent', 'module', 90, 0),
('6db56285-5153-8745-7b7b-5de4ce705c56', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOS_Quotes', 'module', 90, 0),
('6e24c6ee-3de2-0dea-e606-5de4ce4f46b2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Calls_Reschedule', 'module', 90, 0),
('6ed4596b-1c96-16d4-4057-5de4ce17f99a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Documents', 'module', 90, 0),
('70958af1-2929-5d1c-9920-5de4ce236c2d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOS_Quotes', 'module', 90, 0),
('709749eb-53bc-d977-9554-5de4cec22c8c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Calls_Reschedule', 'module', 90, 0),
('70a449e2-ff46-6038-4a7f-5de4ce2fe3c0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Documents', 'module', 90, 0),
('718d1602-04fd-804a-f26d-5de4ce11b648', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Opportunities', 'module', 89, 0),
('72250dd9-deb0-169e-b96f-5de4ce4c66f8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOP_Case_Events', 'module', 90, 0),
('730335ca-a839-e10e-bc77-5de4ceba77f7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOS_Quotes', 'module', 90, 0),
('7336d015-7c90-c1d1-17c7-5de4ce22580d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Opportunities', 'module', 90, 0),
('735a0410-d9c9-d574-afdc-5de4cebff24d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Surveys', 'module', 90, 0),
('73735459-dd3b-5615-8ea4-5de4ce163595', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Documents', 'module', 90, 0),
('7388f831-995a-40a3-0291-5de4cef0263e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Campaigns', 'module', 89, 0),
('752961a6-e311-fe87-2a8b-5de4ce4d86e5', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Opportunities', 'module', 90, 0),
('75296398-ac3b-7b80-98a8-5de4ce233537', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOS_Quotes', 'module', 90, 0),
('7554433a-bbae-a038-ff75-5de4ceee8411', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Campaigns', 'module', 90, 0),
('75d7b014-ea92-8700-2900-5de4ce0f51c9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Documents', 'module', 90, 0),
('77211ca9-4d85-41c0-1f9a-5de4ce927453', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOS_Quotes', 'module', 90, 0),
('772c97d3-0954-eeac-f919-5de4ced3b2c9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Opportunities', 'module', 90, 0),
('774790d5-704c-19d6-2fda-5de4ce32a0da', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Campaigns', 'module', 90, 0),
('7887566b-a938-18c3-9cca-5de4ce01238c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Documents', 'module', 90, 0),
('78f04e8f-da3b-9508-d880-5de4cedf6a8c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOR_Scheduled_Reports', 'module', 89, 0),
('790edf12-5be5-cb76-ee59-5de4ce08aaa8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Opportunities', 'module', 90, 0),
('79872d6f-7b76-2876-946d-5de4ceb9b0b7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Campaigns', 'module', 90, 0),
('79b3569d-7e0f-f43b-8ac5-5de4ce5b923c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOS_Quotes', 'module', 90, 0),
('7b3639ef-926b-6e2f-9950-5de4cefb6d38', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Opportunities', 'module', 90, 0),
('7b55059e-1f1b-1366-a5c1-5de4cea2a40d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'jjwg_Markers', 'module', 90, 0),
('7be4e67a-f872-6e7d-5cf3-5de4cee41012', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Campaigns', 'module', 90, 0),
('7c1f6916-ca4e-9514-f465-5de4cef3c34c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOS_Quotes', 'module', 90, 0),
('7cc8d2e6-2ec0-d319-cd2f-5de4ce784d82', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOR_Scheduled_Reports', 'module', 90, 0),
('7d49ebf8-12dc-3eab-6206-5de4ce140c49', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Opportunities', 'module', 90, 0),
('7e8bbfed-99f7-abab-74dd-5de4cef0d14d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Campaigns', 'module', 90, 0),
('7f90ded2-c6ec-e08e-2201-5de4ce7880c3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOR_Scheduled_Reports', 'module', 90, 0),
('7fdbb9bd-925f-70eb-847f-5de4ce647c0e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Opportunities', 'module', 90, 0),
('800b05a9-7994-122c-8aea-5de4ce513404', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOS_PDF_Templates', 'module', 90, 0),
('81f7dbc4-9209-ccf9-1e83-5de4cebac54c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOR_Scheduled_Reports', 'module', 90, 0),
('825fa4f6-12d8-d652-b54f-5de4ce6c90b2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Campaigns', 'module', 90, 0),
('836da126-3cc6-3652-6fd7-5de4ce1594a9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'SecurityGroups', 'module', 89, 0),
('84d6dc40-2682-1812-34b2-5de4ce016dea', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOR_Scheduled_Reports', 'module', 90, 0),
('84dcc37a-bed8-c82c-c5e1-5de4ce1b8e83', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Campaigns', 'module', 90, 0),
('875feecc-2741-25ef-f48d-5de4ce27186c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOR_Scheduled_Reports', 'module', 90, 0),
('87c95b9a-daff-ad0d-5ea0-5de4ce4ad2bf', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'SecurityGroups', 'module', 90, 0),
('89a40aea-8383-d01e-f9f1-5de4ce0ff8b5', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOR_Scheduled_Reports', 'module', 90, 0),
('8a024691-83cb-020c-adba-5de4ce986922', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'SecurityGroups', 'module', 90, 0),
('8c7c80ea-2368-6327-8c03-5de4ce87cfdf', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOR_Scheduled_Reports', 'module', 90, 0),
('8d2f95a8-5701-1ce0-fb43-5de4ce5fe663', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'SecurityGroups', 'module', 90, 0),
('8e7b0ebf-76f2-e0ae-7849-5de4ce255d25', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Meetings', 'module', 90, 0),
('8ea3975e-349e-19e4-69a5-5de4ce16b9b7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'EmailTemplates', 'module', 89, 0),
('8ef0b3e3-697a-d058-aff9-5de4ce697eae', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOW_WorkFlow', 'module', 89, 0),
('8f27d3f8-dac0-4f78-5c45-5de4ce053271', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Leads', 'module', 89, 0),
('90bd793c-5a48-f09c-a79c-5de4ce7ac0f5', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'SecurityGroups', 'module', 90, 0),
('90e8e8a4-b703-9ec8-1b57-5de4cea017e9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'EmailTemplates', 'module', 90, 0),
('910fc0e2-9eae-6116-eba0-5de4ced7e21c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOW_WorkFlow', 'module', 90, 0),
('93079078-33aa-29f4-2b3d-5de4ce99f5f8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'EmailTemplates', 'module', 90, 0),
('93253de6-e5c2-cf08-01b5-5de4cec68ea7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOW_WorkFlow', 'module', 90, 0),
('93d92f1b-10ad-7005-7c00-5de4ced33a64', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Leads', 'module', 90, 0),
('943dda6c-52d4-f883-b71d-5de4ce22cf71', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'SecurityGroups', 'module', 90, 0),
('9516866f-340a-3d77-2666-5de4ce10cb19', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOW_WorkFlow', 'module', 90, 0),
('953efffc-088c-d4cc-15c9-5de4cedf4d91', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'EmailTemplates', 'module', 90, 0),
('967881e3-663c-60a9-ebd9-5de4ce894f5e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'SecurityGroups', 'module', 90, 0),
('972dc179-34a6-4b46-c362-5de4cea8baaf', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Leads', 'module', 90, 0),
('976f09e4-8da9-4985-67e2-5de4cee2dc92', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'jjwg_Markers', 'module', 90, 0),
('97d362cf-c7fc-94cd-5b90-5de4ce1aae0b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'EmailTemplates', 'module', 90, 0),
('97e66ac1-0648-2584-8f34-5de4cebeaf36', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOW_WorkFlow', 'module', 90, 0),
('982b7ca7-4841-c795-dff6-5de4ce518b21', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOS_Contracts', 'module', 89, 0),
('98f55c7f-1bbb-c87a-10a0-5de4ce883351', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'SecurityGroups', 'module', 90, 0),
('99fb6291-f476-c4d6-3cc6-5de4ce56167b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOK_Knowledge_Base_Categories', 'module', 89, 0),
('9a80889e-5bed-8495-cab9-5de4cef407e5', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Leads', 'module', 90, 0),
('9a90b2bf-9fda-808d-4ec8-5de4cec6c65a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'ProspectLists', 'module', 89, 0),
('9b457950-dff5-a11e-56c7-5de4ced32aa7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'EmailTemplates', 'module', 90, 0),
('9b73374a-5b7a-d6e0-f31a-5de4cee02da6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOW_WorkFlow', 'module', 90, 0),
('9bf0b2fc-a773-dd05-9e56-5de4ce1a3207', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOS_Contracts', 'module', 90, 0),
('9bfb0321-cec8-2125-18b0-5de4ce9038db', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Surveys', 'module', 90, 0),
('9cae972d-5e88-81ce-4eaa-5de4ce30052a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Leads', 'module', 90, 0),
('9e112e25-2e0a-8206-64ba-5de4ce37c7ac', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'EmailTemplates', 'module', 90, 0),
('9e75983e-d5d7-84df-ae8c-5de4cecce2fb', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOW_WorkFlow', 'module', 90, 0),
('9e9a75ea-926a-0fe3-697e-5de4cee31140', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'ProspectLists', 'module', 90, 0),
('9ebc3b68-348d-c193-0358-5de4ce9977b8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOS_Contracts', 'module', 90, 0),
('9f042b4e-27c3-b472-1f39-5de4ceb51b43', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Leads', 'module', 90, 0),
('a094b34e-4af4-fd8d-34b2-5de4ce97c3c3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'EmailTemplates', 'module', 90, 0),
('a0adcdf2-094c-72af-03f2-5de4ce86c48a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Leads', 'module', 90, 0),
('a1390537-9739-1ad7-cc74-5de4ce0a4b46', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'ProspectLists', 'module', 90, 0),
('a1715fd9-e93c-be00-a20a-5de4ceb599c6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOW_WorkFlow', 'module', 90, 0),
('a189b148-64f0-bac3-3076-5de4ce430b60', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('a214ff48-5c2e-2ee2-bde3-5de4ce12702c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'OutboundEmailAccounts', 'module', 89, 0),
('a2bda687-9a1f-c623-9e0d-5de4ced11715', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOS_Contracts', 'module', 90, 0),
('a2eecfb2-45a2-c5a7-fcd5-5de4ce7e6959', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Leads', 'module', 90, 0),
('a453fa09-ff5f-7ccb-5192-5de4ce81bb47', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'ProspectLists', 'module', 90, 0),
('a479c59e-a2ad-6f4b-32c9-5de4ced9645e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'OutboundEmailAccounts', 'module', 90, 0),
('a5b5229c-5285-97ab-c02a-5de4ce78aa3d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOS_Contracts', 'module', 90, 0),
('a6ed9ed2-43d1-8145-609e-5de4ceb889e0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'ProspectLists', 'module', 90, 0),
('a6fdb29d-b414-97a6-5031-5de4ce20ec42', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'OutboundEmailAccounts', 'module', 90, 0),
('a71187d4-d716-f540-80a5-5de4ce746c32', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOD_Index', 'module', 89, 0),
('a7b3fb2d-55cd-e4d0-4c8c-5de4ce187348', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('a802043f-bcd8-d7b0-f8d2-5de4ce80a67f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOP_Case_Events', 'module', 90, 0),
('a8947541-5c06-b6dc-930d-5de4ce38e008', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOS_Contracts', 'module', 90, 0),
('a8d3b062-4821-bca1-9466-5de4ce96569e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'OutboundEmailAccounts', 'module', 90, 0),
('a9cb7228-cad8-8716-714e-5de4ce6c55d3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'ProspectLists', 'module', 90, 0),
('aa6351be-880a-21a1-dc80-5de4ce5881b0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Notes', 'module', 89, 0),
('ab5d4b60-a2ea-2aa9-dec3-5de4cea23710', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'OutboundEmailAccounts', 'module', 90, 0),
('abd66f97-b165-66b6-2310-5de4ce9db3c4', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOS_Contracts', 'module', 90, 0),
('acae614e-cac8-4dd1-cc2f-5de4ce1114e1', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Notes', 'module', 90, 0),
('acb2aa99-c876-2b02-5d56-5de4ce46c380', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOD_Index', 'module', 90, 0),
('acde0166-96de-ec0b-0f44-5de4ce8fc341', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'ProspectLists', 'module', 90, 0),
('ad5d54ba-0cdd-2ba0-ca46-5de4ce46835c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'OutboundEmailAccounts', 'module', 90, 0),
('ae19040a-649b-6bf9-b1c7-5de4ce97ac00', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Meetings', 'module', 90, 0),
('ae7909d4-c920-cd17-4177-5de4ced162dd', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOS_Contracts', 'module', 90, 0),
('af2ce62a-f7b4-029f-29bb-5de4cedf374a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Notes', 'module', 90, 0),
('af37c744-fc9a-b45e-9417-5de4ce5b0b71', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'OutboundEmailAccounts', 'module', 90, 0),
('af4c6963-9890-4317-d634-5de4ce1be7b2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('afa4be7e-d43f-6f69-cd56-5de4ce54fc07', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOD_Index', 'module', 90, 0),
('b0015e81-6bf3-ebe6-f68c-5de4cea2de03', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'ProspectLists', 'module', 90, 0),
('b10aeddb-e1ec-a339-f0a3-5de4ce8b6645', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'OutboundEmailAccounts', 'module', 90, 0),
('b1690737-4fba-a0ad-e094-5de4cefa684f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Notes', 'module', 90, 0),
('b1d90f6f-d1d1-da4a-e35c-5de4ceb3b3b6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'jjwg_Markers', 'module', 90, 0),
('b257e5e1-5f34-8dc4-1598-5de4ce75a60c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('b3b7ea31-72ed-6bb2-5071-5de4cefa63f7', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOD_Index', 'module', 90, 0),
('b40e3cb4-1988-9fb1-9f55-5de4ced4db0b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Notes', 'module', 90, 0),
('b5f17111-7ac7-3d31-ebd5-5de4ce37b934', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Notes', 'module', 90, 0),
('b5f23b35-8cb2-fb82-ab76-5de4cec602b9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('b6aaa2f0-a266-a856-56e2-5de4ce47e354', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOW_Processed', 'module', 89, 0),
('b7eb3bdc-42ba-331f-e644-5de4ce982175', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Notes', 'module', 90, 0),
('b90fe9d7-039a-3172-ea3f-5de4ce843b17', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('b9fb5fe8-c4a8-bb75-eae5-5de4cee6ff4e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Notes', 'module', 90, 0),
('ba43a49b-f92a-14f7-3748-5de4ce143095', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOD_Index', 'module', 90, 0),
('ba6b3019-75b7-8f31-891f-5de4ce69d7c1', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'TemplateSectionLine', 'module', 89, 0),
('bba77419-7d9b-952e-0e1e-5de4ceba1626', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOW_Processed', 'module', 90, 0),
('bbfe2e19-a380-e31c-ebd8-5de4ce82692e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('bc51672c-5585-e994-79e3-5de4ceba6b4a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Cases', 'module', 89, 0),
('bc7cbefc-31d2-4360-5f9c-5de4cea2af85', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'TemplateSectionLine', 'module', 90, 0),
('bd8ec1e5-ec68-5271-9ab3-5de4ceccdbaf', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Spots', 'module', 89, 0),
('be4fe852-5cf0-3918-7523-5de4ce305b61', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Cases', 'module', 90, 0),
('be50fe4d-2027-5ba5-7cea-5de4cee5aa73', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'TemplateSectionLine', 'module', 90, 0),
('be767c72-ef9d-7149-9136-5de4cef86eb1', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOW_Processed', 'module', 90, 0),
('beee8c07-a6ef-1b57-872b-5de4ce7d6e92', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Prospects', 'module', 89, 0),
('c02b35d8-0362-3484-2549-5de4ce14df51', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Spots', 'module', 90, 0),
('c03d9f8f-9f17-1c33-d5f4-5de4ce89cb56', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'TemplateSectionLine', 'module', 90, 0),
('c0b44053-d737-85f0-3b53-5de4ce8f48ca', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Cases', 'module', 90, 0),
('c0c4b5b3-712a-b26f-3cf8-5de4ce57d960', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOW_Processed', 'module', 90, 0),
('c113494e-bbd0-6d96-141f-5de4ced516b9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Prospects', 'module', 90, 0),
('c1b3da3f-d51f-1d26-bd1e-5de4ce38cab6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOS_Invoices', 'module', 89, 0),
('c1e26a41-d397-ad37-b414-5de4ce104db9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Spots', 'module', 90, 0),
('c2143cb4-7449-3a5f-4a66-5de4ceaddebc', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'TemplateSectionLine', 'module', 90, 0),
('c2c45d0b-83fc-36f8-2126-5de4cee49dd6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Cases', 'module', 90, 0),
('c3318601-016f-38f8-5633-5de4cecc5f31', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Calls', 'module', 89, 0),
('c3b8b13b-708a-3ee0-3c0b-5de4cec5379f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Prospects', 'module', 90, 0),
('c3fd21df-84df-75d4-2c1e-5de4ce3dd5e8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOW_Processed', 'module', 90, 0),
('c42d165a-24a5-1291-1ac0-5de4cec3e66c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOS_Invoices', 'module', 90, 0),
('c43ae654-9e67-bcf8-2157-5de4ce920036', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'TemplateSectionLine', 'module', 90, 0),
('c44ababc-5e97-ec24-01ca-5de4ce6c5619', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Spots', 'module', 90, 0),
('c4a3debb-52cd-20e5-211f-5de4cec3efe9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Cases', 'module', 90, 0),
('c4c8a736-9da7-bf4b-352a-5de4ceb91e45', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Calls', 'module', 90, 0),
('c6137d7f-52a2-785d-b1ca-5de4ce64ac00', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'TemplateSectionLine', 'module', 90, 0),
('c6147940-66ee-05f8-10bc-5de4cedf2f3a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Prospects', 'module', 90, 0),
('c62466a6-a4e2-97cf-ab3a-5de4cebac1ce', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Spots', 'module', 90, 0),
('c6433f3e-f6b7-d1ff-3c7f-5de4ce9f932d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Cases', 'module', 90, 0),
('c664b796-ecf6-1084-860c-5de4ce6f34e3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Calls', 'module', 90, 0),
('c6d222b8-b8ad-b942-0cf4-5de4ce64cf21', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOS_Invoices', 'module', 90, 0),
('c6e26502-c609-314f-475d-5de4ce8e9765', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOW_Processed', 'module', 90, 0),
('c6e90929-1e15-b1dd-5350-5de4ceff9023', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Users', 'module', 89, 0);
INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('c7bf0ea5-6afd-0718-680c-5de4cef98393', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Surveys', 'module', 90, 0),
('c80244c7-45f3-db95-c651-5de4ce445470', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'TemplateSectionLine', 'module', 90, 0),
('c8302a80-05b3-35b5-5ef8-5de4ceb6a8b4', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Calls', 'module', 90, 0),
('c863fc8e-8a67-9fb5-68b1-5de4ce11f139', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Spots', 'module', 90, 0),
('c89e6791-044f-58df-846b-5de4ce999262', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Cases', 'module', 90, 0),
('c8cd41a9-77b8-18a5-c3d7-5de4cebcc0d2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOD_Index', 'module', 90, 0),
('c9272261-e211-a664-7013-5de4ce41c273', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOS_Invoices', 'module', 90, 0),
('c9307263-3d98-899e-ef96-5de4ce312146', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Prospects', 'module', 90, 0),
('c981d41f-d8ec-df8e-ae11-5de4cee5491f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOW_Processed', 'module', 90, 0),
('c9ee8635-d78e-75ce-c6e7-5de4cea6aa96', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Calls', 'module', 90, 0),
('ca206356-c0f3-d6ff-b49c-5de4ce38772c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Spots', 'module', 90, 0),
('ca6b8851-4ac6-bb76-01d4-5de4ce61189d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Cases', 'module', 90, 0),
('cb24fbdb-20c8-5b49-c1f3-5de4ceef465b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOS_Invoices', 'module', 90, 0),
('cb46f0a0-5550-8475-79f9-5de4ce60f33f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOW_Processed', 'module', 90, 0),
('cb639700-2f4f-4994-81b8-5de4ce3fc5ed', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOD_Index', 'module', 90, 0),
('cbeed77c-538c-4fc9-cd9a-5de4cec3e822', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Calls', 'module', 90, 0),
('cbfb99da-538c-6f66-d3d5-5de4cee7f5ac', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Prospects', 'module', 90, 0),
('cc69c9c2-71bc-af98-31f9-5de4ce8f7252', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOK_KnowledgeBase', 'module', 89, 0),
('ccde38f8-f0aa-f48c-6073-5de4cebfc388', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Spots', 'module', 90, 0),
('cd9883d0-0788-5917-c027-5de4ce686a21', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOS_Invoices', 'module', 90, 0),
('cdcf0d4d-9a6c-3975-7786-5de4ce9cc4e2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Calls', 'module', 90, 0),
('cdf603cb-e5be-a84e-351e-5de4cec31fc6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'jjwg_Markers', 'module', 90, 0),
('ce4aa0ed-f2d9-5f7b-b53a-5de4ce78a7b6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Prospects', 'module', 90, 0),
('ce799d33-ae93-a4f5-523f-5de4ce08ee78', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOK_KnowledgeBase', 'module', 90, 0),
('cf2bd51d-2e55-fa17-7f16-5de4ce1b41c9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOD_Index', 'module', 90, 0),
('cfde6634-ee55-141b-1c26-5de4ce16793e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Calls', 'module', 90, 0),
('d00000f2-581e-2f37-5914-5de4ced2e8ce', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Meetings', 'module', 90, 0),
('d012fb02-db44-d45c-61a0-5de4ce2d6989', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOS_Invoices', 'module', 90, 0),
('d151533e-029d-3375-cc6b-5de4ce11c326', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Prospects', 'module', 90, 0),
('d157e53d-d0cd-3153-2735-5de4ce8cdff4', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOK_KnowledgeBase', 'module', 90, 0),
('d2230335-1ae8-5cc3-c914-5de4ce9b6b18', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOS_Invoices', 'module', 90, 0),
('d2df0a31-6bf3-2e62-c59a-5de4ce0c479b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'FP_events', 'module', 89, 0),
('d410fcf7-9024-bd4d-0f6b-5de4ce7bf4c6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOK_KnowledgeBase', 'module', 90, 0),
('d5d45613-f7be-d709-b894-5de4cee8b669', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOK_KnowledgeBase', 'module', 90, 0),
('d801dfa1-7716-3681-bde6-5de4ce55c7fa', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'AOK_KnowledgeBase', 'module', 90, 0),
('d8bf0004-cf48-8b18-c577-5de4ceaa7234', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOP_Case_Events', 'module', 90, 0),
('d943565f-097a-d9e9-fcbd-5de4ce778381', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Emails', 'module', 89, 0),
('d9d08bb5-d990-6f33-0aef-5de4ce8f693c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'jjwg_Maps', 'module', 89, 0),
('da730cc8-abe4-8307-e153-5de4cec42dbd', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'AOK_KnowledgeBase', 'module', 90, 0),
('dad9e412-a8da-e9cb-c253-5de4cebc7345', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'SurveyResponses', 'module', 89, 0),
('db713de6-7595-b9cd-b5c5-5de4ced4a9e0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Emails', 'module', 90, 0),
('dbb884f3-48ca-606a-d8ae-5de4ce9b3926', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'jjwg_Maps', 'module', 90, 0),
('dc270910-e4d5-e80d-5aa2-5de4ce71f198', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'EmailMarketing', 'module', 89, 0),
('dcf86158-e0d9-ffe8-8032-5de4ce616992', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Emails', 'module', 90, 0),
('dd1c144f-b0d1-97b3-e546-5de4ced497f8', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'AOK_KnowledgeBase', 'module', 90, 0),
('ddd76340-61d9-db2e-2106-5de4ce15e1d6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'SurveyResponses', 'module', 90, 0),
('ddf0174f-18b7-68e4-495f-5de4cef98dbc', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'EmailMarketing', 'module', 90, 0),
('de21e0d1-c495-81ab-f276-5de4cef04ca6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'jjwg_Maps', 'module', 90, 0),
('de91c398-0234-040c-86ba-5de4ceb5fa3f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Emails', 'module', 90, 0),
('e055654f-538d-49e6-d62c-5de4ce1c5cef', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'jjwg_Maps', 'module', 90, 0),
('e08ced89-f176-9653-f1ac-5de4ce7f55c5', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Emails', 'module', 90, 0),
('e0bdbe95-1484-1d73-7853-5de4cef65d91', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'EmailMarketing', 'module', 90, 0),
('e0c58377-f164-3b76-b13d-5de4ce1ebfc9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'SurveyResponses', 'module', 90, 0),
('e185d0fb-59e2-3d21-b7d8-5de4ceca4d47', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Bugs', 'module', 89, 0),
('e20bee57-2f98-1bfb-bea1-5de4ce01a0e0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'jjwg_Maps', 'module', 90, 0),
('e24db9cc-07e3-b430-d449-5de4ceb8b824', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Emails', 'module', 90, 0),
('e2ad0d88-c5fc-99e7-9071-5de4ce1827da', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'SurveyResponses', 'module', 90, 0),
('e2b5c6be-ab25-4b74-da44-5de4cecb6eb3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'EmailMarketing', 'module', 90, 0),
('e3820697-ceaa-6df4-74f4-5de4ce6f96cc', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Users', 'module', 90, 0),
('e3ec30a9-50dd-f52b-6224-5de4ce4243af', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Bugs', 'module', 90, 0),
('e43d69de-8425-9ec4-5f97-5de4ce3bd5a3', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'jjwg_Maps', 'module', 90, 0),
('e44ab732-460e-5e53-d993-5de4ce65d1fc', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Emails', 'module', 90, 0),
('e60cb724-c15e-f92f-c657-5de4ce4f650b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'Bugs', 'module', 90, 0),
('e61469c0-9a3f-349b-4509-5de4cea37b62', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Emails', 'module', 90, 0),
('e626dcbe-ea46-9008-cbe3-5de4cef00b40', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'jjwg_Maps', 'module', 90, 0),
('e62d0375-688c-4169-f5bf-5de4ce5b72de', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'SurveyResponses', 'module', 90, 0),
('e6e35ca9-c4bd-0b70-13cc-5de4ce3ca19d', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOS_PDF_Templates', 'module', 89, 0),
('e751f2b3-92a2-e05f-dda0-5de4ce6fb03a', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'EAPM', 'module', 89, 0),
('e83e4dbb-3e10-0781-d7fa-5de4ce9714de', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'Bugs', 'module', 90, 0),
('e84b720b-0005-839d-e8e3-5de4ce26bff4', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'jjwg_Maps', 'module', 90, 0),
('e93317ad-f690-7eae-211c-5de4ce6469ef', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'SurveyResponses', 'module', 90, 0),
('e93b000e-98c3-b9af-2572-5de4ce354b4c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Surveys', 'module', 90, 0),
('e9900dc6-10f3-20cd-8827-5de4ce3e0959', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOS_PDF_Templates', 'module', 90, 0),
('ea31ea6c-a245-d649-d236-5de4ce9257e2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'EAPM', 'module', 90, 0),
('ead2de4a-74c8-5e8b-d8b2-5de4ce190af2', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'Bugs', 'module', 90, 0),
('eb1cd394-24bc-05a4-9c64-5de4ce1d2ae9', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'SurveyResponses', 'module', 90, 0),
('ec1817fa-7759-b80d-9a20-5de4cecbc0ce', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'EmailMarketing', 'module', 90, 0),
('ecef2e5d-7807-5e5f-fc77-5de4ced82b2f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'EAPM', 'module', 90, 0),
('ed1f3d5e-14bb-258b-95d9-5de4ced4855f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'Bugs', 'module', 90, 0),
('ed2d0a70-d460-2078-7df6-5de4ce805700', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'jjwg_Markers', 'module', 90, 0),
('ed317519-d616-0532-b5c9-5de4ce3582cd', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'list', 'AOS_PDF_Templates', 'module', 90, 0),
('ed657755-391f-34c0-4fb5-5de4cefd82af', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'AOP_Case_Events', 'module', 89, 0),
('ee0662d9-b80b-1457-2f57-5de4cefab2bb', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'SurveyResponses', 'module', 90, 0),
('eea202ee-8b23-ab5f-8edc-5de4ce8230d6', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'EmailMarketing', 'module', 90, 0),
('eeb15c20-c52f-8aea-cfe6-5de4cebbcc4b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'EAPM', 'module', 90, 0),
('ef706c1e-8fb6-f7f9-bb30-5de4ce35485b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'Bugs', 'module', 90, 0),
('efa3d8d0-c733-0491-e8d3-5de4ce3878c0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'edit', 'AOS_PDF_Templates', 'module', 90, 0),
('f0d5b830-8d9b-e083-33bb-5de4cea2a207', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'export', 'EmailMarketing', 'module', 90, 0),
('f0f63bcd-3d21-0e1d-5b8d-5de4ce4f8a4f', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'access', 'Meetings', 'module', 89, 0),
('f1608491-c236-0881-73f5-5de4ce4c097e', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'Bugs', 'module', 90, 0),
('f1cfa48f-e7a4-24d5-fcc2-5de4ced938a0', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'EAPM', 'module', 90, 0),
('f267f1f8-927b-a01b-5747-5de4ce0d4c39', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'massupdate', 'EmailMarketing', 'module', 90, 0),
('f3042798-3fcc-266c-c336-5de4ceb78e04', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'Meetings', 'module', 90, 0),
('f3176e67-56de-84e1-8ef2-5de4ce347631', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'view', 'AOP_Case_Events', 'module', 90, 0),
('f327a697-44ea-fb42-91d4-5de4ce77c13b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'delete', 'AOS_PDF_Templates', 'module', 90, 0),
('f3c61822-c64f-2408-9531-5de4cebd4363', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'import', 'EAPM', 'module', 90, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles`
--

CREATE TABLE IF NOT EXISTS `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_actions`
--

CREATE TABLE IF NOT EXISTS `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_users`
--

CREATE TABLE IF NOT EXISTS `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE IF NOT EXISTS `alerts` (
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
  `reminder_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates` (
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
  `override_business_hours` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_audit`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_contacts_1_c`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_project_1_c`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_project_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_users_1_c`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `users_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates`
--

CREATE TABLE IF NOT EXISTS `am_tasktemplates` (
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
  `duration` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates_am_projecttemplates_c`
--

CREATE TABLE IF NOT EXISTS `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates_audit`
--

CREATE TABLE IF NOT EXISTS `am_tasktemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aobh_businesshours`
--

CREATE TABLE IF NOT EXISTS `aobh_businesshours` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `opening_hours` varchar(100) DEFAULT '1',
  `closing_hours` varchar(100) DEFAULT '1',
  `open_status` tinyint(1) DEFAULT NULL,
  `day` varchar(100) DEFAULT 'monday'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_index`
--

CREATE TABLE IF NOT EXISTS `aod_index` (
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
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aod_index`
--

INSERT INTO `aod_index` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `last_optimised`, `location`) VALUES
('1', 'Index', '2019-12-02 08:43:20', '2019-12-02 08:43:20', '1', '1', NULL, 0, NULL, NULL, 'modules/AOD_Index/Index/Index');

-- --------------------------------------------------------

--
-- Table structure for table `aod_indexevent`
--

CREATE TABLE IF NOT EXISTS `aod_indexevent` (
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
  `record_module` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_indexevent_audit`
--

CREATE TABLE IF NOT EXISTS `aod_indexevent_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_index_audit`
--

CREATE TABLE IF NOT EXISTS `aod_index_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledgebase`
--

CREATE TABLE IF NOT EXISTS `aok_knowledgebase` (
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
  `user_id1_c` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledgebase_audit`
--

CREATE TABLE IF NOT EXISTS `aok_knowledgebase_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledgebase_categories`
--

CREATE TABLE IF NOT EXISTS `aok_knowledgebase_categories` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aok_knowledgebase_id` varchar(36) DEFAULT NULL,
  `aok_knowledge_base_categories_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledge_base_categories`
--

CREATE TABLE IF NOT EXISTS `aok_knowledge_base_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledge_base_categories_audit`
--

CREATE TABLE IF NOT EXISTS `aok_knowledge_base_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_events`
--

CREATE TABLE IF NOT EXISTS `aop_case_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_events_audit`
--

CREATE TABLE IF NOT EXISTS `aop_case_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_updates`
--

CREATE TABLE IF NOT EXISTS `aop_case_updates` (
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
  `internal` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_updates_audit`
--

CREATE TABLE IF NOT EXISTS `aop_case_updates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_charts`
--

CREATE TABLE IF NOT EXISTS `aor_charts` (
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
  `y_field` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_conditions`
--

CREATE TABLE IF NOT EXISTS `aor_conditions` (
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
  `parameter` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_fields`
--

CREATE TABLE IF NOT EXISTS `aor_fields` (
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
  `group_display` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_reports`
--

CREATE TABLE IF NOT EXISTS `aor_reports` (
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
  `graphs_per_row` int(11) DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_reports_audit`
--

CREATE TABLE IF NOT EXISTS `aor_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_scheduled_reports`
--

CREATE TABLE IF NOT EXISTS `aor_scheduled_reports` (
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
  `aor_report_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts`
--

CREATE TABLE IF NOT EXISTS `aos_contracts` (
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
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts_audit`
--

CREATE TABLE IF NOT EXISTS `aos_contracts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts_documents`
--

CREATE TABLE IF NOT EXISTS `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_invoices`
--

CREATE TABLE IF NOT EXISTS `aos_invoices` (
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
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_invoices_audit`
--

CREATE TABLE IF NOT EXISTS `aos_invoices_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_line_item_groups`
--

CREATE TABLE IF NOT EXISTS `aos_line_item_groups` (
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
  `currency_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_line_item_groups_audit`
--

CREATE TABLE IF NOT EXISTS `aos_line_item_groups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_pdf_templates`
--

CREATE TABLE IF NOT EXISTS `aos_pdf_templates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` longtext,
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
  `page_size` varchar(100) DEFAULT NULL,
  `orientation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_pdf_templates_audit`
--

CREATE TABLE IF NOT EXISTS `aos_pdf_templates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products`
--

CREATE TABLE IF NOT EXISTS `aos_products` (
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
  `aos_product_category_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_audit`
--

CREATE TABLE IF NOT EXISTS `aos_products_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_quotes`
--

CREATE TABLE IF NOT EXISTS `aos_products_quotes` (
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
  `group_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_quotes_audit`
--

CREATE TABLE IF NOT EXISTS `aos_products_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_product_categories`
--

CREATE TABLE IF NOT EXISTS `aos_product_categories` (
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
  `parent_category_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_product_categories_audit`
--

CREATE TABLE IF NOT EXISTS `aos_product_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes`
--

CREATE TABLE IF NOT EXISTS `aos_quotes` (
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
  `number` int(11) DEFAULT NULL,
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
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_aos_invoices_c`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_audit`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_os_contracts_c`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_project_c`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_actions`
--

CREATE TABLE IF NOT EXISTS `aow_actions` (
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
  `parameters` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_conditions`
--

CREATE TABLE IF NOT EXISTS `aow_conditions` (
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
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_processed`
--

CREATE TABLE IF NOT EXISTS `aow_processed` (
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
  `status` varchar(100) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_processed_aow_actions`
--

CREATE TABLE IF NOT EXISTS `aow_processed_aow_actions` (
  `id` varchar(36) NOT NULL,
  `aow_processed_id` varchar(36) DEFAULT NULL,
  `aow_action_id` varchar(36) DEFAULT NULL,
  `status` varchar(36) DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_workflow`
--

CREATE TABLE IF NOT EXISTS `aow_workflow` (
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
  `multiple_runs` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_workflow_audit`
--

CREATE TABLE IF NOT EXISTS `aow_workflow_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE IF NOT EXISTS `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_audit`
--

CREATE TABLE IF NOT EXISTS `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE IF NOT EXISTS `calls` (
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
  `recurring_source` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_contacts`
--

CREATE TABLE IF NOT EXISTS `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_leads`
--

CREATE TABLE IF NOT EXISTS `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_reschedule`
--

CREATE TABLE IF NOT EXISTS `calls_reschedule` (
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
  `call_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_reschedule_audit`
--

CREATE TABLE IF NOT EXISTS `calls_reschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_users`
--

CREATE TABLE IF NOT EXISTS `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL,
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
  `survey_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_audit`
--

CREATE TABLE IF NOT EXISTS `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_log`
--

CREATE TABLE IF NOT EXISTS `campaign_log` (
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
  `marketing_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_trkrs`
--

CREATE TABLE IF NOT EXISTS `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(255) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE IF NOT EXISTS `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  `state` varchar(100) DEFAULT 'Open',
  `contact_created_by_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_audit`
--

CREATE TABLE IF NOT EXISTS `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_bugs`
--

CREATE TABLE IF NOT EXISTS `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_cstm`
--

CREATE TABLE IF NOT EXISTS `cases_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`category`, `name`, `value`) VALUES
('notify', 'fromaddress', 'do_not_reply@example.com'),
('notify', 'fromname', 'SuiteCRM'),
('notify', 'send_by_default', '1'),
('notify', 'on', '1'),
('notify', 'send_from_assigning_user', '0'),
('info', 'sugar_version', '6.5.25'),
('MySettings', 'tab', 'YTozODp7aTowO3M6NDoiSG9tZSI7aToxO3M6ODoiQWNjb3VudHMiO2k6MjtzOjg6IkNvbnRhY3RzIjtpOjM7czoxMzoiT3Bwb3J0dW5pdGllcyI7aTo0O3M6NToiTGVhZHMiO2k6NTtzOjEwOiJBT1NfUXVvdGVzIjtpOjY7czo4OiJDYWxlbmRhciI7aTo3O3M6OToiRG9jdW1lbnRzIjtpOjg7czo2OiJFbWFpbHMiO2k6OTtzOjU6IlNwb3RzIjtpOjEwO3M6OToiQ2FtcGFpZ25zIjtpOjExO3M6NToiQ2FsbHMiO2k6MTI7czo4OiJNZWV0aW5ncyI7aToxMztzOjU6IlRhc2tzIjtpOjE0O3M6NToiTm90ZXMiO2k6MTU7czoxMjoiQU9TX0ludm9pY2VzIjtpOjE2O3M6MTM6IkFPU19Db250cmFjdHMiO2k6MTc7czo1OiJDYXNlcyI7aToxODtzOjk6IlByb3NwZWN0cyI7aToxOTtzOjEzOiJQcm9zcGVjdExpc3RzIjtpOjIwO3M6NzoiUHJvamVjdCI7aToyMTtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtpOjIyO3M6MTY6IkFNX1Rhc2tUZW1wbGF0ZXMiO2k6MjM7czo5OiJGUF9ldmVudHMiO2k6MjQ7czoxODoiRlBfRXZlbnRfTG9jYXRpb25zIjtpOjI1O3M6MTI6IkFPU19Qcm9kdWN0cyI7aToyNjtzOjIyOiJBT1NfUHJvZHVjdF9DYXRlZ29yaWVzIjtpOjI3O3M6MTc6IkFPU19QREZfVGVtcGxhdGVzIjtpOjI4O3M6OToiamp3Z19NYXBzIjtpOjI5O3M6MTI6Impqd2dfTWFya2VycyI7aTozMDtzOjEwOiJqandnX0FyZWFzIjtpOjMxO3M6MTg6Impqd2dfQWRkcmVzc19DYWNoZSI7aTozMjtzOjExOiJBT1JfUmVwb3J0cyI7aTozMztzOjEyOiJBT1dfV29ya0Zsb3ciO2k6MzQ7czoxNzoiQU9LX0tub3dsZWRnZUJhc2UiO2k6MzU7czoyOToiQU9LX0tub3dsZWRnZV9CYXNlX0NhdGVnb3JpZXMiO2k6MzY7czoxNDoiRW1haWxUZW1wbGF0ZXMiO2k6Mzc7czo3OiJTdXJ2ZXlzIjt9'),
('portal', 'on', '0'),
('tracker', 'Tracker', '1'),
('system', 'skypeout_on', '1'),
('sugarfeed', 'enabled', '1'),
('sugarfeed', 'module_UserFeed', '1'),
('sugarfeed', 'module_Opportunities', '1'),
('sugarfeed', 'module_Leads', '1'),
('sugarfeed', 'module_Contacts', '1'),
('sugarfeed', 'module_Cases', '1'),
('Update', 'CheckUpdates', 'manual'),
('system', 'name', 'SuiteCRM'),
('system', 'adminwizard', '1'),
('notify', 'allow_default_outbound', '0');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
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
  `lawful_basis` text,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
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
  `portal_user_type` varchar(100) DEFAULT 'Single'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_audit`
--

CREATE TABLE IF NOT EXISTS `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_bugs`
--

CREATE TABLE IF NOT EXISTS `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cases`
--

CREATE TABLE IF NOT EXISTS `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cstm`
--

CREATE TABLE IF NOT EXISTS `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_users`
--

CREATE TABLE IF NOT EXISTS `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cron_remove_documents`
--

CREATE TABLE IF NOT EXISTS `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE IF NOT EXISTS `custom_fields` (
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
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
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
  `template_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_accounts`
--

CREATE TABLE IF NOT EXISTS `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_bugs`
--

CREATE TABLE IF NOT EXISTS `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_cases`
--

CREATE TABLE IF NOT EXISTS `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_contacts`
--

CREATE TABLE IF NOT EXISTS `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_opportunities`
--

CREATE TABLE IF NOT EXISTS `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document_revisions`
--

CREATE TABLE IF NOT EXISTS `document_revisions` (
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
  `date_modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eapm`
--

CREATE TABLE IF NOT EXISTS `eapm` (
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
  `validated` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emailman`
--

CREATE TABLE IF NOT EXISTS `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL,
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
  `related_confirm_opt_in` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `orphaned` tinyint(1) DEFAULT NULL,
  `last_synced` datetime DEFAULT NULL,
  `date_sent_received` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_beans`
--

CREATE TABLE IF NOT EXISTS `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_email_addr_rel`
--

CREATE TABLE IF NOT EXISTS `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_text`
--

CREATE TABLE IF NOT EXISTS `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses`
--

CREATE TABLE IF NOT EXISTS `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `confirm_opt_in` varchar(255) DEFAULT 'not-opt-in',
  `confirm_opt_in_date` datetime DEFAULT NULL,
  `confirm_opt_in_sent_date` datetime DEFAULT NULL,
  `confirm_opt_in_fail_date` datetime DEFAULT NULL,
  `confirm_opt_in_token` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses_audit`
--

CREATE TABLE IF NOT EXISTS `email_addresses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_addr_bean_rel`
--

CREATE TABLE IF NOT EXISTS `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_cache`
--

CREATE TABLE IF NOT EXISTS `email_cache` (
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
  `draft` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing`
--

CREATE TABLE IF NOT EXISTS `email_marketing` (
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
  `all_prospect_lists` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing_prospect_lists`
--

CREATE TABLE IF NOT EXISTS `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` longtext,
  `body_html` longtext,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `published`, `name`, `description`, `subject`, `body`, `body_html`, `deleted`, `assigned_user_id`, `text_only`, `type`) VALUES
('4573cb2a-f2e7-a26e-737a-5de4ce47fa3c', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'off', 'System-generated password email', 'This template is used when the System Administrator sends a new password to a user.', 'New account information', '\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.', '<div><table width="550"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, 'system'),
('49d9b515-f459-7c70-3119-5de4ce1efcea', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'off', 'Forgot Password email', 'This template is used to send a user a link to click to reset the user''s account password.', 'Reset your account password', '\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid', '<div><table width="550"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, 'system'),
('4dd1f27c-3598-60e0-bc18-5de4ce08d766', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'off', 'Two Factor Authentication email', 'This template is used to send a user a code for Two Factor Authentication.', 'Two Factor Authentication Code', 'Two Factor Authentication code is $code.', '<div><table width="550"><tbody><tr><td><p>Two Factor Authentication code is <b>$code</b>.</p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, 'system'),
('8869ff02-143b-217f-b7ed-5de4ce415d94', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'off', 'Case Closure', 'Template for informing a contact that their case has been closed.', '$acase_name [CASE:$acase_case_number] closed', 'Hi $contact_first_name $contact_last_name,\n\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\n					   Status:				$acase_status\n					   Reference:			$acase_case_number\n					   Resolution:			$acase_resolution', '<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\n					    <table border="0"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Resolution</td><td>$acase_resolution</td></tr></tbody></table>', 0, NULL, NULL, 'system'),
('8d18c4e5-fadd-d90b-d283-5de4cefab0a5', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'off', 'Joomla Account Creation', 'Template used when informing a contact that they''ve been given an account on the joomla portal.', 'Support Portal Account Created', 'Hi $contact_name,\n					   An account has been created for you at $portal_address.\n					   You may login using this email address and the password $joomla_pass', '<p>Hi $contact_name,</p>\n					    <p>An account has been created for you at <a href="$portal_address">$portal_address</a>.</p>\n					    <p>You may login using this email address and the password $joomla_pass</p>', 0, NULL, NULL, 'system'),
('94157d18-dcea-fbad-5127-5de4ced9c999', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'off', 'Confirmed Opt In', 'Email template to send to a contact to confirm they have opted in.', 'Confirm Opt In', 'Hi $contact_first_name $contact_last_name, \\n Please confirm that you have opted in by selecting the following link: $sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_email_address', '<p>Hi $contact_first_name $contact_last_name,</p>\n             <p>\n                Please confirm that you have opted in by selecting the following link:\n                <a href="$sugarurl/index.php?entryPoint=ConfirmOptIn&from=$emailaddress_confirm_opt_in_token">Opt In</a>\n             </p>', 0, NULL, NULL, 'system'),
('9c462706-c412-4f0c-40f0-5de4ce9f18f5', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'off', 'Case Creation', 'Template to send to a contact when a case is received from them.', '$acase_name [CASE:$acase_case_number]', 'Hi $contact_first_name $contact_last_name,\n\n					   We''ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\n					   Status:		$acase_status\n					   Reference:	$acase_case_number\n					   Description:	$acase_description', '<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>We''ve received your case $acase_name (# $acase_case_number) on $acase_date_entered</p>\n					    <table border="0"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Description</td><td>$acase_description</td></tr></tbody></table>', 0, NULL, NULL, 'system'),
('a78b8c40-17b3-858c-9d4c-5de4ce16a62b', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'off', 'Contact Case Update', 'Template to send to a contact when their case is updated.', '$acase_name update [CASE:$acase_case_number]', 'Hi $user_first_name $user_last_name,\n\n					   You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description', '<p>Hi $contact_first_name $contact_last_name,</p>\n					    <p> </p>\n					    <p>You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\n					    <p style="padding-left:30px;">$aop_case_updates_description</p>', 0, NULL, NULL, 'system'),
('ac5d8ea3-239f-9828-e5c7-5de4ce50d560', '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'off', 'User Case Update', 'Email template to send to a Sugar user when their case is updated.', '$acase_name (# $acase_case_number) update', 'Hi $user_first_name $user_last_name,\n\n					   You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description\n                        You may review this Case at:\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;', '<p>Hi $user_first_name $user_last_name,</p>\n					     <p> </p>\n					     <p>You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					     <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\n					     <p style="padding-left:30px;">$aop_case_updates_description</p>\n					     <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>', 0, NULL, NULL, 'system'),
('b5697228-5bd0-0cb9-e03d-5de4ce1afd78', '2013-05-24 14:31:45', '2019-12-02 08:42:54', '1', '1', 'off', 'Event Invite Template', 'Default event invite template.', 'You have been invited to $fp_events_name', 'Dear $contact_name,\nYou have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end\n$fp_events_description\nYours Sincerely,\n', '\n<p>Dear $contact_name,</p>\n<p>You have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end</p>\n<p>$fp_events_description</p>\n<p>If you would like to accept this invititation please click accept.</p>\n<p> $fp_events_link or $fp_events_link_declined</p>\n<p>Yours Sincerely,</p>\n', 0, NULL, NULL, 'system');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE IF NOT EXISTS `favorites` (
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
  `parent_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fields_meta_data`
--

CREATE TABLE IF NOT EXISTS `fields_meta_data` (
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
  `ext4` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields_meta_data`
--

INSERT INTO `fields_meta_data` (`id`, `name`, `vname`, `comments`, `help`, `custom_module`, `type`, `len`, `required`, `default_value`, `date_modified`, `deleted`, `audited`, `massupdate`, `duplicate_merge`, `reportable`, `importable`, `ext1`, `ext2`, `ext3`, `ext4`) VALUES
('Accountsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Accounts', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Accountsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Accounts', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Accountsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Accounts', 'float', 10, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Accountsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Accounts', 'float', 11, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Casesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Cases', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Casesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Cases', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Casesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Cases', 'float', 10, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Casesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Cases', 'float', 11, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Contactsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Contacts', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Contactsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Contacts', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Contactsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Contacts', 'float', 10, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Contactsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Contacts', 'float', 11, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Leadsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Leads', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Leadsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Leads', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Leadsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Leads', 'float', 10, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Leadsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Leads', 'float', 11, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Meetingsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Meetings', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Meetingsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Meetings', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Meetingsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Meetings', 'float', 10, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Meetingsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Meetings', 'float', 11, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Opportunitiesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Opportunities', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Opportunitiesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Opportunities', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Opportunitiesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Opportunities', 'float', 10, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Opportunitiesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Opportunities', 'float', 11, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Projectjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Project', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Projectjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Project', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Projectjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Project', 'float', 10, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Projectjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Project', 'float', 11, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Prospectsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Prospects', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Prospectsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Prospects', 'varchar', 255, 0, NULL, '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Prospectsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Prospects', 'float', 10, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Prospectsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Prospects', 'float', 11, 0, '0.00000000', '2019-12-02 08:42:54', 0, 0, 0, 0, 1, 'true', '8', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_rel`
--

CREATE TABLE IF NOT EXISTS `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_subscriptions`
--

CREATE TABLE IF NOT EXISTS `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events`
--

CREATE TABLE IF NOT EXISTS `fp_events` (
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
  `activity_status_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_audit`
--

CREATE TABLE IF NOT EXISTS `fp_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_contacts_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_contactsfp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_fp_event_delegates_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_fp_event_locations_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_leads_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_leads_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_prospects_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_prospects_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_prospects_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations`
--

CREATE TABLE IF NOT EXISTS `fp_event_locations` (
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
  `capacity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations_audit`
--

CREATE TABLE IF NOT EXISTS `fp_event_locations_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations_fp_events_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `import_maps`
--

CREATE TABLE IF NOT EXISTS `import_maps` (
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
  `is_published` varchar(3) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email`
--

CREATE TABLE IF NOT EXISTS `inbound_email` (
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
  `groupfolder_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_autoreply`
--

CREATE TABLE IF NOT EXISTS `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_cache_ts`
--

CREATE TABLE IF NOT EXISTS `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_address_cache`
--

CREATE TABLE IF NOT EXISTS `jjwg_address_cache` (
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
  `lng` float(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_address_cache_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_address_cache_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_areas`
--

CREATE TABLE IF NOT EXISTS `jjwg_areas` (
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
  `coordinates` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_areas_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_areas_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps` (
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
  `parent_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_jjwg_areas_c`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_jjwg_markers_c`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_markers`
--

CREATE TABLE IF NOT EXISTS `jjwg_markers` (
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
  `marker_image` varchar(100) DEFAULT 'company'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_markers_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_markers_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_queue`
--

CREATE TABLE IF NOT EXISTS `job_queue` (
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
  `percent_complete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE IF NOT EXISTS `leads` (
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
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
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
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads_audit`
--

CREATE TABLE IF NOT EXISTS `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads_cstm`
--

CREATE TABLE IF NOT EXISTS `leads_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linked_documents`
--

CREATE TABLE IF NOT EXISTS `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE IF NOT EXISTS `meetings` (
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
  `gsync_id` varchar(1024) DEFAULT NULL,
  `gsync_lastsync` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_contacts`
--

CREATE TABLE IF NOT EXISTS `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_cstm`
--

CREATE TABLE IF NOT EXISTS `meetings_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_leads`
--

CREATE TABLE IF NOT EXISTS `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_users`
--

CREATE TABLE IF NOT EXISTS `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
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
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth2clients`
--

CREATE TABLE IF NOT EXISTS `oauth2clients` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `secret` varchar(4000) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `is_confidential` tinyint(1) DEFAULT '1',
  `allowed_grant_type` varchar(255) DEFAULT 'password',
  `duration_value` int(11) DEFAULT NULL,
  `duration_amount` int(11) DEFAULT NULL,
  `duration_unit` varchar(255) DEFAULT 'Duration Unit',
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth2tokens`
--

CREATE TABLE IF NOT EXISTS `oauth2tokens` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `token_is_revoked` tinyint(1) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `access_token_expires` datetime DEFAULT NULL,
  `access_token` varchar(4000) DEFAULT NULL,
  `refresh_token` varchar(4000) DEFAULT NULL,
  `refresh_token_expires` datetime DEFAULT NULL,
  `grant_type` varchar(255) DEFAULT NULL,
  `state` varchar(1024) DEFAULT NULL,
  `client` char(36) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE IF NOT EXISTS `oauth_consumer` (
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
  `c_secret` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE IF NOT EXISTS `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities`
--

CREATE TABLE IF NOT EXISTS `opportunities` (
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
  `probability` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_audit`
--

CREATE TABLE IF NOT EXISTS `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_contacts`
--

CREATE TABLE IF NOT EXISTS `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_cstm`
--

CREATE TABLE IF NOT EXISTS `opportunities_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outbound_email`
--

CREATE TABLE IF NOT EXISTS `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `smtp_from_name` varchar(255) DEFAULT NULL,
  `smtp_from_addr` varchar(255) DEFAULT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` varchar(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` varchar(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbound_email`
--

INSERT INTO `outbound_email` (`id`, `name`, `type`, `user_id`, `smtp_from_name`, `smtp_from_addr`, `mail_sendtype`, `mail_smtptype`, `mail_smtpserver`, `mail_smtpport`, `mail_smtpuser`, `mail_smtppass`, `mail_smtpauth_req`, `mail_smtpssl`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `deleted`, `assigned_user_id`) VALUES
('11d759ce-c4ad-6758-a79c-5de4ce5eecc4', 'system', 'system', '1', NULL, NULL, 'SMTP', 'other', '', '25', '', '', 1, '0', NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `outbound_email_audit`
--

CREATE TABLE IF NOT EXISTS `outbound_email_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
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
  `override_business_hours` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_accounts`
--

CREATE TABLE IF NOT EXISTS `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_bugs`
--

CREATE TABLE IF NOT EXISTS `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_cases`
--

CREATE TABLE IF NOT EXISTS `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_contacts`
--

CREATE TABLE IF NOT EXISTS `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_opportunities`
--

CREATE TABLE IF NOT EXISTS `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_products`
--

CREATE TABLE IF NOT EXISTS `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_contacts_1_c`
--

CREATE TABLE IF NOT EXISTS `project_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_contacts_1project_ida` varchar(36) DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_cstm`
--

CREATE TABLE IF NOT EXISTS `project_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task`
--

CREATE TABLE IF NOT EXISTS `project_task` (
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
  `utilization` int(11) DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task_audit`
--

CREATE TABLE IF NOT EXISTS `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_users_1_c`
--

CREATE TABLE IF NOT EXISTS `project_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_users_1project_ida` varchar(36) DEFAULT NULL,
  `project_users_1users_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospects`
--

CREATE TABLE IF NOT EXISTS `prospects` (
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
  `lawful_basis` text,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
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
  `tracker_key` int(11) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospects_cstm`
--

CREATE TABLE IF NOT EXISTS `prospects_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists`
--

CREATE TABLE IF NOT EXISTS `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists_prospects`
--

CREATE TABLE IF NOT EXISTS `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_list_campaigns`
--

CREATE TABLE IF NOT EXISTS `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE IF NOT EXISTS `relationships` (
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
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('10112648-07e8-fca6-50ab-5de4cead1da9', 'aow_processed_modified_user', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('105d3150-a18d-a1f3-9f8a-5de4ce4edb10', 'aow_processed_created_by', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('10b77910-8802-52ad-a229-5de4ce05d562', 'aow_conditions_modified_user', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('10ea68db-0687-f22a-d672-5de4ce2f9a9a', 'aow_conditions_created_by', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('112b0fcc-231f-008e-56b6-5de4ce57bb13', 'aor_fields_created_by', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('118fec47-59e3-da7c-2cc0-5de4ce4e704b', 'jjwg_maps_modified_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('11bb35f2-c3b7-3593-a84a-5de4ce95ded3', 'jjwg_maps_created_by', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('11dfe467-f7e7-ba6e-2280-5de4ce461e54', 'jjwg_maps_assigned_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('120752ec-cbe4-d750-a328-5de4ce8a970f', 'securitygroups_jjwg_maps', 'SecurityGroups', 'securitygroups', 'id', 'jjwg_Maps', 'jjwg_maps', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'jjwg_Maps', 0, 0),
('122ffff5-abdc-20de-4eaa-5de4ce93396b', 'jjwg_Maps_accounts', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Accounts', 'accounts', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('1256be09-e6e9-6356-b69b-5de4ce099fe9', 'jjwg_Maps_contacts', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('127e03b8-295a-af39-5a0d-5de4ce1c9059', 'jjwg_Maps_leads', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('12c47941-16de-8f17-a0eb-5de4ce51f9d2', 'jjwg_Maps_opportunities', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('12edcf7e-0941-a31f-2e30-5de4cead21b6', 'jjwg_Maps_cases', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Cases', 'cases', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('1314df41-e240-9f44-91ae-5de4ce82d9b8', 'jjwg_Maps_projects', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Project', 'project', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('133e5b8f-ea72-2018-3d0e-5de4ce7e292a', 'jjwg_Maps_meetings', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Meetings', 'meetings', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('13672120-da4b-6f7f-c7cc-5de4ce02ab65', 'jjwg_Maps_prospects', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Prospects', 'prospects', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('13f53e96-6f52-cb0e-cacf-5de4cedcad56', 'jjwg_markers_modified_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('141bfae0-49d6-2074-d309-5de4ce9391ff', 'jjwg_markers_created_by', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('143e7617-cdfe-0282-13a2-5de4ce02d677', 'jjwg_markers_assigned_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('146447a6-bdb4-878b-9406-5de4ce93e922', 'securitygroups_jjwg_markers', 'SecurityGroups', 'securitygroups', 'id', 'jjwg_Markers', 'jjwg_markers', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'jjwg_Markers', 0, 0),
('14f61d8a-6594-69d7-adbd-5de4ce01ef4f', 'jjwg_areas_modified_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('153d5338-a8f7-9a35-f080-5de4ce7d1747', 'jjwg_areas_created_by', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1565460f-a101-ff55-33e0-5de4cee96531', 'jjwg_areas_assigned_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('158e4ebb-51e0-f307-a932-5de4cee5bc24', 'securitygroups_jjwg_areas', 'SecurityGroups', 'securitygroups', 'id', 'jjwg_Areas', 'jjwg_areas', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'jjwg_Areas', 0, 0),
('15db09be-79b0-0ec4-b256-5de4ce759027', 'aor_charts_modified_user', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1613a02a-f2c9-03ad-2759-5de4cee546bf', 'jjwg_address_cache_modified_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('163d9641-a222-3635-73f9-5de4cefa8331', 'jjwg_address_cache_created_by', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('16622005-9b99-d21a-bb4b-5de4ce8f45a9', 'jjwg_address_cache_assigned_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('16b74915-3565-4998-2a46-5de4ce6e1bd6', 'calls_reschedule_modified_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('16df8602-c803-49ef-3474-5de4ce50b3f3', 'calls_reschedule_created_by', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1705cb7b-f7c7-d368-0e51-5de4cef47796', 'calls_reschedule_assigned_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('17d3d946-59f3-145c-00cf-5de4ce0e33d3', 'securitygroups_modified_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('18590b3a-cdf8-903a-ebfd-5de4ce9d90f5', 'aor_charts_created_by', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1876f278-56e4-cd73-9bbf-5de4ce31b4d6', 'securitygroups_created_by', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('194b92b8-aa02-afdc-5dc4-5de4ce7e43fd', 'securitygroups_assigned_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('19aa1953-f831-c9f1-f318-5de4ce5698de', 'outbound_email_modified_user', 'Users', 'users', 'id', 'OutboundEmailAccounts', 'outbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('19d7cd46-bcd4-0355-a6d3-5de4ce392353', 'outbound_email_created_by', 'Users', 'users', 'id', 'OutboundEmailAccounts', 'outbound_email', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1a038efd-8848-02a0-f7b4-5de4cec929fe', 'outbound_email_assigned_user', 'Users', 'users', 'id', 'OutboundEmailAccounts', 'outbound_email', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1a6c6b25-4b53-05ec-95f5-5de4ce161e85', 'templatesectionline_modified_user', 'Users', 'users', 'id', 'TemplateSectionLine', 'templatesectionline', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1a93db79-045f-b9f2-4d47-5de4ce149b1d', 'templatesectionline_created_by', 'Users', 'users', 'id', 'TemplateSectionLine', 'templatesectionline', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1a940e3e-3cde-63dc-0d47-5de4ce0d8b01', 'aor_charts_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Charts', 'aor_charts', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1aebdb4b-be55-0cc5-f736-5de4ce532fe2', 'oauth2tokens_modified_user', 'Users', 'users', 'id', 'OAuth2Tokens', 'oauth2tokens', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1b0c6fcc-da69-0a82-b45a-5de4cefad7e6', 'oauth2tokens_created_by', 'Users', 'users', 'id', 'OAuth2Tokens', 'oauth2tokens', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1b3be414-96e6-4198-b658-5de4cef66fc0', 'oauth2tokens_assigned_user', 'Users', 'users', 'id', 'OAuth2Tokens', 'oauth2tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1b9805a3-b3ac-d839-468b-5de4ce5f1e13', 'oauth2clients_modified_user', 'Users', 'users', 'id', 'OAuth2Clients', 'oauth2clients', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1c2e905f-d447-acc8-5bd6-5de4cedaa64b', 'oauth2clients_created_by', 'Users', 'users', 'id', 'OAuth2Clients', 'oauth2clients', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1cb1099f-2fb5-99d2-dc15-5de4ceb514f9', 'oauth2clients_oauth2tokens', 'OAuth2Clients', 'oauth2clients', 'id', 'OAuth2Tokens', 'oauth2tokens', 'client', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1d11bb0f-d2a7-b87e-8e10-5de4ce91ab9f', 'oauth2clients_assigned_user', 'Users', 'users', 'id', 'OAuth2Clients', 'oauth2clients', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1db3e46a-a190-14fa-ab51-5de4ce755e52', 'surveyresponses_modified_user', 'Users', 'users', 'id', 'SurveyResponses', 'surveyresponses', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1de168f1-6a91-7ab2-4081-5de4cea8ba92', 'surveyresponses_created_by', 'Users', 'users', 'id', 'SurveyResponses', 'surveyresponses', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1e036dee-abd0-899b-9a01-5de4ced48d21', 'surveyresponses_assigned_user', 'Users', 'users', 'id', 'SurveyResponses', 'surveyresponses', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1e244656-b2ff-1e19-1a41-5de4ce8deee9', 'securitygroups_surveyresponses', 'SecurityGroups', 'securitygroups', 'id', 'SurveyResponses', 'surveyresponses', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'SurveyResponses', 0, 0),
('1e679ccf-0842-3785-50a5-5de4cea30294', 'surveyresponses_surveyquestionresponses', 'SurveyResponses', 'surveyresponses', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'surveyresponse_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1eee2af7-764b-41e8-b0bf-5de4cef0651d', 'surveys_modified_user', 'Users', 'users', 'id', 'Surveys', 'surveys', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1f1559e9-00f1-c48e-2c28-5de4ce0ddadd', 'surveys_created_by', 'Users', 'users', 'id', 'Surveys', 'surveys', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1f360471-45bb-17b3-bf53-5de4ce1c0e30', 'surveys_assigned_user', 'Users', 'users', 'id', 'Surveys', 'surveys', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1f5416d0-ef78-461a-8a74-5de4ceb8f3cb', 'securitygroups_surveys', 'SecurityGroups', 'securitygroups', 'id', 'Surveys', 'surveys', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Surveys', 0, 0),
('1f730956-0ec4-a606-73e8-5de4ced625f8', 'surveys_surveyquestions', 'Surveys', 'surveys', 'id', 'SurveyQuestions', 'surveyquestions', 'survey_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1f942737-fbf5-e1c5-0979-5de4ce7cf036', 'surveys_surveyresponses', 'Surveys', 'surveys', 'id', 'SurveyResponses', 'surveyresponses', 'survey_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1fb2e1be-c0f0-6674-12f5-5de4ce37226e', 'surveys_campaigns', 'Surveys', 'surveys', 'id', 'Campaigns', 'campaigns', 'survey_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1fef0345-67db-4800-15de-5de4ce4d3b64', 'aor_conditions_modified_user', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('200fe389-a734-033f-0f97-5de4ce30545e', 'surveyquestionresponses_modified_user', 'Users', 'users', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2031b50f-f46f-3192-f082-5de4cec8c492', 'surveyquestionresponses_created_by', 'Users', 'users', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('205f8495-d0cb-1a3f-8d39-5de4cea7a5ee', 'surveyquestionresponses_assigned_user', 'Users', 'users', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('208147be-537b-1e8f-8974-5de4ce92d93e', 'securitygroups_surveyquestionresponses', 'SecurityGroups', 'securitygroups', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'SurveyQuestionResponses', 0, 0),
('20d45d40-62ce-4d8f-c618-5de4ceccbd12', 'surveyquestions_modified_user', 'Users', 'users', 'id', 'SurveyQuestions', 'surveyquestions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('20e00d10-eb5e-d1ef-46b8-5de4cef035ba', 'aor_reports_aor_fields', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Fields', 'aor_fields', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('21263b07-76dc-cee8-9ada-5de4cec175cd', 'surveyquestions_created_by', 'Users', 'users', 'id', 'SurveyQuestions', 'surveyquestions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2195cf65-00d9-ba7c-0966-5de4cead8437', 'surveyquestions_assigned_user', 'Users', 'users', 'id', 'SurveyQuestions', 'surveyquestions', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('21b9ae54-2ebe-a432-8cc9-5de4ce4913da', 'securitygroups_surveyquestions', 'SecurityGroups', 'securitygroups', 'id', 'SurveyQuestions', 'surveyquestions', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'SurveyQuestions', 0, 0),
('21dabc2f-ba6a-2da3-7c29-5de4ce4222f4', 'surveyquestions_surveyquestionoptions', 'SurveyQuestions', 'surveyquestions', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'survey_question_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('222e69f9-8813-07ed-c002-5de4cede66c4', 'surveyquestionoptions_modified_user', 'Users', 'users', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2253a40d-ccd8-d706-5dfd-5de4cec77c72', 'surveyquestionoptions_created_by', 'Users', 'users', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('228000e0-a591-1a6d-3391-5de4ce543a5d', 'aor_conditions_created_by', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('228715d6-4845-24b0-b97c-5de4ce8185e1', 'surveyquestionoptions_assigned_user', 'Users', 'users', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('22a54b05-7fd9-1e03-3a36-5de4cedfdbd9', 'securitygroups_surveyquestionoptions', 'SecurityGroups', 'securitygroups', 'id', 'SurveyQuestionOptions', 'surveyquestionoptions', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'SurveyQuestionOptions', 0, 0),
('24b8f4ed-bda7-e1b1-1a2a-5de4ce632fb8', 'accounts_bugs', 'Accounts', 'accounts', 'id', 'Bugs', 'bugs', 'id', 'accounts_bugs', 'account_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('24e86dcc-ab0e-6f2d-b28f-5de4cec9870e', 'accounts_contacts', 'Accounts', 'accounts', 'id', 'Contacts', 'contacts', 'id', 'accounts_contacts', 'account_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('2514a1b2-9170-d57d-ca30-5de4ce1938c9', 'accounts_opportunities', 'Accounts', 'accounts', 'id', 'Opportunities', 'opportunities', 'id', 'accounts_opportunities', 'account_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('25561416-d565-0603-e789-5de4ce4a3746', 'calls_contacts', 'Calls', 'calls', 'id', 'Contacts', 'contacts', 'id', 'calls_contacts', 'call_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('258e5829-0e0d-fba1-695c-5de4ce4a9d0b', 'calls_users', 'Calls', 'calls', 'id', 'Users', 'users', 'id', 'calls_users', 'call_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('25b81ac1-e935-0178-328c-5de4cef7908f', 'calls_leads', 'Calls', 'calls', 'id', 'Leads', 'leads', 'id', 'calls_leads', 'call_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('25e5682a-6b24-8395-2746-5de4ce109a04', 'cases_bugs', 'Cases', 'cases', 'id', 'Bugs', 'bugs', 'id', 'cases_bugs', 'case_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('261691ab-7e93-60b8-7d5c-5de4ce5b0593', 'contacts_bugs', 'Contacts', 'contacts', 'id', 'Bugs', 'bugs', 'id', 'contacts_bugs', 'contact_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('2664c218-048a-6f3e-0f27-5de4cef1e96b', 'contacts_cases', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'id', 'contacts_cases', 'contact_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('26935dad-c305-f306-ec8a-5de4ce5bbf70', 'contacts_users', 'Contacts', 'contacts', 'id', 'Users', 'users', 'id', 'contacts_users', 'contact_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('26caa093-25a5-be0b-a634-5de4ce488798', 'emails_bugs_rel', 'Emails', 'emails', 'id', 'Bugs', 'bugs', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Bugs', 0, 0),
('26f3fe19-0c78-089c-b6a5-5de4ce6fa92b', 'emails_cases_rel', 'Emails', 'emails', 'id', 'Cases', 'cases', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Cases', 0, 0),
('27340813-06db-43bd-c6c4-5de4ce0749ba', 'emails_opportunities_rel', 'Emails', 'emails', 'id', 'Opportunities', 'opportunities', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Opportunities', 0, 0),
('275c3ed6-ec70-7501-d713-5de4cea4e3aa', 'emails_tasks_rel', 'Emails', 'emails', 'id', 'Tasks', 'tasks', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Tasks', 0, 0),
('2783c885-4347-c173-4960-5de4ce797713', 'emails_users_rel', 'Emails', 'emails', 'id', 'Users', 'users', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('27adb5e8-5a4a-a9b9-0530-5de4ce40ecc6', 'emails_project_task_rel', 'Emails', 'emails', 'id', 'ProjectTask', 'project_task', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'ProjectTask', 0, 0),
('27db3312-e39e-3c1d-01e5-5de4ce57043e', 'emails_projects_rel', 'Emails', 'emails', 'id', 'Project', 'project', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Project', 0, 0),
('27ef0ef8-0bc0-d79d-84c6-5de4ce1f1506', 'aor_scheduled_reports_modified_user', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2808547c-f9ee-379c-ae41-5de4ceeb9ba1', 'emails_prospects_rel', 'Emails', 'emails', 'id', 'Prospects', 'prospects', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('285101b6-1467-4eb3-3b60-5de4ce45e333', 'meetings_contacts', 'Meetings', 'meetings', 'id', 'Contacts', 'contacts', 'id', 'meetings_contacts', 'meeting_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('287b7dae-9c0b-d6bc-52b0-5de4ceed58ff', 'meetings_users', 'Meetings', 'meetings', 'id', 'Users', 'users', 'id', 'meetings_users', 'meeting_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('28a25b5d-b171-2448-78eb-5de4ceb8df68', 'meetings_leads', 'Meetings', 'meetings', 'id', 'Leads', 'leads', 'id', 'meetings_leads', 'meeting_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('28cb9672-1d48-f8e5-f966-5de4cecd7abc', 'opportunities_contacts', 'Opportunities', 'opportunities', 'id', 'Contacts', 'contacts', 'id', 'opportunities_contacts', 'opportunity_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('28fea4aa-c0a8-8492-9306-5de4ced2ff2c', 'prospect_list_campaigns', 'ProspectLists', 'prospect_lists', 'id', 'Campaigns', 'campaigns', 'id', 'prospect_list_campaigns', 'prospect_list_id', 'campaign_id', 'many-to-many', NULL, NULL, 0, 0),
('292a8c48-0960-e267-afca-5de4ce8217ad', 'prospect_list_contacts', 'ProspectLists', 'prospect_lists', 'id', 'Contacts', 'contacts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Contacts', 0, 0),
('296058b9-6b8d-d419-3783-5de4ce3af1ac', 'prospect_list_prospects', 'ProspectLists', 'prospect_lists', 'id', 'Prospects', 'prospects', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Prospects', 0, 0),
('2991b9e7-6dac-f096-03fa-5de4cec7ffde', 'prospect_list_leads', 'ProspectLists', 'prospect_lists', 'id', 'Leads', 'leads', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Leads', 0, 0),
('29bc45eb-a517-e9ba-5a2a-5de4ce3d8f40', 'prospect_list_users', 'ProspectLists', 'prospect_lists', 'id', 'Users', 'users', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Users', 0, 0),
('2a036591-6b59-1899-efeb-5de4ce42cf86', 'prospect_list_accounts', 'ProspectLists', 'prospect_lists', 'id', 'Accounts', 'accounts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Accounts', 0, 0),
('2a2f676e-6ac1-8e0a-2cc9-5de4cec859ed', 'roles_users', 'Roles', 'roles', 'id', 'Users', 'users', 'id', 'roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('2a590851-8767-94d6-bc99-5de4cedd276c', 'projects_bugs', 'Project', 'project', 'id', 'Bugs', 'bugs', 'id', 'projects_bugs', 'project_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('2a82bc72-b4f7-793c-6592-5de4cefd2ad4', 'projects_cases', 'Project', 'project', 'id', 'Cases', 'cases', 'id', 'projects_cases', 'project_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('2aada265-a5e9-aca3-f52c-5de4ce964976', 'projects_accounts', 'Project', 'project', 'id', 'Accounts', 'accounts', 'id', 'projects_accounts', 'project_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('2ad8bd9c-f8a7-7373-5afd-5de4ceb609d7', 'projects_contacts', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'projects_contacts', 'project_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('2b030031-cff6-686a-4cb7-5de4ce7adfa1', 'projects_opportunities', 'Project', 'project', 'id', 'Opportunities', 'opportunities', 'id', 'projects_opportunities', 'project_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('2b2aa740-0745-da39-1fd0-5de4cec59eb3', 'acl_roles_actions', 'ACLRoles', 'acl_roles', 'id', 'ACLActions', 'acl_actions', 'id', 'acl_roles_actions', 'role_id', 'action_id', 'many-to-many', NULL, NULL, 0, 0),
('2b795380-f311-ca7a-315c-5de4ce479595', 'acl_roles_users', 'ACLRoles', 'acl_roles', 'id', 'Users', 'users', 'id', 'acl_roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('2ba60860-6cd2-aae3-d164-5de4ce5bd97e', 'email_marketing_prospect_lists', 'EmailMarketing', 'email_marketing', 'id', 'ProspectLists', 'prospect_lists', 'id', 'email_marketing_prospect_lists', 'email_marketing_id', 'prospect_list_id', 'many-to-many', NULL, NULL, 0, 0),
('2bcdff0b-5e12-da25-bf92-5de4ce8db09d', 'leads_documents', 'Leads', 'leads', 'id', 'Documents', 'documents', 'id', 'linked_documents', 'parent_id', 'document_id', 'many-to-many', 'parent_type', 'Leads', 0, 0),
('2bd701e5-183a-7690-2367-5de4cee3e82b', 'aor_scheduled_reports_created_by', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2c070afc-a404-5147-68aa-5de4cee731db', 'documents_accounts', 'Documents', 'documents', 'id', 'Accounts', 'accounts', 'id', 'documents_accounts', 'document_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('2c2c2366-cef5-6127-39bb-5de4ce0012d8', 'documents_contacts', 'Documents', 'documents', 'id', 'Contacts', 'contacts', 'id', 'documents_contacts', 'document_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('2c5b4e05-eba8-6f36-f189-5de4cea7aa33', 'documents_opportunities', 'Documents', 'documents', 'id', 'Opportunities', 'opportunities', 'id', 'documents_opportunities', 'document_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('2c896e88-84a9-29e9-1213-5de4cef674be', 'documents_cases', 'Documents', 'documents', 'id', 'Cases', 'cases', 'id', 'documents_cases', 'document_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('2cc0d112-b6cb-a3e8-726a-5de4cee451a4', 'documents_bugs', 'Documents', 'documents', 'id', 'Bugs', 'bugs', 'id', 'documents_bugs', 'document_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('2ceb1b10-7f48-f288-1d1f-5de4ce67f344', 'aok_knowledgebase_categories', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'id', 'aok_knowledgebase_categories', 'aok_knowledgebase_id', 'aok_knowledge_base_categories_id', 'many-to-many', NULL, NULL, 0, 0),
('2d1a7767-327e-54df-0b35-5de4ced5cbab', 'am_projecttemplates_project_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Project', 'project', 'id', 'am_projecttemplates_project_1_c', 'am_projecttemplates_project_1am_projecttemplates_ida', 'am_projecttemplates_project_1project_idb', 'many-to-many', NULL, NULL, 0, 0),
('2d48c591-a94f-1302-0dd5-5de4ceb7a285', 'am_projecttemplates_contacts_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Contacts', 'contacts', 'id', 'am_projecttemplates_contacts_1_c', 'am_projecttemplates_ida', 'contacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('2d7964e5-ac14-dc6a-8037-5de4ce6dc616', 'am_projecttemplates_users_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Users', 'users', 'id', 'am_projecttemplates_users_1_c', 'am_projecttemplates_ida', 'users_idb', 'many-to-many', NULL, NULL, 0, 0),
('2dc69da0-4476-d950-7d4d-5de4ce0d0c44', 'am_tasktemplates_am_projecttemplates', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'id', 'am_tasktemplates_am_projecttemplates_c', 'am_tasktemplates_am_projecttemplatesam_projecttemplates_ida', 'am_tasktemplates_am_projecttemplatesam_tasktemplates_idb', 'many-to-many', NULL, NULL, 0, 0),
('2dff42c0-0cfd-adf0-11a3-5de4cecbd7dc', 'aos_contracts_documents', 'AOS_Contracts', 'aos_contracts', 'id', 'Documents', 'documents', 'id', 'aos_contracts_documents', 'aos_contracts_id', 'documents_id', 'many-to-many', NULL, NULL, 0, 0),
('2e27c2c5-37d2-b3ec-f87e-5de4cede4f04', 'aos_quotes_aos_contracts', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'aos_quotes_os_contracts_c', 'aos_quotese81e_quotes_ida', 'aos_quotes4dc0ntracts_idb', 'many-to-many', NULL, NULL, 0, 0),
('2e4e00c0-7382-0253-078f-5de4ce3b2bbb', 'securitygroups_aor_scheduled_reports', 'SecurityGroups', 'securitygroups', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOR_Scheduled_Reports', 0, 0),
('2e4f0917-890d-d991-898d-5de4cee17575', 'aos_quotes_aos_invoices', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Invoices', 'aos_invoices', 'id', 'aos_quotes_aos_invoices_c', 'aos_quotes77d9_quotes_ida', 'aos_quotes6b83nvoices_idb', 'many-to-many', NULL, NULL, 0, 0),
('2e78add1-40b7-fb8a-4018-5de4cebf2f91', 'aos_quotes_project', 'AOS_Quotes', 'aos_quotes', 'id', 'Project', 'project', 'id', 'aos_quotes_project_c', 'aos_quotes1112_quotes_ida', 'aos_quotes7207project_idb', 'many-to-many', NULL, NULL, 0, 0),
('2ea20631-8f67-8f44-3070-5de4ce744147', 'aow_processed_aow_actions', 'AOW_Processed', 'aow_processed', 'id', 'AOW_Actions', 'aow_actions', 'id', 'aow_processed_aow_actions', 'aow_processed_id', 'aow_action_id', 'many-to-many', NULL, NULL, 0, 0),
('2ecb883f-9587-57b5-0b0d-5de4cee466ee', 'fp_event_locations_fp_events_1', 'FP_Event_Locations', 'fp_event_locations', 'id', 'FP_events', 'fp_events', 'id', 'fp_event_locations_fp_events_1_c', 'fp_event_locations_fp_events_1fp_event_locations_ida', 'fp_event_locations_fp_events_1fp_events_idb', 'many-to-many', NULL, NULL, 0, 0),
('2ef48952-d2a5-fcd3-d5e2-5de4ce8e727f', 'fp_events_contacts', 'FP_events', 'fp_events', 'id', 'Contacts', 'contacts', 'id', 'fp_events_contacts_c', 'fp_events_contactsfp_events_ida', 'fp_events_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('2f1bd959-e688-0037-2a13-5de4ce7dd967', 'fp_events_fp_event_locations_1', 'FP_events', 'fp_events', 'id', 'FP_Event_Locations', 'fp_event_locations', 'id', 'fp_events_fp_event_locations_1_c', 'fp_events_fp_event_locations_1fp_events_ida', 'fp_events_fp_event_locations_1fp_event_locations_idb', 'many-to-many', NULL, NULL, 0, 0),
('2f52d5c5-b066-7760-5062-5de4ce627631', 'fp_events_leads_1', 'FP_events', 'fp_events', 'id', 'Leads', 'leads', 'id', 'fp_events_leads_1_c', 'fp_events_leads_1fp_events_ida', 'fp_events_leads_1leads_idb', 'many-to-many', NULL, NULL, 0, 0),
('2f788a65-776e-2da8-4687-5de4ceac313b', 'fp_events_prospects_1', 'FP_events', 'fp_events', 'id', 'Prospects', 'prospects', 'id', 'fp_events_prospects_1_c', 'fp_events_prospects_1fp_events_ida', 'fp_events_prospects_1prospects_idb', 'many-to-many', NULL, NULL, 0, 0),
('2fa1626f-bcbb-5357-3956-5de4ce072eb9', 'jjwg_maps_jjwg_areas', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Areas', 'jjwg_areas', 'id', 'jjwg_maps_jjwg_areas_c', 'jjwg_maps_5304wg_maps_ida', 'jjwg_maps_41f2g_areas_idb', 'many-to-many', NULL, NULL, 0, 0),
('2fc85c17-73ca-9407-14e2-5de4ce4a69a0', 'jjwg_maps_jjwg_markers', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Markers', 'jjwg_markers', 'id', 'jjwg_maps_jjwg_markers_c', 'jjwg_maps_b229wg_maps_ida', 'jjwg_maps_2e31markers_idb', 'many-to-many', NULL, NULL, 0, 0),
('2ff0f593-e389-8a25-e816-5de4ce5f333c', 'project_contacts_1', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'project_contacts_1_c', 'project_contacts_1project_ida', 'project_contacts_1contacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('301774a0-575f-f6b3-7934-5de4ce279977', 'project_users_1', 'Project', 'project', 'id', 'Users', 'users', 'id', 'project_users_1_c', 'project_users_1project_ida', 'project_users_1users_idb', 'many-to-many', NULL, NULL, 0, 0),
('3042bec4-c9a8-8ec2-dd60-5de4cef38d12', 'securitygroups_acl_roles', 'SecurityGroups', 'securitygroups', 'id', 'ACLRoles', 'acl_roles', 'id', 'securitygroups_acl_roles', 'securitygroup_id', 'role_id', 'many-to-many', NULL, NULL, 0, 0),
('3125e200-103d-c102-6f68-5de4ce615836', 'securitygroups_project_task', 'SecurityGroups', 'securitygroups', 'id', 'ProjectTask', 'project_task', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProjectTask', 0, 0),
('31683f7d-2b5e-7578-466e-5de4ce408823', 'securitygroups_prospect_lists', 'SecurityGroups', 'securitygroups', 'id', 'ProspectLists', 'prospect_lists', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProspectLists', 0, 0),
('31bb5020-951c-0a74-0db7-5de4ce1be573', 'securitygroups_users', 'SecurityGroups', 'securitygroups', 'id', 'Users', 'users', 'id', 'securitygroups_users', 'securitygroup_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('31f07a11-388d-a801-91fe-5de4cef667e5', 'surveyquestionoptions_surveyquestionresponses', 'SurveyQuestionOptions', 'surveyquestionoptions', 'id', 'SurveyQuestionResponses', 'surveyquestionresponses', 'id', 'surveyquestionoptions_surveyquestionresponses', 'surveyq72c7options_ida', 'surveyq10d4sponses_idb', 'many-to-many', NULL, NULL, 0, 0),
('3934054c-22ac-8680-bd74-5de4ce4c143a', 'aos_contracts_modified_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3bb5031c-7fb9-3427-fbe1-5de4ceea0623', 'aos_contracts_created_by', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3de407ef-3a89-8a68-7c7e-5de4ceb409cc', 'aos_contracts_assigned_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4051033f-a9ba-5fe2-94d1-5de4ced4933d', 'securitygroups_aos_contracts', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Contracts', 0, 0),
('42c30243-9796-9890-4ec9-5de4ceb56185', 'aos_contracts_tasks', 'AOS_Contracts', 'aos_contracts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('455b05bc-7347-90fc-f495-5de4ce26ae78', 'aos_contracts_notes', 'AOS_Contracts', 'aos_contracts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('49050fcf-dc58-158a-01b3-5de4ce2e4b53', 'aos_contracts_meetings', 'AOS_Contracts', 'aos_contracts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('4ca5066e-1b7f-059f-b2d9-5de4ce27c32f', 'aos_contracts_calls', 'AOS_Contracts', 'aos_contracts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('50bb08f7-26ed-6e15-b087-5de4cecec4e3', 'aos_contracts_aos_products_quotes', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('532b0e7e-72de-8439-6ff1-5de4cef505fc', 'aos_contracts_aos_line_item_groups', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5acd0650-6da3-8485-da66-5de4ceb6390c', 'aos_invoices_modified_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5b200a5b-650f-679c-3069-5de4ce6bb064', 'aor_reports_aor_conditions', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Conditions', 'aor_conditions', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5d350d9c-4d89-74d7-8620-5de4ce45bfdc', 'aos_invoices_created_by', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5f800d5e-619a-299c-3eb0-5de4ce661d80', 'aos_invoices_assigned_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('61f5060c-1887-7fff-6a3d-5de4ce1332ae', 'securitygroups_aos_invoices', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Invoices', 'aos_invoices', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Invoices', 0, 0),
('648f0ef3-fbbd-3eb2-68e8-5de4ce2e0e17', 'aos_invoices_aos_product_quotes', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('67070966-5dda-1891-a37d-5de4ce877e4f', 'aos_invoices_aos_line_item_groups', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6d7c087a-4ff2-4594-add4-5de4ce77c793', 'aos_pdf_templates_modified_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('71bc04e0-4cbb-0947-0536-5de4ce28ceda', 'aos_pdf_templates_created_by', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('743e0fae-ad05-781e-e35d-5de4ceaa6cd9', 'aos_pdf_templates_assigned_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('76af07ed-2096-e4ba-23d1-5de4cec22d31', 'securitygroups_aos_pdf_templates', 'SecurityGroups', 'securitygroups', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_PDF_Templates', 0, 0),
('7cf90786-7df2-4413-5fd3-5de4ceb87ea9', 'aos_product_categories_modified_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7f4505be-f301-4471-bc1e-5de4ce3d1532', 'aos_product_categories_created_by', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('818800b5-7ae1-d46e-3790-5de4ce65f23e', 'aos_product_categories_assigned_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('83b60a18-1ec4-b4b3-59f2-5de4ce790eed', 'securitygroups_aos_product_categories', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Product_Categories', 0, 0),
('84300acf-1600-e3a5-b773-5de4ce85016b', 'aor_scheduled_reports_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('864a0881-e826-2967-3736-5de4ce7fee92', 'sub_product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'parent_category_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('940d0c94-bfbd-0bc5-4ac3-5de4ceecee96', 'aos_products_modified_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('988b0377-cf22-6383-86eb-5de4ce7b62c3', 'aos_products_created_by', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9aed09a3-5607-4963-7c10-5de4cefc3481', 'aos_products_assigned_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9d400fd5-5e41-59ac-d097-5de4ceb58093', 'securitygroups_aos_products', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Products', 'aos_products', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Products', 0, 0),
('9fc1078a-3b7f-e2f4-2d04-5de4cefc6a57', 'product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Products', 'aos_products', 'aos_product_category_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a6f901e8-c5b0-c67d-f0c3-5de4ce4058bb', 'aos_products_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a99603c9-39d4-fda3-f592-5de4cecdae83', 'aos_products_quotes_created_by', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('abfb035e-3396-166f-22fb-5de4ce2c8140', 'aos_products_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b07b0112-30a1-44ac-b282-5de4ceba72f1', 'aos_product_quotes_aos_products', 'AOS_Products', 'aos_products', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'product_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b1fd4953-44dc-2651-3e20-5de4ce134190', 'leads_modified_user', 'Users', 'users', 'id', 'Leads', 'leads', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b30e4f8a-2d76-5ff1-f8ee-5de4cea78fc6', 'leads_created_by', 'Users', 'users', 'id', 'Leads', 'leads', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b3dbf3f2-6136-420a-e055-5de4ce9dbe47', 'leads_assigned_user', 'Users', 'users', 'id', 'Leads', 'leads', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b42cad06-b2cf-9692-7e56-5de4ce9ae504', 'securitygroups_leads', 'SecurityGroups', 'securitygroups', 'id', 'Leads', 'leads', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Leads', 0, 0),
('b4517465-3b2f-ece1-af55-5de4cee4654d', 'leads_email_addresses', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('b479af23-eac2-d2dd-4b05-5de4ce54cd85', 'leads_email_addresses_primary', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('b49ddb07-0606-bcdf-0c42-5de4ce4694ac', 'lead_direct_reports', 'Leads', 'leads', 'id', 'Leads', 'leads', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b4bfeb50-e174-07c9-91b2-5de4ce11524d', 'lead_tasks', 'Leads', 'leads', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('b4ed109e-2f69-dcc4-d18a-5de4cef664ae', 'lead_notes', 'Leads', 'leads', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('b51743d3-0fa0-05f1-6226-5de4ce15e162', 'lead_meetings', 'Leads', 'leads', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('b53bfaa6-b851-07d3-5963-5de4ce623fb7', 'lead_calls', 'Leads', 'leads', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('b5675ef2-6b92-fbef-7aba-5de4ce1fb872', 'lead_emails', 'Leads', 'leads', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('b593b5a6-97be-4238-016f-5de4ce053d84', 'lead_campaign_log', 'Leads', 'leads', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Leads', 0, 0),
('b6c90c62-d323-53ad-0d84-5de4ce6d6cb7', 'aos_line_item_groups_modified_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b6f5d12e-1d5a-521d-dcfe-5de4cec566a7', 'cases_modified_user', 'Users', 'users', 'id', 'Cases', 'cases', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b720dcbe-8ebe-9c6c-edd0-5de4ceb972e5', 'cases_created_by', 'Users', 'users', 'id', 'Cases', 'cases', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b745c01a-0fd8-b284-a602-5de4ceb7835e', 'cases_assigned_user', 'Users', 'users', 'id', 'Cases', 'cases', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b77233ac-290c-8419-dd6f-5de4ce6ffec0', 'securitygroups_cases', 'SecurityGroups', 'securitygroups', 'id', 'Cases', 'cases', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Cases', 0, 0),
('b7b8094b-fd5d-896d-e065-5de4cec671d1', 'case_calls', 'Cases', 'cases', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('b807db89-fa39-3529-8b9a-5de4ce3549ba', 'case_tasks', 'Cases', 'cases', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('b8328867-65cf-4452-faa0-5de4cea5ae58', 'case_notes', 'Cases', 'cases', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('b857954d-5ada-803b-19b1-5de4ce2a500b', 'case_meetings', 'Cases', 'cases', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('b87e8f2f-7700-54c3-de37-5de4ce7159cc', 'case_emails', 'Cases', 'cases', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('b8a29d3b-517a-5275-da03-5de4ce8f4712', 'cases_created_contact', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'contact_created_by_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b96e0b5c-3c92-4dc0-b3de-5de4cec35a15', 'aos_line_item_groups_created_by', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b9c81701-4a50-9ae7-415e-5de4cec5f9e5', 'bugs_modified_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b9f3e737-f95b-0834-5618-5de4ce961da2', 'bugs_created_by', 'Users', 'users', 'id', 'Bugs', 'bugs', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ba2570cb-3295-c643-eaf9-5de4ce79d8fe', 'bugs_assigned_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ba4cf6b8-d423-d5b9-7c23-5de4ce5cc801', 'securitygroups_bugs', 'SecurityGroups', 'securitygroups', 'id', 'Bugs', 'bugs', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Bugs', 0, 0),
('ba730c48-e3bc-dad3-ec64-5de4ce2ac876', 'bug_tasks', 'Bugs', 'bugs', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('ba9e8e42-d2b8-a70b-6ff7-5de4ce5c121b', 'bug_meetings', 'Bugs', 'bugs', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('bac7e818-6cd2-6c16-c9a6-5de4cee9d3f1', 'bug_calls', 'Bugs', 'bugs', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('baebd74b-84bf-d8b6-fc59-5de4ce37a216', 'bug_emails', 'Bugs', 'bugs', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('bb1245a2-f983-b550-0f4c-5de4ce3938d7', 'bug_notes', 'Bugs', 'bugs', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('bb3843c2-9194-6033-f02a-5de4cee83472', 'bugs_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'found_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bb5b5ae2-cc3a-7891-a640-5de4ce7bc40f', 'bugs_fixed_in_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'fixed_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bc3c8a37-fe5c-091d-dca0-5de4cec6a554', 'user_direct_reports', 'Users', 'users', 'id', 'Users', 'users', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bc69d6a3-3c5c-e57e-0c37-5de4ce8bcc94', 'users_email_addresses', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('bc90159b-d04a-6138-ecdf-5de4ce0df542', 'users_email_addresses_primary', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('bce0c159-e653-8d67-600d-5de4cee0c9bd', 'campaignlog_contact', 'CampaignLog', 'campaign_log', 'related_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd08fc54-7004-c19a-b5ef-5de4ce3308ab', 'campaignlog_lead', 'CampaignLog', 'campaign_log', 'related_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd2c6b54-3f2f-315a-447f-5de4ce61f125', 'campaignlog_created_opportunities', 'CampaignLog', 'campaign_log', 'related_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd5243bf-ae82-52ec-4301-5de4ce47b442', 'campaignlog_targeted_users', 'CampaignLog', 'campaign_log', 'target_id', 'Users', 'users', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd5a0394-656a-e222-b801-5de4ce1e1ce6', 'aos_line_item_groups_assigned_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd754a28-6af5-28c1-46a3-5de4ce2c9692', 'campaignlog_sent_emails', 'CampaignLog', 'campaign_log', 'related_id', 'Emails', 'emails', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bdcd1c7f-6d23-e5d6-2291-5de4ce481a50', 'securitygroups_project', 'SecurityGroups', 'securitygroups', 'id', 'Project', 'project', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Project', 0, 0),
('bdf38825-b38b-3d4d-f055-5de4ceb04966', 'projects_notes', 'Project', 'project', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('be320d7a-8344-e31b-3184-5de4ce5a0d6c', 'projects_tasks', 'Project', 'project', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('be596fe4-91ef-8fef-5e22-5de4ce84b291', 'projects_meetings', 'Project', 'project', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('be7cb7a7-b108-e9f7-72c6-5de4ce7daac8', 'projects_calls', 'Project', 'project', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('bea40f94-1538-2911-e05a-5de4ce17c164', 'projects_emails', 'Project', 'project', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0);
INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('becb8801-ffc3-6a4f-42e3-5de4ced67f6f', 'projects_project_tasks', 'Project', 'project', 'id', 'ProjectTask', 'project_task', 'project_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bef30856-2285-9f36-a46b-5de4ce04609a', 'projects_assigned_user', 'Users', 'users', 'id', 'Project', 'project', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bf19834f-e84c-1bfd-2c4c-5de4ce0621eb', 'projects_modified_user', 'Users', 'users', 'id', 'Project', 'project', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bf405966-3142-c1bc-8c4c-5de4cedd6a5a', 'projects_created_by', 'Users', 'users', 'id', 'Project', 'project', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bfef0e30-2ad1-4313-dfd3-5de4ceb98009', 'groups_aos_product_quotes', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'group_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c043c372-bd56-677d-9af8-5de4ce2e2180', 'securitygroups_projecttask', 'SecurityGroups', 'securitygroups', 'id', 'ProjectTask', 'project_task', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProjectTask', 0, 0),
('c070fc3e-4244-1a11-d94a-5de4ce35b88d', 'project_tasks_notes', 'ProjectTask', 'project_task', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('c0b1b058-1614-e2e6-34f0-5de4ce5a52fc', 'project_tasks_tasks', 'ProjectTask', 'project_task', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('c0d9a396-c869-cd7e-7af2-5de4ce1447e0', 'project_tasks_meetings', 'ProjectTask', 'project_task', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('c0fe3bcd-1a4d-dae4-8219-5de4ce0cc42f', 'project_tasks_calls', 'ProjectTask', 'project_task', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('c1254c44-40b5-5e05-5de7-5de4ce5315fe', 'project_tasks_emails', 'ProjectTask', 'project_task', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('c149b293-7383-6d2e-7f18-5de4ce2d5b89', 'project_tasks_assigned_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c175716f-08bc-bf15-d2f3-5de4ce403d44', 'project_tasks_modified_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c1b06e8e-b394-038e-fa41-5de4ceebcdf0', 'project_tasks_created_by', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c2282998-dfd9-50f0-7d47-5de4ce0212e9', 'campaigns_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c250251d-985e-c6aa-342b-5de4ce51184e', 'campaigns_created_by', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c2751bc7-b439-074f-55ca-5de4ce65cd9d', 'campaigns_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c29e055d-5367-b297-072a-5de4ce465c70', 'securitygroups_campaigns', 'SecurityGroups', 'securitygroups', 'id', 'Campaigns', 'campaigns', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Campaigns', 0, 0),
('c2e29155-4376-7656-93fd-5de4cec1d038', 'campaign_accounts', 'Campaigns', 'campaigns', 'id', 'Accounts', 'accounts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c30a2f51-50c1-6ea7-3dff-5de4cec465f6', 'campaign_contacts', 'Campaigns', 'campaigns', 'id', 'Contacts', 'contacts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c3304b08-dda9-c6ac-1534-5de4ce2bf20f', 'campaign_leads', 'Campaigns', 'campaigns', 'id', 'Leads', 'leads', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c36538a9-90e4-e9e5-e7af-5de4ce668879', 'campaign_prospects', 'Campaigns', 'campaigns', 'id', 'Prospects', 'prospects', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c3a0f6f4-3cd2-dfba-6a46-5de4ceb67b35', 'campaign_opportunities', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c3cff750-ce99-011f-1338-5de4ce34fa11', 'campaign_email_marketing', 'Campaigns', 'campaigns', 'id', 'EmailMarketing', 'email_marketing', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c4046b86-4ffa-b69a-5a50-5de4cee3a989', 'campaign_emailman', 'Campaigns', 'campaigns', 'id', 'EmailMan', 'emailman', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c4326ded-a3cc-5db2-0828-5de4ce669496', 'campaign_campaignlog', 'Campaigns', 'campaigns', 'id', 'CampaignLog', 'campaign_log', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c45b3d40-435c-53b7-1762-5de4ce72f4cd', 'campaign_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c48158bd-111a-4b47-622c-5de4ce25b32b', 'campaign_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c4b67b22-2e93-34b3-f7c4-5de4ce5892a5', 'surveyresponses_campaigns', 'Campaigns', 'campaigns', 'id', 'SurveyResponses', 'surveyresponses', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c50fd8a6-66c6-a6ad-5c2e-5de4cec59dad', 'prospectlists_assigned_user', 'Users', 'users', 'id', 'prospectlists', 'prospect_lists', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c538a05d-ee5f-b507-7722-5de4ce081f18', 'securitygroups_prospectlists', 'SecurityGroups', 'securitygroups', 'id', 'ProspectLists', 'prospect_lists', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProspectLists', 0, 0),
('c5c6fe9d-264b-3906-070c-5de4cecf56ec', 'prospects_modified_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c5ed7c5a-d20c-3f25-7a11-5de4ceaeb99a', 'prospects_created_by', 'Users', 'users', 'id', 'Prospects', 'prospects', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c6137095-845a-e67c-fb15-5de4cebca45e', 'prospects_assigned_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c639bf1b-1fe1-5b63-3520-5de4ce4cdebb', 'securitygroups_prospects', 'SecurityGroups', 'securitygroups', 'id', 'Prospects', 'prospects', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Prospects', 0, 0),
('c660b68c-88f8-7975-5054-5de4cebf2f13', 'prospects_email_addresses', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('c6868d1f-0688-9c3a-369f-5de4ce2081c6', 'prospects_email_addresses_primary', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('c6dfd0f4-e99d-e94f-a11f-5de4ce0079e8', 'prospect_tasks', 'Prospects', 'prospects', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('c70923e7-945f-bc16-fb93-5de4ce9e0fb0', 'prospect_notes', 'Prospects', 'prospects', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('c7302246-f99d-2f1c-9ccc-5de4cee5f14a', 'prospect_meetings', 'Prospects', 'prospects', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('c757a415-a866-9643-e1e5-5de4cec8638b', 'prospect_calls', 'Prospects', 'prospects', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('c77ee5fe-e313-f5a5-bf0b-5de4ce36c196', 'prospect_emails', 'Prospects', 'prospects', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('c7aae3ea-9141-35d5-cdbb-5de4ce8dafb6', 'prospect_campaign_log', 'Prospects', 'prospects', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Prospects', 0, 0),
('c8bfd618-d36c-3c64-bc1d-5de4ce9a5e06', 'securitygroups_emailmarketing', 'SecurityGroups', 'securitygroups', 'id', 'EmailMarketing', 'email_marketing', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'EmailMarketing', 0, 0),
('c8df06ed-4da7-58d2-2dde-5de4ce492dd9', 'aos_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c8eb8887-0b98-06cb-98c8-5de4ceb7e6cf', 'email_template_email_marketings', 'EmailTemplates', 'email_templates', 'id', 'EmailMarketing', 'email_marketing', 'template_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c927b21a-e88e-b696-4f38-5de4cede9222', 'campaign_campaigntrakers', 'Campaigns', 'campaigns', 'id', 'CampaignTrackers', 'campaign_trkrs', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c9901740-7b6b-3365-1485-5de4ce8317d9', 'schedulers_created_by_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('c9d1cab4-35cf-f1f8-af41-5de4ceaa5f73', 'schedulers_modified_user_id_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c9f98a98-26be-7bad-2aad-5de4cece4052', 'schedulers_jobs_rel', 'Schedulers', 'schedulers', 'id', 'SchedulersJobs', 'job_queue', 'scheduler_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ca4b0efc-3d8c-8841-b22a-5de4cee0156d', 'schedulersjobs_assigned_user', 'Users', 'users', 'id', 'SchedulersJobs', 'job_queue', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cb3170ef-6b1e-a47d-894a-5de4ce1e0565', 'contacts_modified_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cb592270-c27d-be36-9122-5de4ce15a68a', 'contacts_created_by', 'Users', 'users', 'id', 'Contacts', 'contacts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cb7f74ae-1210-353e-2d56-5de4ce61c597', 'contacts_assigned_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cba39133-2f17-36d5-887f-5de4ce6e1457', 'securitygroups_contacts', 'SecurityGroups', 'securitygroups', 'id', 'Contacts', 'contacts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Contacts', 0, 0),
('cbcaa878-235c-17e1-72d0-5de4ce69d6e3', 'contacts_email_addresses', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('cc04640c-e1fa-ddd3-32e8-5de4ce033b30', 'contacts_email_addresses_primary', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('cc170d6e-62dd-e2d3-f568-5de4ced961d4', 'aos_quotes_created_by', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cc711a23-3559-73fd-591e-5de4cead4d17', 'contact_direct_reports', 'Contacts', 'contacts', 'id', 'Contacts', 'contacts', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ccb6d738-8f6d-bd74-34b3-5de4ce0b09ce', 'contact_leads', 'Contacts', 'contacts', 'id', 'Leads', 'leads', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cce0c275-e171-b6c9-342c-5de4ceaec40d', 'contact_notes', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cd06be2d-59eb-53ba-117e-5de4ce791007', 'contact_tasks', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cd2987f0-5feb-a888-652a-5de4cebbbf03', 'contact_tasks_parent', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('cd50c6f2-495c-13a9-7324-5de4ced5c5c2', 'contact_notes_parent', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('cd78a9e7-8aa1-ad7b-8ff0-5de4cec05609', 'contact_campaign_log', 'Contacts', 'contacts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Contacts', 0, 0),
('cda00cec-c8e5-5b0f-af46-5de4ce1303a8', 'contact_aos_quotes', 'Contacts', 'contacts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cdc6c3f5-ed00-9f0b-64e9-5de4ce1437c3', 'contact_aos_invoices', 'Contacts', 'contacts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cdedb5ac-f0e0-ab49-1658-5de4ce07a176', 'contact_aos_contracts', 'Contacts', 'contacts', 'id', 'AOS_Contracts', 'aos_contracts', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ce154458-2351-ed9b-0a14-5de4ce4fc1ab', 'contacts_aop_case_updates', 'Contacts', 'contacts', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cf85fa9f-77a0-9d82-5ba4-5de4ce7720eb', 'accounts_modified_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cfc5614d-205c-fd12-76c5-5de4cec1bffc', 'accounts_created_by', 'Users', 'users', 'id', 'Accounts', 'accounts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cff79c11-7483-1839-a83d-5de4cefe09ce', 'accounts_assigned_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d0aed23d-55f1-710e-09a5-5de4ce6012ed', 'securitygroups_accounts', 'SecurityGroups', 'securitygroups', 'id', 'Accounts', 'accounts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Accounts', 0, 0),
('d0d00603-a369-c920-455f-5de4ced9648a', 'aos_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d0f6584a-d94c-15e0-be0e-5de4ce1ae674', 'accounts_email_addresses', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('d1377956-dc03-6000-1b2d-5de4cef7a9d0', 'accounts_email_addresses_primary', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('d1683fa1-50ff-cad3-777d-5de4cec5901b', 'member_accounts', 'Accounts', 'accounts', 'id', 'Accounts', 'accounts', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d19063b3-79fd-29ea-93eb-5de4ce7e30cf', 'account_cases', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d1b662ce-ef04-e17b-ddbf-5de4ce979168', 'account_tasks', 'Accounts', 'accounts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('d1dac700-8f0d-6087-1572-5de4ceb8345d', 'account_notes', 'Accounts', 'accounts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('d1fcbf98-2a22-c5ee-973b-5de4ce8ac6fa', 'account_meetings', 'Accounts', 'accounts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('d230e410-993b-eff9-04a2-5de4ceaf1803', 'account_calls', 'Accounts', 'accounts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('d2554ae1-3f11-6cbf-2f73-5de4ce62b5b2', 'account_emails', 'Accounts', 'accounts', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('d27cdb48-b8cd-b0c6-ed8c-5de4ce5db45f', 'account_leads', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d2a6719d-c3a8-6579-6baa-5de4ce7d37a4', 'account_campaign_log', 'Accounts', 'accounts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Accounts', 0, 0),
('d2cf3c90-b23d-93cb-e861-5de4ced11420', 'account_aos_quotes', 'Accounts', 'accounts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d2f78a7e-edd7-bbc8-0611-5de4ced726ac', 'account_aos_invoices', 'Accounts', 'accounts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d31ecd8b-36c9-2196-2b27-5de4ce00aecb', 'account_aos_contracts', 'Accounts', 'accounts', 'id', 'AOS_Contracts', 'aos_contracts', 'contract_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d3b106e3-b864-3d42-3f27-5de4ce4433e3', 'securitygroups_aos_quotes', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Quotes', 'aos_quotes', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Quotes', 0, 0),
('d473b97d-3e79-93ae-b3fe-5de4ce9d0ff7', 'opportunities_modified_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d49d771b-ab64-5cf4-dd18-5de4ce976295', 'opportunities_created_by', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d4c3e663-16be-1bae-8239-5de4ce8073d8', 'opportunities_assigned_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d4fc6b42-2530-37b3-dc76-5de4cee0ae89', 'securitygroups_opportunities', 'SecurityGroups', 'securitygroups', 'id', 'Opportunities', 'opportunities', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Opportunities', 0, 0),
('d5242c65-e50f-916a-e668-5de4cecbe8f2', 'opportunity_calls', 'Opportunities', 'opportunities', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('d54967fa-138b-1ceb-6b99-5de4ce476017', 'opportunity_meetings', 'Opportunities', 'opportunities', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('d5707620-2b7d-bb8a-e18d-5de4ce944546', 'opportunity_tasks', 'Opportunities', 'opportunities', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('d592f843-4ab4-0b64-940e-5de4ce0e4083', 'opportunity_notes', 'Opportunities', 'opportunities', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('d5b8790e-704b-b9e6-1a1f-5de4cef304ee', 'opportunity_emails', 'Opportunities', 'opportunities', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('d5dd0949-21e4-1da8-8bb3-5de4ce0b56f8', 'opportunity_leads', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d603883d-4500-0220-71d0-5de4ce60d74a', 'opportunity_currencies', 'Opportunities', 'opportunities', 'currency_id', 'Currencies', 'currencies', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d6140c61-0c5f-8502-7165-5de4ce331a19', 'aos_quotes_aos_product_quotes', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d6253f75-2076-d2a7-d192-5de4ceca8ec4', 'opportunities_campaign', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d6559b49-efb0-e5c9-818a-5de4cec7df94', 'opportunity_aos_quotes', 'Opportunities', 'opportunities', 'id', 'AOS_Quotes', 'aos_quotes', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d674e330-1ffc-977b-12e5-5de4cef523d1', 'opportunity_aos_contracts', 'Opportunities', 'opportunities', 'id', 'AOS_Contracts', 'aos_contracts', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d765ac86-dd42-e7ac-16e7-5de4cefac35c', 'securitygroups_emailtemplates', 'SecurityGroups', 'securitygroups', 'id', 'EmailTemplates', 'email_templates', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'EmailTemplates', 0, 0),
('d794df31-8c21-ab8d-f4b4-5de4cee62a54', 'emailtemplates_assigned_user', 'Users', 'users', 'id', 'EmailTemplates', 'email_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d812f2e9-d64c-66f2-1d27-5de4ce05dbdd', 'notes_assigned_user', 'Users', 'users', 'id', 'Notes', 'notes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d83f48e2-86a4-7358-a980-5de4ce01e5be', 'securitygroups_notes', 'SecurityGroups', 'securitygroups', 'id', 'Notes', 'notes', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Notes', 0, 0),
('d8644046-baea-561f-4462-5de4ce6c6bda', 'notes_modified_user', 'Users', 'users', 'id', 'Notes', 'notes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d8860fe6-a2c4-a7c5-b930-5de4ced828a0', 'aos_quotes_aos_line_item_groups', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d888adc1-ea94-935b-edc8-5de4ce63868e', 'notes_created_by', 'Users', 'users', 'id', 'Notes', 'notes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d902de4c-4104-e703-e430-5de4ce10eed1', 'calls_modified_user', 'Users', 'users', 'id', 'Calls', 'calls', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d92a292f-b831-cb02-8532-5de4cedda7e2', 'calls_created_by', 'Users', 'users', 'id', 'Calls', 'calls', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d94a87f5-db28-a0d6-5a2c-5de4cee373f5', 'calls_assigned_user', 'Users', 'users', 'id', 'Calls', 'calls', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d989bf2f-2961-4533-3d10-5de4ce0a0205', 'securitygroups_calls', 'SecurityGroups', 'securitygroups', 'id', 'Calls', 'calls', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Calls', 0, 0),
('d9b317cb-a486-1c87-a4c3-5de4ce368362', 'calls_notes', 'Calls', 'calls', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Calls', 0, 0),
('d9da373d-3777-4dc0-c41c-5de4cecdc167', 'calls_reschedule', 'Calls', 'calls', 'id', 'Calls_Reschedule', 'calls_reschedule', 'call_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('da6a18fe-ee41-9475-a4dc-5de4ce0d642c', 'emails_modified_user', 'Users', 'users', 'id', 'Emails', 'emails', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('da8e4634-79c2-58d0-000d-5de4ce909475', 'emails_created_by', 'Users', 'users', 'id', 'Emails', 'emails', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dab22d5d-95ba-92f5-119b-5de4cecd9c09', 'emails_assigned_user', 'Users', 'users', 'id', 'Emails', 'emails', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dad8d206-38b9-b077-42fc-5de4ceb7083b', 'securitygroups_emails', 'SecurityGroups', 'securitygroups', 'id', 'Emails', 'emails', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Emails', 0, 0),
('db01b38f-9b32-7106-11eb-5de4cea1358d', 'emails_notes_rel', 'Emails', 'emails', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('db27a1f7-f95b-40e3-913f-5de4ce76d89c', 'emails_contacts_rel', 'Emails', 'emails', 'id', 'Contacts', 'contacts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('db4ce219-ceef-9776-17bf-5de4cebf83c9', 'emails_accounts_rel', 'Emails', 'emails', 'id', 'Accounts', 'accounts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('db902247-d5b6-c044-af45-5de4ce9c43ed', 'emails_leads_rel', 'Emails', 'emails', 'id', 'Leads', 'leads', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('dbb90b27-2eb9-d609-4fe7-5de4ce08c947', 'emails_aos_contracts_rel', 'Emails', 'emails', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'AOS_Contracts', 0, 0),
('dbe6ee3e-b612-485b-d431-5de4ce8711f9', 'emails_meetings_rel', 'Emails', 'emails', 'id', 'Meetings', 'meetings', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Meetings', 0, 0),
('dc8c631e-5c74-d826-ac26-5de4ce4a5f12', 'meetings_modified_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dcbb3231-e5ef-3b17-a0ac-5de4cef571f4', 'meetings_created_by', 'Users', 'users', 'id', 'Meetings', 'meetings', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dce083e5-6880-8da5-54de-5de4ce1e3489', 'meetings_assigned_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dd03d412-a46e-9558-eae5-5de4ceb52208', 'securitygroups_meetings', 'SecurityGroups', 'securitygroups', 'id', 'Meetings', 'meetings', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Meetings', 0, 0),
('dd2b9f6b-dcec-9e3d-ebcd-5de4ceee75a5', 'meetings_notes', 'Meetings', 'meetings', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('ddb800a1-9b1b-be73-8084-5de4ce02a895', 'aow_actions_modified_user', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dde7bdad-e0b4-e9cd-3908-5de4cee2e201', 'tasks_modified_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('de0f8442-dc86-7857-abc4-5de4ce5aa679', 'tasks_created_by', 'Users', 'users', 'id', 'Tasks', 'tasks', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('de4f463f-e865-fdbc-d3c2-5de4ce42ce9a', 'tasks_assigned_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('de765651-02c1-065e-30de-5de4ce23bd24', 'securitygroups_tasks', 'SecurityGroups', 'securitygroups', 'id', 'Tasks', 'tasks', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Tasks', 0, 0),
('de9e80ce-d409-7ccb-871e-5de4ce017fbd', 'tasks_notes', 'Tasks', 'tasks', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dffd2eb9-8246-dda5-695a-5de4cec91235', 'alerts_modified_user', 'Users', 'users', 'id', 'Alerts', 'alerts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e02daae7-5800-6de7-cf5d-5de4ce9a728f', 'alerts_created_by', 'Users', 'users', 'id', 'Alerts', 'alerts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e05408c0-e79d-d201-fd11-5de4ce5da663', 'aow_actions_created_by', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e071fc99-7402-a1f5-4907-5de4ce0e506d', 'alerts_assigned_user', 'Users', 'users', 'id', 'Alerts', 'alerts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e1150bc8-e6d3-a50a-4eeb-5de4ced2ed9d', 'documents_modified_user', 'Users', 'users', 'id', 'Documents', 'documents', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e13d686a-3a4c-e138-e4c3-5de4ce629a90', 'documents_created_by', 'Users', 'users', 'id', 'Documents', 'documents', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e160ef02-e79e-9e6e-00db-5de4cec19a89', 'documents_assigned_user', 'Users', 'users', 'id', 'Documents', 'documents', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e185ab80-32bd-eb6b-6ccd-5de4cebad79a', 'securitygroups_documents', 'SecurityGroups', 'securitygroups', 'id', 'Documents', 'documents', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Documents', 0, 0),
('e1c7195c-e086-adb6-3fb0-5de4cec3c1ef', 'document_revisions', 'Documents', 'documents', 'id', 'DocumentRevisions', 'document_revisions', 'document_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e20b39a5-66ec-b1f0-b2f7-5de4cef03099', 'revisions_created_by', 'Users', 'users', 'id', 'DocumentRevisions', 'document_revisions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e266699d-ae99-ddbe-dd60-5de4ceacd5d7', 'inbound_email_created_by', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('e28fb4fc-dbd6-f046-0f0f-5de4ce48d4cb', 'inbound_email_modified_user_id', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('e2cb1e75-2efa-926a-48b3-5de4ce98458c', 'saved_search_assigned_user', 'Users', 'users', 'id', 'SavedSearch', 'saved_search', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e374d824-3d8d-d95e-9b89-5de4ce904719', 'spots_modified_user', 'Users', 'users', 'id', 'Spots', 'spots', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e3a0551e-466e-f88a-2179-5de4cef4ba49', 'spots_created_by', 'Users', 'users', 'id', 'Spots', 'spots', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e3c6bfb7-04b0-5d69-b560-5de4ce47d6a4', 'spots_assigned_user', 'Users', 'users', 'id', 'Spots', 'spots', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e3ee4e67-c863-10d3-1b80-5de4ce0236e5', 'securitygroups_spots', 'SecurityGroups', 'securitygroups', 'id', 'Spots', 'spots', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Spots', 0, 0),
('e43b144c-4c3d-d967-0f62-5de4ce55fc79', 'aobh_businesshours_modified_user', 'Users', 'users', 'id', 'AOBH_BusinessHours', 'aobh_businesshours', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e483f12e-9511-1eea-07de-5de4ce16fa11', 'aobh_businesshours_created_by', 'Users', 'users', 'id', 'AOBH_BusinessHours', 'aobh_businesshours', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e4ff8190-b993-48c7-3ca4-5de4ce708dfb', 'sugarfeed_modified_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e52b5ef0-8d62-e8e6-5c96-5de4cec04257', 'sugarfeed_created_by', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e5512d7b-de8c-abd9-301a-5de4ce53119b', 'sugarfeed_assigned_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e5ab1b71-9024-97f1-16b1-5de4ce609eed', 'eapm_modified_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e5d31942-6f10-b036-9de3-5de4ce805bf1', 'eapm_created_by', 'Users', 'users', 'id', 'EAPM', 'eapm', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e5fa93ee-a57e-cdd3-2deb-5de4ce89c47c', 'eapm_assigned_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e6849e09-44ed-25be-4f33-5de4ce41cbe3', 'oauthkeys_modified_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauth_consumer', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e6ccd3fe-7809-2d80-5c61-5de4ce171514', 'oauthkeys_created_by', 'Users', 'users', 'id', 'OAuthKeys', 'oauth_consumer', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e7169d9f-c430-bd81-d052-5de4ce093991', 'oauthkeys_assigned_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauth_consumer', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e77312ca-440d-724a-6233-5de4ce2db0b8', 'consumer_tokens', 'OAuthKeys', 'oauth_consumer', 'id', 'OAuthTokens', 'oauth_tokens', 'consumer', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e7a00a70-02bc-4908-caea-5de4ce21e119', 'aor_fields_modified_user', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e7b6532f-424c-9d4d-03fa-5de4cec03cc8', 'oauthtokens_assigned_user', 'Users', 'users', 'id', 'OAuthTokens', 'oauth_tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e82a55d8-2cb9-3b0c-d92c-5de4ce56d94d', 'am_projecttemplates_modified_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e864b0b9-c4da-82ec-533f-5de4ce94f6c5', 'am_projecttemplates_created_by', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e89657e4-1ada-ee92-cdeb-5de4cee25f85', 'am_projecttemplates_assigned_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e8d80ca5-2d78-777a-cbac-5de4cea02f3d', 'aow_workflow_modified_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e9128dc0-8bef-41fe-b58d-5de4cec2f478', 'am_tasktemplates_modified_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e9377396-79a4-8086-e78b-5de4ce89207d', 'am_tasktemplates_created_by', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e95e27f5-cbf5-0161-931d-5de4ceda9559', 'am_tasktemplates_assigned_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e9adcee5-6088-2bd5-7407-5de4cedfbe61', 'favorites_modified_user', 'Users', 'users', 'id', 'Favorites', 'favorites', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e9d57cad-5166-7818-6c46-5de4ce56b723', 'favorites_created_by', 'Users', 'users', 'id', 'Favorites', 'favorites', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e9fb8a66-aa6b-2a8b-77af-5de4ce3f074b', 'favorites_assigned_user', 'Users', 'users', 'id', 'Favorites', 'favorites', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ea6b6323-6402-eafa-1f84-5de4ce17fb0f', 'aok_knowledge_base_categories_modified_user', 'Users', 'users', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ea95f0c9-eedd-b1d3-4461-5de4ce077441', 'aok_knowledge_base_categories_created_by', 'Users', 'users', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eabd14e4-ea69-d035-5428-5de4ce242915', 'aok_knowledge_base_categories_assigned_user', 'Users', 'users', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eb1d5e93-6ace-7de1-cba2-5de4ceac8ac9', 'aok_knowledgebase_modified_user', 'Users', 'users', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eb434703-b1a6-1498-45a6-5de4cedcbe62', 'aok_knowledgebase_created_by', 'Users', 'users', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eb5f04a5-01c4-89c2-1af0-5de4cec97088', 'aow_workflow_created_by', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eb682f6e-2f74-869b-62d0-5de4ced53c03', 'aok_knowledgebase_assigned_user', 'Users', 'users', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eb918bb1-747a-7c57-5c95-5de4ce72d9ed', 'securitygroups_aok_knowledgebase', 'SecurityGroups', 'securitygroups', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOK_KnowledgeBase', 0, 0),
('ec07a019-04e1-3bfd-8f8f-5de4cef865dc', 'reminders_modified_user', 'Users', 'users', 'id', 'Reminders', 'reminders', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ec39a3c9-78f5-ad16-73f4-5de4cee7f687', 'reminders_created_by', 'Users', 'users', 'id', 'Reminders', 'reminders', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ec7b3a91-dad4-a174-9bcc-5de4ceb1a0e8', 'reminders_assigned_user', 'Users', 'users', 'id', 'Reminders', 'reminders', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ecd34749-fc6b-1a23-a3ef-5de4ce2fffe4', 'reminders_invitees_modified_user', 'Users', 'users', 'id', 'Reminders_Invitees', 'reminders_invitees', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ecfa0029-79dd-2599-f212-5de4ce3569d3', 'reminders_invitees_created_by', 'Users', 'users', 'id', 'Reminders_Invitees', 'reminders_invitees', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ed20b766-7c8e-5d92-21e3-5de4cea8afc1', 'reminders_invitees_assigned_user', 'Users', 'users', 'id', 'Reminders_Invitees', 'reminders_invitees', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ed8f5063-9e43-4ffa-3506-5de4ce0048f8', 'fp_events_modified_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('edbbd4c5-5267-7bc4-310b-5de4cebdd783', 'fp_events_created_by', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('edf16212-1b38-339a-5c3f-5de4ce061cca', 'fp_events_assigned_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ee209d65-67f0-57e3-3688-5de4cebe8e13', 'securitygroups_fp_events', 'SecurityGroups', 'securitygroups', 'id', 'FP_events', 'fp_events', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'FP_events', 0, 0),
('ee82d82b-8fa2-46f9-1e87-5de4cef5cd91', 'fp_event_locations_modified_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eea8b599-a0f0-cb35-d1f9-5de4ce7cdaef', 'fp_event_locations_created_by', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eeea843c-2a2b-0ad2-b033-5de4cea1d3d8', 'fp_event_locations_assigned_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ef1385de-dfd1-2597-9f58-5de4cefc28a5', 'securitygroups_fp_event_locations', 'SecurityGroups', 'securitygroups', 'id', 'FP_Event_Locations', 'fp_event_locations', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'FP_Event_Locations', 0, 0),
('ef3a278b-e509-a698-012e-5de4cef4131d', 'optimistic_locking', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
('ef6265e7-1a88-a084-6c92-5de4cefa5c65', 'unified_search', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
('efbafe08-78c2-600b-7aaf-5de4ce26acb1', 'aod_indexevent_modified_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('efdfcc87-3eae-02eb-40f2-5de4cee0a603', 'aod_indexevent_created_by', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f001c168-2343-7516-77d2-5de4ce7cc206', 'aod_indexevent_assigned_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f036068e-3b6a-0222-5711-5de4ced0dd44', 'aow_workflow_assigned_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f0566555-23f1-2b9a-71f7-5de4ce2bd0b6', 'aod_index_modified_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f07e91da-1bbd-3f55-9880-5de4ce17af16', 'aod_index_created_by', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f0c9eacd-d2f5-dd03-331c-5de4ce01de01', 'aod_index_assigned_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f1759f98-30de-5072-6a73-5de4cef7ea24', 'aop_case_events_modified_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f1a3ebf3-adea-abfc-7fac-5de4ceabc866', 'aop_case_events_created_by', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f1cc2657-ab11-6724-ca59-5de4ce954c1d', 'aop_case_events_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f2176dcb-a4c0-e524-6305-5de4ce459122', 'cases_aop_case_events', 'Cases', 'cases', 'id', 'AOP_Case_Events', 'aop_case_events', 'case_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f2710c96-fd43-0cfb-a66c-5de4ce636117', 'aop_case_updates_modified_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f2b34d36-832c-0ad9-b2e5-5de4ceb618f4', 'aop_case_updates_created_by', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f2cc0891-a8fd-dcc4-4bd2-5de4cebc69b8', 'securitygroups_aow_workflow', 'SecurityGroups', 'securitygroups', 'id', 'AOW_WorkFlow', 'aow_workflow', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOW_WorkFlow', 0, 0),
('f2dbe037-dfdf-b7c8-ef75-5de4ce5c35ad', 'aop_case_updates_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f3022151-b407-8b7f-525b-5de4ce22955b', 'cases_aop_case_updates', 'Cases', 'cases', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'case_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f3357899-0a52-124c-fa06-5de4ce00f3f3', 'aop_case_updates_notes', 'AOP_Case_Updates', 'aop_case_updates', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOP_Case_Updates', 0, 0),
('f3a71382-8614-88ec-fd88-5de4ce367b8d', 'aor_reports_modified_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f3d029c9-f754-be17-2d3d-5de4ce1585ae', 'aor_reports_created_by', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f3f65d2b-5080-6811-5552-5de4ce657e69', 'aor_reports_assigned_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f41c6408-da01-7e0a-c8b4-5de4ce74d335', 'securitygroups_aor_reports', 'SecurityGroups', 'securitygroups', 'id', 'AOR_Reports', 'aor_reports', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOR_Reports', 0, 0),
('f54106e7-6284-8dc4-8ef3-5de4cec8f9a8', 'aow_workflow_aow_conditions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Conditions', 'aow_conditions', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f7ee0c41-44f1-c4f1-50d7-5de4ce6bf3cd', 'aow_workflow_aow_actions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Actions', 'aow_actions', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('fa81023f-f1e0-61a6-5d76-5de4ce6dd657', 'aow_workflow_aow_processed', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Processed', 'aow_processed', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `releases`
--

CREATE TABLE IF NOT EXISTS `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE IF NOT EXISTS `reminders` (
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
  `date_willexecute` int(60) DEFAULT '-1',
  `popup_viewed` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reminders_invitees`
--

CREATE TABLE IF NOT EXISTS `reminders_invitees` (
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
  `related_invitee_module_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_modules`
--

CREATE TABLE IF NOT EXISTS `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE IF NOT EXISTS `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedulers`
--

CREATE TABLE IF NOT EXISTS `schedulers` (
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
  `catch_up` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedulers`
--

INSERT INTO `schedulers` (`id`, `deleted`, `date_entered`, `date_modified`, `created_by`, `modified_user_id`, `name`, `job`, `date_time_start`, `date_time_end`, `job_interval`, `time_from`, `time_to`, `last_run`, `status`, `catch_up`) VALUES
('1ec94195-8116-0e32-32d6-5de4cebdbccc', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Process Workflow Tasks', 'function::processAOW_Workflow', '2015-01-01 14:45:01', NULL, '*::*::*::*::*', NULL, NULL, NULL, 'Active', 1),
('21828331-3035-ab03-072a-5de4cefe3d70', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Run Report Generation Scheduled Tasks', 'function::aorRunScheduledReports', '2015-01-01 09:15:01', NULL, '*::*::*::*::*', NULL, NULL, NULL, 'Active', 1),
('23aa23b4-0e6f-bbda-20e2-5de4ceed545b', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Prune Tracker Tables', 'function::trimTracker', '2015-01-01 13:45:01', NULL, '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('25f86156-04d1-937a-014e-5de4ce24caf5', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Check Inbound Mailboxes', 'function::pollMonitoredInboxesAOP', '2015-01-01 08:45:01', NULL, '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('2873d0f3-e88b-415c-21ac-5de4cea20aa8', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Run Nightly Process Bounced Campaign Emails', 'function::pollMonitoredInboxesForBouncedCampaignEmails', '2015-01-01 14:45:01', NULL, '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('2a94accb-679f-537a-c3d2-5de4cebea29d', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Run Nightly Mass Email Campaigns', 'function::runMassEmailCampaign', '2015-01-01 12:45:01', NULL, '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('2caa0925-6b04-259b-b62f-5de4ce49e5ea', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Prune Database on 1st of Month', 'function::pruneDatabase', '2015-01-01 08:15:01', NULL, '0::4::1::*::*', NULL, NULL, NULL, 'Inactive', 0),
('2eaf8448-f2a1-690f-b12e-5de4ce569a6c', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Perform Lucene Index', 'function::aodIndexUnindexed', '2015-01-01 06:00:01', NULL, '0::0::*::*::*', NULL, NULL, NULL, 'Active', 0),
('31a6fec2-7bbe-71b0-dfd8-5de4ce9aa269', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Optimise AOD Index', 'function::aodOptimiseIndex', '2015-01-01 12:00:01', NULL, '0::*/3::*::*::*', NULL, NULL, NULL, 'Active', 0),
('33b6b281-75bc-4772-982b-5de4cefac077', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Run Email Reminder Notifications', 'function::sendEmailReminders', '2015-01-01 11:30:01', NULL, '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('35dfe8a6-cbf5-5ffc-2531-5de4cef570c1', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Clean Jobs Queue', 'function::cleanJobQueue', '2015-01-01 19:30:01', NULL, '0::5::*::*::*', NULL, NULL, NULL, 'Active', 0),
('3860a494-98b4-6a76-4a0a-5de4ce2ac521', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Removal of documents from filesystem', 'function::removeDocumentsFromFS', '2015-01-01 10:45:01', NULL, '0::3::1::*::*', NULL, NULL, NULL, 'Active', 0),
('3a8f582e-18e1-e74d-59dc-5de4ceb0c4e4', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Prune SuiteCRM Feed Tables', 'function::trimSugarFeeds', '2015-01-01 09:45:01', NULL, '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('3cacbcc0-69d9-4f56-b9d7-5de4ce16e547', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '1', 'Google Calendar Sync', 'function::syncGoogleCalendar', '2015-01-01 18:45:01', NULL, '*/15::*::*::*::*', NULL, NULL, NULL, 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups`
--

CREATE TABLE IF NOT EXISTS `securitygroups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_acl_roles`
--

CREATE TABLE IF NOT EXISTS `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_audit`
--

CREATE TABLE IF NOT EXISTS `securitygroups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_default`
--

CREATE TABLE IF NOT EXISTS `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_records`
--

CREATE TABLE IF NOT EXISTS `securitygroups_records` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `record_id` char(36) DEFAULT NULL,
  `module` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_users`
--

CREATE TABLE IF NOT EXISTS `securitygroups_users` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `securitygroup_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spots`
--

CREATE TABLE IF NOT EXISTS `spots` (
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
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sugarfeed`
--

CREATE TABLE IF NOT EXISTS `sugarfeed` (
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
  `link_type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionoptions`
--

CREATE TABLE IF NOT EXISTS `surveyquestionoptions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `survey_question_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionoptions_audit`
--

CREATE TABLE IF NOT EXISTS `surveyquestionoptions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionoptions_surveyquestionresponses`
--

CREATE TABLE IF NOT EXISTS `surveyquestionoptions_surveyquestionresponses` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `surveyq72c7options_ida` varchar(36) DEFAULT NULL,
  `surveyq10d4sponses_idb` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionresponses`
--

CREATE TABLE IF NOT EXISTS `surveyquestionresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `answer` text,
  `answer_bool` tinyint(1) DEFAULT NULL,
  `answer_datetime` datetime DEFAULT NULL,
  `surveyquestion_id` char(36) DEFAULT NULL,
  `surveyresponse_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestionresponses_audit`
--

CREATE TABLE IF NOT EXISTS `surveyquestionresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestions`
--

CREATE TABLE IF NOT EXISTS `surveyquestions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `happiness_question` tinyint(1) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyquestions_audit`
--

CREATE TABLE IF NOT EXISTS `surveyquestions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyresponses`
--

CREATE TABLE IF NOT EXISTS `surveyresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `happiness` int(11) DEFAULT NULL,
  `email_response_sent` tinyint(1) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveyresponses_audit`
--

CREATE TABLE IF NOT EXISTS `surveyresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE IF NOT EXISTS `surveys` (
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
  `submit_text` varchar(255) DEFAULT 'Submit',
  `satisfied_text` varchar(255) DEFAULT 'Satisfied',
  `neither_text` varchar(255) DEFAULT 'Neither Satisfied nor Dissatisfied',
  `dissatisfied_text` varchar(255) DEFAULT 'Dissatisfied'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surveys_audit`
--

CREATE TABLE IF NOT EXISTS `surveys_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
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
  `priority` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatesectionline`
--

CREATE TABLE IF NOT EXISTS `templatesectionline` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `grp` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `id` int(11) NOT NULL,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_history`
--

CREATE TABLE IF NOT EXISTS `upgrade_history` (
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
  `enabled` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
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
  `factor_auth` tinyint(1) DEFAULT NULL,
  `factor_auth_interface` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_hash`, `system_generated_password`, `pwd_last_changed`, `authenticate_id`, `sugar_login`, `first_name`, `last_name`, `is_admin`, `external_auth_only`, `receive_notifications`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `title`, `photo`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `status`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `deleted`, `portal_only`, `show_on_employees`, `employee_status`, `messenger_id`, `messenger_type`, `reports_to_id`, `is_group`, `factor_auth`, `factor_auth_interface`) VALUES
('1', 'admin', '$2y$10$c821gl0m4hny.n3CxZA0Xe3NRh.iTwbDa8BocCoV7KI2aQSY7VF6m', 0, NULL, NULL, 1, NULL, 'Administrator', 1, 0, 1, NULL, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', '', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_feeds`
--

CREATE TABLE IF NOT EXISTS `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_last_import`
--

CREATE TABLE IF NOT EXISTS `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_password_link`
--

CREATE TABLE IF NOT EXISTS `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_signatures`
--

CREATE TABLE IF NOT EXISTS `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE IF NOT EXISTS `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `category`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`) VALUES
('1a715be5-f4b7-1960-e301-5de4cedd3633', 'global', 0, '2019-12-02 08:42:54', '2019-12-02 08:43:20', '1', 'YToyMzp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6IjE5MjAwNzRmLTJlM2ItNTA3ZC1mMDFjLTVkZTRjZWJjYTY4OCI7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoyMDoic29ydF9tb2R1bGVzX2J5X25hbWUiO3M6MDoiIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjA6IiI7czoyNToiY291bnRfY29sbGFwc2VkX3N1YnBhbmVscyI7czowOiIiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6ODoidGltZXpvbmUiO3M6MzoiVVRDIjtzOjI6InV0IjtzOjE6IjEiO3M6MTU6Im1haWxfc210cHNlcnZlciI7czowOiIiO3M6MTM6Im1haWxfc210cHBvcnQiO3M6MjoiMjUiO3M6MTM6Im1haWxfc210cHVzZXIiO3M6MDoiIjtzOjEzOiJtYWlsX3NtdHBwYXNzIjtzOjA6IiI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mzoib2ZmIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czoxOiIxIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MTtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MTA6InVzZXJfdGhlbWUiO3M6NjoiU3VpdGVQIjtzOjE5OiJ0aGVtZV9jdXJyZW50X2dyb3VwIjtzOjM6IkFsbCI7fQ=='),
('1bdfe73d-e6ea-4931-9156-5de4ceccac02', 'GoogleSync', 0, '2019-12-02 08:42:54', '2019-12-02 08:42:54', '1', 'YToxOntzOjg6InN5bmNHQ2FsIjtpOjA7fQ=='),
('6a4d2d47-06a2-a369-bf55-5de4ce69559c', 'Home', 0, '2019-12-02 08:43:20', '2019-12-02 08:43:20', '1', 'YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6IjExZTFhM2E0LTM2YWMtNTgwZS01Zjg2LTVkZTRjZTM3ODI0NCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6IjEyOGI1YmZkLTE5NzktZTNmNS1iMjE3LTVkZTRjZTVkNzkyNCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjE0MDJjOTA3LTU3NTgtZDZjMS00Y2ExLTVkZTRjZTM2MjI0OCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjE0NzM1YWRlLWFlNzYtMTk4OS0wZDNmLTVkZTRjZTAyMDY5ZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMTU3NGFkYWYtYmRiNi1lNjVhLTVhNzUtNWRlNGNlMDRiOWEyIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiMTVlYjIyN2YtNzgzZC0xMWQxLTY1NGEtNWRlNGNlMTlkMDUyIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiIxMjhiNWJmZC0xOTc5LWUzZjUtYjIxNy01ZGU0Y2U1ZDc5MjQiO2k6MTtzOjM2OiIxNDAyYzkwNy01NzU4LWQ2YzEtNGNhMS01ZGU0Y2UzNjIyNDgiO2k6MjtzOjM2OiIxNDczNWFkZS1hZTc2LTE5ODktMGQzZi01ZGU0Y2UwMjA2OWUiO2k6MztzOjM2OiIxNTc0YWRhZi1iZGI2LWU2NWEtNWE3NS01ZGU0Y2UwNGI5YTIiO2k6NDtzOjM2OiIxNWViMjI3Zi03ODNkLTExZDEtNjU0YS01ZGU0Y2UxOWQwNTIiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6IjExZTFhM2E0LTM2YWMtNTgwZS01Zjg2LTVkZTRjZTM3ODI0NCI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),
('6cf160d6-d34e-c639-106c-5de4cea204a2', 'Home2_CALL', 0, '2019-12-02 08:43:20', '2019-12-02 08:43:20', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('6f2ef200-ce3c-812f-32e6-5de4cee3d13d', 'Home2_MEETING', 0, '2019-12-02 08:43:20', '2019-12-02 08:43:20', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('718643fa-bbf6-1a45-e52a-5de4ced444bb', 'Home2_OPPORTUNITY', 0, '2019-12-02 08:43:20', '2019-12-02 08:43:20', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('73a826c3-a83d-0b23-0f9c-5de4ce7e58de', 'Home2_ACCOUNT', 0, '2019-12-02 08:43:20', '2019-12-02 08:43:20', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('7602ab16-f87a-16a9-ffe0-5de4ce61cc7e', 'Home2_LEAD', 0, '2019-12-02 08:43:20', '2019-12-02 08:43:20', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('786aab78-5fe2-507a-0261-5de4ceb68085', 'Home2_SUGARFEED', 0, '2019-12-02 08:43:20', '2019-12-02 08:43:20', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d8ddafcd-d5c3-f77b-240d-5de4cea2ddb5', 'Home2_LEAD_15eb227f-783d-11d1-654a-5de4ce19d052', 0, '2019-12-02 08:43:23', '2019-12-02 08:43:23', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');

-- --------------------------------------------------------

--
-- Table structure for table `vcals`
--

CREATE TABLE IF NOT EXISTS `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_accnt_id_del` (`id`,`deleted`),
  ADD KEY `idx_accnt_name_del` (`name`,`deleted`),
  ADD KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  ADD KEY `idx_accnt_parent_id` (`parent_id`);

--
-- Indexes for table `accounts_audit`
--
ALTER TABLE `accounts_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_accounts_parent_id` (`parent_id`);

--
-- Indexes for table `accounts_bugs`
--
ALTER TABLE `accounts_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_acc_bug_acc` (`account_id`),
  ADD KEY `idx_acc_bug_bug` (`bug_id`),
  ADD KEY `idx_account_bug` (`account_id`,`bug_id`);

--
-- Indexes for table `accounts_cases`
--
ALTER TABLE `accounts_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_acc_case_acc` (`account_id`),
  ADD KEY `idx_acc_acc_case` (`case_id`);

--
-- Indexes for table `accounts_contacts`
--
ALTER TABLE `accounts_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_account_contact` (`account_id`,`contact_id`),
  ADD KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`);

--
-- Indexes for table `accounts_cstm`
--
ALTER TABLE `accounts_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `accounts_opportunities`
--
ALTER TABLE `accounts_opportunities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  ADD KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`);

--
-- Indexes for table `acl_actions`
--
ALTER TABLE `acl_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aclaction_id_del` (`id`,`deleted`),
  ADD KEY `idx_category_name` (`category`,`name`);

--
-- Indexes for table `acl_roles`
--
ALTER TABLE `acl_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aclrole_id_del` (`id`,`deleted`);

--
-- Indexes for table `acl_roles_actions`
--
ALTER TABLE `acl_roles_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_acl_role_id` (`role_id`),
  ADD KEY `idx_acl_action_id` (`action_id`),
  ADD KEY `idx_aclrole_action` (`role_id`,`action_id`);

--
-- Indexes for table `acl_roles_users`
--
ALTER TABLE `acl_roles_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aclrole_id` (`role_id`),
  ADD KEY `idx_acluser_id` (`user_id`),
  ADD KEY `idx_aclrole_user` (`role_id`,`user_id`);

--
-- Indexes for table `address_book`
--
ALTER TABLE `address_book`
  ADD KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `am_projecttemplates`
--
ALTER TABLE `am_projecttemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `am_projecttemplates_audit`
--
ALTER TABLE `am_projecttemplates_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_am_projecttemplates_parent_id` (`parent_id`);

--
-- Indexes for table `am_projecttemplates_contacts_1_c`
--
ALTER TABLE `am_projecttemplates_contacts_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `am_projecttemplates_contacts_1_alt` (`am_projecttemplates_ida`,`contacts_idb`);

--
-- Indexes for table `am_projecttemplates_project_1_c`
--
ALTER TABLE `am_projecttemplates_project_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  ADD KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`);

--
-- Indexes for table `am_projecttemplates_users_1_c`
--
ALTER TABLE `am_projecttemplates_users_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `am_projecttemplates_users_1_alt` (`am_projecttemplates_ida`,`users_idb`);

--
-- Indexes for table `am_tasktemplates`
--
ALTER TABLE `am_tasktemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `am_tasktemplates_am_projecttemplates_c`
--
ALTER TABLE `am_tasktemplates_am_projecttemplates_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  ADD KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`);

--
-- Indexes for table `am_tasktemplates_audit`
--
ALTER TABLE `am_tasktemplates_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_am_tasktemplates_parent_id` (`parent_id`);

--
-- Indexes for table `aobh_businesshours`
--
ALTER TABLE `aobh_businesshours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aod_index`
--
ALTER TABLE `aod_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aod_indexevent`
--
ALTER TABLE `aod_indexevent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_record_module` (`record_module`),
  ADD KEY `idx_record_id` (`record_id`);

--
-- Indexes for table `aod_indexevent_audit`
--
ALTER TABLE `aod_indexevent_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aod_indexevent_parent_id` (`parent_id`);

--
-- Indexes for table `aod_index_audit`
--
ALTER TABLE `aod_index_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aod_index_parent_id` (`parent_id`);

--
-- Indexes for table `aok_knowledgebase`
--
ALTER TABLE `aok_knowledgebase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aok_knowledgebase_audit`
--
ALTER TABLE `aok_knowledgebase_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aok_knowledgebase_parent_id` (`parent_id`);

--
-- Indexes for table `aok_knowledgebase_categories`
--
ALTER TABLE `aok_knowledgebase_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aok_knowledgebase_categories_alt` (`aok_knowledgebase_id`,`aok_knowledge_base_categories_id`);

--
-- Indexes for table `aok_knowledge_base_categories`
--
ALTER TABLE `aok_knowledge_base_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aok_knowledge_base_categories_audit`
--
ALTER TABLE `aok_knowledge_base_categories_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aok_knowledge_base_categories_parent_id` (`parent_id`);

--
-- Indexes for table `aop_case_events`
--
ALTER TABLE `aop_case_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aop_case_events_audit`
--
ALTER TABLE `aop_case_events_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aop_case_events_parent_id` (`parent_id`);

--
-- Indexes for table `aop_case_updates`
--
ALTER TABLE `aop_case_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aop_case_updates_audit`
--
ALTER TABLE `aop_case_updates_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aop_case_updates_parent_id` (`parent_id`);

--
-- Indexes for table `aor_charts`
--
ALTER TABLE `aor_charts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aor_conditions`
--
ALTER TABLE `aor_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aor_conditions_index_report_id` (`aor_report_id`);

--
-- Indexes for table `aor_fields`
--
ALTER TABLE `aor_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aor_fields_index_report_id` (`aor_report_id`);

--
-- Indexes for table `aor_reports`
--
ALTER TABLE `aor_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aor_reports_audit`
--
ALTER TABLE `aor_reports_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aor_reports_parent_id` (`parent_id`);

--
-- Indexes for table `aor_scheduled_reports`
--
ALTER TABLE `aor_scheduled_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_contracts`
--
ALTER TABLE `aos_contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_contracts_audit`
--
ALTER TABLE `aos_contracts_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_contracts_parent_id` (`parent_id`);

--
-- Indexes for table `aos_contracts_documents`
--
ALTER TABLE `aos_contracts_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`);

--
-- Indexes for table `aos_invoices`
--
ALTER TABLE `aos_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_invoices_audit`
--
ALTER TABLE `aos_invoices_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_invoices_parent_id` (`parent_id`);

--
-- Indexes for table `aos_line_item_groups`
--
ALTER TABLE `aos_line_item_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_line_item_groups_audit`
--
ALTER TABLE `aos_line_item_groups_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_line_item_groups_parent_id` (`parent_id`);

--
-- Indexes for table `aos_pdf_templates`
--
ALTER TABLE `aos_pdf_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_pdf_templates_audit`
--
ALTER TABLE `aos_pdf_templates_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_pdf_templates_parent_id` (`parent_id`);

--
-- Indexes for table `aos_products`
--
ALTER TABLE `aos_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_products_audit`
--
ALTER TABLE `aos_products_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_products_parent_id` (`parent_id`);

--
-- Indexes for table `aos_products_quotes`
--
ALTER TABLE `aos_products_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`);

--
-- Indexes for table `aos_products_quotes_audit`
--
ALTER TABLE `aos_products_quotes_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_products_quotes_parent_id` (`parent_id`);

--
-- Indexes for table `aos_product_categories`
--
ALTER TABLE `aos_product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_product_categories_audit`
--
ALTER TABLE `aos_product_categories_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_product_categories_parent_id` (`parent_id`);

--
-- Indexes for table `aos_quotes`
--
ALTER TABLE `aos_quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aos_quotes_aos_invoices_c`
--
ALTER TABLE `aos_quotes_aos_invoices_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`);

--
-- Indexes for table `aos_quotes_audit`
--
ALTER TABLE `aos_quotes_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aos_quotes_parent_id` (`parent_id`);

--
-- Indexes for table `aos_quotes_os_contracts_c`
--
ALTER TABLE `aos_quotes_os_contracts_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`);

--
-- Indexes for table `aos_quotes_project_c`
--
ALTER TABLE `aos_quotes_project_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`);

--
-- Indexes for table `aow_actions`
--
ALTER TABLE `aow_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aow_action_index_workflow_id` (`aow_workflow_id`);

--
-- Indexes for table `aow_conditions`
--
ALTER TABLE `aow_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`);

--
-- Indexes for table `aow_processed`
--
ALTER TABLE `aow_processed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aow_processed_index_workflow` (`aow_workflow_id`,`status`,`parent_id`,`deleted`),
  ADD KEY `aow_processed_index_status` (`status`),
  ADD KEY `aow_processed_index_workflow_id` (`aow_workflow_id`);

--
-- Indexes for table `aow_processed_aow_actions`
--
ALTER TABLE `aow_processed_aow_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  ADD KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`);

--
-- Indexes for table `aow_workflow`
--
ALTER TABLE `aow_workflow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aow_workflow_index_status` (`status`);

--
-- Indexes for table `aow_workflow_audit`
--
ALTER TABLE `aow_workflow_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_aow_workflow_parent_id` (`parent_id`);

--
-- Indexes for table `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bugsnumk` (`bug_number`),
  ADD KEY `bug_number` (`bug_number`),
  ADD KEY `idx_bug_name` (`name`),
  ADD KEY `idx_bugs_assigned_user` (`assigned_user_id`);

--
-- Indexes for table `bugs_audit`
--
ALTER TABLE `bugs_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bugs_parent_id` (`parent_id`);

--
-- Indexes for table `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_call_name` (`name`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_calls_date_start` (`date_start`),
  ADD KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  ADD KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`);

--
-- Indexes for table `calls_contacts`
--
ALTER TABLE `calls_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_call_call` (`call_id`),
  ADD KEY `idx_con_call_con` (`contact_id`),
  ADD KEY `idx_call_contact` (`call_id`,`contact_id`);

--
-- Indexes for table `calls_leads`
--
ALTER TABLE `calls_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lead_call_call` (`call_id`),
  ADD KEY `idx_lead_call_lead` (`lead_id`),
  ADD KEY `idx_call_lead` (`call_id`,`lead_id`);

--
-- Indexes for table `calls_reschedule`
--
ALTER TABLE `calls_reschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calls_reschedule_audit`
--
ALTER TABLE `calls_reschedule_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_calls_reschedule_parent_id` (`parent_id`);

--
-- Indexes for table `calls_users`
--
ALTER TABLE `calls_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usr_call_call` (`call_id`),
  ADD KEY `idx_usr_call_usr` (`user_id`),
  ADD KEY `idx_call_users` (`call_id`,`user_id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camp_auto_tracker_key` (`tracker_key`),
  ADD KEY `idx_campaign_name` (`name`),
  ADD KEY `idx_survey_id` (`survey_id`);

--
-- Indexes for table `campaigns_audit`
--
ALTER TABLE `campaigns_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_campaigns_parent_id` (`parent_id`);

--
-- Indexes for table `campaign_log`
--
ALTER TABLE `campaign_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_camp_tracker` (`target_tracker_key`),
  ADD KEY `idx_camp_campaign_id` (`campaign_id`),
  ADD KEY `idx_camp_more_info` (`more_information`),
  ADD KEY `idx_target_id` (`target_id`),
  ADD KEY `idx_target_id_deleted` (`target_id`,`deleted`);

--
-- Indexes for table `campaign_trkrs`
--
ALTER TABLE `campaign_trkrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_tracker_key_idx` (`tracker_key`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `casesnumk` (`case_number`),
  ADD KEY `case_number` (`case_number`),
  ADD KEY `idx_case_name` (`name`),
  ADD KEY `idx_account_id` (`account_id`),
  ADD KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`);

--
-- Indexes for table `cases_audit`
--
ALTER TABLE `cases_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cases_parent_id` (`parent_id`);

--
-- Indexes for table `cases_bugs`
--
ALTER TABLE `cases_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cas_bug_cas` (`case_id`),
  ADD KEY `idx_cas_bug_bug` (`bug_id`),
  ADD KEY `idx_case_bug` (`case_id`,`bug_id`);

--
-- Indexes for table `cases_cstm`
--
ALTER TABLE `cases_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD KEY `idx_config_cat` (`category`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  ADD KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  ADD KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  ADD KEY `idx_reports_to_id` (`reports_to_id`),
  ADD KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  ADD KEY `idx_cont_assigned` (`assigned_user_id`);

--
-- Indexes for table `contacts_audit`
--
ALTER TABLE `contacts_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contacts_parent_id` (`parent_id`);

--
-- Indexes for table `contacts_bugs`
--
ALTER TABLE `contacts_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_bug_con` (`contact_id`),
  ADD KEY `idx_con_bug_bug` (`bug_id`),
  ADD KEY `idx_contact_bug` (`contact_id`,`bug_id`);

--
-- Indexes for table `contacts_cases`
--
ALTER TABLE `contacts_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_case_con` (`contact_id`),
  ADD KEY `idx_con_case_case` (`case_id`),
  ADD KEY `idx_contacts_cases` (`contact_id`,`case_id`);

--
-- Indexes for table `contacts_cstm`
--
ALTER TABLE `contacts_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `contacts_users`
--
ALTER TABLE `contacts_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_users_con` (`contact_id`),
  ADD KEY `idx_con_users_user` (`user_id`),
  ADD KEY `idx_contacts_users` (`contact_id`,`user_id`);

--
-- Indexes for table `cron_remove_documents`
--
ALTER TABLE `cron_remove_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  ADD KEY `idx_cron_remove_document_stamp` (`date_modified`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_currency_name` (`name`,`deleted`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD KEY `idx_beanid_set_num` (`bean_id`,`set_num`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_doc_cat` (`category_id`,`subcategory_id`);

--
-- Indexes for table `documents_accounts`
--
ALTER TABLE `documents_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  ADD KEY `documents_accounts_document_id` (`document_id`,`account_id`);

--
-- Indexes for table `documents_bugs`
--
ALTER TABLE `documents_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  ADD KEY `documents_bugs_document_id` (`document_id`,`bug_id`);

--
-- Indexes for table `documents_cases`
--
ALTER TABLE `documents_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_cases_case_id` (`case_id`,`document_id`),
  ADD KEY `documents_cases_document_id` (`document_id`,`case_id`);

--
-- Indexes for table `documents_contacts`
--
ALTER TABLE `documents_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  ADD KEY `documents_contacts_document_id` (`document_id`,`contact_id`);

--
-- Indexes for table `documents_opportunities`
--
ALTER TABLE `documents_opportunities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  ADD KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`);

--
-- Indexes for table `document_revisions`
--
ALTER TABLE `document_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentrevision_mimetype` (`file_mime_type`);

--
-- Indexes for table `eapm`
--
ALTER TABLE `eapm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`);

--
-- Indexes for table `emailman`
--
ALTER TABLE `emailman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  ADD KEY `idx_eman_campaign_id` (`campaign_id`),
  ADD KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_name` (`name`),
  ADD KEY `idx_message_id` (`message_id`),
  ADD KEY `idx_email_parent_id` (`parent_id`),
  ADD KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`),
  ADD KEY `idx_email_cat` (`category_id`);

--
-- Indexes for table `emails_beans`
--
ALTER TABLE `emails_beans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_emails_beans_bean_id` (`bean_id`),
  ADD KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`);

--
-- Indexes for table `emails_email_addr_rel`
--
ALTER TABLE `emails_email_addr_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  ADD KEY `idx_eearl_address_id` (`email_address_id`);

--
-- Indexes for table `emails_text`
--
ALTER TABLE `emails_text`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `emails_textfromaddr` (`from_addr`);

--
-- Indexes for table `email_addresses`
--
ALTER TABLE `email_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  ADD KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`);

--
-- Indexes for table `email_addresses_audit`
--
ALTER TABLE `email_addresses_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_addresses_parent_id` (`parent_id`);

--
-- Indexes for table `email_addr_bean_rel`
--
ALTER TABLE `email_addr_bean_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_address_id` (`email_address_id`),
  ADD KEY `idx_bean_id` (`bean_id`,`bean_module`);

--
-- Indexes for table `email_cache`
--
ALTER TABLE `email_cache`
  ADD KEY `idx_ie_id` (`ie_id`),
  ADD KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  ADD KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  ADD KEY `idx_mail_subj` (`subject`),
  ADD KEY `idx_mail_to` (`toaddr`);

--
-- Indexes for table `email_marketing`
--
ALTER TABLE `email_marketing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_emmkt_name` (`name`),
  ADD KEY `idx_emmkit_del` (`deleted`);

--
-- Indexes for table `email_marketing_prospect_lists`
--
ALTER TABLE `email_marketing_prospect_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email_template_name` (`name`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fields_meta_data`
--
ALTER TABLE `fields_meta_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_meta_id_del` (`id`,`deleted`),
  ADD KEY `idx_meta_cm_del` (`custom_module`,`deleted`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_folder` (`parent_folder`);

--
-- Indexes for table `folders_rel`
--
ALTER TABLE `folders_rel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  ADD KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`);

--
-- Indexes for table `folders_subscriptions`
--
ALTER TABLE `folders_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`);

--
-- Indexes for table `fp_events`
--
ALTER TABLE `fp_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fp_events_audit`
--
ALTER TABLE `fp_events_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fp_events_parent_id` (`parent_id`);

--
-- Indexes for table `fp_events_contacts_c`
--
ALTER TABLE `fp_events_contacts_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`);

--
-- Indexes for table `fp_events_fp_event_delegates_1_c`
--
ALTER TABLE `fp_events_fp_event_delegates_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  ADD KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`);

--
-- Indexes for table `fp_events_fp_event_locations_1_c`
--
ALTER TABLE `fp_events_fp_event_locations_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`);

--
-- Indexes for table `fp_events_leads_1_c`
--
ALTER TABLE `fp_events_leads_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`);

--
-- Indexes for table `fp_events_prospects_1_c`
--
ALTER TABLE `fp_events_prospects_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`);

--
-- Indexes for table `fp_event_locations`
--
ALTER TABLE `fp_event_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fp_event_locations_audit`
--
ALTER TABLE `fp_event_locations_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fp_event_locations_parent_id` (`parent_id`);

--
-- Indexes for table `fp_event_locations_fp_events_1_c`
--
ALTER TABLE `fp_event_locations_fp_events_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  ADD KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`);

--
-- Indexes for table `import_maps`
--
ALTER TABLE `import_maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`);

--
-- Indexes for table `inbound_email`
--
ALTER TABLE `inbound_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inbound_email_autoreply`
--
ALTER TABLE `inbound_email_autoreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ie_autoreplied_to` (`autoreplied_to`);

--
-- Indexes for table `inbound_email_cache_ts`
--
ALTER TABLE `inbound_email_cache_ts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_address_cache`
--
ALTER TABLE `jjwg_address_cache`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_address_cache_audit`
--
ALTER TABLE `jjwg_address_cache_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jjwg_address_cache_parent_id` (`parent_id`);

--
-- Indexes for table `jjwg_areas`
--
ALTER TABLE `jjwg_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_areas_audit`
--
ALTER TABLE `jjwg_areas_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jjwg_areas_parent_id` (`parent_id`);

--
-- Indexes for table `jjwg_maps`
--
ALTER TABLE `jjwg_maps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_maps_audit`
--
ALTER TABLE `jjwg_maps_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jjwg_maps_parent_id` (`parent_id`);

--
-- Indexes for table `jjwg_maps_jjwg_areas_c`
--
ALTER TABLE `jjwg_maps_jjwg_areas_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`);

--
-- Indexes for table `jjwg_maps_jjwg_markers_c`
--
ALTER TABLE `jjwg_maps_jjwg_markers_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`);

--
-- Indexes for table `jjwg_markers`
--
ALTER TABLE `jjwg_markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjwg_markers_audit`
--
ALTER TABLE `jjwg_markers_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jjwg_markers_parent_id` (`parent_id`);

--
-- Indexes for table `job_queue`
--
ALTER TABLE `job_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  ADD KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  ADD KEY `idx_status_entered` (`status`,`date_entered`),
  ADD KEY `idx_status_modified` (`status`,`date_modified`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  ADD KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  ADD KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  ADD KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  ADD KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  ADD KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  ADD KEY `idx_lead_assigned` (`assigned_user_id`),
  ADD KEY `idx_lead_contact` (`contact_id`),
  ADD KEY `idx_reports_to` (`reports_to_id`),
  ADD KEY `idx_lead_phone_work` (`phone_work`),
  ADD KEY `idx_leads_id_del` (`id`,`deleted`);

--
-- Indexes for table `leads_audit`
--
ALTER TABLE `leads_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_leads_parent_id` (`parent_id`);

--
-- Indexes for table `leads_cstm`
--
ALTER TABLE `leads_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `linked_documents`
--
ALTER TABLE `linked_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mtg_name` (`name`),
  ADD KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  ADD KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  ADD KEY `idx_meet_date_start` (`date_start`);

--
-- Indexes for table `meetings_contacts`
--
ALTER TABLE `meetings_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_mtg_mtg` (`meeting_id`),
  ADD KEY `idx_con_mtg_con` (`contact_id`),
  ADD KEY `idx_meeting_contact` (`meeting_id`,`contact_id`);

--
-- Indexes for table `meetings_cstm`
--
ALTER TABLE `meetings_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `meetings_leads`
--
ALTER TABLE `meetings_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lead_meeting_meeting` (`meeting_id`),
  ADD KEY `idx_lead_meeting_lead` (`lead_id`),
  ADD KEY `idx_meeting_lead` (`meeting_id`,`lead_id`);

--
-- Indexes for table `meetings_users`
--
ALTER TABLE `meetings_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usr_mtg_mtg` (`meeting_id`),
  ADD KEY `idx_usr_mtg_usr` (`user_id`),
  ADD KEY `idx_meeting_users` (`meeting_id`,`user_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_note_name` (`name`),
  ADD KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  ADD KEY `idx_note_contact` (`contact_id`),
  ADD KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`);

--
-- Indexes for table `oauth2clients`
--
ALTER TABLE `oauth2clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth2tokens`
--
ALTER TABLE `oauth2tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_consumer`
--
ALTER TABLE `oauth_consumer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ckey` (`c_key`);

--
-- Indexes for table `oauth_nonce`
--
ALTER TABLE `oauth_nonce`
  ADD PRIMARY KEY (`conskey`,`nonce`),
  ADD KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`);

--
-- Indexes for table `oauth_tokens`
--
ALTER TABLE `oauth_tokens`
  ADD PRIMARY KEY (`id`,`deleted`),
  ADD KEY `oauth_state_ts` (`tstate`,`token_ts`),
  ADD KEY `constoken_key` (`consumer`);

--
-- Indexes for table `opportunities`
--
ALTER TABLE `opportunities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_opp_name` (`name`),
  ADD KEY `idx_opp_assigned` (`assigned_user_id`),
  ADD KEY `idx_opp_id_deleted` (`id`,`deleted`);

--
-- Indexes for table `opportunities_audit`
--
ALTER TABLE `opportunities_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_opportunities_parent_id` (`parent_id`);

--
-- Indexes for table `opportunities_contacts`
--
ALTER TABLE `opportunities_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_con_opp_con` (`contact_id`),
  ADD KEY `idx_con_opp_opp` (`opportunity_id`),
  ADD KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`);

--
-- Indexes for table `opportunities_cstm`
--
ALTER TABLE `opportunities_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `outbound_email`
--
ALTER TABLE `outbound_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outbound_email_audit`
--
ALTER TABLE `outbound_email_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_outbound_email_parent_id` (`parent_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects_accounts`
--
ALTER TABLE `projects_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_acct_proj` (`project_id`),
  ADD KEY `idx_proj_acct_acct` (`account_id`),
  ADD KEY `projects_accounts_alt` (`project_id`,`account_id`);

--
-- Indexes for table `projects_bugs`
--
ALTER TABLE `projects_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_bug_proj` (`project_id`),
  ADD KEY `idx_proj_bug_bug` (`bug_id`),
  ADD KEY `projects_bugs_alt` (`project_id`,`bug_id`);

--
-- Indexes for table `projects_cases`
--
ALTER TABLE `projects_cases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_case_proj` (`project_id`),
  ADD KEY `idx_proj_case_case` (`case_id`),
  ADD KEY `projects_cases_alt` (`project_id`,`case_id`);

--
-- Indexes for table `projects_contacts`
--
ALTER TABLE `projects_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_con_proj` (`project_id`),
  ADD KEY `idx_proj_con_con` (`contact_id`),
  ADD KEY `projects_contacts_alt` (`project_id`,`contact_id`);

--
-- Indexes for table `projects_opportunities`
--
ALTER TABLE `projects_opportunities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_opp_proj` (`project_id`),
  ADD KEY `idx_proj_opp_opp` (`opportunity_id`),
  ADD KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`);

--
-- Indexes for table `projects_products`
--
ALTER TABLE `projects_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proj_prod_project` (`project_id`),
  ADD KEY `idx_proj_prod_product` (`product_id`),
  ADD KEY `projects_products_alt` (`project_id`,`product_id`);

--
-- Indexes for table `project_contacts_1_c`
--
ALTER TABLE `project_contacts_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`);

--
-- Indexes for table `project_cstm`
--
ALTER TABLE `project_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `project_task`
--
ALTER TABLE `project_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_task_audit`
--
ALTER TABLE `project_task_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_project_task_parent_id` (`parent_id`);

--
-- Indexes for table `project_users_1_c`
--
ALTER TABLE `project_users_1_c`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`);

--
-- Indexes for table `prospects`
--
ALTER TABLE `prospects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prospect_auto_tracker_key` (`tracker_key`),
  ADD KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  ADD KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  ADD KEY `idx_prospects_id_del` (`id`,`deleted`),
  ADD KEY `idx_prospects_assigned` (`assigned_user_id`);

--
-- Indexes for table `prospects_cstm`
--
ALTER TABLE `prospects_cstm`
  ADD PRIMARY KEY (`id_c`);

--
-- Indexes for table `prospect_lists`
--
ALTER TABLE `prospect_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_prospect_list_name` (`name`);

--
-- Indexes for table `prospect_lists_prospects`
--
ALTER TABLE `prospect_lists_prospects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_plp_pro_id` (`prospect_list_id`),
  ADD KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`);

--
-- Indexes for table `prospect_list_campaigns`
--
ALTER TABLE `prospect_list_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pro_id` (`prospect_list_id`),
  ADD KEY `idx_cam_id` (`campaign_id`),
  ADD KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`);

--
-- Indexes for table `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rel_name` (`relationship_name`);

--
-- Indexes for table `releases`
--
ALTER TABLE `releases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_releases` (`name`,`deleted`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reminder_name` (`name`),
  ADD KEY `idx_reminder_deleted` (`deleted`),
  ADD KEY `idx_reminder_related_event_module` (`related_event_module`),
  ADD KEY `idx_reminder_related_event_module_id` (`related_event_module_id`);

--
-- Indexes for table `reminders_invitees`
--
ALTER TABLE `reminders_invitees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reminder_invitee_name` (`name`),
  ADD KEY `idx_reminder_invitee_assigned_user_id` (`assigned_user_id`),
  ADD KEY `idx_reminder_invitee_reminder_id` (`reminder_id`),
  ADD KEY `idx_reminder_invitee_related_invitee_module` (`related_invitee_module`),
  ADD KEY `idx_reminder_invitee_related_invitee_module_id` (`related_invitee_module_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_role_id_del` (`id`,`deleted`);

--
-- Indexes for table `roles_modules`
--
ALTER TABLE `roles_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_role_id` (`role_id`),
  ADD KEY `idx_module_id` (`module_id`);

--
-- Indexes for table `roles_users`
--
ALTER TABLE `roles_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ru_role_id` (`role_id`),
  ADD KEY `idx_ru_user_id` (`user_id`);

--
-- Indexes for table `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_desc` (`name`,`deleted`);

--
-- Indexes for table `schedulers`
--
ALTER TABLE `schedulers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_schedule` (`date_time_start`,`deleted`);

--
-- Indexes for table `securitygroups`
--
ALTER TABLE `securitygroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `securitygroups_acl_roles`
--
ALTER TABLE `securitygroups_acl_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `securitygroups_audit`
--
ALTER TABLE `securitygroups_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_securitygroups_parent_id` (`parent_id`);

--
-- Indexes for table `securitygroups_default`
--
ALTER TABLE `securitygroups_default`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `securitygroups_records`
--
ALTER TABLE `securitygroups_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  ADD KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`);

--
-- Indexes for table `securitygroups_users`
--
ALTER TABLE `securitygroups_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `securitygroups_users_idxa` (`securitygroup_id`),
  ADD KEY `securitygroups_users_idxb` (`user_id`),
  ADD KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  ADD KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`);

--
-- Indexes for table `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sugarfeed`
--
ALTER TABLE `sugarfeed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sgrfeed_date` (`date_entered`,`deleted`);

--
-- Indexes for table `surveyquestionoptions`
--
ALTER TABLE `surveyquestionoptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveyquestionoptions_audit`
--
ALTER TABLE `surveyquestionoptions_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveyquestionoptions_parent_id` (`parent_id`);

--
-- Indexes for table `surveyquestionoptions_surveyquestionresponses`
--
ALTER TABLE `surveyquestionoptions_surveyquestionresponses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surveyquestionoptions_surveyquestionresponses_alt` (`surveyq72c7options_ida`,`surveyq10d4sponses_idb`);

--
-- Indexes for table `surveyquestionresponses`
--
ALTER TABLE `surveyquestionresponses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveyquestionresponses_audit`
--
ALTER TABLE `surveyquestionresponses_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveyquestionresponses_parent_id` (`parent_id`);

--
-- Indexes for table `surveyquestions`
--
ALTER TABLE `surveyquestions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveyquestions_audit`
--
ALTER TABLE `surveyquestions_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveyquestions_parent_id` (`parent_id`);

--
-- Indexes for table `surveyresponses`
--
ALTER TABLE `surveyresponses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveyresponses_audit`
--
ALTER TABLE `surveyresponses_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveyresponses_parent_id` (`parent_id`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveys_audit`
--
ALTER TABLE `surveys_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_surveys_parent_id` (`parent_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tsk_name` (`name`),
  ADD KEY `idx_task_con_del` (`contact_id`,`deleted`),
  ADD KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  ADD KEY `idx_task_assigned` (`assigned_user_id`),
  ADD KEY `idx_task_status` (`status`);

--
-- Indexes for table `templatesectionline`
--
ALTER TABLE `templatesectionline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tracker`
--
ALTER TABLE `tracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tracker_iid` (`item_id`),
  ADD KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  ADD KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  ADD KEY `idx_tracker_monitor_id` (`monitor_id`),
  ADD KEY `idx_tracker_date_modified` (`date_modified`);

--
-- Indexes for table `upgrade_history`
--
ALTER TABLE `upgrade_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`(30),`first_name`(30),`id`);

--
-- Indexes for table `users_feeds`
--
ALTER TABLE `users_feeds`
  ADD KEY `idx_ud_user_id` (`user_id`,`feed_id`);

--
-- Indexes for table `users_last_import`
--
ALTER TABLE `users_last_import`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`assigned_user_id`);

--
-- Indexes for table `users_password_link`
--
ALTER TABLE `users_password_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_username` (`username`);

--
-- Indexes for table `users_signatures`
--
ALTER TABLE `users_signatures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usersig_uid` (`user_id`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_userprefnamecat` (`assigned_user_id`,`category`);

--
-- Indexes for table `vcals`
--
ALTER TABLE `vcals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vcal` (`type`,`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bugs`
--
ALTER TABLE `bugs`
  MODIFY `bug_number` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `tracker_key` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_trkrs`
--
ALTER TABLE `campaign_trkrs`
  MODIFY `tracker_key` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `case_number` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emailman`
--
ALTER TABLE `emailman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prospects`
--
ALTER TABLE `prospects`
  MODIFY `tracker_key` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tracker`
--
ALTER TABLE `tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
