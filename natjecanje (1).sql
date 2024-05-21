-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2024 at 10:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `natjecanje`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

CREATE TABLE `kategorije` (
  `id` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`id`, `naziv`) VALUES
(1, '1.razred'),
(2, '2.razred'),
(3, '3.razred'),
(4, '4.razred');

-- --------------------------------------------------------

--
-- Table structure for table `natjecanje`
--

CREATE TABLE `natjecanje` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `datum_odrzavanja` date NOT NULL,
  `vrijeme_starta` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `natjecanje`
--

INSERT INTO `natjecanje` (`id`, `naziv`, `datum_odrzavanja`, `vrijeme_starta`) VALUES
(1, 'Natjecanje 1', '2024-05-20', '09:00:00'),
(2, 'Natjecanje 2', '2024-05-21', '10:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `natjecatelji`
--

CREATE TABLE `natjecatelji` (
  `id` int(11) NOT NULL,
  `ime` varchar(100) NOT NULL,
  `prezime` varchar(100) NOT NULL,
  `razred_id` int(100) DEFAULT NULL,
  `kategorija` int(11) DEFAULT NULL,
  `spol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `natjecatelji`
--

INSERT INTO `natjecatelji` (`id`, `ime`, `prezime`, `razred_id`, `kategorija`, `spol`) VALUES
(1, 'Marko', 'Horvat', 1, 2, 0),
(2, 'Ana', 'Murk', 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `razred`
--

CREATE TABLE `razred` (
  `id` int(11) NOT NULL,
  `naziv` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=eucjpms COLLATE=eucjpms_bin;

--
-- Dumping data for table `razred`
--

INSERT INTO `razred` (`id`, `naziv`) VALUES
(1, '1.RT'),
(2, '2.RT'),
(3, '3.RT'),
(4, '4.RT');

-- --------------------------------------------------------

--
-- Table structure for table `rezultati`
--

CREATE TABLE `rezultati` (
  `id` int(11) NOT NULL,
  `stanica_id` int(11) DEFAULT NULL,
  `natjecatelj_id` int(11) DEFAULT NULL,
  `vrijeme_potvrde` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rezultati`
--

INSERT INTO `rezultati` (`id`, `stanica_id`, `natjecatelj_id`, `vrijeme_potvrde`) VALUES
(1, 1, 1, '2024-05-20 07:30:15'),
(2, 1, 2, '2024-05-20 07:45:30'),
(5, 3, 1, '2024-05-21 09:00:20'),
(6, 3, 2, '2024-05-21 09:15:35');

-- --------------------------------------------------------

--
-- Table structure for table `stanice`
--

CREATE TABLE `stanice` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `natjecanje_id` int(11) DEFAULT NULL,
  `lozinka` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stanice`
--

INSERT INTO `stanice` (`id`, `naziv`, `natjecanje_id`, `lozinka`) VALUES
(1, 'Stanica 1', 1, '123'),
(3, 'Stanica 3', 2, '789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorije`
--
ALTER TABLE `kategorije`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `natjecanje`
--
ALTER TABLE `natjecanje`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `natjecatelji`
--
ALTER TABLE `natjecatelji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategorija` (`kategorija`);

--
-- Indexes for table `razred`
--
ALTER TABLE `razred`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rezultati`
--
ALTER TABLE `rezultati`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stanica_id` (`stanica_id`),
  ADD KEY `natjecatelj_id` (`natjecatelj_id`);

--
-- Indexes for table `stanice`
--
ALTER TABLE `stanice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `natjecanje_id` (`natjecanje_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorije`
--
ALTER TABLE `kategorije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `natjecanje`
--
ALTER TABLE `natjecanje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `natjecatelji`
--
ALTER TABLE `natjecatelji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `razred`
--
ALTER TABLE `razred`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rezultati`
--
ALTER TABLE `rezultati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `stanice`
--
ALTER TABLE `stanice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `natjecatelji`
--
ALTER TABLE `natjecatelji`
  ADD CONSTRAINT `natjecatelji_ibfk_1` FOREIGN KEY (`kategorija`) REFERENCES `kategorije` (`id`);

--
-- Constraints for table `rezultati`
--
ALTER TABLE `rezultati`
  ADD CONSTRAINT `fk_natjecatelj_id` FOREIGN KEY (`natjecatelj_id`) REFERENCES `natjecatelji` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_stanica_id` FOREIGN KEY (`stanica_id`) REFERENCES `stanice` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rezultati_ibfk_1` FOREIGN KEY (`stanica_id`) REFERENCES `stanice` (`id`),
  ADD CONSTRAINT `rezultati_ibfk_2` FOREIGN KEY (`natjecatelj_id`) REFERENCES `natjecatelji` (`id`);

--
-- Constraints for table `stanice`
--
ALTER TABLE `stanice`
  ADD CONSTRAINT `stanice_ibfk_1` FOREIGN KEY (`natjecanje_id`) REFERENCES `natjecanje` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
