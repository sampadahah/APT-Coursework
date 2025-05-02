-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2025 at 03:20 PM
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
-- Database: `apt_coursework`
--

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `phone`, `address`, `role`, `registered`) VALUES
(11, 'Anweshahaha', 'SPiWPTantNEmZNcpcL1P/g==', 'anu@gmail.com', 980, 'Pokhara', 'Customer', '2025-04-20 17:50:00.000000'),
(12, 'Mandip', 'ZZu7jXomjmOq41fJQc6GpQ==', 'mandip@gmail.com', 985757, 'Pokhara', 'Customer', '2025-04-20 18:59:00.000000'),
(14, 'Sampada', 'bnY1FS4QpCiZAIAd+DIetw==', 'sampada@gmail.com', 984620, 'Pokhara', 'Admin', '2025-04-19 19:02:00.000000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
