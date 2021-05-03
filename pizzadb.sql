-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2018 at 03:37 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizzadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'user',
  `pass` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `age` int(100) NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`first_name`, `last_name`, `id`, `image_name`, `email`, `role`, `pass`, `address`, `age`, `contact_no`, `created_at`, `is_deleted`) VALUES
('ADMIN ', 'USER', 1, NULL, 'admin@gmail.com', 'admin', '123456', '101, Rahul Complex, 14, MG Road, Pune', 22, '1357924680', '2020-10-30 03:17:34', 0),
('Rutuja', 'Khire', 2, '2.jpg', 'rutuja@gmail.com', 'user', '12345', '101, Rahul Complex, 14, MG Road, Pune', 20, '2468013579', '2020-11-09 15:00:27', 0),
('Abhishek', 'Lalwani', 3, '3.jpg', 'abhi@gmail.com', 'user', '12345', '2, Swanand Bunglow , SB Road, Pune', 21, '2468013579', '2020-11-09 08:15:05', 0),
('Ashmit', 'Khobragade', 4, '4.jpg', 'ash@gmail.com', 'user', '12345', '505, Aarya Apartments, JM Road, Pune', 21, '2468013579', '2020-11-09 08:18:08', 0);

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(1000) NOT NULL,
  `image_name` varchar(1000) NOT NULL,
  `product_price` float NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'In Stock',
  `unit` int(100) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `is_deleted` int(1) NOT NULL DEFAULT '0',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `image_name`, `product_price`, `status`, `unit`, `description`, `is_deleted`) VALUES
(11, 'Chicken Pizza', '11.jpg', 450, 'In Stock', 25, 'An Italian favorite, this chicken pizza is a delicious mix of flat bread or base topped with cheese, chillies, onion, garlic sauce and chunks of chicken. Tossed to perfection, it is the solution to all those chicken and cheese cravings.', 0),
(12, 'Corn Pizza', '12.jpg', 400, 'In Stock', 25, 'Prepared using spicy sauce, corn, mozzarella, parmesan, and cheddar cheese, this one is a pizza lover’s dream come true.', 0),
(13, 'Pepperoni Pizza', '13.jpg', 450, 'In Stock', 25, 'Pepperoni pizza has an American variety of salami, made from cured pork and beef seasoned with paprika or other chili pepper. It is characteristically soft, slightly smoky, and bright red in color.', 0),
(14, 'Veggie Delight', '14.jpg', 400, 'In Stock', 25, 'Bursting with rich aroma of herbs & spices and flavours, this pizza is made with the combination of delicious vegetables like broccoli, onion, capsicum, carrot, mushroom and cauliflower along with tomatoes, pizza sauce, and goat cheese.', 0),
(15, 'Paneer Pizza', '15.jpg', 400, 'In Stock', 25, 'Delicious paneer with crisp capsicum and spicy red pepper - quite a mouthful!', 0),
(16, 'Margherita', '16.jpg', 350, 'In Stock', 25, 'The hugely popular margherita, with a tasty-tangy single cheese topping', 0),
(17, 'Garlic Bread', '17.jpg', 125, 'In Stock', 25, 'The endearing tang of garlic in breadstics baked to perfection.', 0),
(18, 'Choco Lava Cake', '18.jpg', 125, 'In Stock', 25, 'Filled with delecious molten chocolate inside.', 0),
(19, 'Coca Cola', '19.jpg', 25, 'In Stock', 25, '--', 0),
(20, 'Nachos', '20.jpg', 50, 'In Stock', 25, 'A regional dish from northern Mexico that consists of heated tortilla chips or totopos covered with melted cheese (or a cheese-based sauce), often served as a snack or appetize', 0);

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shipping_address` varchar(100) NOT NULL,
  `first_name` varchar(100) DEFAULT '',
  `last_name` varchar(100) DEFAULT '',
  `total_price` float NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `approved` tinyint(100) NOT NULL DEFAULT '0',
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `receive_status` tinyint(4) NOT NULL DEFAULT '0',

  PRIMARY KEY(`id`),
  FOREIGN KEY(`user_id`) REFERENCES users(`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `date`, `shipping_address`, `first_name`, `last_name`, `total_price`, `status`, `approved`, `paid`, `receive_status`) VALUES
 (1, 2, '2020-11-04 02:21:11', '101, Rahul Complex, 14, MG Road, Pune', 'Rutuja', 'Khire', 600, 'close', 0, 1, 1),
 (2, 2, '2020-11-20 02:35:49', '101, Rahul Complex, 14, MG Road, Pune', 'Rutuja', 'Khire', 775, 'close', 0, 1, 0),
 (3, 2, '2021-11-27 02:50:47', '101, Rahul Complex, 14, MG Road, Pune', 'Rutuja', 'Khire', 550, 'close', 0, 1, 0),
 (4, 2, '2020-12-04 02:50:55', '101, Rahul Complex, 14, MG Road, Pune', 'Rutuja', 'Khire', 400, 'close', 0, 1, 0),
 (5, 2, '2020-12-06 04:23:21', '101, Rahul Complex, 14, MG Road, Pune', 'Rutuja', 'Khire', 1150, 'close', 0, 1, 0); 

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `srno` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (`srno`),
  FOREIGN KEY (`order_id`)
    REFERENCES orders(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`srno`, `order_id`, `price`, `date`) VALUES
(100, 1, 600, '2020-11-04 02:21:11'),
(101, 2, 775, '2020-11-20 02:35:49'),
(102, 3, 550, '2021-11-27 02:50:47'),
(103, 4, 400, '2020-12-04 02:50:55'),
(104, 4, 1150, '2020-12-06 04:23:21');


-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders` AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
