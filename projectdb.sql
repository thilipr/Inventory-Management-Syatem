-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 16, 2019 at 05:13 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectdb`
--
CREATE DATABASE IF NOT EXISTS `projectdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `projectdb`;

-- --------------------------------------------------------

--
-- Table structure for table `billinfo`
--

DROP TABLE IF EXISTS `billinfo`;
CREATE TABLE IF NOT EXISTS `billinfo` (
  `TransactionID` double NOT NULL,
  `Amount` double DEFAULT NULL,
  `SubTotal` double DEFAULT NULL,
  `Item` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `TransactionID_to_billinfo` (`TransactionID`),
  KEY `Item_ to_billinfo` (`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `billinfo`
--

TRUNCATE TABLE `billinfo`;
-- --------------------------------------------------------

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
CREATE TABLE IF NOT EXISTS `buy` (
  `TransactionID` double NOT NULL,
  `Date` date DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `CustomerID` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `buy`
--

TRUNCATE TABLE `buy`;
--
-- Dumping data for table `buy`
--

INSERT DELAYED IGNORE INTO `buy` (`TransactionID`, `Date`, `Total`, `CustomerID`) VALUES
(1, '2019-01-15', 121, 'cash'),
(2, '2019-01-15', 173, 'cash'),
(3, '2019-01-15', 218, 'cash'),
(4, '2019-01-15', 250, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `buy_instock`
--

DROP TABLE IF EXISTS `buy_instock`;
CREATE TABLE IF NOT EXISTS `buy_instock` (
  `TransactionID` double NOT NULL,
  `Item` varchar(15) NOT NULL,
  PRIMARY KEY (`TransactionID`,`Item`),
  KEY `TransactionID_to_buy_instock` (`TransactionID`),
  KEY `Item_to_Buy_instock` (`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `buy_instock`
--

TRUNCATE TABLE `buy_instock`;
-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` varchar(15) NOT NULL,
  `Name` text,
  `Address` varchar(50) NOT NULL,
  `ContactNo` double NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `customer`
--

TRUNCATE TABLE `customer`;
--
-- Dumping data for table `customer`
--

INSERT DELAYED IGNORE INTO `customer` (`CustomerID`, `Name`, `Address`, `ContactNo`) VALUES
('1', 'fh', 'srt', 1235),
('2', 'library', 'polonnaruwa', 452658964);

-- --------------------------------------------------------

--
-- Table structure for table `customercontacts`
--

DROP TABLE IF EXISTS `customercontacts`;
CREATE TABLE IF NOT EXISTS `customercontacts` (
  `CustomerID` varchar(15) NOT NULL,
  `ContactNo` int(10) NOT NULL,
  PRIMARY KEY (`CustomerID`,`ContactNo`),
  KEY `CustomerID_to_customercontacts` (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `customercontacts`
--

TRUNCATE TABLE `customercontacts`;
-- --------------------------------------------------------

--
-- Table structure for table `debtors`
--

DROP TABLE IF EXISTS `debtors`;
CREATE TABLE IF NOT EXISTS `debtors` (
  `DebtorID` varchar(15) NOT NULL,
  `Balance` double DEFAULT NULL,
  `CustomerID` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DebtorID`),
  KEY `CustomerID_to_debtors` (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `debtors`
--

TRUNCATE TABLE `debtors`;
-- --------------------------------------------------------

--
-- Table structure for table `debtpayment`
--

DROP TABLE IF EXISTS `debtpayment`;
CREATE TABLE IF NOT EXISTS `debtpayment` (
  `PaymentID` varchar(15) NOT NULL,
  `Date` date DEFAULT NULL,
  `PaymentAmount` double DEFAULT NULL,
  `DebtorID` varchar(15) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `DebtorID` (`DebtorID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `debtpayment`
--

TRUNCATE TABLE `debtpayment`;
-- --------------------------------------------------------

--
-- Table structure for table `expirydate`
--

DROP TABLE IF EXISTS `expirydate`;
CREATE TABLE IF NOT EXISTS `expirydate` (
  `Item` varchar(15) NOT NULL,
  `ExpiryDate` date DEFAULT NULL,
  PRIMARY KEY (`Item`),
  KEY `Item_to_expirydate` (`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `expirydate`
--

TRUNCATE TABLE `expirydate`;
-- --------------------------------------------------------

--
-- Table structure for table `instock`
--

DROP TABLE IF EXISTS `instock`;
CREATE TABLE IF NOT EXISTS `instock` (
  `Item` varchar(15) NOT NULL,
  `Quantity` double DEFAULT NULL,
  `Category` varchar(50) NOT NULL,
  `SellingPrice` double NOT NULL,
  `CostPrice` double NOT NULL,
  `ExpiryDate` date NOT NULL,
  PRIMARY KEY (`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `instock`
--

TRUNCATE TABLE `instock`;
--
-- Dumping data for table `instock`
--

INSERT DELAYED IGNORE INTO `instock` (`Item`, `Quantity`, `Category`, `SellingPrice`, `CostPrice`, `ExpiryDate`) VALUES
('test2', 4, 'test2', 4, 4, '2020-05-26'),
('test', -467, 'test', 1, 123, '2020-05-23');

-- --------------------------------------------------------

--
-- Table structure for table `instock_returnstock`
--

DROP TABLE IF EXISTS `instock_returnstock`;
CREATE TABLE IF NOT EXISTS `instock_returnstock` (
  `Item` varchar(15) NOT NULL,
  `ReturnID` varchar(15) NOT NULL,
  PRIMARY KEY (`Item`,`ReturnID`),
  KEY `Item_to_instock_returnstock` (`Item`),
  KEY `ReturnID_to_instock_returnstock` (`ReturnID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `instock_returnstock`
--

TRUNCATE TABLE `instock_returnstock`;
-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `userID` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `login`
--

TRUNCATE TABLE `login`;
--
-- Dumping data for table `login`
--

INSERT DELAYED IGNORE INTO `login` (`userID`, `username`, `password`) VALUES
(1, 'nishadi', '123');

-- --------------------------------------------------------

--
-- Table structure for table `returnstock`
--

DROP TABLE IF EXISTS `returnstock`;
CREATE TABLE IF NOT EXISTS `returnstock` (
  `ReturnID` varchar(15) NOT NULL,
  `Description` text,
  `SupplierID` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ReturnID`),
  KEY `SupplierID_to_returnstock` (`SupplierID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `returnstock`
--

TRUNCATE TABLE `returnstock`;
-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `SupplierID` varchar(15) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `ContactNo` int(10) DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `supplier`
--

TRUNCATE TABLE `supplier`;
--
-- Dumping data for table `supplier`
--

INSERT DELAYED IGNORE INTO `supplier` (`SupplierID`, `Name`, `ContactNo`, `Address`) VALUES
('1', 'tyhgf', 2536989, 'apura');

-- --------------------------------------------------------

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
CREATE TABLE IF NOT EXISTS `supply` (
  `SupplyID` varchar(15) NOT NULL,
  `Date` date NOT NULL,
  `TotalPrice` double DEFAULT NULL,
  `SupplierID` varchar(15) NOT NULL,
  PRIMARY KEY (`SupplyID`),
  KEY `SupplierID` (`SupplierID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `supply`
--

TRUNCATE TABLE `supply`;
--
-- Dumping data for table `supply`
--

INSERT DELAYED IGNORE INTO `supply` (`SupplyID`, `Date`, `TotalPrice`, `SupplierID`) VALUES
('1', '2019-08-09', 58000, '12');

-- --------------------------------------------------------

--
-- Table structure for table `supply_tempstock`
--

DROP TABLE IF EXISTS `supply_tempstock`;
CREATE TABLE IF NOT EXISTS `supply_tempstock` (
  `SupplyID` varchar(15) NOT NULL,
  `TempStockID` varchar(15) NOT NULL,
  PRIMARY KEY (`SupplyID`,`TempStockID`),
  KEY `SupplyID_to_supply_tempstock` (`SupplyID`),
  KEY `TempStockID_to_supply_tempstock` (`TempStockID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `supply_tempstock`
--

TRUNCATE TABLE `supply_tempstock`;
--
-- Dumping data for table `supply_tempstock`
--

INSERT DELAYED IGNORE INTO `supply_tempstock` (`SupplyID`, `TempStockID`) VALUES
('1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tempstock`
--

DROP TABLE IF EXISTS `tempstock`;
CREATE TABLE IF NOT EXISTS `tempstock` (
  `TempStockID` varchar(15) NOT NULL,
  `Description` text,
  PRIMARY KEY (`TempStockID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `tempstock`
--

TRUNCATE TABLE `tempstock`;
--
-- Dumping data for table `tempstock`
--

INSERT DELAYED IGNORE INTO `tempstock` (`TempStockID`, `Description`) VALUES
('1', 'error');

-- --------------------------------------------------------

--
-- Table structure for table `tempstock_instock`
--

DROP TABLE IF EXISTS `tempstock_instock`;
CREATE TABLE IF NOT EXISTS `tempstock_instock` (
  `TempStockID` varchar(15) NOT NULL,
  `Item` varchar(15) NOT NULL,
  PRIMARY KEY (`TempStockID`,`Item`),
  KEY `TempStockID_to_tempstock_instock` (`TempStockID`),
  KEY `Item_to_tempstock_instock` (`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `tempstock_instock`
--

TRUNCATE TABLE `tempstock_instock`;
-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `name` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `ID` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `user`
--

TRUNCATE TABLE `user`;
--
-- Dumping data for table `user`
--

INSERT DELAYED IGNORE INTO `user` (`name`, `type`, `ID`, `password`) VALUES
('test', 'sriyan', 'yt', 'rew'),
('', '', '', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
