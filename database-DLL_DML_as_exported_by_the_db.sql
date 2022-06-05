-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2022 at 09:42 PM
-- Server version: 8.0.25
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `powerx`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `organization_id` bigint UNSIGNED NOT NULL,
  `idia_kefalaia` decimal(20,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`organization_id`, `idia_kefalaia`) VALUES
(5, '140000000.10'),
(6, '28900007800.24'),
(7, '8900007800.24'),
(8, '200007800.24'),
(9, '2900007800.24'),
(10, '200007800.24'),
(11, '2890007800.24'),
(12, '180007800.24'),
(13, '38900007800.24'),
(14, '88900007800.24'),
(15, '98900007800.24');

-- --------------------------------------------------------

--
-- Table structure for table `deliverables`
--

CREATE TABLE `deliverables` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_of_delivery` date NOT NULL,
  `project_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `deliverables`
--

INSERT INTO `deliverables` (`id`, `title`, `description`, `date_of_delivery`, `project_id`) VALUES
(1, 'Hello 1', 'Hand Over the Work 1', '2020-01-01', 5),
(2, 'Hello 2', 'Hand Over the Work 2', '2020-01-02', 6),
(3, 'Hello 3', 'Hand Over the Work 3', '2020-01-03', 11),
(4, 'Hello 4', 'Hand Over the Work 4', '2020-01-04', 12),
(5, 'Hello 5', 'Hand Over the Work 5', '2020-01-05', 13),
(6, 'Hello 6', 'Hand Over the Work 6', '2020-01-06', 14),
(7, 'Hello 7', 'Hand Over the Work 7', '2020-01-07', 15),
(8, 'Hello 8', 'Hand Over the Work 8', '2020-01-08', 38),
(9, 'Hello 9', 'Hand Over the Work 9', '2020-01-09', 43),
(10, 'Hello 10', 'Hand Over the Work 10', '2020-01-10', 44),
(11, 'Hello 11', 'Hand Over the Work 11', '2020-01-11', 48),
(12, 'Hello 12', 'Hand Over the Work 12', '2020-01-12', 50),
(13, 'Hello 13', 'Hand Over the Work 13', '2020-01-13', 52),
(14, 'Hello 14', 'Hand Over the Work 14', '2020-01-14', 53),
(15, 'Hello 15', 'Hand Over the Work 15', '2020-01-15', 58),
(16, 'Hello 16', 'Hand Over the Work 16', '2020-01-16', 64),
(17, 'Hello 17', 'Hand Over the Work 17', '2020-01-17', 65),
(18, 'Hello 18', 'Hand Over the Work 18', '2020-01-17', 34),
(19, 'Hello 19', 'Hand Over the Work 19', '2020-01-17', 39),
(20, 'Hello 20', 'Hand Over the Work 20', '2020-01-17', 47),
(21, 'Hello 21', 'Hand Over the Work 21', '2020-01-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `evaluations`
--

CREATE TABLE `evaluations` (
  `id` bigint UNSIGNED NOT NULL,
  `grade` varchar(255) NOT NULL,
  `date_of_evaluation` date NOT NULL,
  `researcher_id` bigint UNSIGNED NOT NULL,
  `project_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `evaluations`
--

INSERT INTO `evaluations` (`id`, `grade`, `date_of_evaluation`, `researcher_id`, `project_id`) VALUES
(1, '10', '2022-01-06', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `executives`
--

CREATE TABLE `executives` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `executives`
--

INSERT INTO `executives` (`id`, `name`) VALUES
(1, 'John Anastasiou'),
(2, 'Nick Alexiou'),
(3, 'George Ioannou'),
(4, 'Anastasia Georgiou'),
(5, 'Alexandra Kaniou'),
(6, 'Panagiotis Nikolaou'),
(7, 'Ioannis Politikos'),
(8, 'Myrtw Glytsi'),
(9, 'Marios Theodorou'),
(10, 'Konstantina Kimoulaki'),
(11, 'Marianna Kerantzaki'),
(12, 'Xrisiida Tsioptsis'),
(13, 'Konstantina Stefanou'),
(14, 'Anastasios Charpantidis'),
(15, 'Themis Chasiotis'),
(16, 'George Tirellis'),
(17, 'Athina Nikolaou');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint UNSIGNED NOT NULL,
  `abbreviation` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `abbreviation`, `name`, `zip_code`, `street`, `city`) VALUES
(1, 'NTUA', 'National Technical University of Athens', '15875', 'Kokkinopoulou 40', 'Athens'),
(2, 'EKPA', 'Panepistimio Athinwn', '16859', 'Solonos 8', 'Athens'),
(3, 'DPΟΤΗ', 'Dimokriteio', '14750', 'Akadimias 15', 'Alexandroupoli'),
(4, 'APTH', 'Ereunitiko Kentro Aristoteliou Panepistimiou Thessalonikis', '18615', 'Tsimiski 56', 'Athens'),
(5, 'AKTOR', 'Aktor-constructions', '19556', 'Kifisias 156', 'Athens'),
(6, 'MTLN', 'Mytilinaios', '17456', 'Kifisias 188', 'Athens'),
(7, 'TERNA', 'GEK-TERNA', '18496', 'Ardittou 57', 'Athens'),
(8, 'ABAX', 'ABAX-constructions', '12496', 'Kifisias 36', 'Athens'),
(9, 'EK', 'Ellinika-Kalodia', '19572', 'Leoforos Aspropirgou 45', 'Athens'),
(10, 'TITAN', 'TITAN Cement', '19579', 'Leoforos Aspropirgou 79', 'Athens'),
(11, 'MO', 'Motor Oil', '18260', 'Leoforos Aspropirgou 92', 'Athens'),
(12, 'BP', 'BP', '18263', 'Leoforos Nato 99', 'Athens'),
(13, 'Shell', 'Shell', '18265', 'Leoforos Nato 65', 'Athens'),
(14, 'Hraklis', 'AGET-Hraklis', '17346', 'Thivon 95', 'Athens'),
(15, 'SNDR', 'SIDENOR', '17457', 'Peiraios 18', 'Athens');

-- --------------------------------------------------------

--
-- Table structure for table `organization_phones`
--

CREATE TABLE `organization_phones` (
  `organization_id` bigint UNSIGNED NOT NULL,
  `phone_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `organization_phones`
--

INSERT INTO `organization_phones` (`organization_id`, `phone_number`) VALUES
(1, '+30698483794'),
(1, '+30210473947'),
(2, '+4438492749');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `name`, `address`) VALUES
(1, 'Hercules I', 'Kokkinopoulou 2'),
(2, 'Clean Energy I', 'Peiraios 14'),
(3, 'Medditeranean Cleaner', 'Voulis 8'),
(4, 'Recycling Actions II', 'Stadiou 10'),
(5, 'Concrete Development I', 'Kifisias 15'),
(6, 'Cable Material Development I', 'Panepistimiou 78'),
(7, 'Cable Material Development II', 'Panepistimiou 78'),
(8, 'Cable Material Development III', 'Panepistimiou 78'),
(9, 'Cable Material Development IV', 'Panepistimiou 78'),
(10, 'Cable Material Development V', 'Panepistimiou 78'),
(11, 'Cable Material Development VI', 'Panepistimiou 78'),
(12, 'Alternative Energy Resources', 'Stadiou 17'),
(13, 'Concrete Development II', 'Kifisias 15'),
(14, 'Concrete Development III', 'Kifisias 15'),
(15, 'Concrete Development IV', 'Kifisias 15'),
(16, 'Concrete Development V', 'Kifisias 15'),
(17, 'Concrete Development VI', 'Kifisias 15'),
(18, 'Concrete Development VII', 'Kifisias 15'),
(19, 'Concrete Development VIII', 'Kifisias 15'),
(20, 'Concrete Development IX', 'Kifisias 15'),
(21, 'Concrete Development X', 'Kifisias 15'),
(22, 'Recycling Actions I', 'Stadiou 10'),
(23, 'Recycling Actions III', 'Stadiou 10'),
(24, 'Hercules II', 'Kokkinopoulou 2'),
(25, 'Hercules III', 'Kokkinopoulou 2'),
(26, 'Hercules IV', 'Kokkinopoulou 2'),
(27, 'Hercules V', 'Kokkinopoulou 2'),
(28, 'Hercules VI', 'Kokkinopoulou 2'),
(29, 'Program Athens Waste Management 15', 'Kokkinopoulou 2'),
(30, 'Program Athens Waste Management 16', 'Kokkinopoulou 3'),
(31, 'Program Athens Waste Management 17', 'Kokkinopoulou 2'),
(32, 'Program Athens Waste Management 18', 'Kokkinopoulou 3'),
(33, 'Program Athens Waste Management 19', 'Kokkinopoulou 2'),
(34, 'Program Athens Waste Management 20', 'Kokkinopoulou 3'),
(35, 'Program Athens Waste Management 21', 'Kokkinopoulou 2'),
(36, 'Program Athens Waste Management 22', 'Kokkinopoulou 3'),
(37, 'Program Renewable Energy 04', 'Kokkinopoulou 2'),
(38, 'Program Renewable Energy 05', 'Kokkinopoulou 3'),
(39, 'Program Renewable Energy 06', 'Kokkinopoulou 2'),
(40, 'Program Renewable Energy 07', 'Kokkinopoulou 3'),
(41, 'Program Renewable Energy 08', 'Kokkinopoulou 2'),
(42, 'Program Renewable Energy 09', 'Kokkinopoulou 3'),
(43, 'Program Renewable Energy 10', 'Kokkinopoulou 2'),
(44, 'Program Renewable Energy 11', 'Kokkinopoulou 3'),
(45, 'Program Renewable Energy 12', 'Kokkinopoulou 2'),
(46, 'Program Renewable Energy 13', 'Kokkinopoulou 2'),
(47, 'Program Renewable Energy 14', 'Kokkinopoulou 3'),
(48, 'Program Renewable Energy 15', 'Kokkinopoulou 2'),
(49, 'Program Renewable Energy 16', 'Kokkinopoulou 3'),
(50, 'Program Renewable Energy 17', 'Kokkinopoulou 2'),
(51, 'Program Renewable Energy 18', 'Kokkinopoulou 3'),
(52, 'Program Renewable Energy 19', 'Kokkinopoulou 2'),
(53, 'Program Renewable Energy 20', 'Kokkinopoulou 3'),
(54, 'Program Renewable Energy 21', 'Kokkinopoulou 2'),
(55, 'Program Renewable Energy 22', 'Kokkinopoulou 3'),
(56, 'Program Renewable Energy 23', 'Kokkinopoulou 2'),
(57, 'Program Wind Energy 19', 'Kokkinopoulou 3'),
(58, 'Program Wind Energy 20', 'Kokkinopoulou 2'),
(59, 'Program Wind Energy 21', 'Kokkinopoulou 3'),
(60, 'Program Solar Energy 19', 'Kokkinopoulou 2'),
(61, 'Program Solar Energy 20', 'Kokkinopoulou 3'),
(62, 'Program Solar Energy 21', 'Kokkinopoulou 2'),
(63, 'Program Thermal Energy 19', 'Kokkinopoulou 2'),
(64, 'Program Thermal Energy 20', 'Kokkinopoulou 3'),
(65, 'Program Thermal Energy 21', 'Kokkinopoulou 2'),
(66, 'Program New Database System 19', 'Kokkinopoulou 3'),
(67, 'Program New Database System 20', 'Kokkinopoulou 2'),
(68, 'Program New Database System 21', 'Kokkinopoulou 3'),
(69, 'Program New Supercomputer 19', 'Kokkinopoulou 2'),
(70, 'Program New Supercomputer 20', 'Kokkinopoulou 3'),
(71, 'Program New Supercomputer 21', 'Kokkinopoulou 2'),
(72, 'Program 5G Telecommunications 19', 'Kokkinopoulou 3'),
(73, 'Program 5G Telecommunications 20', 'Kokkinopoulou 2'),
(74, 'Program 5G Telecommunications 21', 'Kokkinopoulou 3'),
(75, 'Program Cement Research 19', 'Kokkinopoulou 2'),
(76, 'Program Cement Research 20', 'Kokkinopoulou 3'),
(77, 'Program Cement Research 21', 'Kokkinopoulou 2'),
(78, 'Program Nanomaterials 19', 'Kokkinopoulou 3'),
(79, 'Program Nanomaterials 20', 'Kokkinopoulou 2'),
(80, 'Program Nanomaterials 21', 'Kokkinopoulou 2'),
(81, 'Program Nanomaterials 22', 'Kokkinopoulou 3'),
(82, 'Program Networks of the future 19', 'Kokkinopoulou 2'),
(83, 'Program Networks of the future 20', 'Kokkinopoulou 3'),
(84, 'Program Networks of the future 21', 'Kokkinopoulou 2'),
(85, 'Program Networks of the future 22', 'Kokkinopoulou 3'),
(86, 'Program ', 'Networks of the future 22');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `budget` decimal(20,2) UNSIGNED DEFAULT NULL,
  `managing_organization_id` bigint UNSIGNED NOT NULL,
  `program_id` bigint UNSIGNED NOT NULL,
  `executive_id` bigint UNSIGNED NOT NULL,
  `scientific_director_researcher_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `description`, `start_date`, `end_date`, `budget`, `managing_organization_id`, `program_id`, `executive_id`, `scientific_director_researcher_id`) VALUES
(1, 'Clean Sea 16', 'Cleaning The Mediteranean using new technologies', '2016-01-05', '2016-01-06', '1255000.88', 1, 1, 1, 1),
(2, 'Clean Sea 17', 'Cleaning The Mediteranean using new technologies', '2017-01-05', '2017-01-15', '1255000.88', 2, 2, 2, 2),
(3, 'Clean Sea 18', 'Cleaning The Mediteranean using new technologies', '2018-01-05', '2022-02-06', '1255000.88', 3, 3, 3, 3),
(4, 'Clean Sea 19', 'Cleaning The Mediteranean using new technologies', '2019-01-05', '2022-02-06', '1255000.88', 4, 4, 4, 4),
(5, 'Clean Sea 21', 'Cleaning The Mediteranean using new technologies', '2021-01-05', '2025-02-06', '1255000.88', 5, 5, 5, 5),
(6, 'Clean Sea 22', 'Cleaning The Mediteranean using new technologies', '2022-01-05', '2025-02-06', '1255000.88', 6, 6, 6, 6),
(7, 'Athens Waste Management 15', 'Recycling Materials in new facilities', '2015-03-03', '2019-04-04', '3500000.49', 7, 7, 7, 7),
(8, 'Advanced Concrete', 'Creating new technology', '2015-01-05', '2021-02-06', '125550.88', 8, 8, 8, 8),
(9, 'Athens Waste Management 15', 'Recycling Materials in new facilities', '2015-03-03', '2019-04-04', '3500000.49', 1, 7, 7, 1),
(10, 'Athens Waste Management 16', 'Recycling Materials in new facilities', '2016-03-03', '2021-03-03', '3500000.49', 2, 8, 7, 2),
(11, 'Athens Waste Management 17', 'Recycling Materials in new facilities', '2017-03-03', '2022-03-03', '3500000.49', 1, 9, 7, 1),
(12, 'Athens Waste Management 18', 'Recycling Materials in new facilities', '2018-03-03', '2023-03-03', '3500000.49', 2, 10, 7, 2),
(13, 'Athens Waste Management 19', 'Recycling Materials in new facilities', '2019-03-03', '2024-03-03', '3500000.49', 7, 11, 8, 1),
(14, 'Athens Waste Management 20', 'Recycling Materials in new facilities', '2020-03-03', '2025-03-03', '3500000.49', 7, 12, 8, 2),
(15, 'Athens Waste Management 21', 'Recycling Materials in new facilities', '2021-03-03', '2026-03-03', '3500000.49', 7, 13, 8, 1),
(16, 'Athens Waste Management 22', 'Recycling Materials in new facilities', '2022-03-03', '2027-03-03', '3500000.49', 7, 14, 8, 2),
(17, 'Renewable Energy 04', 'Loans', '2004-01-01', '2016-01-01', '7382748.44', 1, 15, 9, 1),
(18, 'Renewable Energy 05', 'Loans', '2005-01-01', '2017-01-01', '7482748.44', 1, 16, 9, 2),
(19, 'Renewable Energy 06', 'Loans', '2006-01-01', '2018-01-01', '7582748.44', 1, 17, 9, 1),
(20, 'Renewable Energy 07', 'Loans', '2007-01-01', '2019-01-01', '7682748.44', 1, 18, 10, 2),
(21, 'Renewable Energy 08', 'Loans', '2008-01-01', '2020-01-01', '7782748.44', 1, 19, 4, 1),
(22, 'Renewable Energy 09', 'Loans', '2009-01-01', '2021-01-01', '7882748.44', 1, 20, 4, 2),
(23, 'Renewable Energy 10', 'Loans', '2010-01-01', '2022-01-01', '7982748.44', 1, 21, 4, 1),
(24, 'Renewable Energy 11', 'Loans', '2011-01-01', '2023-01-01', '8082748.44', 8, 22, 4, 2),
(25, 'Renewable Energy 12', 'Loans', '2012-01-01', '2024-01-01', '8182748.44', 8, 23, 4, 1),
(26, 'Renewable Energy 13', 'Loans', '2013-01-01', '2025-01-01', '8282748.44', 8, 24, 2, 2),
(27, 'Renewable Energy 14', 'Loans', '2014-01-01', '2026-01-01', '8382748.44', 8, 25, 2, 1),
(28, 'Renewable Energy 15', 'Loans', '2015-01-01', '2027-01-01', '8482748.44', 8, 26, 2, 2),
(29, 'Renewable Energy 16', 'Loans', '2016-01-01', '2028-01-01', '8582748.44', 8, 27, 1, 1),
(30, 'Renewable Energy 17', 'Loans', '2017-01-01', '2029-01-01', '8682748.44', 7, 28, 9, 2),
(31, 'Renewable Energy 18', 'Loans', '2018-01-01', '2030-01-01', '8782748.44', 7, 29, 9, 1),
(32, 'Renewable Energy 19', 'Loans', '2019-01-01', '2031-01-01', '8882748.44', 7, 30, 9, 2),
(33, 'Renewable Energy 20', 'Loans', '2020-01-01', '2032-01-01', '8982748.44', 7, 31, 9, 1),
(34, 'Renewable Energy 21', 'Loans', '2021-01-01', '2033-01-01', '9082748.44', 7, 32, 9, 2),
(35, 'Renewable Energy 22', 'Loans', '2022-01-01', '2034-01-01', '9182748.44', 7, 33, 9, 1),
(36, 'Renewable Energy 23', 'Loans', '2023-01-01', '2035-01-01', '9282748.44', 7, 34, 9, 2),
(37, 'Wind Energy 19', 'Energy', '2019-01-01', '2031-01-01', '8882748.44', 7, 30, 9, 2),
(38, 'Wind Energy 20', 'Energy', '2020-01-01', '2032-01-01', '8982748.44', 7, 31, 9, 1),
(39, 'Wind Energy 21', 'Energy', '2021-01-01', '2033-01-01', '9082748.44', 7, 32, 9, 2),
(40, 'Solar Energy 19', 'Energy', '2019-01-01', '2031-01-01', '8882748.44', 7, 33, 8, 2),
(41, 'Solar Energy 20', 'Energy', '2020-01-01', '2032-01-01', '8982748.44', 7, 34, 8, 2),
(42, 'Solar Energy 21', 'Energy', '2021-01-01', '2033-01-01', '9082748.44', 7, 35, 8, 1),
(43, 'Thermal Energy 19', 'Energy', '2019-01-01', '2031-01-01', '8882748.44', 7, 36, 8, 2),
(44, 'Thermal Energy 20', 'Energy', '2020-01-01', '2032-01-01', '8982748.44', 7, 37, 8, 2),
(45, 'Thermal Energy 21', 'Energy', '2021-01-01', '2033-01-01', '9082748.44', 7, 38, 9, 1),
(46, 'New Database System 19', 'Energy', '2019-01-01', '2031-01-01', '8882748.44', 7, 39, 9, 2),
(47, 'New Database System 20', 'Energy', '2020-01-01', '2032-01-01', '8982748.44', 7, 40, 9, 2),
(48, 'New Database System 21', 'Energy', '2021-01-01', '2033-01-01', '9082748.44', 7, 41, 9, 2),
(49, 'New Supercomputer 19', 'Computers', '2019-01-01', '2031-01-01', '8882748.44', 7, 42, 6, 1),
(50, 'New Supercomputer 20', 'Computers', '2020-01-01', '2032-01-01', '8982748.44', 7, 43, 6, 2),
(51, 'New Supercomputer 21', 'Computers', '2021-01-01', '2033-01-01', '9082748.44', 7, 44, 6, 2),
(52, '5G Telecommunications 19', 'Energy', '2019-01-01', '2031-01-01', '8882748.44', 7, 45, 5, 1),
(53, '5G Telecommunications 20', 'Energy', '2020-01-01', '2032-01-01', '8982748.44', 7, 46, 5, 2),
(54, '5G Telecommunications 21', 'Energy', '2021-01-01', '2033-01-01', '9082748.44', 7, 47, 5, 2),
(55, 'Cement Research 19', 'Cements', '2019-01-01', '2031-01-01', '8882748.44', 7, 48, 4, 2),
(56, 'Cement Research 20', 'Cements', '2020-01-01', '2032-01-01', '8982748.44', 7, 49, 4, 1),
(57, 'Cement Research 21', 'Cements', '2021-01-01', '2033-01-01', '9082748.44', 7, 50, 3, 2),
(58, 'Nanomaterials 19', 'Energy', '2019-01-01', '2031-01-01', '8882748.44', 7, 51, 9, 2),
(59, 'Nanomaterials 20', 'Energy', '2020-01-01', '2032-01-01', '8982748.44', 7, 52, 9, 1),
(60, 'Nanomaterials 21', 'Energy', '2021-01-01', '2033-01-01', '9082748.44', 7, 53, 10, 2),
(61, 'Nanomaterials 22', 'Energy', '2022-01-01', '2034-01-01', '9182748.44', 7, 54, 10, 2),
(62, 'Networks of the future 19', 'Computers', '2019-01-01', '2031-01-01', '8882748.44', 7, 55, 10, 1),
(63, 'Networks of the future 20', 'Computers', '2020-01-01', '2032-01-01', '8982748.44', 7, 56, 10, 2),
(64, 'Networks of the future 21', 'Computers', '2021-01-01', '2033-01-01', '9082748.44', 7, 57, 10, 2),
(65, 'Networks of the future 22', 'Computers', '2022-01-01', '2034-01-01', '9182748.44', 7, 58, 10, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `projects_per_researcher_all_relations`
-- (See below for the actual view)
--
CREATE TABLE `projects_per_researcher_all_relations` (
`TYPE` varchar(19)
,`researcher_id` bigint unsigned
,`researcher_first_name` varchar(255)
,`researcher_last_name` varchar(255)
,`researcher_date_of_birth` date
,`researcher_sex` varchar(255)
,`researcher_date_of_employment` varchar(255)
,`researcher_organization_id` bigint unsigned
,`project_id` bigint unsigned
,`project_title` varchar(255)
,`project_description` varchar(255)
,`project_start_date` date
,`project_end_date` date
,`project_budget` decimal(20,2) unsigned
,`project_executive_id` bigint unsigned
,`project_scientific_director_researcher_id` bigint unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `project_scientific_fields`
--

CREATE TABLE `project_scientific_fields` (
  `project_id` bigint UNSIGNED NOT NULL,
  `scientific_field_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `project_scientific_fields`
--

INSERT INTO `project_scientific_fields` (`project_id`, `scientific_field_id`) VALUES
(1, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(11, 1),
(14, 1),
(15, 1),
(38, 1),
(44, 1),
(45, 1),
(46, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(58, 1),
(64, 1),
(65, 1),
(1, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(38, 2),
(43, 2),
(44, 2),
(48, 2),
(50, 2),
(52, 2),
(53, 2),
(58, 2),
(64, 2),
(65, 2),
(2, 3),
(3, 3),
(5, 3),
(6, 3),
(15, 3),
(34, 3),
(35, 3),
(36, 3),
(38, 3),
(39, 3),
(43, 3),
(47, 3),
(48, 3),
(52, 3),
(53, 3),
(58, 3),
(63, 3),
(64, 3),
(65, 3),
(6, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(39, 4),
(47, 4),
(48, 4),
(52, 4),
(54, 4),
(63, 4),
(64, 4),
(65, 4),
(6, 5),
(36, 5),
(37, 5),
(39, 5),
(40, 5),
(41, 5),
(42, 5),
(48, 5),
(55, 5),
(59, 5),
(60, 5),
(61, 5),
(63, 5),
(64, 5),
(65, 5),
(37, 6),
(39, 6),
(40, 6),
(42, 6),
(56, 6),
(60, 6),
(62, 6),
(63, 6),
(64, 6),
(65, 6),
(37, 7),
(42, 7),
(57, 7),
(63, 7),
(64, 7),
(65, 7);

-- --------------------------------------------------------

--
-- Table structure for table `researchers`
--

CREATE TABLE `researchers` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `sex` varchar(255) NOT NULL,
  `date_of_employment` varchar(255) NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `researchers`
--

INSERT INTO `researchers` (`id`, `first_name`, `last_name`, `date_of_birth`, `sex`, `date_of_employment`, `organization_id`) VALUES
(1, 'Andreas', 'Papanikolaou', '1990-01-19', 'male', '2014-05-05', 1),
(2, 'Panos', 'Kamateros', '1985-01-20', 'male', '2013-06-09', 1),
(3, 'Vasiliki', 'Karanikou', '1986-01-21', 'female', '2012-07-09', 1),
(4, 'Konstantinos', 'Markou', '1992-01-29', 'male', '2014-09-05', 4),
(5, 'Anastasios', 'Papakostas', '1992-01-29', 'male', '2014-09-05', 4),
(6, 'Nikos', 'Papatheodorou', '1975-03-26', 'male', '2015-09-05', 5),
(7, 'George', 'Fountoukis', '1957-03-26', 'male', '2000-10-03', 5),
(8, 'Anastasios', 'Karidis', '1967-04-15', 'male', '2007-05-04', 5),
(9, 'Nikos', 'Gewrgalas', '1973-03-26', 'male', '2009-05-02', 5),
(10, 'Anastasia', 'Papanikolaou', '1983-07-18', 'female', '2014-12-08', 6),
(11, 'Maria', 'Ailamaki', '1984-08-28', 'female', '2015-11-07', 6),
(12, 'Georgia', 'Psarianou', '1989-11-28', 'female', '2018-12-07', 6),
(13, 'Maria', 'Mixaliatsianou', '1996-05-22', 'female', '2016-11-07', 7),
(14, 'John', 'Mixalopoulos', '1993-07-23', 'male', '2017-11-08', 7),
(15, 'Mixalis', 'Georgakoglou', '1992-10-06', 'male', '2017-05-08', 7),
(16, 'Nick', 'Sinodinos', '1997-07-23', 'male', '2017-06-02', 8),
(17, 'Georgia', 'Katsantoni', '1993-07-23', 'female', '2017-07-08', 8),
(18, 'Marios', 'Paksinos', '1991-07-23', 'male', '2015-08-06', 8),
(19, 'Antonis', 'Kapsis', '1996-07-23', 'male', '2019-09-03', 9),
(20, 'Vasilis', 'Torosidis', '1993-07-23', 'male', '2017-14-05', 9),
(21, 'Ioannis', 'Pesmoulakis', '1993-07-23', 'male', '2017-01-07', 9),
(22, 'Nick', 'Giannou', '1991-07-24', 'male', '2016-01-02', 10),
(23, 'Georgia', 'Mitsaina', '1993-07-23', 'female', '2017-03-06', 10),
(24, 'Vaggelis', 'Saroglou', '1997-07-23', 'male', '2018-04-03', 10),
(25, 'Stefania', 'Drakou', '1985-07-23', 'female', '2017-09-08', 11),
(26, 'Nikoletta', 'Stefou', '1993-07-23', 'female', '2017-10-08', 11),
(27, 'Kostas', 'Hatzoglou', '1988-06-25', 'male', '2018-11-08', 11),
(28, 'Maria', 'Kamaterou', '1999-07-23', 'female', '2021-12-19', 12),
(29, 'Stelios', 'Legakis', '1993-07-23', 'male', '2020-05-18', 12),
(30, 'George', 'Giannias', '1993-07-23', 'male', '2021-01-08', 12),
(31, 'Afroditi', 'Skoura', '1965-07-23', 'female', '2010-12-19', 13),
(32, 'Anestis', 'Gkiourtzidis', '1997-07-23', 'male', '2019-05-18', 13),
(33, 'Marios', 'Sirapoglou', '1996-07-23', 'male', '2014-01-08', 13),
(34, 'Afroditi', 'Begolaki', '1960-07-23', 'female', '2010-12-19', 13),
(35, 'Giannis', 'Renakis', '1997-07-23', 'male', '2021-05-18', 13),
(36, 'Mixalis', 'Katzourakis', '1998-07-23', 'male', '2019-01-08', 13),
(37, 'Alexandra', 'Skoura', '1972-07-23', 'female', '2003-12-19', 14),
(38, 'Giorgos', 'Papadopoulos', '1990-07-23', 'male', '2011-05-18', 14),
(39, 'Andreas', 'Stathopoulos', '1990-07-23', 'male', '2015-01-08', 14);

-- --------------------------------------------------------

--
-- Table structure for table `researcher_works_on_project`
--

CREATE TABLE `researcher_works_on_project` (
  `project_id` bigint UNSIGNED NOT NULL,
  `researcher_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `researcher_works_on_project`
--

INSERT INTO `researcher_works_on_project` (`project_id`, `researcher_id`) VALUES
(1, 1),
(5, 1),
(6, 1),
(11, 1),
(14, 1),
(15, 1),
(38, 1),
(44, 1),
(45, 1),
(46, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(58, 1),
(64, 1),
(65, 1),
(1, 2),
(5, 2),
(6, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(38, 2),
(43, 2),
(44, 2),
(48, 2),
(50, 2),
(52, 2),
(53, 2),
(58, 2),
(64, 2),
(65, 2),
(1, 3),
(5, 3),
(6, 3),
(15, 3),
(34, 3),
(35, 3),
(36, 3),
(38, 3),
(39, 3),
(43, 3),
(47, 3),
(48, 3),
(52, 3),
(53, 3),
(58, 3),
(63, 3),
(64, 3),
(65, 3),
(6, 4),
(34, 4),
(35, 4),
(36, 4),
(37, 4),
(39, 4),
(47, 4),
(48, 4),
(52, 4),
(54, 4),
(63, 4),
(64, 4),
(65, 4),
(6, 5),
(36, 5),
(37, 5),
(39, 5),
(40, 5),
(41, 5),
(42, 5),
(48, 5),
(55, 5),
(59, 5),
(60, 5),
(61, 5),
(63, 5),
(64, 5),
(65, 5),
(37, 6),
(39, 6),
(40, 6),
(42, 6),
(56, 6),
(60, 6),
(62, 6),
(63, 6),
(64, 6),
(65, 6),
(37, 7),
(42, 7),
(57, 7),
(63, 7),
(64, 7),
(65, 7);

-- --------------------------------------------------------

--
-- Table structure for table `research_centers`
--

CREATE TABLE `research_centers` (
  `organization_id` bigint UNSIGNED NOT NULL,
  `ministry_of_education_budget` decimal(20,2) UNSIGNED NOT NULL,
  `private_funding_budget` decimal(20,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `research_centers`
--

INSERT INTO `research_centers` (`organization_id`, `ministry_of_education_budget`, `private_funding_budget`) VALUES
(3, '5000000.80', '140000000.10'),
(4, '889200.44', '28900000.24');

-- --------------------------------------------------------

--
-- Stand-in structure for view `research_centers_scientific_fields`
-- (See below for the actual view)
--
CREATE TABLE `research_centers_scientific_fields` (
`organization_id` bigint unsigned
,`organization_abbreviation` varchar(48)
,`organization_name` varchar(255)
,`ministry_of_education_budget` decimal(20,2) unsigned
,`private_funding_budget` decimal(20,2) unsigned
,`scientific_field_id` bigint unsigned
,`scientific_field_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `scientific_fields`
--

CREATE TABLE `scientific_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `scientific_fields`
--

INSERT INTO `scientific_fields` (`id`, `name`) VALUES
(1, 'Mechanical Engineering'),
(2, 'Naval Engineering'),
(3, 'Civil Engineering'),
(4, 'Chemical Engineering'),
(5, 'Electrical Engineering'),
(6, 'Computer Science'),
(7, 'Oceanography');

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `organization_id` bigint UNSIGNED NOT NULL,
  `ministry_of_education_budget` decimal(20,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`organization_id`, `ministry_of_education_budget`) VALUES
(1, '70000000.80'),
(2, '8892800.44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `loginid` varchar(250) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `loginid`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Structure for view `projects_per_researcher_all_relations`
--
DROP TABLE IF EXISTS `projects_per_researcher_all_relations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `projects_per_researcher_all_relations`  AS SELECT 'Scientific Director' AS `TYPE`, `researchers`.`id` AS `researcher_id`, `researchers`.`first_name` AS `researcher_first_name`, `researchers`.`last_name` AS `researcher_last_name`, `researchers`.`date_of_birth` AS `researcher_date_of_birth`, `researchers`.`sex` AS `researcher_sex`, `researchers`.`date_of_employment` AS `researcher_date_of_employment`, `researchers`.`organization_id` AS `researcher_organization_id`, `projects`.`id` AS `project_id`, `projects`.`title` AS `project_title`, `projects`.`description` AS `project_description`, `projects`.`start_date` AS `project_start_date`, `projects`.`end_date` AS `project_end_date`, `projects`.`budget` AS `project_budget`, `projects`.`executive_id` AS `project_executive_id`, `projects`.`scientific_director_researcher_id` AS `project_scientific_director_researcher_id` FROM (`researchers` join `projects` on((`researchers`.`id` = `projects`.`scientific_director_researcher_id`))) union select 'Works' AS `type`,`researchers`.`id` AS `researcher_id`,`researchers`.`first_name` AS `researcher_first_name`,`researchers`.`last_name` AS `researcher_last_name`,`researchers`.`date_of_birth` AS `researcher_date_of_birth`,`researchers`.`sex` AS `researcher_sex`,`researchers`.`date_of_employment` AS `researcher_date_of_employment`,`researchers`.`organization_id` AS `researcher_organization_id`,`projects`.`id` AS `project_id`,`projects`.`title` AS `project_title`,`projects`.`description` AS `project_description`,`projects`.`start_date` AS `project_start_date`,`projects`.`end_date` AS `project_end_date`,`projects`.`budget` AS `project_budget`,`projects`.`executive_id` AS `project_executive_id`,`projects`.`scientific_director_researcher_id` AS `project_scientific_director_researcher_id` from ((`researchers` join `researcher_works_on_project` on((`researchers`.`id` = `researcher_works_on_project`.`researcher_id`))) join `projects` on((`researcher_works_on_project`.`project_id` = `projects`.`id`))) union select 'Evaluates' AS `type`,`researchers`.`id` AS `researcher_id`,`researchers`.`first_name` AS `researcher_first_name`,`researchers`.`last_name` AS `researcher_last_name`,`researchers`.`date_of_birth` AS `researcher_date_of_birth`,`researchers`.`sex` AS `researcher_sex`,`researchers`.`date_of_employment` AS `researcher_date_of_employment`,`researchers`.`organization_id` AS `researcher_organization_id`,`projects`.`id` AS `project_id`,`projects`.`title` AS `project_title`,`projects`.`description` AS `project_description`,`projects`.`start_date` AS `project_start_date`,`projects`.`end_date` AS `project_end_date`,`projects`.`budget` AS `project_budget`,`projects`.`executive_id` AS `project_executive_id`,`projects`.`scientific_director_researcher_id` AS `project_scientific_director_researcher_id` from ((`researchers` join `evaluations` on((`researchers`.`id` = `evaluations`.`researcher_id`))) join `projects` on((`evaluations`.`project_id` = `projects`.`id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `research_centers_scientific_fields`
--
DROP TABLE IF EXISTS `research_centers_scientific_fields`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `research_centers_scientific_fields`  AS SELECT DISTINCT `research_centers`.`organization_id` AS `organization_id`, `organizations`.`abbreviation` AS `organization_abbreviation`, `organizations`.`name` AS `organization_name`, `research_centers`.`ministry_of_education_budget` AS `ministry_of_education_budget`, `research_centers`.`private_funding_budget` AS `private_funding_budget`, `scientific_fields`.`id` AS `scientific_field_id`, `scientific_fields`.`name` AS `scientific_field_name` FROM ((((`research_centers` join `organizations` on((`research_centers`.`organization_id` = `organizations`.`id`))) join `projects` on((`projects`.`managing_organization_id` = `organizations`.`id`))) join `project_scientific_fields` on((`projects`.`id` = `project_scientific_fields`.`project_id`))) join `scientific_fields` on((`project_scientific_fields`.`scientific_field_id` = `scientific_fields`.`id`))) ORDER BY `organizations`.`name` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`organization_id`);

--
-- Indexes for table `deliverables`
--
ALTER TABLE `deliverables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `researcher_id` (`researcher_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `executives`
--
ALTER TABLE `executives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization_phones`
--
ALTER TABLE `organization_phones`
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `managing_organization_id` (`managing_organization_id`),
  ADD KEY `program_id` (`program_id`),
  ADD KEY `executive_id` (`executive_id`),
  ADD KEY `scientific_director_researcher_id` (`scientific_director_researcher_id`);

--
-- Indexes for table `project_scientific_fields`
--
ALTER TABLE `project_scientific_fields`
  ADD PRIMARY KEY (`project_id`,`scientific_field_id`),
  ADD KEY `scientific_field_id` (`scientific_field_id`);

--
-- Indexes for table `researchers`
--
ALTER TABLE `researchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `researcher_works_on_project`
--
ALTER TABLE `researcher_works_on_project`
  ADD PRIMARY KEY (`project_id`,`researcher_id`),
  ADD KEY `researcher_id` (`researcher_id`);

--
-- Indexes for table `research_centers`
--
ALTER TABLE `research_centers`
  ADD PRIMARY KEY (`organization_id`);

--
-- Indexes for table `scientific_fields`
--
ALTER TABLE `scientific_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`organization_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deliverables`
--
ALTER TABLE `deliverables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `executives`
--
ALTER TABLE `executives`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `researchers`
--
ALTER TABLE `researchers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `scientific_fields`
--
ALTER TABLE `scientific_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `deliverables`
--
ALTER TABLE `deliverables`
  ADD CONSTRAINT `deliverables_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`id`),
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `organization_phones`
--
ALTER TABLE `organization_phones`
  ADD CONSTRAINT `organization_phones_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`managing_organization_id`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`executive_id`) REFERENCES `executives` (`id`),
  ADD CONSTRAINT `projects_ibfk_4` FOREIGN KEY (`scientific_director_researcher_id`) REFERENCES `researchers` (`id`);

--
-- Constraints for table `project_scientific_fields`
--
ALTER TABLE `project_scientific_fields`
  ADD CONSTRAINT `project_scientific_fields_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `project_scientific_fields_ibfk_2` FOREIGN KEY (`scientific_field_id`) REFERENCES `scientific_fields` (`id`);

--
-- Constraints for table `researchers`
--
ALTER TABLE `researchers`
  ADD CONSTRAINT `researchers_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `researcher_works_on_project`
--
ALTER TABLE `researcher_works_on_project`
  ADD CONSTRAINT `researcher_works_on_project_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `researcher_works_on_project_ibfk_2` FOREIGN KEY (`researcher_id`) REFERENCES `researchers` (`id`);

--
-- Constraints for table `research_centers`
--
ALTER TABLE `research_centers`
  ADD CONSTRAINT `research_centers_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `universities`
--
ALTER TABLE `universities`
  ADD CONSTRAINT `universities_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
