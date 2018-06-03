-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 03, 2018 at 10:15 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `episense`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctorinfo`
--

CREATE TABLE `doctorinfo` (
  `doctor_id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `contact_number` text NOT NULL,
  `address` text NOT NULL,
  `specialization` text NOT NULL,
  `consultation_hours` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctorinfo`
--

INSERT INTO `doctorinfo` (`doctor_id`, `first_name`, `last_name`, `contact_number`, `address`, `specialization`, `consultation_hours`) VALUES
(0, 'Shaza', 'Kazia', '971589394034', '', 'General Medicine', '4PM-6PM'),
(1, 'Jones', 'McMillan', '971535930583', 'Jumeirah', 'Orthodontist', '12PM - 3PM'),
(2, 'Alexander', 'Al Basosi', '971503494591', 'Lulu Building, Al Barsha 1', 'Surgery', '5PM-6PM'),
(5, 'George', 'McMillan', '971527589438', 'Al Rigga', 'Dentistry', '2PM-3PM');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_logindetails`
--

CREATE TABLE `doctor_logindetails` (
  `doctor_id` int(11) NOT NULL,
  `email` text NOT NULL,
  `doctor_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_logindetails`
--

INSERT INTO `doctor_logindetails` (`doctor_id`, `email`, `doctor_password`) VALUES
(1, 'jones@mcmillan.com', 'password'),
(2, 'alex@albasosi.com', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg='),
(0, 'shaza@kazia.com', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg='),
(5, 'george@mill.com', '10/w7o2juYBrGMh32/KbveULW9jk2tejpyUAD+uC6PE=');

-- --------------------------------------------------------

--
-- Table structure for table `emergencycontacts`
--

CREATE TABLE `emergencycontacts` (
  `patient_id` int(11) NOT NULL,
  `contact_number` text NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergencycontacts`
--

INSERT INTO `emergencycontacts` (`patient_id`, `contact_number`, `first_name`, `last_name`) VALUES
(2, '971505830385', 'John', 'Smith'),
(2, '971503958273', 'Simyan', 'Anwar'),
(2, '971502950384', 'Samia', 'Ahmad'),
(2, '971503493920', 'John', 'Barrowman');

-- --------------------------------------------------------

--
-- Table structure for table `patientinfo`
--

CREATE TABLE `patientinfo` (
  `patient_id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `gender` text NOT NULL,
  `age` int(11) NOT NULL,
  `date_of_birth` text NOT NULL,
  `contact_number` text NOT NULL,
  `address` text NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `sign_up_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientinfo`
--

INSERT INTO `patientinfo` (`patient_id`, `first_name`, `last_name`, `gender`, `age`, `date_of_birth`, `contact_number`, `address`, `doctor_id`, `sign_up_timestamp`, `date`) VALUES
(1, 'Alexander', 'Al Basosi', 'm', 22, '12/06/1995', '971503494591', 'Al Barsha 1', 1, '2018-06-02 18:34:03', 'Mon Apr 23 2018'),
(2, 'Victoria', 'Ashley', 'f', 0, '06/09/2005', ' 971509381534', 'Al Barsha 1', 2, '2018-06-02 18:33:06', 'Mon Apr 23 2018'),
(3, 'Karen', 'Gillan', 'f', 23, '12/04/1995', '971503489283', '4 Chesterford Road', 2, '2018-06-02 18:33:22', 'Mon Apr 23 2018'),
(4, 'John', 'Barrowman', 'm', 45, '12/4/1970', '971503859038', '5 Gaiskell House', 2, '2018-06-02 18:33:29', 'Mon Apr 23 2018'),
(5, 'Donna', 'Venezuela', 'f', 26, '15/10/1992', '971503494930', 'JLT', 1, '2018-06-02 18:34:20', 'Mon Apr 23 2018'),
(6, 'Katherine', 'Heigl', 'f', 33, '12/06/1995', '971503829483', 'Lulu Building', 2, '2018-06-02 18:34:10', 'Mon Apr 23 2018');

-- --------------------------------------------------------

--
-- Table structure for table `patient_logindetails`
--

CREATE TABLE `patient_logindetails` (
  `patient_id` int(11) NOT NULL,
  `email` text NOT NULL,
  `patient_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_logindetails`
--

INSERT INTO `patient_logindetails` (`patient_id`, `email`, `patient_password`) VALUES
(5, 'donna@venezuela.com', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg='),
(2, 'victoria@ashley.com', 'XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=');

-- --------------------------------------------------------

--
-- Table structure for table `seizure_history`
--

CREATE TABLE `seizure_history` (
  `patient_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` text NOT NULL,
  `isSeizure` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seizure_history`
--

INSERT INTO `seizure_history` (`patient_id`, `timestamp`, `date`, `isSeizure`) VALUES
(2, '2018-04-24 22:36:05', 'Tue Apr 15 2018', 1),
(2, '2018-04-24 12:40:03', 'Tue Apr 24 2018', 1),
(2, '2018-04-24 12:40:03', 'Tue Apr 24 2018', 1),
(2, '2018-04-24 12:40:03', 'Tue Apr 24 2018', 1),
(2, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(2, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(2, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(3, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(3, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(4, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(4, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(2, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(2, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(2, '2018-04-24 12:40:03', 'Tue Apr 24 2018', 1),
(2, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(2, '2018-04-20 01:31:19', 'Fri Apr 20 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:30:31', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 03:33:12', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1),
(2, '2018-06-02 09:04:13', 'Sat Jun 02 2018', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctorinfo`
--
ALTER TABLE `doctorinfo`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `doctor_logindetails`
--
ALTER TABLE `doctor_logindetails`
  ADD KEY `doctor_logindetails > doctorinfo` (`doctor_id`);

--
-- Indexes for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  ADD KEY `emergencycontacts > patientinfo` (`patient_id`);

--
-- Indexes for table `patientinfo`
--
ALTER TABLE `patientinfo`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `patient_logindetails`
--
ALTER TABLE `patient_logindetails`
  ADD KEY `logindetails > patientinfo` (`patient_id`);

--
-- Indexes for table `seizure_history`
--
ALTER TABLE `seizure_history`
  ADD KEY `seizure_history > patientinfo` (`patient_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctor_logindetails`
--
ALTER TABLE `doctor_logindetails`
  ADD CONSTRAINT `doctor_logindetails > doctorinfo` FOREIGN KEY (`doctor_id`) REFERENCES `doctorinfo` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  ADD CONSTRAINT `emergencycontacts > patientinfo` FOREIGN KEY (`patient_id`) REFERENCES `patientinfo` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_logindetails`
--
ALTER TABLE `patient_logindetails`
  ADD CONSTRAINT `logindetails > patientinfo` FOREIGN KEY (`patient_id`) REFERENCES `patientinfo` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seizure_history`
--
ALTER TABLE `seizure_history`
  ADD CONSTRAINT `seizure_history > patientinfo` FOREIGN KEY (`patient_id`) REFERENCES `patientinfo` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
