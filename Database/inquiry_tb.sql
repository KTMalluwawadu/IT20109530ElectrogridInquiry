-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2022 at 08:11 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electrogrid_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_tb`
--

CREATE TABLE `inquiry_tb` (
  `Complain_id` int(5) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `complainDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `User_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inquiry_tb`
--

INSERT INTO `inquiry_tb` (`Complain_id`, `Description`, `complainDate`, `User_ID`) VALUES
(1, 'At what time shoul be the power cut occur.', '2022-04-25 18:30:00', 0),
(5, 'My%252Baccount%252Bis%252Bblocked.', '2022-05-06 18:30:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inquiry_tb`
--
ALTER TABLE `inquiry_tb`
  ADD PRIMARY KEY (`Complain_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inquiry_tb`
--
ALTER TABLE `inquiry_tb`
  MODIFY `Complain_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
