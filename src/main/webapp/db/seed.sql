-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2025 at 05:18 PM
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
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`) VALUES
(2, 11),
(1, 12);

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `status`) VALUES
(1, 12, '2025-05-19 20:54:59.000000', 'Pending'),
(2, 11, '2025-05-19 20:59:10.000000', 'Pending');

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `order_id`, `product_id`, `quantity_ordered`, `price_each`) VALUES
(1, 1, 1, 1, 2000),
(2, 1, 2, 1, 1850),
(3, 1, 3, 1, 750),
(4, 2, 2, 2, 1850);

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `stock_quantity`, `price`, `imagepath`) VALUES
(1, 'Anua Heartleaf 77% Cleanser Foam', 'Formulated with 77% heartleaf extract, this gentle foam cleanses impurities while soothing redness and inflammation, leaving skin balanced and comfortable.', 50, 2000, '/img/Anua Cleanser.png'),
(2, 'COSRX Low pH Gel Cleanser', 'Maintains skin\'s ideal pH while effectively removing excess oil and impurities; enriched with tea tree and natural surfactants for gentle care.', 85, 1850, '/img/CosrX Cleanser.png'),
(3, 'Dot & Key Vitamin C+E Cleanser', 'Brightens complexion and gently exfoliates with Vitamin C and E, while cleansing out dirt to reveal refreshed, glowing skin.', 100, 750, '/img/Dot&Key Cleanser.png'),
(4, 'Kleida Moisturizer', 'Hydrating and lightweight daily moisturizer for all skin types.', 65, 1100, '/img/Kleida Moisturizer.png'),
(5, 'CeraVe Moisturizing Lotion', 'Dermatologist-developed lotion with ceramides and hyaluronic acid.', 150, 1900, '/img/CeraVe Moisturizer.png'),
(6, 'Aqualogica Moisturizer', 'Water-based moisturizer providing deep hydration and glow.', 70, 650, '/img/Aqualogica Moisturizer.png'),
(7, 'Plum Vitamin C Serum', 'Antioxidant-rich serum to boost glow and reduce pigmentation.', 90, 1200, '/img/Plum Serum.png'),
(8, 'Minimalist Salicylic Serum', '2% salicylic acid serum for acne and blackhead control.', 95, 890, '/img/Minimalist Serum.png'),
(9, 'DermaCo 2% Kojic Acid Face Serum', 'Skin brightening serum for dark spots and hyperpigmentation.', 80, 700, '/img/DermaCo Serum.png'),
(10, 'Fix Derma Shadow SPF 50+ Cream', 'High-protection sunscreen suitable for sensitive skin.', 75, 980, '/img/Shadow Sunscreen.png'),
(11, 'Dot&Key Blueberry SPF 50+ Sunscreen', 'Broad-spectrum sunscreen with antioxidant-rich blueberry.', 100, 740, '/img/Dot&Key Sunscreen.png'),
(12, 'Raystop SPF 50+++ Sunscreen Lotion', 'Lightweight SPF lotion with UVA/UVB protection.', 110, 1300, '/img/Raystop Sunscreen.png');

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `phone`, `address`, `role`, `registered`) VALUES
(11, 'Anweshahaha', 'SPiWPTantNEmZNcpcL1P/g==', 'anu@gmail.com', 123456789, 'Pokhara', 'Customer', '2025-04-20 17:50:00.000000'),
(12, 'Mandip', 'ZZu7jXomjmOq41fJQc6GpQ==', 'mandip@gmail.com', 9898989898, 'Pokhara', 'Customer', '2025-04-20 18:59:00.000000'),
(14, 'Sampada', 'bnY1FS4QpCiZAIAd+DIetw==', 'sampada@gmail.com', 1111111111, 'Pokhara', 'Admin', '2025-04-19 19:02:00.000000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
