-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2025 at 05:41 AM
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
(1, 7),
(2, 10);

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`cart_item_id`, `cart_id`, `product_id`, `quantity_in_cart`) VALUES
(1, 1, 2, 2),
(2, 2, 4, 3);

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `status`) VALUES
(1, 7, '2025-04-10 00:10:16.000000', 'Shipped');

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `stock_quantity`, `price`) VALUES
(1, 'Plum Green Tea Pore Cleansing Face Wash', 'Gentle foaming cleanser for oily and acne-prone skin.', 80, 450),
(2, 'Cetaphil Gentle Skin Cleanser', 'Non-irritating formula for sensitive skin.', 100, 1100),
(3, 'CeraVe Moisturizing Lotion', 'With ceramides and hyaluronic acid, restores protective skin barrier.', 60, 1600),
(4, 'The Derma Co Sunscreen SPF 50 PA++++', 'Broad-spectrum protection, non-greasy formula.', 65, 850),
(5, 'WishCare Vitamin C+ Pure Glow Face Serum', 'Brightens skin and reduces dark spots.', 55, 999),
(6, 'Plum 10% Niacinamide Face Serum', 'Reduces acne marks and improves skin texture.', 50, 890),
(7, 'The Derma Co 2% Salicylic Acid Face Serum', 'Unclogs pores, fights acne & reduces inflammation.', 40, 1050),
(8, 'CeraVe Foaming Facial Cleanser', 'Cleanses and removes excess oil without disrupting the skin barrier.', 70, 1450);

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `phone`, `address`, `role`, `registered`) VALUES
(3, 'Sampada', 'sampada', 'sampada@gmail.com', '9840307455', 'Pokhara', 'Admin', '2025-04-02 23:09:56.000000'),
(4, 'Ankita', 'ankita', 'ankita@gmail.com', '9855067321', 'Kathmandu', 'Customer', '2025-02-04 23:09:56.000000'),
(7, 'Kritika', 'kritika', 'kritika@gmail.com', '9840838286', 'Chitwan', 'Customer', '2025-01-15 23:20:06.000000'),
(8, 'Apekshya', 'hashedpassword123', 'apekshya@gmail.com', '9840537111', 'Lalitpur', 'Customer', '2025-01-24 23:20:06.000000'),
(9, 'Abhi', '456', 'abhi@gmail.com', '9805526421', 'Baglung', 'Admin', '2025-01-01 23:23:41.000000'),
(10, 'Mandip', '789', 'mandip@gmail.com', '9872286421', 'Bhaktapur', 'Customer', '2025-03-21 23:23:41.000000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
