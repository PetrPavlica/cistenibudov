-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 09. čen 2021, 00:18
-- Verze serveru: 10.4.19-MariaDB
-- Verze PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `cards`
--

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
  `photo` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `date_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `people`
--

INSERT INTO `people` (`id`, `name`, `pozition`, `phone`, `email`, `photo`, `active`, `date_create`) VALUES
(6, 'Petr Pavlica', '1', '+420604827858', 'crookslovacko2@gmail.com', '', 1, '2021-03-15 07:41:39'),
(8, 'Petr Pavlica', '1', '+420604827858', 'petrpavlicaslovacko@gmail.com', '', 1, '2021-03-10 17:47:18'),
(10, 'Petr Pavlica', '1', '444555666', 'petrpavlicaslovacko@gmail.com', '', 1, '2021-05-18 07:49:59'),
(11, 'Petr Pavlica', '1', '444555666', 'petrpavlicaslovacko@gmail.com', '', 1, '2021-05-18 07:56:46');

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
-- Indexy pro tabulku `people`
--
ALTER TABLE `people`
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
-- AUTO_INCREMENT pro tabulku `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
