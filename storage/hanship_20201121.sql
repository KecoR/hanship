-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for hanship
CREATE DATABASE IF NOT EXISTS `hanship` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hanship`;

-- Dumping structure for table hanship.hs_master_cities
CREATE TABLE IF NOT EXISTS `hs_master_cities` (
  `vcr_city_id` varchar(50) NOT NULL,
  `vcr_city_name` varchar(50) NOT NULL,
  `vcr_provincy_id` varchar(50) NOT NULL,
  `vcr_country_id` varchar(50) NOT NULL,
  `vcr_city_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vcr_city_id`),
  KEY `fk_city_provincy` (`vcr_provincy_id`),
  KEY `fk_city_country` (`vcr_country_id`),
  CONSTRAINT `fk_city_country` FOREIGN KEY (`vcr_country_id`) REFERENCES `hs_master_countries` (`vcr_country_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_city_provincy` FOREIGN KEY (`vcr_provincy_id`) REFERENCES `hs_master_provincies` (`vcr_provincy_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_master_cities: ~14 rows (approximately)
/*!40000 ALTER TABLE `hs_master_cities` DISABLE KEYS */;
INSERT INTO `hs_master_cities` (`vcr_city_id`, `vcr_city_name`, `vcr_provincy_id`, `vcr_country_id`, `vcr_city_code`, `created_at`, `updated_at`) VALUES
	('3101', 'Kab Kepulauan Seribu', '31', 'id62', 'kepseribu', '2020-11-21 20:39:37', '2020-11-21 20:40:33'),
	('3171', 'Kota Jakarta Pusat', '31', 'id62', 'jakpus', '2020-11-21 20:41:01', NULL),
	('3172', 'Kota Jakarta Utara', '31', 'id62', 'jakut', '2020-11-21 20:41:22', NULL),
	('3173', 'Kota Jakarta Barat', '31', 'id62', 'jakbar', '2020-11-21 20:40:16', '2020-11-21 20:40:37'),
	('3174', 'Kota Jakarta Selatan', '31', 'id62', 'jaksel', '2020-11-21 20:41:46', NULL),
	('3175', 'Kota Jakarta Timur', '31', 'id62', 'jaktim', '2020-11-21 20:42:43', NULL),
	('3601', 'Kab  Pandeglang', '36', 'id62', NULL, '2020-11-21 20:44:17', NULL),
	('3602', 'Kab Lebak', '36', 'id62', NULL, '2020-11-21 20:44:42', NULL),
	('3603', 'Kab  Tangerang', '36', 'id62', NULL, '2020-11-21 20:45:06', NULL),
	('3604', 'Kab Serang', '36', 'id62', NULL, '2020-11-21 20:45:37', NULL),
	('3671', 'Kota Tangerang', '36', 'id62', NULL, '2020-11-21 20:46:17', NULL),
	('3672', 'Kota Cilegon', '36', 'id62', NULL, '2020-11-21 20:46:33', '2020-11-21 20:46:33'),
	('3673', 'Kota Serang', '36', 'id62', NULL, '2020-11-21 20:47:08', NULL),
	('3674', 'Kota Tangerang Selatan', '36', 'id62', NULL, '2020-11-21 20:47:27', NULL);
/*!40000 ALTER TABLE `hs_master_cities` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_master_countries
CREATE TABLE IF NOT EXISTS `hs_master_countries` (
  `vcr_country_id` varchar(50) NOT NULL,
  `vcr_country_name` varchar(50) NOT NULL,
  `vcr_country_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vcr_country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_master_countries: ~1 rows (approximately)
/*!40000 ALTER TABLE `hs_master_countries` DISABLE KEYS */;
INSERT INTO `hs_master_countries` (`vcr_country_id`, `vcr_country_name`, `vcr_country_code`, `created_at`, `updated_at`) VALUES
	('id62', 'Indonesia', 'idn', '2020-11-21 20:23:56', '2020-11-21 20:25:22');
/*!40000 ALTER TABLE `hs_master_countries` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_master_provincies
CREATE TABLE IF NOT EXISTS `hs_master_provincies` (
  `vcr_provincy_id` varchar(50) NOT NULL,
  `vcr_provincy_name` varchar(50) NOT NULL,
  `vcr_country_id` varchar(50) NOT NULL,
  `vcr_provincy_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vcr_provincy_id`),
  KEY `fk_rovincy_country_id` (`vcr_country_id`),
  CONSTRAINT `fk_rovincy_country_id` FOREIGN KEY (`vcr_country_id`) REFERENCES `hs_master_countries` (`vcr_country_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_master_provincies: ~8 rows (approximately)
/*!40000 ALTER TABLE `hs_master_provincies` DISABLE KEYS */;
INSERT INTO `hs_master_provincies` (`vcr_provincy_id`, `vcr_provincy_name`, `vcr_country_id`, `vcr_provincy_code`, `created_at`, `updated_at`) VALUES
	('11', 'Aceh (NAD)', 'id62', 'nad', '2020-11-21 20:26:23', NULL),
	('15', 'Jambi', 'id62', NULL, '2020-11-21 20:32:08', NULL),
	('17', 'Bengkulu', 'id62', NULL, '2020-11-21 20:29:27', NULL),
	('31', 'DKI Jakarta', 'id62', NULL, '2020-11-21 20:30:34', NULL),
	('34', 'DI Yogyakarta', 'id62', NULL, '2020-11-21 20:30:15', NULL),
	('36', 'Banten', 'id62', NULL, '2020-11-21 20:27:26', '2020-11-21 20:29:49'),
	('51', 'Bali', 'id62', NULL, '2020-11-21 20:27:05', '2020-11-21 20:29:45'),
	('75', 'Gorontalo', 'id62', NULL, '2020-11-21 20:30:52', NULL);
/*!40000 ALTER TABLE `hs_master_provincies` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_assets
CREATE TABLE IF NOT EXISTS `hs_tour_assets` (
  `vch_asset_id` varchar(50) NOT NULL,
  `vch_hotel_id` varchar(50) DEFAULT NULL,
  `vch_boat_id` varchar(50) DEFAULT NULL,
  `vch_travel_id` varchar(50) DEFAULT NULL,
  `int_amount` int(11) NOT NULL,
  `txt_asset_description` longtext,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vch_asset_id`),
  KEY `fk_asset_boat` (`vch_boat_id`),
  KEY `fk_asset_hotel` (`vch_hotel_id`),
  KEY `fk_asset_travel` (`vch_travel_id`),
  CONSTRAINT `fk_asset_boat` FOREIGN KEY (`vch_boat_id`) REFERENCES `hs_tour_boats` (`vch_boat_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_asset_hotel` FOREIGN KEY (`vch_hotel_id`) REFERENCES `hs_tour_hotels` (`vch_hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_asset_travel` FOREIGN KEY (`vch_travel_id`) REFERENCES `hs_tour_travels` (`vch_travel_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_assets: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_assets` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_boats
CREATE TABLE IF NOT EXISTS `hs_tour_boats` (
  `vch_boat_id` varchar(50) NOT NULL,
  `vch_boat_name` varchar(100) NOT NULL,
  `vch_boat_type_id` varchar(50) NOT NULL,
  `int_capacity` int(11) NOT NULL,
  `txt_boat_description` text,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`vch_boat_id`),
  KEY `fk_boat_type` (`vch_boat_type_id`),
  CONSTRAINT `fk_boat_type` FOREIGN KEY (`vch_boat_type_id`) REFERENCES `hs_master_boat_types` (`vcr_boat_type_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_boats: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_boats` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_boats` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_boat_user
CREATE TABLE IF NOT EXISTS `hs_tour_boat_user` (
  `int_mitra_user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vch_boat_id` varchar(50) DEFAULT NULL,
  `vch_user_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`int_mitra_user_id`),
  KEY `fk_boat_user_id` (`vch_boat_id`),
  KEY `fk_user_boat_id` (`vch_user_id`),
  CONSTRAINT `fk_boat_user` FOREIGN KEY (`vch_boat_id`) REFERENCES `hs_tour_boats` (`vch_boat_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_user_boat` FOREIGN KEY (`vch_user_id`) REFERENCES `hs_tour_users` (`vch_user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_tour_boat_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_boat_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_boat_user` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_fees
CREATE TABLE IF NOT EXISTS `hs_tour_fees` (
  `vch_fee_id` varchar(50) NOT NULL,
  `vch_fee_code` varchar(50) NOT NULL COMMENT 'master_date_id',
  `vch_fee_type` varchar(50) NOT NULL,
  `dec_fee_amount` decimal(11,2) NOT NULL,
  `dtm_start_date` datetime DEFAULT NULL,
  `dtm_end_date` datetime DEFAULT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`vch_fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='ga usah ada forenkey keluar';

-- Dumping data for table hanship.hs_tour_fees: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_fees` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_forgot_passwords
CREATE TABLE IF NOT EXISTS `hs_tour_forgot_passwords` (
  `int_forgot_passwords_id` int(11) NOT NULL AUTO_INCREMENT,
  `vch_email` varchar(255) NOT NULL,
  `vch_token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`int_forgot_passwords_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ga usah ada forenkey keluar';

-- Dumping data for table hanship.hs_tour_forgot_passwords: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_forgot_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_forgot_passwords` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_harbours
CREATE TABLE IF NOT EXISTS `hs_tour_harbours` (
  `vch_harbour_id` varchar(50) NOT NULL,
  `vch_harbour_name` varchar(30) DEFAULT NULL,
  `txt_harbour_address` text,
  `vcr_island_id` varchar(50) DEFAULT NULL,
  `vcr_city_id` varchar(50) DEFAULT NULL,
  `vcr_zip_code` varchar(50) DEFAULT NULL,
  `txt_harbour_description` text,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vch_harbour_id`),
  KEY `fk_harbour_city_id` (`vcr_city_id`),
  KEY `fk_harbour_island_id` (`vcr_island_id`),
  CONSTRAINT `fk_harbour_city_id` FOREIGN KEY (`vcr_city_id`) REFERENCES `hs_master_cities` (`vcr_city_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_harbour_island_id` FOREIGN KEY (`vcr_island_id`) REFERENCES `hs_tour_islands` (`vch_island_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_tour_harbours: ~4 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_harbours` DISABLE KEYS */;
INSERT INTO `hs_tour_harbours` (`vch_harbour_id`, `vch_harbour_name`, `txt_harbour_address`, `vcr_island_id`, `vcr_city_id`, `vcr_zip_code`, `txt_harbour_description`, `status`, `created_at`, `updated_at`, `deleted_at`, `user`) VALUES
	('0179ec936452ed4df4e0182965a71074', 'Pelabuhan muara kamal', '8 RT.8, RT.1/RW.1, Kamal Muara, Kec. Penjaringan, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta 14470', NULL, '3172', '14470', 'Pelabuhan penyebrangan dengan kapal nelayan', 1, '2020-11-21 20:56:57', '2020-11-21 21:20:07', NULL, NULL),
	('0179ec949e72ed4df4e0182965a123eda', 'Pelabuhan Pulau pari', 'Pulau Pari, Kepulauan Seribu Sel., Kabupaten Kepulauan Seribu, Daerah Khusus Ibukota Jakarta 14520', '0179ec949e72ed4df4e0125465a71073', NULL, NULL, NULL, NULL, '2020-11-21 21:21:00', '2020-11-21 21:22:35', NULL, NULL),
	('0179ec949e72ed4df4e0182965a71074', 'Pelabuhan Tanjung Pasir', 'Tj. Pasir, Kec. Teluknaga, Tangerang, Banten 15510', NULL, '3603', '15510', 'Pelabuhan penyebrangan wisata maupun nonwisata ke kepulauan seribu', 1, '2020-11-21 20:11:37', '2020-11-21 21:20:10', NULL, NULL),
	('0179ec949e72ed4df4e0182965aabcde', 'Pelabuhan Pulau untung jawa', '2PC4+58 Pulau Untung Jawa, Kabupaten Kepulauan Seribu, Daerah Khusus Ibukota Jakarta', '0179ec949e72ed4df4e0182955ad1073', '3101', NULL, 'Pelabuhan di pulau untung jawa', NULL, '2020-11-21 21:19:02', '2020-11-21 21:20:46', NULL, NULL);
/*!40000 ALTER TABLE `hs_tour_harbours` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_hotels
CREATE TABLE IF NOT EXISTS `hs_tour_hotels` (
  `vch_hotel_id` varchar(50) NOT NULL,
  `vch_hotel_name` varchar(50) DEFAULT NULL,
  `txt_hotel_description` text,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vch_hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_tour_hotels: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_hotels` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_hotels` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_hotel_user
CREATE TABLE IF NOT EXISTS `hs_tour_hotel_user` (
  `int_mitra_user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vch_hotel_id` varchar(50) DEFAULT NULL,
  `vch_user_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`int_mitra_user_id`),
  KEY `fk_hotel_user_id` (`vch_hotel_id`),
  KEY `fk_user_hotel_id` (`vch_user_id`),
  CONSTRAINT `fk_hotel_user_id` FOREIGN KEY (`vch_hotel_id`) REFERENCES `hs_tour_hotels` (`vch_hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_user_hotel_id` FOREIGN KEY (`vch_user_id`) REFERENCES `hs_tour_users` (`vch_user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_hotel_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_hotel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_hotel_user` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_identities
CREATE TABLE IF NOT EXISTS `hs_tour_identities` (
  `int_identity_id` int(11) NOT NULL AUTO_INCREMENT,
  `vch_user_id` varchar(50) DEFAULT NULL,
  `vch_boat_id` varchar(50) DEFAULT NULL,
  `vch_hotel_id` varchar(50) DEFAULT NULL,
  `vch_travel_id` varchar(50) DEFAULT NULL,
  `vch_id_number` varchar(30) NOT NULL COMMENT 'nomor sim/ktp',
  `vch_photo_url` varchar(255) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`int_identity_id`),
  KEY `fk_identity_user` (`vch_user_id`),
  KEY `fk_identity_hotel` (`vch_hotel_id`),
  KEY `fk_identity_boat` (`vch_boat_id`),
  KEY `fk_identity_travel` (`vch_travel_id`),
  CONSTRAINT `fk_identity_boat` FOREIGN KEY (`vch_boat_id`) REFERENCES `hs_tour_boats` (`vch_boat_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_identity_hotel` FOREIGN KEY (`vch_hotel_id`) REFERENCES `hs_tour_hotels` (`vch_hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_identity_travel` FOREIGN KEY (`vch_travel_id`) REFERENCES `hs_tour_travels` (`vch_travel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_identity_user` FOREIGN KEY (`vch_user_id`) REFERENCES `hs_tour_users` (`vch_user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_identities: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_identities` DISABLE KEYS */;
INSERT INTO `hs_tour_identities` (`int_identity_id`, `vch_user_id`, `vch_boat_id`, `vch_hotel_id`, `vch_travel_id`, `vch_id_number`, `vch_photo_url`, `status`, `created_at`, `updated_at`, `deleted_at`, `user`) VALUES
	(1, '25769c6cd34d4bafee98e0ee856f3e72', NULL, NULL, '00b245066523042a3bf4698f30617f0e', '124445636345234', NULL, 1, '2020-11-21 21:10:53', NULL, NULL, NULL);
/*!40000 ALTER TABLE `hs_tour_identities` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_islands
CREATE TABLE IF NOT EXISTS `hs_tour_islands` (
  `vch_island_id` varchar(50) NOT NULL,
  `vch_island_name` varchar(30) DEFAULT NULL,
  `txt_island_description` text,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vch_island_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_tour_islands: ~2 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_islands` DISABLE KEYS */;
INSERT INTO `hs_tour_islands` (`vch_island_id`, `vch_island_name`, `txt_island_description`, `status`, `created_at`, `updated_at`, `deleted_at`, `user`) VALUES
	('0179ec949e72ed4df4e0125465a71073', 'Pulau Pari', 'Pulau wisata bahari', 1, '2020-11-21 21:01:51', NULL, NULL, NULL),
	('0179ec949e72ed4df4e0182955ad1073', 'Pulau Untung Jawa', 'Pulau wisata bahari', 1, '2020-11-21 21:01:20', NULL, NULL, NULL);
/*!40000 ALTER TABLE `hs_tour_islands` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_master_data
CREATE TABLE IF NOT EXISTS `hs_tour_master_data` (
  `vch_master_data_id` varchar(50) NOT NULL,
  `vch_type` varchar(50) DEFAULT NULL,
  `vch_parent_key` varchar(50) DEFAULT NULL,
  `vch_key` varchar(50) DEFAULT NULL,
  `vch_value` varchar(255) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vch_master_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ga usah ada forenkey keluar';

-- Dumping data for table hanship.hs_tour_master_data: ~3 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_master_data` DISABLE KEYS */;
INSERT INTO `hs_tour_master_data` (`vch_master_data_id`, `vch_type`, `vch_parent_key`, `vch_key`, `vch_value`, `status`, `created_at`, `updated_at`, `deleted_at`, `user`) VALUES
	('0179ec949e7223ad57e0182965a71073', 'boat_type', NULL, 'speed_boat', 'Speed Boat', 1, '2020-11-21 21:07:04', '2020-11-21 21:08:34', NULL, NULL),
	('0179ec949e7223ad57e0182965a74652', 'boat_type', NULL, 'wood_boat', 'Perahu Kayu', 1, '2020-11-21 21:09:23', NULL, NULL, NULL),
	('0179ec949e72ed4df412342365a71073', 'paymen_method', NULL, 'cash', 'Cash', 1, '2020-11-21 21:03:19', '2020-11-21 21:07:22', NULL, NULL),
	('0179ec949e72ed4df4e018293421ae73', 'bank', NULL, 'bca', 'BCA', 1, '2020-11-21 21:04:27', '2020-11-21 21:07:26', NULL, NULL);
/*!40000 ALTER TABLE `hs_tour_master_data` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_members
CREATE TABLE IF NOT EXISTS `hs_tour_members` (
  `vch_member_id` varchar(50) NOT NULL,
  `vch_full_name` varchar(40) NOT NULL,
  `vch_email` varchar(40) NOT NULL,
  `vch_password` varchar(10) NOT NULL,
  `vch_phone` varchar(15) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vch_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_members: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_members` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_messagings
CREATE TABLE IF NOT EXISTS `hs_tour_messagings` (
  `int_messaging_id` int(11) NOT NULL AUTO_INCREMENT,
  `vch_destination_id` varchar(200) DEFAULT NULL,
  `vch_type` varchar(255) DEFAULT NULL,
  `vch_message_name` varchar(255) DEFAULT NULL,
  `vch_message_title` varchar(255) DEFAULT NULL,
  `lgTxtmessage_body` longtext,
  `js_message_desc` json DEFAULT NULL,
  `vch_message_type` varchar(255) DEFAULT NULL,
  `dtm_schedule_date` datetime DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`int_messaging_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_messagings: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_messagings` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_messagings` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_notifications
CREATE TABLE IF NOT EXISTS `hs_tour_notifications` (
  `int_notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `vch_member_id` varchar(50) DEFAULT NULL COMMENT 'ref with table member',
  `vch_user_id` varchar(50) DEFAULT NULL COMMENT 'ref with table user',
  `dt_date` date NOT NULL,
  `js_descriptions` json DEFAULT NULL COMMENT '{"message_name":"","message_title":"","message_body":"","url_path":""}',
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(11) NOT NULL,
  PRIMARY KEY (`int_notification_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_tour_notifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_notifications` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_password_resets
CREATE TABLE IF NOT EXISTS `hs_tour_password_resets` (
  `vch_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vch_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`vch_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ga usah ada forenkey keluar';

-- Dumping data for table hanship.hs_tour_password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_password_resets` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_permissions
CREATE TABLE IF NOT EXISTS `hs_tour_permissions` (
  `int_permission_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vch_name` varchar(50) DEFAULT NULL,
  `vch_display_name` varchar(50) NOT NULL,
  `vch_group` varchar(80) NOT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`int_permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ga usah ada forenkey keluar';

-- Dumping data for table hanship.hs_tour_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_permissions` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_permission_role
CREATE TABLE IF NOT EXISTS `hs_tour_permission_role` (
  `int_tour_permission_role_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `int_permission_id` int(11) unsigned NOT NULL,
  `int_role_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`int_tour_permission_role_id`) USING BTREE,
  KEY `fk_permission_id` (`int_permission_id`),
  KEY `fk_role_id` (`int_role_id`),
  CONSTRAINT `fk_permission_id` FOREIGN KEY (`int_permission_id`) REFERENCES `hs_tour_permissions` (`int_permission_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`int_role_id`) REFERENCES `hs_tour_roles` (`int_role_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_permission_role: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_permission_role` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_photos
CREATE TABLE IF NOT EXISTS `hs_tour_photos` (
  `int_photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `vcr_hotel_id` varchar(50) DEFAULT NULL,
  `vcr_travel_id` varchar(50) DEFAULT NULL,
  `vcr_boat_id` varchar(50) DEFAULT NULL,
  `vcr_island_id` varchar(50) DEFAULT NULL,
  `vcr_asset_id` varchar(50) DEFAULT NULL,
  `vcr_harbour_id` varchar(50) DEFAULT NULL,
  `vcr_photo_url` varchar(255) NOT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`int_photo_id`),
  KEY `fk_photo_hotel` (`vcr_hotel_id`),
  KEY `fk_photo_travel` (`vcr_travel_id`),
  KEY `fk_photo_boat` (`vcr_boat_id`),
  KEY `fk_photo_asset` (`vcr_asset_id`),
  KEY `fk_photo_island` (`vcr_island_id`),
  KEY `fk_photo_harbour` (`vcr_harbour_id`),
  CONSTRAINT `fk_photo_asset` FOREIGN KEY (`vcr_asset_id`) REFERENCES `hs_tour_assets` (`vch_asset_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_photo_boat` FOREIGN KEY (`vcr_boat_id`) REFERENCES `hs_tour_boats` (`vch_boat_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_photo_harbour` FOREIGN KEY (`vcr_harbour_id`) REFERENCES `hs_tour_harbours` (`vch_harbour_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_photo_hotel` FOREIGN KEY (`vcr_hotel_id`) REFERENCES `hs_tour_hotels` (`vch_hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_photo_island` FOREIGN KEY (`vcr_island_id`) REFERENCES `hs_tour_islands` (`vch_island_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_photo_travel` FOREIGN KEY (`vcr_travel_id`) REFERENCES `hs_tour_travels` (`vch_travel_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_photos: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_photos` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_promotions
CREATE TABLE IF NOT EXISTS `hs_tour_promotions` (
  `vch_promotion_id` varchar(50) NOT NULL,
  `vch_promotion_name` varchar(50) NOT NULL,
  `vch_promotion_code` varchar(50) NOT NULL,
  `txt_promotion_description` text,
  `vch_promotion_type` varchar(50) NOT NULL,
  `dec_promotion_amount` decimal(11,2) NOT NULL,
  `dtm_start_date` datetime DEFAULT NULL,
  `dtm_end_date` datetime DEFAULT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`vch_promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_tour_promotions: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_promotions` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_roles
CREATE TABLE IF NOT EXISTS `hs_tour_roles` (
  `int_role_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vcr_code_name` varchar(50) NOT NULL,
  `vcr_display_name` varchar(255) NOT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `ver_role_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`int_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='ga usah ada forenkey keluar';

-- Dumping data for table hanship.hs_tour_roles: ~4 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_roles` DISABLE KEYS */;
INSERT INTO `hs_tour_roles` (`int_role_id`, `vcr_code_name`, `vcr_display_name`, `status`, `ver_role_type`, `created_at`, `updated_at`, `deleted_at`, `user`) VALUES
	(1, 'admin', 'Administrator', 1, 'internal', '2020-11-21 19:23:09', '2020-11-21 19:27:30', NULL, 'ManualInput'),
	(2, 'admin-boat', 'Administrator Mitra (Kapal)', 1, 'mitra', '2020-11-21 19:26:25', '2020-11-21 19:27:31', NULL, 'ManualInput'),
	(3, 'admin-travel', 'Administrator Mitra (Travel)', 1, 'mitra', '2020-11-21 19:27:06', '2020-11-21 19:27:32', NULL, 'ManualInput'),
	(4, 'admin-hotel', 'Admnistrator Mitra(Hotel)', 1, 'mitra', '2020-11-21 19:27:58', '2020-11-21 19:28:01', NULL, 'ManualInput');
/*!40000 ALTER TABLE `hs_tour_roles` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_schedules
CREATE TABLE IF NOT EXISTS `hs_tour_schedules` (
  `vch_schedule_id` varchar(50) NOT NULL,
  `vch_schedule_departure` varchar(50) DEFAULT NULL,
  `vch_schedule_destination` varchar(50) DEFAULT NULL,
  `dt_date` date DEFAULT NULL,
  `tm_departure_time` time DEFAULT NULL,
  `tm_return` time DEFAULT NULL,
  `tm_estimated_time` time NOT NULL,
  `dec_schedule_price` decimal(11,2) NOT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vch_schedule_id`),
  KEY `fk_schedule_departure` (`vch_schedule_departure`),
  KEY `fk_schedule_destination` (`vch_schedule_destination`),
  CONSTRAINT `fk_schedule_departure` FOREIGN KEY (`vch_schedule_departure`) REFERENCES `hs_tour_harbours` (`vch_harbour_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_schedule_destination` FOREIGN KEY (`vch_schedule_destination`) REFERENCES `hs_tour_harbours` (`vch_harbour_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_schedules: ~1 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_schedules` DISABLE KEYS */;
INSERT INTO `hs_tour_schedules` (`vch_schedule_id`, `vch_schedule_departure`, `vch_schedule_destination`, `dt_date`, `tm_departure_time`, `tm_return`, `tm_estimated_time`, `dec_schedule_price`, `status`, `created_at`, `updated_at`, `deleted_at`, `user`) VALUES
	('01a235066523042a3bf4698f30612451', '0179ec936452ed4df4e0182965a71074', '0179ec949e72ed4df4e0182965a123eda', '2020-12-31', NULL, NULL, '03:00:00', 60000.00, NULL, '2020-11-21 21:28:03', NULL, NULL, NULL),
	('01a235066523042a3bf4698f30617f0e', '0179ec949e72ed4df4e0182965a71074', '0179ec949e72ed4df4e0182965aabcde', '2020-12-25', NULL, NULL, '03:00:00', 50000.00, 1, '2020-11-21 21:12:46', '2020-11-21 21:26:39', NULL, NULL);
/*!40000 ALTER TABLE `hs_tour_schedules` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_tickets
CREATE TABLE IF NOT EXISTS `hs_tour_tickets` (
  `vch_ticket_id` varchar(50) NOT NULL,
  `vch_schedule_id` varchar(50) NOT NULL,
  `vch_boat_id` varchar(50) DEFAULT NULL,
  `vch_hotel_id` varchar(50) DEFAULT NULL,
  `vch_travel_id` varchar(50) DEFAULT NULL,
  `vch_buyer_name` varchar(40) DEFAULT NULL,
  `vch_buyer_phone` varchar(15) DEFAULT NULL,
  `vch_passanger_name` varchar(40) DEFAULT NULL,
  `vch_passanger_phone` varchar(15) DEFAULT NULL,
  `vch_passanger_id` varchar(50) DEFAULT NULL,
  `vch_id_type` varchar(50) DEFAULT NULL COMMENT 'KTP, SIM, Student, Passport',
  `vch_emergency_phone` varchar(15) DEFAULT NULL,
  `dtm_check_in_time` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vch_ticket_id`),
  KEY `fk_ticket_schedule` (`vch_schedule_id`),
  KEY `fk_ticket_boat` (`vch_boat_id`),
  KEY `fk_ticket_hotel` (`vch_hotel_id`),
  KEY `fk_ticket_travel` (`vch_travel_id`),
  CONSTRAINT `fk_ticket_boat` FOREIGN KEY (`vch_boat_id`) REFERENCES `hs_tour_boats` (`vch_boat_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ticket_hotel` FOREIGN KEY (`vch_hotel_id`) REFERENCES `hs_tour_hotels` (`vch_hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ticket_schedule` FOREIGN KEY (`vch_schedule_id`) REFERENCES `hs_tour_schedules` (`vch_schedule_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_ticket_travel` FOREIGN KEY (`vch_travel_id`) REFERENCES `hs_tour_travels` (`vch_travel_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_tickets: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_tickets` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_transactions
CREATE TABLE IF NOT EXISTS `hs_tour_transactions` (
  `vcr_transaction_id` varchar(50) NOT NULL,
  `vcr_boat_id` varchar(50) DEFAULT NULL,
  `vcr_hotel_id` varchar(50) DEFAULT NULL,
  `vcr_travel_id` varchar(50) DEFAULT NULL,
  `vcr_member_id` varchar(50) NOT NULL COMMENT 'customer_id',
  `dec_total_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `dec_payment_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `vch_payment_method_id` varchar(50) NOT NULL DEFAULT '',
  `vch_delivery_method_id` varchar(50) NOT NULL DEFAULT '',
  `js_delivery_detail` json DEFAULT NULL,
  `js_trx_description` json DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`vcr_transaction_id`) USING BTREE,
  KEY `fk_trx_boat` (`vcr_boat_id`),
  KEY `fk_trx_hotel` (`vcr_hotel_id`),
  KEY `fk_trx_travel` (`vcr_travel_id`),
  KEY `fk_trx_member` (`vcr_member_id`),
  CONSTRAINT `fk_trx_boat` FOREIGN KEY (`vcr_boat_id`) REFERENCES `hs_tour_boats` (`vch_boat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trx_hotel` FOREIGN KEY (`vcr_hotel_id`) REFERENCES `hs_tour_hotels` (`vch_hotel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trx_member` FOREIGN KEY (`vcr_member_id`) REFERENCES `hs_tour_members` (`vch_member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trx_travel` FOREIGN KEY (`vcr_travel_id`) REFERENCES `hs_tour_travels` (`vch_travel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ga usah ada forenkey keluar';

-- Dumping data for table hanship.hs_tour_transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_transactions` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_transaction_details
CREATE TABLE IF NOT EXISTS `hs_tour_transaction_details` (
  `int_transaction_detail_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vcr_transaction_id` varchar(50) DEFAULT NULL,
  `int_detail_type` int(65) NOT NULL COMMENT '1:detail,2:fee,3:discount',
  `vcr_ticket_id` varchar(50) DEFAULT NULL,
  `vcr_fee_id` varchar(50) DEFAULT NULL,
  `vcr_promotion_id` varchar(50) DEFAULT NULL,
  `int_quantity` int(11) DEFAULT NULL,
  `dec_amount` decimal(11,2) NOT NULL,
  `js_trx_detail_description` json DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`int_transaction_detail_id`) USING BTREE,
  KEY `fk_trx_detail_ticket` (`vcr_ticket_id`),
  KEY `fk_trx_detail_fee` (`vcr_fee_id`),
  KEY `fk_trx_detail_promotion` (`vcr_promotion_id`),
  KEY `fk_trx_detail_transaction` (`vcr_transaction_id`),
  CONSTRAINT `fk_trx_detail_fee` FOREIGN KEY (`vcr_fee_id`) REFERENCES `hs_tour_fees` (`vch_fee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trx_detail_promotion` FOREIGN KEY (`vcr_promotion_id`) REFERENCES `hs_tour_promotions` (`vch_promotion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trx_detail_ticket` FOREIGN KEY (`vcr_ticket_id`) REFERENCES `hs_tour_tickets` (`vch_ticket_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trx_detail_transaction` FOREIGN KEY (`vcr_transaction_id`) REFERENCES `hs_tour_transactions` (`vcr_transaction_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ga usah ada forenkey keluar';

-- Dumping data for table hanship.hs_tour_transaction_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_transaction_details` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_transaction_progress
CREATE TABLE IF NOT EXISTS `hs_tour_transaction_progress` (
  `int_transaction_progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `vcr_transaction_id` varchar(50) NOT NULL,
  `vch_progress_code` varchar(50) NOT NULL COMMENT 'refer to master_data',
  `vch_progress_name` varchar(255) DEFAULT NULL COMMENT 'pending, on-process, done, cancel',
  `status` tinyint(2) NOT NULL COMMENT '0=pending, 1=active, 2=history',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`int_transaction_progress_id`),
  KEY `fk_trx_progress_transaction` (`vcr_transaction_id`),
  CONSTRAINT `fk_trx_progress_transaction` FOREIGN KEY (`vcr_transaction_id`) REFERENCES `hs_tour_transactions` (`vcr_transaction_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ga usah ada forenkey keluar';

-- Dumping data for table hanship.hs_tour_transaction_progress: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_transaction_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_tour_transaction_progress` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_travels
CREATE TABLE IF NOT EXISTS `hs_tour_travels` (
  `vch_travel_id` varchar(50) NOT NULL,
  `vch_travel_name` varchar(40) DEFAULT NULL,
  `txt_travel_description` text,
  `status` tinyint(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`vch_travel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_tour_travels: ~2 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_travels` DISABLE KEYS */;
INSERT INTO `hs_tour_travels` (`vch_travel_id`, `vch_travel_name`, `txt_travel_description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	('00b245066523042a3bf4698f30617f0e', 'Rahmat Travel', 'Travel terpercaya ke pulau seribu', 1, '2020-11-21 19:54:21', NULL, NULL),
	('179ec949e72ed4df4e0182965a71073', 'Randhy Travel', 'Travel teraman ke pulau seribu', 1, '2020-11-21 20:09:15', '2020-11-21 20:09:36', NULL);
/*!40000 ALTER TABLE `hs_tour_travels` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_travel_user
CREATE TABLE IF NOT EXISTS `hs_tour_travel_user` (
  `int_mitra_user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vch_travel_id` varchar(50) DEFAULT NULL,
  `vch_user_id` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`int_mitra_user_id`),
  KEY `fk_mitra_travel_user_id` (`vch_user_id`),
  KEY `fk_mitra_user_travel_id` (`vch_travel_id`),
  CONSTRAINT `fk_mitra_travel_user_id` FOREIGN KEY (`vch_user_id`) REFERENCES `hs_tour_users` (`vch_user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_mitra_user_travel_id` FOREIGN KEY (`vch_travel_id`) REFERENCES `hs_tour_travels` (`vch_travel_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hanship.hs_tour_travel_user: ~2 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_travel_user` DISABLE KEYS */;
INSERT INTO `hs_tour_travel_user` (`int_mitra_user_id`, `vch_travel_id`, `vch_user_id`, `created_at`, `updated_at`) VALUES
	(1, '00b245066523042a3bf4698f30617f0e', '25769c6cd34d4bafee98e0ee856f3e72', '2020-11-21 20:02:24', NULL),
	(2, '179ec949e72ed4df4e0182965a71073', '25769c6cd34d234fee98e0ee856f3e72', '2020-11-21 20:09:46', '2020-11-21 20:09:52');
/*!40000 ALTER TABLE `hs_tour_travel_user` ENABLE KEYS */;

-- Dumping structure for table hanship.hs_tour_users
CREATE TABLE IF NOT EXISTS `hs_tour_users` (
  `vch_user_id` varchar(50) NOT NULL,
  `vch_user_full_name` varchar(50) NOT NULL,
  `vch_email` varchar(50) NOT NULL,
  `vch_password` varchar(191) NOT NULL,
  `vch_role_id` varchar(20) NOT NULL,
  `vch_phone` varchar(15) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`vch_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hanship.hs_tour_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `hs_tour_users` DISABLE KEYS */;
INSERT INTO `hs_tour_users` (`vch_user_id`, `vch_user_full_name`, `vch_email`, `vch_password`, `vch_role_id`, `vch_phone`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
	('25769c6cd34d234fee98e0ee856f3e72', 'Randhy Travel', 'randhyhans89@gmail.com', '$2y$10$ZolHk7CsLlf9SrzHMpqGf.BmXMVxsbhBfcFmZRlSURHaWDadpRiBS', '3', '6286354267833', 1, '2020-11-21 20:05:25', NULL, NULL),
	('25769c6cd34d4bafee98e0ee856f3e72', 'Rahmat Travel', 'rahmat@gmail.com', '$2y$10$Um15tHta72A9iTrPLfmvHe4k.nNM34HM43bUVSE6Pwd5BsCOQ2Voe', '3', '6285648402132', 1, '2020-11-21 19:52:47', NULL, NULL),
	('25769c6cd34d4bfeba98e0ee856f3e7a', 'Global Admin', 'hcm.hanship@gmail.com', '$2y$10$41NnW9JhQEXQyzKJOOSGuutuwdnlkBFBpbrlzGKflsjJgZIIlL.Nq', '1', '6281717174243', 1, '2020-11-21 19:30:30', '2020-11-21 19:53:17', NULL);
/*!40000 ALTER TABLE `hs_tour_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
