-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2024 at 02:31 PM
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
-- Database: `fashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `COMMENT_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) DEFAULT NULL,
  `COMMENTS` text NOT NULL,
  `SENDER_TYPE` enum('ADMIN','CUSTOMER','STAFF') NOT NULL,
  `READ1` tinyint(1) NOT NULL,
  `CREATED_AT` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(1, 'sul', 'sul@gmail.com', 'color chnge', 'i need my dress to be changed to orange and green', '2024-09-20 04:51:49');

-- --------------------------------------------------------

--
-- Table structure for table `customizations`
--

CREATE TABLE `customizations` (
  `OPTION_ID` int(11) NOT NULL,
  `DRESS_ID` int(11) NOT NULL,
  `FABRIC_ID` int(11) NOT NULL,
  `COLOR` char(7) DEFAULT NULL,
  `EMBELLISHMENTS` enum('EMBROIDERY','APPLIQUÉ','SEQUIN','BEADS','LACE','FRINGE','PEARL','PIPING','RHINESTONE') DEFAULT NULL,
  `SIZES` enum('XS','S','M','L','XL','XXL') DEFAULT NULL,
  `DRESS_LENGTH` enum('MINI','KNEE-LENGTH','TEA-LENGTH','MIDI','MAXI','FULL-LENGTH') DEFAULT NULL,
  `SLEEVE_LENGTH` enum('SLEEVELESS','SHORT','ELBOW','3/4','FULL') DEFAULT NULL,
  `ADDITIONAL_NOTES` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dress`
--

CREATE TABLE `dress` (
  `DRESS_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `FABRIC` varchar(50) NOT NULL,
  `COLOR` varchar(100) NOT NULL,
  `SIZES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `BASE_PRICE` decimal(10,2) NOT NULL,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dress`
--

INSERT INTO `dress` (`DRESS_ID`, `NAME`, `DESCRIPTION`, `FABRIC`, `COLOR`, `SIZES`, `BASE_PRICE`, `IMAGE_URL`, `CREATED_AT`) VALUES
(1, 'Elegant Evening Dress', 'This strapless champagne satin ball gown \r\nsophisticated look perfect for formal occasions.', 'Satin', 'Champagne', 'XS,S,M,L,XL,XXL', 2000.00, '..\\dress\\elegnt evening dress.jpg', '2024-09-15 08:50:00'),
(2, 'casual summer dress', ' Geometric Printed Maxi Dress', 'Chiffon', 'Maroon,White', 'XS,S,M,L,XL,XXL', 1500.00, '..\\dress\\casual summer dress.jpg', '2024-09-15 09:29:26'),
(3, 'Bridesmaid Dress', 'Make your bridal party stand out with these stunning bridesmaid dresses.', 'Chiffon', 'Blush Pink ', 'XS,S,M,L,XL,XXL', 1200.00, '..\\dress\\bridesmaid dress1.jpg', '2024-09-15 11:20:34'),
(4, 'Cocktail Dress', 'Great option for weddings, cocktail parties, or any occasion requiring a polished, sophisticated look.', 'Combination of tulle and satin', 'Soft lavender or lilac', 'XS,S,M,L,XL,XXL', 2500.00, '..\\dress\\cocktail dress.jpg', '2024-09-15 11:20:34'),
(5, 'Bohemian Maxi Dress', 'Perfect outfit for a summer event, beach vacation, or any occasion where a relaxed, stylish look is desired.', 'Chiffon', 'Green , Teal', 'XS,S,M,L,XL,XXL', 1400.00, '..\\dress\\bohemian maxi dress.jpg', '2024-09-15 11:26:11'),
(6, 'Saree', 'Ideal for festive events, traditional gatherings, or any occasion where a bright, standout ensemble is desired.', 'Georgette ', 'Mustard yellow', 'XS,S,M,L,XL,XXL', 2100.00, '..\\dress\\saree1.jpg', '2024-09-15 11:26:11'),
(7, 'Vintage Lace Dress', NULL, '', '', '', 2199.00, '..\\dress\\vintage lace dress.jpg', '2024-09-15 11:36:00'),
(8, 'salwar suit', NULL, '', '', '', 900.00, '..\\dress\\salwar suit1.jpg', '2024-09-15 11:36:00'),
(9, 'Modern A-Line Dress', NULL, '', '', '', 1400.00, '..\\dress\\modern a line dress.jpg', '2024-09-15 11:41:54'),
(10, 'Qipao', NULL, '', '', '', 2299.00, '..\\dress\\qipao1.png', '2024-09-15 11:41:54'),
(11, 'Embroidered Midi Dress', 'Exude elegance in this beautifully crafted navy blue midi dress, featuring intricate floral embroidery across the bodice.', 'Georgette ', 'Navy Blue ', 'XS,S,M,L,XL,XXL', 2100.00, '..\\dress\\Embroidered-Midi-Dress1.jpg', '2024-09-15 11:43:50'),
(12, 'Pleated Skater Dress', NULL, '', '', '', 1200.00, '..\\dress\\pleated skater dress.jpg', '2024-09-15 11:43:50');

-- --------------------------------------------------------

--
-- Table structure for table `fabrics`
--

CREATE TABLE `fabrics` (
  `FABRIC_ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `PRICE_PER_UNIT` decimal(10,2) NOT NULL,
  `AVAILABLE_QUANTITY` decimal(10,2) NOT NULL,
  `CREATED_AT` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fabrics`
--

INSERT INTO `fabrics` (`FABRIC_ID`, `NAME`, `IMAGE_URL`, `DESCRIPTION`, `PRICE_PER_UNIT`, `AVAILABLE_QUANTITY`, `CREATED_AT`) VALUES
(1, 'Lace', '..\\fabric\\lace.jpeg', 'Delicate and romantic, perfect for bridal and special occasions.', 500.00, 5.00, '2024-09-18 15:24:26'),
(2, 'Silk', '..\\fabric\\silk.jpg', 'Luxurious and elegant, perfect for evening wear.', 700.00, 15.00, '2024-09-19 07:49:27'),
(3, 'Cotton', '..\\fabric\\cotton1.jpg', 'Comfortable and breathable, ideal for casual dresses.', 300.00, 30.00, '2024-09-19 07:51:47'),
(4, 'Modal Silk', '..\\fabric\\modal silk.jpg', 'Exceptionally soft and durable, ideal for casual dresses.', 900.00, 20.00, '2024-09-19 07:51:47'),
(5, 'Chiffon', '..\\fabric\\chiffon1.jpg', 'Lightweight and sheer, perfect for airy and flowy dresses.', 350.00, 15.00, '2024-09-19 07:54:32'),
(6, 'Tweed', '..\\fabric\\tweed.webp', 'Warm and textured, perfect for stylish and cozy outfits.', 1200.00, 9.00, '2024-09-19 07:54:32'),
(7, 'Velvet', '..\\fabric\\velvet1.jpg', 'Soft and plush, ideal for luxurious evening gowns.', 500.00, 12.00, '2024-09-19 07:57:41'),
(8, 'Denim', '..\\fabric\\denim.jpg', 'Durable and stylish, ideal for casual and trendy outfits.', 500.00, 10.00, '2024-09-19 07:57:41'),
(9, 'Satin', '..\\fabric\\satin2.jpg', 'Smooth and glossy, ideal for elegant evening dresses.', 800.00, 13.00, '2024-09-19 07:59:54'),
(10, 'Linen', '..\\fabric\\linen2.webp', 'Breathable and lightweight, perfect for summer dresses.', 600.00, 14.00, '2024-09-19 07:59:54'),
(11, 'Tulle', '..\\fabric\\tulle.webp', 'Delicate and airy, perfect for adding volume to dresses.', 660.00, 11.00, '2024-09-19 08:02:13'),
(12, 'Crepe', '..\\fabric\\crepe.jpg', 'Elegant and textured, ideal for sophisticated dresses.', 400.00, 19.00, '2024-09-19 08:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `fabric_purchase`
--

CREATE TABLE `fabric_purchase` (
  `PURCHASE_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `FABRIC_ID` int(11) DEFAULT NULL,
  `QUANTITY` decimal(10,2) NOT NULL,
  `TOTAL_PRICE` decimal(10,2) NOT NULL,
  `CREATED_AT` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `measurements`
--

CREATE TABLE `measurements` (
  `MEASUREMENT_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `DRESS_ID` int(11) DEFAULT NULL,
  `MEASUREMENT_DETAILS` text NOT NULL,
  `SHOULDER` decimal(10,2) DEFAULT NULL,
  `BUST` decimal(10,2) DEFAULT NULL,
  `WAIST` decimal(10,2) DEFAULT NULL,
  `HIP` decimal(10,2) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ORDER_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `DRESS_ID` int(11) DEFAULT NULL,
  `STATUSES` enum('PENDING','IN-PROGRESS','COMPLETED','SHIPPED','DELIVERED','CANCELLED') NOT NULL,
  `SSIZE` varchar(100) NOT NULL,
  `TOTAL_PRICE` decimal(10,2) NOT NULL,
  `ESTIMATED_DELIVERY_DATE` date DEFAULT NULL,
  `ACTUAL_DELIVERY_DATE` date DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ORDER_ID`, `USER_ID`, `DRESS_ID`, `STATUSES`, `SSIZE`, `TOTAL_PRICE`, `ESTIMATED_DELIVERY_DATE`, `ACTUAL_DELIVERY_DATE`, `CREATED_AT`) VALUES
(21, 2, 2, 'PENDING', 'l', 1500.00, '2024-09-30', '2024-10-05', '2024-09-21 12:10:20'),
(28, 2, 2, 'PENDING', 'xs', 1500.00, '2024-09-30', '2024-10-05', '2024-09-21 13:25:41'),
(29, 1, 3, 'PENDING', 'xs', 1200.00, '2024-09-30', '2024-10-05', '2024-09-21 13:32:11'),
(30, 2, 5, 'PENDING', 'xs', 1400.00, '2024-09-30', '2024-10-05', '2024-09-21 13:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORDD` varchar(255) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `PHONE` varchar(15) NOT NULL,
  `USER_TYPE` enum('ADMIN','CUSTOMER','STAFF') NOT NULL,
  `ADDRESSS` text DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `USERNAME`, `PASSWORDD`, `EMAIL`, `PHONE`, `USER_TYPE`, `ADDRESSS`, `CREATED_AT`) VALUES
(1, 'Sulu', 'sulu', 'sulu@gmail.com', '', 'CUSTOMER', NULL, '2024-09-12 19:44:26'),
(2, 'sul', 'sul', 'sul@gmail.com', '76543232', 'CUSTOMER', '', '2024-09-14 11:33:00'),
(4, 'sulfath', 'as', 'sulfth@gmail.com', '9876543', 'CUSTOMER', '', '2024-09-14 11:35:19'),
(6, 'ann', 'aa', 'ann@gmail.com', '763453256', 'CUSTOMER', '', '2024-09-14 11:58:57'),
(7, 'sulh', 'ee', 'sult@gmail.com', '99999888888', 'CUSTOMER', '', '2024-09-14 16:44:56'),
(8, 'sulfa', 'ww', 'sulfa@gmail.com', '8765445665', 'CUSTOMER', '', '2024-09-14 16:47:19'),
(9, 'su', 'eee', 'su@gmail.com', '98789789', 'CUSTOMER', '', '2024-09-14 16:49:41'),
(10, 'sa', 'aaq', 'sa@gmail.com', '989898989', 'CUSTOMER', '', '2024-09-14 16:51:16'),
(13, 'kunj', 'suluu', 'kunj@gmail.com', '7907574463', 'CUSTOMER', 'kunjveettil(h)', '2024-09-21 15:37:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`COMMENT_ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `ORDER_ID` (`ORDER_ID`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customizations`
--
ALTER TABLE `customizations`
  ADD PRIMARY KEY (`OPTION_ID`),
  ADD KEY `DRESS_ID` (`DRESS_ID`),
  ADD KEY `FABRIC_ID` (`FABRIC_ID`);

--
-- Indexes for table `dress`
--
ALTER TABLE `dress`
  ADD PRIMARY KEY (`DRESS_ID`);

--
-- Indexes for table `fabrics`
--
ALTER TABLE `fabrics`
  ADD PRIMARY KEY (`FABRIC_ID`);

--
-- Indexes for table `fabric_purchase`
--
ALTER TABLE `fabric_purchase`
  ADD PRIMARY KEY (`PURCHASE_ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `FABRIC_ID` (`FABRIC_ID`);

--
-- Indexes for table `measurements`
--
ALTER TABLE `measurements`
  ADD PRIMARY KEY (`MEASUREMENT_ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `DRESS_ID` (`DRESS_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `DRESS_ID` (`DRESS_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customizations`
--
ALTER TABLE `customizations`
  MODIFY `OPTION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dress`
--
ALTER TABLE `dress`
  MODIFY `DRESS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fabrics`
--
ALTER TABLE `fabrics`
  MODIFY `FABRIC_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fabric_purchase`
--
ALTER TABLE `fabric_purchase`
  MODIFY `PURCHASE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `MEASUREMENT_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`);

--
-- Constraints for table `customizations`
--
ALTER TABLE `customizations`
  ADD CONSTRAINT `customizations_ibfk_1` FOREIGN KEY (`DRESS_ID`) REFERENCES `dress` (`DRESS_ID`),
  ADD CONSTRAINT `customizations_ibfk_2` FOREIGN KEY (`FABRIC_ID`) REFERENCES `fabrics` (`FABRIC_ID`);

--
-- Constraints for table `fabric_purchase`
--
ALTER TABLE `fabric_purchase`
  ADD CONSTRAINT `fabric_purchase_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `fabric_purchase_ibfk_2` FOREIGN KEY (`FABRIC_ID`) REFERENCES `fabrics` (`FABRIC_ID`);

--
-- Constraints for table `measurements`
--
ALTER TABLE `measurements`
  ADD CONSTRAINT `measurements_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `measurements_ibfk_2` FOREIGN KEY (`DRESS_ID`) REFERENCES `dress` (`DRESS_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`DRESS_ID`) REFERENCES `dress` (`DRESS_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
