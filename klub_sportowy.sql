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

insert into Kluby values
    (1,'Polska','Warszawa','Legia Warszawa'),
    (2,'Polska','Kraków','KS Cracovia'),
    (3,'Polska','Poznań','Lech Poznań'),
    (4,'Polska','Wrocław','Śląsk Wrocław');

insert into Trener values
(1,'Czesław','Michniewicz',1970,1),
(2,'Michał','Probierz',1972,2),
(3,'Maciej','Skorża',1972,3),
(4,'Jacek','Magiera',1977,4);

insert into Piłkarze values
(1,'Artur','Boruc',1980,1),
(2,'Mateusz','Hołownia',1998,1),
(3,'Mateusz','Wieteska',1997,1),
(4,'Yuri','Ribeiro',1997,1),
(5,'Andre','Martins',1990,1),
(6,'Kacper','Skibicki',2001,1),
(7,'Artur','Jędrzejczyk',1987,1),
(8,'Bartosz','Slisz',1999,1),
(9,'Tomas','Pekhart',1989,1),
(10,'Ernest','Muci',2001,1),
(11,'Szymon','Włodarczyk',2003,1),
(12,'Cornel','Cornel ',1990,2),
(13,'Michal','Sipľak',1996,2),
(14,'Sergiu','Hanca',1992,2),
(15,'Sylwester','Lusiusz',1999,2),
(16,'Mathias','Hebo',1995,2),
(17,'Marcos','Álvarez',1991,2),
(18,'Michał','Rakoczy',2002,2),
(19,'Radosław','Kanach',1999,2),
(20,'Damir','Sadiković',1995,2),
(21,'Adam','Wilk',1997,2),
(22,'Patryk','Zaucha',1997,2),
(23,'Joel','Pereira',1996,3),
(24,'Barry','Douglas',1989,3),
(25,'Filip','Marchwiński',2002,3),
(26,'Antonio','Milić',1994,3),
(27,'Filip','Wilak',1998,3),
(28,'Bartosz','Salamon',1991,3),
(29,'Michał','Skóraś',2000,3),
(31,'Radosław','Murawski',1994,3),
(32,'Pedro','Tiba',1988,3),
(33,'Nika','Kwekweskiri',1992,3),
(34,'Klupś','Tymoteusz',2000,3),
(35,'Bartłomiej','Pawłowski',1922,4),
(36,'Wojciech','Golla',1992,4),
(37,'Márk','Tamás',1993,4),
(38,'Lubambo','Musonda',1995,4),
(39,'Róbert','Pich',1988,4),
(40,'Erik','Expósito',1996,4),
(41,'Petr','Schwarz',1991,4),
(42,'Marcel','Zylla',2000,4),
(43,'Adrian','Łyszczarz',1999,4),
(44,'Krzysztof','Mączyński',1987,4),
(45,'Matúš','Putnocký',1984,4);

insert into Wypozyczenia values
(1,1,23,2022-04-21),
(2,2,43,2023-14-11),
(3,3,6,2021-12-00),
(4,4,9,2024-30-23),
(5,1,26,2025-02-14),
(6,2,15,2021-11-25),
(7,3,37,2022-09-13),
(8,4,12,2026-12-15),
(9,3,41,2022-04-18),
(10,2,24,2022-03-14);
