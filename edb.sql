-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 06, 2024 at 03:23 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `meter_no` varchar(20) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `total_bill` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `meter_no` (`meter_no`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `meter_no`, `month`, `unit`, `total_bill`, `status`) VALUES
(1, '277200', 'January', 50, '685.00', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_info`
--

DROP TABLE IF EXISTS `deposit_info`;
CREATE TABLE IF NOT EXISTS `deposit_info` (
  `deposit_id` int(11) NOT NULL AUTO_INCREMENT,
  `meter_no` varchar(20) DEFAULT NULL,
  `deposit_amount` decimal(10,2) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  PRIMARY KEY (`deposit_id`),
  KEY `meter_no` (`meter_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meter_info`
--

DROP TABLE IF EXISTS `meter_info`;
CREATE TABLE IF NOT EXISTS `meter_info` (
  `meter_no` varchar(20) NOT NULL,
  `meter_location` varchar(50) DEFAULT NULL,
  `meter_type` varchar(50) DEFAULT NULL,
  `phase_code` varchar(10) DEFAULT NULL,
  `bill_type` varchar(20) DEFAULT NULL,
  `billing_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`meter_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meter_info`
--

INSERT INTO `meter_info` (`meter_no`, `meter_location`, `meter_type`, `phase_code`, `bill_type`, `billing_days`) VALUES
('277200', 'Outside', 'Electric Meter', '011', 'Normal', 30);

-- --------------------------------------------------------

--
-- Table structure for table `new_customer`
--

DROP TABLE IF EXISTS `new_customer`;
CREATE TABLE IF NOT EXISTS `new_customer` (
  `meter_no` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `city` varchar(12) NOT NULL,
  PRIMARY KEY (`meter_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_customer`
--

INSERT INTO `new_customer` (`meter_no`, `name`, `address`, `phone_no`, `email`, `status`, `city`) VALUES
('277200', 'Ravindu', 'No12,School Lane,Tangalle', '0712332112', 'ravindu@gmail.com', 'School Lane', 'Tangalle');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `meter_no` varchar(20) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `meter_no` (`meter_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
CREATE TABLE IF NOT EXISTS `signup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` varchar(20) DEFAULT NULL,
  `meter_no` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `employer_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `meter_no` (`meter_no`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `username`, `password`, `usertype`, `meter_no`, `name`, `employer_id`) VALUES
(1, 'Chamoth', '1234', 'Admin', '', 'Chamoth', '001'),
(2, 'Ravindu', '1111', 'Customer', '277200', 'Ravindu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
CREATE TABLE IF NOT EXISTS `tax` (
  `cost_per_unit` int(11) DEFAULT NULL,
  `meter_rent` int(11) DEFAULT NULL,
  `service_charge` int(11) DEFAULT NULL,
  `swacch_bharat` int(11) DEFAULT NULL,
  `fixed_tax` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`cost_per_unit`, `meter_rent`, `service_charge`, `swacch_bharat`, `fixed_tax`) VALUES
(10, 50, 30, 5, 100);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
