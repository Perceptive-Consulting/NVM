-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 02, 2015 at 05:39 PM
-- Server version: 5.5.32
-- PHP Version: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `perpetualgts`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE IF NOT EXISTS `authorities` (
  `username` varchar(45) NOT NULL,
  `authority` varchar(45) NOT NULL,
  PRIMARY KEY (`username`,`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('3jsdfjsj', 'ALL'),
('afj', 'ALL'),
('afjjm', 'ALL'),
('akfk', 'ALL'),
('auejju', 'ALL'),
('eieii', 'ALL'),
('Gautam', 'ALL'),
('hilari', 'ALL'),
('johncarter', 'ALL'),
('johncarters', 'ALL'),
('Kapil', 'ALL'),
('Naina', 'ALL'),
('navaya', 'ALL'),
('rohit', 'ALL'),
('suejkk', 'ALL'),
('sunayana', 'ALL'),
('super', 'ALL'),
('tarun', 'ALL'),
('ted', 'ALL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_address`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `addressLine1` varchar(255) NOT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `county` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `objectType` int(11) NOT NULL,
  `objectId` int(11) NOT NULL,
  `postCode` varchar(255) NOT NULL,
  `countryId` int(11) NOT NULL,
  `telephoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=124 ;

--
-- Dumping data for table `tbl_perpetualrents_address`
--

INSERT INTO `tbl_perpetualrents_address` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `addressLine1`, `addressLine2`, `city`, `county`, `landmark`, `latitude`, `longitude`, `objectType`, `objectId`, `postCode`, `countryId`, `telephoneNumber`) VALUES
(1, '2015-06-15 06:45:35', NULL, 0, NULL, '11 Belgrave Road', 'Opal Drive', 'London', 'London', 'Word Vision UK', NULL, NULL, 9, 1, 'SW1V 1RB', 1, NULL),
(2, '2015-06-15 07:08:29', NULL, 1, NULL, 'hastsal ', 'village', 'sksk', 'ukk', 'fkafk', NULL, NULL, 3, 1, '99393939', 0, NULL),
(3, '2015-06-15 07:12:10', NULL, 1, NULL, 'sfkkk', 'afkk', 'sfjj', 'afk', 'afk', NULL, NULL, 3, 2, '48848488', 0, NULL),
(4, '2015-06-15 07:19:32', NULL, 0, NULL, 'skfskk', 'adkkk', 'Adur', 'afakk', 'afja', NULL, NULL, 12, 1, '33888383', 1, NULL),
(5, '2015-06-15 07:22:44', NULL, 4, NULL, 'vijay ', 'enclave', 'Adur', 'uk', NULL, NULL, NULL, 13, 1, '33993939', 0, NULL),
(6, '2015-06-15 07:27:23', NULL, 4, NULL, 'uttam', 'nagar', 'Adur', 'uk', NULL, NULL, NULL, 13, 2, '3837838', 0, NULL),
(7, '2015-06-15 07:30:04', NULL, 4, NULL, 'gokul', 'gang', 'Ashfield', 'uk', NULL, NULL, NULL, 13, 3, '688883', 0, NULL),
(8, '2015-06-15 08:16:46', NULL, 1, NULL, 'skksk', 'kskk', 'sfkk', 'uk', 'jsjsj', NULL, NULL, 3, 3, '2929299', 0, NULL),
(9, '2015-06-15 08:19:16', NULL, 4, NULL, 'uuui', 'jjjjk', 'Allerdale', 'uk', NULL, NULL, NULL, 13, 4, '7788788', 0, NULL),
(10, '2015-06-15 08:38:22', NULL, 4, NULL, 'kkke', 'afajj', 'Adur', 'uk', NULL, NULL, NULL, 13, 5, '3883388', 0, NULL),
(11, '2015-06-15 08:44:09', NULL, 4, NULL, 'vikas ', 'nagar', 'Allerdale', 'uk', NULL, NULL, NULL, 13, 6, '3893388', 0, NULL),
(12, '2015-06-15 08:54:50', NULL, 4, NULL, 'karol', 'bagh', 'Allerdale', 'uk', NULL, NULL, NULL, 13, 7, '567788', 0, NULL),
(13, '2015-06-15 09:03:52', NULL, 4, NULL, 'hshhsh', 'hhhh', 'Ashfield', 'uk', NULL, NULL, NULL, 13, 8, '28828289', 0, NULL),
(14, '2015-06-15 09:06:25', NULL, 1, NULL, 'afjaj', 'afjj', 'ajfj', 'ajf', 'afja', NULL, NULL, 3, 4, '389', 0, NULL),
(15, '2015-06-15 09:25:31', NULL, 0, NULL, 'fafjaj', 'afjj', 'Adur', 'jafj', 'jafj', NULL, NULL, 1, 1, 'JAFJ', 1, NULL),
(16, '2015-06-15 09:26:52', NULL, 7, NULL, 'sjsj', 'adjj', 'Adur', 'uk', NULL, NULL, NULL, 4, 1, '4499', 0, NULL),
(17, '2015-06-15 09:28:34', NULL, 7, NULL, 'afjj', 'afjj', 'Ashfield', 'uk', NULL, NULL, NULL, 4, 2, '8388383', 0, NULL),
(18, '2015-06-15 09:32:20', NULL, 7, NULL, 'eekekie', 'afjajue', 'Ashfield', 'uk', NULL, NULL, NULL, 4, 3, '39939', 0, NULL),
(19, '2015-06-15 09:39:47', '2015-06-27 13:25:37', 0, 34, 'sas', 'sasa', 'Adur', 'sda', NULL, NULL, NULL, 0, 0, '201021', 0, NULL),
(20, '2015-06-15 09:39:47', '2015-06-27 13:25:37', 0, 34, 'sas', 'sasa', 'Adur', 'sda', NULL, NULL, NULL, 0, 0, '201021', 0, NULL),
(21, '2015-06-15 10:09:32', '2015-06-27 13:25:37', 0, 34, 'sas', 'sasa', 'Adur', 'sda', NULL, NULL, NULL, 0, 0, '201021', 0, NULL),
(22, '2015-06-15 10:09:32', '2015-06-27 13:25:37', 0, 34, 'sas', 'sasa', 'Adur', 'sda', NULL, NULL, NULL, 0, 0, '201021', 0, NULL),
(23, '2015-06-15 10:32:24', NULL, 7, NULL, 'maharani', 'enclave', 'Ashfield', 'uk', NULL, NULL, NULL, 4, 4, '5677867', 0, NULL),
(24, '2015-06-15 10:37:26', NULL, 7, NULL, 'l', 'l', 'Ashfield', 'l', NULL, NULL, NULL, 4, 5, 'L', 0, NULL),
(25, '2015-06-15 10:44:27', NULL, 0, NULL, '36 Broad Street, Teddington', ', London, London, United Kingdom.', 'Adur', 'london', NULL, NULL, NULL, 12, 2, 'TW11 8QY', 1, NULL),
(26, '2015-06-15 10:57:56', NULL, 7, NULL, 'sfsk', 'ejdjj', 'Adur', 'uk', NULL, NULL, NULL, 4, 6, '388388', 0, NULL),
(27, '2015-06-15 12:40:27', '2015-06-24 05:51:50', 0, 26, 'gangs of', 'Ashfield', 'Ashfield', 'uk', NULL, NULL, NULL, 12, 3, '688883', 1, NULL),
(28, '2015-06-15 12:45:18', NULL, 26, NULL, '36 Broad Street,Teddington', ', London, London, United Kingdom.', 'Adur', 'london', NULL, NULL, NULL, 13, 9, 'TW11 8QY', 0, NULL),
(29, '2015-06-16 10:48:45', NULL, 7, NULL, 'afjj', 'afjj', 'Allerdale', 'uk', NULL, NULL, NULL, 4, 7, '3838388', 0, NULL),
(30, '2015-06-16 11:03:35', NULL, 7, NULL, 'ruurjj', 'afjj', 'Adur', 'uk', NULL, NULL, NULL, 4, 8, '338999', 0, NULL),
(31, '2015-06-16 11:11:02', NULL, 7, NULL, 'afjafj', 'afjaj', 'Adur', 'uk', NULL, NULL, NULL, 4, 9, '399399', 0, NULL),
(32, '2015-06-16 11:14:28', NULL, 0, NULL, 'afajkjk', 'afjjj', 'Allerdale', 'uk', 'afjf', NULL, NULL, 1, 2, '3883883', 1, NULL),
(33, '2015-06-16 11:18:36', NULL, 0, NULL, 'afkk', 'afk', 'Allerdale', 'afj', 'akfak', NULL, NULL, 1, 3, '339399', 1, NULL),
(34, '2015-06-16 11:21:35', NULL, 0, NULL, 'ajfaj', 'afjj', 'Adur', 'asfj', '9afjajf', NULL, NULL, 1, 4, '499499', 1, NULL),
(35, '2015-06-16 12:36:54', '2015-06-19 06:09:37', 0, 4, 'uuui', 'jjjjk', 'Allerdale', 'uk', NULL, NULL, NULL, 12, 4, '7788788', 1, NULL),
(36, '2015-06-16 12:41:46', NULL, 30, NULL, 'xyz', 'abc', 'Adur', 'adur', NULL, NULL, NULL, 13, 10, '110098', 0, NULL),
(37, '2015-06-17 06:35:37', NULL, 4, NULL, 'l', 'l', 'Allerdale', 'll', NULL, NULL, NULL, 13, 11, 'L', 0, NULL),
(38, '2015-06-17 06:59:56', NULL, 7, NULL, 'karol ', 'bagh', 'Ashfield', 'uk', NULL, NULL, NULL, 4, 10, '3838388', 0, NULL),
(39, '2015-06-19 07:21:22', NULL, 4, NULL, 'l', 'l', 'Ashfield', 'l', NULL, NULL, NULL, 13, 12, 'L', 0, NULL),
(40, '2015-06-19 07:30:01', NULL, 4, NULL, 'll', 'l', 'Ashfield', 'll', NULL, NULL, NULL, 13, 13, '24', 0, NULL),
(41, '2015-06-19 07:43:27', NULL, 4, NULL, 'l', 'l', 'Ashfield', 'l', NULL, NULL, NULL, 13, 14, 'L', 0, NULL),
(42, '2015-06-19 08:17:34', NULL, 4, NULL, 'l', 'l', 'Allerdale', 'l', NULL, NULL, NULL, 13, 15, 'L', 0, NULL),
(43, '2015-06-19 08:57:14', NULL, 4, NULL, 'l', 'l', 'Ashfield', 'l', NULL, NULL, NULL, 13, 16, 'L', 0, NULL),
(44, '2015-06-19 09:04:39', NULL, 4, NULL, 't', 't', 'Allerdale', 't', NULL, NULL, NULL, 13, 17, 'T', 0, NULL),
(45, '2015-06-19 09:10:23', NULL, 4, NULL, 'k', 'k', 'Allerdale', 'k', NULL, NULL, NULL, 13, 18, 'K', 0, NULL),
(46, '2015-06-19 13:00:03', NULL, 4, NULL, 'mohan', 'garden ', 'Allerdale', 'uk', NULL, NULL, NULL, 13, 19, '449949', 0, NULL),
(47, '2015-06-22 04:59:49', NULL, 4, NULL, 'Om ', 'Vihar', 'Allerdale', 'UK', NULL, NULL, NULL, 13, 20, '3993388', 0, NULL),
(48, '2015-06-22 12:13:18', NULL, 7, NULL, 'Om ', 'Vihar ', 'Allerdale', 'USA', NULL, NULL, NULL, 4, 11, '38838488', 0, NULL),
(49, '2015-06-22 12:22:19', NULL, 7, NULL, 'patel ', 'nagar ', 'Ashfield', 'uk', NULL, NULL, NULL, 4, 12, '4994949', 0, NULL),
(50, '2015-06-22 12:39:32', NULL, 7, NULL, 'patel ', 'Nagar', 'Allerdale', 'usa', NULL, NULL, NULL, 4, 13, '49499', 0, NULL),
(51, '2015-06-23 04:50:05', NULL, 7, NULL, 'Karol ', 'Bagh', 'Allerdale', 'USA', NULL, NULL, NULL, 4, 14, '38383838', 0, NULL),
(52, '2015-06-23 05:39:00', NULL, 4, NULL, 'p', 'p', 'Allerdale', 'p', NULL, NULL, NULL, 13, 21, 'P', 0, NULL),
(53, '2015-06-23 06:02:35', NULL, 4, NULL, 'pp', 'p', 'Adur', 'uuk', NULL, NULL, NULL, 13, 22, 'P', 0, NULL),
(54, '2015-06-23 06:09:07', NULL, 4, NULL, 'afajj', 'afjj', 'Allerdale', 'uk', NULL, NULL, NULL, 13, 23, '394949', 0, NULL),
(55, '2015-06-23 06:16:57', NULL, 7, NULL, 'p', 'p', 'Adur', 'p', NULL, NULL, NULL, 4, 15, '3533636', 0, NULL),
(56, '2015-06-23 06:20:44', NULL, 4, NULL, 'p', 'p', 'Allerdale', 'p', NULL, NULL, NULL, 13, 24, 'P', 0, NULL),
(57, '2015-06-23 06:26:04', NULL, 4, NULL, 'p', 'p', 'Allerdale', 'p', NULL, NULL, NULL, 13, 25, 'P', 0, NULL),
(58, '2015-06-23 06:45:37', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 26, 'L', 0, NULL),
(59, '2015-06-23 07:02:20', NULL, 4, NULL, 'll', NULL, 'Ashfield', 'l', NULL, NULL, NULL, 13, 27, 'LL', 0, NULL),
(60, '2015-06-23 07:06:41', NULL, 4, NULL, 'pp', 'p', 'Allerdale', 'p', NULL, NULL, NULL, 13, 28, 'P', 0, NULL),
(61, '2015-06-23 08:54:10', NULL, 4, NULL, 'll', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 29, 'L', 0, NULL),
(62, '2015-06-23 09:59:20', NULL, 4, NULL, 'p', 'p', 'Allerdale', 'p', NULL, NULL, NULL, 13, 30, 'P', 0, NULL),
(63, '2015-06-23 10:37:57', NULL, 4, NULL, 'l', 'll', 'Allerdale', 'l', NULL, NULL, NULL, 13, 31, 'L', 0, NULL),
(64, '2015-06-23 11:08:46', NULL, 4, NULL, 'll', 'l', 'Allerdale', 'l', NULL, NULL, NULL, 13, 32, 'L', 0, NULL),
(65, '2015-06-23 12:07:53', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 33, 'L', 0, NULL),
(66, '2015-06-23 12:41:46', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 34, 'L', 0, NULL),
(67, '2015-06-23 12:45:05', NULL, 4, NULL, 'm', 'mm', 'Allerdale', 'm', NULL, NULL, NULL, 13, 35, 'MM', 0, NULL),
(68, '2015-06-23 12:53:29', NULL, 4, NULL, 'm', 'm', 'Adur', 'mm', NULL, NULL, NULL, 13, 36, '22222', 0, NULL),
(69, '2015-06-23 13:28:48', NULL, 4, NULL, 'AK', 'K', 'Allerdale', 'K', NULL, NULL, NULL, 13, 37, 'K', 0, NULL),
(70, '2015-06-24 06:06:21', NULL, 4, NULL, 'skfkk', 'afkak', 'Allerdale', 'afakk', NULL, NULL, NULL, 13, 38, '49949', 0, NULL),
(71, '2015-06-24 06:15:37', NULL, 4, NULL, 'k', 'k', 'Adur', 'k', NULL, NULL, NULL, 13, 39, '363636', 0, NULL),
(72, '2015-06-24 09:42:13', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 40, 'L', 0, NULL),
(73, '2015-06-24 09:49:01', NULL, 4, NULL, 'm', 'm', 'Allerdale', 'm', NULL, NULL, NULL, 13, 41, 'M', 0, NULL),
(74, '2015-06-24 09:57:28', NULL, 4, NULL, 'll', 'l', 'Allerdale', 'llll', NULL, NULL, NULL, 13, 42, 'L', 0, NULL),
(75, '2015-06-24 10:09:57', NULL, 4, NULL, 'k', 'k', 'Ashfield', 'k', NULL, NULL, NULL, 13, 43, 'K', 0, NULL),
(76, '2015-06-24 10:12:39', NULL, 4, NULL, 'm', 'm', 'Allerdale', 'm', NULL, NULL, NULL, 13, 44, 'M', 0, NULL),
(77, '2015-06-24 10:40:23', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 45, 'L', 0, NULL),
(78, '2015-06-24 10:46:57', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 46, '5', 0, NULL),
(79, '2015-06-24 11:13:10', NULL, 4, NULL, 'fggjhg', 'jg', 'Ashfield', 'f', NULL, NULL, NULL, 13, 47, 'FH', 0, NULL),
(80, '2015-06-24 11:22:38', NULL, 4, NULL, 'l', 'l', 'Allerdale', 'l', NULL, NULL, NULL, 13, 48, 'L', 0, NULL),
(81, '2015-06-24 11:26:35', NULL, 4, NULL, 'j', 'jkj', 'Allerdale', 'k', NULL, NULL, NULL, 13, 49, 'K', 0, NULL),
(82, '2015-06-24 11:34:00', NULL, 4, NULL, 'p', 'p', 'Adur', 'p', NULL, NULL, NULL, 13, 50, 'P', 0, NULL),
(83, '2015-06-24 12:01:10', NULL, 4, NULL, 'k', 'k', 'Allerdale', 'k', NULL, NULL, NULL, 13, 51, 'K', 0, NULL),
(84, '2015-06-24 12:08:00', NULL, 4, NULL, 'P', 'P', 'Ashfield', 'P', NULL, NULL, NULL, 13, 52, 'P', 0, NULL),
(85, '2015-06-25 05:44:39', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 53, 'L', 0, NULL),
(86, '2015-06-25 05:47:29', NULL, 4, NULL, 'K', 'K', 'Ashfield', 'K', NULL, NULL, NULL, 13, 54, 'K', 0, NULL),
(87, '2015-06-25 05:49:34', NULL, 4, NULL, 'k', 'k', 'Adur', 'k', NULL, NULL, NULL, 13, 55, 'K', 0, NULL),
(88, '2015-06-25 06:40:21', NULL, 4, NULL, 'k', 'kq', 'Ashfield', 'k', NULL, NULL, NULL, 13, 56, 'KK', 0, NULL),
(89, '2015-06-25 06:43:51', NULL, 4, NULL, 'm', 'm', 'Adur', 'm', NULL, NULL, NULL, 13, 57, 'MM', 0, NULL),
(90, '2015-06-25 06:54:09', NULL, 4, NULL, 'k', 'kk', 'Allerdale', 'k', NULL, NULL, NULL, 13, 58, 'K', 0, NULL),
(91, '2015-06-25 07:03:45', NULL, 4, NULL, 'mm', 'd', 'Allerdale', 'mm', NULL, NULL, NULL, 13, 59, 'M', 0, NULL),
(92, '2015-06-25 07:15:16', NULL, 4, NULL, 'l', 'l', 'Allerdale', 'l', NULL, NULL, NULL, 13, 60, 'LL', 0, NULL),
(93, '2015-06-25 07:19:54', NULL, 4, NULL, 'l', 'l', 'Adur', 'll', NULL, NULL, NULL, 13, 61, 'L', 0, NULL),
(94, '2015-06-25 07:28:01', NULL, 4, NULL, 'll', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 62, 'L', 0, NULL),
(95, '2015-06-25 07:30:56', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 63, 'L', 0, NULL),
(96, '2015-06-25 07:31:40', NULL, 4, NULL, 'k', 'k', 'Adur', 'k', NULL, NULL, NULL, 13, 64, 'K', 0, NULL),
(97, '2015-06-25 07:34:44', NULL, 4, NULL, 'afjj', 'afj', 'Allerdale', 'afj', NULL, NULL, NULL, 13, 65, '838388', 0, NULL),
(98, '2015-06-25 08:22:52', NULL, 4, NULL, '`l', 'l', 'Allerdale', 'l', NULL, NULL, NULL, 13, 66, 'L', 0, NULL),
(99, '2015-06-25 08:46:08', NULL, 4, NULL, 'll', NULL, 'Allerdale', 'l', NULL, NULL, NULL, 13, 67, 'L', 0, NULL),
(100, '2015-06-25 08:48:20', NULL, 4, NULL, 'l', 'l', 'Adur', 'll', NULL, NULL, NULL, 13, 68, 'L', 0, NULL),
(101, '2015-06-25 08:49:40', NULL, 4, NULL, 'l', 'll', 'Allerdale', 'l', NULL, NULL, NULL, 13, 69, 'L', 0, NULL),
(102, '2015-06-25 08:53:00', NULL, 4, NULL, 'g', 'g', 'Adur', 'g', NULL, NULL, NULL, 13, 70, 'G', 0, NULL),
(103, '2015-06-25 09:30:42', NULL, 4, NULL, 'll', 'l', 'Allerdale', 'l', NULL, NULL, NULL, 13, 71, 'LL', 0, NULL),
(104, '2015-06-25 10:19:28', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 72, 'L', 0, NULL),
(105, '2015-06-25 10:26:11', NULL, 4, NULL, 'k', 'k', 'Adur', 'k', NULL, NULL, NULL, 13, 73, 'K', 0, NULL),
(106, '2015-06-25 10:33:19', NULL, 4, NULL, 'll', 'l', 'Adur', 'dr', NULL, NULL, NULL, 13, 74, 'L', 0, NULL),
(107, '2015-06-25 10:41:05', NULL, 4, NULL, 'l', 'l', 'Allerdale', 'l', NULL, NULL, NULL, 13, 75, 'L', 0, NULL),
(108, '2015-06-25 10:42:41', NULL, 4, NULL, 'l', 'll', 'Adur', 'l', NULL, NULL, NULL, 13, 76, 'L', 0, NULL),
(109, '2015-06-25 11:01:43', NULL, 4, NULL, 'h', 'hh', 'Allerdale', 'h', NULL, NULL, NULL, 13, 77, 'HH', 0, NULL),
(110, '2015-06-25 11:25:56', NULL, 26, NULL, 'l', 'l', 'Allerdale', 'll', NULL, NULL, NULL, 13, 78, 'L', 0, NULL),
(111, '2015-06-25 11:31:26', NULL, 26, NULL, '36 Broad Street,', 'Teddington', 'Ashfield', 'Ash', NULL, NULL, NULL, 13, 79, '38928392', 0, NULL),
(112, '2015-06-25 11:51:11', NULL, 26, NULL, 'sf', 'k', 'Ashfield', 'kl', NULL, NULL, NULL, 13, 80, 'SF', 0, NULL),
(113, '2015-06-25 11:56:28', NULL, 4, NULL, 'l', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 81, 'LL', 0, NULL),
(114, '2015-06-25 12:22:04', NULL, 4, NULL, 'l', 'll', 'Adur', 'll', NULL, NULL, NULL, 13, 82, '34355', 0, NULL),
(115, '2015-06-27 11:04:51', NULL, 4, NULL, 'lsfskk', 'l', 'Adur', 'l', NULL, NULL, NULL, 13, 83, '4848848', 0, NULL),
(116, '2015-06-27 12:20:55', NULL, 29, NULL, '11 Belgrave Road', 'Opal Drive', 'Ashfield', 'London', NULL, NULL, NULL, 4, 16, 'SW1V 1RB', 0, NULL),
(117, '2015-06-27 12:37:33', NULL, 0, NULL, 'afkak', 'afj', 'Adur', 'jj', 'afj', NULL, NULL, 1, 5, 'JAFJA', 1, NULL),
(118, '2015-06-27 12:43:47', NULL, 0, NULL, 'afk', 'afk', 'Allerdale', 'afmk', 'afka', NULL, NULL, 1, 6, '94494949', 1, NULL),
(119, '2015-06-27 13:01:05', NULL, 0, NULL, 'afjj', 'afj', 'Allerdale', 'afj', 'afjkjk', NULL, NULL, 1, 7, '389489498', 1, NULL),
(120, '2015-06-27 13:06:37', NULL, 0, NULL, 'afk', 'afk', 'Adur', 'ajfj', 'afkak', NULL, NULL, 1, 8, '4848488', 1, NULL),
(121, '2015-06-27 13:19:37', NULL, 34, NULL, 'sas', 'sasa', 'Adur', 'sda', NULL, NULL, NULL, 4, 17, '201021', 0, NULL),
(122, '2015-06-30 05:13:16', NULL, 4, NULL, 'afj', 'afj', 'Allerdale', 'afj', NULL, NULL, NULL, 13, 84, '8944889', 0, NULL),
(123, '2015-07-01 09:39:14', NULL, 4, NULL, 'yut', 'tuy', 'Adur', 'uyt', NULL, NULL, NULL, 13, 85, 'UYT', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_admin`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `uniqueReference` varchar(45) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `enable` bit(1) NOT NULL DEFAULT b'1',
  `userLoginId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_perpetualrents_admin`
--

INSERT INTO `tbl_perpetualrents_admin` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `uniqueReference`, `firstName`, `lastName`, `enable`, `userLoginId`) VALUES
(1, '2015-06-15 06:45:35', NULL, 0, NULL, 'PRUKAD00198', '11133300877', 'Admin', b'1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_admindocuments`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_admindocuments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` int(11) DEFAULT NULL,
  `fileName` varchar(45) NOT NULL,
  `adminDocumentId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `documentTypeId` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_adminuploaddocuments`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_adminuploaddocuments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` int(11) DEFAULT NULL,
  `fileName` varchar(255) NOT NULL,
  `adminDocumentId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `documentTypeId` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `tbl_perpetualrents_adminuploaddocuments`
--

INSERT INTO `tbl_perpetualrents_adminuploaddocuments` (`id`, `createdOn`, `createdUserId`, `fileName`, `adminDocumentId`, `fileId`, `documentTypeId`) VALUES
(38, '2015-06-27 10:12:33', 1, '11.png', 5, 368, 4),
(39, '2015-06-27 10:12:38', 1, '22.png', 6, 369, 4),
(41, '2015-06-27 12:40:55', 1, '11.png', 1, 371, 4),
(42, '2015-06-27 12:40:59', 1, '22.png', 2, 372, 4),
(43, '2015-06-27 12:41:04', 1, '111.png', 3, 373, 4),
(45, '2015-06-27 12:41:26', 1, '1509786.jpg', 4, 375, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_applicationsession`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_applicationsession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(32) NOT NULL,
  `IPAddress` varchar(32) NOT NULL,
  `sessionIdentity` varchar(128) NOT NULL,
  `destroyedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sessionStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=292 ;

--
-- Dumping data for table `tbl_perpetualrents_applicationsession`
--

INSERT INTO `tbl_perpetualrents_applicationsession` (`id`, `createdOn`, `username`, `IPAddress`, `sessionIdentity`, `destroyedOn`, `sessionStatus`) VALUES
(1, '2015-06-15 07:07:06', 'super', '127.0.0.1', '4D73FFB400EC120D2557986D05D42CA5', '0000-00-00 00:00:00', 3),
(2, '2015-06-15 07:16:11', 'Gautam', '127.0.0.1', '676A112CA2674E6B4A746CFA0EB667F4', '0000-00-00 00:00:00', 3),
(3, '2015-06-15 07:20:11', 'hilari', '127.0.0.1', '57AB9863D0DE831177E7D0335EE0B5BF', '2015-06-15 07:24:11', 2),
(4, '2015-06-15 07:26:29', 'hilari', '127.0.0.1', 'C4E758FB34E547E3F889E22468BFB83E', '2015-06-15 07:30:48', 2),
(5, '2015-06-15 07:31:20', 'hilari', '127.0.0.1', '74BC8DE08DCFD0B93DC820EF1DEEF212', '0000-00-00 00:00:00', 3),
(6, '2015-06-15 07:31:44', 'Gautam', '127.0.0.1', '3AFE7597199F300E8DF9DFF90BEB7055', '0000-00-00 00:00:00', 3),
(7, '2015-06-15 07:32:28', 'super', '127.0.0.1', 'C9D2ADC39343164BE38ECFE5CFB918F6', '0000-00-00 00:00:00', 3),
(8, '2015-06-15 07:34:44', 'super', '127.0.0.1', 'EC6CBB7929476CE730A4148FA5004826', '0000-00-00 00:00:00', 3),
(9, '2015-06-15 07:36:35', 'Naina', '127.0.0.1', '3CBAA1D36BAE7CE5AA7818B07D64AAFC', '0000-00-00 00:00:00', 3),
(10, '2015-06-15 07:39:28', 'hilari', '127.0.0.1', '3750A627445F2F4E9B6B938960284F92', '0000-00-00 00:00:00', 3),
(11, '2015-06-15 08:13:49', 'super', '127.0.0.1', 'DD50FDD466B39EFD3CFA12762864D6E9', '0000-00-00 00:00:00', 3),
(12, '2015-06-15 08:18:26', 'hilari', '127.0.0.1', 'D6B93BFA31477CDB03CCD5D9D113BD4D', '2015-06-15 08:20:43', 2),
(13, '2015-06-15 08:22:28', 'Gautam', '127.0.0.1', '5D2376DB93E99A8EC69BEF9E3624B717', '0000-00-00 00:00:00', 3),
(14, '2015-06-15 08:29:49', 'Kapil', '127.0.0.1', '3C5D33A67A974BCFB03C3AF14406E89B', '0000-00-00 00:00:00', 3),
(15, '2015-06-15 08:37:30', 'Kapil', '127.0.0.1', '9A6C551B63A0421E34C27D6C6C0CF8F8', '2015-06-15 08:39:07', 2),
(16, '2015-06-15 08:43:24', 'hilari', '127.0.0.1', '51F1A662F300DBF91A97B8D51FEBFEE6', '2015-06-15 08:45:05', 2),
(17, '2015-06-15 08:53:58', 'hilari', '127.0.0.1', 'AE084475B037C8408BEA903D567A158F', '2015-06-15 08:55:31', 2),
(18, '2015-06-15 08:59:03', 'super', '127.0.0.1', 'A030DC221499E041831ED186225ECCBB', '0000-00-00 00:00:00', 3),
(19, '2015-06-15 09:03:04', 'hilari', '127.0.0.1', 'C9A4B771292F84A184B46D77F6093596', '2015-06-15 09:04:37', 2),
(20, '2015-06-15 09:05:32', 'super', '127.0.0.1', '7930E85E2B69D08EAA631F37FDC9DB7C', '0000-00-00 00:00:00', 3),
(21, '2015-06-15 09:18:01', 'hilari', '127.0.0.1', '6490F09A60F35A18DD00DD4024A0FA52', '0000-00-00 00:00:00', 3),
(22, '2015-06-15 09:20:12', 'navaya', '127.0.0.1', '2DF205754E18926F60915A71B44F61AB', '0000-00-00 00:00:00', 3),
(23, '2015-06-15 09:20:30', 'super', '127.0.0.1', 'F0A674B249D2F82E21EBA7FDA8DE9CC4', '0000-00-00 00:00:00', 3),
(24, '2015-06-15 09:25:43', 'sunayana', '127.0.0.1', 'FFEE50D32249D14B29BEF2B626816E99', '0000-00-00 00:00:00', 3),
(25, '2015-06-15 09:33:38', 'Naina', '127.0.0.1', '67FBD51AFA76D123181CB3EE21627561', '0000-00-00 00:00:00', 3),
(26, '2015-06-15 09:33:59', 'super', '127.0.0.1', 'C557130B37CBCD9337E6D5402D915E87', '0000-00-00 00:00:00', 3),
(27, '2015-06-15 09:35:48', 'Naina', '127.0.0.1', '17441BAB79CF24D8BB8818AB5DD87DAF', '0000-00-00 00:00:00', 3),
(28, '2015-06-15 09:36:13', 'super', '127.0.0.1', 'AFD5FA9F205B60F3D1E3A79DCBCAC900', '0000-00-00 00:00:00', 3),
(29, '2015-06-15 09:37:25', 'Gautam', '127.0.0.1', 'A779DC17E7545BB5839463ADE20BCF75', '0000-00-00 00:00:00', 3),
(30, '2015-06-15 10:01:09', 'super', '127.0.0.1', '5B03CEC9510599E139BF6FEB085A7F37', '0000-00-00 00:00:00', 3),
(31, '2015-06-15 10:06:20', 'hilari', '127.0.0.1', 'B833E68D342F688516811F98E36B092B', '0000-00-00 00:00:00', 3),
(32, '2015-06-15 10:30:25', 'super', '127.0.0.1', '8621388AA937C6D8DA2B13DD4DA2ABE7', '0000-00-00 00:00:00', 3),
(33, '2015-06-15 10:31:00', 'super', '127.0.0.1', '539224D301F1BDACAAA467D3F4399D9A', '0000-00-00 00:00:00', 3),
(34, '2015-06-15 10:31:30', 'sunayana', '127.0.0.1', '5E1B4E50B2B4BDD9151685BB0D4AF632', '0000-00-00 00:00:00', 3),
(35, '2015-06-15 10:37:03', 'sunayana', '127.0.0.1', 'D9D231A7B612441655E68224F730628B', '2015-06-15 11:58:44', 1),
(36, '2015-06-15 11:12:14', 'johncarter', '192.168.1.8', 'C567C210F09ED137B05AFAABB46DA3A8', '2015-06-15 12:11:25', 1),
(37, '2015-06-15 12:19:30', 'Naina', '127.0.0.1', '8315E3DA445203E1E7E8DB383D815347', '2015-06-15 12:49:30', 1),
(38, '2015-06-15 12:41:54', 'johncarters', '192.168.1.8', '9A1D9904EFBE66C99874937BC3DA8F6E', '2015-06-15 12:46:23', 2),
(39, '2015-06-15 12:51:43', 'super', '192.168.1.8', 'EFC7FB50BBF46E74E769B1B830AC0BA2', '2015-06-15 13:11:02', 0),
(40, '2015-06-15 13:11:02', 'super', '192.168.1.8', '1FD5E2801B1C5FA25C6F09DB26395922', '2015-06-15 13:11:19', 2),
(41, '2015-06-15 13:11:25', 'super', '192.168.1.8', '4DAC16D4CC6C8575C61BFA6B35C60896', '2015-06-15 13:12:37', 2),
(42, '2015-06-16 05:02:32', 'super', '127.0.0.1', '7BF9E34084030FD43161114DE54A3782', '2015-06-16 05:03:00', 2),
(43, '2015-06-16 05:03:09', 'Kapil', '127.0.0.1', 'A1BFB2DE37E1182317CB69EF604E1CFD', '2015-06-16 05:03:16', 2),
(44, '2015-06-16 05:03:24', 'super', '127.0.0.1', '61CD134C6BDBF49F390EAF8CDAA94E00', '2015-06-16 05:06:24', 0),
(45, '2015-06-16 05:06:25', 'super', '127.0.0.1', 'D6FE32FA2293678C1A1C0060144B3E37', '2015-06-16 05:36:26', 1),
(46, '2015-06-16 05:43:56', 'hilari', '127.0.0.1', '7F5C843D1C389A5C1671664B07E8439C', '0000-00-00 00:00:00', 3),
(47, '2015-06-16 06:16:43', 'hilari', '127.0.0.1', 'AAB7E562F0C0D7A48177CB826854422F', '2015-06-16 06:16:58', 2),
(48, '2015-06-16 06:17:10', 'super', '127.0.0.1', 'E913FF7C4FC6C4D88C3CE0BC6B94ACDA', '2015-06-16 06:18:14', 2),
(49, '2015-06-16 06:18:25', 'Naina', '127.0.0.1', '9A4C82991F9523A50321F96033FDB13B', '2015-06-16 06:20:00', 0),
(50, '2015-06-16 06:20:00', 'Naina', '127.0.0.1', 'D11EEE839482079AFDA0F1DE0E7D5F24', '2015-06-16 06:28:09', 0),
(51, '2015-06-16 06:28:09', 'Naina', '127.0.0.1', '852EE0A62670B44FE0AA9F838CB40D27', '2015-06-16 06:57:55', 1),
(52, '2015-06-16 07:10:40', 'Naina', '127.0.0.1', 'A4FE9E6C36C8B52EDACABB33272CB329', '0000-00-00 00:00:00', 3),
(53, '2015-06-16 08:04:11', 'hilari', '127.0.0.1', 'F9DAD3F22FCA570D713B7F156B84D875', '2015-06-16 08:04:59', 2),
(54, '2015-06-16 09:25:46', 'Naina', '127.0.0.1', 'E4DF03BD522D11C1D61C6E4F944EE321', '2015-06-16 09:25:58', 2),
(55, '2015-06-16 09:26:06', 'super', '127.0.0.1', '6392D79C68C237E20BC64A0EAB1FFD04', '2015-06-16 09:26:27', 2),
(56, '2015-06-16 09:26:36', 'Naina', '127.0.0.1', '1AD4E4E95CF7B09590D2D50629DCE435', '2015-06-16 09:27:38', 2),
(57, '2015-06-16 09:27:46', 'super', '127.0.0.1', '9BAB18610B47A87ECB34BD6D619D11AB', '2015-06-16 09:35:32', 0),
(58, '2015-06-16 09:35:32', 'super', '127.0.0.1', '5F6C6F4C9F4C35B5C618076ADEF21098', '2015-06-16 09:36:23', 2),
(59, '2015-06-16 09:36:35', 'Gautam', '127.0.0.1', 'BB9B4E6ED1C111897A87D3787BDCF5DF', '2015-06-16 09:36:45', 2),
(60, '2015-06-16 09:36:54', 'super', '127.0.0.1', 'CC3058B75F27C97DCF6C2E8EC6707528', '2015-06-16 10:02:44', 2),
(61, '2015-06-16 10:04:02', 'super', '127.0.0.1', 'F33D264C73F7C81852B33EC38B911C46', '2015-06-16 10:04:22', 2),
(62, '2015-06-16 10:04:48', 'hilari', '127.0.0.1', '68DF03AE48A92217C05DDED2C90DD157', '2015-06-16 10:05:43', 2),
(63, '2015-06-16 10:42:22', 'sunayana', '127.0.0.1', '357C00797AD9AF01D4F0E4166649C211', '2015-06-16 10:42:47', 2),
(64, '2015-06-16 10:43:08', 'super', '127.0.0.1', 'F7064FEA53EF5AF44DF76C4394CEA6AE', '2015-06-16 10:43:20', 2),
(65, '2015-06-16 10:43:56', 'super', '127.0.0.1', 'C8F44F7E25E812AC381BB31932F947ED', '2015-06-16 10:46:29', 0),
(66, '2015-06-16 10:46:29', 'super', '127.0.0.1', '8B96C23C7D798FAD26322FFF0A945D10', '2015-06-16 10:47:54', 2),
(67, '2015-06-16 10:48:00', 'sunayana', '127.0.0.1', '134BA90FC2368796660DBDD1BB6AA0D9', '2015-06-16 10:50:06', 2),
(68, '2015-06-16 11:00:21', 'super', '127.0.0.1', '3A0CB793178D78A13E91F0F703D74519', '2015-06-16 11:01:39', 2),
(69, '2015-06-16 11:01:53', 'sunayana', '127.0.0.1', '48BCBFB123749937140C97A5CFBE0EB3', '2015-06-16 11:04:19', 2),
(70, '2015-06-16 11:10:23', 'sunayana', '127.0.0.1', '875C135E436CACCFBA26BF69763E01CC', '2015-06-16 11:11:58', 2),
(71, '2015-06-16 12:09:47', 'super', '192.168.1.15', '914C80E50A9F7AD3B1D610A2FEE24176', '2015-06-16 12:13:52', 0),
(72, '2015-06-16 12:13:52', 'super', '192.168.1.15', '52B9BA699601CB27A6572904FB2856D1', '2015-06-16 12:14:10', 2),
(73, '2015-06-16 12:14:26', 'super', '192.168.1.15', '7DFA4F43EB3015B20AD39360EA56E5C2', '2015-06-16 12:39:40', 0),
(74, '2015-06-16 12:39:40', 'super', '192.168.1.15', '615FC7D1B31BDDA81F29A38773322777', '2015-06-16 12:43:25', 2),
(75, '2015-06-16 12:44:05', 'super', '192.168.1.15', 'EA9BF5781E05F88716DE86252E22AE9B', '2015-06-16 12:44:20', 0),
(76, '2015-06-16 12:44:20', 'super', '192.168.1.15', '402EF26F6E345D4BA31299203CE4D859', '2015-06-16 12:45:43', 2),
(77, '2015-06-16 12:45:52', 'super', '192.168.1.15', 'E7984097BD13BE8C69F67B7BB5812F92', '2015-06-16 12:46:40', 2),
(78, '2015-06-16 12:46:49', 'Naina', '192.168.1.15', '66DE618C989348CE8F858EF60B148AA9', '2015-06-16 12:47:03', 2),
(79, '2015-06-16 12:47:10', 'super', '192.168.1.15', '549B958A5817FC76B636DF8D6A3676E6', '2015-06-16 12:48:09', 2),
(80, '2015-06-16 12:48:16', 'Naina', '192.168.1.15', 'C5912E5B212B2FF59AE4860E58EB8957', '2015-06-16 12:48:34', 2),
(81, '2015-06-16 12:48:41', 'super', '192.168.1.15', '6E818F0F388EFDFE5373D8FA50EE53ED', '2015-06-17 04:46:22', 0),
(82, '2015-06-16 12:51:35', 'super', '127.0.0.1', '819A4902C4FE1AA79324CCD1A1AA171E', '2015-06-16 13:21:36', 1),
(83, '2015-06-17 06:17:03', 'super', '127.0.0.1', 'FE28989A2A49789048F9EAE8C6D9DB19', '2015-06-17 06:21:48', 2),
(84, '2015-06-17 06:22:38', 'hilari', '127.0.0.1', '8F92B75B8EE86F6A3588EFDD0C07F0F3', '2015-06-17 06:25:48', 2),
(85, '2015-06-17 06:26:25', 'Naina', '127.0.0.1', 'BA3676DDDB29B0626A0B056DCA7A83F9', '2015-06-17 06:27:09', 2),
(86, '2015-06-17 06:27:29', 'hilari', '127.0.0.1', '5DA8E38BDDEFDB154BFDDB87EDCC074F', '2015-06-17 06:28:48', 2),
(87, '2015-06-17 06:29:25', 'hilari', '127.0.0.1', 'F92E6065EB93F6B44A288D2E26CC6B70', '2015-06-17 06:29:34', 2),
(88, '2015-06-17 06:29:53', 'Naina', '127.0.0.1', 'F36552B79630C125C2E45A59E65EF794', '2015-06-17 06:31:05', 2),
(89, '2015-06-17 06:31:23', 'hilari', '127.0.0.1', '1032ADF4425657066C97841598573A77', '2015-06-17 06:46:45', 2),
(90, '2015-06-17 06:47:02', 'hilari', '127.0.0.1', 'E7A4A5D48D6F13E0538907AE3A2D4DEB', '2015-06-17 06:57:03', 2),
(91, '2015-06-17 06:57:25', 'hilari', '127.0.0.1', 'D4545E2C9E46375C927DC42F5CFCBBD8', '2015-06-17 06:57:51', 0),
(92, '2015-06-17 06:57:51', 'hilari', '127.0.0.1', '598475369A7B7B506FEB1EF32621069A', '2015-06-17 06:58:16', 2),
(93, '2015-06-17 06:58:27', 'sunayana', '127.0.0.1', '052771222ABD9B6E85E5E30D6BE48C8B', '2015-06-17 07:07:52', 2),
(94, '2015-06-17 07:08:06', 'hilari', '127.0.0.1', 'F564B73171356017B190F9BE0FB2B906', '2015-06-17 07:31:14', 0),
(95, '2015-06-17 07:31:15', 'hilari', '127.0.0.1', '3CCFE94CB0171DE69B3C8F8431AD8458', '2015-06-17 08:01:32', 1),
(96, '2015-06-17 08:39:43', 'hilari', '127.0.0.1', '68ADA704E31279A6793EFF28F89C2577', '2015-06-17 08:40:03', 2),
(97, '2015-06-17 08:40:22', 'hilari', '127.0.0.1', 'F08E9FED95F6438CA4981164D2CB56B1', '2015-06-17 09:03:26', 2),
(98, '2015-06-17 09:03:37', 'super', '127.0.0.1', 'D3EA82B97ACA241B26BFDE6B78AAC7B9', '0000-00-00 00:00:00', 3),
(99, '2015-06-17 09:47:26', 'super', '127.0.0.1', 'B699B87AE5A5066F71F736A9E109D978', '2015-06-17 10:48:06', 0),
(100, '2015-06-17 10:48:06', 'super', '127.0.0.1', '4E2A6F0F4B544D25B55AA37B0BD7CC6D', '2015-06-17 11:17:16', 0),
(101, '2015-06-17 11:17:16', 'super', '127.0.0.1', '7C2C6A886FCA9E1D47DDD053E2AAD00D', '2015-06-17 11:20:39', 0),
(102, '2015-06-17 11:20:39', 'super', '127.0.0.1', 'B7E7B674299419D5FC82A3DA966FA56C', '2015-06-17 11:23:58', 0),
(103, '2015-06-17 11:23:58', 'super', '127.0.0.1', '921CFFC11C9457E410AB445641FB3650', '2015-06-17 12:56:20', 0),
(104, '2015-06-17 12:56:21', 'super', '127.0.0.1', '8ED13DD41F97BAA4A315151E6DB0BE1D', '2015-06-18 05:06:23', 0),
(105, '2015-06-18 05:06:22', 'super', '127.0.0.1', '9D5759085B72E10FD51EAC8E32301561', '2015-06-18 06:01:20', 1),
(106, '2015-06-19 04:49:37', 'super', '127.0.0.1', '0F191A6CBB3A102B96071392C2035781', '2015-06-19 06:50:06', 0),
(107, '2015-06-19 05:16:42', 'super', '127.0.0.1', 'FC011A8F6A66E6C9C7944EF1A3FDF4E8', '2015-06-19 05:17:15', 2),
(108, '2015-06-19 05:18:35', 'hilari', '127.0.0.1', 'CD9EAC020F32BC24F592F4648917F311', '2015-06-19 05:19:07', 2),
(109, '2015-06-19 05:19:17', 'super', '127.0.0.1', 'AA5AB90154117C6D881C8C37564C5A7B', '2015-06-19 05:21:15', 0),
(110, '2015-06-19 05:21:15', 'super', '127.0.0.1', '41695963AAF5768DCBADAF419ACCB98B', '2015-06-19 05:35:26', 0),
(111, '2015-06-19 05:35:26', 'super', '127.0.0.1', '5C6D7A86C6D7F0B9E0E45BCF763DDD13', '2015-06-19 06:07:27', 2),
(112, '2015-06-19 06:08:00', 'hilari', '127.0.0.1', '8FB9A1A258C1A9633657623FE40FF49D', '2015-06-19 06:13:07', 2),
(113, '2015-06-19 06:13:14', 'super', '127.0.0.1', '26B006188035416AD5070761C2E4889B', '2015-06-19 06:19:37', 2),
(114, '2015-06-19 06:19:59', 'hilari', '127.0.0.1', '26ABE6C03BD690778CBA417B655706C4', '2015-06-19 06:44:36', 2),
(115, '2015-06-19 06:44:45', 'super', '127.0.0.1', '474C9AC564A5F04432BA9CA287D78150', '2015-06-19 07:20:52', 2),
(116, '2015-06-19 07:20:59', 'hilari', '127.0.0.1', 'D4B84ABADD3644C31BE7BF859B645A16', '2015-06-19 07:23:07', 2),
(117, '2015-06-19 07:23:15', 'super', '127.0.0.1', '4EDB58209672D9DE34B3F880D4492CE0', '2015-06-19 07:29:33', 2),
(118, '2015-06-19 07:29:41', 'hilari', '127.0.0.1', 'A10516809293036517DA48547C8D8B9B', '2015-06-19 07:33:58', 2),
(119, '2015-06-19 07:34:05', 'super', '127.0.0.1', '04C6EEE4A8ED84DB6F865CAD2EE10DBB', '2015-06-19 07:42:44', 2),
(120, '2015-06-19 07:43:00', 'hilari', '127.0.0.1', '133FB7F20B5B750D255CE24CC5A0BBE3', '2015-06-19 08:11:26', 2),
(121, '2015-06-19 08:11:37', 'super', '127.0.0.1', '7F716D69367611FF6EBAC69B212FCF50', '2015-06-19 08:16:27', 0),
(122, '2015-06-19 08:16:27', 'super', '127.0.0.1', '1182586C81C4A4BE53871E09F3CCACAE', '2015-06-19 08:16:55', 2),
(123, '2015-06-19 08:17:09', 'hilari', '127.0.0.1', '38DD488961D3CD9A3F4658322103A9DD', '2015-06-19 08:25:45', 2),
(124, '2015-06-19 08:25:51', 'super', '127.0.0.1', '1C989FD070C3E9832178437663A7BDEC', '2015-06-19 08:35:47', 0),
(125, '2015-06-19 08:35:47', 'super', '127.0.0.1', '3F153D1D23C4079976E95778F2760A49', '2015-06-19 08:56:32', 2),
(126, '2015-06-19 08:56:49', 'hilari', '127.0.0.1', 'DD9DD4D553DE842FC59513DB2575DD23', '2015-06-19 09:00:11', 0),
(127, '2015-06-19 09:00:12', 'hilari', '127.0.0.1', '298E1283045A03F038AC52D45E81CF96', '2015-06-19 09:04:20', 0),
(128, '2015-06-19 09:04:20', 'hilari', '127.0.0.1', 'E3D226E6458143C97DE9B105D21713E1', '2015-06-19 09:06:50', 2),
(129, '2015-06-19 09:06:57', 'super', '127.0.0.1', 'E53002638B0577D48B6CF4205221BF52', '2015-06-19 09:09:16', 2),
(130, '2015-06-19 09:09:56', 'hilari', '127.0.0.1', 'DC7781EA24A5327773FE61DFB9E80DA2', '2015-06-19 09:35:21', 2),
(131, '2015-06-19 09:35:28', 'super', '127.0.0.1', '15B49FB9FF717E79B89486583E55DB6B', '2015-06-19 09:36:28', 2),
(132, '2015-06-19 09:38:23', 'super', '127.0.0.1', '3DC709D5CEA54EDF1F1BDF3DA6031124', '2015-06-19 09:40:20', 2),
(133, '2015-06-19 09:40:45', 'hilari', '127.0.0.1', 'E5E72A05155BE090041E8F5B7FF27FDE', '2015-06-19 10:00:25', 2),
(134, '2015-06-19 10:00:32', 'super', '127.0.0.1', 'BCEAAE1A9CBF31624DA6930105A99712', '2015-06-19 10:06:05', 0),
(135, '2015-06-19 10:06:05', 'super', '127.0.0.1', '7B53C2EA8AA87C8FB2AFAAD0A796328C', '2015-06-19 10:06:29', 2),
(136, '2015-06-19 10:06:38', 'super', '127.0.0.1', 'AF6C9D2AA6D0B0808FEF2EFE664B77EA', '2015-06-19 10:09:41', 2),
(137, '2015-06-19 10:10:00', 'hilari', '127.0.0.1', '2786E310E240AAFF43CC55CD312ED7EB', '2015-06-19 10:12:39', 2),
(138, '2015-06-19 10:12:46', 'super', '127.0.0.1', '4A4BB720FD4A8D91963238C4C57ED371', '2015-06-19 10:18:21', 2),
(139, '2015-06-19 10:18:35', 'hilari', '127.0.0.1', '7EED81613BF91B5B231C7046CD43702D', '2015-06-19 10:35:31', 2),
(140, '2015-06-19 10:35:39', 'super', '127.0.0.1', '84BA0697EE62E756542A3B9413D5B4FA', '2015-06-19 10:38:32', 2),
(141, '2015-06-19 10:38:44', 'hilari', '127.0.0.1', 'AC9DC5585AAB8EA185F5885E8815AC99', '2015-06-19 10:40:46', 2),
(142, '2015-06-19 10:41:00', 'super', '127.0.0.1', '06D8B9012D3DA75048F38B725AFE64AC', '2015-06-19 11:11:01', 1),
(143, '2015-06-19 11:17:01', 'super', '127.0.0.1', '3D4F976FACC7B6C139526C540A5DAC70', '2015-06-19 11:48:45', 1),
(144, '2015-06-19 12:57:30', 'super', '127.0.0.1', 'F4926BAE7168BEF734BE84A1F78631CE', '2015-06-19 12:57:54', 2),
(145, '2015-06-19 12:58:18', 'hilari', '127.0.0.1', 'CA924CF1F4E024792B93680B93C72E5A', '2015-06-19 13:00:20', 2),
(146, '2015-06-19 13:00:27', 'super', '127.0.0.1', '65CFEF239AC96320C030005E02AA8E39', '2015-06-22 04:39:50', 0),
(147, '2015-06-22 04:39:08', 'super', '127.0.0.1', '6FC4A20F71C030026C81C704D79B49A9', '2015-06-22 04:44:28', 2),
(148, '2015-06-22 04:44:32', 'super', '127.0.0.1', '2226BEF6481A2B582B92641EB8709913', '2015-06-22 04:44:48', 2),
(149, '2015-06-22 04:52:04', 'super', '127.0.0.1', '2206A611EBD44A69663643342B54DE7E', '2015-06-22 04:57:55', 2),
(150, '2015-06-22 04:58:43', 'hilari', '127.0.0.1', '224E30F5AA5096BD619CC95CFFFBF165', '2015-06-22 05:07:46', 2),
(151, '2015-06-22 05:07:51', 'super', '127.0.0.1', 'FD1D1FE109E410BCF42C97DB5BDEEE18', '2015-06-22 06:05:29', 0),
(152, '2015-06-22 06:05:29', 'super', '127.0.0.1', '04494803123EBD956F9573EC1062D2FB', '2015-06-22 06:40:22', 1),
(153, '2015-06-22 06:49:09', 'super', '127.0.0.1', 'F1C447FBD0326978DB712926E7FB3EAB', '0000-00-00 00:00:00', 3),
(154, '2015-06-22 07:35:48', 'super', '127.0.0.1', 'D25AB08ACFBEEF9319CC09792B8A1962', '2015-06-22 08:05:50', 1),
(155, '2015-06-22 08:32:08', 'super', '127.0.0.1', '1A9AEB6774C99FD7AA0EC67261608B03', '0000-00-00 00:00:00', 3),
(156, '2015-06-22 09:17:21', 'super', '127.0.0.1', 'A562AFCFFBC95DF71AEDBEC3F07C4E99', '2015-06-22 09:47:25', 1),
(157, '2015-06-22 10:27:43', 'super', '127.0.0.1', 'A618E2839BD0039BABD889A988D9E479', '2015-06-22 10:57:49', 1),
(158, '2015-06-22 11:12:47', 'super', '127.0.0.1', '298FE573EEC3043C139EA5CB1E116AAC', '0000-00-00 00:00:00', 3),
(159, '2015-06-22 11:38:59', 'super', '127.0.0.1', '5CACA6233FBE28DA81B9E94A13C7673F', '2015-06-22 12:07:48', 2),
(160, '2015-06-22 12:11:07', 'sunayana', '127.0.0.1', '48DFCE7B604A8E7E12C57CE141EB3B50', '2015-06-22 12:16:33', 2),
(161, '2015-06-22 12:16:37', 'super', '127.0.0.1', '7DA3E804F7FE6E73E90E022C2EC2703B', '2015-06-22 12:19:59', 2),
(162, '2015-06-22 12:20:32', 'sunayana', '127.0.0.1', '1072335713F8C713510344AC1756E291', '2015-06-22 12:33:17', 2),
(163, '2015-06-22 12:35:18', 'sunayana', '127.0.0.1', 'B9121D35508A64FCB0C7D8C1062E9E6E', '2015-06-22 13:17:37', 1),
(164, '2015-06-23 04:45:55', 'super', '127.0.0.1', '0907647BE345871BABF0651927D3030C', '2015-06-23 04:47:18', 2),
(165, '2015-06-23 04:48:35', 'sunayana', '127.0.0.1', '89DFB2BAD9D25599C085BE2B9EFCCD37', '2015-06-23 05:38:39', 0),
(166, '2015-06-23 05:38:39', 'sunayana', '127.0.0.1', '916523C1189B2300A12DA7BFF464B3D5', '2015-06-23 06:08:36', 0),
(167, '2015-06-23 06:08:36', 'hilari', '127.0.0.1', '8612217BE3FE64C80DC1F7B58B36665D', '2015-06-23 06:13:33', 1),
(168, '2015-06-23 06:16:28', 'sunayana', '127.0.0.1', 'E858D1E43C8B83B03C919459AAA6CA52', '2015-06-23 06:20:08', 2),
(169, '2015-06-23 06:20:25', 'hilari', '127.0.0.1', 'BB2569D5531BBD7CF5FF5E935C4A6449', '2015-06-23 06:25:23', 2),
(170, '2015-06-23 06:25:47', 'hilari', '127.0.0.1', 'D4DE648DB073704401B76BE283287635', '2015-06-23 06:32:21', 0),
(171, '2015-06-23 06:45:21', 'hilari', '127.0.0.1', '824424FEE571506BC3BCCB9165DC7FB7', '2015-06-23 07:01:58', 0),
(172, '2015-06-23 07:01:58', 'hilari', '127.0.0.1', 'AFDE4AEEBD7D1F59F991C34464DC1D1C', '2015-06-23 07:06:04', 2),
(173, '2015-06-23 07:06:23', 'hilari', '127.0.0.1', '06F37F84632C897DDDC89149CAA24156', '0000-00-00 00:00:00', 3),
(174, '2015-06-23 08:53:47', 'hilari', '127.0.0.1', '1389926330FB9D667AA85915FEB39A88', '2015-06-23 09:42:33', 1),
(175, '2015-06-23 09:59:02', 'hilari', '127.0.0.1', 'E997B9102A6A9BE0C3369106BDE8CC1E', '2015-06-23 10:32:26', 1),
(176, '2015-06-23 10:37:41', 'hilari', '127.0.0.1', 'EA7117C0C7F9AE3C40A36BD738DD49CF', '2015-06-23 11:08:23', 0),
(177, '2015-06-23 11:08:23', 'hilari', '127.0.0.1', '15C17F36D18DB06EE20EC55B47DD82F5', '2015-06-23 11:52:53', 1),
(178, '2015-06-23 12:06:53', 'hilari', '127.0.0.1', 'F3739E0C1B3FB47EBD1B8016AFC7E112', '2015-06-23 12:36:49', 2),
(179, '2015-06-23 12:40:50', 'hilari', '127.0.0.1', '3D8C8B012E9A066DFF0C345024868197', '2015-06-23 12:42:36', 2),
(180, '2015-06-23 12:42:51', 'hilari', '127.0.0.1', 'C0146ACE96762D5FE61359A727BC1C9F', '0000-00-00 00:00:00', 3),
(181, '2015-06-23 13:27:41', 'hilari', '127.0.0.1', 'A0D50A1E639A8C0F6575F862962EBBBA', '2015-06-24 04:38:16', 0),
(182, '2015-06-24 04:40:06', 'sunayana', '127.0.0.1', 'EC0575793C2B124291A866B89B577DFE', '2015-06-24 05:07:08', 2),
(183, '2015-06-24 05:07:53', 'hilari', '127.0.0.1', 'E08E3210F85C3E11D7DC21E540A0D2FE', '2015-06-24 05:14:23', 0),
(184, '2015-06-24 05:14:23', 'hilari', '127.0.0.1', '7C0F475E41F8DE0312D692EA52D3D8FF', '2015-06-24 06:05:20', 0),
(185, '2015-06-24 05:29:45', 'super', '192.168.1.8', '3EE1F3763D2D03F8EEDDF3924A7448BE', '2015-06-24 05:38:14', 0),
(186, '2015-06-24 05:32:25', 'hilari', '192.168.1.22', '1A40D24F701A4734C7C0E6821C73C9A0', '2015-06-24 05:40:50', 2),
(187, '2015-06-24 05:38:14', 'super', '192.168.1.8', '56D038E1E79FA7038E00A539E54A3A5E', '2015-06-24 05:38:32', 2),
(188, '2015-06-24 05:38:52', 'johncarter', '192.168.1.8', 'EA7833C5B947C1F1676122CDDC53A30A', '2015-06-24 05:40:24', 2),
(189, '2015-06-24 05:51:03', 'johncarters', '192.168.1.8', 'F9369282A0EB17DF4CDEC959F0915063', '2015-06-24 05:55:27', 0),
(190, '2015-06-24 05:55:27', 'johncarters', '192.168.1.8', '0A753D90A8C51A0CD82CA51EEB97BBE7', '2015-06-24 05:58:08', 2),
(191, '2015-06-24 05:58:20', 'johncarters', '192.168.1.8', '27EB21E295F33E539A5F8B961E4FF578', '2015-06-24 06:01:20', 2),
(192, '2015-06-24 06:01:31', 'super', '192.168.1.8', '34F37D28BC274C81C2CD93B541A04D32', '0000-00-00 00:00:00', 3),
(193, '2015-06-24 06:05:20', 'hilari', '127.0.0.1', 'C89583F36915474ACF6A9BF385CACA60', '2015-06-24 06:14:54', 0),
(194, '2015-06-24 06:14:54', 'hilari', '127.0.0.1', '582EA6C43AAA711F15106EC82375B498', '0000-00-00 00:00:00', 3),
(195, '2015-06-24 06:30:50', 'hilari', '127.0.0.1', '1C36A8A4DDC386F58BFB5BCBC417901A', '2015-06-24 07:16:20', 0),
(196, '2015-06-24 07:16:20', 'hilari', '127.0.0.1', 'C552E3D447ADDD634B7C0E7B6FFE5D23', '2015-06-24 07:20:25', 2),
(197, '2015-06-24 07:20:38', 'sunayana', '127.0.0.1', 'E88059393D94541F91434F804A0CB61C', '2015-06-24 07:24:21', 2),
(198, '2015-06-24 07:24:36', 'hilari', '127.0.0.1', 'FA7DC68DB050CA1CB2704E216DB2A889', '2015-06-24 07:30:56', 0),
(199, '2015-06-24 07:30:56', 'hilari', '127.0.0.1', '57B8994196973408ADF4814A052263EA', '2015-06-24 08:03:46', 1),
(200, '2015-06-24 08:46:34', 'hilari', '127.0.0.1', 'E6C6E2C29D12D8ED130DA9CE14488540', '2015-06-24 08:49:00', 0),
(201, '2015-06-24 08:49:00', 'hilari', '127.0.0.1', 'C139FE529E61770E9E7BD343119ED808', '2015-06-24 09:35:19', 1),
(202, '2015-06-24 09:41:22', 'hilari', '127.0.0.1', 'E9FAC2624C6AB57A8A54B9322CAE08E7', '2015-06-24 09:48:18', 0),
(203, '2015-06-24 09:48:18', 'hilari', '127.0.0.1', 'BEAB88AFEA9492BD0A6490E33DA50883', '2015-06-24 10:18:53', 0),
(204, '2015-06-24 10:18:53', 'hilari', '127.0.0.1', 'C61AC742B696B83F94AF00480ED10A96', '2015-06-24 11:21:55', 2),
(205, '2015-06-24 11:22:14', 'hilari', '127.0.0.1', '7592908D6D7D7BF808BA59E3D4476AD0', '2015-06-24 11:25:39', 0),
(206, '2015-06-24 11:25:39', 'hilari', '127.0.0.1', '23554695EBE30EC5C461B22807CB7E47', '2015-06-24 12:24:16', 2),
(207, '2015-06-24 12:06:43', 'hilari', '192.168.1.8', '02005179C50D0825767CCD28EA01F499', '0000-00-00 00:00:00', 3),
(208, '2015-06-24 12:24:31', 'hilari', '127.0.0.1', 'EEDE74DFFFEAA52393599848070BB5D7', '2015-06-24 12:54:56', 1),
(209, '2015-06-25 05:44:16', 'hilari', '127.0.0.1', '147F48A4904A2E15E3C5824D27A05BDD', '2015-06-25 06:40:00', 0),
(210, '2015-06-25 06:40:00', 'hilari', '127.0.0.1', '83A70C8F79F0D788381DA4C36957D4B1', '2015-06-25 07:24:02', 0),
(211, '2015-06-25 07:24:02', 'hilari', '127.0.0.1', '1D1FC63B2FEC2789B92EECEABAEA6D08', '2015-06-25 08:05:32', 1),
(212, '2015-06-25 08:19:47', 'hilari', '127.0.0.1', '1C4CA063307D6A97C2DF8F0902BA0107', '2015-06-25 08:45:09', 0),
(213, '2015-06-25 08:45:09', 'hilari', '127.0.0.1', '1D852811957C41858B917B8AAFF9ED0F', '2015-06-25 08:47:59', 0),
(214, '2015-06-25 08:47:59', 'hilari', '127.0.0.1', '7CF714F390FD02E6E9B17BB6590B9146', '2015-06-25 09:23:42', 1),
(215, '2015-06-25 09:30:22', 'hilari', '127.0.0.1', '832645FBA3269911AA80436BC270039A', '2015-06-25 09:39:08', 2),
(216, '2015-06-25 09:39:11', 'super', '127.0.0.1', 'D375DBD334639292A6FDBA5F4D3AB288', '2015-06-25 10:09:12', 1),
(217, '2015-06-25 10:19:08', 'hilari', '127.0.0.1', 'E459E237F035C1DF4B9289026C7C6FB0', '2015-06-25 11:06:58', 2),
(218, '2015-06-25 10:52:20', 'super', '192.168.1.5', '1224BE21A8D4D886F4992B2ADE03A9E4', '2015-06-25 10:57:54', 2),
(219, '2015-06-25 10:58:17', 'johncarters', '192.168.1.5', 'CD9DEF9B9F3A6B9352B3A9DEAFB8CD6D', '2015-06-25 11:28:52', 2),
(220, '2015-06-25 11:07:01', 'super', '127.0.0.1', '9485B0959726ACE962B86B11107DC402', '2015-06-25 13:08:14', 0),
(221, '2015-06-25 11:25:39', 'johncarters', '192.168.1.22', 'A1BA26A55C9252C1E97B8A9F853DF26B', '2015-06-25 11:56:11', 0),
(222, '2015-06-25 11:29:00', 'johncarters', '192.168.1.5', '1F36ACF012ADB66F136F99039527E4DB', '2015-06-25 12:00:22', 0),
(223, '2015-06-25 11:56:12', 'johncarters', '192.168.1.22', '1530F003E8E7F6068318CC25AF2F826C', '2015-06-25 12:52:06', 1),
(224, '2015-06-25 12:00:22', 'johncarters', '192.168.1.5', '2730336974113978D0F91F048DC94ACD', '2015-06-25 12:31:12', 1),
(225, '2015-06-25 12:45:42', 'johncarters', '192.168.1.5', '2D2740EDB634227BFBDE954773979AE8', '2015-06-25 13:53:54', 1),
(226, '2015-06-27 15:09:51', 'super', '127.0.0.1', '410D1AF9E8A3B88B00A13D8CD8C98903', '2015-06-27 15:39:57', 0),
(227, '2015-06-27 15:09:59', 'akfk', '192.168.1.3', '25C7A548F9F47AF5F555BE7B7BB488F3', '0000-00-00 00:00:00', 3),
(228, '2015-06-27 15:21:08', 'suejkk', '192.168.1.3', '5F0F8A728949321F7F81D17A507E9904', '0000-00-00 00:00:00', 3),
(229, '2015-06-27 15:39:57', 'super', '127.0.0.1', '404AC20FFFC0C6BECE96734924D24EF3', '0000-00-00 00:00:00', 3),
(230, '2015-06-27 16:08:49', 'super', '127.0.0.1', 'EDA50E7E456E492CE60F80AC7749E4CF', '2015-06-29 08:54:38', 0),
(231, '2015-06-29 08:55:04', 'hilari', '127.0.0.1', 'CFC70A3A383850ED836A4CDEC9D204E9', '2015-06-29 09:43:36', 2),
(232, '2015-06-29 09:44:56', 'hilari', '127.0.0.1', '83419C0F0D42C0491B8720C1F5BD0E7C', '2015-06-29 10:04:21', 0),
(233, '2015-06-29 10:04:21', 'hilari', '127.0.0.1', 'C1EE85178F48B30F1CA74EF2FCB05520', '0000-00-00 00:00:00', 3),
(234, '2015-06-29 10:58:17', 'hilari', '127.0.0.1', 'D6E4CF7E42C11C8C52FD0B59EA6A60C8', '0000-00-00 00:00:00', 3),
(235, '2015-06-29 11:08:45', 'hilari', '127.0.0.1', '9AD234E4AC2FECCD90DF9CCEA0BD81A7', '2015-06-29 11:25:54', 2),
(236, '2015-06-29 11:26:03', 'super', '127.0.0.1', '7E90E3D30BE86AA1F8D318C89517F38A', '2015-06-29 11:39:40', 2),
(237, '2015-06-29 11:39:52', 'hilari', '127.0.0.1', 'CCB7FAD4A981A30EA47FB04B8DF83E8F', '0000-00-00 00:00:00', 3),
(238, '2015-06-29 13:13:11', 'super', '127.0.0.1', 'EAD50EC90C45E1D66FF812E29E415EFA', '0000-00-00 00:00:00', 3),
(239, '2015-06-29 13:27:39', 'super', '127.0.0.1', '37F9412DDA42195D02EEEE7B1B2E9E72', '0000-00-00 00:00:00', 3),
(240, '2015-06-29 13:38:25', 'super', '127.0.0.1', 'BFFF71DE0601BA84756197C5CE820C8F', '2015-06-29 13:42:03', 0),
(241, '2015-06-29 13:42:03', 'super', '127.0.0.1', '3C2D0FA34806E0B6DEDE4A4E3F5FE1B9', '2015-06-30 05:12:26', 0),
(242, '2015-06-29 14:00:54', 'super', '192.168.1.5', 'F2AA34A8F876A6D5F417F40AC8C50A43', '2015-06-29 14:05:27', 0),
(243, '2015-06-29 14:05:27', 'super', '192.168.1.5', 'A7926D2160B46A0D3FFDF2D5F0D8CA5F', '2015-06-29 14:06:50', 2),
(244, '2015-06-29 14:06:26', 'super', '192.168.1.5', 'A3D5A4582B6FF52517C903E7B58D9087', '2015-06-29 14:21:04', 0),
(245, '2015-06-29 14:07:02', 'johncarters', '192.168.1.5', 'D4E1851E08BE2B3EDE90AC9465FE8E40', '2015-06-30 05:13:23', 0),
(246, '2015-06-29 14:21:04', 'super', '192.168.1.5', '0614010F34D3C47AC88903FE8DDC51E0', '2015-06-30 05:13:22', 0),
(247, '2015-06-29 14:22:38', 'Gautam', '192.168.1.5', '35168ACA6866DFC9A76109107C78CE7E', '2015-06-29 14:49:01', 0),
(248, '2015-06-29 14:49:01', 'Gautam', '192.168.1.5', '63EAE7E9107BAEA8519C678EB9986714', '2015-06-30 05:13:23', 0),
(249, '2015-06-30 05:12:43', 'hilari', '127.0.0.1', '44CBBF164D6F1C449F3F23A08059F783', '2015-06-30 07:12:46', 2),
(250, '2015-06-30 07:12:57', 'super', '127.0.0.1', '548515908746C7C65676987A9C4F82E4', '0000-00-00 00:00:00', 3),
(251, '2015-06-30 08:52:45', 'hilari', '127.0.0.1', '40ECD3D0B31F0E593050F91B866C5645', '2015-06-30 08:54:15', 2),
(252, '2015-06-30 09:01:07', 'hilari', '127.0.0.1', 'D91D5539136AB17027D092CC50B697DB', '2015-06-30 09:01:43', 2),
(253, '2015-06-30 09:03:47', 'hilari', '127.0.0.1', 'BB1FD83F52285348850EFC9FB2734B05', '2015-06-30 09:05:16', 2),
(254, '2015-06-30 10:15:16', 'hilari', '127.0.0.1', '98C79E0C7799A30C43F3588B3E442EDF', '2015-06-30 10:42:32', 0),
(255, '2015-06-30 10:42:32', 'hilari', '127.0.0.1', 'F8B8ACE350F175E678924AA896D03DAE', '2015-06-30 11:29:56', 2),
(256, '2015-06-30 11:30:07', 'hilari', '127.0.0.1', '20FBD2E7C90FAD9350E98940ED8718A0', '0000-00-00 00:00:00', 3),
(257, '2015-06-30 12:57:43', 'super', '127.0.0.1', '9529D8DE51916F812501C1B974A35FFC', '2015-06-30 14:00:18', 2),
(258, '2015-06-30 14:00:35', 'super', '127.0.0.1', 'D31DE5665BE86D2D4BB358ECF0394327', '2015-06-30 14:00:42', 2),
(259, '2015-06-30 14:00:57', 'hilari', '127.0.0.1', 'A0AE72E636C7CC34275F90B5D7CA5A2D', '2015-06-30 14:01:05', 2),
(260, '2015-06-30 14:01:25', 'hilari', '127.0.0.1', 'B65DE8165E80C33E6CC0693695187790', '2015-06-30 14:16:17', 2),
(261, '2015-06-30 14:17:36', 'super', '127.0.0.1', '9617E88C1A0EA80BB5F1E361BB619E1E', '0000-00-00 00:00:00', 3),
(262, '2015-06-30 14:24:10', 'super', '127.0.0.1', 'F712E173EE2ABE8CE19B294B6C955FA6', '2015-07-01 03:16:36', 0),
(263, '2015-07-01 03:16:08', 'hilari', '127.0.0.1', '07BE16001C71B482E090C4E63BEC9E5A', '0000-00-00 00:00:00', 3),
(264, '2015-07-01 03:31:22', 'hilari', '127.0.0.1', 'EA6DB72DEF4F10747A270992B953AB08', '2015-07-01 03:32:07', 2),
(265, '2015-07-01 03:41:02', 'super', '127.0.0.1', 'DACD5B1FB4BA98A96EF0CB44076DF3AD', '2015-07-01 03:46:27', 2),
(266, '2015-07-01 03:46:35', 'hilari', '127.0.0.1', 'A51A4C4C9930595790FC0045E7BAB912', '2015-07-01 03:54:51', 2),
(267, '2015-07-01 03:55:02', 'super', '127.0.0.1', '23EDBE90EB4A833012748BA8BB45B678', '0000-00-00 00:00:00', 3),
(268, '2015-07-01 04:04:26', 'super', '127.0.0.1', 'FEAB509CBF643166726BDDBA918CAA77', '0000-00-00 00:00:00', 3),
(269, '2015-07-01 04:21:02', 'super', '127.0.0.1', 'BC432885C7B8EBD867225BD06E371F65', '2015-07-01 04:21:17', 2),
(270, '2015-07-01 04:21:42', 'super', '127.0.0.1', 'E4C3278E4907C5DB68A2A2C769DCDC38', '2015-07-01 08:42:24', 0),
(271, '2015-07-01 08:42:38', 'hilari', '127.0.0.1', '8341A0BAAB785B2787365C551713075C', '0000-00-00 00:00:00', 3),
(272, '2015-07-01 09:21:04', 'hilari', '127.0.0.1', 'AD4FFC0FA99EB522536D398B59B23DBC', '2015-07-01 09:28:21', 2),
(273, '2015-07-01 09:30:43', 'hilari', '127.0.0.1', '78EEFC7EB42AA777216F0D0346C03EED', '2015-07-01 09:31:43', 2),
(274, '2015-07-01 09:34:22', 'hilari', '127.0.0.1', '82424169ED576D92B5307C555A873143', '2015-07-01 09:38:17', 0),
(275, '2015-07-01 09:38:18', 'hilari', '127.0.0.1', '8A93C7B785198E88C486414D81813190', '2015-07-01 09:40:21', 2),
(276, '2015-07-01 09:43:53', 'hilari', '127.0.0.1', '2DCE272619FD734090FE310191063346', '2015-07-01 09:52:37', 2),
(277, '2015-07-01 10:00:53', 'hilari', '127.0.0.1', 'E5C7582E50901ADDC3A8FEFBD45CEC6A', '2015-07-01 10:02:11', 2),
(278, '2015-07-01 11:34:50', 'super', '127.0.0.1', '5D1ED5CF590D71768424E8FCC16CEB6F', '0000-00-00 00:00:00', 3),
(279, '2015-07-01 12:15:05', 'super', '127.0.0.1', '263FE9D51BC34781139425BE9EAC295E', '0000-00-00 00:00:00', 3),
(280, '2015-07-01 12:36:36', 'hilari', '127.0.0.1', 'E3CAC10B6B7AC2BB4AD4B818A9BEA718', '2015-07-01 12:37:02', 2),
(281, '2015-07-01 12:38:47', 'hilari', '127.0.0.1', '4110B7EBC8ED03CDD6689F0AA5FC3B24', '2015-07-01 12:39:32', 2),
(282, '2015-07-01 12:56:38', 'super', '127.0.0.1', 'CB641F68E132EB2296AC729C436CE4B2', '0000-00-00 00:00:00', 3),
(283, '2015-07-01 15:00:39', 'super', '127.0.0.1', 'A2C4A6AA7A0C623CDB307510EF7FD718', '2015-07-01 15:04:19', 2),
(284, '2015-07-01 15:04:37', 'hilari', '127.0.0.1', 'EC54688FB45526ED1B9FA1518CFB46EC', '2015-07-01 15:19:23', 2),
(285, '2015-07-01 15:19:48', 'hilari', '127.0.0.1', '80FD1DF56103462609296BF5936BB8E3', '0000-00-00 00:00:00', 3),
(286, '2015-07-01 16:18:37', 'hilari', '127.0.0.1', '64BA914DCF6041B7521A63F931ACE259', '2015-07-02 05:09:06', 0),
(287, '2015-07-02 05:09:48', 'hilari', '127.0.0.1', '51B374B643E01BD36C3D410768EF9FDD', '2015-07-02 07:07:54', 2),
(288, '2015-07-02 05:39:21', 'super', '192.168.1.4', 'A61154C1449352C1B443B0E9F6FF0906', '2015-07-02 07:38:13', 2),
(289, '2015-07-02 07:08:05', 'super', '127.0.0.1', '899482DB1394C035DA8BC84A9F8B4A72', '2015-07-02 07:09:03', 2),
(290, '2015-07-02 07:09:15', 'hilari', '127.0.0.1', 'A1A00666A4E9399291CBE85699477BF8', '2015-07-02 11:19:57', 2),
(291, '2015-07-02 11:20:39', 'super', '127.0.0.1', 'C3617502846D37DAEBEDD7C22C02E015', '0000-00-00 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_assignmodel`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_assignmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `assignById` int(11) NOT NULL,
  `assignByTypeId` int(11) NOT NULL,
  `assignToId` int(11) NOT NULL,
  `assignToTypeId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL,
  `propertyId` int(11) NOT NULL,
  `enable` bit(1) DEFAULT b'1',
  `statusId` int(5) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `estimatedCompletionDate` varchar(45) DEFAULT NULL,
  `estimatedCost` varchar(45) DEFAULT NULL,
  `functionalityId` int(5) DEFAULT NULL,
  `jobDescription` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assignById` (`assignById`,`assignByTypeId`,`assignToId`,`assignToTypeId`,`propertyId`,`functionalityId`),
  UNIQUE KEY `index3` (`functionalityId`,`propertyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_charity`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_charity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `companyName` varchar(45) NOT NULL,
  `authorisedPerson` varchar(45) NOT NULL,
  `uniqueReference` varchar(45) NOT NULL,
  `weburl` varchar(45) DEFAULT NULL,
  `enable` bit(1) DEFAULT b'1',
  `userLoginId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_perpetualrents_charity`
--

INSERT INTO `tbl_perpetualrents_charity` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `companyName`, `authorisedPerson`, `uniqueReference`, `weburl`, `enable`, `userLoginId`) VALUES
(1, '2015-06-15 07:08:29', NULL, 1, NULL, 'pcs enterpriseds', 'sunayana', 'PRUKPMC20889', 'www.pcs.com', b'1', 2),
(2, '2015-06-15 07:12:10', NULL, 1, NULL, 'web enterprises ', 'Gautam ', 'PRUKPMC20988', 'www.web.com', b'1', 3),
(3, '2015-06-15 08:16:46', NULL, 1, NULL, 'kapel enterprises ', 'kapil', 'PRUKPMC21087', 'www.enterprises.com', b'1', 5),
(4, '2015-06-15 09:06:25', NULL, 1, NULL, 'wwwoepep', 'navya', 'PRUKPMC21186', 'www.pcs.com', b'1', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_city`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  `cityId` int(11) NOT NULL,
  `objectType` varchar(45) NOT NULL,
  `objectId` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city` (`city`,`objectType`,`objectId`,`cityId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `tbl_perpetualrents_city`
--

INSERT INTO `tbl_perpetualrents_city` (`id`, `city`, `cityId`, `objectType`, `objectId`) VALUES
(13, 'aaaaaaa', 327, '10', '2'),
(18, 'Adur', 1, '10', '1'),
(14, 'Adur', 1, '10', '2'),
(9, 'Adur', 1, '3', '1'),
(4, 'Adur', 1, '3', '4'),
(19, 'Allerdale', 2, '10', '1'),
(15, 'Allerdale', 2, '10', '2'),
(10, 'Allerdale', 2, '3', '1'),
(3, 'Allerdale', 2, '3', '3'),
(5, 'Allerdale', 2, '3', '4'),
(20, 'Ashfield', 5, '10', '1'),
(2, 'Ashfield', 5, '3', '2'),
(21, 'Ashford', 6, '10', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_contactdetails`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_contactdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `emailId` varchar(55) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `landlinePhoneNumber` varchar(20) DEFAULT NULL,
  `objectType` int(11) NOT NULL,
  `objectId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_perpetualrents_contactdetails`
--

INSERT INTO `tbl_perpetualrents_contactdetails` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `emailId`, `phoneNumber`, `landlinePhoneNumber`, `objectType`, `objectId`) VALUES
(1, '2015-06-15 06:45:35', NULL, 0, NULL, 'sunayana@perceptive-solutions.com', '+44 0123456789', '+440987654321', 9, 1),
(2, '2015-06-15 07:08:29', NULL, 1, NULL, 'sunayana@gmail.com', '2288228282', NULL, 3, 1),
(3, '2015-06-15 07:12:10', NULL, 1, NULL, 'sunayana.kumari4@gmail.com', '4848488499', NULL, 3, 2),
(4, '2015-06-15 08:16:46', NULL, 1, NULL, 'kapil@gmail.com', '39393939399', NULL, 3, 3),
(5, '2015-06-15 09:06:25', NULL, 1, NULL, 'navya@gmail.com', '3939939399', NULL, 3, 4),
(6, '2015-06-15 09:38:32', NULL, 0, NULL, 'rohit@perceptive-solutions.com', '39393994939', NULL, 2, 1),
(7, '2015-06-15 10:08:32', NULL, 0, NULL, 'ukran@gmail.com', '38388383838', NULL, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_contractor`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_contractor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `uniqueReference` varchar(45) NOT NULL,
  `companyName` varchar(45) NOT NULL,
  `businessNature` varchar(255) NOT NULL,
  `contactPerson` varchar(45) DEFAULT NULL,
  `tradingCommencementDate` varchar(45) NOT NULL,
  `companyRegisterationDate` varchar(45) NOT NULL,
  `vatNo` varchar(45) DEFAULT NULL,
  `userLoginId` int(11) NOT NULL,
  `statusId` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_perpetualrents_contractor`
--

INSERT INTO `tbl_perpetualrents_contractor` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `uniqueReference`, `companyName`, `businessNature`, `contactPerson`, `tradingCommencementDate`, `companyRegisterationDate`, `vatNo`, `userLoginId`, `statusId`) VALUES
(1, '2015-06-15 09:38:32', '2015-06-27 11:38:14', 0, 1, 'PRUKC27820', 'electrical', 'electrical', NULL, '05-JUN-2015', '05-JUN-2015', '3535353', 8, 5),
(2, '2015-06-15 10:08:32', '2015-06-27 11:38:10', 0, 1, 'PRUKC27919', 'electric test', 'electric', NULL, '03-JUN-2015', '11-JUN-2015', '288828', 9, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_contractorregisterationstep2`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_contractorregisterationstep2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `contractorId` int(11) NOT NULL,
  `companyTypeId` int(11) DEFAULT NULL,
  `otherCompanyType` varchar(45) DEFAULT NULL,
  `directorDetails` varchar(250) DEFAULT NULL,
  `allDirectorsOfCompany` varchar(9999) DEFAULT NULL,
  `bankruptcyProceedings` varchar(255) DEFAULT NULL,
  `bankruptcyProceedingsComments` varchar(255) DEFAULT NULL,
  `convictedToCriminalOffence` varchar(255) DEFAULT NULL,
  `convictedToCriminalOffenceComments` varchar(255) DEFAULT NULL,
  `trusteeOfAshantiDutch` varchar(255) DEFAULT NULL,
  `trusteeOfAshantiDutchComments` varchar(255) DEFAULT NULL,
  `parentCompanyAddress` varchar(255) DEFAULT NULL,
  `companyRegisterationNumber` varchar(255) DEFAULT NULL,
  `registeredWithTradeBodies` varchar(45) DEFAULT NULL,
  `registerationNumber` varchar(255) DEFAULT NULL,
  `qualityMarks` varchar(45) DEFAULT NULL,
  `qualityMarksDetails` varchar(255) DEFAULT NULL,
  `registeredWithConstructionLine` varchar(45) DEFAULT NULL,
  `constructionLineRegisterationNumber` varchar(255) DEFAULT NULL,
  `employeesCount` varchar(255) DEFAULT NULL,
  `employeesTrade` varchar(255) DEFAULT NULL,
  `employSubcontractors` varchar(45) DEFAULT NULL,
  `employSubContractorRegisterationNumber` varchar(255) DEFAULT NULL,
  `taxOfficeAddress` varchar(255) DEFAULT NULL,
  `taxReferenceNumber` varchar(255) DEFAULT NULL,
  `insurerNameandAddress` varchar(255) DEFAULT NULL,
  `policyNumber` varchar(255) DEFAULT NULL,
  `employersLiability` varchar(255) DEFAULT NULL,
  `publicLiability` varchar(255) DEFAULT NULL,
  `proffessionalIndemnity` varchar(255) DEFAULT NULL,
  `insauranceCoverExpiryDate` varchar(255) DEFAULT NULL,
  `officeAddressId` int(11) DEFAULT NULL,
  `correspondenceAddressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contractorId_UNIQUE` (`contractorId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_perpetualrents_contractorregisterationstep2`
--

INSERT INTO `tbl_perpetualrents_contractorregisterationstep2` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `contractorId`, `companyTypeId`, `otherCompanyType`, `directorDetails`, `allDirectorsOfCompany`, `bankruptcyProceedings`, `bankruptcyProceedingsComments`, `convictedToCriminalOffence`, `convictedToCriminalOffenceComments`, `trusteeOfAshantiDutch`, `trusteeOfAshantiDutchComments`, `parentCompanyAddress`, `companyRegisterationNumber`, `registeredWithTradeBodies`, `registerationNumber`, `qualityMarks`, `qualityMarksDetails`, `registeredWithConstructionLine`, `constructionLineRegisterationNumber`, `employeesCount`, `employeesTrade`, `employSubcontractors`, `employSubContractorRegisterationNumber`, `taxOfficeAddress`, `taxReferenceNumber`, `insurerNameandAddress`, `policyNumber`, `employersLiability`, `publicLiability`, `proffessionalIndemnity`, `insauranceCoverExpiryDate`, `officeAddressId`, `correspondenceAddressId`) VALUES
(1, '2015-06-15 09:39:47', NULL, 0, NULL, 1, 3, NULL, NULL, 'sfs', 'true', NULL, 'true', NULL, 'true', NULL, NULL, NULL, 'true', NULL, 'on', NULL, 'false', NULL, '3', '3', 'on', NULL, '235', '3535353', '35353', '353', '32542', '254254', '3535', '17-JUN-2015', 19, 20),
(2, '2015-06-15 10:09:32', NULL, 0, NULL, 2, 2, NULL, NULL, 'djjj', 'true', NULL, 'true', NULL, 'true', NULL, NULL, NULL, 'true', NULL, 'on', NULL, 'false', NULL, 'af', 'sgsg', 'on', NULL, 'fafa', '3535353', 'sgsg', '36363', '353', '6', '464', '19-JUN-2015', 21, 22);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_contractorregisterationstep3`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_contractorregisterationstep3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `writtenHealthPolicy` varchar(45) DEFAULT NULL,
  `writtenHealthPolicyComments` varchar(255) DEFAULT NULL,
  `writtenHealthPolicyNoComments` varchar(255) DEFAULT NULL,
  `writtenHealthPolicyFileId` int(11) DEFAULT NULL,
  `competentHealthAndSafetyAdvice` varchar(45) DEFAULT NULL,
  `competentHealthAndSafetyAdviceComments` varchar(255) DEFAULT NULL,
  `receivedHealthAndSafety` varchar(45) DEFAULT NULL,
  `receivedHealthAndSafetyComments` varchar(255) DEFAULT NULL,
  `yearEnding1` varchar(255) DEFAULT NULL,
  `fatalAccidents1` varchar(255) DEFAULT NULL,
  `reportableInjuries1` varchar(255) DEFAULT NULL,
  `accidentRate1` varchar(255) DEFAULT NULL,
  `nonReportableInjuries1` varchar(255) DEFAULT NULL,
  `yearEnding2` varchar(255) DEFAULT NULL,
  `fatalAccidents2` varchar(255) DEFAULT NULL,
  `reportableInjuries2` varchar(255) DEFAULT NULL,
  `accidentRate2` varchar(255) DEFAULT NULL,
  `nonReportableInjuries2` varchar(255) DEFAULT NULL,
  `enforcementNoticeforHealthSafety` varchar(255) DEFAULT NULL,
  `enforcementNoticeforHealthSafetyComments` varchar(255) DEFAULT NULL,
  `safetyAccreditation` varchar(255) DEFAULT NULL,
  `safetyAccreditationComments` varchar(255) DEFAULT NULL,
  `equalityPolicy` varchar(255) DEFAULT NULL,
  `equalityPolicyComments` varchar(255) DEFAULT NULL,
  `equalityPolicyFileId` int(11) DEFAULT NULL,
  `anyunlawfulDiscrimination` varchar(255) DEFAULT NULL,
  `anyunlawfulDiscriminationComments` varchar(255) DEFAULT NULL,
  `subjectOfFormalInvestigation` varchar(255) DEFAULT NULL,
  `subjectOfFormalInvestigationComments` varchar(255) DEFAULT NULL,
  `willingToAbideByCharities` varchar(255) DEFAULT NULL,
  `additionalInformationOfCost` varchar(999) DEFAULT NULL,
  `contractorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_perpetualrents_contractorregisterationstep3`
--

INSERT INTO `tbl_perpetualrents_contractorregisterationstep3` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `writtenHealthPolicy`, `writtenHealthPolicyComments`, `writtenHealthPolicyNoComments`, `writtenHealthPolicyFileId`, `competentHealthAndSafetyAdvice`, `competentHealthAndSafetyAdviceComments`, `receivedHealthAndSafety`, `receivedHealthAndSafetyComments`, `yearEnding1`, `fatalAccidents1`, `reportableInjuries1`, `accidentRate1`, `nonReportableInjuries1`, `yearEnding2`, `fatalAccidents2`, `reportableInjuries2`, `accidentRate2`, `nonReportableInjuries2`, `enforcementNoticeforHealthSafety`, `enforcementNoticeforHealthSafetyComments`, `safetyAccreditation`, `safetyAccreditationComments`, `equalityPolicy`, `equalityPolicyComments`, `equalityPolicyFileId`, `anyunlawfulDiscrimination`, `anyunlawfulDiscriminationComments`, `subjectOfFormalInvestigation`, `subjectOfFormalInvestigationComments`, `willingToAbideByCharities`, `additionalInformationOfCost`, `contractorId`) VALUES
(1, '2015-06-15 09:40:37', NULL, 0, NULL, 'false', NULL, NULL, NULL, 'true', NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, 'false', NULL, 'false', NULL, NULL, 'false', NULL, 'false', NULL, 'false', ' 242', 1),
(2, '2015-06-15 10:09:57', NULL, 0, NULL, 'false', NULL, NULL, NULL, 'false', NULL, 'false', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, 'false', NULL, 'false', NULL, NULL, 'false', NULL, 'false', NULL, 'false', 'jsf ', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_contractorregisterationstep4`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_contractorregisterationstep4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `contractorId` int(11) DEFAULT NULL,
  `referenceAddress1` varchar(255) DEFAULT NULL,
  `referenceContact1` varchar(255) DEFAULT NULL,
  `description1` varchar(255) DEFAULT NULL,
  `referenceAddress2` varchar(255) DEFAULT NULL,
  `referenceContact2` varchar(255) DEFAULT NULL,
  `description2` varchar(255) DEFAULT NULL,
  `referenceAddress3` varchar(255) DEFAULT NULL,
  `referenceContact3` varchar(255) DEFAULT NULL,
  `description3` varchar(255) DEFAULT NULL,
  `externalHealthAndSafetyAccrediation` varchar(45) DEFAULT NULL,
  `externalHealthAndSafetyAccrediationComments` varchar(255) DEFAULT NULL,
  `additionalInformation` varchar(255) DEFAULT NULL,
  `signedBy` varchar(45) DEFAULT NULL,
  `signedDate` varchar(45) DEFAULT NULL,
  `signeeName` varchar(45) DEFAULT NULL,
  `signeePosition` varchar(45) DEFAULT NULL,
  `signeePhoneNumber` varchar(15) DEFAULT NULL,
  `signeeAlternatePhoneNumber` varchar(15) DEFAULT NULL,
  `signeeEmailAddress` varchar(45) DEFAULT NULL,
  `contactPersonName` varchar(45) DEFAULT NULL,
  `contactPersonPosition` varchar(45) DEFAULT NULL,
  `contactPersonTelephoneNumber` varchar(11) DEFAULT NULL,
  `contactPersonEmailAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_perpetualrents_contractorregisterationstep4`
--

INSERT INTO `tbl_perpetualrents_contractorregisterationstep4` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `contractorId`, `referenceAddress1`, `referenceContact1`, `description1`, `referenceAddress2`, `referenceContact2`, `description2`, `referenceAddress3`, `referenceContact3`, `description3`, `externalHealthAndSafetyAccrediation`, `externalHealthAndSafetyAccrediationComments`, `additionalInformation`, `signedBy`, `signedDate`, `signeeName`, `signeePosition`, `signeePhoneNumber`, `signeeAlternatePhoneNumber`, `signeeEmailAddress`, `contactPersonName`, `contactPersonPosition`, `contactPersonTelephoneNumber`, `contactPersonEmailAddress`) VALUES
(1, '2015-06-15 10:11:07', NULL, 0, NULL, 2, 'ejfjj', '39393939394', 'afjj', 'sfsk', '4934993944', 'afjkajkf', 'sgs', '3673464646', 'sgsgg', 'false', NULL, 'sgsg', 'sgs', '12-JUN-2015', 'DHD', 'sgsg', '46464646464', '36346464646', 'sg@gmail.com', 'sfisfkkik', 'jasfjaj', '94994949499', 'DF@GMAIL.COM');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_conversation`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` int(11) DEFAULT NULL,
  `conversationIdentity` varchar(255) NOT NULL,
  `actorOneObjectTypeId` int(5) NOT NULL,
  `actorOneId` int(45) NOT NULL,
  `actorTwoObjectTypeId` int(5) NOT NULL,
  `actorTwoId` int(11) NOT NULL,
  `propertyId` varchar(50) DEFAULT NULL,
  `mailId1` varchar(50) DEFAULT NULL,
  `mailId2` varchar(50) DEFAULT NULL,
  `functionalityId` int(11) DEFAULT NULL,
  `jobsDescription` varchar(255) DEFAULT NULL,
  `propertyTypeId` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tbl_perpetualrents_conversation`
--

INSERT INTO `tbl_perpetualrents_conversation` (`id`, `createdOn`, `createdUserId`, `conversationIdentity`, `actorOneObjectTypeId`, `actorOneId`, `actorTwoObjectTypeId`, `actorTwoId`, `propertyId`, `mailId1`, `mailId2`, `functionalityId`, `jobsDescription`, `propertyTypeId`) VALUES
(1, '2015-06-17 06:26:51', 2, 'Interested In Your Property Situated at 110098(PRUKPD40524-PRUKPMC20889)', 3, 1, 12, 4, '10', 'sunayana@gmail.com', 'ted@gmail.com', NULL, NULL, 2),
(2, '2015-06-17 06:30:53', 2, 'Interested In Your Property Situated at 33993939(PRUKPD39930-PRUKPMC20889)', 3, 1, 12, 1, '1', 'sunayana@gmail.com', 'sunayana.kumari4@gmail.com', NULL, NULL, 2),
(3, '2015-06-27 11:52:21', 7, 'Quotation-Perpetual For Electrical installations and Testing (PRUKL232669-PRUKC27820)', 1, 1, 2, 1, '15', 'sunayana.kumari4@gmail.com', 'sunayana.kumari34@gmail.com', 1, 'hello', 1),
(4, '2015-06-27 12:02:45', 7, 'Quotation-Perpetual For Electrical Test (PRUKL232669-PRUKC27820)', 1, 1, 2, 1, '15', 'sunayana.kumari4@gmail.com', 'sunayana.kumari34@gmail.com', 2, 'what happen', 1),
(5, '2015-06-27 12:03:39', 7, 'Quotation-Perpetual For Electrical installations and Testing (PRUKL232669-PRUKC27820)', 1, 1, 2, 1, '15', 'sunayana.kumari4@gmail.com', 'sunayana.kumari34@gmail.com', 1, 'llllllllllllllll', 1),
(6, '2015-06-27 12:04:15', 7, 'Quotation-Perpetual For Electrical installations and Testing (PRUKL232669-PRUKC27820)', 1, 1, 2, 1, '15', 'sunayana.kumari4@gmail.com', 'sunayana.kumari34@gmail.com', 1, 'oooooooooooo', 1),
(7, '2015-06-27 12:05:18', 7, 'Quotation-Perpetual For Electrical installations and Testing (PRUKL232669-PRUKC27820)', 1, 1, 2, 1, '15', 'sunayana.kumari4@gmail.com', 'sunayana.kumari34@gmail.com', 1, 'ffffffffff', 1),
(8, '2015-06-27 12:24:20', 29, 'Quotation-Perpetual For Asbestos Survey (PRUKL232966-PRUKC27820)', 1, 4, 2, 1, '16', 'rohit@perceptive-solutions.com', 'sunayana.kumari34@gmail.com', 8, 'hello', 1),
(9, '2015-06-27 12:26:35', 29, 'Quotation-Perpetual For Electrical installations and Testing (PRUKL232966-PRUKC27820)', 1, 4, 2, 1, '16', 'rohit@perceptive-solutions.com', 'sunayana.kumari34@gmail.com', 1, 'helllooo', 1),
(10, '2015-06-27 13:20:05', 34, 'Quotation-Perpetual For Electrical installations and Testing (PRUKL233362-PRUKC27820)', 1, 8, 2, 1, '17', 'tarun@perceptive-solutions.com', 'sunayana.kumari34@gmail.com', 1, 'hello', 1),
(11, '2015-06-27 13:26:12', 34, 'Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)', 1, 8, 2, 1, '17', 'tarun@perceptive-solutions.com', 'rohit@perceptive-solutions.com', 2, 'Description by landlord', 1),
(12, '2015-06-29 14:23:33', 3, 'Interested In Your Property Situated at 38928392(PRUKPD40326-PRUKPMC20988)', 3, 2, 12, 3, '79', 'sunayana.kumari4@gmail.com', 'johncarter4441@gmail.com', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_country`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `countryName` varchar(45) NOT NULL,
  `countryAlias` varchar(45) NOT NULL,
  `countryCode` varchar(45) NOT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_perpetualrents_country`
--

INSERT INTO `tbl_perpetualrents_country` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `countryName`, `countryAlias`, `countryCode`, `currency`, `timezone`) VALUES
(1, '2014-06-28 08:41:37', NULL, 1, NULL, 'United Kingdom', 'UK', 'UK', 'GBP', 'BST');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_documents`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `fileName` varchar(45) NOT NULL,
  `contractorId` int(11) NOT NULL,
  `propertyId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `documentTypeId` int(5) NOT NULL,
  `functionalityId` int(11) DEFAULT NULL,
  `statusId` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_expertise`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_expertise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `functionalityId` varchar(45) NOT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `enabled` bit(1) DEFAULT b'1',
  `contractorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `tbl_perpetualrents_expertise`
--

INSERT INTO `tbl_perpetualrents_expertise` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `functionalityId`, `qualification`, `enabled`, `contractorId`) VALUES
(3, '2015-06-27 11:23:21', NULL, 2, NULL, '11', NULL, b'1', 2),
(4, '2015-06-27 11:23:21', NULL, 2, NULL, '12', NULL, b'1', 2),
(5, '2015-06-27 11:23:21', NULL, 2, NULL, '8', NULL, b'1', 2),
(6, '2015-06-27 11:23:21', NULL, 2, NULL, '10', NULL, b'1', 2),
(7, '2015-06-27 11:23:21', NULL, 2, NULL, '5', NULL, b'1', 2),
(8, '2015-06-27 11:23:21', NULL, 2, NULL, '13', NULL, b'1', 2),
(9, '2015-06-27 11:23:21', NULL, 2, NULL, '2', NULL, b'1', 2),
(10, '2015-06-27 11:23:21', NULL, 2, NULL, '1', NULL, b'1', 2),
(11, '2015-06-27 11:23:21', NULL, 2, NULL, '4', NULL, b'1', 2),
(12, '2015-06-27 11:23:21', NULL, 2, NULL, '14', NULL, b'1', 2),
(23, '2015-06-27 13:24:20', NULL, 1, NULL, '12', NULL, b'1', 1),
(24, '2015-06-27 13:24:20', NULL, 1, NULL, '8', NULL, b'1', 1),
(25, '2015-06-27 13:24:20', NULL, 1, NULL, '10', NULL, b'1', 1),
(26, '2015-06-27 13:24:20', NULL, 1, NULL, '2', NULL, b'1', 1),
(27, '2015-06-27 13:24:20', NULL, 1, NULL, '1', NULL, b'1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_file`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` int(11) DEFAULT NULL,
  `filePath` varchar(9999) NOT NULL,
  `fileName` mediumtext NOT NULL,
  `contentType` varchar(255) NOT NULL,
  `documentType` int(5) NOT NULL,
  `objectType` int(5) DEFAULT NULL,
  `objectId` int(11) NOT NULL,
  `size` int(45) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=454 ;

--
-- Dumping data for table `tbl_perpetualrents_file`
--

INSERT INTO `tbl_perpetualrents_file` (`id`, `createdOn`, `createdUserId`, `filePath`, `fileName`, `contentType`, `documentType`, `objectType`, `objectId`, `size`, `description`) VALUES
(1, '2015-06-15 07:23:56', 4, 'uploadFiles/2015/June/PRUKP60985/5-15-12-53-778-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 1, 41374, NULL),
(2, '2015-06-15 07:23:56', 4, 'uploadFiles/2015/June/PRUKP60985/5-15-12-53-781-maildocuments.odt', 'maildocuments.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 1, 58337, NULL),
(3, '2015-06-15 07:24:05', 4, 'uploadFiles/2015/June/PRUKP60985/5-15-12-54-40-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 1, 11239, NULL),
(4, '2015-06-15 07:24:05', 4, 'uploadFiles/2015/June/PRUKP60985/5-15-12-54-42-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 1, 9713, NULL),
(5, '2015-06-15 07:28:11', 4, 'uploadFiles/2015/June/PRUKP61084/5-15-12-58-265-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 2, 41374, NULL),
(6, '2015-06-15 07:28:22', 4, 'uploadFiles/2015/June/PRUKP61084/5-15-12-58-909-property.jpg', 'property.jpg', 'image/jpeg', 3, 0, 2, 931997, NULL),
(7, '2015-06-15 07:28:22', 4, 'uploadFiles/2015/June/PRUKP61084/5-15-12-58-912-pune-properties2.jpg', 'pune-properties2.jpg', 'image/jpeg', 3, 0, 2, 200908, NULL),
(8, '2015-06-15 07:30:29', 4, 'uploadFiles/2015/June/PRUKP61183/5-15-13-0-208-maildocuments.odt', 'maildocuments.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 3, 58337, NULL),
(9, '2015-06-15 07:30:29', 4, 'uploadFiles/2015/June/PRUKP61183/5-15-13-0-214-Untitled 4.odt', 'Untitled 4.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 3, 58534, NULL),
(10, '2015-06-15 07:30:39', 4, 'uploadFiles/2015/June/PRUKP61183/5-15-13-0-722-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 3, 9713, NULL),
(11, '2015-06-15 07:30:39', 4, 'uploadFiles/2015/June/PRUKP61183/5-15-13-0-725-pune-properties2.jpg', 'pune-properties2.jpg', 'image/jpeg', 3, 0, 3, 200908, NULL),
(12, '2015-06-15 08:19:37', 4, 'uploadFiles/2015/June/PRUKP61282/5-15-13-49-553-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 4, 41374, NULL),
(13, '2015-06-15 08:19:37', 4, 'uploadFiles/2015/June/PRUKP61282/5-15-13-49-556-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 4, 46528, NULL),
(14, '2015-06-15 08:19:45', 4, 'uploadFiles/2015/June/PRUKP61282/5-15-13-49-760-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 4, 11239, NULL),
(15, '2015-06-15 08:19:45', 4, 'uploadFiles/2015/June/PRUKP61282/5-15-13-49-762-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 4, 9713, NULL),
(16, '2015-06-15 08:38:45', 4, 'uploadFiles/2015/June/PRUKP61381/5-15-14-8-595-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 5, 41374, NULL),
(17, '2015-06-15 08:38:45', 4, 'uploadFiles/2015/June/PRUKP61381/5-15-14-8-599-mailpd.odt', 'mailpd.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 5, 59336, NULL),
(18, '2015-06-15 08:38:59', 4, 'uploadFiles/2015/June/PRUKP61381/5-15-14-8-832-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 5, 9713, NULL),
(19, '2015-06-15 08:38:59', 4, 'uploadFiles/2015/June/PRUKP61381/5-15-14-8-835-pune-properties2.jpg', 'pune-properties2.jpg', 'image/jpeg', 3, 0, 5, 200908, NULL),
(20, '2015-06-15 08:44:28', 4, 'uploadFiles/2015/June/PRUKP61480/5-15-14-14-812-mailpd.odt', 'mailpd.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 6, 59336, NULL),
(21, '2015-06-15 08:44:42', 4, 'uploadFiles/2015/June/PRUKP61480/5-15-14-14-746-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 6, 9713, NULL),
(22, '2015-06-15 08:44:42', 4, 'uploadFiles/2015/June/PRUKP61480/5-15-14-14-750-pune-properties2.jpg', 'pune-properties2.jpg', 'image/jpeg', 3, 0, 6, 200908, NULL),
(23, '2015-06-15 08:55:10', 4, 'uploadFiles/2015/June/PRUKP61579/5-15-14-25-824-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 7, 41374, NULL),
(24, '2015-06-15 08:55:18', 4, 'uploadFiles/2015/June/PRUKP61579/5-15-14-25-235-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 7, 11239, NULL),
(25, '2015-06-15 08:55:18', 4, 'uploadFiles/2015/June/PRUKP61579/5-15-14-25-238-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 7, 9713, NULL),
(26, '2015-06-15 09:04:16', 4, 'uploadFiles/2015/June/PRUKP61678/5-15-14-34-761-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 8, 41374, NULL),
(27, '2015-06-15 09:04:16', 4, 'uploadFiles/2015/June/PRUKP61678/5-15-14-34-765-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 8, 46528, NULL),
(28, '2015-06-15 09:04:26', 4, 'uploadFiles/2015/June/PRUKP61678/5-15-14-34-264-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(29, '2015-06-15 09:04:26', 4, 'uploadFiles/2015/June/PRUKP61678/5-15-14-34-267-pune-properties2.jpg', 'pune-properties2.jpg', 'image/jpeg', 3, 0, 8, 200908, NULL),
(30, '2015-06-15 12:46:06', 26, 'uploadFiles/2015/June/PRUKP62371/5-15-18-16-932-Desert.jpg', 'Desert.jpg', 'image/jpeg', 3, 0, 9, 845941, NULL),
(31, '2015-06-16 10:05:37', 4, 'uploadFiles/2015/June/PRUKP61678/5-16-15-35-458-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 8, 41374, NULL),
(32, '2015-06-16 10:49:17', 7, 'uploadFiles/2015/June/PRUKP62470/5-16-16-19-618-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 6, 7, 9713, NULL),
(33, '2015-06-16 11:04:05', 7, 'uploadFiles/2015/June/PRUKP62569/5-16-16-34-899-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 6, 8, 11239, NULL),
(34, '2015-06-16 12:43:07', 30, 'uploadFiles/2015/June/PRUKP62767/5-16-18-13-55-Jellyfish.jpg', 'Jellyfish.jpg', 'image/jpeg', 3, 0, 10, 775702, NULL),
(35, '2015-06-17 06:17:25', 1, 'uploadFiles/2015/June/PRUKP62371/5-17-11-47-347-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 9, 11239, NULL),
(36, '2015-06-17 06:17:50', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-11-47-513-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(37, '2015-06-17 06:17:58', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-11-47-530-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(38, '2015-06-17 06:18:13', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-11-48-92-property.jpg', 'property.jpg', 'image/jpeg', 3, 0, 8, 931997, NULL),
(39, '2015-06-17 09:04:07', 1, 'uploadFiles/2015/June/PRUKP61480/5-17-14-34-929-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 6, 46528, NULL),
(40, '2015-06-17 09:05:21', 1, 'uploadFiles/2015/June/PRUKP62371/5-17-14-35-931-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 41374, NULL),
(41, '2015-06-17 09:06:13', 1, 'uploadFiles/2015/June/PRUKP61480/5-17-14-36-144-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 6, 46528, NULL),
(42, '2015-06-17 09:47:40', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-15-17-733-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(43, '2015-06-17 09:47:51', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-15-17-319-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 8, 9713, NULL),
(44, '2015-06-17 09:49:18', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-15-19-673-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 8, 9713, NULL),
(45, '2015-06-17 10:10:55', 1, 'uploadFiles/2015/June/PRUKP61579/5-17-15-40-507-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 7, 11239, NULL),
(46, '2015-06-17 10:13:57', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-15-43-763-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(47, '2015-06-17 10:14:32', 1, 'uploadFiles/2015/June/PRUKP62767/5-17-15-44-566-pune-properties2.jpg', 'pune-properties2.jpg', 'image/jpeg', 3, 0, 10, 200908, NULL),
(48, '2015-06-17 10:29:19', 1, 'uploadFiles/2015/June/PRUKP62767/5-17-15-59-785-perpetual1.sql.tar.gz', 'perpetual1.sql.tar.gz', 'application/gzip', 3, 0, 10, 24113, NULL),
(49, '2015-06-17 10:30:36', 1, 'uploadFiles/2015/June/PRUKP62767/5-17-16-0-860-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 10, 16109, NULL),
(50, '2015-06-17 10:31:50', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-16-1-429-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 8, 16109, NULL),
(51, '2015-06-17 10:33:36', 1, 'uploadFiles/2015/June/PRUKP61579/5-17-16-3-904-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 7, 16109, NULL),
(52, '2015-06-17 10:34:00', 1, 'uploadFiles/2015/June/PRUKP61579/5-17-16-4-808-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 7, 16109, NULL),
(53, '2015-06-17 10:48:20', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-16-18-795-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 8, 16109, NULL),
(54, '2015-06-17 11:17:32', 1, 'uploadFiles/2015/June/PRUKP61480/5-17-16-47-855-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 6, 16109, NULL),
(55, '2015-06-17 11:20:53', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-16-50-964-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 8, 16109, NULL),
(56, '2015-06-17 11:21:56', 1, 'uploadFiles/2015/June/PRUKP61678/5-17-16-51-692-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 8, 16109, NULL),
(57, '2015-06-17 11:24:13', 1, 'uploadFiles/2015/June/PRUKP61579/5-17-16-54-372-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 7, 16109, NULL),
(58, '2015-06-19 05:19:30', 1, 'uploadFiles/2015/June/PRUKP61579/5-19-10-49-620-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 7, 16109, NULL),
(59, '2015-06-19 05:19:44', 1, 'uploadFiles/2015/June/PRUKP61579/5-19-10-49-108-article-0-024FC87000000578-445_468x394.jpg', 'article-0-024FC87000000578-445_468x394.jpg', 'image/jpeg', 3, 0, 7, 78101, NULL),
(60, '2015-06-19 05:21:30', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-10-51-421-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 9, 16109, NULL),
(61, '2015-06-19 05:35:38', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-11-5-303-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 8, 16109, NULL),
(62, '2015-06-19 05:36:27', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-11-6-105-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(63, '2015-06-19 05:36:39', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-11-6-394-123.html', '123.html', 'text/html', 3, 0, 8, 1768, NULL),
(64, '2015-06-19 05:37:02', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-11-7-351-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 8, 41374, NULL),
(65, '2015-06-19 05:37:16', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-11-7-31-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(66, '2015-06-19 05:37:25', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-11-7-565-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 8, 9713, NULL),
(67, '2015-06-19 05:45:47', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-11-15-844-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 8, 9713, NULL),
(68, '2015-06-19 05:49:06', 1, 'uploadFiles/2015/June/PRUKP61480/5-19-11-19-386-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 6, 11239, NULL),
(69, '2015-06-19 05:49:06', 1, 'uploadFiles/2015/June/PRUKP61480/5-19-11-19-388-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 6, 9713, NULL),
(70, '2015-06-19 06:00:07', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-30-477-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 46528, NULL),
(71, '2015-06-19 06:00:07', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-30-479-maildocuments.odt', 'maildocuments.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 58337, NULL),
(72, '2015-06-19 06:00:09', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-30-725-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 46528, NULL),
(73, '2015-06-19 06:00:09', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-30-726-maildocuments.odt', 'maildocuments.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 58337, NULL),
(74, '2015-06-19 06:00:09', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-30-949-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 46528, NULL),
(75, '2015-06-19 06:00:09', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-30-953-maildocuments.odt', 'maildocuments.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 58337, NULL),
(76, '2015-06-19 06:03:13', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-33-217-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 46528, NULL),
(77, '2015-06-19 06:03:13', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-33-219-maildocuments.odt', 'maildocuments.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 58337, NULL),
(78, '2015-06-19 06:13:26', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-11-43-851-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 10, 11239, NULL),
(79, '2015-06-19 06:13:26', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-11-43-859-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 10, 9713, NULL),
(80, '2015-06-19 06:16:28', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-46-192-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 9, 11239, NULL),
(81, '2015-06-19 06:16:28', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-46-194-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 9, 9713, NULL),
(82, '2015-06-19 06:16:29', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-46-493-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 9, 11239, NULL),
(83, '2015-06-19 06:16:29', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-46-494-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 9, 9713, NULL),
(84, '2015-06-19 06:16:29', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-46-730-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 9, 11239, NULL),
(85, '2015-06-19 06:16:29', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-11-46-731-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 9, 9713, NULL),
(86, '2015-06-19 06:16:58', 1, 'uploadFiles/2015/June/PRUKP61579/5-19-11-46-63-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 7, 11239, NULL),
(87, '2015-06-19 06:16:58', 1, 'uploadFiles/2015/June/PRUKP61579/5-19-11-46-64-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 7, 9713, NULL),
(88, '2015-06-19 06:17:02', 1, 'uploadFiles/2015/June/PRUKP61579/5-19-11-47-292-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 7, 11239, NULL),
(89, '2015-06-19 06:17:02', 1, 'uploadFiles/2015/June/PRUKP61579/5-19-11-47-293-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 7, 9713, NULL),
(90, '2015-06-19 06:21:12', 4, 'uploadFiles/2015/June/PRUKP62866/5-19-11-51-967-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 11, 41374, NULL),
(91, '2015-06-19 06:34:23', 4, 'uploadFiles/2015/June/PRUKP62866/5-19-12-4-977-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 11, 41374, NULL),
(93, '2015-06-19 06:34:53', 4, 'uploadFiles/2015/June/PRUKP62866/5-19-12-4-402-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 11, 9713, NULL),
(94, '2015-06-19 06:46:41', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-12-16-657-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(95, '2015-06-19 06:46:41', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-12-16-665-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 8, 9713, NULL),
(96, '2015-06-19 06:48:53', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-12-18-824-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 10, 11239, NULL),
(97, '2015-06-19 06:48:53', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-12-18-825-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 10, 9713, NULL),
(98, '2015-06-19 06:50:54', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-12-20-684-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 10, 11239, NULL),
(99, '2015-06-19 06:50:54', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-12-20-685-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 10, 9713, NULL),
(100, '2015-06-19 06:53:04', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-12-23-530-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 41374, NULL),
(101, '2015-06-19 06:53:04', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-12-23-532-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 9, 2071, NULL),
(102, '2015-06-19 06:53:06', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-12-23-143-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 41374, NULL),
(103, '2015-06-19 06:53:06', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-12-23-144-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 9, 2071, NULL),
(104, '2015-06-19 07:01:44', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-12-31-441-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 8, 46528, NULL),
(105, '2015-06-19 07:01:44', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-12-31-456-maildocuments.odt', 'maildocuments.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 8, 58337, NULL),
(106, '2015-06-19 07:07:02', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-12-37-669-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 9, 11239, NULL),
(107, '2015-06-19 07:07:02', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-12-37-670-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 9, 9713, NULL),
(108, '2015-06-19 07:10:53', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-12-40-545-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(109, '2015-06-19 07:10:53', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-12-40-548-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 8, 9713, NULL),
(110, '2015-06-19 07:11:44', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-12-41-640-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 10, 9713, NULL),
(111, '2015-06-19 07:16:08', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-12-46-77-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 10, 2071, NULL),
(112, '2015-06-19 07:20:12', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-12-50-959-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 8, 11239, NULL),
(113, '2015-06-19 07:20:12', 1, 'uploadFiles/2015/June/PRUKP61678/5-19-12-50-982-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 8, 9713, NULL),
(114, '2015-06-19 07:22:21', 4, 'uploadFiles/2015/June/PRUKP63064/5-19-12-52-299-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 12, 9713, NULL),
(115, '2015-06-19 07:23:30', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-12-53-749-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 10, 2071, NULL),
(116, '2015-06-19 07:23:30', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-12-53-752-googlemapdemo.html', 'googlemapdemo.html', 'text/html', 3, 0, 10, 2071, NULL),
(117, '2015-06-19 07:30:53', 4, 'uploadFiles/2015/June/PRUKP63163/5-19-13-0-793-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 13, 11239, NULL),
(118, '2015-06-19 07:33:36', 4, 'uploadFiles/2015/June/PRUKP63163/5-19-13-3-52-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 13, 11239, NULL),
(119, '2015-06-19 07:34:15', 1, 'uploadFiles/2015/June/PRUKP62866/5-19-13-4-246-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 11, 41374, NULL),
(120, '2015-06-19 07:34:15', 1, 'uploadFiles/2015/June/PRUKP62866/5-19-13-4-248-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 11, 2071, NULL),
(121, '2015-06-19 07:35:55', 1, 'uploadFiles/2015/June/PRUKP62371/5-19-13-5-859-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 9, 41374, NULL),
(123, '2015-06-19 07:40:28', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-13-10-174-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 10, 2071, NULL),
(124, '2015-06-19 07:43:50', 4, 'uploadFiles/2015/June/PRUKP63262/5-19-13-13-256-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 14, 46528, NULL),
(125, '2015-06-19 07:44:18', 4, 'uploadFiles/2015/June/PRUKP63262/5-19-13-14-301-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 14, 41374, NULL),
(126, '2015-06-19 07:44:41', 4, 'uploadFiles/2015/June/PRUKP63262/5-19-13-14-377-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 14, 41374, NULL),
(127, '2015-06-19 08:11:48', 1, 'uploadFiles/2015/June/PRUKP63163/5-19-13-41-973-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 13, 41374, NULL),
(128, '2015-06-19 08:11:48', 1, 'uploadFiles/2015/June/PRUKP63163/5-19-13-41-975-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 13, 2071, NULL),
(129, '2015-06-19 08:16:37', 1, 'uploadFiles/2015/June/PRUKP62866/5-19-13-46-326-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 11, 41374, NULL),
(130, '2015-06-19 08:16:37', 1, 'uploadFiles/2015/June/PRUKP62866/5-19-13-46-333-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 11, 2071, NULL),
(131, '2015-06-19 08:17:54', 4, 'uploadFiles/2015/June/PRUKP63361/5-19-13-47-981-googlemapdemo.html', 'googlemapdemo.html', 'text/html', 3, 0, 15, 2071, NULL),
(132, '2015-06-19 08:21:22', 4, 'uploadFiles/2015/June/PRUKP63361/5-19-13-51-946-googlemapdemo.html', 'googlemapdemo.html', 'text/html', 3, 0, 15, 2071, NULL),
(133, '2015-06-19 08:21:37', 4, 'uploadFiles/2015/June/PRUKP63361/5-19-13-51-941-googlemapdemo.html', 'googlemapdemo.html', 'text/html', 3, 0, 15, 2071, NULL),
(134, '2015-06-19 08:22:14', 4, 'uploadFiles/2015/June/PRUKP63361/5-19-13-52-2-googlemapdemo.html', 'googlemapdemo.html', 'text/html', 3, 0, 15, 2071, NULL),
(135, '2015-06-19 08:22:20', 4, 'uploadFiles/2015/June/PRUKP63361/5-19-13-52-644-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 15, 2071, NULL),
(136, '2015-06-19 08:22:45', 4, 'uploadFiles/2015/June/PRUKP63361/5-19-13-52-527-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 15, 2071, NULL),
(137, '2015-06-19 08:26:00', 1, 'uploadFiles/2015/June/PRUKP63064/5-19-13-56-723-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 12, 11239, NULL),
(138, '2015-06-19 08:29:55', 1, 'uploadFiles/2015/June/PRUKP62767/5-19-13-59-415-googlemapdemo.html', 'googlemapdemo.html', 'text/html', 3, 0, 10, 2071, NULL),
(139, '2015-06-19 08:34:25', 1, 'uploadFiles/2015/June/PRUKP63064/5-19-14-4-997-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 12, 9713, NULL),
(140, '2015-06-19 08:36:10', 1, 'uploadFiles/2015/June/PRUKP62866/5-19-14-6-939-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 11, 11239, NULL),
(146, '2015-06-19 08:57:33', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-27-749-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 41374, NULL),
(147, '2015-06-19 08:57:33', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-27-754-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 16, 2071, NULL),
(148, '2015-06-19 08:57:58', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-27-295-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 41374, NULL),
(149, '2015-06-19 08:57:58', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-27-297-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 16, 2071, NULL),
(150, '2015-06-19 08:58:12', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-28-34-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 41374, NULL),
(151, '2015-06-19 08:58:12', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-28-35-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 16, 2071, NULL),
(152, '2015-06-19 08:58:36', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-28-496-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 41374, NULL),
(153, '2015-06-19 08:58:36', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-28-497-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 16, 2071, NULL),
(154, '2015-06-19 08:58:50', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-28-498-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 41374, NULL),
(155, '2015-06-19 08:58:50', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-28-500-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 16, 2071, NULL),
(156, '2015-06-19 08:59:25', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-29-489-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 41374, NULL),
(157, '2015-06-19 08:59:25', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-29-493-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 16, 2071, NULL),
(158, '2015-06-19 08:59:33', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-29-967-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 41374, NULL),
(159, '2015-06-19 08:59:33', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-29-969-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 16, 2071, NULL),
(160, '2015-06-19 08:59:44', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-29-511-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 41374, NULL),
(161, '2015-06-19 08:59:44', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-29-512-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 16, 2071, NULL),
(162, '2015-06-19 08:59:53', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-29-69-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 41374, NULL),
(163, '2015-06-19 08:59:53', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-29-71-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 16, 2071, NULL),
(164, '2015-06-19 09:02:20', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-32-17-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 46528, NULL),
(165, '2015-06-19 09:02:24', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-32-373-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 46528, NULL),
(166, '2015-06-19 09:03:45', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-33-31-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 46528, NULL),
(167, '2015-06-19 09:04:01', 4, 'uploadFiles/2015/June/PRUKP63460/5-19-14-34-127-logijmn.odt', 'logijmn.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 16, 46528, NULL),
(173, '2015-06-19 09:22:23', 4, 'uploadFiles/2015/June/PRUKP63658/5-19-14-52-620-maildocuments.odt', 'maildocuments.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 18, 58337, NULL),
(175, '2015-06-19 13:00:16', 4, 'uploadFiles/2015/June/PRUKP63757/5-19-18-30-681-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 19, 2071, NULL),
(176, '2015-06-19 13:06:59', 1, 'uploadFiles/2015/June/PRUKP63262/5-19-18-36-563-123.html', '123.html', 'text/html', 3, 0, 14, 1768, NULL),
(178, '2015-06-19 13:27:46', 1, 'uploadFiles/2015/June/PRUKP63361/5-19-18-57-694-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 15, 2071, NULL),
(181, '2015-06-22 05:00:35', 4, 'uploadFiles/2015/June/PRUKP63856/5-22-10-30-632-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 20, 11239, NULL),
(182, '2015-06-22 05:00:35', 4, 'uploadFiles/2015/June/PRUKP63856/5-22-10-30-634-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 20, 9713, NULL),
(183, '2015-06-22 05:02:21', 4, 'uploadFiles/2015/June/PRUKP63856/5-22-10-32-541-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 20, 11239, NULL),
(184, '2015-06-22 05:02:21', 4, 'uploadFiles/2015/June/PRUKP63856/5-22-10-32-543-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 20, 9713, NULL),
(188, '2015-06-22 05:03:42', 4, 'uploadFiles/2015/June/PRUKP63856/5-22-10-33-845-googlemapdemo.html', 'googlemapdemo.html', 'text/html', 3, 0, 20, 2071, NULL),
(189, '2015-06-22 05:03:42', 4, 'uploadFiles/2015/June/PRUKP63856/5-22-10-33-846-maildocuments.odt', 'maildocuments.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 20, 58337, NULL),
(219, '2015-06-22 10:31:18', 1, 'uploadFiles/2015/June/PRUKP63757/5-22-16-1-395-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 19, 41374, NULL),
(220, '2015-06-22 10:31:18', 1, 'uploadFiles/2015/June/PRUKP63757/5-22-16-1-407-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 19, 2071, NULL),
(221, '2015-06-22 10:31:57', 1, 'uploadFiles/2015/June/PRUKP63757/5-22-16-1-963-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 19, 9713, NULL),
(226, '2015-06-22 11:15:32', 1, 'uploadFiles/2015/June/PRUKP63757/5-22-16-45-110-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 19, 2071, NULL),
(228, '2015-06-22 12:17:01', 1, 'uploadFiles/2015/June/PRUKP63757/5-22-17-47-490-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 19, 41374, 'HELLO HI '),
(229, '2015-06-22 12:17:01', 1, 'uploadFiles/2015/June/PRUKP63757/5-22-17-47-497-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 19, 2071, 'HELLO HI '),
(230, '2015-06-22 12:18:28', 1, 'uploadFiles/2015/June/PRUKP63757/5-22-17-48-999-123.html', '123.html', 'text/html', 3, 0, 19, 1768, 'FILE Uploaded'),
(231, '2015-06-23 04:46:50', 1, 'uploadFiles/2015/June/PRUKP63757/5-23-10-16-526-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 19, 9713, 'HI, I am Sunayana'),
(232, '2015-06-23 12:42:21', 4, 'uploadFiles/2015/June/PRUKP65737/5-23-18-12-169-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 34, 11239, NULL),
(233, '2015-06-23 12:42:28', 4, 'uploadFiles/2015/June/PRUKP65737/5-23-18-12-901-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 34, 11239, NULL),
(234, '2015-06-23 12:42:28', 4, 'uploadFiles/2015/June/PRUKP65737/5-23-18-12-904-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 34, 9713, NULL),
(235, '2015-06-24 05:55:07', 26, 'uploadFiles/2015/June/PRUKP62371/5-24-11-25-804-lesson2.pdf', 'lesson2.pdf', 'application/pdf', 3, 0, 9, 1068605, ''),
(236, '2015-06-24 05:56:33', 1, 'uploadFiles/2015/June/PRUKP62371/5-24-11-26-562-lesson2.pdf', 'lesson2.pdf', 'application/pdf', 3, 0, 9, 1068605, ''),
(237, '2015-06-24 06:01:15', 26, 'uploadFiles/2015/June/PRUKP62371/5-24-11-31-107-acro6_pg_ue.pdf', 'acro6_pg_ue.pdf', 'application/pdf', 3, 0, 9, 4487447, ''),
(238, '2015-06-24 06:01:52', 1, 'uploadFiles/2015/June/PRUKP62371/5-24-11-31-384-acro6_pg_ue.pdf', 'acro6_pg_ue.pdf', 'application/pdf', 3, 0, 9, 4487447, ''),
(239, '2015-06-24 11:46:40', 4, 'uploadFiles/2015/June/PRUKP67321/5-24-17-16-660-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 50, 11239, NULL),
(240, '2015-06-24 12:01:39', 4, 'uploadFiles/2015/June/PRUKP67420/5-24-17-31-698-changesdoc.odt', 'changesdoc.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 51, 41374, NULL),
(241, '2015-06-24 12:01:39', 4, 'uploadFiles/2015/June/PRUKP67420/5-24-17-31-703-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 51, 2071, NULL),
(242, '2015-06-24 12:01:49', 4, 'uploadFiles/2015/June/PRUKP67420/5-24-17-31-556-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 51, 11239, NULL),
(243, '2015-06-24 12:01:49', 4, 'uploadFiles/2015/June/PRUKP67420/5-24-17-31-557-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 51, 9713, NULL),
(244, '2015-06-25 05:45:21', 4, 'uploadFiles/2015/June/PRUKP67618/5-25-11-15-223-flats_1_tall_2.jpg', 'flats_1_tall_2.jpg', 'image/jpeg', 3, 0, 53, 16109, NULL),
(245, '2015-06-25 05:48:55', 4, 'uploadFiles/2015/June/PRUKP67717/5-25-11-18-682-map.html', 'map.html', 'text/html', 3, 0, 54, 449, NULL),
(246, '2015-06-25 05:49:03', 4, 'uploadFiles/2015/June/PRUKP67717/5-25-11-19-836-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 54, 11239, NULL),
(247, '2015-06-25 05:49:03', 4, 'uploadFiles/2015/June/PRUKP67717/5-25-11-19-838-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 54, 9713, NULL),
(248, '2015-06-25 05:49:48', 4, 'uploadFiles/2015/June/PRUKP67816/5-25-11-19-413-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 55, 9713, NULL),
(249, '2015-06-25 06:40:52', 4, 'uploadFiles/2015/June/PRUKP67915/5-25-12-10-760-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 56, 11239, NULL),
(250, '2015-06-25 06:40:52', 4, 'uploadFiles/2015/June/PRUKP67915/5-25-12-10-771-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 56, 9713, NULL),
(251, '2015-06-25 07:03:21', 4, 'uploadFiles/2015/June/PRUKP68113/5-25-12-33-830-map.html', 'map.html', 'text/html', 3, 0, 58, 449, NULL),
(252, '2015-06-25 07:11:27', 4, 'uploadFiles/2015/June/PRUKP68212/5-25-12-41-933-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 59, 9713, NULL),
(253, '2015-06-25 07:32:07', 4, 'uploadFiles/2015/June/PRUKP68707/5-25-13-2-11-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 64, 11239, NULL),
(254, '2015-06-25 07:35:23', 4, 'uploadFiles/2015/June/PRUKP68806/5-25-13-5-939-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 65, 9713, NULL),
(255, '2015-06-25 08:50:14', 4, 'uploadFiles/2015/June/PRUKP69202/5-25-14-20-142-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 69, 11239, NULL),
(256, '2015-06-25 08:53:32', 4, 'uploadFiles/2015/June/PRUKP69301/5-25-14-23-86-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 70, 9713, NULL),
(257, '2015-06-25 10:21:27', 4, 'uploadFiles/2015/June/PRUKP69499/5-25-15-51-952-mapintegrate.odt', 'mapintegrate.odt', 'application/vnd.oasis.opendocument.text', 3, 0, 72, 40699, NULL),
(258, '2015-06-25 10:33:57', 4, 'uploadFiles/2015/June/PRUKP69697/5-25-16-3-6-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 74, 9713, NULL),
(259, '2015-06-25 10:41:46', 4, 'uploadFiles/2015/June/PRUKP69796/5-25-16-11-43-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 75, 11239, NULL),
(260, '2015-06-25 11:07:30', 1, 'uploadFiles/2015/June/PRUKP69796/5-25-16-37-455-googlemap.jsp', 'googlemap.jsp', 'application/octet-stream', 3, 0, 75, 2071, ''),
(261, '2015-06-25 11:07:30', 1, 'uploadFiles/2015/June/PRUKP69796/5-25-16-37-467-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 75, 11239, ''),
(262, '2015-06-25 11:07:55', 1, 'uploadFiles/2015/June/PRUKP69994/5-25-16-37-831-images.jpeg', 'images.jpeg', 'image/jpeg', 3, 0, 77, 11239, ''),
(263, '2015-06-25 11:07:55', 1, 'uploadFiles/2015/June/PRUKP69994/5-25-16-37-833-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 77, 9713, ''),
(264, '2015-06-25 11:07:55', 1, 'uploadFiles/2015/June/PRUKP69994/5-25-16-37-835-map.html', 'map.html', 'text/html', 3, 0, 77, 449, ''),
(265, '2015-06-25 11:26:26', 26, 'uploadFiles/2015/June/PRUKP70093/5-25-16-56-636-images1.jpeg', 'images1.jpeg', 'image/jpeg', 3, 0, 78, 9713, NULL),
(266, '2015-06-26 04:40:06', 1, 'uploadFiles/2015/June/PRUKP69895/5-26-10-10-250-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 76, 64402, NULL),
(267, '2015-06-26 04:41:13', 1, 'uploadFiles/2015/June/PRUKP60985/5-26-10-11-912-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 1, 64402, NULL),
(273, '2015-06-26 04:49:36', 1, 'uploadFiles/2015/June/PRUKP69895/5-26-10-19-931-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 76, 6379, NULL),
(274, '2015-06-26 09:49:05', 1, 'uploadFiles/2015/June/PRUKP70192/5-26-15-19-412-acro6_pg_ue(1).pdf', 'acro6_pg_ue(1).pdf', 'application/pdf', 3, 0, 79, 4487447, NULL),
(275, '2015-06-26 09:49:11', 1, 'uploadFiles/2015/June/PRUKP70192/5-26-15-19-462-acro6_pg_ue(1).pdf', 'acro6_pg_ue(1).pdf', 'application/pdf', 3, 0, 79, 4487447, NULL),
(276, '2015-06-26 09:49:12', 1, 'uploadFiles/2015/June/PRUKP70192/5-26-15-19-506-acro6_pg_ue(1).pdf', 'acro6_pg_ue(1).pdf', 'application/pdf', 3, 0, 79, 4487447, NULL),
(277, '2015-06-26 09:49:13', 1, 'uploadFiles/2015/June/PRUKP70192/5-26-15-19-647-acro6_pg_ue(1).pdf', 'acro6_pg_ue(1).pdf', 'application/pdf', 3, 0, 79, 4487447, NULL),
(291, '2015-06-27 06:34:39', 1, 'uploadFiles/2015/June/PRUKP70489/5-27-12-4-488-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 82, 64402, NULL),
(296, '2015-06-27 08:23:28', 1, 'uploadFiles/2015/June/PRUKP70489/5-27-13-53-417-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 82, 64402, NULL),
(331, '2015-06-27 09:10:25', 1, 'uploadFiles/bank1.pdf', 'bank1.pdf', 'application/pdf', 4, 0, 0, 47389, NULL),
(333, '2015-06-27 09:10:42', 1, 'uploadFiles/goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 4, 0, 0, 6379, NULL),
(335, '2015-06-27 09:34:04', 1, 'uploadFiles/bank1.pdf', 'bank1.pdf', 'application/pdf', 4, 0, 0, 47389, NULL),
(337, '2015-06-27 09:35:15', 1, 'uploadFiles/FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 4, 0, 0, 64402, NULL),
(348, '2015-06-27 09:51:05', 1, 'uploadFiles/goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 4, 0, 0, 6379, NULL),
(352, '2015-06-27 09:53:41', 1, 'uploadFiles/FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 4, 0, 0, 64402, NULL),
(354, '2015-06-27 09:54:01', 1, 'uploadFiles/goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 4, 0, 0, 6379, NULL),
(363, '2015-06-27 09:55:41', 1, 'uploadFiles/FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 4, 0, 0, 64402, NULL),
(367, '2015-06-27 10:02:39', 1, 'uploadFiles/goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 4, 0, 0, 6379, NULL),
(368, '2015-06-27 10:12:33', 1, 'uploadFiles/11.png', '11.png', 'image/png', 4, 0, 0, 335033, NULL),
(369, '2015-06-27 10:12:38', 1, 'uploadFiles/22.png', '22.png', 'image/png', 4, 0, 0, 406580, NULL),
(371, '2015-06-27 12:40:55', 1, 'uploadFiles/11.png', '11.png', 'image/png', 4, 0, 0, 335033, NULL),
(372, '2015-06-27 12:40:59', 1, 'uploadFiles/22.png', '22.png', 'image/png', 4, 0, 0, 406580, NULL),
(373, '2015-06-27 12:41:04', 1, 'uploadFiles/111.png', '111.png', 'image/png', 4, 0, 0, 345070, NULL),
(375, '2015-06-27 12:41:26', 1, 'uploadFiles/1509786.jpg', '1509786.jpg', 'image/jpeg', 4, 0, 0, 22020, NULL),
(381, '2015-06-29 11:10:40', 4, 'uploadFiles/2015/June/PRUKP70489/5-29-16-40-746-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 82, 64402, NULL),
(382, '2015-06-29 11:10:40', 4, 'uploadFiles/2015/June/PRUKP70489/5-29-16-40-754-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 82, 6379, NULL),
(383, '2015-06-29 11:40:39', 4, 'uploadFiles/2015/June/PRUKP70489/5-29-17-10-640-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 82, 64402, NULL),
(384, '2015-06-29 11:40:39', 4, 'uploadFiles/2015/June/PRUKP70489/5-29-17-10-668-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 82, 6379, NULL),
(385, '2015-06-29 12:31:26', 4, 'uploadFiles/2015/June/PRUKP70489/5-29-18-1-50-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 82, 64402, NULL),
(386, '2015-06-29 12:40:49', 4, 'uploadFiles/2015/June/PRUKP70489/5-29-18-10-919-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 82, 64402, NULL),
(388, '2015-06-29 13:13:26', 1, 'uploadFiles/2015/June/PRUKP70291/5-29-18-43-720-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 80, 64402, NULL),
(389, '2015-06-29 13:13:26', 1, 'uploadFiles/2015/June/PRUKP70291/5-29-18-43-730-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 80, 6379, NULL),
(390, '2015-06-29 13:18:43', 1, 'uploadFiles/2015/June/PRUKP70588/5-29-18-48-245-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 83, 64402, NULL),
(391, '2015-06-29 13:18:43', 1, 'uploadFiles/2015/June/PRUKP70588/5-29-18-48-267-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 83, 6379, NULL),
(393, '2015-06-29 13:28:10', 1, 'uploadFiles/2015/June/PRUKP70588/5-29-18-58-730-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 83, 6379, NULL),
(394, '2015-06-29 13:29:20', 1, 'uploadFiles/2015/June/PRUKP70588/5-29-18-59-721-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 83, 6379, NULL),
(395, '2015-06-29 13:31:17', 1, 'uploadFiles/2015/June/PRUKP70588/5-29-19-1-256-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 83, 6379, NULL),
(396, '2015-06-29 13:35:33', 1, 'uploadFiles/2015/June/PRUKP70489/5-29-19-5-738-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 82, 6379, NULL),
(397, '2015-06-29 13:42:25', 1, 'uploadFiles/2015/June/PRUKP70588/5-29-19-12-156-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 83, 64402, NULL),
(398, '2015-06-29 13:42:25', 1, 'uploadFiles/2015/June/PRUKP70588/5-29-19-12-163-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 83, 6379, NULL),
(399, '2015-06-29 13:42:25', 1, 'uploadFiles/2015/June/PRUKP70588/5-29-19-12-164-Screenshot from 2015-05-26 19:58:27.png', 'Screenshot from 2015-05-26 19:58:27.png', 'image/png', 3, 0, 83, 619683, NULL),
(400, '2015-06-29 14:08:21', 26, 'uploadFiles/2015/June/PRUKP70192/5-29-19-38-961-11 (1).png', '11 (1).png', 'image/png', 3, 0, 79, 335033, NULL),
(404, '2015-06-29 14:09:16', 26, 'uploadFiles/2015/June/PRUKP70192/5-29-19-39-328-Penguins.jpg', 'Penguins.jpg', 'image/jpeg', 3, 0, 79, 777835, NULL),
(405, '2015-06-30 08:53:46', 4, 'uploadFiles/2015/June/PRUKP70588/5-30-14-23-660-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 83, 64402, NULL),
(407, '2015-06-30 09:04:58', 4, 'uploadFiles/2015/June/PRUKP70885/5-30-14-34-456-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 84, 64402, NULL),
(408, '2015-06-30 09:04:58', 4, 'uploadFiles/2015/June/PRUKP70885/5-30-14-34-481-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 84, 6379, NULL),
(409, '2015-06-30 12:58:05', 1, 'uploadFiles/2015/June/PRUKP70885/5-30-18-28-408-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 84, 64402, NULL),
(410, '2015-06-30 12:58:05', 1, 'uploadFiles/2015/June/PRUKP70885/5-30-18-28-436-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 84, 6379, NULL),
(411, '2015-07-01 03:19:10', 4, 'uploadFiles/2015/July/PRUKP69004/6-1-8-49-687-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 67, 64402, NULL),
(412, '2015-07-01 03:19:10', 4, 'uploadFiles/2015/July/PRUKP69004/6-1-8-49-954-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 67, 6379, NULL),
(414, '2015-07-01 09:27:59', 4, 'uploadFiles/2015/July/PRUKP69103/6-1-14-57-92-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 68, 64402, NULL),
(415, '2015-07-01 09:27:59', 4, 'uploadFiles/2015/July/PRUKP69103/6-1-14-57-109-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 68, 6379, NULL),
(416, '2015-07-01 09:31:38', 4, 'uploadFiles/2015/July/PRUKP70588/6-1-15-1-446-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 83, 64402, NULL),
(417, '2015-07-01 09:31:38', 4, 'uploadFiles/2015/July/PRUKP70588/6-1-15-1-461-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 83, 6379, NULL),
(418, '2015-07-01 09:40:06', 4, 'uploadFiles/2015/July/PRUKP70984/6-1-15-10-615-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 85, 64402, NULL),
(419, '2015-07-01 09:40:06', 4, 'uploadFiles/2015/July/PRUKP70984/6-1-15-10-637-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 85, 6379, NULL),
(420, '2015-07-01 09:44:47', 4, 'uploadFiles/2015/July/PRUKP70885/6-1-15-14-978-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 84, 64402, NULL),
(421, '2015-07-01 09:44:47', 4, 'uploadFiles/2015/July/PRUKP70885/6-1-15-14-996-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 84, 6379, NULL),
(422, '2015-07-01 09:46:49', 4, 'uploadFiles/2015/July/PRUKP70885/6-1-15-16-871-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 84, 6379, NULL),
(423, '2015-07-01 10:02:03', 4, 'uploadFiles/2015/July/PRUKP70390/6-1-15-32-975-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 81, 64402, NULL),
(424, '2015-07-01 10:02:04', 4, 'uploadFiles/2015/July/PRUKP70390/6-1-15-32-2-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 81, 6379, NULL),
(425, '2015-07-01 11:35:08', 1, 'uploadFiles/2015/July/PRUKP70588/6-1-17-5-832-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 83, 64402, NULL),
(426, '2015-07-01 11:35:08', 1, 'uploadFiles/2015/July/PRUKP70588/6-1-17-5-846-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 83, 6379, NULL),
(427, '2015-07-01 11:38:27', 1, 'uploadFiles/2015/July/PRUKP69499/6-1-17-8-885-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 72, 6379, NULL),
(428, '2015-07-01 11:45:46', 1, 'uploadFiles/2015/July/PRUKP69499/6-1-17-15-654-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 72, 6379, NULL),
(429, '2015-07-01 11:46:12', 1, 'uploadFiles/2015/July/PRUKP69499/6-1-17-16-4-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 72, 6379, NULL),
(430, '2015-07-01 11:52:39', 1, 'uploadFiles/2015/July/PRUKP66430/6-1-17-22-925-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 41, 64402, NULL),
(431, '2015-07-01 11:52:39', 1, 'uploadFiles/2015/July/PRUKP66430/6-1-17-22-927-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 41, 6379, NULL),
(432, '2015-07-01 12:06:21', 1, 'uploadFiles/2015/July/PRUKP68014/6-1-17-36-273-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 57, 64402, NULL),
(433, '2015-07-01 12:06:21', 1, 'uploadFiles/2015/July/PRUKP68014/6-1-17-36-295-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 57, 6379, NULL),
(434, '2015-07-01 12:15:24', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-17-45-149-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 85, 64402, NULL),
(435, '2015-07-01 12:15:24', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-17-45-162-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 85, 6379, NULL),
(437, '2015-07-01 12:17:54', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-17-47-706-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 85, 6379, NULL),
(438, '2015-07-01 12:18:56', 1, 'uploadFiles/2015/July/PRUKP68113/6-1-17-48-900-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 58, 64402, NULL),
(439, '2015-07-01 12:18:56', 1, 'uploadFiles/2015/July/PRUKP68113/6-1-17-48-904-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 58, 6379, NULL),
(440, '2015-07-01 12:36:57', 4, 'uploadFiles/2015/July/PRUKP70984/6-1-18-6-993-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 85, 6379, NULL),
(441, '2015-07-01 12:39:25', 4, 'uploadFiles/2015/July/PRUKP70885/6-1-18-9-437-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 84, 6379, NULL),
(442, '2015-07-01 13:18:33', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-18-48-126-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 85, 64402, NULL),
(443, '2015-07-01 13:18:33', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-18-48-135-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 85, 6379, NULL),
(444, '2015-07-01 13:18:50', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-18-48-32-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 85, 64402, NULL),
(445, '2015-07-01 13:18:50', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-18-48-34-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 85, 6379, NULL),
(446, '2015-07-01 13:18:50', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-18-48-36-learnPic.jpg', 'learnPic.jpg', 'image/jpeg', 3, 0, 85, 53651, NULL),
(447, '2015-07-01 13:18:50', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-18-48-38-Screenshot from 2015-05-26 19:58:27.png', 'Screenshot from 2015-05-26 19:58:27.png', 'image/png', 3, 0, 85, 619683, NULL),
(452, '2015-07-01 15:01:22', 1, 'uploadFiles/2015/July/PRUKP70984/6-1-20-31-144-goodAfter.jpeg', 'goodAfter.jpeg', 'image/jpeg', 3, 0, 85, 6379, NULL),
(453, '2015-07-02 07:08:58', 1, 'uploadFiles/2015/July/PRUKP70984/6-2-12-38-165-FOOTBALL.jpg', 'FOOTBALL.jpg', 'image/jpeg', 3, 0, 85, 64402, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_functionalitycostmatrix`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_functionalitycostmatrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functionalityId` int(11) NOT NULL,
  `callOutMonToFri` varchar(255) NOT NULL,
  `callOutWeekends` varchar(255) NOT NULL,
  `hourlyRate` varchar(255) NOT NULL,
  `hourlyRateWeekends` varchar(255) DEFAULT NULL,
  `objectId` int(11) NOT NULL,
  `contractorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_perpetualrents_functionalitycostmatrix`
--

INSERT INTO `tbl_perpetualrents_functionalitycostmatrix` (`id`, `functionalityId`, `callOutMonToFri`, `callOutWeekends`, `hourlyRate`, `hourlyRateWeekends`, `objectId`, `contractorId`) VALUES
(1, 10, '224', '23424', '353', '523523', 1, 1),
(2, 8, 'djj', 'sjfj', 'sfj', 'sj', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_identitygenerator`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_identitygenerator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `objective` varchar(45) NOT NULL,
  `prefix` varchar(45) NOT NULL,
  `identityNumber` varchar(45) NOT NULL,
  `length` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objective` (`objective`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_perpetualrents_identitygenerator`
--

INSERT INTO `tbl_perpetualrents_identitygenerator` (`id`, `start`, `end`, `objective`, `prefix`, `identityNumber`, `length`) VALUES
(1, 0, 9999999, 'LandLord', 'PRUKL', '223264', 5),
(2, 0, 9999999, 'Contractor', 'PRUKC', '17821', 5),
(3, 0, 9999999, 'Property', 'PRUKP', '60886', 5),
(4, 0, 9999999, 'Pmc', 'PRUKPMC', '11088', 5),
(5, 0, 9999999, 'Admin', 'PRUKAD', '5050', 5),
(6, 0, 9999999, 'Property Developer', 'PRUKPD', '30426', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_landlord`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_landlord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `uniqueReference` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `primaryEmailId` varchar(45) NOT NULL,
  `secondaryEmailId` varchar(45) DEFAULT NULL,
  `primaryPhoneNumber` varchar(45) NOT NULL,
  `secondaryPhoneNumber` varchar(45) DEFAULT NULL,
  `enable` bit(1) NOT NULL DEFAULT b'1',
  `userLoginId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueReference` (`uniqueReference`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_perpetualrents_landlord`
--

INSERT INTO `tbl_perpetualrents_landlord` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `uniqueReference`, `firstName`, `lastName`, `primaryEmailId`, `secondaryEmailId`, `primaryPhoneNumber`, `secondaryPhoneNumber`, `enable`, `userLoginId`) VALUES
(1, '2015-06-15 09:25:31', NULL, NULL, NULL, 'PRUKL232669', 'sunayanaa', 'kumari', 'rohit@perceptive-solutions.com', 'fakfkakk', '3838839393', '39393939393', b'1', 7),
(2, '2015-06-16 11:14:28', NULL, NULL, NULL, 'PRUKL232768', 'pprkl', 'faskk', 'afja@perceptive-solutions.com', 'afafj', '49949494949', '49499494949', b'1', 27),
(3, '2015-06-16 11:18:36', NULL, NULL, NULL, 'PRUKL232867', 'sgs', 'af', 'af@gmail.com', 'afjaj', '3939393993', '9494949499', b'1', 28),
(4, '2015-06-16 11:21:35', NULL, NULL, NULL, 'PRUKL232966', 'ppeoo', 'afkakk', 'rohit@perceptive-solutions.com', 'sjfjj', '3838939939', NULL, b'1', 29),
(5, '2015-06-27 12:37:33', NULL, NULL, NULL, 'PRUKL233065', 'Gopal', 'kumar', 'tarun123@perceptive-solutions.com', 'afaaj', 'i9494949499', '4953959359', b'1', 31),
(6, '2015-06-27 12:43:47', NULL, NULL, NULL, 'PRUKL233164', 'roh', 'ikafk', 'chitandhingra3@gmail.com', 'afjkk', '49494949948', '494949949949', b'1', 32),
(7, '2015-06-27 13:01:05', NULL, NULL, NULL, 'PRUKL233263', 'fkk', 'afkk', 'tarun111@perceptive-solutions.com', 'afku', 'tyfg@hftf.y', 'asdjadj', b'1', 33),
(8, '2015-06-27 13:06:37', NULL, NULL, NULL, 'PRUKL233362', 'sfjj', 'aFJ', 'tarun@perceptive-solutions.com', 'afjj', '3939393939', '393939393993', b'1', 34);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_lead`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(225) NOT NULL,
  `message` varchar(9999) NOT NULL,
  `contactNumber` varchar(15) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_mail`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `mailBody` longtext NOT NULL,
  `mailFrom` varchar(100) NOT NULL,
  `mailTo` varchar(100) NOT NULL,
  `attachmentCount` int(5) NOT NULL,
  `mailFlowType` int(4) NOT NULL,
  `mailEventType` int(4) NOT NULL,
  `mailEventActor` int(4) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mailOrigin` varchar(100) NOT NULL,
  `conversationId` int(11) NOT NULL,
  `mailMessageId` varchar(50) DEFAULT NULL,
  `mailMessageReference` varchar(255) DEFAULT NULL,
  `receivedOn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_perpetualrents_mail`
--

INSERT INTO `tbl_perpetualrents_mail` (`id`, `subject`, `mailBody`, `mailFrom`, `mailTo`, `attachmentCount`, `mailFlowType`, `mailEventType`, `mailEventActor`, `createdOn`, `mailOrigin`, `conversationId`, `mailMessageId`, `mailMessageReference`, `receivedOn`) VALUES
(2, 'Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)', '<html><body><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000"><div>Yes i am very much interested.....<br></div><div><br></div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 6:56:17 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div>\r\n\r\n\r\n    \r\n        \r\n        \r\n    \r\n    \r\n            \r\n        <p>Hello ,</p>\r\n\r\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>201021</span></strong> for <strong><span></span> </strong>.</p>\r\n\r\n		<p>Please send me the following details filled :</p>\r\n		\r\n		<p>Job''s Description : <strong><span>Description by landlord</span></strong> </p> \r\n\r\n		<p>Time to complete :</p>\r\n\r\n		<p>Amount:</p>\r\n		\r\n		<p>Please reply back if you need any more information regarding this.</p>\r\n\r\n		<p>Thanks</p>\r\n\r\n		<p><span>Admin</span></p>\r\n\r\n		<p>&nbsp;</p>\r\n       			     \r\n    \r\n    \r\n\r\n</div><div><br></div></div></body></html>', 'rohit@perceptive-solutions.com', 'tarun@perceptive-solutions.com', 0, 2, 6, 2, '2015-06-27 15:07:32', 'perpetual.rents@gmail.com', 11, NULL, NULL, NULL),
(3, 'Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)', '<html><body><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000"><div><br></div><div>ok then how can we proceed further call me&nbsp;</div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style="color: #000; font-weight: normal; font-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 7:42:16 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000" data-mce-style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000;"><div>Yes i am very much interested.....<br></div><div><br></div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style="color: #000; font-weight: normal; font-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 6:56:17 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><p>Hello ,</p><p>I am very much interesting in to provide you a work on Property situated in <strong><span>201021</span></strong> for <strong><span></span> </strong>.</p><p>Please send me the following details filled :</p><p>Job''s Description : <strong><span>Description by landlord</span></strong></p><p>Time to complete :</p><p>Amount:</p><p>Please reply back if you need any more information regarding this.</p><p>Thanks</p><p><span>Admin</span></p><p>&nbsp;</p></div><div><br></div></div></div><div><br></div></div></body></html>', 'tarun@perceptive-solutions.com', 'rohit@perceptive-solutions.com', 0, 2, 6, 1, '2015-06-27 15:10:13', 'perpetual.rents@gmail.com', 11, NULL, NULL, NULL),
(4, 'Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)', '<html><body><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000"><div>Yes take my number 009299289222<br>call me on this....<br></div><div><br></div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style="color: #000; font-weight: normal; font-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 7:44:19 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000" data-mce-style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000;"><div><br></div><div>ok then how can we proceed further call me&nbsp;</div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style="color: #000; font-weight: normal; font-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 7:42:16 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000" data-mce-style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000;"><div>Yes i am very much interested.....<br></div><div><br></div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style="color: #000; font-weight: normal; font-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 6:56:17 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><p>Hello ,</p><p>I am very much interesting in to provide you a work on Property situated in <strong><span>201021</span></strong> for <strong><span></span> </strong>.</p><p>Please send me the following details filled :</p><p>Job''s Description : <strong><span>Description by landlord</span></strong></p><p>Time to complete :</p><p>Amount:</p><p>Please reply back if you need any more information regarding this.</p><p>Thanks</p><p><span>Admin</span></p><p>&nbsp;</p></div><div><br></div></div></div><div><br></div></div></div><div><br></div></div></body></html>', 'rohit@perceptive-solutions.com', 'tarun@perceptive-solutions.com', 0, 2, 6, 2, '2015-06-27 15:10:20', 'perpetual.rents@gmail.com', 11, NULL, NULL, NULL),
(5, 'Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)', '<html><body><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000"><div><br></div><div>this number is not currect</div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style="color: #000; font-weight: normal; font-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 8:40:17 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000" data-mce-style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000;"><div>Yes take my number 009299289222<br>call me on this....<br></div><div><br></div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style="color: #000; font-weight: normal; font-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 7:44:19 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000" data-mce-style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000;"><div><br></div><div>ok then how can we proceed further call me&nbsp;</div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style="color: #000; font-weight: normal; font-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 7:42:16 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000" data-mce-style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000;"><div>Yes i am very much interested.....<br></div><div><br></div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style="color: #000; font-weight: normal; font-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 6:56:17 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><p>Hello ,</p><p>I am very much interesting in to provide you a work on Property situated in <strong><span>201021</span></strong> for <strong><span></span> </strong>.</p><p>Please send me the following details filled :</p><p>Job''s Description : <strong><span>Description by landlord</span></strong></p><p>Time to complete :</p><p>Amount:</p><p>Please reply back if you need any more information regarding this.</p><p>Thanks</p><p><span>Admin</span></p><p>&nbsp;</p></div><div><br></div></div></div><div><br></div></div></div><div><br></div></div></div><div><br></div></div></body></html>', 'tarun@perceptive-solutions.com', 'rohit@perceptive-solutions.com', 0, 2, 6, 1, '2015-06-27 15:14:15', 'perpetual.rents@gmail.com', 11, NULL, NULL, NULL),
(6, 'Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)', '<html><body><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000"><div>take my iphone no....poppo<br></div><div><br></div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 8:44:13 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000"><div><br></div><div>this number is not currect</div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 8:40:17 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000"><div>Yes take my number 009299289222<br>call me on this....<br></div><div><br></div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 7:44:19 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000"><div><br></div><div>ok then how can we proceed further call me&nbsp;</div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 7:42:16 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><div style="font-family: times new roman, new york, times, serif; font-size: 12pt; color: #000000"><div>Yes i am very much interested.....<br></div><div><br></div><hr id="zwchr"><div style="color:#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><b>From: </b>"perpetual rents" &lt;perpetual.rents@gmail.com&gt;<br><b>To: </b>perpetual.rents@gmail.com<br><b>Sent: </b>Saturday, June 27, 2015 6:56:17 PM<br><b>Subject: </b>Quotation-Perpetual For Electrical Test (PRUKL233362-PRUKC27820)<br><div><br></div><p>Hello ,</p><p>I am very much interesting in to provide you a work on Property situated in <strong><span>201021</span></strong> for <strong><span></span> </strong>.</p><p>Please send me the following details filled :</p><p>Job''s Description : <strong><span>Description by landlord</span></strong></p><p>Time to complete :</p><p>Amount:</p><p>Please reply back if you need any more information regarding this.</p><p>Thanks</p><p><span>Admin</span></p><p>&nbsp;</p></div><div><br></div></div></div><div><br></div></div></div><div><br></div></div></div><div><br></div></div></div><div><br></div></div></body></html>', 'rohit@perceptive-solutions.com', 'tarun@perceptive-solutions.com', 0, 2, 6, 2, '2015-06-27 15:19:16', 'perpetual.rents@gmail.com', 11, NULL, NULL, NULL),
(7, 'Interested In Your Property Situated at 38928392(PRUKPD40326-PRUKPMC20988)', 'TYping....', 'sunayana.kumari4@gmail.com', 'johncarter4441@gmail.com', 0, 1, 6, 5, '2015-06-29 14:54:57', 'perpetual.rents@gmail.com', 12, NULL, NULL, NULL),
(8, 'Interested In Your Property Situated at 38928392(PRUKPD40326-PRUKPMC20988)', 'i can''t see you', 'johncarter4441@gmail.com', 'sunayana.kumari4@gmail.com', 0, 1, 17, 8, '2015-06-29 14:55:35', 'perpetual.rents@gmail.com', 12, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_mailattachementfile`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_mailattachementfile` (
  `id` int(11) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `fileData` longblob NOT NULL,
  `contentType` varchar(5) DEFAULT NULL,
  `referenceId` int(11) NOT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_maileventconfiguration`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_maileventconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `mailEventTypeId` int(11) NOT NULL,
  `mailEventTypeName` varchar(45) NOT NULL,
  `mailEventActorId` int(11) NOT NULL,
  `mailEventActorName` varchar(45) NOT NULL,
  `actorTypeId` int(11) NOT NULL,
  `actorTypeName` varchar(45) NOT NULL,
  `documentId` int(11) DEFAULT NULL,
  `enable` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`mailEventTypeId`,`mailEventActorId`,`actorTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=145 ;

--
-- Dumping data for table `tbl_perpetualrents_maileventconfiguration`
--

INSERT INTO `tbl_perpetualrents_maileventconfiguration` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `mailEventTypeId`, `mailEventTypeName`, `mailEventActorId`, `mailEventActorName`, `actorTypeId`, `actorTypeName`, `documentId`, `enable`) VALUES
(1, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 1, 'Landlord', 1, 'Landlord', 0, b'1'),
(2, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 1, 'Landlord', 3, 'Admin', 0, b'1'),
(3, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 1, 'Landlord', 4, 'SuperAdmin', 0, b'1'),
(4, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 2, 'Contractor', 2, 'Contractor', 0, b'1'),
(5, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 2, 'Contractor', 3, 'Admin', 0, b'1'),
(6, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 2, 'Contractor', 4, 'SuperAdmin', 0, b'1'),
(7, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 3, 'Admin', 3, 'Admin', 0, b'1'),
(8, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 3, 'Admin', 4, 'SuperAdmin', 0, b'1'),
(9, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 5, 'Charity-Admin', 4, 'SuperAdmin', 0, b'1'),
(10, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 5, 'Charity-Admin', 3, 'Admin', 0, b'1'),
(11, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 5, 'Charity-Admin', 5, 'Charity-Admin', 0, b'1'),
(12, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 6, 'Charity-User', 4, 'SuperAdmin', 0, b'1'),
(13, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 6, 'Charity-User', 3, 'Admin', 0, b'1'),
(14, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 6, 'Charity-User', 5, 'Charity-Admin', 0, b'1'),
(15, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 6, 'Charity-User', 6, 'Charity-Users', 0, b'1'),
(16, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 7, 'Property', 1, 'Landlord', 0, b'1'),
(17, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 7, 'Property', 3, 'Admin', 0, b'1'),
(18, '2014-09-16 05:12:16', NULL, NULL, NULL, 1, 'Register', 7, 'Property', 4, 'SuperAdmin', 0, b'1'),
(19, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 1, 'Landlord', 4, 'SuperAdmin', 0, b'1'),
(20, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 1, 'Landlord', 3, 'Admin', 0, b'1'),
(21, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 1, 'Landlord', 1, 'Landlord', 0, b'1'),
(22, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 2, 'Contractor', 1, 'Landlord', 0, b'1'),
(23, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 2, 'Contractor', 3, 'Admin', 0, b'1'),
(24, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 2, 'Contractor', 4, 'SuperAdmin', 0, b'1'),
(25, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 3, 'Admin', 3, 'Admin', 0, b'1'),
(26, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 3, 'Admin', 4, 'SuperAdmin', 0, b'1'),
(27, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 5, 'Charity-Admin', 4, 'SuperAdmin', 0, b'1'),
(28, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 5, 'Charity-Admin', 3, 'Admin', 0, b'1'),
(29, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 5, 'Charity-Admin', 5, 'Charity-Admin', 0, b'1'),
(30, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 6, 'Charity-User', 4, 'SuperAdmin', 0, b'1'),
(31, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 6, 'Charity-User', 3, 'Admin', 0, b'1'),
(32, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 6, 'Charity-User', 5, 'Charity-Admin', 0, b'1'),
(33, '2014-09-16 05:12:16', NULL, NULL, NULL, 2, 'Profile Edit', 6, 'Charity-User', 6, 'Charity-Users', 0, b'1'),
(34, '2014-09-16 05:12:16', NULL, NULL, NULL, 13, 'Edit', 7, 'Property', 1, 'Landlord', 0, b'1'),
(35, '2014-09-16 05:12:16', NULL, NULL, NULL, 13, 'Edit', 7, 'Property', 3, 'Admin', 0, b'1'),
(36, '2014-09-16 05:12:16', NULL, NULL, NULL, 13, 'Edit', 7, 'Property', 4, 'SuperAdmin', 0, b'1'),
(37, '2014-09-16 05:12:16', NULL, NULL, NULL, 13, 'Edit', 7, 'Property', 2, 'Contractor', 0, b'0'),
(38, '2014-09-16 05:12:16', NULL, NULL, NULL, 13, 'Edit', 7, 'Property', 5, 'Charity-Admin', 0, b'1'),
(39, '2014-09-16 05:12:16', NULL, NULL, NULL, 13, 'Edit', 7, 'Property', 6, 'Charity-Users', 0, b'1'),
(40, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 1, 'Landlord', 4, 'SuperAdmin', 0, b'0'),
(41, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 1, 'Landlord', 3, 'Admin', 0, b'0'),
(42, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 1, 'Landlord', 1, 'Landlord', 0, b'1'),
(43, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 2, 'Contractor', 1, 'Landlord', 0, b'0'),
(44, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 2, 'Contractor', 3, 'Admin', 0, b'0'),
(45, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 2, 'Contractor', 4, 'SuperAdmin', 0, b'1'),
(46, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 3, 'Admin', 3, 'Admin', 0, b'1'),
(47, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 3, 'Admin', 4, 'SuperAdmin', 0, b'0'),
(48, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 5, 'Charity-Admin', 5, 'Charity-Admin', 0, b'1'),
(49, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 5, 'Charity-Admin', 3, 'Admin', 0, b'0'),
(50, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 5, 'Charity-Admin', 4, 'SuperAdmin', 0, b'0'),
(51, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 6, 'Charity-User', 5, 'Charity-Admin', 0, b'0'),
(52, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 6, 'Charity-User', 3, 'Admin', 0, b'0'),
(53, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 6, 'Charity-User', 4, 'SuperAdmin', 0, b'0'),
(54, '2014-09-16 05:12:16', NULL, NULL, NULL, 3, 'Change Passwword', 6, 'Charity-User', 6, 'Charity-Users', 0, b'1'),
(55, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 1, 'Landlord', 1, 'Landlord', 0, b'0'),
(56, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 1, 'Landlord', 3, 'Admin', 0, b'0'),
(57, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 1, 'Landlord', 4, 'SuperAdmin', 0, b'0'),
(58, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 2, 'Contractor', 1, 'Landlord', 0, b'0'),
(59, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 2, 'Contractor', 3, 'Admin', 0, b'0'),
(60, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 2, 'Contractor', 4, 'SuperAdmin', 0, b'0'),
(61, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 3, 'Admin', 3, 'Admin', 0, b'1'),
(62, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 3, 'Admin', 4, 'SuperAdmin', 0, b'1'),
(63, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 5, 'Charity-Admin', 5, 'Charity-Admin', 0, b'1'),
(64, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 5, 'Charity-Admin', 3, 'Admin', 0, b'1'),
(65, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 5, 'Charity-Admin', 4, 'SuperAdmin', 0, b'1'),
(66, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 6, 'Charity-Users', 5, 'Charity-Admin', 0, b'1'),
(67, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 6, 'Charity-Users', 3, 'Admin', 0, b'1'),
(68, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 6, 'Charity-Users', 4, 'SuperAdmin', 0, b'1'),
(69, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 6, 'Charity-Users', 6, 'Charity-Users', 0, b'1'),
(70, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 7, 'Property', 4, 'Super-Admin', 0, b'0'),
(71, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 7, 'Property', 3, 'Admin', 0, b'0'),
(72, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 7, 'Property', 1, 'Landlord', 0, b'0'),
(73, '2014-09-16 05:12:16', NULL, NULL, NULL, 4, 'Enable', 7, 'Property', 2, 'Contractor', 0, b'0'),
(74, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 1, 'Landlord', 1, 'Landlord', 0, b'0'),
(75, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 1, 'Landlord', 3, 'Admin', 0, b'0'),
(76, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 1, 'Landlord', 4, 'SuperAdmin', 0, b'0'),
(77, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 2, 'Contractor', 1, 'Landlord', 0, b'1'),
(78, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 2, 'Contractor', 3, 'Admin', 0, b'1'),
(79, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 2, 'Contractor', 4, 'SuperAdmin', 0, b'1'),
(80, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 3, 'Admin', 3, 'Admin', 0, b'1'),
(81, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 3, 'Admin', 4, 'SuperAdmin', 0, b'1'),
(82, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 5, 'Charity-Admin', 5, 'Charity-Admin', 0, b'1'),
(83, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 5, 'Charity-Admin', 3, 'Admin', 0, b'1'),
(84, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 5, 'Charity-Admin', 4, 'Super-Admin', 0, b'1'),
(85, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 7, 'Property', 4, 'SuperAdmin', 0, b'1'),
(86, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 7, 'Property', 3, 'Admin', 0, b'1'),
(87, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 7, 'Property', 1, 'Landlord', 0, b'1'),
(88, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 7, 'Property', 2, 'Contractor', 0, b'1'),
(89, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 6, 'Charity-Users', 4, 'SuperAdmin', 0, b'1'),
(90, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 6, 'Charity-Users', 3, 'Admin', 0, b'1'),
(91, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 6, 'Charity-Users', 5, 'Charity-Admin', 0, b'1'),
(92, '2014-09-16 05:12:16', NULL, NULL, NULL, 5, 'Disable', 6, 'Charity-Users', 6, 'Charity-Users', 0, b'1'),
(93, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 2, 'Contractor', 2, 'Contractor', 0, b'1'),
(94, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 2, 'Contractor', 3, 'Admin', 0, b'1'),
(95, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 2, 'Contractor', 4, 'SuperAdmin', 0, b'1'),
(96, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 5, 'Charity', 5, 'Charity', 0, b'0'),
(97, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 5, 'Charity', 3, 'Admin', 0, b'0'),
(98, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 5, 'Charity', 4, 'SuperAdmin', 0, b'0'),
(99, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 7, 'Property', 1, 'Landlord', 0, b'1'),
(100, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 7, 'Property', 3, 'Admin', 0, b'1'),
(101, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 7, 'Property', 4, 'SuperAdmin', 0, b'1'),
(102, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 7, 'Property', 5, 'Charity-Admin', 0, b'1'),
(103, '2014-09-16 05:12:16', NULL, NULL, NULL, 7, 'Approve', 7, 'Property', 6, 'Charity-Users', 0, b'1'),
(104, '2014-09-16 05:12:16', NULL, NULL, NULL, 8, 'Disapprove', 2, 'Contractor', 1, 'Contractor', 0, b'0'),
(105, '2014-09-16 05:12:16', NULL, NULL, NULL, 8, 'Disapprove', 2, 'Contractor', 3, 'Admin', 0, b'0'),
(106, '2014-09-16 05:12:16', NULL, NULL, NULL, 8, 'Disapprove', 2, 'Contractor', 4, 'SuperAdmin', 0, b'0'),
(107, '2014-09-16 05:12:16', NULL, NULL, NULL, 8, 'Disapprove', 7, 'Property', 1, 'Landlord', 0, b'1'),
(108, '2014-09-16 05:12:16', NULL, NULL, NULL, 8, 'Disapprove', 7, 'Property', 3, 'Admin', 0, b'1'),
(109, '2014-09-16 05:12:16', NULL, NULL, NULL, 8, 'Disapprove', 7, 'Property', 4, 'SuperAdmin', 0, b'1'),
(110, '2014-09-16 05:12:16', NULL, NULL, NULL, 10, 'Assign', 10, 'Property', 1, 'Landlord', 0, b'1'),
(111, '2014-09-16 05:12:16', NULL, NULL, NULL, 10, 'Assign', 10, 'Property', 2, 'Contractor', 0, b'1'),
(112, '2014-09-16 05:12:16', NULL, NULL, NULL, 10, 'Assign', 10, 'Property', 3, 'Admin', 0, b'1'),
(113, '2014-09-16 05:12:16', NULL, NULL, NULL, 10, 'Assign', 10, 'Property', 4, 'SuperAdmin', 0, b'1'),
(114, '2014-09-16 05:12:16', NULL, NULL, NULL, 15, 'Reject', 7, 'Property', 1, 'Landlord', 0, b'1'),
(115, '2014-09-16 05:12:16', NULL, NULL, NULL, 15, 'Reject', 7, 'Property', 2, 'Contractor', 0, b'1'),
(116, '2014-09-16 05:12:16', NULL, NULL, NULL, 15, 'Reject', 7, 'Property', 3, 'Admin', 0, b'1'),
(117, '2014-09-16 05:12:16', NULL, NULL, NULL, 15, 'Reject', 7, 'Property', 4, 'SuperAdmin', 0, b'1'),
(118, '2014-09-16 05:12:16', NULL, NULL, NULL, 14, 'Accept', 7, 'Property', 1, 'Landlord', 0, b'1'),
(119, '2014-09-16 05:12:16', NULL, NULL, NULL, 14, 'Accept', 7, 'Property', 2, 'Contractor', 0, b'1'),
(120, '2014-09-16 05:12:16', NULL, NULL, NULL, 14, 'Accept', 7, 'Property', 3, 'Admin', 0, b'1'),
(121, '2014-09-16 05:12:16', NULL, NULL, NULL, 14, 'Accept', 7, 'Property', 4, 'SuperAdmin', 0, b'1'),
(122, '2014-09-16 05:12:16', NULL, NULL, NULL, 12, 'Password reset', 2, 'Contractor', 2, 'Contractor', 0, b'1'),
(123, '2014-09-16 05:12:16', NULL, NULL, NULL, 12, 'Password reset', 5, 'Charity-Admin', 5, 'Charity-Admin', 0, b'1'),
(124, '2014-09-16 05:12:16', NULL, NULL, NULL, 12, 'Password reset', 5, 'Charity-Users', 6, 'Charity-Users', 0, b'1'),
(125, '2014-09-16 05:12:16', NULL, NULL, NULL, 12, 'Password reset', 5, 'Admin', 3, 'Admin', 0, b'1'),
(126, '2014-09-16 05:12:16', NULL, NULL, NULL, 9, 'BAR-STATUS', 7, 'Property', 1, 'Landlord', 0, b'1'),
(127, '2014-09-16 05:12:16', NULL, NULL, NULL, 9, 'BAR-STATUS', 7, 'Property', 3, 'Admin', 0, b'1'),
(128, '2014-09-16 05:12:16', NULL, NULL, NULL, 9, 'BAR-STATUS', 7, 'Property', 5, 'Charity-Admin', 0, b'1'),
(129, '2014-09-16 05:12:16', NULL, NULL, NULL, 9, 'BAR-STATUS', 7, 'Property', 6, 'Charity-Users', 0, b'1'),
(130, '2014-12-18 12:40:13', NULL, NULL, NULL, 2, 'Profile Edit', 4, 'SuperAdmin', 4, 'SuperAdmin', 0, b'1'),
(131, '2014-12-20 09:19:51', NULL, NULL, NULL, 3, 'Password Change', 4, 'SuperAdmin', 4, 'SuperAdmin', 0, b'1'),
(132, '2015-05-20 05:11:13', NULL, NULL, NULL, 1, 'Register', 8, 'PropertyDeveloper', 8, 'PropertyDeveloper', NULL, b'1'),
(133, '2015-05-20 05:12:23', NULL, NULL, NULL, 1, 'Register', 8, 'PropertyDeveloper', 4, 'SuperAdmin', NULL, b'1'),
(135, '2015-05-22 13:26:28', NULL, NULL, NULL, 11, 'Upload', 8, 'PropertyDeveloper', 8, 'PropertyDeveloper', NULL, b'1'),
(136, '2015-05-22 13:27:57', NULL, NULL, NULL, 11, 'Upload', 8, 'PropertyDeveloper', 4, 'SuperAdmin', NULL, b'1'),
(137, '2015-05-26 05:36:52', NULL, NULL, NULL, 7, 'Approve', 8, 'PropertyDeveloper', 8, 'PropertyDeveloper', NULL, b'1'),
(138, '2015-05-26 05:38:10', NULL, NULL, NULL, 7, 'Approve', 8, 'PropertyDeveloper', 4, 'SuperAdmin', NULL, b'1'),
(139, '2015-05-26 10:16:34', NULL, NULL, NULL, 20, 'Admin_Upload_For_Property', 4, 'SuperAdmin', 8, 'PropertyDeveloper', NULL, b'1'),
(140, '2015-05-26 10:17:36', NULL, NULL, NULL, 20, 'Admin_Upload_For_Property', 4, 'SuperAdmin', 4, 'SuperAdmin', NULL, b'1'),
(141, '2015-06-01 09:54:29', NULL, NULL, NULL, 13, 'Edit', 8, 'PropertyDeveloper', 8, 'PropertyDeveloper', NULL, b'1'),
(142, '2015-06-01 09:55:01', NULL, NULL, NULL, 13, 'Edit', 8, 'PropertyDeveloper', 4, 'SuperAdmin', NULL, b'1'),
(143, '2015-07-01 11:11:58', NULL, NULL, NULL, 21, 'Admin_Update_For_Property', 4, 'SuperAdmin', 4, 'SuperAdmin', NULL, b'1'),
(144, '2015-07-01 11:14:11', NULL, NULL, NULL, 21, 'Admin_Update_For_Property', 4, 'SuperAdmin', 8, 'PropertyDeveloper', NULL, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_pddocuments`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_pddocuments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `fileName` varchar(45) NOT NULL,
  `propertyDeveloperId` int(11) NOT NULL,
  `propertyId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `documentTypeId` int(5) NOT NULL,
  `statusId` int(5) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=402 ;

--
-- Dumping data for table `tbl_perpetualrents_pddocuments`
--

INSERT INTO `tbl_perpetualrents_pddocuments` (`id`, `createdOn`, `createdUserId`, `modifiedOn`, `modifiedUserId`, `fileName`, `propertyDeveloperId`, `propertyId`, `fileId`, `documentTypeId`, `statusId`, `description`) VALUES
(1, '2015-06-15 07:23:56', 4, NULL, NULL, 'changesdoc.odt', 1, 1, 1, 1, NULL, NULL),
(2, '2015-06-15 07:23:56', 4, NULL, NULL, 'maildocuments.odt', 1, 1, 2, 1, NULL, NULL),
(3, '2015-06-15 07:24:05', 4, NULL, NULL, 'images.jpeg', 1, 1, 3, 11, NULL, NULL),
(4, '2015-06-15 07:24:05', 4, NULL, NULL, 'images1.jpeg', 1, 1, 4, 11, NULL, NULL),
(5, '2015-06-15 07:28:11', 4, NULL, NULL, 'changesdoc.odt', 1, 2, 5, 1, NULL, NULL),
(6, '2015-06-15 07:28:22', 4, NULL, NULL, 'property.jpg', 1, 2, 6, 11, NULL, NULL),
(7, '2015-06-15 07:28:22', 4, NULL, NULL, 'pune-properties2.jpg', 1, 2, 7, 11, NULL, NULL),
(8, '2015-06-15 07:30:29', 4, NULL, NULL, 'maildocuments.odt', 1, 3, 8, 1, NULL, NULL),
(9, '2015-06-15 07:30:29', 4, NULL, NULL, 'Untitled 4.odt', 1, 3, 9, 1, NULL, NULL),
(10, '2015-06-15 07:30:39', 4, NULL, NULL, 'images1.jpeg', 1, 3, 10, 11, NULL, NULL),
(11, '2015-06-15 07:30:39', 4, NULL, NULL, 'pune-properties2.jpg', 1, 3, 11, 11, NULL, NULL),
(12, '2015-06-15 08:19:37', 4, NULL, NULL, 'changesdoc.odt', 1, 4, 12, 1, NULL, NULL),
(13, '2015-06-15 08:19:37', 4, NULL, NULL, 'logijmn.odt', 1, 4, 13, 1, NULL, NULL),
(14, '2015-06-15 08:19:45', 4, NULL, NULL, 'images.jpeg', 1, 4, 14, 11, NULL, NULL),
(15, '2015-06-15 08:19:45', 4, NULL, NULL, 'images1.jpeg', 1, 4, 15, 11, NULL, NULL),
(16, '2015-06-15 08:38:45', 4, NULL, NULL, 'changesdoc.odt', 1, 5, 16, 1, NULL, NULL),
(17, '2015-06-15 08:38:45', 4, NULL, NULL, 'mailpd.odt', 1, 5, 17, 1, NULL, NULL),
(18, '2015-06-15 08:38:59', 4, NULL, NULL, 'images1.jpeg', 1, 5, 18, 11, NULL, NULL),
(19, '2015-06-15 08:38:59', 4, NULL, NULL, 'pune-properties2.jpg', 1, 5, 19, 11, NULL, NULL),
(20, '2015-06-15 08:44:28', 4, NULL, NULL, 'mailpd.odt', 1, 6, 20, 1, NULL, NULL),
(21, '2015-06-15 08:44:42', 4, NULL, NULL, 'images1.jpeg', 1, 6, 21, 11, NULL, NULL),
(22, '2015-06-15 08:44:42', 4, NULL, NULL, 'pune-properties2.jpg', 1, 6, 22, 11, NULL, NULL),
(23, '2015-06-15 08:55:10', 4, NULL, NULL, 'changesdoc.odt', 1, 7, 23, 1, NULL, NULL),
(24, '2015-06-15 08:55:18', 4, NULL, NULL, 'images.jpeg', 1, 7, 24, 11, NULL, NULL),
(25, '2015-06-15 08:55:18', 4, NULL, NULL, 'images1.jpeg', 1, 7, 25, 11, NULL, NULL),
(26, '2015-06-15 09:04:16', 4, NULL, NULL, 'changesdoc.odt', 1, 8, 26, 1, NULL, NULL),
(27, '2015-06-15 09:04:16', 4, NULL, NULL, 'logijmn.odt', 1, 8, 27, 1, NULL, NULL),
(28, '2015-06-15 09:04:26', 4, NULL, NULL, 'images.jpeg', 1, 8, 28, 11, NULL, NULL),
(29, '2015-06-15 09:04:26', 4, NULL, NULL, 'pune-properties2.jpg', 1, 8, 29, 11, NULL, NULL),
(30, '2015-06-15 12:46:06', 26, NULL, NULL, 'Desert.jpg', 3, 9, 30, 1, NULL, NULL),
(31, '2015-06-16 10:05:37', 4, NULL, NULL, 'changesdoc.odt', 1, 8, 31, 2, NULL, NULL),
(32, '2015-06-16 12:43:07', 30, NULL, NULL, 'Jellyfish.jpg', 4, 10, 34, 1, NULL, NULL),
(33, '2015-06-17 06:17:25', 1, NULL, NULL, 'images.jpeg', 3, 9, 35, 13, NULL, NULL),
(34, '2015-06-17 06:17:50', 1, NULL, NULL, 'images.jpeg', 1, 8, 36, 13, NULL, NULL),
(35, '2015-06-17 06:17:58', 1, NULL, NULL, 'images.jpeg', 1, 8, 37, 13, NULL, NULL),
(36, '2015-06-17 06:18:13', 1, NULL, NULL, 'property.jpg', 1, 8, 38, 13, NULL, NULL),
(37, '2015-06-17 09:04:07', 1, NULL, NULL, 'logijmn.odt', 1, 6, 39, 13, NULL, NULL),
(38, '2015-06-17 09:05:21', 1, NULL, NULL, 'changesdoc.odt', 3, 9, 40, 13, NULL, NULL),
(39, '2015-06-17 09:06:13', 1, NULL, NULL, 'logijmn.odt', 1, 6, 41, 13, NULL, NULL),
(40, '2015-06-17 09:47:40', 1, NULL, NULL, 'images.jpeg', 1, 8, 42, 13, NULL, NULL),
(41, '2015-06-17 09:47:51', 1, NULL, NULL, 'images1.jpeg', 1, 8, 43, 13, NULL, NULL),
(42, '2015-06-17 09:49:18', 1, NULL, NULL, 'images1.jpeg', 1, 8, 44, 13, NULL, NULL),
(43, '2015-06-17 10:10:55', 1, NULL, NULL, 'images.jpeg', 1, 7, 45, 13, NULL, NULL),
(44, '2015-06-17 10:13:57', 1, NULL, NULL, 'images.jpeg', 1, 8, 46, 13, NULL, NULL),
(45, '2015-06-17 10:14:32', 1, NULL, NULL, 'pune-properties2.jpg', 4, 10, 47, 13, NULL, NULL),
(46, '2015-06-17 10:29:19', 1, NULL, NULL, 'perpetual1.sql.tar.gz', 4, 10, 48, 13, NULL, NULL),
(47, '2015-06-17 10:30:36', 1, NULL, NULL, 'flats_1_tall_2.jpg', 4, 10, 49, 13, NULL, NULL),
(48, '2015-06-17 10:31:50', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 8, 50, 13, NULL, NULL),
(49, '2015-06-17 10:33:36', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 7, 51, 13, NULL, NULL),
(50, '2015-06-17 10:34:00', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 7, 52, 13, NULL, NULL),
(51, '2015-06-17 10:48:20', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 8, 53, 13, NULL, NULL),
(52, '2015-06-17 11:17:32', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 6, 54, 13, NULL, NULL),
(53, '2015-06-17 11:20:53', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 8, 55, 13, NULL, NULL),
(54, '2015-06-17 11:21:56', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 8, 56, 13, NULL, NULL),
(55, '2015-06-17 11:24:13', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 7, 57, 13, NULL, NULL),
(56, '2015-06-19 05:19:30', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 7, 58, 13, NULL, NULL),
(57, '2015-06-19 05:19:44', 1, NULL, NULL, 'article-0-024FC87000000578-445_468x394.jpg', 1, 7, 59, 13, NULL, NULL),
(58, '2015-06-19 05:21:30', 1, NULL, NULL, 'flats_1_tall_2.jpg', 3, 9, 60, 13, NULL, NULL),
(59, '2015-06-19 05:35:38', 1, NULL, NULL, 'flats_1_tall_2.jpg', 1, 8, 61, 13, NULL, NULL),
(60, '2015-06-19 05:36:27', 1, NULL, NULL, 'images.jpeg', 1, 8, 62, 13, NULL, NULL),
(61, '2015-06-19 05:36:39', 1, NULL, NULL, '123.html', 1, 8, 63, 13, NULL, NULL),
(62, '2015-06-19 05:37:02', 1, NULL, NULL, 'changesdoc.odt', 1, 8, 64, 13, NULL, NULL),
(63, '2015-06-19 05:37:16', 1, NULL, NULL, 'images.jpeg', 1, 8, 65, 13, NULL, NULL),
(64, '2015-06-19 05:37:25', 1, NULL, NULL, 'images1.jpeg', 1, 8, 66, 13, NULL, NULL),
(65, '2015-06-19 05:45:47', 1, NULL, NULL, 'images1.jpeg', 1, 8, 67, 13, NULL, NULL),
(66, '2015-06-19 05:49:06', 1, NULL, NULL, 'images.jpeg', 1, 6, 68, 13, NULL, NULL),
(67, '2015-06-19 05:49:06', 1, NULL, NULL, 'images1.jpeg', 1, 6, 69, 13, NULL, NULL),
(68, '2015-06-19 06:00:07', 1, NULL, NULL, 'logijmn.odt', 3, 9, 70, 13, NULL, NULL),
(69, '2015-06-19 06:00:07', 1, NULL, NULL, 'maildocuments.odt', 3, 9, 71, 13, NULL, NULL),
(70, '2015-06-19 06:00:09', 1, NULL, NULL, 'logijmn.odt', 3, 9, 72, 13, NULL, NULL),
(71, '2015-06-19 06:00:09', 1, NULL, NULL, 'maildocuments.odt', 3, 9, 73, 13, NULL, NULL),
(72, '2015-06-19 06:00:09', 1, NULL, NULL, 'logijmn.odt', 3, 9, 74, 13, NULL, NULL),
(73, '2015-06-19 06:00:09', 1, NULL, NULL, 'maildocuments.odt', 3, 9, 75, 13, NULL, NULL),
(74, '2015-06-19 06:03:13', 1, NULL, NULL, 'logijmn.odt', 3, 9, 76, 13, NULL, NULL),
(75, '2015-06-19 06:03:13', 1, NULL, NULL, 'maildocuments.odt', 3, 9, 77, 13, NULL, NULL),
(76, '2015-06-19 06:13:26', 1, NULL, NULL, 'images.jpeg', 4, 10, 78, 13, NULL, NULL),
(77, '2015-06-19 06:13:26', 1, NULL, NULL, 'images1.jpeg', 4, 10, 79, 13, NULL, NULL),
(78, '2015-06-19 06:16:28', 1, NULL, NULL, 'images.jpeg', 3, 9, 80, 13, NULL, NULL),
(79, '2015-06-19 06:16:28', 1, NULL, NULL, 'images1.jpeg', 3, 9, 81, 13, NULL, NULL),
(80, '2015-06-19 06:16:29', 1, NULL, NULL, 'images.jpeg', 3, 9, 82, 13, NULL, NULL),
(81, '2015-06-19 06:16:29', 1, NULL, NULL, 'images1.jpeg', 3, 9, 83, 13, NULL, NULL),
(82, '2015-06-19 06:16:29', 1, NULL, NULL, 'images.jpeg', 3, 9, 84, 13, NULL, NULL),
(83, '2015-06-19 06:16:29', 1, NULL, NULL, 'images1.jpeg', 3, 9, 85, 13, NULL, NULL),
(84, '2015-06-19 06:16:58', 1, NULL, NULL, 'images.jpeg', 1, 7, 86, 13, NULL, NULL),
(85, '2015-06-19 06:16:58', 1, NULL, NULL, 'images1.jpeg', 1, 7, 87, 13, NULL, NULL),
(86, '2015-06-19 06:17:02', 1, NULL, NULL, 'images.jpeg', 1, 7, 88, 13, NULL, NULL),
(87, '2015-06-19 06:17:02', 1, NULL, NULL, 'images1.jpeg', 1, 7, 89, 13, NULL, NULL),
(88, '2015-06-19 06:21:12', 4, NULL, NULL, 'changesdoc.odt', 1, 11, 90, 1, NULL, NULL),
(89, '2015-06-19 06:34:23', 4, NULL, NULL, 'changesdoc.odt', 1, 11, 91, 1, NULL, NULL),
(91, '2015-06-19 06:34:53', 4, NULL, NULL, 'images1.jpeg', 1, 11, 93, 1, NULL, NULL),
(92, '2015-06-19 06:46:41', 1, NULL, NULL, 'images.jpeg', 1, 8, 94, 13, NULL, NULL),
(93, '2015-06-19 06:46:41', 1, NULL, NULL, 'images1.jpeg', 1, 8, 95, 13, NULL, NULL),
(94, '2015-06-19 06:48:53', 1, NULL, NULL, 'images.jpeg', 4, 10, 96, 13, NULL, NULL),
(95, '2015-06-19 06:48:53', 1, NULL, NULL, 'images1.jpeg', 4, 10, 97, 13, NULL, NULL),
(96, '2015-06-19 06:50:54', 1, NULL, NULL, 'images.jpeg', 4, 10, 98, 13, NULL, NULL),
(97, '2015-06-19 06:50:54', 1, NULL, NULL, 'images1.jpeg', 4, 10, 99, 13, NULL, NULL),
(98, '2015-06-19 06:53:04', 1, NULL, NULL, 'changesdoc.odt', 3, 9, 100, 13, NULL, NULL),
(99, '2015-06-19 06:53:04', 1, NULL, NULL, 'googlemap.jsp', 3, 9, 101, 13, NULL, NULL),
(100, '2015-06-19 06:53:06', 1, NULL, NULL, 'changesdoc.odt', 3, 9, 102, 13, NULL, NULL),
(101, '2015-06-19 06:53:06', 1, NULL, NULL, 'googlemap.jsp', 3, 9, 103, 13, NULL, NULL),
(102, '2015-06-19 07:01:44', 1, NULL, NULL, 'logijmn.odt', 1, 8, 104, 13, NULL, NULL),
(103, '2015-06-19 07:01:44', 1, NULL, NULL, 'maildocuments.odt', 1, 8, 105, 13, NULL, NULL),
(104, '2015-06-19 07:07:02', 1, NULL, NULL, 'images.jpeg', 3, 9, 106, 13, NULL, NULL),
(105, '2015-06-19 07:07:02', 1, NULL, NULL, 'images1.jpeg', 3, 9, 107, 13, NULL, NULL),
(106, '2015-06-19 07:10:53', 1, NULL, NULL, 'images.jpeg', 1, 8, 108, 13, NULL, NULL),
(107, '2015-06-19 07:10:53', 1, NULL, NULL, 'images1.jpeg', 1, 8, 109, 13, NULL, NULL),
(108, '2015-06-19 07:11:44', 1, NULL, NULL, 'images1.jpeg', 4, 10, 110, 13, NULL, NULL),
(109, '2015-06-19 07:16:08', 1, NULL, NULL, 'googlemap.jsp', 4, 10, 111, 13, NULL, NULL),
(110, '2015-06-19 07:20:12', 1, NULL, NULL, 'images.jpeg', 1, 8, 112, 13, NULL, NULL),
(111, '2015-06-19 07:20:12', 1, NULL, NULL, 'images1.jpeg', 1, 8, 113, 13, NULL, NULL),
(112, '2015-06-19 07:22:21', 4, NULL, NULL, 'images1.jpeg', 1, 12, 114, 1, NULL, NULL),
(113, '2015-06-19 07:23:30', 1, NULL, NULL, 'googlemap.jsp', 4, 10, 115, 13, NULL, NULL),
(114, '2015-06-19 07:23:30', 1, NULL, NULL, 'googlemapdemo.html', 4, 10, 116, 13, NULL, NULL),
(115, '2015-06-19 07:30:53', 4, NULL, NULL, 'images.jpeg', 1, 13, 117, 1, NULL, NULL),
(116, '2015-06-19 07:33:36', 4, NULL, NULL, 'images.jpeg', 1, 13, 118, 11, NULL, NULL),
(117, '2015-06-19 07:34:15', 1, NULL, NULL, 'changesdoc.odt', 1, 11, 119, 13, NULL, NULL),
(118, '2015-06-19 07:34:15', 1, NULL, NULL, 'googlemap.jsp', 1, 11, 120, 13, NULL, NULL),
(119, '2015-06-19 07:35:55', 1, NULL, NULL, 'changesdoc.odt', 3, 9, 121, 13, NULL, NULL),
(121, '2015-06-19 07:40:28', 1, NULL, NULL, 'googlemap.jsp', 4, 10, 123, 12, NULL, NULL),
(122, '2015-06-19 07:43:50', 4, NULL, NULL, 'logijmn.odt', 1, 14, 124, 1, NULL, NULL),
(123, '2015-06-19 07:44:18', 4, NULL, NULL, 'changesdoc.odt', 1, 14, 125, 1, NULL, NULL),
(124, '2015-06-19 07:44:41', 4, NULL, NULL, 'changesdoc.odt', 1, 14, 126, 1, NULL, NULL),
(125, '2015-06-19 08:11:48', 1, NULL, NULL, 'changesdoc.odt', 1, 13, 127, 12, NULL, NULL),
(126, '2015-06-19 08:11:48', 1, NULL, NULL, 'googlemap.jsp', 1, 13, 128, 12, NULL, NULL),
(127, '2015-06-19 08:16:37', 1, NULL, NULL, 'changesdoc.odt', 1, 11, 129, 12, NULL, NULL),
(128, '2015-06-19 08:16:37', 1, NULL, NULL, 'googlemap.jsp', 1, 11, 130, 12, NULL, NULL),
(129, '2015-06-19 08:17:54', 4, NULL, NULL, 'googlemapdemo.html', 1, 15, 131, 1, NULL, NULL),
(130, '2015-06-19 08:21:22', 4, NULL, NULL, 'googlemapdemo.html', 1, 15, 132, 1, NULL, NULL),
(131, '2015-06-19 08:21:37', 4, NULL, NULL, 'googlemapdemo.html', 1, 15, 133, 1, NULL, NULL),
(132, '2015-06-19 08:22:14', 4, NULL, NULL, 'googlemapdemo.html', 1, 15, 134, 1, NULL, NULL),
(133, '2015-06-19 08:22:20', 4, NULL, NULL, 'googlemap.jsp', 1, 15, 135, 1, NULL, NULL),
(134, '2015-06-19 08:22:45', 4, NULL, NULL, 'googlemap.jsp', 1, 15, 136, 1, NULL, NULL),
(135, '2015-06-19 08:26:00', 1, NULL, NULL, 'images.jpeg', 1, 12, 137, 12, NULL, NULL),
(136, '2015-06-19 08:29:55', 1, NULL, NULL, 'googlemapdemo.html', 4, 10, 138, 12, NULL, NULL),
(137, '2015-06-19 08:34:25', 1, NULL, NULL, 'images1.jpeg', 1, 12, 139, 12, NULL, NULL),
(138, '2015-06-19 08:36:10', 1, NULL, NULL, 'images.jpeg', 1, 11, 140, 12, NULL, NULL),
(144, '2015-06-19 08:57:33', 4, NULL, NULL, 'changesdoc.odt', 1, 16, 146, 1, NULL, NULL),
(145, '2015-06-19 08:57:33', 4, NULL, NULL, 'googlemap.jsp', 1, 16, 147, 1, NULL, NULL),
(146, '2015-06-19 08:57:58', 4, NULL, NULL, 'changesdoc.odt', 1, 16, 148, 1, NULL, NULL),
(147, '2015-06-19 08:57:58', 4, NULL, NULL, 'googlemap.jsp', 1, 16, 149, 1, NULL, NULL),
(148, '2015-06-19 08:58:12', 4, NULL, NULL, 'changesdoc.odt', 1, 16, 150, 1, NULL, NULL),
(149, '2015-06-19 08:58:12', 4, NULL, NULL, 'googlemap.jsp', 1, 16, 151, 1, NULL, NULL),
(150, '2015-06-19 08:58:36', 4, NULL, NULL, 'changesdoc.odt', 1, 16, 152, 1, NULL, NULL),
(151, '2015-06-19 08:58:36', 4, NULL, NULL, 'googlemap.jsp', 1, 16, 153, 1, NULL, NULL),
(152, '2015-06-19 08:58:50', 4, NULL, NULL, 'changesdoc.odt', 1, 16, 154, 1, NULL, NULL),
(153, '2015-06-19 08:58:50', 4, NULL, NULL, 'googlemap.jsp', 1, 16, 155, 1, NULL, NULL),
(154, '2015-06-19 08:59:25', 4, NULL, NULL, 'changesdoc.odt', 1, 16, 156, 1, NULL, NULL),
(155, '2015-06-19 08:59:25', 4, NULL, NULL, 'googlemap.jsp', 1, 16, 157, 1, NULL, NULL),
(156, '2015-06-19 08:59:33', 4, NULL, NULL, 'changesdoc.odt', 1, 16, 158, 1, NULL, NULL),
(157, '2015-06-19 08:59:33', 4, NULL, NULL, 'googlemap.jsp', 1, 16, 159, 1, NULL, NULL),
(158, '2015-06-19 08:59:44', 4, NULL, NULL, 'changesdoc.odt', 1, 16, 160, 1, NULL, NULL),
(159, '2015-06-19 08:59:44', 4, NULL, NULL, 'googlemap.jsp', 1, 16, 161, 1, NULL, NULL),
(160, '2015-06-19 08:59:53', 4, NULL, NULL, 'changesdoc.odt', 1, 16, 162, 1, NULL, NULL),
(161, '2015-06-19 08:59:53', 4, NULL, NULL, 'googlemap.jsp', 1, 16, 163, 1, NULL, NULL),
(162, '2015-06-19 09:02:20', 4, NULL, NULL, 'logijmn.odt', 1, 16, 164, 2, NULL, NULL),
(163, '2015-06-19 09:02:24', 4, NULL, NULL, 'logijmn.odt', 1, 16, 165, 2, NULL, NULL),
(164, '2015-06-19 09:03:45', 4, NULL, NULL, 'logijmn.odt', 1, 16, 166, 2, NULL, NULL),
(165, '2015-06-19 09:04:01', 4, NULL, NULL, 'logijmn.odt', 1, 16, 167, 2, NULL, NULL),
(171, '2015-06-19 09:22:23', 4, NULL, NULL, 'maildocuments.odt', 1, 18, 173, 1, NULL, NULL),
(173, '2015-06-19 13:00:16', 4, NULL, NULL, 'googlemap.jsp', 1, 19, 175, 1, NULL, NULL),
(174, '2015-06-19 13:06:59', 1, NULL, NULL, '123.html', 1, 14, 176, 12, NULL, NULL),
(176, '2015-06-19 13:27:46', 1, NULL, NULL, 'googlemap.jsp', 1, 15, 178, 12, NULL, NULL),
(179, '2015-06-22 05:00:35', 4, NULL, NULL, 'images.jpeg', 1, 20, 181, 11, NULL, NULL),
(180, '2015-06-22 05:00:35', 4, NULL, NULL, 'images1.jpeg', 1, 20, 182, 11, NULL, NULL),
(181, '2015-06-22 05:02:21', 4, NULL, NULL, 'images.jpeg', 1, 20, 183, 11, NULL, NULL),
(182, '2015-06-22 05:02:21', 4, NULL, NULL, 'images1.jpeg', 1, 20, 184, 11, NULL, NULL),
(186, '2015-06-22 05:03:42', 4, NULL, NULL, 'googlemapdemo.html', 1, 20, 188, 1, NULL, NULL),
(187, '2015-06-22 05:03:42', 4, NULL, NULL, 'maildocuments.odt', 1, 20, 189, 1, NULL, NULL),
(217, '2015-06-22 10:31:18', 1, NULL, NULL, 'changesdoc.odt', 1, 19, 219, 12, NULL, NULL),
(218, '2015-06-22 10:31:18', 1, NULL, NULL, 'googlemap.jsp', 1, 19, 220, 12, NULL, NULL),
(219, '2015-06-22 10:31:57', 1, NULL, NULL, 'images1.jpeg', 1, 19, 221, 12, NULL, NULL),
(224, '2015-06-22 11:15:32', 1, NULL, NULL, 'googlemap.jsp', 1, 19, 226, 12, NULL, NULL),
(226, '2015-06-22 12:17:01', 1, NULL, NULL, 'changesdoc.odt', 1, 19, 228, 12, NULL, NULL),
(227, '2015-06-22 12:17:01', 1, NULL, NULL, 'googlemap.jsp', 1, 19, 229, 12, NULL, NULL),
(228, '2015-06-22 12:18:29', 1, NULL, NULL, '123.html', 1, 19, 230, 12, NULL, NULL),
(229, '2015-06-23 04:46:50', 1, NULL, NULL, 'images1.jpeg', 1, 19, 231, 12, NULL, NULL),
(230, '2015-06-23 12:42:21', 4, NULL, NULL, 'images.jpeg', 1, 34, 232, 1, NULL, NULL),
(231, '2015-06-23 12:42:28', 4, NULL, NULL, 'images.jpeg', 1, 34, 233, 11, NULL, NULL),
(232, '2015-06-23 12:42:28', 4, NULL, NULL, 'images1.jpeg', 1, 34, 234, 11, NULL, NULL),
(233, '2015-06-24 05:55:07', 26, NULL, NULL, 'lesson2.pdf', 3, 9, 235, 12, NULL, NULL),
(234, '2015-06-24 05:56:33', 1, NULL, NULL, 'lesson2.pdf', 3, 9, 236, 12, NULL, NULL),
(235, '2015-06-24 06:01:15', 26, NULL, NULL, 'acro6_pg_ue.pdf', 3, 9, 237, 12, NULL, NULL),
(236, '2015-06-24 06:01:52', 1, NULL, NULL, 'acro6_pg_ue.pdf', 3, 9, 238, 12, NULL, NULL),
(237, '2015-06-24 11:46:40', 4, NULL, NULL, 'images.jpeg', 1, 50, 239, 11, NULL, NULL),
(238, '2015-06-24 12:01:39', 4, NULL, NULL, 'changesdoc.odt', 1, 51, 240, 1, NULL, NULL),
(239, '2015-06-24 12:01:39', 4, NULL, NULL, 'googlemap.jsp', 1, 51, 241, 1, NULL, NULL),
(240, '2015-06-24 12:01:49', 4, NULL, NULL, 'images.jpeg', 1, 51, 242, 11, NULL, NULL),
(241, '2015-06-24 12:01:49', 4, NULL, NULL, 'images1.jpeg', 1, 51, 243, 11, NULL, NULL),
(242, '2015-06-25 05:45:21', 4, NULL, NULL, 'flats_1_tall_2.jpg', 1, 53, 244, 11, NULL, NULL),
(243, '2015-06-25 05:48:55', 4, NULL, NULL, 'map.html', 1, 54, 245, 1, NULL, NULL),
(244, '2015-06-25 05:49:03', 4, NULL, NULL, 'images.jpeg', 1, 54, 246, 11, NULL, NULL),
(245, '2015-06-25 05:49:03', 4, NULL, NULL, 'images1.jpeg', 1, 54, 247, 11, NULL, NULL),
(246, '2015-06-25 05:49:48', 4, NULL, NULL, 'images1.jpeg', 1, 55, 248, 11, NULL, NULL),
(247, '2015-06-25 06:40:52', 4, NULL, NULL, 'images.jpeg', 1, 56, 249, 11, NULL, NULL),
(248, '2015-06-25 06:40:52', 4, NULL, NULL, 'images1.jpeg', 1, 56, 250, 11, NULL, NULL),
(249, '2015-06-25 07:03:21', 4, NULL, NULL, 'map.html', 1, 58, 251, 10, NULL, NULL),
(250, '2015-06-25 07:11:27', 4, NULL, NULL, 'images1.jpeg', 1, 59, 252, 11, NULL, NULL),
(251, '2015-06-25 07:32:07', 4, NULL, NULL, 'images.jpeg', 1, 64, 253, 11, NULL, NULL),
(252, '2015-06-25 07:35:23', 4, NULL, NULL, 'images1.jpeg', 1, 65, 254, 11, NULL, NULL),
(253, '2015-06-25 08:50:14', 4, NULL, NULL, 'images.jpeg', 1, 69, 255, 11, NULL, NULL),
(254, '2015-06-25 08:53:32', 4, NULL, NULL, 'images1.jpeg', 1, 70, 256, 11, NULL, NULL),
(255, '2015-06-25 10:21:27', 4, NULL, NULL, 'mapintegrate.odt', 1, 72, 257, 11, NULL, NULL),
(256, '2015-06-25 10:33:57', 4, NULL, NULL, 'images1.jpeg', 1, 74, 258, 11, NULL, NULL),
(257, '2015-06-25 10:41:46', 4, NULL, NULL, 'images.jpeg', 1, 75, 259, 11, NULL, NULL),
(258, '2015-06-25 11:07:30', 1, NULL, NULL, 'googlemap.jsp', 1, 75, 260, 12, NULL, NULL),
(259, '2015-06-25 11:07:30', 1, NULL, NULL, 'images.jpeg', 1, 75, 261, 12, NULL, NULL),
(260, '2015-06-25 11:07:55', 1, NULL, NULL, 'images.jpeg', 1, 77, 262, 12, 2, NULL),
(261, '2015-06-25 11:07:55', 1, NULL, NULL, 'images1.jpeg', 1, 77, 263, 12, 2, NULL),
(262, '2015-06-25 11:07:55', 1, NULL, NULL, 'map.html', 1, 77, 264, 12, 2, NULL),
(263, '2015-06-25 11:26:26', 26, NULL, NULL, 'images1.jpeg', 3, 78, 265, 11, NULL, NULL),
(264, '2015-06-26 04:40:06', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 76, 266, 12, 2, NULL),
(265, '2015-06-26 04:41:13', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 1, 267, 12, NULL, NULL),
(266, '2015-06-26 04:49:36', 1, NULL, NULL, 'goodAfter.jpeg', 1, 76, 273, 12, 2, NULL),
(267, '2015-06-26 09:49:05', 1, NULL, NULL, 'acro6_pg_ue(1).pdf', 3, 79, 274, 12, 2, NULL),
(268, '2015-06-26 09:49:11', 1, NULL, NULL, 'acro6_pg_ue(1).pdf', 3, 79, 275, 12, 2, NULL),
(269, '2015-06-26 09:49:12', 1, NULL, NULL, 'acro6_pg_ue(1).pdf', 3, 79, 276, 12, 1, NULL),
(270, '2015-06-26 09:49:13', 1, NULL, NULL, 'acro6_pg_ue(1).pdf', 3, 79, 277, 12, 1, NULL),
(284, '2015-06-27 06:34:39', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 82, 291, 12, 1, NULL),
(289, '2015-06-27 08:23:28', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 82, 296, 12, 1, NULL),
(329, '2015-06-29 11:10:40', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 82, 381, 1, 1, NULL),
(330, '2015-06-29 11:10:40', 4, NULL, NULL, 'goodAfter.jpeg', 1, 82, 382, 1, 1, NULL),
(331, '2015-06-29 11:40:39', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 82, 383, 3, 1, NULL),
(332, '2015-06-29 11:40:39', 4, NULL, NULL, 'goodAfter.jpeg', 1, 82, 384, 3, 1, NULL),
(333, '2015-06-29 12:31:26', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 82, 385, 2, 1, NULL),
(334, '2015-06-29 12:40:49', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 82, 386, 5, 1, NULL),
(336, '2015-06-29 13:13:26', 1, NULL, NULL, 'FOOTBALL.jpg', 3, 80, 388, 12, 1, NULL),
(337, '2015-06-29 13:13:26', 1, NULL, NULL, 'goodAfter.jpeg', 3, 80, 389, 12, 1, NULL),
(338, '2015-06-29 13:18:43', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 83, 390, 12, 1, NULL),
(339, '2015-06-29 13:18:43', 1, NULL, NULL, 'goodAfter.jpeg', 1, 83, 391, 12, 1, NULL),
(341, '2015-06-29 13:28:10', 1, NULL, NULL, 'goodAfter.jpeg', 1, 83, 393, 12, 1, NULL),
(342, '2015-06-29 13:29:20', 1, NULL, NULL, 'goodAfter.jpeg', 1, 83, 394, 12, 1, NULL),
(343, '2015-06-29 13:31:17', 1, NULL, NULL, 'goodAfter.jpeg', 1, 83, 395, 12, 1, NULL),
(344, '2015-06-29 13:35:33', 1, NULL, NULL, 'goodAfter.jpeg', 1, 82, 396, 12, 1, NULL),
(345, '2015-06-29 13:42:25', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 83, 397, 12, 1, NULL),
(346, '2015-06-29 13:42:25', 1, NULL, NULL, 'goodAfter.jpeg', 1, 83, 398, 12, 1, NULL),
(347, '2015-06-29 13:42:25', 1, NULL, NULL, 'Screenshot from 2015-05-26 19:58:27.png', 1, 83, 399, 12, 1, NULL),
(348, '2015-06-29 14:08:21', 26, NULL, NULL, '11 (1).png', 3, 79, 400, 1, 1, NULL),
(352, '2015-06-29 14:09:16', 26, NULL, NULL, 'Penguins.jpg', 3, 79, 404, 11, 1, NULL),
(353, '2015-06-30 08:53:46', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 83, 405, 1, 1, NULL),
(355, '2015-06-30 09:04:58', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 84, 407, 1, 1, NULL),
(356, '2015-06-30 09:04:58', 4, NULL, NULL, 'goodAfter.jpeg', 1, 84, 408, 1, 1, NULL),
(357, '2015-06-30 12:58:05', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 84, 409, 12, 1, NULL),
(358, '2015-06-30 12:58:05', 1, NULL, NULL, 'goodAfter.jpeg', 1, 84, 410, 12, 1, NULL),
(359, '2015-07-01 03:19:10', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 67, 411, 1, 1, NULL),
(360, '2015-07-01 03:19:10', 4, NULL, NULL, 'goodAfter.jpeg', 1, 67, 412, 1, 1, NULL),
(362, '2015-07-01 09:27:59', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 68, 414, 1, 1, NULL),
(363, '2015-07-01 09:27:59', 4, NULL, NULL, 'goodAfter.jpeg', 1, 68, 415, 1, 1, NULL),
(364, '2015-07-01 09:31:38', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 83, 416, 2, 1, NULL),
(365, '2015-07-01 09:31:38', 4, NULL, NULL, 'goodAfter.jpeg', 1, 83, 417, 2, 1, NULL),
(366, '2015-07-01 09:40:06', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 85, 418, 1, 1, NULL),
(367, '2015-07-01 09:40:06', 4, NULL, NULL, 'goodAfter.jpeg', 1, 85, 419, 1, 1, NULL),
(368, '2015-07-01 09:44:47', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 84, 420, 2, 1, NULL),
(369, '2015-07-01 09:44:47', 4, NULL, NULL, 'goodAfter.jpeg', 1, 84, 421, 2, 1, NULL),
(370, '2015-07-01 09:46:49', 4, NULL, NULL, 'goodAfter.jpeg', 1, 84, 422, 3, 1, NULL),
(371, '2015-07-01 10:02:04', 4, NULL, NULL, 'FOOTBALL.jpg', 1, 81, 423, 1, 1, NULL),
(372, '2015-07-01 10:02:04', 4, NULL, NULL, 'goodAfter.jpeg', 1, 81, 424, 1, 1, NULL),
(373, '2015-07-01 11:35:08', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 83, 425, 12, 1, NULL),
(374, '2015-07-01 11:35:08', 1, NULL, NULL, 'goodAfter.jpeg', 1, 83, 426, 12, 1, NULL),
(375, '2015-07-01 11:38:27', 1, NULL, NULL, 'goodAfter.jpeg', 1, 72, 427, 12, 1, NULL),
(376, '2015-07-01 11:45:46', 1, NULL, NULL, 'goodAfter.jpeg', 1, 72, 428, 12, 1, NULL),
(377, '2015-07-01 11:46:12', 1, NULL, NULL, 'goodAfter.jpeg', 1, 72, 429, 12, 1, NULL),
(378, '2015-07-01 11:52:39', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 41, 430, 12, 1, NULL),
(379, '2015-07-01 11:52:39', 1, NULL, NULL, 'goodAfter.jpeg', 1, 41, 431, 12, 1, NULL),
(380, '2015-07-01 12:06:21', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 57, 432, 12, 1, NULL),
(381, '2015-07-01 12:06:21', 1, NULL, NULL, 'goodAfter.jpeg', 1, 57, 433, 12, 1, NULL),
(382, '2015-07-01 12:15:24', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 85, 434, 12, 1, NULL),
(383, '2015-07-01 12:15:24', 1, NULL, NULL, 'goodAfter.jpeg', 1, 85, 435, 12, 1, NULL),
(385, '2015-07-01 12:17:54', 1, NULL, NULL, 'goodAfter.jpeg', 1, 85, 437, 12, 1, NULL),
(386, '2015-07-01 12:18:56', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 58, 438, 12, 1, NULL),
(387, '2015-07-01 12:18:56', 1, NULL, NULL, 'goodAfter.jpeg', 1, 58, 439, 12, 1, NULL),
(388, '2015-07-01 12:36:58', 4, NULL, NULL, 'goodAfter.jpeg', 1, 85, 440, 11, 1, NULL),
(389, '2015-07-01 12:39:25', 4, NULL, NULL, 'goodAfter.jpeg', 1, 84, 441, 11, 1, NULL),
(390, '2015-07-01 13:18:33', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 85, 442, 12, 1, NULL),
(391, '2015-07-01 13:18:33', 1, NULL, NULL, 'goodAfter.jpeg', 1, 85, 443, 12, 1, NULL),
(392, '2015-07-01 13:18:50', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 85, 444, 12, 1, NULL),
(393, '2015-07-01 13:18:50', 1, NULL, NULL, 'goodAfter.jpeg', 1, 85, 445, 12, 1, NULL),
(394, '2015-07-01 13:18:50', 1, NULL, NULL, 'learnPic.jpg', 1, 85, 446, 12, 1, NULL),
(395, '2015-07-01 13:18:50', 1, NULL, NULL, 'Screenshot from 2015-05-26 19:58:27.png', 1, 85, 447, 12, 1, NULL),
(400, '2015-07-01 15:01:22', 1, NULL, NULL, 'goodAfter.jpeg', 1, 85, 452, 12, 1, 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
(401, '2015-07-02 07:08:58', 1, NULL, NULL, 'FOOTBALL.jpg', 1, 85, 453, 12, 1, 'rffffffffffffffffffffffffffffffff');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_pdproperty`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_pdproperty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `contactPerson` varchar(255) NOT NULL,
  `uniqueReference` varchar(255) NOT NULL,
  `statusId` int(5) NOT NULL DEFAULT '0',
  `propertydeveloperId` int(11) NOT NULL,
  `typeOfProposedProp` varchar(150) DEFAULT NULL,
  `noOfUnits` varchar(150) DEFAULT NULL,
  `energySavingFeatures` varchar(255) DEFAULT NULL,
  `estimatedStartDate` varchar(150) DEFAULT NULL,
  `timeToCompleteSceme` varchar(150) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `isJointVenture` varchar(150) DEFAULT NULL,
  `permissionToCarryOut` varchar(150) DEFAULT NULL,
  `emergencyContactNo` varchar(150) DEFAULT NULL,
  `nameOfOtherPartners` varchar(150) DEFAULT NULL,
  `companyName` varchar(150) DEFAULT NULL,
  `ndaStatus` varchar(150) DEFAULT NULL,
  `ndaCompletionDate` varchar(150) DEFAULT NULL,
  `expectedRentalLevel` varchar(150) DEFAULT NULL,
  `accommodationType` varchar(150) DEFAULT NULL,
  `hmoDeductions` varchar(150) DEFAULT NULL,
  `haveItsOwnMeteringSupply` varchar(150) DEFAULT NULL,
  `rateableValue` varchar(150) DEFAULT NULL,
  `waterRatesValue` varchar(150) DEFAULT NULL,
  `numberOfStudioFlates` varchar(150) DEFAULT NULL,
  `isRefurbishmentProject` varchar(150) DEFAULT NULL,
  `sustainableFeatures` varchar(150) DEFAULT NULL,
  `expectedEpcRating` varchar(20) DEFAULT NULL,
  `estimatedHandoverDate` varchar(150) DEFAULT NULL,
  `insurancePolicyNumber` varchar(150) DEFAULT NULL,
  `isWindowsUPVCLockable` varchar(50) DEFAULT NULL,
  `isUPVCExternalDoors` varchar(50) DEFAULT NULL,
  `isSolidWoodInternalDoors` varchar(50) DEFAULT NULL,
  `isKitchenFacilities` varchar(50) DEFAULT NULL,
  `isToiletFacilities` varchar(50) DEFAULT NULL,
  `isPainted` varchar(50) DEFAULT NULL,
  `isWallsInContemporaryPainted` varchar(50) DEFAULT NULL,
  `isCarpetedThroughout` varchar(50) DEFAULT NULL,
  `isOutdoorCommunalDevice` varchar(50) DEFAULT NULL,
  `checkForUploadDocuments` varchar(5) DEFAULT NULL,
  `checkForAdminUploadDocuments` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `tbl_perpetualrents_pdproperty`
--

INSERT INTO `tbl_perpetualrents_pdproperty` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `contactPerson`, `uniqueReference`, `statusId`, `propertydeveloperId`, `typeOfProposedProp`, `noOfUnits`, `energySavingFeatures`, `estimatedStartDate`, `timeToCompleteSceme`, `description`, `isJointVenture`, `permissionToCarryOut`, `emergencyContactNo`, `nameOfOtherPartners`, `companyName`, `ndaStatus`, `ndaCompletionDate`, `expectedRentalLevel`, `accommodationType`, `hmoDeductions`, `haveItsOwnMeteringSupply`, `rateableValue`, `waterRatesValue`, `numberOfStudioFlates`, `isRefurbishmentProject`, `sustainableFeatures`, `expectedEpcRating`, `estimatedHandoverDate`, `insurancePolicyNumber`, `isWindowsUPVCLockable`, `isUPVCExternalDoors`, `isSolidWoodInternalDoors`, `isKitchenFacilities`, `isToiletFacilities`, `isPainted`, `isWallsInContemporaryPainted`, `isCarpetedThroughout`, `isOutdoorCommunalDevice`, `checkForUploadDocuments`, `checkForAdminUploadDocuments`) VALUES
(1, '2015-06-15 07:22:44', '2015-06-16 09:26:23', 4, 1, 'govind', 'PRUKP60985', 5, 1, 'ajfj', '4', 'afjj', '4', '4', 'asfaj', 'iiek', 'k', 'k', NULL, 'k', NULL, 'k', 'k', 'kk', 'j', 'j', 'j', 'j', 'j', 'on', 'sfkk', NULL, '9', '44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2015-06-15 07:27:23', NULL, 4, NULL, 'kamljeet', 'PRUKP61084', 6, 1, 'sfjj', '3', 'SJJ', 'SFJ', 'SDFJ', '474747', 'RII', 'L', '38388888888', NULL, 'J', NULL, 'J', 'J', 'J', NULL, 'JJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2015-06-15 07:30:04', '2015-06-19 06:10:19', 4, 1, 'Mohan', 'PRUKP61183', 5, 1, 'flat', '688883', 'uujwu', '6', '7', 'jjhujhj', 'pl', 'l', 'l', NULL, 'll', NULL, 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', NULL, NULL, NULL, 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2015-06-15 08:19:16', '2015-06-19 06:09:37', 4, NULL, 'keshav', 'PRUKP61282', 6, 1, 'single ', '7788788', 'jjj', 'jjj', '77', 'jjjj', 'l', 'l', 'll', NULL, NULL, NULL, NULL, 'l', 'l', 'll', NULL, 'll', 'l', 'l', NULL, NULL, NULL, 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2015-06-15 08:38:22', '2015-06-19 06:11:10', 4, NULL, 'Mohit', 'PRUKP61381', 6, 1, '388', '3883388', 'afjk', 'svj', '8', 'jsf', 'p', 'l', 'l', NULL, NULL, NULL, 'l', 'l', 'l', 'l', 'll', 'l', 'l', 'l', NULL, NULL, NULL, 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2015-06-15 08:44:09', '2015-06-19 06:10:55', 4, 1, 'puneet', 'PRUKP61480', 5, 1, 'afjaj', '3893388', 'asfj', '3', '38', 'asfjajfa', 'pp', 'l', 'll', NULL, 'l', NULL, 'l', NULL, 'l', 'l', 'l', 'l', 'l', 'l', NULL, NULL, NULL, 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2015-06-15 08:54:50', '2015-06-15 10:05:08', 4, 1, 'somil', 'PRUKP61579', 5, 1, 'flat', '7', 'yyyh', '5', '67', 'bhh', 'l', 'l', 'l', NULL, 'l', NULL, 'l', 'l', 'l', 'll', 'l', 'l', 'l', 'l', NULL, 'l', NULL, 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2015-06-15 09:03:52', '2015-06-16 10:05:20', 4, NULL, 'lalit', 'PRUKP61678', 6, 1, 'flat', '28828289', 'jjuju', '8', '8', 'jjjhhh', 'rtyr', 'kk', NULL, NULL, 'k', NULL, 'kk', 'kk', 'k', 'k', 'kk', 'k', 'kk', 'k', NULL, NULL, NULL, 'kk', 'k', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2015-06-15 12:45:18', '2015-06-25 11:41:01', 26, 1, 'johncarter', 'PRUKP62371', 5, 3, 'own', 'TW11 8QY', 'generator', '12-02-2015', '12-06-2015', 'heloo', 'Yes', 'Yes', 'Yes', NULL, 'Yes', NULL, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', NULL, NULL, NULL, 'Yes', 'Yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2015-06-16 12:41:46', '2015-06-16 12:45:18', 30, 2, 'ted', 'PRUKP62767', 5, 4, 'own', '2', 'gen', '17-07-2014', '17-07-2015', 'hello', 'yes', 'yes', 'yes', NULL, 'yes', NULL, 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'on', 'yes', NULL, 'yes', 'yes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2015-06-17 06:35:37', '2015-06-19 06:20:35', 4, NULL, 'd', 'PRUKP62866', 6, 1, 'l', 'L', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2015-06-19 07:21:22', NULL, 4, NULL, 'l', 'PRUKP63064', 6, 1, 'l', 'l', 'l', NULL, 'l', 'l', 'l', 'l', 'l', NULL, 'l', NULL, 'l', 'l', 'l', 'll', 'l', 'l', 'l', 'l', NULL, 'll', NULL, 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2015-06-19 07:30:01', NULL, 4, NULL, 'l', 'PRUKP63163', 6, 1, 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'll', NULL, 'l', NULL, 'l', 'l', NULL, 'l', 'l', 'l', 'l', 'l', NULL, 'l', NULL, 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2015-06-19 07:43:27', NULL, 4, NULL, 'l', 'PRUKP63262', 6, 1, 'l', 'l', 'l', 'l', 'l', 'l', 'll', 'l', 'l', NULL, 'l', NULL, 'l', 'l', 'l', 'l', 'l', 'l', 'l', NULL, NULL, 'l', NULL, 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2015-06-19 08:17:34', NULL, 4, NULL, 'l', 'PRUKP63361', 6, 1, 'l', 'll', 'kl', 'll', 'l', 'll', 'l', 'l', 'l', NULL, 'll', NULL, NULL, 'l', 'l', 'll', NULL, 'll', 'l', 'l', NULL, 'l', NULL, 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2015-06-19 08:57:14', '2015-06-19 09:00:19', 4, NULL, 'l', 'PRUKP63460', 6, 1, 'l', 'L', 'l', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2015-06-19 09:04:39', NULL, 4, NULL, 't', 'PRUKP63559', 6, 1, 't', NULL, 't', 't', 't', 't', 'o', 'o', 'o', NULL, 'o', NULL, 'o', 'o', 'o', NULL, 'o', 'o', 'o', 'o', NULL, 'o', NULL, 'o', 'o', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2015-06-19 09:10:23', '2015-06-19 10:38:50', 4, NULL, 'k', 'PRUKP63658', 6, 1, 'k', 'K', 'k', 'k', 'k', 'kk', 'p', 'p', 'p', NULL, 'p', NULL, 'p', 'p', 'p', 'p', 'p', 'p', 'ppp', 'p', NULL, NULL, NULL, 'p', 'p', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '2015-06-19 13:00:03', NULL, 4, NULL, 'narayani', 'PRUKP63757', 6, 1, 'flat', '3', 'sfjj', '4', '3', 'afafj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2015-06-22 04:59:49', NULL, 4, NULL, 'prashant ', 'PRUKP63856', 6, 1, 'Flat ', '3', 'sfkskei', '4', '7', 'askfakf', 'p', 'p', 'p', NULL, 'p', NULL, 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', NULL, 'p', NULL, 'p', 'p', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2015-06-23 05:39:00', NULL, 4, NULL, 'pp', 'PRUKP64351', 6, 1, 'p', 'p', 'p', 'p', 'p', 'e', 'll', NULL, 'll', NULL, 'l', NULL, 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'on', 'l', NULL, 'l', 'd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '2015-06-23 06:02:35', NULL, 4, NULL, 'p', 'PRUKP64450', 6, 1, 'p', 'p', 'p', 'p', 'p', 'p', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2015-06-23 06:09:07', NULL, 4, NULL, 'poonam', 'PRUKP64549', 6, 1, 'flat', '7', 'ajfajj', '34', '4', 'afjafj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '2015-06-23 06:20:44', NULL, 4, NULL, 'pp', 'PRUKP64747', 6, 1, 'p', NULL, 'p', 'p', 'pp', 'p', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '2015-06-23 06:26:04', NULL, 4, NULL, 'p', 'PRUKP64846', 6, 1, 'p', 'p', 'p', NULL, 'p', 'p', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '2015-06-23 06:45:37', NULL, 4, NULL, 'l', 'PRUKP64945', 6, 1, 'l', 'l', 'l', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '2015-06-23 07:02:20', NULL, 4, NULL, 'l', 'PRUKP65044', 6, 1, 'l', NULL, 'l', 'l', 'l', 'l', 'fh', 'sg', 'asg', NULL, 'sg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '2015-06-23 07:06:41', NULL, 4, NULL, 'p', 'PRUKP65143', 6, 1, 'p', 'p', 'p', 'p', 'sf', 'p', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '2015-06-23 08:54:10', NULL, 4, NULL, 'l', 'PRUKP65242', 6, 1, 'll', 'l', 'l', 'l', 'l', 'v', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '2015-06-23 09:59:20', NULL, 4, NULL, 'p', 'PRUKP65341', 6, 1, NULL, 'p', 'p', 'p', 'p', 'p', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '2015-06-23 10:37:57', NULL, 4, NULL, 'l', 'PRUKP65440', 6, 1, NULL, 'll', NULL, 'l', 'll', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '2015-06-23 11:08:46', NULL, 4, NULL, 'l', 'PRUKP65539', 6, 1, 'll', 'l', 'l', 'l', 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '2015-06-23 12:07:53', '2015-06-23 12:41:19', 4, NULL, 'l', 'PRUKP65638', 6, 1, 'l', 'L', 'l', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'windows', 'UPVC external doors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '2015-06-23 12:41:46', '2015-06-23 12:42:59', 4, NULL, 'l', 'PRUKP65737', 6, 1, 'l', 'L', 'l', 'll', 'l', 'l', 'p', 'p', 'pp', NULL, 'p', 'true', 'p', 'p', 'pp', 'p', 'pp', 'p', 'p', 'pp', NULL, 'l', NULL, 'l', 'll', 'windows', 'UPVC external doors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, '2015-06-23 12:45:05', '2015-06-24 06:53:51', 4, NULL, 'mm', 'PRUKP65836', 6, 1, 'm', 'MM', 'm', 'm', 'm', 'm', 'j', 'gg', 'jkk', NULL, 'k', NULL, 'k', 'k', 'k', 'k', 'kk', 'k', 'kk', 'k', NULL, NULL, NULL, 'kk', 'k', 'windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '2015-06-23 12:53:29', '2015-06-24 09:48:43', 4, NULL, 'm', 'PRUKP65935', 6, 1, 'mm', '22222', 'm', '3', 'mm', 'm', 'o', 'oo', 'o', NULL, 'o', 'true', 'oo', 'o', 'o', 'oo', 'o', 'oo', 'o', 'oo', NULL, 'o', NULL, 'o', 'o', 'windows', 'UPVC external doors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '2015-06-23 13:28:48', '2015-06-24 05:32:32', 4, NULL, 'KK', 'PRUKP66034', 6, 1, 'K', 'K', 'K', 'K', 'K', 'K', 'IO', 'K', 'L', NULL, 'L', 'true', 'L', NULL, 'L', 'LL', 'L', 'LL', 'L', 'L', NULL, 'LL', NULL, 'L', 'LL', 'windows', NULL, NULL, NULL, NULL, 'Painted/varnished ', NULL, NULL, NULL, NULL, NULL),
(38, '2015-06-24 06:06:21', '2015-06-25 07:25:23', 4, NULL, 'pppp', 'PRUKP66133', 6, 1, 'asjj', '49949', 'ssjg', '5', '15', 'agkas', 'y', 'o', 'p', NULL, 'p', 'true', 'p', 'p', 'pp', 'p', NULL, 'p', 'p', 'p', 'on', NULL, NULL, 'sf', 'sf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '2015-06-24 06:15:37', '2015-06-24 10:19:12', 4, NULL, 'skfk', 'PRUKP66232', 6, 1, 'kk', '363636', 'k', 'k', 'k', 'k', 'l', 'l', 'l', NULL, 'l', 'true', 'l', NULL, 'l', 'l', 'l', 'l', 'l', 'l', 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '2015-06-24 09:42:13', '2015-06-24 10:11:20', 4, NULL, 'd', 'PRUKP66331', 6, 1, 'l', 'L', 'l', NULL, 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '2015-06-24 09:49:01', '2015-06-24 10:11:03', 4, NULL, 'm', 'PRUKP66430', 6, 1, 'mm', 'M', 'm', NULL, 'm', 'm', 'l', 'l', 'l', NULL, 'l', NULL, 'j', 'jj', 'j', 'j', 'j', 'j', 'j', 'j', NULL, NULL, NULL, 'j', 'j', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(42, '2015-06-24 09:57:28', NULL, 4, NULL, 'l', 'PRUKP66529', 6, 1, NULL, 'l', 'l', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '2015-06-24 10:09:57', NULL, 4, NULL, 'kl', 'PRUKP66628', 6, 1, 'k', 'k', 'k', NULL, 'kk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '2015-06-24 10:12:39', NULL, 4, NULL, 'm', 'PRUKP66727', 6, 1, 'm', 'm', 'm', 'm', 'm', 'm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, '2015-06-24 10:40:23', NULL, 4, NULL, 'l', 'PRUKP66826', 6, 1, 'l', 'l', 'l', 'l', 'cf', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, '2015-06-24 10:46:57', '2015-06-24 11:05:45', 4, NULL, 'l', 'PRUKP66925', 6, 1, 'l', '5', 'l', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '2015-06-24 11:13:10', NULL, 4, NULL, 'yjhy', 'PRUKP67024', 6, 1, 'f', 'f', 'f', 'f', 'f', 'f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '2015-06-24 11:22:38', NULL, 4, NULL, 'l', 'PRUKP67123', 6, 1, 'l', 'll', 'l', 'll', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, '2015-06-24 11:26:35', NULL, 4, NULL, 'mkkk', 'PRUKP67222', 6, 1, 'k', 'k', 'k', 'k', 'k', 'k', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, '2015-06-24 11:34:00', '2015-06-24 12:24:08', 4, NULL, 'p', 'PRUKP67321', 6, 1, 'pp', 'P', 'p', 'p', 'p', 'p', 'll', 'l', 'l', NULL, 'l', 'false', 'l', 'l', 'l', 'l', NULL, 'll', NULL, 'll', NULL, 'l', NULL, 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, '2015-06-24 12:01:10', '2015-06-24 12:23:59', 4, NULL, 'jk', 'PRUKP67420', 6, 1, 'kk', 'K', 'k', 'kk', 'k', 'k', 'l', 'l', 'l', NULL, 'l', NULL, 'l', 'l', 'll', 'l', 'l', 'l', 'll', 'l', NULL, 'l', NULL, 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, '2015-06-24 12:08:00', '2015-06-24 12:23:50', 4, NULL, 'P', 'PRUKP67519', 6, 1, 'P', 'P', 'P', 'P', 'P', 'P', 'Y', 'Y', 'Y', NULL, 'Y', 'true', NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, '2015-06-25 05:44:39', '2015-06-25 07:26:45', 4, NULL, 'l', 'PRUKP67618', 6, 1, 'l', 'L', 'l', 'l', 'l', 'l', 'l', 'l', 'l', NULL, 'll', 'false', 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'll', 'true', 'l', NULL, 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, '2015-06-25 05:47:29', '2015-06-25 05:49:12', 4, NULL, 'K', 'PRUKP67717', 6, 1, 'K', 'K', 'K', 'K', 'K', 'K', NULL, 'KK', 'K', NULL, 'K', NULL, 'K', 'K', 'K', 'K', 'KK', 'K', 'K', 'K', 'true', 'K', NULL, 'K', 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, '2015-06-25 05:49:34', '2015-06-25 06:23:06', 4, NULL, 'k', 'PRUKP67816', 6, 1, 'k', 'K', 'k', 'k', 'k', 'k', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, '2015-06-25 06:40:21', '2015-06-25 06:41:20', 4, NULL, 'k', 'PRUKP67915', 6, 1, 'c', 'KK', 'k', 'kkk', 'k', 'k', NULL, 'j', 'j', NULL, 'j', NULL, 'j', 'j', 'j', 'j', 'jj', 'j', 'jj', 'j', NULL, 'j', 'false', 'jj', 'j', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, '2015-06-25 06:43:51', NULL, 4, NULL, 'm', 'PRUKP68014', 6, 1, 'm', 'm', 'm', 'm', 'm', 'm', 'l', 'l', 'l', NULL, 'l', 'true', 'l', 'l', 'l', 'll', 'l', 'll', 'l', 'll', 'true', 'll', 'false', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(58, '2015-06-25 06:54:09', NULL, 4, NULL, 'k', 'PRUKP68113', 6, 1, 'k', 'k', 'k', 'k', 'k', 'k', 'l', 'l', 'l', NULL, 'll', NULL, 'l', 'l', 'l', 'l', 'l', 'l', 'l', 'l', NULL, 'l', 'false', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(59, '2015-06-25 07:03:45', '2015-06-25 07:31:09', 4, NULL, 'm', 'PRUKP68212', 6, 1, 'd', 'M', 'm', NULL, 'mm', 'mm', 'l', 'll', 'l', NULL, 'l', 'false', 'l', 'l', NULL, 'l', 'l', 'll', 'l', 'l', 'false', 'l', 'false', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, '2015-06-25 07:15:16', '2015-06-25 07:24:54', 4, NULL, 'l', 'PRUKP68311', 6, 1, NULL, 'LL', 'll', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, '2015-06-25 07:19:54', '2015-06-25 07:24:12', 4, NULL, 'l', 'PRUKP68410', 6, 1, 'l', 'L', 'l', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, '2015-06-25 07:28:01', '2015-07-01 09:31:04', 4, NULL, 'x', 'PRUKP68509', 6, 1, NULL, 'L', 'l', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, '2015-06-25 07:30:56', NULL, 4, NULL, 'l', 'PRUKP68608', 6, 1, 'lll', 'l', 'l', 'l', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, '2015-06-25 07:31:40', '2015-06-25 08:45:15', 4, NULL, 'k', 'PRUKP68707', 6, 1, 'k', 'K', 'k', 'k', NULL, 'kk', 'l', 'l', 'l', NULL, 'l', NULL, 'l', 'l', 'l', 'l', 'll', 'l', 'lll', 'l', 'true', 'll', NULL, 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, '2015-06-25 07:34:44', '2015-06-25 08:44:23', 4, NULL, 'sfjj', 'PRUKP68806', 6, 1, 'jdfj', '838388', '8', '3', '3', 'afj', 'l', 'l', 'll', NULL, 'l', 'false', 'l', 'l', 'l', 'l', 'll', 'l', 'l', 'l', 'true', 'll', 'false', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, '2015-06-25 08:22:52', '2015-06-25 08:44:08', 4, NULL, 'l', 'PRUKP68905', 6, 1, 'l', 'L', 'l', 'l', 'll', 's', NULL, 'll', NULL, NULL, 'll', 'true', 'l', 'l', 'l', 'll', 'l', 'll', 'll', 'l', NULL, NULL, 'true', 'l', 'l', 'windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, '2015-06-25 08:46:08', '2015-07-01 03:31:43', 4, NULL, 'as', 'PRUKP69004', 6, 1, 'l', 'L', NULL, 'll', NULL, 'll', 'uiui', 'tui', '98999999999', NULL, 'uiou', 'true', 'ds', 'dddddddddd', 'ddddddd', 'dddddd', 'dddddddd', 'ddddd', 'dddddddddd', 'ddddddd', 'true', 'ddddddd', 'true', 'dddddddd', 'ddddddddd', 'windows', 'UPVC external doors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, '2015-06-25 08:48:20', '2015-07-01 09:21:34', 4, NULL, 'l', 'PRUKP69103', 6, 1, 'lll', 'L', 'll', 'l', 'l', 'll', 'uiiu', 'io', '898908908908', NULL, 'iuoiu', 'true', 'uoiu', 'oiu', 'oiu', 'oiu', 'oiu', 'oiu', 'oiu', 'oiu', 'true', 'dsfvsd', 'true', 'svadvsa', 'sadvsd', 'windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Outdoor communal space', '1', NULL),
(69, '2015-06-25 08:49:40', '2015-06-25 08:50:20', 4, NULL, 'l', 'PRUKP69202', 6, 1, 'll', 'L', 'll', 'l', 'l', 'd', 'l', 'l', 'l', NULL, 'l', 'false', 'l', 'l', 'l', 'l', 'll', 'l', 'l', 'l', 'true', 'll', NULL, 'l', 'll', 'windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, '2015-06-25 08:53:00', '2015-06-25 08:53:40', 4, NULL, 'x', 'PRUKP69301', 6, 1, 'g', 'G', 'g', 'g', 'g', 'g', 'n', 'n', 'nn', NULL, 'n', 'false', 'n', 'n', 'nn', 'nn', 'n', 'n', 'nn', 'n', 'true', 'nn', NULL, 'nn', 'n', 'windows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '2015-06-25 09:30:42', NULL, 4, NULL, 'l', 'PRUKP69400', 6, 1, 'l', 'l', 'l', 'll', 'l', 'l', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, '2015-06-25 10:19:28', '2015-06-25 10:25:39', 4, NULL, 'l', 'PRUKP69499', 6, 1, 'l', 'L', 'll', 'l', 'l', 'll', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'windows', 'UPVC external doors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(73, '2015-06-25 10:26:11', '2015-06-25 10:26:56', 4, NULL, 'k', 'PRUKP69598', 6, 1, 'k', 'K', 'k', 'k', 'k', 'k', 'h', 'h', 'hj', NULL, 'j', NULL, 'j', 'j', 'jj', 'j', 'j', 'j', 'j', 'j', NULL, 'j', NULL, 'jj', 'j', 'windows', 'UPVC external doors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '2015-06-25 10:33:19', '2015-07-01 03:16:28', 4, NULL, 'l', 'PRUKP69697', 6, 1, 'l', 'L', 'l', 'l', 'l', 'l', 'j', 'j', '0999999999999', NULL, 'j', 'true', 'j', 'j', 'j', 'j', '333333333333', 'j', 'j', 'j', 'true', 'j', 'false', 'j', 'j', 'windows', NULL, NULL, NULL, 'Toilet facilities', NULL, NULL, NULL, NULL, NULL, NULL),
(75, '2015-06-25 10:41:05', '2015-06-25 10:41:55', 4, NULL, 'l', 'PRUKP69796', 6, 1, 'l', 'L', 'l', 'll', 'l', 'l', 'l', 'll', 'l', NULL, NULL, 'false', 'll', NULL, 'l', 'l', 'll', 'l', 'll', 'l', 'true', 'l', 'true', 'l', 'l', 'windows', NULL, NULL, NULL, NULL, 'Painted', NULL, 'Carpeted throughout', NULL, NULL, NULL),
(76, '2015-06-25 10:42:41', '2015-06-25 10:43:34', 4, NULL, 'l', 'PRUKP69895', 6, 1, 'll', 'L', 'l', 'l', 'l', 'll', 'l', 'l', 'll', NULL, 'l', 'false', 'l', 'l', 'l', 'll', 'l', 'l', 'll', 'l', 'true', 'll', 'true', 'l', 'l', 'windows', 'UPVC external doors', 'Solid wood internal doors', 'Kitchen facilities', 'Toilet facilities', 'Painted', 'Walls in contemporary colours', 'Carpeted throughout', 'Outdoor communal space', NULL, NULL),
(77, '2015-06-25 11:01:43', '2015-07-01 12:38:56', 4, NULL, 'h', 'PRUKP69994', 6, 1, 'h', 'HH', 'h', 'h', 'h', 'h', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '2015-06-25 11:25:56', '2015-06-25 11:26:49', 26, NULL, 'l', 'PRUKP70093', 6, 3, 'l', 'L', 'll', 'l', 'll', 'l', 'l', 'l', 'l', NULL, 'll', 'false', 'll', 'll', 'l', 'll', 'l', 'll', 'l', 'll', 'false', 'dgdgdg', NULL, 'll', 'l', 'windows', 'UPVC external doors', NULL, NULL, NULL, NULL, NULL, NULL, 'Outdoor communal space', NULL, NULL),
(79, '2015-06-25 11:31:26', '2015-06-29 14:19:39', 26, 1, 'johncarters', 'PRUKP70192', 5, 3, 'own', '38928392', 'Yes', '12-09-2010', '12-12-2010', 'hello', 'eeeeeee', 'l', '0823782732783', NULL, 'fgjhg', 'false', 'l', 'll', 'l', 'll', 'l', 'll', 'l', 'll', 'false', 'seeee4', 'false', 'seee3', 'see2', 'windows', 'UPVC external doors', 'Solid wood internal doors', 'Kitchen facilities', NULL, NULL, NULL, NULL, 'Outdoor communal space', NULL, NULL),
(80, '2015-06-25 11:51:11', '2015-06-25 13:17:42', 26, NULL, 'sfs', 'PRUKP70291', 6, 3, 'l', 'SF', 'l', 'l', 'll', 'dg', 'l', 'l', 'l', NULL, 'l', NULL, 'l', 'l', 'll', 'l', 'lll', 'l', 'l', 'l', NULL, 'l', NULL, 'l', 'l', 'windows', 'UPVC external doors', NULL, NULL, NULL, NULL, NULL, NULL, 'Outdoor communal space', NULL, NULL),
(81, '2015-06-25 11:56:28', '2015-07-01 10:01:21', 4, NULL, 'l', 'PRUKP70390', 6, 1, 'l', 'LL', 'l', 'l', 'll', 'l', '333', 'l', '3333333333333', NULL, 'l', 'true', 'l', 'll', 'l', 'll', 'l', 'll', 'l', 'll', 'true', 'sadasd', 'true', 's', 's', NULL, NULL, NULL, 'Kitchen facilities', 'Toilet facilities', NULL, NULL, NULL, 'Outdoor communal space', '1', NULL),
(82, '2015-06-25 12:22:04', '2015-06-29 11:40:04', 4, NULL, 'l', 'PRUKP70489', 6, 1, 'll', '34355', 'l', 'lll', 'll', 'l', 'a', 'a', 'a', NULL, 'a', NULL, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', NULL, 'a', NULL, 'a', 'a', 'windows', 'UPVC external doors', 'Solid wood internal doors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, '2015-06-27 11:04:51', '2015-07-01 09:31:21', 4, NULL, 'keshava', 'PRUKP70588', 6, 1, 'l', '4848848', 'l', 'll', NULL, 'll', 'lu8ji', 'loki,o,k', '2222222222', NULL, 'SFJSJ', 'true', 'SFKSK', 'SFKSKJ', 'ASFJ', 'SFJ', 'ADFJ', 'ADHJ', 'ADJ', '222222222', 'true', '222222222', 'true', 'ADJA', '222222222222', 'windows', NULL, 'Solid wood internal doors', NULL, 'Toilet facilities', NULL, NULL, NULL, NULL, '1', '1'),
(84, '2015-06-30 05:13:16', '2015-07-02 09:16:12', 4, NULL, 'sfh', 'PRUKP70885', 6, 1, 'afj', '8944889', NULL, NULL, NULL, NULL, 'h', 'h', '77777777777777', NULL, 'h', 'true', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'h', 'true', 'h', 'true', 'h', 'h', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL),
(85, '2015-07-01 09:39:14', '2015-07-01 12:36:44', 4, NULL, 'yutyut', 'PRUKP70984', 6, 1, 'yut', 'UYT', 'uyt', 'uyt', 'uyt', 'uti', 'g', 'uyg', '11111111111', NULL, 'gu', 'true', 'jg', 'jg', 'jg', 'jg', 'jg', 'kjg', 'kjg', 'kjgh', 'true', 'xxxxxxxxxx', 'false', 'xxxxxx', 'xxxxxxx', 'windows', 'UPVC external doors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_perpetualcity`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_perpetualcity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`city`),
  UNIQUE KEY `city_UNIQUE` (`city`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=331 ;

--
-- Dumping data for table `tbl_perpetualrents_perpetualcity`
--

INSERT INTO `tbl_perpetualrents_perpetualcity` (`id`, `city`) VALUES
(327, 'aaaaaaa'),
(1, 'Adur'),
(2, 'Allerdale'),
(3, 'Amber Valley'),
(4, 'Arun'),
(5, 'Ashfield'),
(6, 'Ashford'),
(7, 'Aylesbury Vale'),
(8, 'Babergh'),
(9, 'Barking and Dagenham'),
(10, 'Barnet'),
(11, 'Barnsley'),
(12, 'Barrow-in-Furness'),
(13, 'Basildon'),
(14, 'Basingstoke and Deane'),
(15, 'Bassetlaw'),
(16, 'Bath and North East Somerset'),
(17, 'Bedford'),
(18, 'Bexley'),
(19, 'Birmingham'),
(20, 'Blaby'),
(21, 'Blackburn with Darwen'),
(22, 'Blackpool'),
(23, 'Bolsover'),
(24, 'Bolton'),
(25, 'Boston'),
(26, 'Bournemouth'),
(27, 'Bracknell Forest'),
(28, 'Bradford'),
(29, 'Braintree'),
(30, 'Breckland'),
(31, 'Brent'),
(32, 'Brentwood'),
(33, 'Brighton and Hove'),
(34, 'Bristol'),
(35, 'Broadland'),
(36, 'Bromley'),
(37, 'Bromsgrove'),
(38, 'Broxbourne'),
(39, 'Broxtowe'),
(40, 'Burnley'),
(41, 'Bury'),
(42, 'Calderdale'),
(43, 'Cambridge'),
(44, 'Camden'),
(45, 'Cannock Chase'),
(46, 'Canterbury'),
(47, 'Carlisle'),
(48, 'Castle Point'),
(49, 'Central Bedfordshire'),
(50, 'Charnwood'),
(51, 'Chelmsford'),
(52, 'Cheltenham'),
(53, 'Cherwell'),
(54, 'Cheshire East'),
(55, 'Cheshire West and Chester'),
(56, 'Chesterfield'),
(57, 'Chichester'),
(58, 'Chiltern'),
(59, 'Chorley'),
(60, 'Christchurch'),
(61, 'City of London'),
(62, 'Colchester'),
(63, 'Copeland'),
(64, 'Corby'),
(65, 'Cornwall'),
(66, 'Cotswold'),
(67, 'Coventry'),
(68, 'Craven'),
(69, 'Crawley'),
(70, 'Croydon'),
(71, 'Dacorum'),
(72, 'Darlington'),
(73, 'Dartford'),
(74, 'Daventry'),
(75, 'Derby'),
(76, 'Derbyshire Dales'),
(77, 'Doncaster'),
(78, 'Dover'),
(79, 'Dudley'),
(80, 'Durham'),
(81, 'Ealing'),
(82, 'East Cambridgeshire'),
(83, 'East Devon'),
(84, 'East Dorset'),
(85, 'East Hampshire'),
(86, 'East Hertfordshire'),
(87, 'East Lindsey'),
(88, 'East Northamptonshire'),
(89, 'East Riding of Yorkshire'),
(90, 'East Staffordshire'),
(91, 'Eastbourne'),
(92, 'Eastleigh'),
(93, 'Eden'),
(94, 'Elmbridge'),
(95, 'Enfield'),
(96, 'Epping Forest'),
(97, 'Epsom and Ewell'),
(98, 'Erewash'),
(99, 'Exeter'),
(100, 'Fareham'),
(101, 'Fenland'),
(102, 'Forest Heath'),
(103, 'Forest of Dean'),
(104, 'Fylde'),
(105, 'Gateshead'),
(106, 'Gedling'),
(107, 'Gloucester'),
(108, 'Gosport'),
(109, 'Gravesham'),
(110, 'Great Yarmouth'),
(111, 'Greenwich'),
(112, 'Guildford'),
(113, 'Hackney'),
(114, 'Halton'),
(115, 'Hambleton'),
(116, 'Hammersmith and Fulham'),
(117, 'Harborough'),
(118, 'Haringey'),
(119, 'Harlow'),
(120, 'Harrogate'),
(121, 'Harrow'),
(122, 'Hart'),
(123, 'Hartlepool'),
(124, 'Hastings'),
(125, 'Havant'),
(126, 'Havering'),
(127, 'Herefordshire'),
(128, 'Hertsmere'),
(129, 'High Peak'),
(130, 'Hillingdon'),
(131, 'Hinckley and Bosworth'),
(132, 'Horsham'),
(133, 'Hounslow'),
(134, 'Huntingdonshire'),
(135, 'Hyndburn'),
(136, 'Ipswich'),
(137, 'Isle of Wight'),
(138, 'Isles of Scilly'),
(139, 'Islington'),
(140, 'Kensington and Chelsea'),
(141, 'Kettering'),
(142, 'King''s Lynn and West Norfolk'),
(143, 'Kingston upon Hull'),
(144, 'Kingston upon Thames'),
(145, 'Kirklees'),
(146, 'Knowsley'),
(147, 'Lambeth'),
(148, 'Lancaster'),
(149, 'Leeds'),
(150, 'Leicester'),
(151, 'Lewes'),
(152, 'Lewisham'),
(153, 'Lichfield'),
(154, 'Lincoln'),
(155, 'Liverpool'),
(329, 'london'),
(156, 'Luton'),
(157, 'Maidstone'),
(158, 'Maldon'),
(159, 'Malvern Hills'),
(160, 'Manchester'),
(161, 'Mansfield'),
(162, 'Medway'),
(163, 'Melton'),
(164, 'Mendip'),
(165, 'Merton'),
(166, 'Mid Devon'),
(167, 'Mid Suffolk'),
(168, 'Mid Sussex'),
(169, 'Middlesbrough'),
(170, 'Milton Keynes'),
(171, 'Mole Valley'),
(172, 'New Forest'),
(173, 'Newark and Sherwood'),
(174, 'Newcastle upon Tyne'),
(175, 'Newcastle-under-Lyme'),
(176, 'Newham'),
(330, 'noida'),
(177, 'North Devon'),
(178, 'North Dorset'),
(179, 'North East Derbyshire'),
(180, 'North East Lincolnshire'),
(181, 'North Hertfordshire'),
(182, 'North Kesteven'),
(183, 'North Lincolnshire'),
(184, 'North Norfolk'),
(185, 'North Somerset'),
(186, 'North Tyneside'),
(187, 'North Warwickshire'),
(188, 'North West Leicestershire'),
(189, 'Northampton'),
(190, 'Northumberland'),
(191, 'Norwich'),
(192, 'Nottingham'),
(193, 'Nuneaton and Bedworth'),
(194, 'Oadby and Wigston'),
(195, 'Oldham'),
(196, 'Oxford'),
(328, 'Panipat'),
(197, 'Pendle'),
(198, 'Peterborough'),
(199, 'Plymouth'),
(200, 'Poole'),
(201, 'Portsmouth'),
(202, 'Preston'),
(203, 'Purbeck'),
(204, 'Reading'),
(205, 'Redbridge'),
(206, 'Redcar and Cleveland'),
(207, 'Redditch'),
(208, 'Reigate and Banstead'),
(209, 'Ribble Valley'),
(210, 'Richmond upon Thames'),
(211, 'Richmondshire'),
(212, 'Rochdale'),
(213, 'Rochford'),
(214, 'Rossendale'),
(215, 'Rother'),
(216, 'Rotherham'),
(217, 'Rugby'),
(218, 'Runnymede'),
(219, 'Rushcliffe'),
(220, 'Rushmoor'),
(221, 'Rutland'),
(222, 'Ryedale'),
(223, 'Salford'),
(224, 'Sandwell'),
(225, 'Scarborough'),
(226, 'Sedgemoor'),
(227, 'Sefton'),
(228, 'Selby'),
(229, 'Sevenoaks'),
(230, 'Sheffield'),
(231, 'Shepway'),
(232, 'Shropshire'),
(233, 'Slough'),
(234, 'Solihull'),
(235, 'South Buckinghamshire'),
(236, 'South Cambridgeshire'),
(237, 'South Derbyshire'),
(238, 'South Gloucestershire'),
(239, 'South Hams'),
(240, 'South Holland'),
(241, 'South Kesteven'),
(242, 'South Lakeland'),
(243, 'South Norfolk'),
(244, 'South Northamptonshire'),
(245, 'South Oxfordshire'),
(246, 'South Ribble'),
(247, 'South Somerset'),
(248, 'South Staffordshire'),
(249, 'South Tyneside'),
(250, 'Southampton'),
(251, 'Southend-on-Sea'),
(252, 'Southwark'),
(253, 'Spelthorne'),
(254, 'St Albans'),
(255, 'St Edmundsbury'),
(256, 'St. Helens'),
(257, 'Stafford'),
(258, 'Staffordshire Moorlands'),
(259, 'Stevenage'),
(260, 'Stockport'),
(261, 'Stockton-on-Tees'),
(262, 'Stoke-on-trent'),
(263, 'Stratford-on-Avon'),
(264, 'Stroud'),
(265, 'Suffolk Coastal'),
(266, 'Sunderland'),
(267, 'Surrey Heath'),
(268, 'Sutton'),
(269, 'Swale'),
(270, 'Swindon'),
(271, 'Tameside'),
(272, 'Tamworth'),
(273, 'Tandridge'),
(274, 'Taunton Deane'),
(275, 'Teignbridge'),
(276, 'Telford and Wrekin'),
(277, 'Tendring'),
(278, 'Test Valley'),
(279, 'Tewkesbury'),
(280, 'Thanet'),
(281, 'Three Rivers'),
(282, 'Thurrock'),
(283, 'Tonbridge and Malling'),
(284, 'Torbay'),
(285, 'Torridge'),
(286, 'Tower Hamlets'),
(287, 'Trafford'),
(288, 'Tunbridge Wells'),
(289, 'Uttlesford'),
(290, 'Vale of White Horse'),
(291, 'Wakefield'),
(292, 'Walsall'),
(293, 'Waltham Forest'),
(294, 'Wandsworth'),
(295, 'Warrington'),
(296, 'Warwick'),
(297, 'Watford'),
(298, 'Waveney'),
(299, 'Waverley'),
(300, 'Wealden'),
(301, 'Wellingborough'),
(302, 'Welwyn Hatfield'),
(303, 'West Berkshire'),
(304, 'West Devon'),
(305, 'West Dorset'),
(306, 'West Lancashire'),
(307, 'West Lindsey'),
(308, 'West Oxfordshire'),
(309, 'West Somerset'),
(310, 'Westminster'),
(311, 'Weymouth and Portland'),
(312, 'Wigan'),
(313, 'Wiltshire'),
(314, 'Winchester'),
(315, 'Windsor and Maidenhead'),
(316, 'Wirral'),
(317, 'Woking'),
(318, 'Wokingham'),
(319, 'Wolverhampton'),
(320, 'Worcester'),
(321, 'Worthing'),
(322, 'Wychavon'),
(323, 'Wycombe'),
(324, 'Wyre'),
(325, 'Wyre Forest'),
(326, 'York');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_property`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `contactPerson` varchar(255) NOT NULL,
  `agentName` varchar(255) DEFAULT NULL,
  `agentContactNumber` varchar(255) DEFAULT NULL,
  `agentAddressLine` varchar(255) DEFAULT NULL,
  `uniqueReference` varchar(255) NOT NULL,
  `statusPercentage` int(5) NOT NULL DEFAULT '0',
  `landlordID` int(11) NOT NULL,
  `enable` bit(1) DEFAULT b'1',
  `statusId` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tbl_perpetualrents_property`
--

INSERT INTO `tbl_perpetualrents_property` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `contactPerson`, `agentName`, `agentContactNumber`, `agentAddressLine`, `uniqueReference`, `statusPercentage`, `landlordID`, `enable`, `statusId`) VALUES
(1, '2015-06-15 09:26:52', '2015-06-15 09:35:11', 7, 1, 'Gopal', 'fjsfj', '833939939399', 'afj', 'PRUKP61777', 0, 1, b'1', 5),
(2, '2015-06-15 09:28:34', '2015-06-15 09:35:15', 7, 1, 'pooja', 'aj', '833939399399', 'afj', 'PRUKP61876', 0, 1, b'1', 5),
(3, '2015-06-15 09:32:20', '2015-06-15 09:35:19', 7, 1, 'pihu', 'afj', 'ajfaj', '399', 'PRUKP61975', 0, 1, b'1', 5),
(4, '2015-06-15 10:32:24', '2015-06-22 12:23:15', 7, 7, 'opan', 'hhyyh', '766755667776', 'hgghg', 'PRUKP62074', 0, 1, b'1', 6),
(5, '2015-06-15 10:37:26', NULL, 7, NULL, 'dkll', 'l', 'll', 'l', 'PRUKP62173', 0, 1, b'1', 6),
(6, '2015-06-15 10:57:56', NULL, 7, NULL, 'poonam', NULL, NULL, NULL, 'PRUKP62272', 0, 1, b'1', 6),
(7, '2015-06-16 10:48:45', '2015-06-16 11:02:31', 7, 7, 'lleee', 'asajjf', '3399393933883', 'afjj', 'PRUKP62470', 0, 1, b'1', 6),
(8, '2015-06-16 11:03:35', NULL, 7, NULL, 'kkkkk', NULL, NULL, NULL, 'PRUKP62569', 0, 1, b'1', 6),
(9, '2015-06-16 11:11:02', NULL, 7, NULL, 'ppeoo', NULL, NULL, NULL, 'PRUKP62668', 0, 1, b'1', 6),
(10, '2015-06-17 06:59:56', NULL, 7, NULL, 'mohan', 'sfk', '32525552552', 'afk', 'PRUKP62965', 0, 1, b'1', 6),
(11, '2015-06-22 12:13:18', NULL, 7, NULL, 'Punnet', 'KSDKFK', '39999499393', 'AFJJJ', 'PRUKP63955', 0, 1, b'1', 6),
(12, '2015-06-22 12:22:19', '2015-06-22 12:22:58', 7, 7, 'Mohit ', 'aieriei', '99849449949', 'eooeo', 'PRUKP64054', 0, 1, b'1', 6),
(13, '2015-06-22 12:39:32', NULL, 7, NULL, 'Lokendra', 'kkkl', '4949494949', 'oooo', 'PRUKP64153', 0, 1, b'1', 6),
(14, '2015-06-23 04:50:05', NULL, 7, NULL, 'Anant', 'sskfkek', '339934888393', 'skskkf', 'PRUKP64252', 0, 1, b'1', 6),
(15, '2015-06-23 06:16:57', '2015-06-27 13:24:53', 7, 7, 'p', 'p', 'p', 'p', 'PRUKP64648', 0, 1, b'1', 6),
(16, '2015-06-27 12:20:55', '2015-06-27 12:23:48', 29, 29, 'john', NULL, NULL, NULL, 'PRUKP70687', 0, 4, b'1', 6),
(17, '2015-06-27 13:19:37', '2015-06-27 13:25:37', 34, 34, 'john123', NULL, NULL, NULL, 'PRUKP70786', 0, 8, b'1', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_propertydeveloper`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_propertydeveloper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `uniqueReference` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `primaryEmailId` varchar(45) NOT NULL,
  `secondaryEmailId` varchar(45) DEFAULT NULL,
  `primaryPhoneNumber` varchar(45) NOT NULL,
  `secondaryPhoneNumber` varchar(45) DEFAULT NULL,
  `enable` bit(1) NOT NULL DEFAULT b'1',
  `userLoginId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueReference` (`uniqueReference`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_perpetualrents_propertydeveloper`
--

INSERT INTO `tbl_perpetualrents_propertydeveloper` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `uniqueReference`, `firstName`, `lastName`, `primaryEmailId`, `secondaryEmailId`, `primaryPhoneNumber`, `secondaryPhoneNumber`, `enable`, `userLoginId`) VALUES
(1, '2015-06-15 07:19:32', NULL, NULL, NULL, 'PRUKPD39930', 'komal', 'kumari', 'sunayana.kumari4@gmail.com', 'sfksfkk', '399393939393', '9339393939', b'1', 4),
(2, '2015-06-15 10:44:27', NULL, NULL, NULL, 'PRUKPD40128', 'johncarter', 'carter', 'johncarter222@gmail.com', NULL, '039823782323', NULL, b'1', 10),
(3, '2015-06-15 12:40:27', NULL, NULL, NULL, 'PRUKPD40326', 'johncarter', 'carter', 'johncarter4441@gmail.com', ' ', '0876856678876', ' ', b'1', 26),
(4, '2015-06-16 12:36:54', NULL, NULL, NULL, 'PRUKPD40524', 'ted', 'carter', 'ted@gmail.com', NULL, '028393894343', NULL, b'1', 30);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_propertydocumentdownloadstatus`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_propertydocumentdownloadstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `isFirstFileDownloaded` bit(1) DEFAULT b'0',
  `isSecondFileDownloaded` bit(1) DEFAULT b'0',
  `isThirdFileDownloaded` bit(1) DEFAULT b'0',
  `objectTypeId` varchar(45) NOT NULL,
  `objectId` varchar(45) NOT NULL,
  `propertyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `tbl_perpetualrents_propertydocumentdownloadstatus`
--

INSERT INTO `tbl_perpetualrents_propertydocumentdownloadstatus` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `isFirstFileDownloaded`, `isSecondFileDownloaded`, `isThirdFileDownloaded`, `objectTypeId`, `objectId`, `propertyId`) VALUES
(1, '2015-06-15 07:21:32', NULL, 4, NULL, b'1', b'1', b'0', '12', '1', 11),
(2, '2015-06-15 09:26:00', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(3, '2015-06-15 09:28:05', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(4, '2015-06-15 09:31:50', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(5, '2015-06-15 10:31:43', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(6, '2015-06-15 10:37:12', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(7, '2015-06-15 10:57:31', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(8, '2015-06-15 12:43:00', NULL, 26, NULL, b'1', b'1', b'0', '12', '3', 22),
(9, '2015-06-16 10:48:14', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(10, '2015-06-16 11:03:05', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(11, '2015-06-16 11:10:34', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(12, '2015-06-16 12:40:18', NULL, 30, NULL, b'1', b'1', b'0', '12', '4', 2),
(13, '2015-06-17 06:58:51', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(14, '2015-06-22 12:11:27', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(15, '2015-06-22 12:21:38', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(16, '2015-06-22 12:35:55', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(17, '2015-06-23 04:48:46', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(18, '2015-06-23 06:16:39', NULL, 7, NULL, b'1', b'1', b'1', '1', '1', 85),
(19, '2015-06-27 12:20:12', NULL, 29, NULL, b'1', b'1', b'1', '1', '4', 16),
(20, '2015-06-27 12:33:09', NULL, 4, NULL, b'1', b'1', b'0', '12', '1', NULL),
(21, '2015-06-27 13:18:38', NULL, 34, NULL, b'1', b'1', b'1', '1', '8', 17);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_propertymarketinginformation`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_propertymarketinginformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `availability` varchar(45) NOT NULL,
  `rentAmount` varchar(45) NOT NULL,
  `propertyType` varchar(45) NOT NULL,
  `propertyOtherType` varchar(45) DEFAULT NULL,
  `rentPeriod` varchar(45) NOT NULL,
  `bedroomCount` int(5) NOT NULL,
  `bathroomCount` int(5) NOT NULL,
  `seprateWC` int(5) NOT NULL,
  `furnished` bit(1) DEFAULT NULL,
  `flooring` bit(1) DEFAULT NULL,
  `flooringComments` varchar(999) DEFAULT NULL,
  `curtains` bit(1) DEFAULT NULL,
  `curtainsComments` varchar(999) DEFAULT NULL,
  `frontGarden` bit(1) DEFAULT NULL,
  `frontGardenComments` varchar(999) DEFAULT NULL,
  `rearGarden` bit(1) DEFAULT NULL,
  `rearGardenComments` varchar(999) DEFAULT NULL,
  `wheelChairAccess` bit(1) DEFAULT NULL,
  `wheelChairAccessComments` varchar(999) DEFAULT NULL,
  `extraStairs` bit(1) DEFAULT NULL,
  `extraStairsComments` varchar(255) DEFAULT NULL,
  `otherPropertyInformation` varchar(255) DEFAULT NULL,
  `propertyId` int(11) NOT NULL,
  `rentReasonComment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_perpetualrents_propertymarketinginformation`
--

INSERT INTO `tbl_perpetualrents_propertymarketinginformation` (`id`, `availability`, `rentAmount`, `propertyType`, `propertyOtherType`, `rentPeriod`, `bedroomCount`, `bathroomCount`, `seprateWC`, `furnished`, `flooring`, `flooringComments`, `curtains`, `curtainsComments`, `frontGarden`, `frontGardenComments`, `rearGarden`, `rearGardenComments`, `wheelChairAccess`, `wheelChairAccessComments`, `extraStairs`, `extraStairsComments`, `otherPropertyInformation`, `propertyId`, `rentReasonComment`) VALUES
(1, '11-JUN-2015', '70000', '4', '', '2', 8, 7, 6778, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 1, NULL),
(2, '19-JUN-2015', '44333', '4', '', '4', 4, 3, 2424, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 2, NULL),
(3, '05-JUN-2015', '30000', '3', '', '2', 8, 3, 3883, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 3, NULL),
(4, '12-JUN-2015', '8000', '3', '', '2', 5, 4, 23222, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 4, NULL),
(5, '05-JUN-2015', '60000', '4', 'sgsg', '4', 5, 4, 127, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 5, NULL),
(6, '10-JUN-2015', '90000', '4', '', '2', 3, 4, 221, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 6, NULL),
(7, '06-JUN-2015', '4444', '4', '', '5', 3, 3, 322, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 7, NULL),
(8, '06-JUN-2015', '44333', '3', '', '2', 3, 3, 363, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 8, NULL),
(9, '05-JUN-2015', '4444', '4', '', '4', 3, 3, 353, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 9, NULL),
(10, '12-JUN-2015', '70000', '3', '', '2', 3, 5, 244, b'0', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', b'0', '', NULL, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_propertyquestions`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_propertyquestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `fieldName` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `question` varchar(999) DEFAULT NULL,
  `documentSupported` bit(1) DEFAULT b'0',
  `affirmativeAns` bit(1) NOT NULL,
  `considerable` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldName` (`fieldName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `tbl_perpetualrents_propertyquestions`
--

INSERT INTO `tbl_perpetualrents_propertyquestions` (`id`, `groupId`, `fieldName`, `description`, `question`, `documentSupported`, `affirmativeAns`, `considerable`) VALUES
(1, 1, 'hmoLicence', NULL, 'The property is not a licensable HMO (please delete as appropriate)NB: A licensable HMO is a property that is three or more stories high and has\n Five or more people living in, it in more than one household and sharing amenities such as bathrooms, toilets and cooking facilities', b'0', b'1', b'1'),
(2, 1, 'licenceNumber', NULL, 'license number for the property', b'0', b'1', b'0'),
(3, 2, 'electricalInstallation', NULL, 'A satisfactory periodic inspection report for the fixed electrical installation in the property from a recognised inspection body', b'0', b'1', b'1'),
(4, 2, 'electricalTest', NULL, 'A satisfactory Electrical Test Certificate, obtained in the last five years for the fire alarm system (HMO / Bedsit only) from a recognised inspection body (i.e. NICEIC, ECA etc.)', b'0', b'1', b'1'),
(5, 2, 'gasCertificate', NULL, 'A satisfactory gas safety certificate- a new one will be required every year. And will be paid for by the landlord.', b'0', b'1', b'1'),
(6, 2, 'energyPerformance', NULL, 'A satisfactory Energy Performance Certificate (EPC band A - High D all other bands will need to be updated by 2018 or your property may be deemed as been uninhabitable thus been in breach of contract) for more information see website for details ', b'0', b'1', b'1'),
(7, 2, 'centralHeatingSystem', NULL, 'A satisfactory service contract for the central heating system (optional).', b'0', b'1', b'1'),
(8, 2, 'buildingInsaurance', NULL, 'A satisfactory Insurance Certificate / policy document for your building insurance (needed).', b'0', b'1', b'1'),
(9, 2, 'asbestosSurvey', NULL, 'Asbestos survey and any removal works', b'0', b'1', b'1'),
(10, 2, 'periodicInspectionOfWaterSupply', NULL, 'Periodic inspection of the water system, for example Legionella and any remedial works required to maintain a safe water supply', b'0', b'1', b'1'),
(11, 2, 'keySet', NULL, 'We need two set of key as the Charity or Charities will retain a set and so will Ashantidutch Property Letting,\n At the end of the scheme both sets of keys will be returned', b'0', b'1', b'1'),
(12, 2, 'landTitleRegisteryDocument', NULL, 'Please upload a copy of your land title registry document. The cost to property owners in 2014 was £3.00 you should have a copy or your solicitor should have a copy as part of the purchase process.', b'0', b'1', b'1'),
(13, 2, 'inventoryForProperty', NULL, 'Inventory for the property.', b'0', b'1', b'0'),
(14, 2, 'landlordInsauranceForContent', NULL, 'Landlords insurance for content.', b'0', b'1', b'0'),
(15, 2, 'windowAndDoorWarrantee', NULL, 'A Warrantee for the windows and doors.', b'0', b'1', b'0'),
(16, 2, 'dampPoofcourse', NULL, 'The Damp poof course.', b'0', b'1', b'0'),
(17, 2, 'fittedHobAndOven', NULL, 'Fitted Hob and oven to the Kitchen', b'0', b'1', b'0'),
(18, 2, 'electricShower', NULL, 'Electric shower', b'0', b'1', b'0'),
(19, 2, 'electricFires', NULL, 'Electric Fires', b'0', b'1', b'0'),
(20, 3, 'manualForCentralHeating', NULL, 'The central heating ?', b'0', b'1', b'0'),
(21, 3, 'timerForCentralHeating', NULL, 'Wall fixed timer for the central heating ?', b'0', b'1', b'0'),
(22, 3, 'manualForBoiler', NULL, 'Service manual for the boiler ?', b'0', b'1', b'0'),
(23, 3, 'manualForFittedOven', NULL, 'Service manual for fitted hob or oven ?', b'0', b'1', b'0'),
(24, 4, 'readAndUnderstandTerms', NULL, 'Local authorities are under a duty to take action in the case of category 1 hazards.\n If necessary (or if the owner/manager or tenant requests) the local authority may carry out any necessary remedial work themselves and reclaim the costs.\n They also have powers to take action in the case of all category 2 hazards (i.e. those which carry lower risks)', b'0', b'1', b'0'),
(25, 5, 'structurallyStable', NULL, 'Structurally Stable ', b'0', b'1', b'1'),
(26, 5, 'freeFromSeriousDisRepair', NULL, ' Free from Serious Disrepair     ', b'0', b'1', b'1'),
(27, 5, 'freeFromDampness', NULL, 'Free from dampness or mould growth ', b'0', b'1', b'1'),
(28, 5, 'insulation270mm', NULL, 'Loft insulation of minimum thickness 270mm ', b'0', b'1', b'1'),
(29, 5, 'installationDate', NULL, 'When the insulation was laid/installed ?', b'0', b'0', b'0'),
(30, 6, 'adequateHeating', NULL, 'Adequate heating Please indicate GCH, other', b'0', b'1', b'1'),
(31, 6, 'boilerAge', NULL, 'How old the boiler is ?', b'0', b'0', b'0'),
(32, 7, 'pollutants', NULL, 'Pollutants such as Asbestos, MMF fibres Carbon monoxide (and fuel combustion Products), Biocides, Volatile organic compounds found in paints, radiation & lead?', b'0', b'1', b'1'),
(33, 7, 'needRadonRiskReport', NULL, 'Does your property need a Radon risk Report?', b'0', b'1', b'1'),
(34, 8, 'propertyMeetStandards', NULL, 'Does the property meet all the standards as laid down under section A of the property standards guidance note?', b'0', b'1', b'1'),
(35, 8, 'whereITFails', NULL, ' If not; where does it fail?', b'0', b'1', b'0'),
(36, 8, 'upgradeProperty', NULL, 'Do you intend to upgrade the property to meet our specification and Decent Homes Standards?', b'0', b'1', b'1'),
(37, 8, 'workCompletedBy', NULL, 'If yes, when will this work be completed by? Please provide a schedule with task priorities. We can provided a template if needed.', b'0', b'1', b'0'),
(38, 9, 'adequateSizeandLayout', NULL, 'If applicable, adequate size and layout of common entrance areas for blocks of flats and if your accommodation is other than a flat then tick yes and please put a comment in the box.(e.g. must not have narrow access ways or steep stairs)', b'0', b'0', b'1'),
(39, 9, 'safeAgainstUnauthorizedEntry', NULL, 'Is the property safe against unauthorized entry so as to delay and deter intruders and make the occupants feel safer.', b'0', b'0', b'1'),
(40, 9, 'careTaker', NULL, 'Is there caretaker/entry phone system to block of flats', b'0', b'0', b'1'),
(41, 9, 'burglarAlarmSystem', NULL, 'Is there a burglar alarm systems', b'0', b'0', b'1'),
(42, 9, 'allWindowsHaveKeys', NULL, 'If lockable windows have been fitted do all of the windows have keys?', b'0', b'0', b'1'),
(43, 9, 'adequateLightening', NULL, 'Adequate lighting (natural and artificial)', b'0', b'0', b'1'),
(44, 9, 'adequateSecurityLightening', NULL, 'Is there adequate Security lighting and is it in working condition', b'0', b'0', b'1'),
(45, 9, 'externalLighteningAtNight', NULL, 'Is the property protected from intrusive artificial external lighting at night', b'0', b'0', b'1'),
(46, 9, 'complaintsAgainstNoise', NULL, 'Has there been complaints by your tenant or the neighbours in regard to excessive noise levels, Traffic/other external noise also considered', b'0', b'0', b'1'),
(47, 9, 'safeBarriersAgainstFire', NULL, 'Safe barriers against fires, flames and hot objects, (fire doors etc.) with means of escape', b'0', b'0', b'1'),
(48, 9, 'adequateNoiceInsulation', NULL, 'Is there adequate noise insulation as overlap of domestic noise between one dwelling and another (e.g. toilet flushing/television/conversation etc.)', b'0', b'0', b'1'),
(49, 10, 'kitchen', NULL, 'Kitchen floor should be reasonably smooth and impervious for easy cleaning thus maintaining a hygienic condition, joints between sink/drainer/worktop and adjacent wall should be sealed and water tight', b'0', b'1', b'1'),
(50, 10, 'adequateKitchenSpace', NULL, 'A kitchen with adequate space and layout (e.g. large enough to fit sink, cupboards, cooker, worktops', b'0', b'1', b'1'),
(51, 10, 'appropriatePowerSockets', NULL, 'At least four appropriate power sockets associated with the worktop(s) as well as two for general use.', b'0', b'1', b'1'),
(52, 10, 'facilitiesForPreparationOfFood', NULL, 'Satisfactory facilities for preparation and cooking of food with a sink and hot and cold water.', b'0', b'1', b'1'),
(53, 10, 'storageOfFood', NULL, 'Adequate provision and facilities for storage/preparation/cooking of food.', b'0', b'1', b'1'),
(54, 10, 'suitableVentilationOfKitchen', NULL, 'Adequate and appropriate lighting especially over the facilities; and Suitable ventilation of whole of kitchen area, especially the cooking area', b'0', b'1', b'1'),
(55, 10, 'suitableLocatedWashBasin', NULL, 'Suitably located bath or shower and wash-hand-basin all with hot and cold water with suitable active ventilation', b'0', b'1', b'1'),
(56, 10, 'drainageOfFoulWater', NULL, 'Effective drainage for foul-waste/surface-water ', b'0', b'1', b'1'),
(57, 10, 'appropriatelyLocatedBathroom', NULL, 'An appropriately located bathroom and WC (e.g. it isn’t accessed via a bedroom, located outside, or has no sink and is entered from kitchen)', b'0', b'1', b'1'),
(58, 10, 'drinkingWater', NULL, 'Water For drinking/cooking/washing/cleaning/sanitation', b'0', b'1', b'1'),
(59, 10, 'refuseStorage', NULL, 'Adequate facilities for refuse storage', b'0', b'1', b'1'),
(60, 11, 'riskOfFall', NULL, 'The risk of falls has been reduced when getting out of the bath/shower/similar facility, to mitigate falls on the same level, or from one level or room to another', b'0', b'1', b'1'),
(61, 11, 'adequateNaturalLightening', NULL, 'There is adequate natural lighting to the top and foot of the stairs', b'0', b'1', b'1'),
(62, 11, 'securedStepsAndRamps', NULL, 'That trip steps/thresholds/ramps are secured where the change in level is less than 300mm.', b'0', b'1', b'1'),
(63, 11, 'doorsDirection', NULL, 'That doors do not open directly onto stairs or the head of the stairs causing obstruction or increasing the likelihood of a fall.', b'0', b'1', b'1'),
(64, 11, 'moreThanOneFlightOfStairs', NULL, 'Do you have more than 1 flight of stairs in the property', b'0', b'1', b'1'),
(65, 11, 'buildingRegulation', NULL, 'Do all stairs comply with current building regulations i.e\nTread dimensions to be between 280mm and 360mm;\nRise dimensions to be between 100mm-180mm;\nPitch (angle of stairs) to be less than 42Ã‚Â°;\nStairs should be checked for above average steepness or shallowness;\nConsistency/uniformity in dimensions of rise and going within a flight (except for obvious change in direction of stair e.g. use of winders);\nNosing should not project more than 18mm beyond any riser;\nTreads and nosing should provide appropriate friction (carpet etc., if possible)\n', b'0', b'1', b'1'),
(66, 11, 'spaceAccessedViaFlightOfStairs', NULL, 'what space is accessed via the non compliant flight of stairs', b'0', b'0', b'0'),
(67, 11, 'buildingRegulationDate', NULL, 'Upto Which date will this work get done ?', b'0', b'0', b'0'),
(68, 11, 'electricalWiringStandards', NULL, 'Electrical wiring installation meets the latest requirements of Institution of Electrical Engineers/British Standard (BS 7671)', b'0', b'1', b'1'),
(69, 11, 'trappingBodyParts', NULL, 'Are reduced threats of trapping body parts (e.g. fingers/limbs) in architectural features(e.g. doors/windows).', b'0', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_propertyresponse`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_propertyresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `propertyId` int(11) NOT NULL,
  `questionId` int(11) DEFAULT NULL,
  `fieldName` varchar(45) NOT NULL,
  `response` varchar(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `documentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupId` (`questionId`,`fieldName`,`propertyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

--
-- Dumping data for table `tbl_perpetualrents_propertyresponse`
--

INSERT INTO `tbl_perpetualrents_propertyresponse` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `propertyId`, `questionId`, `fieldName`, `response`, `comments`, `documentId`) VALUES
(1, '2015-06-15 10:32:36', NULL, 7, NULL, 4, 1, 'hmoLicence', NULL, NULL, NULL),
(2, '2015-06-15 10:32:36', NULL, 7, NULL, 4, 2, 'licenceNumber', NULL, '', NULL),
(3, '2015-06-15 10:32:36', NULL, 7, NULL, 4, 3, 'electricalInstallation', 'false', NULL, NULL),
(4, '2015-06-15 10:32:36', NULL, 7, NULL, 4, 4, 'electricalTest', 'false', NULL, NULL),
(5, '2015-06-15 10:32:36', NULL, 7, NULL, 4, 5, 'gasCertificate', 'false', NULL, NULL),
(6, '2015-06-15 10:32:36', NULL, 7, NULL, 4, 6, 'energyPerformance', 'false', NULL, NULL),
(7, '2015-06-15 10:32:36', NULL, 7, NULL, 4, 7, 'centralHeatingSystem', NULL, '', NULL),
(8, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 24, 'readAndUnderstandTerms', 'true', NULL, NULL),
(9, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 25, 'structurallyStable', 'false', '', NULL),
(10, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 26, 'freeFromSeriousDisRepair', 'true', 'fff', NULL),
(11, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 27, 'freeFromDampness', NULL, 'sfsfsf', NULL),
(12, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 28, 'insulation270mm', NULL, '', NULL),
(13, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 30, 'adequateHeating', NULL, '', NULL),
(14, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 32, 'pollutants', NULL, '', NULL),
(15, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 33, 'needRadonRiskReport', NULL, '', NULL),
(16, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 34, 'propertyMeetStandards', NULL, NULL, NULL),
(17, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 35, 'whereITFails', NULL, '', NULL),
(18, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 36, 'upgradeProperty', NULL, NULL, NULL),
(19, '2015-06-15 10:32:50', NULL, 7, NULL, 4, 37, 'workCompletedBy', NULL, '', NULL),
(21, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 38, 'adequateSizeandLayout', 'false', '', NULL),
(22, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 39, 'safeAgainstUnauthorizedEntry', 'false', '', NULL),
(23, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 40, 'careTaker', NULL, '', NULL),
(24, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 41, 'burglarAlarmSystem', NULL, '', NULL),
(25, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 42, 'allWindowsHaveKeys', NULL, '', NULL),
(26, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 43, 'adequateLightening', NULL, '', NULL),
(27, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 44, 'adequateSecurityLightening', NULL, '', NULL),
(28, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 45, 'externalLighteningAtNight', NULL, '', NULL),
(29, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 46, 'complaintsAgainstNoise', NULL, '', NULL),
(30, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 47, 'safeBarriersAgainstFire', NULL, '', NULL),
(31, '2015-06-15 10:32:59', NULL, 7, NULL, 4, 48, 'adequateNoiceInsulation', NULL, '', NULL),
(33, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 49, 'kitchen', 'false', '', NULL),
(34, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 50, 'adequateKitchenSpace', 'false', '', NULL),
(35, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 51, 'appropriatePowerSockets', 'false', '', NULL),
(36, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 52, 'facilitiesForPreparationOfFood', NULL, '', NULL),
(37, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 53, 'storageOfFood', NULL, '', NULL),
(38, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 54, 'suitableVentilationOfKitchen', NULL, '', NULL),
(39, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 56, 'drainageOfFoulWater', NULL, '', NULL),
(40, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 55, 'suitableLocatedWashBasin', NULL, '', NULL),
(41, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 57, 'appropriatelyLocatedBathroom', NULL, '', NULL),
(42, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 58, 'drinkingWater', NULL, '', NULL),
(43, '2015-06-15 10:33:08', NULL, 7, NULL, 4, 59, 'refuseStorage', NULL, '', NULL),
(44, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 60, 'riskOfFall', 'false', '', NULL),
(45, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 61, 'adequateNaturalLightening', 'false', '', NULL),
(46, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 62, 'securedStepsAndRamps', 'false', '', NULL),
(47, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 63, 'doorsDirection', NULL, '', NULL),
(48, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 64, 'moreThanOneFlightOfStairs', NULL, '', NULL),
(49, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 65, 'buildingRegulation', NULL, '', NULL),
(50, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 67, 'buildingRegulationDate', NULL, '', NULL),
(51, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 66, 'spaceAccessedViaFlightOfStairs', NULL, '', NULL),
(52, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 68, 'electricalWiringStandards', NULL, '', NULL),
(53, '2015-06-15 10:33:16', NULL, 7, NULL, 4, 69, 'trappingBodyParts', NULL, '', NULL),
(54, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 38, 'adequateSizeandLayout', 'true', '', 0),
(55, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 39, 'safeAgainstUnauthorizedEntry', NULL, '', 0),
(56, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 40, 'careTaker', NULL, '', 0),
(57, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 41, 'burglarAlarmSystem', NULL, '', 0),
(58, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 42, 'allWindowsHaveKeys', NULL, '', 0),
(59, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 43, 'adequateLightening', NULL, '', 0),
(60, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 44, 'adequateSecurityLightening', NULL, '', 0),
(61, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 45, 'externalLighteningAtNight', NULL, '', 0),
(62, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 46, 'complaintsAgainstNoise', NULL, '', 0),
(63, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 47, 'safeBarriersAgainstFire', NULL, '', 0),
(64, '2015-06-23 05:12:01', '2015-06-23 05:20:59', 7, 7, 14, 48, 'adequateNoiceInsulation', NULL, '', 0),
(66, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 38, 'adequateSizeandLayout', 'false', '', 0),
(67, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 39, 'safeAgainstUnauthorizedEntry', 'false', '', 0),
(68, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 40, 'careTaker', NULL, '', 0),
(69, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 41, 'burglarAlarmSystem', NULL, '', 0),
(70, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 42, 'allWindowsHaveKeys', NULL, '', 0),
(71, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 43, 'adequateLightening', NULL, '', 0),
(72, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 44, 'adequateSecurityLightening', NULL, '', 0),
(73, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 45, 'externalLighteningAtNight', NULL, '', 0),
(74, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 46, 'complaintsAgainstNoise', NULL, '', 0),
(75, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 47, 'safeBarriersAgainstFire', NULL, '', 0),
(76, '2015-06-23 06:17:11', '2015-06-23 06:18:39', 7, 7, 15, 48, 'adequateNoiceInsulation', NULL, '', 0),
(77, '2015-06-27 12:24:30', NULL, 29, NULL, 16, 1, 'hmoLicence', NULL, NULL, NULL),
(78, '2015-06-27 12:24:30', NULL, 29, NULL, 16, 2, 'licenceNumber', NULL, '', NULL),
(79, '2015-06-27 12:24:30', NULL, 29, NULL, 16, 7, 'centralHeatingSystem', NULL, '', NULL),
(80, '2015-06-27 12:24:30', NULL, 29, NULL, 16, 9, 'asbestosSurvey', 'false', NULL, NULL),
(81, '2015-06-27 13:19:42', NULL, 34, NULL, 17, 1, 'hmoLicence', NULL, NULL, NULL),
(82, '2015-06-27 13:19:42', NULL, 34, NULL, 17, 2, 'licenceNumber', NULL, '', NULL),
(83, '2015-06-27 13:19:42', NULL, 34, NULL, 17, 7, 'centralHeatingSystem', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_questiongroup`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_questiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(45) NOT NULL,
  `failThreshold` int(5) NOT NULL,
  `criteriaStr` varchar(999) DEFAULT NULL,
  `groupDetail` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupName` (`groupName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tbl_perpetualrents_questiongroup`
--

INSERT INTO `tbl_perpetualrents_questiongroup` (`id`, `groupName`, `failThreshold`, `criteriaStr`, `groupDetail`) VALUES
(1, 'HMOLicenceQuestionID', 5, 'HMOLicense', 'HMO License'),
(2, 'certificationGroupID', 5, 'HMOLicense', 'Certification'),
(3, 'ManualID', 5, 'Manuals', 'Manuals'),
(4, 'ReadTerms', 5, 'Free from ALL Category 1 Hazards as set out In the Governments Housing Health and Safety Rating System (HHSRS)', 'none'),
(5, 'IsThePropertyGroupID', 5, 'Free from ALL Category 1 Hazards as set out In the Governments Housing Health and Safety Rating System (HHSRS)', 'Is the Property: '),
(6, 'DoesThePropertyHaveGroupID', 5, 'Free from ALL Category 1 Hazards as set out In the Governments Housing Health and Safety Rating System (HHSRS)', 'Does the property have'),
(7, 'PropertyFreeFromGroupID', 5, 'Free from ALL Category 1 Hazards as set out In the Governments Housing Health and Safety Rating System (HHSRS)', ' Is the property free from'),
(8, 'propertyStandardGroupID', 5, 'PropertyStandards', 'Property Standards'),
(9, 'CriteriaB-Group-1', 5, 'Criteria B. It must be in a reasonable state of repair ', 'Does the property have'),
(10, 'PropertyHaveGroup-CR-C-ID', 5, 'Criteria C - It must have reasonably modern facilities and services', 'Does the property have '),
(11, 'PropertyHaveGroup-CR-D-ID1', 5, 'Criteria D - It must provide a reasonable degree of thermal comfort', 'Does the property have');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_perpetualrents_turnoverdetails`
--

CREATE TABLE IF NOT EXISTS `tbl_perpetualrents_turnoverdetails` (
  `contractorId` int(11) NOT NULL,
  `financialYear` varchar(45) NOT NULL,
  `turnOver` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_perpetualrents_turnoverdetails`
--

INSERT INTO `tbl_perpetualrents_turnoverdetails` (`contractorId`, `financialYear`, `turnOver`) VALUES
(1, '2014', '2525252'),
(1, '2012', '353535'),
(1, '2012', '353535'),
(2, '2012', '499499'),
(2, '2011', '89009'),
(2, '2011', '60000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `hintQuestion` varchar(45) DEFAULT NULL,
  `hintAnswer` varchar(45) DEFAULT NULL,
  `userTypeId` varchar(45) DEFAULT NULL,
  `enabled` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `createdOn`, `modifiedOn`, `createdUserId`, `modifiedUserId`, `username`, `password`, `hintQuestion`, `hintAnswer`, `userTypeId`, `enabled`) VALUES
(1, '2015-06-15 06:45:35', NULL, 0, NULL, 'super', 'admin', NULL, NULL, '1', b'1'),
(2, '2015-06-15 07:08:29', NULL, 1, NULL, 'Naina', '123123', NULL, NULL, '5', b'1'),
(3, '2015-06-15 07:12:10', NULL, 1, NULL, 'Gautam', 'Gautamhceid', NULL, NULL, '5', b'1'),
(4, '2015-06-15 07:19:32', NULL, NULL, NULL, 'hilari', '5474747', NULL, NULL, '7', b'1'),
(5, '2015-06-15 08:16:46', NULL, 1, NULL, 'Kapil', 'Kapil1ee02', NULL, NULL, '5', b'1'),
(6, '2015-06-15 09:06:25', NULL, 1, NULL, 'navaya', 'navaya3psl6', NULL, NULL, '5', b'1'),
(7, '2015-06-15 09:25:31', NULL, NULL, NULL, 'sunayana', 'sunayana', NULL, NULL, '3', b'1'),
(8, '2015-06-15 09:38:32', NULL, 0, NULL, 'suejkk', '393939399', NULL, NULL, '4', b'1'),
(9, '2015-06-15 10:08:32', NULL, 0, NULL, 'auejju', 'chintan123', NULL, NULL, '4', b'1'),
(11, '2015-06-15 12:36:17', NULL, NULL, NULL, 'johncarterffggh', 'john123', NULL, NULL, '7', b'1'),
(21, '2015-06-15 12:37:11', NULL, NULL, NULL, 'johncarter', 'john123', NULL, NULL, '7', b'1'),
(26, '2015-06-15 12:40:27', NULL, NULL, NULL, 'johncarters', 'john123', NULL, NULL, '7', b'1'),
(27, '2015-06-16 11:14:28', NULL, NULL, NULL, 'rohit', 'rohit', NULL, NULL, '3', b'1'),
(28, '2015-06-16 11:18:36', NULL, NULL, NULL, 'eieii', '3939399', NULL, NULL, '3', b'1'),
(29, '2015-06-16 11:21:35', NULL, NULL, NULL, 'afj', 'afja', NULL, NULL, '3', b'1'),
(30, '2015-06-16 12:36:54', NULL, NULL, NULL, 'ted', 'john123', NULL, NULL, '7', b'1'),
(31, '2015-06-27 12:37:33', NULL, NULL, NULL, 'tarun', 'tarun', NULL, NULL, '3', b'1'),
(32, '2015-06-27 12:43:47', NULL, NULL, NULL, 'afjjm', 'afkk', NULL, NULL, '3', b'1'),
(33, '2015-06-27 13:01:05', NULL, NULL, NULL, '3jsdfjsj', 'afjafjj', NULL, NULL, '3', b'1'),
(34, '2015-06-27 13:06:37', NULL, NULL, NULL, 'akfk', 'afkk', NULL, NULL, '3', b'1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
