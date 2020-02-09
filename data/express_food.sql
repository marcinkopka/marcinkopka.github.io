-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2018 at 01:49 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `express_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `address_street_number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_street_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `address_street_number`, `address_street_name`, `address_zip_code`, `address_city`) VALUES
(1, '1', 'Cobden Terrace', 'LS12 5LE', 'Leeds'),
(2, '18', 'Albion Street', 'LS11 4EA', 'Leeds'),
(3, '5', 'Branch Street', 'LS2 8LA', 'Leeds'),
(4, '8', 'Cow Close', 'LS11 8ZA', 'Leeds'),
(5, '20', 'Wood Street', 'LS5 1XW', 'Leeds');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `client_first_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_last_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `client_first_name`, `client_last_name`) VALUES
(1, 'Tom', 'Hanks'),
(2, 'John', 'Berenger'),
(3, 'Lucy', 'Liu'),
(4, 'Christian', 'Bale'),
(5, 'Matt', 'Damon');

-- --------------------------------------------------------

--
-- Table structure for table `clients_addresses`
--

CREATE TABLE `clients_addresses` (
  `client_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients_addresses`
--

INSERT INTO `clients_addresses` (`client_id`, `address_id`) VALUES
(1, 1),
(2, 2),
(3, 5),
(4, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `clients_orders`
--

CREATE TABLE `clients_orders` (
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `delivery_person_id` int(11) DEFAULT NULL,
  `order_status` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrival_estimated_time` time NOT NULL,
  `delivery_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients_orders`
--

INSERT INTO `clients_orders` (`client_id`, `order_id`, `delivery_person_id`, `order_status`, `arrival_estimated_time`, `delivery_address`) VALUES
(1, 1, 3, 'delivered', '00:00:00', '1 Cobden Terrace LS12 5LE Leeds'),
(2, 4, 1, 'delivered', '00:00:00', '18 Albion Street LS11 4EA Leeds'),
(3, 2, 5, 'delivered', '00:00:00', '20 Wood Street LS5 1XW Leeds'),
(5, 3, 4, 'delivered', '00:00:00', '8 Cow Close LS11 8ZA Leeds');

-- --------------------------------------------------------

--
-- Table structure for table `daily_menus`
--

CREATE TABLE `daily_menus` (
  `daily_menu_id` int(11) NOT NULL,
  `daily_menu_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_menus`
--

INSERT INTO `daily_menus` (`daily_menu_id`, `daily_menu_date`) VALUES
(1, '2018-06-24'),
(2, '2018-06-26');

-- --------------------------------------------------------

--
-- Table structure for table `daily_menus_menu_items`
--

CREATE TABLE `daily_menus_menu_items` (
  `daily_menu_id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_menus_menu_items`
--

INSERT INTO `daily_menus_menu_items` (`daily_menu_id`, `menu_item_id`) VALUES
(1, 1),
(1, 2),
(1, 11),
(1, 12),
(2, 3),
(2, 4),
(2, 13),
(2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_persons`
--

CREATE TABLE `delivery_persons` (
  `delivery_person_id` int(11) NOT NULL,
  `delivery_person_first_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_person_last_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_person_latitude` decimal(10,8) DEFAULT NULL,
  `delivery_person_longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_persons`
--

INSERT INTO `delivery_persons` (`delivery_person_id`, `delivery_person_first_name`, `delivery_person_last_name`, `delivery_person_latitude`, `delivery_person_longitude`) VALUES
(1, 'John', 'Statham', '35.61202900', '44.51796900'),
(2, 'Thomas', 'Cook', '32.99880900', '51.19765600'),
(3, 'Jason', 'Donovan', '24.05579800', '48.03359400'),
(4, 'Mark', 'Wahlberg', '15.80208900', '45.92421900'),
(5, 'Diana', 'Ross', '33.29316400', '47.68203100');

-- --------------------------------------------------------

--
-- Stand-in structure for view `list of clients`
-- (See below for the actual view)
--
CREATE TABLE `list of clients` (
`client_id` int(11)
,`client_first_name` varchar(30)
,`client_last_name` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list of delivery people`
-- (See below for the actual view)
--
CREATE TABLE `list of delivery people` (
`delivery_person_id` int(11)
,`delivery_person_first_name` varchar(30)
,`delivery_person_last_name` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `list of the different daily menu items`
-- (See below for the actual view)
--
CREATE TABLE `list of the different daily menu items` (
`menu_item_id` int(11)
,`menu_item_name` varchar(50)
,`menu_item_description` varchar(100)
,`menu_item_type_description` varchar(9)
,`menu_item_price` float(5,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `menu_item_id` int(11) NOT NULL,
  `menu_item_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_item_description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_item_type_id` int(11) DEFAULT NULL,
  `menu_item_price` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`menu_item_id`, `menu_item_name`, `menu_item_description`, `menu_item_type_id`, `menu_item_price`) VALUES
(1, 'Amritsari Fish', 'Fried fish made with curry, ginger and garlic', 1, 7.25),
(2, 'Chicken Tikka', 'Chicken with spices served on a skewer', 1, 8.15),
(3, 'Dum Aloo', 'Potatoes cooked in curry', 1, 5.12),
(4, 'Kadai Paneer', 'Paneer and green peppers in tomato gravy', 1, 9.18),
(5, 'Tandoori Fish Tikka', 'Fish marinated in lime and ginger', 1, 6.78),
(6, 'Nandu Omelette', 'Omelette with pieces of crab and spices', 1, 5.00),
(7, 'Chettinadu Chicken', 'Dish made chicken and spices', 1, 6.56),
(8, 'Dahi Vada', 'Fried lentil balls in a yogurt sauce', 1, 8.03),
(9, 'Dalithoy', 'Soup made with split yellow lentils', 1, 7.00),
(10, 'Vindaloo', 'Pork, goan red chilli paste', 1, 5.50),
(11, 'Surnoli', 'Pancakes that have holes are yellow and puffy', 2, 6.17),
(12, 'Agra Petha', 'Firm white pumpkin, sugar, kitchen lime', 2, 8.00),
(13, 'Gajar Ka Halwa', 'Carrots, milk, sugar, ghee, cashews and raisins', 2, 6.25),
(14, 'Imarti', 'Sugar syrup, lentil flour', 2, 7.15),
(15, 'Kalakand', 'Milk, cottage cheese', 2, 6.55),
(16, 'Kheer', 'A rice pudding made with milk, rice and fruits', 2, 4.00),
(17, 'Lassi	', 'Yogurt, milk and nuts', 2, 5.80),
(18, 'Ras Malai', 'Chhena, reduced milk and pistachio', 2, 7.05),
(19, 'Mihidana', 'Besan flour, sugar and ghee', 2, 8.30),
(20, 'Ariselu', 'Rice flour, jaggery and ghee', 2, 6.30);

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_types`
--

CREATE TABLE `menu_item_types` (
  `menu_item_type_id` int(11) NOT NULL,
  `menu_item_type_description` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item_types`
--

INSERT INTO `menu_item_types` (`menu_item_type_id`, `menu_item_type_description`) VALUES
(1, 'main dish'),
(2, 'dessert');

-- --------------------------------------------------------

--
-- Stand-in structure for view `order history for each client`
-- (See below for the actual view)
--
CREATE TABLE `order history for each client` (
`client_id` int(11)
,`client_first_name` varchar(30)
,`client_last_name` varchar(30)
,`order_id` int(11)
,`order_date_and_time` datetime
,`menu_item_name` varchar(50)
,`menu_item_quantity` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date_and_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date_and_time`) VALUES
(1, '2018-06-24 14:54:37'),
(2, '2018-06-24 15:41:43'),
(3, '2018-06-24 15:51:19'),
(4, '2018-06-26 14:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `orders_menu_items`
--

CREATE TABLE `orders_menu_items` (
  `order_id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `menu_item_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_menu_items`
--

INSERT INTO `orders_menu_items` (`order_id`, `menu_item_id`, `menu_item_quantity`) VALUES
(1, 2, 1),
(1, 11, 2),
(2, 1, 2),
(2, 2, 1),
(2, 12, 1),
(3, 11, 1),
(3, 12, 1),
(4, 4, 3);

-- --------------------------------------------------------

--
-- Structure for view `list of clients`
--
DROP TABLE IF EXISTS `list of clients`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list of clients`  AS  select `clients`.`client_id` AS `client_id`,`clients`.`client_first_name` AS `client_first_name`,`clients`.`client_last_name` AS `client_last_name` from `clients` ;

-- --------------------------------------------------------

--
-- Structure for view `list of delivery people`
--
DROP TABLE IF EXISTS `list of delivery people`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list of delivery people`  AS  select `delivery_persons`.`delivery_person_id` AS `delivery_person_id`,`delivery_persons`.`delivery_person_first_name` AS `delivery_person_first_name`,`delivery_persons`.`delivery_person_last_name` AS `delivery_person_last_name` from `delivery_persons` ;

-- --------------------------------------------------------

--
-- Structure for view `list of the different daily menu items`
--
DROP TABLE IF EXISTS `list of the different daily menu items`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list of the different daily menu items`  AS  select `menu_items`.`menu_item_id` AS `menu_item_id`,`menu_items`.`menu_item_name` AS `menu_item_name`,`menu_items`.`menu_item_description` AS `menu_item_description`,`menu_item_types`.`menu_item_type_description` AS `menu_item_type_description`,`menu_items`.`menu_item_price` AS `menu_item_price` from (`menu_items` join `menu_item_types` on((`menu_items`.`menu_item_type_id` = `menu_item_types`.`menu_item_type_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `order history for each client`
--
DROP TABLE IF EXISTS `order history for each client`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order history for each client`  AS  select `clients`.`client_id` AS `client_id`,`clients`.`client_first_name` AS `client_first_name`,`clients`.`client_last_name` AS `client_last_name`,`orders`.`order_id` AS `order_id`,`orders`.`order_date_and_time` AS `order_date_and_time`,`menu_items`.`menu_item_name` AS `menu_item_name`,`orders_menu_items`.`menu_item_quantity` AS `menu_item_quantity` from ((((`clients` join `clients_orders` on((`clients`.`client_id` = `clients_orders`.`client_id`))) join `orders` on((`orders`.`order_id` = `clients_orders`.`order_id`))) join `orders_menu_items` on((`orders`.`order_id` = `orders_menu_items`.`order_id`))) join `menu_items` on((`orders_menu_items`.`menu_item_id` = `menu_items`.`menu_item_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_addresses`
--
ALTER TABLE `clients_addresses`
  ADD PRIMARY KEY (`client_id`,`address_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `clients_orders`
--
ALTER TABLE `clients_orders`
  ADD PRIMARY KEY (`client_id`,`order_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `delivery_person_id` (`delivery_person_id`);

--
-- Indexes for table `daily_menus`
--
ALTER TABLE `daily_menus`
  ADD PRIMARY KEY (`daily_menu_id`);

--
-- Indexes for table `daily_menus_menu_items`
--
ALTER TABLE `daily_menus_menu_items`
  ADD PRIMARY KEY (`daily_menu_id`,`menu_item_id`),
  ADD KEY `menu_item_id` (`menu_item_id`);

--
-- Indexes for table `delivery_persons`
--
ALTER TABLE `delivery_persons`
  ADD PRIMARY KEY (`delivery_person_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`menu_item_id`),
  ADD KEY `menu_item_type_id` (`menu_item_type_id`);

--
-- Indexes for table `menu_item_types`
--
ALTER TABLE `menu_item_types`
  ADD PRIMARY KEY (`menu_item_type_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_menu_items`
--
ALTER TABLE `orders_menu_items`
  ADD PRIMARY KEY (`order_id`,`menu_item_id`),
  ADD KEY `menu_item_id` (`menu_item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `daily_menus`
--
ALTER TABLE `daily_menus`
  MODIFY `daily_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_persons`
--
ALTER TABLE `delivery_persons`
  MODIFY `delivery_person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `menu_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `menu_item_types`
--
ALTER TABLE `menu_item_types`
  MODIFY `menu_item_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients_addresses`
--
ALTER TABLE `clients_addresses`
  ADD CONSTRAINT `clients_addresses_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clients_addresses_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `clients_orders`
--
ALTER TABLE `clients_orders`
  ADD CONSTRAINT `clients_orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  ADD CONSTRAINT `clients_orders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `clients_orders_ibfk_3` FOREIGN KEY (`delivery_person_id`) REFERENCES `delivery_persons` (`delivery_person_id`);

--
-- Constraints for table `daily_menus_menu_items`
--
ALTER TABLE `daily_menus_menu_items`
  ADD CONSTRAINT `daily_menus_menu_items_ibfk_1` FOREIGN KEY (`daily_menu_id`) REFERENCES `daily_menus` (`daily_menu_id`),
  ADD CONSTRAINT `daily_menus_menu_items_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`menu_item_id`);

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`menu_item_type_id`) REFERENCES `menu_item_types` (`menu_item_type_id`);

--
-- Constraints for table `orders_menu_items`
--
ALTER TABLE `orders_menu_items`
  ADD CONSTRAINT `orders_menu_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orders_menu_items_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`menu_item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
