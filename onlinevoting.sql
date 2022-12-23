-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 15, 2022 at 03:50 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinevoting`
--
CREATE DATABASE IF NOT EXISTS `onlinevoting` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `onlinevoting`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `CreatingPrtyTable`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreatingPrtyTable` (IN `tble` VARCHAR(100))  BEGIN
 set @table=tble;
 set @sql_txt=concat("create table "+@table+"(id,username,mobile,password,photo,standard,status,votes,age,age_bracket)");
 prepare stmt from @sql_txt;
 execute stmt;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admindata`
--

DROP TABLE IF EXISTS `admindata`;
CREATE TABLE IF NOT EXISTS `admindata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `admindata`
--

INSERT INTO `admindata` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `groupdata`
--

DROP TABLE IF EXISTS `groupdata`;
CREATE TABLE IF NOT EXISTS `groupdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `standard` enum('group') COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `age` int(3) NOT NULL,
  `age_bracket` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `groupdata`
--

INSERT INTO `groupdata` (`id`, `username`, `mobile`, `password`, `photo`, `standard`, `status`, `votes`, `age`, `age_bracket`) VALUES
(1, 'Nota', '1111111111', 'password', 'nota.png', 'group', 0, 0, 99, 'Senior Citizen');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
CREATE TABLE IF NOT EXISTS `userdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `standard` enum('group','voter') COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `votes` int(11) NOT NULL,
  `age` int(3) NOT NULL,
  `age_bracket` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `username`, `mobile`, `password`, `photo`, `standard`, `status`, `votes`, `age`, `age_bracket`) VALUES
(1, 'Nota', '1111111111', 'password', 'nota.png', 'group', 0, 0, 99, 'Senior Citizen');

--
-- Triggers `userdata`
--
DROP TRIGGER IF EXISTS `addToVoter`;
DELIMITER $$
CREATE TRIGGER `addToVoter` AFTER INSERT ON `userdata` FOR EACH ROW BEGIN
insert into votedata (username,mobile,age,age_bracket,password,photo,standard,status) VALUES (new.username,new.mobile,new.age,new.age_bracket,new.password,new.photo,new.standard,new.status);
end
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `age_bracket`;
DELIMITER $$
CREATE TRIGGER `age_bracket` BEFORE INSERT ON `userdata` FOR EACH ROW BEGIN
IF new.age>40 THEN
set new.age_bracket="Senior Citizen";
else
set new.age_bracket="Adult";
end IF;

end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `votedata`
--

DROP TABLE IF EXISTS `votedata`;
CREATE TABLE IF NOT EXISTS `votedata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `standard` enum('group','voter') COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `votes` int(11) NOT NULL DEFAULT '0',
  `age` int(3) NOT NULL,
  `age_bracket` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `votedata`
--

INSERT INTO `votedata` (`id`, `username`, `mobile`, `password`, `photo`, `standard`, `status`, `votes`, `age`, `age_bracket`) VALUES
(1, 'Nota', '1111111111', 'password', 'nota.png', 'group', 0, 0, 99, 'Senior Citizen');

--
-- Triggers `votedata`
--
DROP TRIGGER IF EXISTS `addToGroup`;
DELIMITER $$
CREATE TRIGGER `addToGroup` AFTER INSERT ON `votedata` FOR EACH ROW BEGIN
 if new.standard = 'group' THEN
insert into groupdata (username,mobile,age,age_bracket,password,photo,standard,status) VALUES (new.username,new.mobile,new.age,new.age_bracket,new.password,new.photo,new.standard,new.status);
END IF;
END
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
