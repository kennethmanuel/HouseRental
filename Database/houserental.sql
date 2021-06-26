-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2021 at 04:19 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `houserental`
--

-- --------------------------------------------------------

--
-- Table structure for table `call`
--

CREATE TABLE `call` (
  `id` int(11) NOT NULL,
  `waktu` datetime DEFAULT NULL,
  `perihal` varchar(45) DEFAULT NULL,
  `penyewa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat history`
--

CREATE TABLE `chat history` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `penyewa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat history`
--

INSERT INTO `chat history` (`id`, `content`, `penyewa_id`) VALUES
(1, 'admin : hi||', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `nomor telepon` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`id`, `username`, `password`, `nama`, `nomor telepon`) VALUES
(1, 'jerriel', 'jerriel', 'jerriel rhemaldy', '12345'),
(2, 'kenneth', 'kenneth', 'kenneth manuel', '123456789'),
(3, 'mario', 'mario', 'venmario', '123456'),
(5, 'mioktok', '123456', 'mario', '123456'),
(6, 'venansiusmario', '123456', 'VenansiusMario', '123456'),
(7, 'kennethmanuel', 'kennethmanuel', '123456', '123456'),
(8, 'admin', 'admin', 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `rumah`
--

CREATE TABLE `rumah` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `kamar` varchar(45) DEFAULT NULL,
  `fasilitas` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rumah`
--

INSERT INTO `rumah` (`id`, `nama`, `harga`, `foto`, `kamar`, `fasilitas`) VALUES
(1, 'Eindhoven', 366, '1', '4', 'breakfast'),
(2, 'Galaxy Resort', 400, '2', '6', 'breakfast'),
(3, 'Darwis', 234, '3', '3', 'breakfast'),
(4, 'Wishky Lucky', 254, '4', '3', 'breakfast'),
(5, 'Adelion', 354, '5', '4', 'breakfast'),
(6, 'Evarios', 453, '6', '3', 'breakfast');

-- --------------------------------------------------------

--
-- Table structure for table `sewa`
--

CREATE TABLE `sewa` (
  `idsewa` int(11) NOT NULL,
  `penyewa_id` int(11) NOT NULL,
  `rumah_id` int(11) NOT NULL,
  `tanggal_sewa` date NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sewa`
--

INSERT INTO `sewa` (`idsewa`, `penyewa_id`, `rumah_id`, `tanggal_sewa`, `harga`) VALUES
(1, 1, 1, '2021-06-01', 366),
(2, 1, 1, '2021-06-02', 366),
(3, 1, 1, '2021-06-03', 366),
(4, 5, 2, '2021-06-21', 400),
(5, 5, 2, '2021-06-22', 400),
(6, 5, 2, '2021-06-23', 400),
(7, 5, 2, '2021-06-24', 400),
(8, 5, 2, '2021-06-25', 400),
(9, 5, 2, '2021-06-26', 400),
(10, 5, 2, '2021-06-27', 400),
(11, 5, 2, '2021-06-28', 400),
(12, 5, 2, '2021-06-29', 400),
(17, 5, 2, '2021-06-30', 400),
(18, 5, 2, '2021-06-20', 400),
(20, 5, 2, '2021-07-02', 400),
(21, 5, 2, '2021-07-03', 400),
(22, 5, 2, '2021-07-04', 400),
(23, 5, 2, '2021-07-05', 400),
(24, 5, 2, '2021-07-06', 400),
(25, 5, 2, '2021-07-08', 400),
(27, 5, 2, '2021-07-09', 400),
(28, 5, 2, '2021-07-10', 400),
(29, 5, 2, '2021-07-11', 400),
(30, 5, 2, '2021-07-01', 400),
(31, 5, 2, '2021-07-07', 400),
(32, 5, 2, '2021-07-12', 400),
(33, 5, 2, '2021-07-14', 400),
(34, 5, 2, '2021-07-13', 400),
(35, 5, 2, '2021-07-16', 400),
(36, 5, 2, '2021-07-15', 400),
(37, 5, 2, '2021-07-19', 400),
(38, 5, 2, '2021-07-20', 400),
(39, 5, 2, '2021-07-17', 400),
(40, 5, 2, '2021-07-18', 400),
(41, 5, 2, '2021-07-21', 400),
(42, 5, 2, '2021-07-22', 400),
(43, 5, 2, '2021-07-31', 400),
(44, 5, 2, '2021-07-29', 400),
(45, 5, 5, '2021-06-21', 354),
(46, 5, 5, '2021-06-23', 354),
(47, 5, 5, '2021-06-22', 354),
(48, 5, 5, '2021-06-24', 354),
(49, 5, 5, '2021-06-25', 354),
(50, 5, 5, '2021-06-26', 354),
(51, 5, 5, '2021-06-27', 354),
(52, 1, 5, '2021-06-28', 354),
(53, 1, 5, '2021-06-29', 354),
(54, 1, 5, '2021-06-30', 354),
(55, 1, 3, '2020-07-21', 234),
(56, 1, 3, '2021-07-21', 234),
(57, 5, 5, '2021-07-01', 354),
(58, 5, 5, '2021-07-02', 354),
(59, 5, 5, '2021-07-03', 354),
(60, 5, 5, '2021-07-04', 354),
(61, 5, 4, '2021-06-22', 254);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `call`
--
ALTER TABLE `call`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_call_penyewa1_idx` (`penyewa_id`);

--
-- Indexes for table `chat history`
--
ALTER TABLE `chat history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chat history_penyewa1_idx` (`penyewa_id`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rumah`
--
ALTER TABLE `rumah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`idsewa`),
  ADD KEY `fk_penyewa_has_rumah_rumah1_idx` (`rumah_id`),
  ADD KEY `fk_penyewa_has_rumah_penyewa_idx` (`penyewa_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `call`
--
ALTER TABLE `call`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat history`
--
ALTER TABLE `chat history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penyewa`
--
ALTER TABLE `penyewa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rumah`
--
ALTER TABLE `rumah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sewa`
--
ALTER TABLE `sewa`
  MODIFY `idsewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `call`
--
ALTER TABLE `call`
  ADD CONSTRAINT `fk_call_penyewa1` FOREIGN KEY (`penyewa_id`) REFERENCES `penyewa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chat history`
--
ALTER TABLE `chat history`
  ADD CONSTRAINT `fk_chat history_penyewa1` FOREIGN KEY (`penyewa_id`) REFERENCES `penyewa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `fk_penyewa_has_rumah_penyewa` FOREIGN KEY (`penyewa_id`) REFERENCES `penyewa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_penyewa_has_rumah_rumah1` FOREIGN KEY (`rumah_id`) REFERENCES `rumah` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
