-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2025 at 05:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

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
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `stock_quantity`, `price`) VALUES
(1, 'Anua Heartleaf 77% Cleansing Foam', 'Formulated with 77% heartleaf extract, this gentle foam cleanses impurities while soothing redness and inflammation, leaving skin balanced and comfortable.', 50, 2000),
(2, 'COSRX Low pH Gel Cleanser', 'Maintains skin\'s ideal pH while effectively removing excess oil and impurities; enriched with tea tree and natural surfactants for gentle care.', 85, 1850),
(3, 'Dot & Key Vitamin C+E Gel Wash', 'Brightens complexion and gently exfoliates with Vitamin C and E, while cleansing out dirt to reveal refreshed, glowing skin.', 100, 750),
(4, 'Kleida Moisturizer', 'Hydrating and lightweight daily moisturizer for all skin types.', 65, 1100),
(5, 'CeraVe Moisturizing Lotion', 'Dermatologist-developed lotion with ceramides and hyaluronic acid.', 150, 1900),
(6, 'Aqualogica Moisturizer', 'Water-based moisturizer providing deep hydration and glow.', 70, 650),
(7, 'Plum Vitamin C Serum', 'Antioxidant-rich serum to boost glow and reduce pigmentation.', 90, 1200),
(8, 'Minimalist Salicylic Serum', '2% salicylic acid serum for acne and blackhead control.', 95, 890),
(9, 'DermaCo 2% Kojic Acid Face Serum', 'Skin brightening serum for dark spots and hyperpigmentation.', 80, 700),
(10, 'Fix Derma Shadow SPF 50+ Cream', 'High-protection sunscreen suitable for sensitive skin.', 75, 980),
(11, 'Dot&Key Blueberry SPF 50+ Sunscreen', 'Broad-spectrum sunscreen with antioxidant-rich blueberry.', 100, 740),
(12, 'Raystop SPF 50+++ Sunscreen Lotion', 'Lightweight SPF lotion with UVA/UVB protection.', 110, 1300);

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `phone`, `address`, `role`, `registered`) VALUES
(1, 'sampada', 'pMmvBVsRdnrvjpEeYUzxRA==', 'sampada@gmail.com', '99999', 'pokhara', 'Customer', '2025-04-29 17:59:00.000000'),
(2, 'pamy', 'FhJeOB7s3ixyrWezETHw4w==', 'pamy@gmail.com', '111', 'ktmm', 'Admin', '2025-04-29 14:26:00.000000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
