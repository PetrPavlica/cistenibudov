-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 26. dub 2022, 01:16
-- Verze serveru: 10.4.22-MariaDB
-- Verze PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `taxi`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `bolt_week`
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
  `to_bolt` float NOT NULL,
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
-- Vypisuji data pro tabulku `bolt_week`
--

INSERT INTO `bolt_week` (`id`, `driver`, `phone_number`, `date_from`, `date_to`, `pay`, `storno`, `rezervation_pay`, `rezervation_diferent`, `pay_plus`, `to_bolt`, `drive_money`, `drive_money_bolt`, `bonus`, `compenzation`, `refundation`, `gratuity`, `week_balance`, `date_update`, `date_create`) VALUES
(2, 'Vsichni ridici', '', '2021-05-24', '2021-05-30', 25220, 100, 0, 0, 50, -6330, -13645, 580, 1660, 0, 0, 250, 7305, '0000-00-00 00:00:00', '2021-06-28 19:45:20'),
(3, 'Jaroslav Biskup', '+420602207476', '2021-05-24', '2021-05-30', 340, 0, 0, 0, 0, -85, -340, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-28 19:45:20'),
(4, 'Jaroslav Vaněk', '+420608445441', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-28 19:45:20'),
(5, 'Jiri Bystry', '+420770687507', '2021-05-24', '2021-05-30', 19710, 50, 0, 0, 0, -4940, -10905, 455, 660, 0, 0.23, 0.4805, 0, '0000-00-00 00:00:00', '2021-06-28 19:45:20'),
(6, 'Jiri Soldatek', '+420774120542', '2021-05-24', '2021-05-30', 5170, 50, 0, 0, 50, -1305, -2400, 125, 1000, 0, 0.2, 0.2585, 0, '0000-00-00 00:00:00', '2021-06-28 19:45:20'),
(7, 'Miroslav Rabiencny', '+420605271511', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-28 19:45:20'),
(8, 'Petr Docekal', '+420775071595', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-28 19:45:20'),
(9, 'Svetoslav Malinov', '+420773006992', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-28 19:45:20'),
(10, 'Tomas Herman', '+420778232310', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-28 19:45:20'),
(11, 'Zdeněk Anderle', '+420770121188', '2021-05-24', '2021-05-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '2021-06-28 19:45:20');

-- --------------------------------------------------------

--
-- Struktura tabulky `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `spz` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `color` varchar(150) NOT NULL,
  `year` int(11) NOT NULL,
  `people_id` int(11) DEFAULT NULL,
  `pay` float NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `cars`
--

INSERT INTO `cars` (`id`, `name`, `spz`, `price`, `color`, `year`, `people_id`, `pay`, `active`, `date_create`) VALUES
(12, 'Audigfhgf', 'SPZ123', 80000, 'seda', 2000, 17, 200, 1, '2021-07-06 20:46:46');

-- --------------------------------------------------------

--
-- Struktura tabulky `cars_cards`
--

CREATE TABLE `cars_cards` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `pay` float NOT NULL,
  `pay_people` float NOT NULL,
  `people_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `date_create` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `cars_cards`
--

INSERT INTO `cars_cards` (`id`, `car_id`, `pay`, `pay_people`, `people_id`, `date_from`, `date_to`, `date_create`) VALUES
(9, 12, 1200, 1200, 17, '2021-07-23', '2021-07-25', '2021-07-22'),
(10, 12, 1200, 1200, 17, '2021-07-23', '2021-07-25', '2021-07-22');

-- --------------------------------------------------------

--
-- Struktura tabulky `cars_crashes`
--

CREATE TABLE `cars_crashes` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `pay` float NOT NULL,
  `pay_people` float NOT NULL,
  `prepay_check` varchar(10) DEFAULT NULL,
  `from_prepay` float NOT NULL,
  `people_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `cars_crashes`
--

INSERT INTO `cars_crashes` (`id`, `car_id`, `pay`, `pay_people`, `prepay_check`, `from_prepay`, `people_id`, `text`, `date`) VALUES
(16, 12, 1200, 500, '1', 200, 17, 'tesi', '2021-08-18'),
(17, 12, 1000, 500, '0', 0, 17, '', '2021-08-20'),
(18, 12, 1000, 500, '0', 0, 17, '', '2021-08-28'),
(19, 12, 10000, 1000, '1', 500, 17, 'TExt', '2021-08-24');

-- --------------------------------------------------------

--
-- Struktura tabulky `cars_repairs`
--

CREATE TABLE `cars_repairs` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `repair_what` varchar(255) NOT NULL,
  `people_id` int(11) DEFAULT NULL,
  `pay` float NOT NULL,
  `pay_people` float NOT NULL,
  `prepay_check` varchar(10) NOT NULL,
  `from_prepay` float NOT NULL,
  `date` date NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `cars_repairs`
--

INSERT INTO `cars_repairs` (`id`, `car_id`, `repair_what`, `people_id`, `pay`, `pay_people`, `prepay_check`, `from_prepay`, `date`, `date_create`) VALUES
(1, 12, 'oprava', 17, 9000, 9000, '1', 1200, '2021-08-21', '2021-08-20 19:25:01');

-- --------------------------------------------------------

--
-- Struktura tabulky `cars_wheels`
--

CREATE TABLE `cars_wheels` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `pay` float NOT NULL,
  `pay_people` float NOT NULL,
  `people_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `cars_wheels`
--

INSERT INTO `cars_wheels` (`id`, `car_id`, `pay`, `pay_people`, `people_id`, `date`) VALUES
(4, 2, 1000, 1000, 15, '2021-07-09');

-- --------------------------------------------------------

--
-- Struktura tabulky `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pozition` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bank` float NOT NULL DEFAULT 0,
  `car_id` int(11) NOT NULL,
  `pay_car` float NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `people`
--

INSERT INTO `people` (`id`, `name`, `pozition`, `phone`, `email`, `bank`, `car_id`, `pay_car`, `active`, `date_create`) VALUES
(17, 'Petr Pavlica', '2', '778777888', 'petrpavlicaslovacko@gmail.com', 0, 12, 200, 1, '2021-07-11 21:07:32'),
(18, 'Petr Pavlica', '', '778777888', 'petrpavlicaslovacko@gmail.com', 0, 0, 0, 1, '2021-07-11 22:16:31'),
(19, 'Petr Pavlica', '', '778777888', 'petrpavlicaslovacko@gmail.com', 0, 0, 0, 1, '2021-07-11 22:23:08'),
(20, 'Petr Pavlica', '', '778777888', 'petrpavlicaslovacko@gmail.com', 0, 0, 0, 1, '2021-12-02 01:41:40');

-- --------------------------------------------------------

--
-- Struktura tabulky `people_bonus`
--

CREATE TABLE `people_bonus` (
  `id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `people_bonus`
--

INSERT INTO `people_bonus` (`id`, `people_id`, `pay`, `date`, `date_create`) VALUES
(1, 17, 800, '2021-08-09', '2021-08-09 07:15:26'),
(2, 17, 300, '2021-08-11', '2021-08-10 15:57:53');

-- --------------------------------------------------------

--
-- Struktura tabulky `people_car`
--

CREATE TABLE `people_car` (
  `id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `pay` float NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `people_car`
--

INSERT INTO `people_car` (`id`, `people_id`, `car_id`, `pay`, `date_start`, `date_end`, `date_create`) VALUES
(6, 17, 12, 12, '2021-08-30', '2021-08-29', '2021-08-31 04:20:57'),
(7, 17, 12, 1000, '2021-08-31', '0000-00-00', '2021-08-31 08:12:49'),
(8, 17, 12, 200, '2021-09-04', '2021-09-05', '2021-09-03 06:58:43');

-- --------------------------------------------------------

--
-- Struktura tabulky `people_inf`
--

CREATE TABLE `people_inf` (
  `id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `cp` varchar(255) NOT NULL,
  `psc` varchar(255) NOT NULL,
  `bank_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `people_prepay`
--

CREATE TABLE `people_prepay` (
  `id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `people_prepay`
--

INSERT INTO `people_prepay` (`id`, `people_id`, `pay`, `date`, `date_create`) VALUES
(1, 17, 600, '2021-08-10', '2021-08-10 15:59:52'),
(2, 17, -200, '2021-08-18', '2021-08-17 23:42:32'),
(4, 17, -500, '2021-08-20', '2021-08-19 08:54:57'),
(5, 17, -200, '2021-08-20', '2021-08-19 09:35:41'),
(6, 17, -1000, '2021-08-20', '2021-08-19 14:45:28'),
(7, 17, -1200, '2021-08-21', '2021-08-20 19:22:40'),
(8, 17, -1200, '2021-08-21', '2021-08-20 19:25:01'),
(9, 17, 5000, '2021-08-23', '2021-08-22 19:46:33'),
(10, 17, -500, '2021-08-24', '2021-08-31 18:25:41');

-- --------------------------------------------------------

--
-- Struktura tabulky `taxi_partner`
--

CREATE TABLE `taxi_partner` (
  `id` int(11) NOT NULL,
  `partner` varchar(255) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
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
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `ip`, `active`, `date_create`) VALUES
(2, 'admin', '$2y$10$DdTHnwfk8BWMjaXQIUvZLe5nNRkKWYiImtuLMRp5mHlSqpTd/Pite', 1, '', 1, '2021-01-26 04:03:58'),
(3, 'crookslovacko@gmail.com', '$2y$10$1of7Gko1eq8mjO3WVeHIpOK2/ULdIryarl05Ndmfx./mfxUccmIdW', 1, '', 0, '2021-01-26 04:08:56'),
(6, 'crookslovacko2@gmail.com', '$2y$10$hN8dDd0c6BVAZluEnlffZ.k/pnAvjdv6OTdvP723bhcJfK3yluNe.', 1, '', 0, '2021-02-16 04:04:23'),
(7, 'petrpavlicaslovacko@gmail.com', '$2y$10$jNC652gxUEkni1pcNvmUlu6cGp9MuSvEvQa4uFwvO8VM.oJwxs7bK', 1, '', 0, '2021-02-28 03:52:40'),
(8, 'petrpavlicaslovacko@gmail.com', '$2y$10$q.y7GqnbX/NIOByFK2dA.Oqpa4ztUqZjLRr0QDY8z7B2C9qW4CDT.', 1, '', 0, '2021-03-10 16:47:18'),
(9, 'crookslovacko2@gmail.com', '$2y$10$DJo0W78XP2Jksk3HWzcKhOG8fg2TH5scq6Ex9EcT6w.jOBg6LwDu6', 1, '', 0, '2021-03-15 06:41:39');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `bolt_week`
--
ALTER TABLE `bolt_week`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `cars_cards`
--
ALTER TABLE `cars_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `cars_crashes`
--
ALTER TABLE `cars_crashes`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `cars_repairs`
--
ALTER TABLE `cars_repairs`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `cars_wheels`
--
ALTER TABLE `cars_wheels`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `people_bonus`
--
ALTER TABLE `people_bonus`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `people_car`
--
ALTER TABLE `people_car`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `people_inf`
--
ALTER TABLE `people_inf`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `people_prepay`
--
ALTER TABLE `people_prepay`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `taxi_partner`
--
ALTER TABLE `taxi_partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `bolt_week`
--
ALTER TABLE `bolt_week`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pro tabulku `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pro tabulku `cars_cards`
--
ALTER TABLE `cars_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `cars_crashes`
--
ALTER TABLE `cars_crashes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pro tabulku `cars_repairs`
--
ALTER TABLE `cars_repairs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `cars_wheels`
--
ALTER TABLE `cars_wheels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pro tabulku `people_bonus`
--
ALTER TABLE `people_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `people_car`
--
ALTER TABLE `people_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `people_inf`
--
ALTER TABLE `people_inf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `people_prepay`
--
ALTER TABLE `people_prepay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `taxi_partner`
--
ALTER TABLE `taxi_partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
