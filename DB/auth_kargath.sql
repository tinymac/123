# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.9-log
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2015-04-13 20:16:24
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for auth_kargath
CREATE DATABASE IF NOT EXISTS `auth_kargath` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `auth_kargath`;


# Dumping structure for table auth_kargath.account
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Account System';

# Dumping data for table auth_kargath.account: ~3 rows (approximately)
DELETE FROM `account`;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `username`, `sha_pass_hash`, `sessionkey`, `v`, `s`, `email`, `joindate`, `last_ip`, `failed_logins`, `locked`, `last_login`, `online`, `expansion`, `mutetime`, `locale`, `os`, `recruiter`) VALUES
	(1, 'ASDD', '6413B64440B1A1DB3DBC073FFA3BBC7FD6CC466D', 'A1A94D363844179A0641268D7EB206A3B53422D701E42218BF6D442897ACDBF81232F5330E2602E9', '70852467D1F941887AC67DD0C331A802BC9A44FDFC42FDEA884851D5E697D01D', '83A5713AD9652A092BC91A8078ED40B62902576497F59BE408492190A336CC2B', '', '2015-04-10 23:11:09', '5.53.131.20', 0, 0, '2015-04-12 18:49:36', 0, 2, 0, 0, 'Win', 0),
	(2, 'LADREK', '19783285C6A10DFE9738D4EAEDD5DE8589499E0D', '42E29BF352CE5B0E0767DA49C71426FF2C0F22F63A42B5B76CE6707814E059C406DA175A051D2F86', '291BC44CFF42B203C4979E356749160DD40AA54165EF57DBE62F557FEEA3142E', 'B6506E3CFB2F3F599B1B2B3DF9D15A424D1822A195ECBF0221B60699C7FB6DAF', '', '2015-04-10 23:21:52', '98.198.3.209', 0, 0, '2015-04-11 00:14:06', 0, 2, 0, 0, 'Win', 0),
	(3, 'BATMANWARRIOR', '4E7C19CE84A628F34D0A0D1E1FCDFA702B4D9BFE', 'C2E701D409FA4C188191354D6FB1B5C6F883C8ECB39866654ACADD7036F65E5D00E328B3A1979439', '4F2D23E5596A1DC0C2533FFD99F3A2A797DB05D3E7F95DBD8AC9CE6B9C39393F', 'BDD08AED55FA48F391B966871917838823BC34CAAD88E354F2EA2E5A38B64807', '', '2015-04-10 23:22:21', '193.14.111.210', 0, 0, '2015-04-11 00:23:49', 0, 2, 0, 0, 'Win', 0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


# Dumping structure for table auth_kargath.account_access
DROP TABLE IF EXISTS `account_access`;
CREATE TABLE IF NOT EXISTS `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table auth_kargath.account_access: ~3 rows (approximately)
DELETE FROM `account_access`;
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
INSERT INTO `account_access` (`id`, `gmlevel`, `RealmID`) VALUES
	(1, 5, -1),
	(2, 5, -1),
	(3, 5, -1);
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;


# Dumping structure for table auth_kargath.account_banned
DROP TABLE IF EXISTS `account_banned`;
CREATE TABLE IF NOT EXISTS `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

# Dumping data for table auth_kargath.account_banned: ~0 rows (approximately)
DELETE FROM `account_banned`;
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;


# Dumping structure for table auth_kargath.ip_banned
DROP TABLE IF EXISTS `ip_banned`;
CREATE TABLE IF NOT EXISTS `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

# Dumping data for table auth_kargath.ip_banned: ~0 rows (approximately)
DELETE FROM `ip_banned`;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;


# Dumping structure for table auth_kargath.logs
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table auth_kargath.logs: ~0 rows (approximately)
DELETE FROM `logs`;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


# Dumping structure for table auth_kargath.realmcharacters
DROP TABLE IF EXISTS `realmcharacters`;
CREATE TABLE IF NOT EXISTS `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

# Dumping data for table auth_kargath.realmcharacters: ~3 rows (approximately)
DELETE FROM `realmcharacters`;
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES
	(1, 1, 1),
	(1, 2, 1),
	(1, 3, 1);
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;


# Dumping structure for table auth_kargath.realmlist
DROP TABLE IF EXISTS `realmlist`;
CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '12340',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

# Dumping data for table auth_kargath.realmlist: ~1 rows (approximately)
DELETE FROM `realmlist`;
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` (`id`, `name`, `address`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`) VALUES
	(1, 'Kargath-WoW Tournament', '5.53.131.20', 8085, 1, 1, 1, 0, 0, 12340);
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;


# Dumping structure for table auth_kargath.uptime
DROP TABLE IF EXISTS `uptime`;
CREATE TABLE IF NOT EXISTS `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

# Dumping data for table auth_kargath.uptime: ~8 rows (approximately)
DELETE FROM `uptime`;
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1428696628, 0, 0, 'BattleArenasCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Debug)'),
	(1, 1428697093, 0, 0, 'BattleArenasCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Debug)'),
	(1, 1428697300, 2401, 3, 'BattleArenasCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Debug)'),
	(1, 1428700116, 0, 0, 'BattleArenasCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Debug)'),
	(1, 1428700462, 601, 3, 'BattleArenasCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Debug)'),
	(2, 1428853372, 0, 0, 'BattleArenasCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Debug)'),
	(2, 1428853565, 0, 0, 'BattleArenasCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Debug)'),
	(2, 1428853710, 1201, 1, 'BattleArenasCORE rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Debug)');
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
