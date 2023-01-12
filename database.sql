-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 28, 2021 at 10:37 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
CREATE TABLE IF NOT EXISTS `addons` (
  `addonsID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `package_name` varchar(180) DEFAULT NULL,
  `slug` varchar(180) DEFAULT NULL,
  `description` longtext,
  `version` varchar(11) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `init` longtext,
  `files` longtext,
  `preview_image` varchar(180) DEFAULT NULL,
  `date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`addonsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

DROP TABLE IF EXISTS `admission`;
CREATE TABLE IF NOT EXISTS `admission` (
  `admissionID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `admissiondate` datetime DEFAULT NULL,
  `pcase` varchar(128) DEFAULT NULL,
  `casualty` int(1) DEFAULT NULL,
  `oldpatient` int(1) DEFAULT NULL,
  `tpaID` int(11) DEFAULT NULL,
  `reference` varchar(128) DEFAULT NULL,
  `doctorID` int(11) DEFAULT NULL,
  `creditlimit` double DEFAULT '0',
  `wardID` int(11) DEFAULT NULL,
  `bedID` int(11) DEFAULT NULL,
  `symptoms` text,
  `allergies` text,
  `test` text COMMENT 'Null Field so dont use in patient and admission feature',
  `note` text,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  `prescriptionstatus` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ambulance`
--

DROP TABLE IF EXISTS `ambulance`;
CREATE TABLE IF NOT EXISTS `ambulance` (
  `ambulanceID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `color` varchar(40) DEFAULT NULL,
  `cc` int(11) DEFAULT NULL,
  `weight` varchar(11) DEFAULT NULL,
  `fueltype` int(11) DEFAULT NULL,
  `drivername` varchar(40) DEFAULT NULL,
  `driverlicence` varchar(100) DEFAULT NULL,
  `drivercontact` varchar(25) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL COMMENT '200 text',
  `status` tinyint(4) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ambulanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ambulancecall`
--

DROP TABLE IF EXISTS `ambulancecall`;
CREATE TABLE IF NOT EXISTS `ambulancecall` (
  `ambulancecallID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ambulanceID` int(11) UNSIGNED NOT NULL,
  `drivername` varchar(40) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `patientname` varchar(40) DEFAULT NULL,
  `patientcontact` varchar(25) DEFAULT NULL,
  `pickup_point` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ambulancecallID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointmentID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `appointmentdate` datetime DEFAULT NULL,
  `pcase` varchar(128) DEFAULT NULL,
  `casualty` int(1) DEFAULT NULL,
  `oldpatient` int(1) DEFAULT NULL COMMENT '0 = Old Patient, 1 = New Patient',
  `tpaID` int(11) DEFAULT NULL,
  `reference` varchar(128) DEFAULT NULL,
  `doctorID` int(11) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `paymentstatus` int(2) DEFAULT NULL,
  `paymentmethodID` int(2) DEFAULT NULL,
  `symptoms` text,
  `allergies` text,
  `test` text COMMENT 'Null field so dont use in patient and appointment feature',
  `note` text,
  `type` tinyint(4) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `join_url` text,
  `password` varchar(765) DEFAULT NULL,
  `metting_id` varchar(765) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  `paymentdate` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`appointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `attendanceID` int(200) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  `monthyear` varchar(10) NOT NULL,
  `year` int(11) NOT NULL,
  `a1` varchar(3) DEFAULT NULL,
  `a2` varchar(3) DEFAULT NULL,
  `a3` varchar(3) DEFAULT NULL,
  `a4` varchar(3) DEFAULT NULL,
  `a5` varchar(3) DEFAULT NULL,
  `a6` varchar(3) DEFAULT NULL,
  `a7` varchar(3) DEFAULT NULL,
  `a8` varchar(3) DEFAULT NULL,
  `a9` varchar(3) DEFAULT NULL,
  `a10` varchar(3) DEFAULT NULL,
  `a11` varchar(3) DEFAULT NULL,
  `a12` varchar(3) DEFAULT NULL,
  `a13` varchar(3) DEFAULT NULL,
  `a14` varchar(3) DEFAULT NULL,
  `a15` varchar(3) DEFAULT NULL,
  `a16` varchar(3) DEFAULT NULL,
  `a17` varchar(3) DEFAULT NULL,
  `a18` varchar(3) DEFAULT NULL,
  `a19` varchar(3) DEFAULT NULL,
  `a20` varchar(3) DEFAULT NULL,
  `a21` varchar(3) DEFAULT NULL,
  `a22` varchar(3) DEFAULT NULL,
  `a23` varchar(3) DEFAULT NULL,
  `a24` varchar(3) DEFAULT NULL,
  `a25` varchar(3) DEFAULT NULL,
  `a26` varchar(3) DEFAULT NULL,
  `a27` varchar(3) DEFAULT NULL,
  `a28` varchar(3) DEFAULT NULL,
  `a29` varchar(3) DEFAULT NULL,
  `a30` varchar(3) DEFAULT NULL,
  `a31` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`attendanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
CREATE TABLE IF NOT EXISTS `bed` (
  `bedID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `bedtypeID` int(11) NOT NULL,
  `wardID` int(11) NOT NULL,
  `patientID` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`bedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bedtype`
--

DROP TABLE IF EXISTS `bedtype`;
CREATE TABLE IF NOT EXISTS `bedtype` (
  `bedtypeID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`bedtypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `billID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patientID` int(11) UNSIGNED NOT NULL,
  `patienttypeID` int(11) UNSIGNED NOT NULL,
  `appointmentandadmissionID` int(11) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `note` varchar(250) NOT NULL,
  `totalamount` float UNSIGNED NOT NULL,
  `paymentstatus` int(1) DEFAULT '1',
  `status` int(1) DEFAULT '0' COMMENT '0 = billitem all not done, 1 = billitem all done, 2 = bill item some done',
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `permission` int(2) DEFAULT '0',
  `delete_at` int(1) DEFAULT '0',
  PRIMARY KEY (`billID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `billcategory`
--

DROP TABLE IF EXISTS `billcategory`;
CREATE TABLE IF NOT EXISTS `billcategory` (
  `billcategoryID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billcategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `billitems`
--

DROP TABLE IF EXISTS `billitems`;
CREATE TABLE IF NOT EXISTS `billitems` (
  `billitemsID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `billID` int(11) UNSIGNED NOT NULL,
  `billlabelID` int(11) UNSIGNED NOT NULL,
  `amount` decimal(16,2) DEFAULT '0.00',
  `discount` int(3) UNSIGNED NOT NULL,
  `status` int(1) DEFAULT '0',
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  `patientID` int(11) DEFAULT '0',
  `patienttypeID` int(11) DEFAULT '0',
  `appointmentandadmissionID` int(11) DEFAULT '0',
  `delete_at` int(1) DEFAULT '0',
  PRIMARY KEY (`billitemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `billlabel`
--

DROP TABLE IF EXISTS `billlabel`;
CREATE TABLE IF NOT EXISTS `billlabel` (
  `billlabelID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `billcategoryID` int(11) UNSIGNED NOT NULL,
  `discount` int(3) UNSIGNED NOT NULL,
  `amount` decimal(20,2) UNSIGNED NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billlabelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `billpayment`
--

DROP TABLE IF EXISTS `billpayment`;
CREATE TABLE IF NOT EXISTS `billpayment` (
  `billpaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `billID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `patienttypeID` int(11) DEFAULT '0',
  `appointmentandadmissionID` int(11) DEFAULT '0',
  `reference_no` varchar(255) NOT NULL,
  `paymentamount` varchar(20) NOT NULL DEFAULT '0',
  `paymentmethod` tinyint(4) NOT NULL,
  `permission` tinyint(4) NOT NULL,
  `paymentdate` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `delete_at` int(1) DEFAULT '0',
  `paymentby` int(1) DEFAULT '0' COMMENT ' 0 = bill, 1 = payment',
  PRIMARY KEY (`billpaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `birthregister`
--

DROP TABLE IF EXISTS `birthregister`;
CREATE TABLE IF NOT EXISTS `birthregister` (
  `birthregisterID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `father_name` varchar(40) NOT NULL,
  `mother_name` varchar(40) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `date` datetime NOT NULL,
  `weight` varchar(15) DEFAULT NULL,
  `length` varchar(15) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  `birth_place` varchar(128) NOT NULL,
  `nationality` varchar(128) NOT NULL,
  `mother_birth_place` varchar(128) DEFAULT NULL,
  `mother_birthday` datetime DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`birthregisterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bloodbag`
--

DROP TABLE IF EXISTS `bloodbag`;
CREATE TABLE IF NOT EXISTS `bloodbag` (
  `bloodbagID` int(11) NOT NULL AUTO_INCREMENT,
  `donorID` int(11) NOT NULL,
  `donortypeID` int(11) NOT NULL COMMENT '1 = Blood Donor, 2 = Dispatch Blood, 3 = Blood Bank',
  `bloodgroupID` int(11) NOT NULL,
  `patientID` int(11) DEFAULT NULL,
  `bagno` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Reserve, 1 = Release',
  `date` datetime NOT NULL,
  PRIMARY KEY (`bloodbagID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bloodbag`
--

INSERT INTO `bloodbag` (`bloodbagID`, `donorID`, `donortypeID`, `bloodgroupID`, `patientID`, `bagno`, `status`, `date`) VALUES
(1, 0, 3, 1, 0, '55', 0, '2021-08-28 03:23:13'),
(2, 0, 3, 2, 0, '12', 0, '2021-08-28 03:23:26'),
(3, 1, 1, 2, 0, '1', 0, '2021-08-28 03:24:07'),
(4, 1, 1, 2, 0, '2', 0, '2021-08-28 03:24:07'),
(5, 0, 3, 8, 0, '100', 0, '2021-08-28 03:24:34'),
(6, 0, 3, 1, 0, '44', 0, '2021-08-28 03:25:01'),
(7, 0, 3, 1, 0, '4344', 0, '2021-08-28 03:25:11'),
(8, 0, 3, 3, 0, '3444', 0, '2021-08-28 03:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `blooddonor`
--

DROP TABLE IF EXISTS `blooddonor`;
CREATE TABLE IF NOT EXISTS `blooddonor` (
  `blooddonorID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `gender` varchar(20) NOT NULL COMMENT '1 = male, 2 = femal',
  `age` int(11) NOT NULL,
  `bloodgroupID` int(11) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  `charges` decimal(16,2) DEFAULT '0.00',
  `lastdonationdate` varchar(10) DEFAULT NULL,
  `donartypeID` int(11) NOT NULL COMMENT '1 = Blood Donor, 2 = Dispatch Blood, 3 = Blood Bank',
  `numberofbag` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`blooddonorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blooddonor`
--

INSERT INTO `blooddonor` (`blooddonorID`, `name`, `gender`, `age`, `bloodgroupID`, `phone`, `email`, `patientID`, `charges`, `lastdonationdate`, `donartypeID`, `numberofbag`, `create_date`, `modify_date`, `create_userID`, `create_roleID`) VALUES
(1, 'awdawdaw', '1', 2, 2, '222', 'admin@gmail.com', 0, '0.00', '2021-08-24', 1, 2, '2021-08-28 03:24:07', '2021-08-28 03:24:07', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bloodgroup`
--

DROP TABLE IF EXISTS `bloodgroup`;
CREATE TABLE IF NOT EXISTS `bloodgroup` (
  `bloodgroupID` int(11) NOT NULL AUTO_INCREMENT,
  `bloodgroup` varchar(40) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`bloodgroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bloodgroup`
--

INSERT INTO `bloodgroup` (`bloodgroupID`, `bloodgroup`, `create_date`, `modify_date`, `create_userID`, `create_roleID`) VALUES
(1, 'A+', '2019-04-24 03:08:05', '2019-04-24 03:08:05', 1, 1),
(2, 'A-', '2019-04-24 03:08:05', '2019-04-24 03:08:05', 1, 1),
(3, 'B+', '2019-04-24 03:08:05', '2019-04-24 03:08:05', 1, 1),
(4, 'B-', '2019-04-24 03:08:05', '2019-04-24 03:08:05', 1, 1),
(5, 'O+', '2019-04-24 03:08:05', '2019-04-24 03:08:05', 1, 1),
(6, 'O-', '2019-04-24 03:08:05', '2019-04-24 03:08:05', 1, 1),
(7, 'AB+', '2019-04-24 03:08:05', '2019-04-24 03:08:05', 1, 1),
(8, 'AB-', '2019-04-24 03:08:05', '2019-04-24 01:06:06', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `damageandexpire`
--

DROP TABLE IF EXISTS `damageandexpire`;
CREATE TABLE IF NOT EXISTS `damageandexpire` (
  `damageandexpireID` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `medicinecategoryID` int(11) NOT NULL,
  `medicineID` int(11) NOT NULL,
  `batchID` varchar(32) NOT NULL,
  `quantity` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`damageandexpireID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deathregister`
--

DROP TABLE IF EXISTS `deathregister`;
CREATE TABLE IF NOT EXISTS `deathregister` (
  `deathregisterID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `relation` varchar(40) NOT NULL,
  `guardian_name` varchar(40) NOT NULL,
  `death_address` varchar(255) DEFAULT NULL,
  `permanent_address` varchar(255) NOT NULL,
  `gender` int(1) NOT NULL COMMENT '1 = Male, 2 = Female',
  `age` varchar(100) NOT NULL,
  `death_date` datetime NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `death_cause` varchar(255) NOT NULL,
  `doctorID` int(11) NOT NULL,
  `confirm_date` datetime NOT NULL,
  `patientID` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`deathregisterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `departmentID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentID`, `name`, `description`, `create_date`, `modify_date`, `create_userID`, `create_roleID`) VALUES
(1, 'PHYSIOTHERAPY', 'We care', '2021-08-27 13:44:47', '2021-08-27 13:44:47', 1, 1),
(2, 'SURGERY', 'Surgical departments for all operations', '2021-08-27 13:45:14', '2021-08-27 13:45:14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
CREATE TABLE IF NOT EXISTS `designation` (
  `designationID` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(40) NOT NULL DEFAULT '' COMMENT '1 = Admin, 2 = Patient',
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`designationID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designationID`, `designation`, `create_date`, `modify_date`, `create_userID`, `create_roleID`) VALUES
(1, 'Admin', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(2, 'Patient', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(3, 'Doctor', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(4, 'Accountant', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(5, 'Biller', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(6, 'Pharmacist', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(7, 'Pathologist', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(8, 'Radiologist', '2019-09-14 17:50:47', '2019-09-14 17:50:47', 1, 1),
(9, 'Receptionist', '2019-09-14 17:50:47', '2019-09-14 17:50:47', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `discharge`
--

DROP TABLE IF EXISTS `discharge`;
CREATE TABLE IF NOT EXISTS `discharge` (
  `dischargeID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patientID` int(11) DEFAULT NULL,
  `admissionID` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `conditionofdischarge` int(11) DEFAULT NULL COMMENT '1 = Stable, 2 = Almost Stable 3 = Own Risk, 4 = Unstable',
  `note` text,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`dischargeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doctorinfo`
--

DROP TABLE IF EXISTS `doctorinfo`;
CREATE TABLE IF NOT EXISTS `doctorinfo` (
  `doctorinfoID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `visit_fee` decimal(10,0) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `online_consultation` tinyint(4) NOT NULL,
  `consultation_fee` decimal(10,0) NOT NULL,
  PRIMARY KEY (`doctorinfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `documentID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `file` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emailsettings`
--

DROP TABLE IF EXISTS `emailsettings`;
CREATE TABLE IF NOT EXISTS `emailsettings` (
  `fieldoption` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`fieldoption`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emailsettings`
--

INSERT INTO `emailsettings` (`fieldoption`, `value`) VALUES
('email_engine', 'sendmail'),
('smtp_password', ''),
('smtp_port', ''),
('smtp_security', ''),
('smtp_server', ''),
('smtp_username', '');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `eventID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `fdate` date NOT NULL,
  `ftime` time NOT NULL,
  `tdate` date NOT NULL,
  `ttime` time NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eventcounter`
--

DROP TABLE IF EXISTS `eventcounter`;
CREATE TABLE IF NOT EXISTS `eventcounter` (
  `eventcounterID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `status` tinyint(11) NOT NULL DEFAULT '0' COMMENT '0=not going, 1=going',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eventcounterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
CREATE TABLE IF NOT EXISTS `expense` (
  `expenseID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `date` date NOT NULL,
  `expenseday` varchar(11) NOT NULL,
  `expensemonth` varchar(11) NOT NULL,
  `expenseyear` year(4) NOT NULL,
  `amount` double NOT NULL,
  `file` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`expenseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
CREATE TABLE IF NOT EXISTS `floor` (
  `floorID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`floorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fmenu`
--

DROP TABLE IF EXISTS `fmenu`;
CREATE TABLE IF NOT EXISTS `fmenu` (
  `fmenuID` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(128) NOT NULL,
  `status` int(11) NOT NULL COMMENT 'Only for active',
  `topbar` int(11) NOT NULL,
  `social` int(11) NOT NULL,
  PRIMARY KEY (`fmenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fmenu_relation`
--

DROP TABLE IF EXISTS `fmenu_relation`;
CREATE TABLE IF NOT EXISTS `fmenu_relation` (
  `fmenu_relationID` int(11) NOT NULL AUTO_INCREMENT,
  `fmenuID` int(11) DEFAULT NULL,
  `menu_typeID` int(11) DEFAULT NULL COMMENT '1 => Pages, 2 => Post, 3 => Links',
  `menu_parentID` varchar(128) DEFAULT NULL,
  `menu_orderID` int(11) DEFAULT NULL,
  `menu_pageID` int(11) DEFAULT NULL,
  `menu_label` varchar(254) DEFAULT NULL,
  `menu_link` text NOT NULL,
  `menu_rand` varchar(128) DEFAULT NULL,
  `menu_rand_parentID` varchar(128) DEFAULT NULL,
  `menu_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`fmenu_relationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forgetpassword`
--

DROP TABLE IF EXISTS `forgetpassword`;
CREATE TABLE IF NOT EXISTS `forgetpassword` (
  `forgetpasswordID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `keyID` varchar(128) NOT NULL,
  `email` varchar(60) NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`forgetpasswordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frontendsettings`
--

DROP TABLE IF EXISTS `frontendsettings`;
CREATE TABLE IF NOT EXISTS `frontendsettings` (
  `fieldoption` varchar(100) NOT NULL,
  `value` varchar(255) DEFAULT '',
  PRIMARY KEY (`fieldoption`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frontendsettings`
--

INSERT INTO `frontendsettings` (`fieldoption`, `value`) VALUES
('description', ''),
('doctor_email_status', '0'),
('doctor_phone_status', '0'),
('facebook', ''),
('google', ''),
('linkedin', ''),
('login_menu_status', '1'),
('twitter', ''),
('youtube', '');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_template`
--

DROP TABLE IF EXISTS `frontend_template`;
CREATE TABLE IF NOT EXISTS `frontend_template` (
  `frontend_templateID` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(128) NOT NULL,
  PRIMARY KEY (`frontend_templateID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frontend_template`
--

INSERT INTO `frontend_template` (`frontend_templateID`, `template_name`) VALUES
(1, 'home'),
(2, 'about'),
(3, 'event'),
(4, 'doctor'),
(5, 'gallery'),
(6, 'notice'),
(7, 'blog'),
(8, 'contact');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

DROP TABLE IF EXISTS `generalsettings`;
CREATE TABLE IF NOT EXISTS `generalsettings` (
  `fieldoption` varchar(100) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fieldoption`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`fieldoption`, `value`) VALUES
('address', NULL),
('auto_update_notification', '0'),
('captcha_status', '0'),
('currency_code', NULL),
('currency_symbol', NULL),
('default_language', 'english'),
('email', NULL),
('footer_text', 'Copyright &copy;'),
('frontend', '0'),
('logo', 'ffd4ba7f5c96647ce6008c7fbb331ac6b968f835e1ca6368450c1b5b162dda1c3785fa79c5ccec7d111f0018274b3d50c50c365f1a36391e55d787a29ac57346.png'),
('medicine_expire_limit_day', '30'),
('patient_credit_limit', '5000'),
('patient_password', NULL),
('phone', NULL),
('purchase_code', NULL),
('purchase_username', NULL),
('recaptcha_secret_key', ''),
('recaptcha_site_key', ''),
('system_name', NULL),
('time_zone', NULL),
('updateversion', '1.1');

-- --------------------------------------------------------

--
-- Table structure for table `heightweightbp`
--

DROP TABLE IF EXISTS `heightweightbp`;
CREATE TABLE IF NOT EXISTS `heightweightbp` (
  `heightweightbpID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `patienttypeID` int(1) NOT NULL,
  `appointmentandadmissionID` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `height` varchar(3) DEFAULT '0',
  `weight` varchar(3) DEFAULT '0',
  `bp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`heightweightbpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hourlytemplate`
--

DROP TABLE IF EXISTS `hourlytemplate`;
CREATE TABLE IF NOT EXISTS `hourlytemplate` (
  `hourlytemplateID` int(11) NOT NULL AUTO_INCREMENT,
  `hourly_grades` varchar(128) NOT NULL,
  `hourly_rate` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`hourlytemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
CREATE TABLE IF NOT EXISTS `income` (
  `incomeID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `date` date NOT NULL,
  `incomeday` varchar(11) NOT NULL,
  `incomemonth` varchar(11) NOT NULL,
  `incomeyear` year(4) NOT NULL,
  `amount` double NOT NULL,
  `file` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`incomeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inihospital`
--

DROP TABLE IF EXISTS `inihospital`;
CREATE TABLE IF NOT EXISTS `inihospital` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `inihospital` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `instruction`
--

DROP TABLE IF EXISTS `instruction`;
CREATE TABLE IF NOT EXISTS `instruction` (
  `instructionID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patientID` int(11) DEFAULT NULL,
  `admissionID` int(11) DEFAULT NULL,
  `instruction` longtext,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`instructionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `itemID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  `description` text COMMENT '200 text',
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemcategory`
--

DROP TABLE IF EXISTS `itemcategory`;
CREATE TABLE IF NOT EXISTS `itemcategory` (
  `itemcategoryID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemcategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemcheckin`
--

DROP TABLE IF EXISTS `itemcheckin`;
CREATE TABLE IF NOT EXISTS `itemcheckin` (
  `itemcheckinID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `itemID` int(11) DEFAULT NULL,
  `supplierID` int(11) DEFAULT NULL,
  `storeID` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text COMMENT '200 text',
  `status` tinyint(4) DEFAULT '0' COMMENT '0=available, 1=not available',
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemcheckinID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemcheckout`
--

DROP TABLE IF EXISTS `itemcheckout`;
CREATE TABLE IF NOT EXISTS `itemcheckout` (
  `itemcheckoutID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `issuedate` datetime DEFAULT NULL,
  `returndate` datetime DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `note` text COMMENT '200 text',
  `currentreturndate` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=non return, 1=return',
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemcheckoutID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemstore`
--

DROP TABLE IF EXISTS `itemstore`;
CREATE TABLE IF NOT EXISTS `itemstore` (
  `itemstoreID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `code` varchar(40) NOT NULL,
  `incharge` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemstoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `itemsupplier`
--

DROP TABLE IF EXISTS `itemsupplier`;
CREATE TABLE IF NOT EXISTS `itemsupplier` (
  `itemsupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(128) NOT NULL,
  `suppliername` varchar(40) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`itemsupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leaveapplication`
--

DROP TABLE IF EXISTS `leaveapplication`;
CREATE TABLE IF NOT EXISTS `leaveapplication` (
  `leaveapplicationID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `leavecategoryID` int(10) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `apply_date` datetime NOT NULL,
  `od_status` tinyint(1) NOT NULL DEFAULT '0',
  `from_date` date NOT NULL,
  `from_time` time DEFAULT NULL,
  `to_date` date NOT NULL,
  `to_time` time DEFAULT NULL,
  `leave_days` int(11) NOT NULL,
  `reason` text,
  `attachment` varchar(200) DEFAULT NULL,
  `attachmentorginalname` varchar(200) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) UNSIGNED NOT NULL,
  `applicationto_userID` int(11) UNSIGNED DEFAULT NULL,
  `applicationto_roleID` int(11) UNSIGNED DEFAULT NULL,
  `approver_userID` int(11) UNSIGNED DEFAULT NULL,
  `approver_roleID` int(11) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`leaveapplicationID`),
  KEY `leave_categoryID` (`leavecategoryID`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `approver_userID` (`approver_userID`),
  KEY `approver_usertypeID` (`approver_roleID`),
  KEY `applicationto_usertypeID` (`applicationto_roleID`),
  KEY `applicationto_userID` (`applicationto_userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leaveassign`
--

DROP TABLE IF EXISTS `leaveassign`;
CREATE TABLE IF NOT EXISTS `leaveassign` (
  `leaveassignID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `roleID` int(11) UNSIGNED NOT NULL,
  `leavecategoryID` int(10) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `leaveassignday` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`leaveassignID`),
  KEY `leave_categoryID` (`leavecategoryID`),
  KEY `usertypeID` (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leavecategory`
--

DROP TABLE IF EXISTS `leavecategory`;
CREATE TABLE IF NOT EXISTS `leavecategory` (
  `leavecategoryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `leavecategory` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`leavecategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loginlog`
--

DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE IF NOT EXISTS `loginlog` (
  `loginlogID` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) DEFAULT NULL,
  `browser` varchar(128) DEFAULT NULL,
  `operatingsystem` varchar(128) DEFAULT NULL,
  `login` int(11) UNSIGNED DEFAULT NULL,
  `logout` int(11) UNSIGNED DEFAULT NULL,
  `roleID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`loginlogID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `makepayment`
--

DROP TABLE IF EXISTS `makepayment`;
CREATE TABLE IF NOT EXISTS `makepayment` (
  `makepaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `month` text NOT NULL,
  `gross_salary` text NOT NULL,
  `total_deduction` text NOT NULL,
  `net_salary` text NOT NULL,
  `payment_amount` text NOT NULL,
  `payment_method` int(11) NOT NULL,
  `comments` text,
  `templateID` int(11) NOT NULL,
  `salaryID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `total_hours` text,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`makepaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `managesalary`
--

DROP TABLE IF EXISTS `managesalary`;
CREATE TABLE IF NOT EXISTS `managesalary` (
  `managesalaryID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `userroleID` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `template` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`managesalaryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_gallery`
--

DROP TABLE IF EXISTS `media_gallery`;
CREATE TABLE IF NOT EXISTS `media_gallery` (
  `media_galleryID` int(11) NOT NULL AUTO_INCREMENT,
  `media_gallery_type` int(11) NOT NULL,
  `file_type` varchar(40) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_title` text NOT NULL,
  `file_size` varchar(40) DEFAULT NULL,
  `file_width_height` varchar(40) DEFAULT NULL,
  `file_upload_date` datetime DEFAULT NULL,
  `file_caption` text,
  `file_alt_text` varchar(255) DEFAULT NULL,
  `file_description` text,
  `file_length` varchar(128) DEFAULT NULL,
  `file_artist` varchar(128) DEFAULT NULL,
  `file_album` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`media_galleryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `medicineID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `medicinecategoryID` int(11) NOT NULL,
  `medicinemanufacturerID` int(11) NOT NULL,
  `medicineunitID` int(11) NOT NULL,
  `buying_price` decimal(16,2) NOT NULL,
  `selling_price` decimal(16,2) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`medicineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicinecategory`
--

DROP TABLE IF EXISTS `medicinecategory`;
CREATE TABLE IF NOT EXISTS `medicinecategory` (
  `medicinecategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`medicinecategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicinemanufacturer`
--

DROP TABLE IF EXISTS `medicinemanufacturer`;
CREATE TABLE IF NOT EXISTS `medicinemanufacturer` (
  `medicinemanufacturerID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `supplier_name` varchar(60) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(60) NOT NULL,
  `details` varchar(60) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`medicinemanufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicinepurchase`
--

DROP TABLE IF EXISTS `medicinepurchase`;
CREATE TABLE IF NOT EXISTS `medicinepurchase` (
  `medicinepurchaseID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `medicinewarehouseID` int(11) NOT NULL,
  `medicinepurchasereferenceno` varchar(100) NOT NULL,
  `medicinepurchasedate` datetime NOT NULL,
  `medicinepurchasefile` varchar(200) DEFAULT NULL,
  `medicinepurchasefileoriginalname` varchar(255) DEFAULT NULL,
  `medicinepurchasedescription` varchar(255) DEFAULT NULL,
  `medicinepurchasestatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = pending, 1 = partial_paid,  2 = fully_paid',
  `medicinepurchaserefund` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = not refund, 1 = refund ',
  `totalamount` decimal(20,2) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`medicinepurchaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicinepurchaseitem`
--

DROP TABLE IF EXISTS `medicinepurchaseitem`;
CREATE TABLE IF NOT EXISTS `medicinepurchaseitem` (
  `medicinepurchaseitemID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `medicinepurchaseID` int(11) UNSIGNED NOT NULL,
  `medicineID` int(11) UNSIGNED NOT NULL,
  `batchID` varchar(32) DEFAULT NULL,
  `expire_date` datetime NOT NULL,
  `unit_price` decimal(20,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  `salequantity` int(11) NOT NULL DEFAULT '0',
  `subtotal` decimal(20,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`medicinepurchaseitemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicinepurchasepaid`
--

DROP TABLE IF EXISTS `medicinepurchasepaid`;
CREATE TABLE IF NOT EXISTS `medicinepurchasepaid` (
  `medicinepurchasepaidID` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `medicinepurchaseyear` int(11) NOT NULL,
  `medicinepurchaseID` int(11) NOT NULL,
  `medicinepurchasepaiddate` date NOT NULL,
  `medicinepurchasepaidreferenceno` varchar(50) NOT NULL DEFAULT '',
  `medicinepurchasepaidamount` decimal(20,2) NOT NULL,
  `medicinepurchasepaidpaymentmethod` tinyint(4) NOT NULL COMMENT '1= Cash, 2= Cheque, 3= Credit, 4= Other',
  `medicinepurchasepaidfile` varchar(200) DEFAULT NULL,
  `medicinepurchasepaidoriginalname` varchar(200) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`medicinepurchasepaidID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicinesale`
--

DROP TABLE IF EXISTS `medicinesale`;
CREATE TABLE IF NOT EXISTS `medicinesale` (
  `medicinesaleID` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `patient_type` tinyint(4) NOT NULL,
  `uhid` int(11) NOT NULL,
  `medicinesaledate` date NOT NULL,
  `medicinesalefile` varchar(200) DEFAULT NULL,
  `medicinesalefileoriginalname` varchar(200) DEFAULT NULL,
  `medicinesaledescription` text,
  `medicinesalestatus` int(11) NOT NULL COMMENT '0 due,  1 = partial, 2 = Paid',
  `medicinesalerefund` int(11) NOT NULL DEFAULT '0' COMMENT '0 = not refund, 1 = refund ',
  `medicinesaletaxID` int(11) NOT NULL DEFAULT '0',
  `medicinesaletaxamount` double NOT NULL DEFAULT '0',
  `medicinesalediscount` double NOT NULL DEFAULT '0',
  `medicinesaleshipping` double NOT NULL DEFAULT '0',
  `medicinesalepaymentterm` int(11) NOT NULL DEFAULT '0',
  `medicinesaletotalamount` decimal(20,2) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`medicinesaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicinesaleitem`
--

DROP TABLE IF EXISTS `medicinesaleitem`;
CREATE TABLE IF NOT EXISTS `medicinesaleitem` (
  `medicinesaleitemID` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `medicinesaleID` int(11) NOT NULL,
  `medicineID` int(11) NOT NULL,
  `medicinepurchaseitemID` int(11) NOT NULL,
  `medicinebatchID` varchar(32) NOT NULL,
  `medicineexpiredate` datetime NOT NULL,
  `medicinesaleunitprice` decimal(20,2) NOT NULL,
  `medicinesalequantity` double NOT NULL,
  `medicinesalesubtotal` decimal(20,2) NOT NULL,
  PRIMARY KEY (`medicinesaleitemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicinesalepaid`
--

DROP TABLE IF EXISTS `medicinesalepaid`;
CREATE TABLE IF NOT EXISTS `medicinesalepaid` (
  `medicinesalepaidID` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `medicinesalepaidyear` int(11) NOT NULL,
  `medicinesaleID` int(11) NOT NULL,
  `medicinesalepaiddate` datetime NOT NULL,
  `medicinesalepaidreferenceno` varchar(50) NOT NULL DEFAULT '',
  `medicinesalepaidamount` decimal(20,2) NOT NULL,
  `medicinesalepaidpaymentmethod` int(11) NOT NULL COMMENT '1 = cash, 2 = cheque, 3 = crediit card, 4 = other',
  `medicinesalepaidfile` varchar(200) DEFAULT NULL,
  `medicinesalepaidorginalname` varchar(200) DEFAULT NULL,
  `medicinesalepaiddescription` text,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`medicinesalepaidID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicineunit`
--

DROP TABLE IF EXISTS `medicineunit`;
CREATE TABLE IF NOT EXISTS `medicineunit` (
  `medicineunitID` int(11) NOT NULL AUTO_INCREMENT,
  `medicineunit` varchar(128) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`medicineunitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicinewarehouse`
--

DROP TABLE IF EXISTS `medicinewarehouse`;
CREATE TABLE IF NOT EXISTS `medicinewarehouse` (
  `medicinewarehouseID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `code` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`medicinewarehouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menulog`
--

DROP TABLE IF EXISTS `menulog`;
CREATE TABLE IF NOT EXISTS `menulog` (
  `menulogID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `link` varchar(512) NOT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `pullright` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `parentID` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '1000',
  PRIMARY KEY (`menulogID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menulog`
--

INSERT INTO `menulog` (`menulogID`, `name`, `link`, `icon`, `pullright`, `status`, `parentID`, `priority`) VALUES
(1, 'dashboard', 'dashboard', 'fa-laptop', '', 1, 0, 360),
(2, 'user', 'user', 'ini-employee', '', 1, 0, 340),
(3, 'attendance', 'attendance', 'fa-user-secret', '', 1, 0, 320),
(4, 'mainpatient', '#', 'ini-mainpatient', '', 1, 0, 300),
(5, 'mainbedmanager', '#', 'ini-mainbedmanager', '', 1, 0, 280),
(6, 'mainaccount', '#', 'ini-mainaccount', '', 1, 0, 260),
(7, 'mainmedicaltest', '#', 'ini-mainmedicaltest', '', 1, 0, 240),
(8, 'mainpharmacy', '#', 'ini-mainpharmacy', '', 1, 0, 220),
(9, 'mainbloodbank', '#', 'ini-mainbloodbank', '', 1, 0, 200),
(10, 'mainambulance', '#', 'ini-mainambulance', '', 1, 0, 180),
(11, 'mainpayroll', '#', 'fa-usd', '', 1, 0, 160),
(12, 'mainleaveapplication', '#', 'ini-mainleaveapplication', '', 1, 0, 140),
(13, 'maininventory', '#', 'ini-maininventory', '', 1, 0, 120),
(14, 'mainannouncement', '#', 'fa-bullhorn', '', 1, 0, 100),
(15, 'mainfrontend', '#', 'fa-home', '', 1, 0, 80),
(16, 'mainadministrator', '#', 'ini-mainadministrator', '', 1, 0, 60),
(17, 'mainreport', '#', 'fa-clipboard', '', 1, 0, 40),
(18, 'mainsetting', '#', 'fa-gavel', '', 1, 0, 20),
(19, 'registration', 'registration', 'ini-registration', '', 1, 4, 1720),
(20, 'appointment', 'appointment', 'ini-appointment', '', 1, 4, 1700),
(21, 'admission', 'admission', 'ini-admission', '', 1, 4, 1680),
(22, 'physicalcondition', 'physicalcondition', 'ini-physicalcondition', '', 1, 4, 1660),
(23, 'patient', 'patient', 'ini-patient', '', 1, 4, 1640),
(24, 'instruction', 'instruction', 'ini-instruction', '', 1, 4, 1620),
(25, 'prescription', 'prescription', 'ini-prescription', '', 1, 4, 1600),
(26, 'discharge', 'discharge', 'ini-discharge', '', 1, 4, 1580),
(27, 'operationtheatre', 'operationtheatre', 'ini-operationtheatre', '', 1, 4, 1560),
(28, 'birthregister', 'birthregister', 'ini-birthregister', '', 1, 4, 1540),
(29, 'deathregister', 'deathregister', 'ini-deathregister', '', 1, 4, 1520),
(30, 'floor', 'floor', 'ini-floor', '', 1, 5, 1500),
(31, 'room', 'room', 'ini-room', '', 1, 5, 1480),
(32, 'ward', 'ward', 'ini-ward', '', 1, 5, 1460),
(33, 'bedtype', 'bedtype', 'ini-bedtype', '', 1, 5, 1440),
(34, 'bed', 'bed', 'ini-bed', '', 1, 5, 1420),
(35, 'bedmanager', 'bedmanager', 'ini-bedmanager', '', 1, 5, 1400),
(36, 'income', 'income', 'ini-income', '', 1, 6, 1380),
(37, 'expense', 'expense', 'ini-expense', '', 1, 6, 1360),
(38, 'billcategory', 'billcategory', 'ini-billcategory', '', 1, 6, 1340),
(39, 'billlabel', 'billlabel', 'ini-billlabel', '', 1, 6, 1320),
(40, 'bill', 'bill', 'ini-bill', '', 1, 6, 1300),
(41, 'billpayment', 'billpayment', 'ini-billpayment', '', 1, 6, 1280),
(42, 'testcategory', 'testcategory', 'ini-testcategory', '', 1, 7, 1260),
(43, 'testlabel', 'testlabel', 'ini-testlabel', '', 1, 7, 1240),
(44, 'test', 'test', 'ini-test', '', 1, 7, 1220),
(45, 'medicineunit', 'medicineunit', 'ini-medicineunit', '', 1, 8, 1200),
(46, 'medicinecategory', 'medicinecategory', 'ini-medicinecategory', '', 1, 8, 1180),
(47, 'medicinewarehouse', 'medicinewarehouse', 'ini-medicinewarehouse', '', 1, 8, 1160),
(48, 'medicinemanufacturer', 'medicinemanufacturer', 'ini-medicinemanufacturer', '', 1, 8, 1140),
(49, 'medicine', 'medicine', 'ini-medicine', '', 1, 8, 1120),
(50, 'medicinepurchase', 'medicinepurchase', 'ini-medicinepurchase', '', 1, 8, 1100),
(51, 'medicinesale', 'medicinesale', 'ini-medicinesale', '', 1, 8, 1080),
(52, 'damageandexpire', 'damageandexpire', 'ini-damageandexpire', '', 1, 8, 1060),
(53, 'medicinestock', 'medicinestock', 'ini-medicinestock', '', 1, 8, 1040),
(54, 'blooddonor', 'blooddonor', 'ini-blooddonor', '', 1, 9, 1020),
(55, 'bloodstock', 'bloodstock', 'ini-bloodstock', '', 1, 9, 1000),
(56, 'ambulance', 'ambulance', 'ini-ambulance', '', 1, 10, 980),
(57, 'ambulancecall', 'ambulancecall', 'ini-ambulancecall', '', 1, 10, 960),
(58, 'salarytemplate', 'salarytemplate', 'fa-calculator', '', 1, 11, 940),
(59, 'hourlytemplate', 'hourlytemplate', 'fa-clock-o', '', 1, 11, 920),
(60, 'managesalary', 'managesalary', 'fa-beer', '', 1, 11, 900),
(61, 'makepayment', 'makepayment', 'fa-money', '', 1, 11, 880),
(62, 'leavecategory', 'leavecategory', 'ini-leavecategory', '', 1, 12, 860),
(63, 'leaveassign', 'leaveassign', 'ini-leaveassign', '', 1, 12, 840),
(64, 'leaveapply', 'leaveapply', 'ini-leaveapply', '', 1, 12, 820),
(65, 'leaveapplication', 'leaveapplication', 'ini-leaveapplication', '', 1, 12, 800),
(66, 'itemsupplier', 'itemsupplier', 'ini-itemsupplier', '', 1, 13, 780),
(67, 'itemstore', 'itemstore', 'ini-itemstore', '', 1, 13, 760),
(68, 'itemcategory', 'itemcategory', 'ini-itemcategory', '', 1, 13, 740),
(69, 'item', 'item', 'ini-item', '', 1, 13, 720),
(70, 'itemcheckin', 'itemcheckin', 'ini-itemcheckin', '', 1, 13, 700),
(71, 'itemcheckout', 'itemcheckout', 'ini-itemcheckout', '', 1, 13, 680),
(72, 'notice', 'notice', 'fa-calendar', '', 1, 14, 660),
(73, 'event', 'event', 'fa-calendar-check-o', '', 1, 14, 640),
(74, 'postcategories', 'postcategories', 'fa-anchor', '', 1, 15, 620),
(75, 'post', 'post', 'fa-thumb-tack', '', 1, 15, 600),
(76, 'page', 'page', 'fa-connectdevelop', '', 1, 15, 580),
(77, 'frontendmenu', 'frontendmenu', 'ini-frontendmenu', '', 1, 15, 560),
(78, 'role', 'role', 'ini-role', '', 1, 16, 540),
(79, 'designation', 'designation', 'ini-designation', '', 1, 16, 520),
(80, 'resetpassword', 'resetpassword', 'ini-resetpassword', '', 1, 16, 500),
(81, 'tpa', 'tpa', 'ini-tpa', '', 1, 16, 480),
(82, 'permissions', 'permissions', 'ini-permission', '', 1, 16, 460),
(83, 'update', 'update', 'fa-refresh', '', 1, 16, 440),
(84, 'idcardreport', 'idcardreport', 'ini-idcardreport', '', 1, 17, 420),
(85, 'attendancereport', 'attendancereport', 'ini-attendancereport', '', 1, 17, 400),
(86, 'attendanceoverviewreport', 'attendanceoverviewreport', 'ini-attendanceoverviewreport', '', 1, 17, 380),
(87, 'leaveapplicationreport', 'leaveapplicationreport', 'ini-leaveapplicationreport', '', 1, 17, 360),
(88, 'appointmentreport', 'appointmentreport', 'ini-appointmentreport', '', 1, 17, 340),
(89, 'admissionreport', 'admissionreport', 'ini-admissionreport', '', 1, 17, 320),
(90, 'ambulancereport', 'ambulancereport', 'ini-ambulancereport', '', 1, 17, 300),
(91, 'bedreport', 'bedreport', 'ini-bedreport', '', 1, 17, 280),
(92, 'blooddonorreport', 'blooddonorreport', 'ini-blooddonorreport', '', 1, 17, 260),
(93, 'testreport', 'testreport', 'ini-testreport', '', 1, 17, 240),
(94, 'operationtheatrereport', 'operationtheatrereport', 'ini-operationtheatrereport', '', 1, 17, 220),
(95, 'dischargereport', 'dischargereport', 'ini-dischargereport', '', 1, 17, 200),
(96, 'medicinepurchasereport', 'medicinepurchasereport', 'ini-medicinepurchasereport', '', 1, 17, 180),
(97, 'medicinesalereport', 'medicinesalereport', 'ini-medicinesalereport', '', 1, 17, 160),
(98, 'salaryreport', 'salaryreport', 'ini-salaryreport', '', 1, 17, 140),
(99, 'incomereport', 'incomereport', 'ini-incomereport', '', 1, 17, 120),
(100, 'expensereport', 'expensereport', 'ini-expensereport', '', 1, 17, 100),
(101, 'accountledgerreport', 'accountledgerreport', 'ini-accountledgerreport', '', 1, 17, 80),
(102, 'generalsettings', 'generalsettings', 'fa-gears', '', 1, 18, 60),
(103, 'frontendsettings', 'frontendsettings', 'fa-asterisk', '', 1, 18, 40),
(104, 'emailsettings', 'emailsettings', 'ini-emailsetting', '', 1, 18, 20),
(105, 'billreport', 'billreport', 'ini-billreport', '', 1, 17, 90),
(106, 'tpareport', 'tpareport', 'ini-tpareport', '', 1, 17, 70),
(107, 'department', 'department', 'fa-microchip', '', 1, 16, 510),
(108, 'paymentsettings', 'paymentsettings', 'fa-industry', '', 1, 18, 15),
(109, 'zoomsettings', 'zoomsettings', 'fa-camera-retro', '', 1, 18, 10),
(110, 'addons', 'addons', 'fa fa-crosshairs', '', 1, 16, 450);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `noticeID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `notice` text NOT NULL,
  `date` date NOT NULL,
  `year` year(4) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`noticeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `notificationID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `itemID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `itemname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`notificationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `operationtheatre`
--

DROP TABLE IF EXISTS `operationtheatre`;
CREATE TABLE IF NOT EXISTS `operationtheatre` (
  `operationtheatreID` int(11) NOT NULL AUTO_INCREMENT,
  `operation_name` varchar(128) NOT NULL,
  `operation_type` varchar(128) NOT NULL,
  `patientID` int(11) NOT NULL,
  `operation_date` datetime NOT NULL,
  `doctorID` int(11) NOT NULL,
  `assistant_doctor_1` int(11) DEFAULT NULL,
  `assistant_doctor_2` int(11) DEFAULT NULL,
  `anesthetist` varchar(128) DEFAULT NULL,
  `anesthesia_type` varchar(128) DEFAULT NULL,
  `ot_technician` varchar(128) DEFAULT NULL,
  `ot_assistant` varchar(128) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`operationtheatreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `pageID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `content` text,
  `status` int(11) DEFAULT NULL COMMENT '1 => active, 2 => draft, 3 => trash, 4 => review  ',
  `visibility` int(11) DEFAULT NULL COMMENT '1 => public 2 => protected 3 => private ',
  `publish_date` datetime DEFAULT NULL,
  `parentID` int(11) NOT NULL DEFAULT '0',
  `pageorder` int(11) NOT NULL DEFAULT '0',
  `template` varchar(250) DEFAULT NULL,
  `featured_image` varchar(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_username` varchar(60) DEFAULT NULL,
  `create_usertypeID` int(11) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `guardianname` varchar(40) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL COMMENT '1 = Male, 2 = Female',
  `maritalstatus` int(1) DEFAULT '0',
  `phone` varchar(25) DEFAULT NULL,
  `address` text,
  `age_day` int(2) DEFAULT '0',
  `age_month` int(2) DEFAULT '0',
  `age_year` int(3) DEFAULT '0',
  `bloodgroupID` int(1) DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `patienttypeID` int(11) NOT NULL COMMENT '0 = OPD, 1 = IPD, 5 = Register',
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `delete_at` int(11) DEFAULT '0',
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

DROP TABLE IF EXISTS `payment_gateways`;
CREATE TABLE IF NOT EXISTS `payment_gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `misc` longtext,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `slug`, `misc`, `status`) VALUES
(1, 'Stripe', 'stripe', '{\n  \"js\": [\n    \"assets/inilabs/appointment/stripe.js\"\n  ],\n  \"cdn\": [\n    \"https://js.stripe.com/v3/\"\n  ],\n  \"view\": [\n    \"appointment/stripe\"\n  ]\n}', 0),
(2, 'Razorpay', 'razorpay', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_option`
--

DROP TABLE IF EXISTS `payment_gateway_option`;
CREATE TABLE IF NOT EXISTS `payment_gateway_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_gateway_id` int(11) NOT NULL,
  `payment_option` varchar(100) NOT NULL,
  `payment_value` text,
  `type` varchar(100) NOT NULL,
  `activities` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_gateway_option`
--

INSERT INTO `payment_gateway_option` (`id`, `payment_gateway_id`, `payment_option`, `payment_value`, `type`, `activities`) VALUES
(1, 1, 'stripe_key', '', 'text', NULL),
(2, 1, 'stripe_secret', '', 'text', NULL),
(3, 1, 'stripe_status', '0', 'select', '{\"0\":\"Disable\", \"1\":\"Enable\"}'),
(4, 2, 'razorpay_key', '', 'text', NULL),
(5, 2, 'razorpay_secret', '', 'text', NULL),
(6, 2, 'razorpay_status', '0', 'select', '{\"0\":\"Disable\", \"1\":\"Enable\"}');

-- --------------------------------------------------------

--
-- Table structure for table `permissionlog`
--

DROP TABLE IF EXISTS `permissionlog`;
CREATE TABLE IF NOT EXISTS `permissionlog` (
  `permissionlogID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'In most cases, this should be the name of the module (e.g. news)',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`permissionlogID`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissionlog`
--

INSERT INTO `permissionlog` (`permissionlogID`, `name`, `description`, `active`) VALUES
(1, 'dashboard', 'Dashboard', 'yes'),
(2, 'user', 'Employee', 'yes'),
(3, 'user_add', 'Employee Add', 'yes'),
(4, 'user_edit', 'Employee Edit', 'yes'),
(5, 'user_delete', 'Employee Delete', 'yes'),
(6, 'user_view', 'Employee View', 'yes'),
(7, 'attendance', 'Attendance', 'yes'),
(8, 'attendance_add', 'Attendance Add', 'yes'),
(9, 'attendance_view', 'Attendance View', 'yes'),
(10, 'registration', 'Registration', 'yes'),
(11, 'registration_add', 'Registration Add', 'yes'),
(12, 'registration_edit', 'Registration Edit', 'yes'),
(13, 'registration_delete', 'Registration Delete', 'yes'),
(14, 'registration_view', 'Registration View', 'yes'),
(15, 'appointment', 'Appointment', 'yes'),
(16, 'appointment_add', 'Appointment Add', 'yes'),
(17, 'appointment_edit', 'Appointment Edit', 'yes'),
(18, 'appointment_delete', 'Appointment Delete', 'yes'),
(19, 'appointment_view', 'Appointment View', 'yes'),
(20, 'admission', 'Admission', 'yes'),
(21, 'admission_add', 'Admission Add', 'yes'),
(22, 'admission_edit', 'Admission Edit', 'yes'),
(23, 'admission_delete', 'Admission Delete', 'yes'),
(24, 'admission_view', 'Admission View', 'yes'),
(25, 'physicalcondition', 'Physical Condition', 'yes'),
(26, 'physicalcondition_add', 'Physical Condition Add', 'yes'),
(27, 'physicalcondition_edit', 'Physical Condition Edit', 'yes'),
(28, 'physicalcondition_delete', 'Physical Condition Delete', 'yes'),
(29, 'physicalcondition_view', 'Physical Condition View', 'yes'),
(30, 'patient', 'Patient', 'yes'),
(31, 'patient_add', 'Patient Add', 'yes'),
(32, 'patient_edit', 'Patient_edit', 'yes'),
(33, 'patient_delete', 'Patient Delete', 'yes'),
(34, 'patient_view', 'Patient View', 'yes'),
(35, 'instruction', 'Instruction', 'yes'),
(36, 'instruction_add', 'Instruction Add', 'yes'),
(37, 'instruction_edit', 'Instruction Edit', 'yes'),
(38, 'instruction_delete', 'Instruction Delete', 'yes'),
(39, 'instruction_view', 'Instruction View', 'yes'),
(40, 'prescription', 'Prescription', 'yes'),
(41, 'prescription_add', 'Prescription Add', 'yes'),
(42, 'prescription_edit', 'Prescription Edit', 'yes'),
(43, 'prescription_delete', 'Prescription Delete', 'yes'),
(44, 'prescription_view', 'Prescription View', 'yes'),
(45, 'discharge', 'Discharge', 'yes'),
(46, 'discharge_add', 'Discharge Add', 'yes'),
(47, 'discharge_edit', 'Discharge Edit', 'yes'),
(48, 'discharge_delete', 'Discharge Delete', 'yes'),
(49, 'discharge_view', 'Discharge View', 'yes'),
(50, 'operationtheatre', 'Operation Theatre', 'yes'),
(51, 'operationtheatre_add', 'Operation Theatre Add', 'yes'),
(52, 'operationtheatre_edit', 'Operation Theatre Edit', 'yes'),
(53, 'operationtheatre_delete', 'Operation Theatre Delete', 'yes'),
(54, 'operationtheatre_view', 'Operation Theatre View', 'yes'),
(55, 'birthregister', 'Birth Register', 'yes'),
(56, 'birthregister_add', 'Birth Register Add', 'yes'),
(57, 'birthregister_edit', 'Birth Register Edit', 'yes'),
(58, 'birthregister_delete', 'Birth Register Delete', 'yes'),
(59, 'birthregister_view', 'Birth Register View', 'yes'),
(60, 'deathregister', 'Death Register', 'yes'),
(61, 'deathregister_add', 'Death Register Add', 'yes'),
(62, 'deathregister_edit', 'Death Register Edit', 'yes'),
(63, 'deathregister_delete', 'Death Register Delete', 'yes'),
(64, 'deathregister_view', 'Death Register View', 'yes'),
(65, 'floor', 'Floor', 'yes'),
(66, 'floor_add', 'Floor Add', 'yes'),
(67, 'floor_edit', 'Floor Edit', 'yes'),
(68, 'room', 'Room', 'yes'),
(69, 'room_add', 'Room Add', 'yes'),
(70, 'room_edit', 'Room Edit', 'yes'),
(71, 'room_delete', 'Room Delete', 'yes'),
(72, 'room_view', 'Room View', 'yes'),
(73, 'ward', 'Ward', 'yes'),
(74, 'ward_add', 'Ward Add', 'yes'),
(75, 'ward_edit', 'Ward Add', 'yes'),
(76, 'ward_delete', 'Ward Delete', 'yes'),
(77, 'bedtype', 'Bed Type', 'yes'),
(78, 'bedtype_add', 'Bed Type Add', 'yes'),
(79, 'bedtype_edit', 'Bed Type Edit', 'yes'),
(80, 'bedtype_delete', 'Bed Type Delete', 'yes'),
(81, 'bed', 'Bed', 'yes'),
(82, 'bed_add', 'Bed Add', 'yes'),
(83, 'bed_edit', 'Bed Edit', 'yes'),
(84, 'bed_delete', 'Bed Delete', 'yes'),
(85, 'bedmanager', 'Bed Manager', 'yes'),
(86, 'income', 'Income', 'yes'),
(87, 'income_add', 'Income Add', 'yes'),
(88, 'income_edit', 'Income Edit', 'yes'),
(89, 'income_delete', 'Income Delete', 'yes'),
(90, 'expense', 'Expense', 'yes'),
(91, 'expense_add', 'Expense Add', 'yes'),
(92, 'expense_edit', 'Expense Edit', 'yes'),
(93, 'expense_delete', 'Expense Delete', 'yes'),
(94, 'billcategory', 'Bill Category', 'yes'),
(95, 'billcategory_add', 'Bill Category Add', 'yes'),
(96, 'billcategory_edit', 'Bill Category Edit', 'yes'),
(97, 'billcategory_delete', 'Bill Category Delete', 'yes'),
(98, 'billlabel', 'Bill Label', 'yes'),
(99, 'billlabel_add', 'Bill Label Add', 'yes'),
(100, 'billlabel_edit', 'Bill Label Edit', 'yes'),
(101, 'billlabel_delete', 'Bill Label Delete', 'yes'),
(102, 'bill', 'Bill', 'yes'),
(103, 'bill_add', 'Bill Add', 'yes'),
(104, 'bill_edit', 'Bill Edit', 'yes'),
(105, 'bill_delete', 'Bill Delete', 'yes'),
(106, 'bill_view', 'Bill View', 'yes'),
(107, 'billpayment', 'Bill Payment', 'yes'),
(108, 'billpayment_add', 'Bill Payment Add', 'yes'),
(109, 'billpayment_edit', 'Bill Payment Edit', 'yes'),
(110, 'billpayment_delete', 'Bill Payment Delete', 'yes'),
(111, 'billpayment_view', 'Bill Payment View', 'yes'),
(112, 'testcategory', 'Test Category', 'yes'),
(113, 'testcategory_add', 'Test Category Add', 'yes'),
(114, 'testcategory_edit', 'Test Category Edit', 'yes'),
(115, 'testcategory_delete', 'Test Category Delete', 'yes'),
(116, 'testlabel', 'Test Label', 'yes'),
(117, 'testlabel_add', 'Test Label Add', 'yes'),
(118, 'testlabel_edit', 'Test Label Edit', 'yes'),
(119, 'testlabel_delete', 'Test Label Delete', 'yes'),
(120, 'test', 'Test', 'yes'),
(121, 'test_add', 'Test Add', 'yes'),
(122, 'test_edit', 'Test Edit', 'yes'),
(123, 'test_delete', 'Test Delete', 'yes'),
(124, 'test_view', 'Test View', 'yes'),
(125, 'medicineunit', 'Medicine Unit', 'yes'),
(126, 'medicineunit_add', 'Medicine Unit Add', 'yes'),
(127, 'medicineunit_edit', 'Medicine Unit Edit', 'yes'),
(128, 'medicineunit_delete', 'Medicine Unit Delete', 'yes'),
(129, 'medicinecategory', 'Medicine Category', 'yes'),
(130, 'medicinecategory_add', 'Medicine Category Add', 'yes'),
(131, 'medicinecategory_edit', 'Medicine Category Edit', 'yes'),
(132, 'medicinecategory_delete', 'Medicine Category Delete', 'yes'),
(133, 'medicinewarehouse', 'Medicine Warehouse', 'yes'),
(134, 'medicinewarehouse_add', 'Medicine Warehouse Add', 'yes'),
(135, 'medicinewarehouse_edit', 'Medicine Warehouse Edit', 'yes'),
(136, 'medicinewarehouse_delete', 'Medicine Warehouse Delete', 'yes'),
(137, 'medicinewarehouse_view', 'Medicine Warehouse View', 'yes'),
(138, 'medicinemanufacturer', 'Medicine Manufacturer', 'yes'),
(139, 'medicinemanufacturer_add', 'Medicine Manufacturer Add', 'yes'),
(140, 'medicinemanufacturer_edit', 'Medicine Manufacturer Edit', 'yes'),
(141, 'medicinemanufacturer_delete', 'Medicine Manufacturer Delete', 'yes'),
(142, 'medicinemanufacturer_view', 'Medicine Manufacturer View', 'yes'),
(143, 'medicine', 'Medicine', 'yes'),
(144, 'medicine_add', 'Medicine Add', 'yes'),
(145, 'medicine_edit', 'Medicine Edit', 'yes'),
(146, 'medicine_delete', 'Medicine Delete', 'yes'),
(147, 'medicine_view', 'Medicine View', 'yes'),
(148, 'medicinepurchase', 'Medicine Purchase', 'yes'),
(149, 'medicinepurchase_add', 'Medicine Purchase Add', 'yes'),
(150, 'medicinepurchase_edit', 'Medicine Purchase Edit', 'yes'),
(151, 'medicinepurchase_delete', 'Medicine Purchase Delete', 'yes'),
(152, 'medicinepurchase_view', 'Medicine Purchase View', 'yes'),
(153, 'medicinesale', 'Medicine Sale', 'yes'),
(154, 'medicinesale_add', 'Medicine Sale Add', 'yes'),
(155, 'medicinesale_edit', 'Medicine Sale Edit', 'yes'),
(156, 'medicinesale_delete', 'Medicine Sale Delete', 'yes'),
(157, 'medicinesale_view', 'Medicine Sale View', 'yes'),
(158, 'damageandexpire', 'Damage & Expire', 'yes'),
(159, 'damageandexpire_add', 'Damage & Expire Add', 'yes'),
(160, 'damageandexpire_edit', 'Damage & Expire Edit', 'yes'),
(161, 'damageandexpire_delete', 'Damage & Expire Delete', 'yes'),
(162, 'damageandexpire_view', 'Damage & Expire View', 'yes'),
(163, 'medicinestock', 'Medicine Stock', 'yes'),
(164, 'blooddonor', 'Blood Donor', 'yes'),
(165, 'blooddonor_add', 'Blood Donor Add', 'yes'),
(166, 'blooddonor_edit', 'Blood Donor Edit', 'yes'),
(167, 'blooddonor_delete', 'Blood Donor Delete', 'yes'),
(168, 'blooddonor_view', 'Blood Donor View', 'yes'),
(169, 'bloodstock', 'Blood Stock', 'yes'),
(170, 'bloodstock_add', 'Blood Stock Add', 'yes'),
(171, 'bloodstock_edit', 'Blood Stock Edit', 'yes'),
(172, 'bloodstock_delete', 'Blood Stock Delete', 'yes'),
(173, 'bloodstock_view', 'Blood Stock View', 'yes'),
(174, 'ambulance', 'Ambulance', 'yes'),
(175, 'ambulance_add', 'Ambulance Add', 'yes'),
(176, 'ambulance_edit', 'Ambulance Edit', 'yes'),
(177, 'ambulance_delete', 'Ambulance Delete', 'yes'),
(178, 'ambulance_view', 'Ambulance View', 'yes'),
(179, 'ambulancecall', 'Ambulance Call', 'yes'),
(180, 'ambulancecall_add', 'Ambulance Call Add', 'yes'),
(181, 'ambulancecall_edit', 'Ambulance Call Edit', 'yes'),
(182, 'ambulancecall_delete', 'Ambulance Call Delete', 'yes'),
(183, 'ambulancecall_view', 'Ambulance Call View', 'yes'),
(184, 'salarytemplate', 'Salary Template', 'yes'),
(185, 'salarytemplate_add', 'Salary Template Add', 'yes'),
(186, 'salarytemplate_edit', 'Salary Template Edit', 'yes'),
(187, 'salarytemplate_delete', 'Salary Template Delete', 'yes'),
(188, 'salarytemplate_view', 'Salary Template View', 'yes'),
(189, 'hourlytemplate', 'Hourly Template', 'yes'),
(190, 'hourlytemplate_add', 'Hourly Template Add', 'yes'),
(191, 'hourlytemplate_edit', 'Hourly Template Edit', 'yes'),
(192, 'hourlytemplate_delete', 'Hourly Template Delete', 'yes'),
(193, 'managesalary', 'Manage Salary', 'yes'),
(194, 'managesalary_add', 'Manage Salary Add', 'yes'),
(195, 'managesalary_edit', 'Manage Salary Edit', 'yes'),
(196, 'managesalary_delete', 'Manage Salary Delete', 'yes'),
(197, 'managesalary_view', 'Manage Salary View', 'yes'),
(198, 'makepayment', 'Make Payment', 'yes'),
(199, 'leavecategory', 'Leave Category', 'yes'),
(200, 'leavecategory_add', 'Leave Category Add', 'yes'),
(201, 'leavecategory_edit', 'Leave Category Edit', 'yes'),
(202, 'leavecategory_delete', 'Leave Category Delete', 'yes'),
(203, 'leaveassign', 'Leave Assign', 'yes'),
(204, 'leaveassign_add', 'Leave Assign Add', 'yes'),
(205, 'leaveassign_edit', 'Leave Assign Edit', 'yes'),
(206, 'leaveassign_delete', 'Leave Assign Delete', 'yes'),
(207, 'leaveapply', 'Leave Apply', 'yes'),
(208, 'leaveapply_add', 'Leave Apply  Add', 'yes'),
(209, 'leaveapply_edit', 'Leave Apply  Edit', 'yes'),
(210, 'leaveapply_delete', 'Leave Apply Delete', 'yes'),
(211, 'leaveapply_view', 'Leaveapply View', 'yes'),
(212, 'leaveapplication', 'Leave Application', 'yes'),
(213, 'itemsupplier', 'Item Supplier', 'yes'),
(214, 'itemsupplier_add', 'Item Supplier Add', 'yes'),
(215, 'itemsupplier_edit', 'Item Supplier Edit', 'yes'),
(216, 'itemsupplier_delete', 'Item Supplier Delete', 'yes'),
(217, 'itemsupplier_view', 'Item Supplier View', 'yes'),
(218, 'itemstore', 'Item Store', 'yes'),
(219, 'itemstore_add', 'Item Store Add', 'yes'),
(220, 'itemstore_edit', 'Item Store Edit', 'yes'),
(221, 'itemstore_delete', 'Item Store Delete', 'yes'),
(222, 'itemstore_view', 'Item Store View', 'yes'),
(223, 'itemcategory', 'Item Category', 'yes'),
(224, 'itemcategory_add', 'Item Category Add', 'yes'),
(225, 'itemcategory_edit', 'Item Category Edit', 'yes'),
(226, 'itemcategory_delete', 'Item Category Delete', 'yes'),
(227, 'itemcategory_view', 'Item Category View', 'yes'),
(228, 'item', 'Item', 'yes'),
(229, 'item_add', 'Item Add', 'yes'),
(230, 'item_edit', 'Item Edit', 'yes'),
(231, 'item_delete', 'Item Delete', 'yes'),
(232, 'item_view', 'Item View', 'yes'),
(233, 'itemcheckin', 'Item Check In', 'yes'),
(234, 'itemcheckin_add', 'Item Check In Add', 'yes'),
(235, 'itemcheckin_edit', 'Item Check In Edit', 'yes'),
(236, 'itemcheckin_delete', 'Item Check In Delete', 'yes'),
(237, 'itemcheckin_view', 'Item Check In View', 'yes'),
(238, 'itemcheckout', 'Item Check Out', 'yes'),
(239, 'itemcheckout_add', 'Item Check Out Add', 'yes'),
(240, 'itemcheckout_edit', 'Item Check Out Edit', 'yes'),
(241, 'itemcheckout_delete', 'Item Check Out Delete', 'yes'),
(242, 'itemcheckout_view', 'Item Check Out View', 'yes'),
(243, 'notice', 'Notice', 'yes'),
(244, 'notice_add', 'Notice Add', 'yes'),
(245, 'notice_edit', 'Notice Edit', 'yes'),
(246, 'notice_delete', 'Notice Delete', 'yes'),
(247, 'notice_view', 'Notice View', 'yes'),
(248, 'event', 'Event', 'yes'),
(249, 'event_add', 'Event Add', 'yes'),
(250, 'event_edit', 'Event Edit', 'yes'),
(251, 'event_delete', 'Event Delete', 'yes'),
(252, 'event_view', 'Event View', 'yes'),
(253, 'postcategories', 'Post Categories', 'yes'),
(254, 'postcategories_add', 'Post Categories  Add', 'yes'),
(255, 'postcategories_edit', 'Post Categories Edit', 'yes'),
(256, 'postcategories_delete', 'Post Categories Delete', 'yes'),
(257, 'post', 'Post', 'yes'),
(258, 'post_add', 'Post Add', 'yes'),
(259, 'post_edit', 'Post Edit', 'yes'),
(260, 'post_delete', 'Post Delete', 'yes'),
(261, 'page', 'Page', 'yes'),
(262, 'page_add', 'Page Add', 'yes'),
(263, 'page_edit', 'Page Edit', 'yes'),
(264, 'page_delete', 'Page Delete', 'yes'),
(265, 'frontendmenu', 'Menu', 'yes'),
(266, 'role', 'Role', 'yes'),
(267, 'role_add', 'Role Add', 'yes'),
(268, 'role_edit', 'Role Edit', 'yes'),
(269, 'role_delete', 'Role Delete', 'yes'),
(270, 'designation', 'Designation', 'yes'),
(271, 'designation_add', 'Designation Add', 'yes'),
(272, 'designation_edit', 'Designation Edit', 'yes'),
(273, 'designation_delete', 'Designation Delete', 'yes'),
(274, 'resetpassword', 'Reset Password', 'yes'),
(275, 'tpa', 'TPA', 'yes'),
(276, 'tpa_add', 'TPA Add', 'yes'),
(277, 'tpa_edit', 'TPA Edit', 'yes'),
(278, 'tpa_delete', 'TPA Delete', 'yes'),
(279, 'tpa_view', 'TPA View', 'yes'),
(280, 'permissions', 'Permission', 'yes'),
(281, 'update', 'Update', 'yes'),
(282, 'idcardreport', 'ID Card Report', 'yes'),
(283, 'attendancereport', 'Attendance Report', 'yes'),
(284, 'attendanceoverviewreport', 'Attendance Overview Report', 'yes'),
(285, 'leaveapplicationreport', 'Leave Application Report', 'yes'),
(286, 'appointmentreport', 'Appointment Report', 'yes'),
(287, 'admissionreport', 'Admission Report', 'yes'),
(288, 'ambulancereport', 'Ambulance Report', 'yes'),
(289, 'bedreport', 'Bed Report', 'yes'),
(290, 'blooddonorreport', 'Blood Donor Report', 'yes'),
(291, 'testreport', 'Test Report', 'yes'),
(292, 'operationtheatrereport', 'Operation Theatre Report', 'yes'),
(293, 'dischargereport', 'Discharge Report', 'yes'),
(294, 'medicinepurchasereport', 'Medicine Purchase Report', 'yes'),
(295, 'medicinesalereport', 'Medicine Sale Report', 'yes'),
(296, 'salaryreport', 'Salary Report', 'yes'),
(297, 'incomereport', 'Income Report', 'yes'),
(298, 'expensereport', 'Expense Report', 'yes'),
(299, 'billreport', 'Bill Report', 'yes'),
(300, 'accountledgerreport', 'Account Ledger Report', 'yes'),
(301, 'tpareport', 'TPA Report', 'yes'),
(302, 'generalsettings', 'General Setting', 'yes'),
(303, 'frontendsettings', 'Frontend Setting', 'yes'),
(304, 'emailsettings', 'Email Setting', 'yes'),
(305, 'paymentsettings', 'Payment Settings', 'yes'),
(306, 'zoomsettings', 'Zoom Setting', 'yes'),
(307, 'floor_delete', 'Floor Delete', 'yes'),
(308, 'ward_view', 'Ward View', 'yes'),
(309, 'department', 'Department', 'yes'),
(310, 'department_add', 'Department Add', 'yes'),
(311, 'department_edit', 'Department Edit', 'yes'),
(312, 'department_delete', 'Department Delete', 'yes'),
(313, 'addons', 'Addons', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `permissionlogID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permissionlogID`, `roleID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(307, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(308, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 1),
(267, 1),
(268, 1),
(269, 1),
(270, 1),
(271, 1),
(272, 1),
(273, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(278, 1),
(279, 1),
(280, 1),
(281, 1),
(282, 1),
(283, 1),
(284, 1),
(285, 1),
(286, 1),
(287, 1),
(288, 1),
(289, 1),
(290, 1),
(291, 1),
(292, 1),
(293, 1),
(294, 1),
(295, 1),
(296, 1),
(297, 1),
(298, 1),
(299, 1),
(300, 1),
(301, 1),
(302, 1),
(303, 1),
(304, 1),
(305, 1),
(306, 1),
(309, 1),
(310, 1),
(311, 1),
(312, 1),
(313, 1),
(1, 2),
(15, 2),
(16, 2),
(17, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(44, 2),
(50, 2),
(51, 2),
(52, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(64, 2),
(85, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(211, 2),
(243, 2),
(247, 2),
(248, 2),
(252, 2),
(1, 3),
(15, 3),
(16, 3),
(19, 3),
(25, 3),
(29, 3),
(30, 3),
(34, 3),
(40, 3),
(44, 3),
(45, 3),
(49, 3),
(102, 3),
(106, 3),
(107, 3),
(111, 3),
(120, 3),
(124, 3),
(153, 3),
(157, 3),
(164, 3),
(168, 3),
(243, 3),
(247, 3),
(1, 4),
(2, 4),
(6, 4),
(7, 4),
(9, 4),
(10, 4),
(14, 4),
(15, 4),
(19, 4),
(20, 4),
(24, 4),
(30, 4),
(34, 4),
(86, 4),
(87, 4),
(88, 4),
(90, 4),
(91, 4),
(92, 4),
(94, 4),
(95, 4),
(96, 4),
(98, 4),
(99, 4),
(100, 4),
(102, 4),
(103, 4),
(104, 4),
(106, 4),
(107, 4),
(108, 4),
(109, 4),
(111, 4),
(184, 4),
(185, 4),
(186, 4),
(187, 4),
(188, 4),
(189, 4),
(190, 4),
(191, 4),
(192, 4),
(193, 4),
(194, 4),
(195, 4),
(196, 4),
(197, 4),
(198, 4),
(207, 4),
(208, 4),
(209, 4),
(210, 4),
(211, 4),
(213, 4),
(214, 4),
(215, 4),
(217, 4),
(218, 4),
(219, 4),
(220, 4),
(222, 4),
(223, 4),
(224, 4),
(225, 4),
(227, 4),
(228, 4),
(229, 4),
(230, 4),
(232, 4),
(233, 4),
(234, 4),
(235, 4),
(237, 4),
(238, 4),
(239, 4),
(240, 4),
(242, 4),
(243, 4),
(247, 4),
(248, 4),
(252, 4),
(282, 4),
(283, 4),
(284, 4),
(285, 4),
(286, 4),
(287, 4),
(288, 4),
(290, 4),
(294, 4),
(295, 4),
(296, 4),
(297, 4),
(298, 4),
(299, 4),
(300, 4),
(301, 4),
(1, 5),
(10, 5),
(11, 5),
(12, 5),
(14, 5),
(15, 5),
(16, 5),
(17, 5),
(19, 5),
(20, 5),
(21, 5),
(22, 5),
(24, 5),
(30, 5),
(31, 5),
(34, 5),
(50, 5),
(51, 5),
(52, 5),
(54, 5),
(85, 5),
(102, 5),
(103, 5),
(104, 5),
(106, 5),
(107, 5),
(108, 5),
(109, 5),
(111, 5),
(116, 5),
(117, 5),
(118, 5),
(153, 5),
(157, 5),
(164, 5),
(168, 5),
(179, 5),
(180, 5),
(181, 5),
(183, 5),
(207, 5),
(208, 5),
(209, 5),
(210, 5),
(211, 5),
(243, 5),
(247, 5),
(248, 5),
(252, 5),
(286, 5),
(287, 5),
(288, 5),
(289, 5),
(290, 5),
(292, 5),
(295, 5),
(299, 5),
(1, 6),
(20, 6),
(24, 6),
(102, 6),
(103, 6),
(106, 6),
(125, 6),
(126, 6),
(127, 6),
(129, 6),
(130, 6),
(131, 6),
(133, 6),
(134, 6),
(135, 6),
(137, 6),
(138, 6),
(139, 6),
(140, 6),
(142, 6),
(143, 6),
(144, 6),
(145, 6),
(147, 6),
(148, 6),
(149, 6),
(150, 6),
(152, 6),
(153, 6),
(154, 6),
(155, 6),
(157, 6),
(158, 6),
(159, 6),
(160, 6),
(162, 6),
(163, 6),
(207, 6),
(208, 6),
(209, 6),
(210, 6),
(211, 6),
(243, 6),
(247, 6),
(248, 6),
(252, 6),
(294, 6),
(295, 6),
(1, 7),
(30, 7),
(34, 7),
(112, 7),
(113, 7),
(114, 7),
(116, 7),
(117, 7),
(118, 7),
(120, 7),
(121, 7),
(122, 7),
(124, 7),
(164, 7),
(165, 7),
(166, 7),
(168, 7),
(169, 7),
(170, 7),
(171, 7),
(173, 7),
(207, 7),
(208, 7),
(209, 7),
(210, 7),
(211, 7),
(243, 7),
(247, 7),
(248, 7),
(252, 7),
(291, 7),
(1, 8),
(30, 8),
(34, 8),
(112, 8),
(113, 8),
(114, 8),
(116, 8),
(117, 8),
(118, 8),
(120, 8),
(121, 8),
(122, 8),
(124, 8),
(164, 8),
(165, 8),
(166, 8),
(168, 8),
(169, 8),
(170, 8),
(171, 8),
(173, 8),
(207, 8),
(208, 8),
(209, 8),
(210, 8),
(211, 8),
(243, 8),
(247, 8),
(248, 8),
(252, 8),
(291, 8),
(1, 9),
(10, 9),
(11, 9),
(12, 9),
(14, 9),
(15, 9),
(16, 9),
(17, 9),
(19, 9),
(20, 9),
(21, 9),
(22, 9),
(24, 9),
(25, 9),
(26, 9),
(27, 9),
(29, 9),
(45, 9),
(46, 9),
(47, 9),
(49, 9),
(55, 9),
(56, 9),
(57, 9),
(59, 9),
(60, 9),
(61, 9),
(62, 9),
(64, 9),
(73, 9),
(85, 9),
(169, 9),
(173, 9),
(179, 9),
(180, 9),
(181, 9),
(183, 9),
(207, 9),
(208, 9),
(209, 9),
(210, 9),
(211, 9),
(243, 9),
(247, 9),
(248, 9),
(252, 9),
(286, 9),
(287, 9),
(288, 9),
(289, 9),
(290, 9),
(293, 9);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `content` text,
  `status` int(11) DEFAULT NULL COMMENT '1 => active, 2 => draft, 3 => trash, 4 => review  ',
  `visibility` int(11) DEFAULT NULL COMMENT '1 => public 2 => protected 3 => private ',
  `publish_date` datetime DEFAULT NULL,
  `parentID` int(11) NOT NULL DEFAULT '0',
  `postorder` int(11) NOT NULL DEFAULT '0',
  `featured_image` varchar(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `postcategories`
--

DROP TABLE IF EXISTS `postcategories`;
CREATE TABLE IF NOT EXISTS `postcategories` (
  `postcategoriesID` int(11) NOT NULL AUTO_INCREMENT,
  `postcategories` varchar(40) DEFAULT NULL,
  `postslug` varchar(250) DEFAULT NULL,
  `postparent` int(11) DEFAULT '0',
  `postdescription` text,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`postcategoriesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `postcategory`
--

DROP TABLE IF EXISTS `postcategory`;
CREATE TABLE IF NOT EXISTS `postcategory` (
  `postcategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `postID` int(11) NOT NULL,
  `postcategoriesID` int(11) NOT NULL,
  PRIMARY KEY (`postcategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE IF NOT EXISTS `prescription` (
  `prescriptionID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patientID` int(11) DEFAULT NULL,
  `patienttypeID` int(11) DEFAULT NULL,
  `appointmentandadmissionID` int(11) DEFAULT NULL,
  `visitno` int(11) DEFAULT NULL,
  `advice` longtext,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  `doctorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`prescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptionitem`
--

DROP TABLE IF EXISTS `prescriptionitem`;
CREATE TABLE IF NOT EXISTS `prescriptionitem` (
  `prescriptionitemID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prescriptionID` int(11) DEFAULT NULL,
  `medicine` text,
  `instruction` longtext,
  PRIMARY KEY (`prescriptionitemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resetpassword`
--

DROP TABLE IF EXISTS `resetpassword`;
CREATE TABLE IF NOT EXISTS `resetpassword` (
  `resetpasswordID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`resetpasswordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT COMMENT '1 = Admin, 2 = Doctor, 3 = Patient',
  `role` varchar(40) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `role`, `create_date`, `modify_date`, `create_userID`, `create_roleID`) VALUES
(1, 'Admin', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(2, 'Doctor', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(3, 'Patient', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(4, 'Accountant', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(5, 'Biller', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(6, 'Pharmacist', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(7, 'Pathologist', '2019-04-24 05:13:57', '2019-04-24 05:13:57', 1, 1),
(8, 'Radiologist', '2019-04-24 05:13:57', '2019-09-14 17:49:41', 1, 1),
(9, 'Receptionist', '2019-04-24 05:13:57', '2019-09-14 17:49:41', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `roomID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `description` text,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`roomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salaryoption`
--

DROP TABLE IF EXISTS `salaryoption`;
CREATE TABLE IF NOT EXISTS `salaryoption` (
  `salaryoptionID` int(11) NOT NULL AUTO_INCREMENT,
  `salarytemplateID` int(11) NOT NULL,
  `option_type` int(11) NOT NULL COMMENT 'Allowances =1, Dllowances = 2, Increment = 3',
  `label_name` varchar(128) DEFAULT NULL,
  `label_amount` double NOT NULL,
  PRIMARY KEY (`salaryoptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salarytemplate`
--

DROP TABLE IF EXISTS `salarytemplate`;
CREATE TABLE IF NOT EXISTS `salarytemplate` (
  `salarytemplateID` int(11) NOT NULL AUTO_INCREMENT,
  `salary_grades` varchar(128) NOT NULL,
  `basic_salary` text NOT NULL,
  `overtime_rate` text NOT NULL,
  PRIMARY KEY (`salarytemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `sliderID` int(11) NOT NULL AUTO_INCREMENT,
  `pageID` int(11) NOT NULL,
  `slider` int(11) NOT NULL,
  PRIMARY KEY (`sliderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `smssettings`
--

DROP TABLE IF EXISTS `smssettings`;
CREATE TABLE IF NOT EXISTS `smssettings` (
  `smssettingsID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `types` varchar(255) DEFAULT NULL,
  `field_names` varchar(255) DEFAULT NULL,
  `field_values` varchar(255) DEFAULT NULL,
  `smssettings_extra` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`smssettingsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `testID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `billID` int(11) UNSIGNED DEFAULT NULL,
  `testcategoryID` int(11) UNSIGNED DEFAULT NULL,
  `testlabelID` int(11) UNSIGNED DEFAULT NULL,
  `testnote` text,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) DEFAULT NULL,
  `create_roleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`testID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testcategory`
--

DROP TABLE IF EXISTS `testcategory`;
CREATE TABLE IF NOT EXISTS `testcategory` (
  `testcategoryID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`testcategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testfile`
--

DROP TABLE IF EXISTS `testfile`;
CREATE TABLE IF NOT EXISTS `testfile` (
  `testfileID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `testID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `fileoriginalname` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`testfileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testlabel`
--

DROP TABLE IF EXISTS `testlabel`;
CREATE TABLE IF NOT EXISTS `testlabel` (
  `testlabelID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `testcategoryID` int(11) UNSIGNED NOT NULL,
  `discount` int(3) UNSIGNED NOT NULL,
  `amount` float UNSIGNED NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL DEFAULT '0',
  `create_roleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`testlabelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tpa`
--

DROP TABLE IF EXISTS `tpa`;
CREATE TABLE IF NOT EXISTS `tpa` (
  `tpaID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `code` varchar(60) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(20) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `contact_person_name` varchar(60) DEFAULT '',
  `contact_person_phone` varchar(20) DEFAULT '',
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`tpaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `update`
--

DROP TABLE IF EXISTS `update`;
CREATE TABLE IF NOT EXISTS `update` (
  `updateID` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  `log` longtext NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`updateID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `update`
--

INSERT INTO `update` (`updateID`, `version`, `date`, `userID`, `roleID`, `log`, `status`) VALUES
(1, '1.1', '2021-08-27 04:53:54', 1, 1, '<h4>1. initial install</h4>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `designationID` int(11) NOT NULL,
  `description` varchar(255) DEFAULT '',
  `gender` varchar(10) NOT NULL COMMENT '1 = male, 2 = femal',
  `dob` date NOT NULL,
  `jod` date NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` tinytext,
  `address` text,
  `roleID` int(11) NOT NULL,
  `religion` varchar(25) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(128) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `patientID` int(11) DEFAULT '0',
  `delete_at` int(1) DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `name`, `designationID`, `description`, `gender`, `dob`, `jod`, `email`, `phone`, `address`, `roleID`, `religion`, `photo`, `username`, `password`, `create_date`, `modify_date`, `create_userID`, `create_roleID`, `status`, `patientID`, `delete_at`) VALUES
(1, 'paul', 1, '', '1', '1985-10-30', '2021-08-31', 'dawdw@daw.com', '2222222222', 'nieria', 1, 'not', 'default.png', 'admin', 'ddc2bb52d561fc4335678bc99ab45788a9ff3bff5c321211d2ff4a8cb9058c6a94bfcee16c18c3f6311c7bb5c81edb0d776e2db7d8b93bd3a388524a7e334af1', '2021-08-27 04:53:54', '2021-08-27 04:53:54', 1, 1, 1, 0, 0),
(2, 'awdawdwa', 3, 'Dental Surgeon', '1', '1980-07-16', '2021-08-01', 'awdwa@dwa.com', '08077005371', 'awdaw', 2, 'CHRISTIANITY', '22aabc454148f8affab285f08f7333e6d698dfee7cbb19e6ed98cc4de363aeca82dcbe15ed0c216dd24bf76cac888f48edb3b0269eb256fa8b6b57c2726044ab.jpg', 'adwwd', 'a7841312092f5faa3851becc286d26cea2d9999dd1699cb3fe3b9a6074936c4026df282312d6574727a03fadcabaf0d0871b388bd6b974f6658d054e7282e77e', '2021-08-27 13:49:09', '2021-08-27 13:49:09', 1, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

DROP TABLE IF EXISTS `ward`;
CREATE TABLE IF NOT EXISTS `ward` (
  `wardID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `floorID` int(11) NOT NULL,
  `roomID` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `create_userID` int(11) NOT NULL,
  `create_roleID` int(11) NOT NULL,
  PRIMARY KEY (`wardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zoomsettings`
--

DROP TABLE IF EXISTS `zoomsettings`;
CREATE TABLE IF NOT EXISTS `zoomsettings` (
  `id` int(11) UNSIGNED NOT NULL,
  `client_id` varchar(765) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_secret` varchar(765) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_key` varchar(765) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_secret` varchar(765) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zoomsettings`
--

INSERT INTO `zoomsettings` (`id`, `client_id`, `client_secret`, `api_key`, `api_secret`, `data`) VALUES
(1, '', '', '', '', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
