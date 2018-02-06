-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 06, 2018 at 02:15 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrentalagency`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `maker` varchar(55) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cost`
--

CREATE TABLE `cost` (
  `cost_id` int(11) NOT NULL,
  `insurance` decimal(10,2) DEFAULT NULL,
  `gasoline` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `surname` varchar(55) DEFAULT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dropoff`
--

CREATE TABLE `dropoff` (
  `dropoff_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `dropoffdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_cost_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pickup`
--

CREATE TABLE `pickup` (
  `pickup_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `pickupdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_driver_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `cost`
--
ALTER TABLE `cost`
  ADD PRIMARY KEY (`cost_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `dropoff`
--
ALTER TABLE `dropoff`
  ADD PRIMARY KEY (`dropoff_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_cost_id` (`fk_cost_id`);

--
-- Indexes for table `pickup`
--
ALTER TABLE `pickup`
  ADD PRIMARY KEY (`pickup_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dropoff`
--
ALTER TABLE `dropoff`
  ADD CONSTRAINT `dropoff_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_cost_id`) REFERENCES `cost` (`cost_id`);

--
-- Constraints for table `pickup`
--
ALTER TABLE `pickup`
  ADD CONSTRAINT `pickup_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
