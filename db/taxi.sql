-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2021 at 08:02 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taxi`
--

-- --------------------------------------------------------

--
-- Table structure for table `bolt_week`
--

CREATE TABLE `bolt_week` (
  `id` int(11) NOT NULL,
  `driver` varchar(255) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `pay` float NOT NULL,
  `storno` float NOT NULL,
  `rezervation_pay` float NOT NULL,
  `rezervation_diferent` float NOT NULL,
  `pay_plus` float NOT NULL,
  `drive_money` float NOT NULL,
  `drive_money_bolt` float NOT NULL,
  `bonus` float NOT NULL,
  `compenzation` float NOT NULL,
  `refundation` float NOT NULL,
  `gratuity` float NOT NULL,
  `week_balance` float NOT NULL,
  `date_update` datetime NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bolt_week`
--

INSERT INTO `bolt_week` (`id`, `driver`, `phone_number`, `date_from`, `date_to`, `pay`, `storno`, `rezervation_pay`, `rezervation_diferent`, `pay_plus`, `drive_money`, `drive_money_bolt`, `bonus`, `compenzation`, `refundation`, `gratuity`, `week_balance`, `date_update`, `date_create`) VALUES
(1, 'Vsichni ridici', '\"\"', '2021-05-24', '2021-05-30', 25220, 100, 0, 0, 50, -6330, -13645, 580, 1660, 0, 0, 250, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(2, 'Jaroslav Biskup', '\"+420602207476\"', '2021-05-24', '2021-05-30', 340, 0, 0, 0, 0, -85, -340, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(3, 'Jaroslav Vaněk', '\"+420608445441\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(4, 'Jiri Bystry', '\"+420770687507\"', '2021-05-24', '2021-05-30', 19710, 50, 0, 0, 0, -4940, -10905, 455, 660, 0, 0.23, 0.4805, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(5, 'Jiri Soldatek', '\"+420774120542\"', '2021-05-24', '2021-05-30', 5170, 50, 0, 0, 50, -1305, -2400, 125, 1000, 0, 0.2, 0.2585, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(6, 'Miroslav Rabiencny', '\"+420605271511\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(7, 'Petr Docekal', '\"+420775071595\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(8, 'Svetoslav Malinov', '\"+420773006992\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(9, 'Tomas Herman', '\"+420778232310\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(10, 'Zdeněk Anderle', '\"+420770121188\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:08'),
(11, 'Vsichni ridici', '\"\"', '2021-05-24', '2021-05-30', 25220, 100, 0, 0, 50, -6330, -13645, 580, 1660, 0, 0, 250, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(12, 'Jaroslav Biskup', '\"+420602207476\"', '2021-05-24', '2021-05-30', 340, 0, 0, 0, 0, -85, -340, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(13, 'Jaroslav Vaněk', '\"+420608445441\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(14, 'Jiri Bystry', '\"+420770687507\"', '2021-05-24', '2021-05-30', 19710, 50, 0, 0, 0, -4940, -10905, 455, 660, 0, 0.23, 0.4805, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(15, 'Jiri Soldatek', '\"+420774120542\"', '2021-05-24', '2021-05-30', 5170, 50, 0, 0, 50, -1305, -2400, 125, 1000, 0, 0.2, 0.2585, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(16, 'Miroslav Rabiencny', '\"+420605271511\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(17, 'Petr Docekal', '\"+420775071595\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(18, 'Svetoslav Malinov', '\"+420773006992\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(19, 'Tomas Herman', '\"+420778232310\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(20, 'Zdeněk Anderle', '\"+420770121188\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:40:51'),
(21, 'Vsichni ridici', '\"\"', '2021-05-24', '2021-05-30', 25220, 100, 0, 0, 50, -6330, -13645, 580, 1660, 0, 0, 250, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(22, 'Jaroslav Biskup', '\"+420602207476\"', '2021-05-24', '2021-05-30', 340, 0, 0, 0, 0, -85, -340, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(23, 'Jaroslav Vaněk', '\"+420608445441\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(24, 'Jiri Bystry', '\"+420770687507\"', '2021-05-24', '2021-05-30', 19710, 50, 0, 0, 0, -4940, -10905, 455, 660, 0, 0.23, 0.4805, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(25, 'Jiri Soldatek', '\"+420774120542\"', '2021-05-24', '2021-05-30', 5170, 50, 0, 0, 50, -1305, -2400, 125, 1000, 0, 0.2, 0.2585, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(26, 'Miroslav Rabiencny', '\"+420605271511\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(27, 'Petr Docekal', '\"+420775071595\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(28, 'Svetoslav Malinov', '\"+420773006992\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(29, 'Tomas Herman', '\"+420778232310\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(30, 'Zdeněk Anderle', '\"+420770121188\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-13 04:41:40'),
(31, 'Vsichni ridici', '\"\"', '2021-05-24', '2021-05-30', 25220, 100, 0, 0, 50, -6330, -13645, 580, 1660, 0, 0, 250, '0000-00-00 00:00:00', '2021-06-15 18:42:13'),
(32, 'Jaroslav Biskup', '\"+420602207476\"', '2021-05-24', '2021-05-30', 340, 0, 0, 0, 0, -85, -340, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-15 18:42:13'),
(33, 'Jaroslav Vaněk', '\"+420608445441\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-15 18:42:14'),
(34, 'Jiri Bystry', '\"+420770687507\"', '2021-05-24', '2021-05-30', 19710, 50, 0, 0, 0, -4940, -10905, 455, 660, 0, 0.23, 0.4805, '0000-00-00 00:00:00', '2021-06-15 18:42:14'),
(35, 'Jiri Soldatek', '\"+420774120542\"', '2021-05-24', '2021-05-30', 5170, 50, 0, 0, 50, -1305, -2400, 125, 1000, 0, 0.2, 0.2585, '0000-00-00 00:00:00', '2021-06-15 18:42:14'),
(36, 'Miroslav Rabiencny', '\"+420605271511\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-15 18:42:14'),
(37, 'Petr Docekal', '\"+420775071595\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-15 18:42:14'),
(38, 'Svetoslav Malinov', '\"+420773006992\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-15 18:42:14'),
(39, 'Tomas Herman', '\"+420778232310\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-15 18:42:14'),
(40, 'Zdeněk Anderle', '\"+420770121188\"', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-15 18:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `spz` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `spz`, `active`, `date_create`) VALUES
(2, 'audi', '12456', 1, '2021-06-14 04:46:32'),
(3, 'audi', '12456', 1, '2021-06-14 04:54:50'),
(4, 'audi', '12456', 1, '2021-06-14 04:55:15'),
(5, 'audi', '12456', 1, '2021-06-14 04:57:13'),
(6, 'audi', '12456', 1, '2021-06-14 04:58:07'),
(7, 'audi', '12456', 1, '2021-06-14 04:58:50'),
(8, 'audi', '12456', 1, '2021-06-14 04:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pozition` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `pozition`, `phone`, `email`, `photo`, `active`, `date_create`) VALUES
(6, 'Petr Pavlica', '1', '+420604827858', 'crookslovacko2@gmail.com', '', 1, '2021-03-15 07:41:39'),
(8, 'Petr Pavlica', '1', '+420604827858', 'petrpavlicaslovacko@gmail.com', '', 1, '2021-03-10 17:47:18'),
(10, 'Petr Pavlica', '1', '444555666', 'petrpavlicaslovacko@gmail.com', '', 1, '2021-05-18 07:49:59'),
(11, 'Petr Pavlica', '1', '444555666', 'petrpavlicaslovacko@gmail.com', '', 1, '2021-05-18 07:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `people_inf`
--

CREATE TABLE `people_inf` (
  `id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `work_kind` varchar(10) NOT NULL,
  `bank_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxi_partner`
--

CREATE TABLE `taxi_partner` (
  `id` int(11) NOT NULL,
  `partner` varchar(255) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(60) NOT NULL,
  `email` varchar(220) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `active` int(11) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `ip`, `active`, `date_create`) VALUES
(2, 'admin', '$2y$10$DdTHnwfk8BWMjaXQIUvZLe5nNRkKWYiImtuLMRp5mHlSqpTd/Pite', 1, '', 1, '2021-01-26 04:03:58'),
(3, 'crookslovacko@gmail.com', '$2y$10$1of7Gko1eq8mjO3WVeHIpOK2/ULdIryarl05Ndmfx./mfxUccmIdW', 1, '', 0, '2021-01-26 04:08:56'),
(6, 'crookslovacko2@gmail.com', '$2y$10$hN8dDd0c6BVAZluEnlffZ.k/pnAvjdv6OTdvP723bhcJfK3yluNe.', 1, '', 0, '2021-02-16 04:04:23'),
(7, 'petrpavlicaslovacko@gmail.com', '$2y$10$jNC652gxUEkni1pcNvmUlu6cGp9MuSvEvQa4uFwvO8VM.oJwxs7bK', 1, '', 0, '2021-02-28 03:52:40'),
(8, 'petrpavlicaslovacko@gmail.com', '$2y$10$q.y7GqnbX/NIOByFK2dA.Oqpa4ztUqZjLRr0QDY8z7B2C9qW4CDT.', 1, '', 0, '2021-03-10 16:47:18'),
(9, 'crookslovacko2@gmail.com', '$2y$10$DJo0W78XP2Jksk3HWzcKhOG8fg2TH5scq6Ex9EcT6w.jOBg6LwDu6', 1, '', 0, '2021-03-15 06:41:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bolt_week`
--
ALTER TABLE `bolt_week`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people_inf`
--
ALTER TABLE `people_inf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxi_partner`
--
ALTER TABLE `taxi_partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bolt_week`
--
ALTER TABLE `bolt_week`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `people_inf`
--
ALTER TABLE `people_inf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxi_partner`
--
ALTER TABLE `taxi_partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
