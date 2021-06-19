-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2021 at 07:20 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

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
  `penyewa_username` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat history`
--

CREATE TABLE `chat history` (
  `id` int(11) NOT NULL,
  `content` varchar(45) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `penyewa_username` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `nomor telepon` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`username`, `password`, `nama`, `nomor telepon`) VALUES
('jerriel', 'jerriel', 'jerriel rhemaldy', '12345'),
('kenneth', 'kenneth', 'kenneth manuel', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `rumah`
--

CREATE TABLE `rumah` (
  `id` int(11) NOT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `deskripsi` varchar(45) DEFAULT NULL,
  `harga` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sewa`
--

CREATE TABLE `sewa` (
  `penyewa_id` int(11) NOT NULL,
  `rumah_id` int(11) NOT NULL,
  `harga` double DEFAULT NULL,
  `awal sewa` datetime DEFAULT NULL,
  `akhir sewa` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `call`
--
ALTER TABLE `call`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_call_penyewa1_idx` (`penyewa_username`);

--
-- Indexes for table `chat history`
--
ALTER TABLE `chat history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chat history_penyewa1_idx` (`penyewa_username`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `rumah`
--
ALTER TABLE `rumah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`penyewa_id`,`rumah_id`),
  ADD KEY `fk_penyewa_has_rumah_rumah1_idx` (`rumah_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `call`
--
ALTER TABLE `call`
  ADD CONSTRAINT `fk_call_penyewa1` FOREIGN KEY (`penyewa_username`) REFERENCES `penyewa` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chat history`
--
ALTER TABLE `chat history`
  ADD CONSTRAINT `fk_chat history_penyewa1` FOREIGN KEY (`penyewa_username`) REFERENCES `penyewa` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `fk_penyewa_has_rumah_rumah1` FOREIGN KEY (`rumah_id`) REFERENCES `rumah` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
