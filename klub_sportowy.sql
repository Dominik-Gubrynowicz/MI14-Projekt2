-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mi14db
-- Czas generowania: 21 Wrz 2021, 08:54
-- Wersja serwera: 10.6.4-MariaDB-1:10.6.4+maria~focal
-- Wersja PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `klub_sportowy`
--
CREATE DATABASE IF NOT EXISTS `klub_sportowy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `klub_sportowy`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Kluby`
--

CREATE TABLE `Kluby` (
  `Id_k` int(11) NOT NULL,
  `Kraj` varchar(20) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `Miasto` varchar(20) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `Nazwa` varchar(20) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Piłkarze`
--

CREATE TABLE `Piłkarze` (
  `Id_p` int(11) NOT NULL,
  `Imie` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `Nazwisko` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `Rok_urodzenia` year(4) DEFAULT NULL,
  `Id_k` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Trener`
--

CREATE TABLE `Trener` (
  `Id_t` int(11) NOT NULL,
  `Imie` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `Nazwisko` varchar(25) COLLATE utf8mb4_polish_ci NOT NULL,
  `Rok_urodzenia` year(4) NOT NULL,
  `Id_k` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Wypozyczenia`
--

CREATE TABLE `Wypozyczenia` (
  `Id_w` int(11) NOT NULL,
  `Id_k` int(11) NOT NULL,
  `Id_p` int(11) NOT NULL,
  `Do_kiedy` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Kluby`
--
ALTER TABLE `Kluby`
  ADD PRIMARY KEY (`Id_k`);

--
-- Indeksy dla tabeli `Piłkarze`
--
ALTER TABLE `Piłkarze`
  ADD PRIMARY KEY (`Id_p`),
  ADD KEY `Id_k` (`Id_k`);

--
-- Indeksy dla tabeli `Trener`
--
ALTER TABLE `Trener`
  ADD PRIMARY KEY (`Id_t`),
  ADD UNIQUE KEY `Id_k` (`Id_k`);

--
-- Indeksy dla tabeli `Wypozyczenia`
--
ALTER TABLE `Wypozyczenia`
  ADD PRIMARY KEY (`Id_w`),
  ADD KEY `Id_k` (`Id_k`),
  ADD KEY `Id_p` (`Id_p`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `Kluby`
--
ALTER TABLE `Kluby`
  MODIFY `Id_k` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Piłkarze`
--
ALTER TABLE `Piłkarze`
  MODIFY `Id_p` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Trener`
--
ALTER TABLE `Trener`
  MODIFY `Id_t` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Wypozyczenia`
--
ALTER TABLE `Wypozyczenia`
  MODIFY `Id_w` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `Piłkarze`
--
ALTER TABLE `Piłkarze`
  ADD CONSTRAINT `Piłkarze_ibfk_1` FOREIGN KEY (`Id_k`) REFERENCES `Kluby` (`Id_k`);

--
-- Ograniczenia dla tabeli `Trener`
--
ALTER TABLE `Trener`
  ADD CONSTRAINT `Trener_ibfk_1` FOREIGN KEY (`Id_k`) REFERENCES `Kluby` (`Id_k`);

--
-- Ograniczenia dla tabeli `Wypozyczenia`
--
ALTER TABLE `Wypozyczenia`
  ADD CONSTRAINT `Wypozyczenia_ibfk_1` FOREIGN KEY (`Id_k`) REFERENCES `Kluby` (`Id_k`),
  ADD CONSTRAINT `Wypozyczenia_ibfk_2` FOREIGN KEY (`Id_p`) REFERENCES `Piłkarze` (`Id_p`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
