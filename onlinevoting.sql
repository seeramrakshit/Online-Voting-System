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
(5, 'Nota', '1111111111', 'password', 'nota.png', 'group', 0, 0, 99, 'Senior Citizen'),
(2, 'YSRCP PARTY', '1234567890', '121', 'YSRCP-fan11651898715.jpg', 'group', 0, 0, 25, 'Adult'),
(3, 'TDP PARTY', '1234567891', '111', 'download.jfif', 'group', 0, 0, 40, 'Adult'),
(4, 'JSP PARTY', '1234567892', '123', 'Jana_Sena_Party_Flag.png', 'group', 0, 0, 52, 'Senior Citizen');

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
(1, 'YSRCP PARTY', '1234567890', '121', 'YSRCP-fan11651898715.jpg', 'group', 0, 1, 25, 'Adult'),
(2, 'TDP PARTY', '1234567891', '111', 'download.jfif', 'group', 1, 3, 40, 'Adult'),
(3, 'JSP PARTY', '1234567892', '123', 'Jana_Sena_Party_Flag.png', 'group', 0, 2, 52, 'Senior Citizen'),
(4, 'charan', '1234567893', '131', 'WhatsApp Image 2022-11-28 at 1.23.35 AM.jpeg', 'voter', 1, 0, 20, 'Adult'),
(5, 'kumar', '1234567894', '143', 'WhatsApp Image 2022-11-28 at 1.26.34 AM.jpeg', 'voter', 1, 0, 19, 'Adult'),
(6, 'rakshit', '1234567895', '141', 'WhatsApp Image 2022-11-28 at 1.28.02 AM.jpeg', 'voter', 1, 0, 19, 'Adult'),
(7, 'lohit', '1234567896', '151', 'WhatsApp Image 2022-11-28 at 1.30.34 AM.jpeg', 'voter', 1, 0, 21, 'Adult'),
(8, 'nishant suri', '1234567897', '161', 'WhatsApp Image 2022-11-28 at 1.29.43 AM.jpeg', 'voter', 1, 0, 25, 'Adult'),
(9, 'allu arjun', '1234567898', '171', 'WhatsApp Image 2022-11-28 at 1.33.03 AM.jpeg', 'voter', 0, 0, 54, 'Senior Citizen'),
(10, 'rahul', '1234567899', '181', 'WhatsApp Image 2022-11-28 at 1.34.14 AM.jpeg', 'voter', 0, 0, 56, 'Senior Citizen'),
(11, 'kolluru ', '1234567801', '191', 'WhatsApp Image 2022-11-28 at 1.34.48 AM.jpeg', 'voter', 0, 0, 78, 'Senior Citizen'),
(12, 'akash', '1234567802', '101', 'WhatsApp Image 2022-11-28 at 1.37.21 AM.jpeg', 'voter', 0, 0, 20, 'Adult'),
(13, 'debarshi', '1234567803', '182', 'WhatsApp Image 2022-11-28 at 1.38.32 AM.jpeg', 'voter', 0, 0, 56, 'Senior Citizen'),
(14, 'Nota', '1111111111', 'password', 'nota.png', 'group', 0, 0, 99, 'Senior Citizen');

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
(1, 'YSRCP PARTY', '1234567890', '121', 'YSRCP-fan11651898715.jpg', 'group', 0, 0, 25, 'Adult'),
(2, 'TDP PARTY', '1234567891', '111', 'download.jfif', 'group', 0, 0, 40, 'Adult'),
(3, 'JSP PARTY', '1234567892', '123', 'Jana_Sena_Party_Flag.png', 'group', 0, 0, 52, 'Senior Citizen'),
(4, 'charan', '1234567893', '131', 'WhatsApp Image 2022-11-28 at 1.23.35 AM.jpeg', 'voter', 0, 0, 20, 'Adult'),
(5, 'kumar', '1234567894', '143', 'WhatsApp Image 2022-11-28 at 1.26.34 AM.jpeg', 'voter', 0, 0, 19, 'Adult'),
(6, 'rakshit', '1234567895', '141', 'WhatsApp Image 2022-11-28 at 1.28.02 AM.jpeg', 'voter', 0, 0, 19, 'Adult'),
(7, 'lohit', '1234567896', '151', 'WhatsApp Image 2022-11-28 at 1.30.34 AM.jpeg', 'voter', 0, 0, 21, 'Adult'),
(8, 'nishant suri', '1234567897', '161', 'WhatsApp Image 2022-11-28 at 1.29.43 AM.jpeg', 'voter', 0, 0, 25, 'Adult'),
(9, 'allu arjun', '1234567898', '171', 'WhatsApp Image 2022-11-28 at 1.33.03 AM.jpeg', 'voter', 0, 0, 54, 'Senior Citizen'),
(10, 'rahul', '1234567899', '181', 'WhatsApp Image 2022-11-28 at 1.34.14 AM.jpeg', 'voter', 0, 0, 56, 'Senior Citizen'),
(11, 'kolluru ', '1234567801', '191', 'WhatsApp Image 2022-11-28 at 1.34.48 AM.jpeg', 'voter', 0, 0, 78, 'Senior Citizen'),
(12, 'akash', '1234567802', '101', 'WhatsApp Image 2022-11-28 at 1.37.21 AM.jpeg', 'voter', 0, 0, 20, 'Adult'),
(13, 'debarshi', '1234567803', '182', 'WhatsApp Image 2022-11-28 at 1.38.32 AM.jpeg', 'voter', 0, 0, 56, 'Senior Citizen'),
(14, 'Nota', '1111111111', 'password', 'nota.png', 'group', 0, 0, 99, 'Senior Citizen');

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
