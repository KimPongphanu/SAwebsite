-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 09:03 AM
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
-- Database: `saproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `room_no` int(11) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `created_at` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images2`
--

CREATE TABLE `images2` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `room_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images2`
--

INSERT INTO `images2` (`id`, `filename`, `filepath`, `room_type`) VALUES
(1, 'image-1728572453126.png', 'uploads\\image-1728572453126.png', 1),
(2, 'image-1728572723747.png', 'uploads\\image-1728572723747.png', 1),
(3, 'image-1728572732127.png', 'uploads\\image-1728572732127.png', 1),
(4, 'image-1728573081732.png', 'uploads\\image-1728573081732.png', 2),
(5, 'image-1728575640600.png', 'uploads\\image-1728575640600.png', 1),
(6, 'image-1728575883728.png', 'uploads\\image-1728575883728.png', 1),
(7, 'image-1728589203874.jpg', 'uploads\\image-1728589203874.jpg', 1),
(8, 'image-1728589245968.jpg', 'uploads\\image-1728589245968.jpg', 2),
(9, 'image-1728589266011.jpg', 'uploads\\image-1728589266011.jpg', 3),
(10, 'image-1728622227698.png', 'uploads\\image-1728622227698.png', 1),
(11, 'image-1728622379689.png', 'uploads\\image-1728622379689.png', 2),
(12, 'image-1728622406075.png', 'uploads\\image-1728622406075.png', 1),
(13, 'image-1728623756397.png', 'uploads\\image-1728623756397.png', 1),
(14, 'image-1728623764321.png', 'uploads\\image-1728623764321.png', 2),
(15, 'image-1728623771380.png', 'uploads\\image-1728623771380.png', 3),
(16, 'image-1728631470153.png', 'uploads\\image-1728631470153.png', 1),
(17, 'image-1728631516737.png', 'uploads\\image-1728631516737.png', 1),
(18, 'image-1728632298309.png', 'uploads\\image-1728632298309.png', 2),
(19, 'image-1728633837706.png', 'uploads\\image-1728633837706.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `function` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `user_id`, `type`, `function`, `datetime`) VALUES
(1, 2, 'login', 'Login-Successful', '2024-10-05 01:22:49'),
(5, 1, 'login', 'Login-Successful', '2024-10-05 03:06:15'),
(6, 1, 'login', 'Login-Successful', '2024-10-05 03:06:48'),
(7, 1, 'login', 'Login-Successful', '2024-10-05 03:07:46'),
(8, 1, 'login', 'Login-Successful', '2024-10-05 03:14:58'),
(9, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:01'),
(10, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:05'),
(11, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:05'),
(12, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:06'),
(13, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:17'),
(14, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:17'),
(15, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:17'),
(16, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:17'),
(17, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:18'),
(18, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:18'),
(19, 1, 'C', 'UpdateRoom', '2024-10-05 03:15:18'),
(20, 1, 'login', 'Login-Successful', '2024-10-05 03:19:32'),
(21, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:36'),
(22, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:36'),
(23, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:37'),
(24, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:37'),
(25, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:37'),
(26, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:38'),
(27, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:38'),
(28, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:38'),
(29, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:39'),
(30, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:39'),
(31, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:39'),
(32, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:39'),
(33, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:39'),
(34, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:40'),
(35, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:40'),
(36, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:47'),
(37, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:47'),
(38, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:53'),
(39, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:53'),
(40, 1, 'C', 'UpdateRoom', '2024-10-05 03:19:53'),
(41, 1, 'login', 'Login-Successful', '2024-10-05 03:22:13'),
(42, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:15'),
(43, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:15'),
(44, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:15'),
(45, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:16'),
(46, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:16'),
(47, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:16'),
(48, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:16'),
(49, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:17'),
(50, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:17'),
(51, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:17'),
(52, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:18'),
(53, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:18'),
(54, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:18'),
(55, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:19'),
(56, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:19'),
(57, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:19'),
(58, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:20'),
(59, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:20'),
(60, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:21'),
(61, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:21'),
(62, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:22'),
(63, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:22'),
(64, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:22'),
(65, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:23'),
(66, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:23'),
(67, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:23'),
(68, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:24'),
(69, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:24'),
(70, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:25'),
(71, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:25'),
(72, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:25'),
(73, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:26'),
(74, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:26'),
(75, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:26'),
(76, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:26'),
(77, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:27'),
(78, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:27'),
(79, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:27'),
(80, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:27'),
(81, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:27'),
(82, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:28'),
(83, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:28'),
(84, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:28'),
(85, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:28'),
(86, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:29'),
(87, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:29'),
(88, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:29'),
(89, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:29'),
(90, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:30'),
(91, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:30'),
(92, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:30'),
(93, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:30'),
(94, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:31'),
(95, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:31'),
(96, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:31'),
(97, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:31'),
(98, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:32'),
(99, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:32'),
(100, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:33'),
(101, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:33'),
(102, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:33'),
(103, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:33'),
(104, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:34'),
(105, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:34'),
(106, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:34'),
(107, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:35'),
(108, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:35'),
(109, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:35'),
(110, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:36'),
(111, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:36'),
(112, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:36'),
(113, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:36'),
(114, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:37'),
(115, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:37'),
(116, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:37'),
(117, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:38'),
(118, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:38'),
(119, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:38'),
(120, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:38'),
(121, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:39'),
(122, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:39'),
(123, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:40'),
(124, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:40'),
(125, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:40'),
(126, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:41'),
(127, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:41'),
(128, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:41'),
(129, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:42'),
(130, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:42'),
(131, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:42'),
(132, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:42'),
(133, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:43'),
(134, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:43'),
(135, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:43'),
(136, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:43'),
(137, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:44'),
(138, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:44'),
(139, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:45'),
(140, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:45'),
(141, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:45'),
(142, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:45'),
(143, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:46'),
(144, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:46'),
(145, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:47'),
(146, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:47'),
(147, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:47'),
(148, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:47'),
(149, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:48'),
(150, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:48'),
(151, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:49'),
(152, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:49'),
(153, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:49'),
(154, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:50'),
(155, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:50'),
(156, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:50'),
(157, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:51'),
(158, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:51'),
(159, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:51'),
(160, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:52'),
(161, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:52'),
(162, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:52'),
(163, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:52'),
(164, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:53'),
(165, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:53'),
(166, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:53'),
(167, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:54'),
(168, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:54'),
(169, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:55'),
(170, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:55'),
(171, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:55'),
(172, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:56'),
(173, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:56'),
(174, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:56'),
(175, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:56'),
(176, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:57'),
(177, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:57'),
(178, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:57'),
(179, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:58'),
(180, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:58'),
(181, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:58'),
(182, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:58'),
(183, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:59'),
(184, 1, 'C', 'UpdateRoom', '2024-10-05 03:22:59'),
(185, 1, 'login', 'Login-Successful', '2024-10-05 03:27:41'),
(186, 1, 'C', 'UpdateRoom', '2024-10-05 03:27:43'),
(187, 1, 'C', 'UpdateRoom', '2024-10-05 03:27:44'),
(188, 1, 'C', 'UpdateRoom', '2024-10-05 03:27:44'),
(189, 1, 'C', 'UpdateRoom', '2024-10-05 03:27:44'),
(190, 1, 'C', 'UpdateRoom', '2024-10-05 03:27:49'),
(191, 1, 'C', 'UpdateRoom', '2024-10-05 03:27:49'),
(192, 1, 'C', 'UpdateRoom', '2024-10-05 03:27:50'),
(193, 1, 'C', 'UpdateRoom', '2024-10-05 03:27:50'),
(194, 1, 'login', 'Login-Successful', '2024-10-05 15:56:31'),
(195, 1, 'login', 'Login-Successful', '2024-10-07 22:28:52'),
(196, 1, 'login', 'Login-Successful', '2024-10-07 22:36:40'),
(197, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:41'),
(198, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:42'),
(199, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:42'),
(200, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:46'),
(201, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:47'),
(202, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:47'),
(203, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:52'),
(204, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:52'),
(205, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:52'),
(206, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:52'),
(207, 1, 'C', 'UpdateRoom', '2024-10-07 22:36:53'),
(208, 1, 'login', 'Login-Successful', '2024-10-07 22:37:58'),
(209, 1, 'C', 'UpdateRoom', '2024-10-07 22:37:59'),
(210, 1, 'C', 'UpdateRoom', '2024-10-07 22:37:59'),
(211, 1, 'C', 'UpdateRoom', '2024-10-07 22:38:00'),
(212, 1, 'C', 'UpdateRoom', '2024-10-07 22:38:00'),
(213, 1, 'C', 'UpdateRoom', '2024-10-07 22:38:00'),
(214, 1, 'C', 'UpdateRoom', '2024-10-07 22:38:06'),
(215, 1, 'C', 'UpdateRoom', '2024-10-07 22:38:06'),
(216, 1, 'C', 'UpdateRoom', '2024-10-07 22:38:06'),
(217, 1, 'C', 'UpdateRoom', '2024-10-07 22:38:06'),
(218, 1, 'C', 'UpdateRoom', '2024-10-07 22:38:10'),
(219, 1, 'login', 'Login-Successful', '2024-10-07 23:00:37'),
(220, 1, 'login', 'Login-Successful', '2024-10-07 23:05:45'),
(221, 1, 'login', 'Login-Successful', '2024-10-07 23:06:28'),
(222, 1, 'login', 'Login-Successful', '2024-10-08 20:47:57'),
(223, 1, 'login', 'Login-Successful', '2024-10-08 20:48:08'),
(224, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:26'),
(225, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:27'),
(226, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:27'),
(227, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:30'),
(228, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:30'),
(229, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:31'),
(230, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:31'),
(231, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:36'),
(232, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:36'),
(233, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:36'),
(234, 1, 'C', 'UpdateRoom', '2024-10-08 20:48:36'),
(235, 1, 'login', 'Login-Successful', '2024-10-10 16:42:36'),
(236, 1, 'login', 'Login-Successful', '2024-10-10 16:44:40'),
(237, 1, 'C', 'UpdateRoom', '2024-10-10 16:44:41'),
(238, 1, 'C', 'UpdateRoom', '2024-10-10 16:44:41'),
(239, 1, 'C', 'UpdateRoom', '2024-10-10 16:44:42'),
(240, 1, 'C', 'UpdateRoom', '2024-10-10 16:44:42'),
(241, 1, 'login', 'Login-Successful', '2024-10-10 17:38:25'),
(242, 1, 'login', 'Login-Successful', '2024-10-10 19:28:57'),
(244, 11, 'login', 'Login-Successful', '2024-10-10 19:50:39'),
(245, 11, 'login', 'Login-Successful', '2024-10-10 19:50:46'),
(247, 11, 'login', 'Login-Successful', '2024-10-10 19:52:21'),
(248, 16, 'register', 'Register-Successful', '2024-10-10 19:52:54'),
(249, 1, 'login', 'Login-Successful', '2024-10-10 19:53:09'),
(250, 1, 'login', 'Login-Successful', '2024-10-10 20:08:58'),
(251, 11, 'login', 'Login-Successful', '2024-10-10 20:12:50'),
(252, 11, 'login', 'Login-Successful', '2024-10-10 20:15:17'),
(253, 11, 'login', 'Login-Successful', '2024-10-10 20:17:08'),
(254, 1, 'login', 'Login-Successful', '2024-10-10 20:23:53'),
(255, 1, 'login', 'Login-Successful', '2024-10-10 20:43:53'),
(256, 11, 'login', 'Login-Successful', '2024-10-10 20:47:13'),
(257, 1, 'login', 'Login-Successful', '2024-10-10 21:02:36'),
(258, 1, 'login', 'Login-Successful', '2024-10-10 21:07:33'),
(259, 1, 'C', 'UpdateRoom', '2024-10-10 21:07:36'),
(260, 1, 'C', 'UpdateRoom', '2024-10-10 21:07:36'),
(261, 1, 'C', 'UpdateRoom', '2024-10-10 21:07:37'),
(262, 1, 'C', 'UpdateRoom', '2024-10-10 21:07:37'),
(263, 1, 'login', 'Login-Successful', '2024-10-10 21:15:47'),
(264, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:48'),
(265, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:48'),
(266, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:49'),
(267, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:49'),
(268, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:49'),
(269, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:50'),
(270, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:50'),
(271, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:50'),
(272, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:50'),
(273, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:51'),
(274, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:51'),
(275, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:51'),
(276, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:52'),
(277, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:52'),
(278, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:53'),
(279, 1, 'C', 'UpdateRoom', '2024-10-10 21:15:53'),
(280, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:24'),
(281, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:24'),
(282, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:24'),
(283, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:24'),
(284, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:25'),
(285, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:25'),
(286, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:25'),
(287, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:25'),
(288, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:26'),
(289, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:26'),
(290, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:26'),
(291, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:26'),
(292, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:27'),
(293, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:27'),
(294, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:27'),
(295, 1, 'C', 'UpdateRoom', '2024-10-10 21:16:27'),
(296, 1, 'login', 'Login-Successful', '2024-10-10 21:33:25'),
(297, 11, 'login', 'Login-Successful', '2024-10-10 22:53:32'),
(298, 1, 'login', 'Login-Successful', '2024-10-10 22:53:44'),
(299, 1, 'login', 'Login-Successful', '2024-10-10 22:56:58'),
(300, 1, 'login', 'Login-Successful', '2024-10-10 23:15:05'),
(301, 1, 'login', 'Login-Successful', '2024-10-10 23:30:02'),
(302, 1, 'login', 'Login-Successful', '2024-10-10 23:36:25'),
(303, 1, 'login', 'Login-Successful', '2024-10-10 23:41:43'),
(304, 1, 'login', 'Login-Successful', '2024-10-10 23:44:22'),
(305, 1, 'login', 'Login-Successful', '2024-10-10 23:48:12'),
(306, 1, 'login', 'Login-Successful', '2024-10-10 23:50:24'),
(307, 1, 'login', 'Login-Successful', '2024-10-11 00:16:41'),
(308, 16, 'login', 'Login-Successful', '2024-10-11 00:23:19'),
(309, 17, 'register', 'Register-Successful', '2024-10-11 00:33:53'),
(310, 17, 'register', 'Register-Successful', '2024-10-11 00:36:32'),
(311, 1, 'login', 'Login-Successful', '2024-10-11 00:36:44'),
(312, 19, 'register', 'Register-Successful', '2024-10-11 00:37:18'),
(313, 11, 'register', 'Register-Successful', '2024-10-11 00:46:44'),
(314, 11, 'register', 'Register-Successful', '2024-10-11 00:50:26'),
(315, 11, 'register', 'Register-Successful', '2024-10-11 00:52:16'),
(316, 11, 'register', 'Register-Successful', '2024-10-11 00:54:31'),
(317, 11, 'login', 'Login-Successful', '2024-10-11 00:55:53'),
(318, 11, 'register', 'Register-Successful', '2024-10-11 00:56:04'),
(319, 11, 'login', 'Login-Successful', '2024-10-11 00:59:01'),
(320, 25, 'register', 'Register-Successful', '2024-10-11 01:02:02'),
(321, 1, 'login', 'Login-Successful', '2024-10-11 01:02:11'),
(322, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:12'),
(323, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:13'),
(324, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:13'),
(325, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:13'),
(326, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:14'),
(327, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:14'),
(328, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:14'),
(329, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:15'),
(330, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:15'),
(331, 1, 'C', 'UpdateRoom', '2024-10-11 01:02:15'),
(332, 11, 'login', 'Login-Successful', '2024-10-11 01:30:56'),
(333, 1, 'login', 'Login-Successful', '2024-10-11 02:33:31'),
(334, 1, 'C', 'UpdateRoom', '2024-10-11 02:33:33'),
(335, 1, 'C', 'UpdateRoom', '2024-10-11 02:33:33'),
(336, 1, 'C', 'UpdateRoom', '2024-10-11 02:33:33'),
(337, 1, 'C', 'UpdateRoom', '2024-10-11 02:33:34'),
(338, 1, 'C', 'UpdateRoom', '2024-10-11 02:33:34'),
(339, 1, 'C', 'UpdateRoom', '2024-10-11 02:33:34'),
(340, 1, 'login', 'Login-Successful', '2024-10-11 02:37:13'),
(341, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:15'),
(342, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:16'),
(343, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:16'),
(344, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:16'),
(345, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:17'),
(346, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:17'),
(347, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:49'),
(348, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:50'),
(349, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:51'),
(350, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:51'),
(351, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:51'),
(352, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:51'),
(353, 1, 'C', 'UpdateRoom', '2024-10-11 02:37:52'),
(354, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:00'),
(355, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:00'),
(356, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:00'),
(357, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:09'),
(358, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:09'),
(359, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:09'),
(360, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:10'),
(361, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:10'),
(362, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:10'),
(363, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:10'),
(364, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:11'),
(365, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:11'),
(366, 1, 'C', 'UpdateRoom', '2024-10-11 02:38:11'),
(367, 1, 'login', 'Login-Successful', '2024-10-11 02:50:38'),
(368, 1, 'C', 'UpdateRoom', '2024-10-11 02:50:42'),
(369, 1, 'C', 'UpdateRoom', '2024-10-11 02:50:42'),
(370, 1, 'C', 'UpdateRoom', '2024-10-11 02:50:42'),
(371, 1, 'C', 'UpdateRoom', '2024-10-11 02:50:43'),
(372, 1, 'C', 'UpdateRoom', '2024-10-11 02:50:43'),
(373, 1, 'C', 'UpdateRoom', '2024-10-11 02:50:43'),
(374, 1, 'C', 'UpdateRoom', '2024-10-11 02:50:44'),
(375, 1, 'C', 'UpdateRoom', '2024-10-11 02:53:50'),
(376, 1, 'C', 'UpdateRoom', '2024-10-11 02:53:50'),
(377, 1, 'C', 'UpdateRoom', '2024-10-11 02:53:50'),
(378, 1, 'C', 'UpdateRoom', '2024-10-11 02:53:51'),
(379, 1, 'C', 'UpdateRoom', '2024-10-11 02:53:51'),
(380, 1, 'C', 'UpdateRoom', '2024-10-11 02:53:51'),
(381, 1, 'C', 'UpdateRoom', '2024-10-11 02:53:51'),
(382, 1, 'login', 'Login-Successful', '2024-10-11 02:55:58'),
(383, 1, 'C', 'UpdateRoom', '2024-10-11 02:55:59'),
(384, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:00'),
(385, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:00'),
(386, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:00'),
(387, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:00'),
(388, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:01'),
(389, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:01'),
(390, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:14'),
(391, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:14'),
(392, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:15'),
(393, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:15'),
(394, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:15'),
(395, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:15'),
(396, 1, 'C', 'UpdateRoom', '2024-10-11 02:56:15'),
(397, 1, 'C', 'UpdateRoom', '2024-10-11 02:59:56'),
(398, 1, 'C', 'UpdateRoom', '2024-10-11 02:59:56'),
(399, 1, 'C', 'UpdateRoom', '2024-10-11 02:59:56'),
(400, 1, 'C', 'UpdateRoom', '2024-10-11 02:59:56'),
(401, 1, 'C', 'UpdateRoom', '2024-10-11 02:59:57'),
(402, 1, 'C', 'UpdateRoom', '2024-10-11 02:59:57'),
(403, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:01'),
(404, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:01'),
(405, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:06'),
(406, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:06'),
(407, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:06'),
(408, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:06'),
(409, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:07'),
(410, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:07'),
(411, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:07'),
(412, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:07'),
(413, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:13'),
(414, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:13'),
(415, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:13'),
(416, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:14'),
(417, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:14'),
(418, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:25'),
(419, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:25'),
(420, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:26'),
(421, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:26'),
(422, 1, 'C', 'UpdateRoom', '2024-10-11 03:00:26'),
(423, 11, 'login', 'Login-Successful', '2024-10-11 03:14:01'),
(424, 11, 'login', 'Login-Successful', '2024-10-11 03:20:16'),
(425, 11, 'login', 'Login-Successful', '2024-10-11 03:28:08'),
(426, 1, 'login', 'Login-Successful', '2024-10-11 08:59:04'),
(427, 1, 'login', 'Login-Successful', '2024-10-11 10:36:26'),
(428, 26, 'register', 'Register-Successful', '2024-10-11 10:37:02'),
(429, 26, 'login', 'Login-Successful', '2024-10-11 10:37:11'),
(430, 1, 'login', 'Login-Successful', '2024-10-11 11:33:32'),
(431, 1, 'login', 'Login-Successful', '2024-10-11 11:33:46'),
(432, 1, 'login', 'Login-Successful', '2024-10-11 12:16:55'),
(433, 11, 'login', 'Login-Successful', '2024-10-11 12:19:07'),
(434, 11, 'login', 'Login-Successful', '2024-10-11 12:19:48'),
(435, 11, 'login', 'Login-Successful', '2024-10-11 12:24:20'),
(436, 11, 'login', 'Login-Successful', '2024-10-11 12:24:37'),
(437, 11, 'login', 'Login-Successful', '2024-10-11 12:40:13'),
(438, 1, 'login', 'Login-Successful', '2024-10-11 12:40:22'),
(439, 11, 'login', 'Login-Successful', '2024-10-11 13:29:48'),
(440, 27, 'register', 'Register-Successful', '2024-10-11 13:51:01'),
(441, 27, 'login', 'Login-Successful', '2024-10-11 13:51:26'),
(442, 1, 'login', 'Login-Successful', '2024-10-11 13:52:30'),
(443, 1, 'C', 'UpdateRoom', '2024-10-11 13:56:28'),
(444, 1, 'C', 'UpdateRoom', '2024-10-11 13:56:29'),
(445, 1, 'C', 'UpdateRoom', '2024-10-11 13:56:30'),
(446, 1, 'C', 'UpdateRoom', '2024-10-11 13:56:30'),
(447, 1, 'C', 'UpdateRoom', '2024-10-11 13:56:43'),
(448, 1, 'C', 'UpdateRoom', '2024-10-11 13:56:43'),
(449, 1, 'C', 'UpdateRoom', '2024-10-11 13:56:43'),
(450, 1, 'C', 'UpdateRoom', '2024-10-11 13:56:44'),
(451, 27, 'login', 'Login-Successful', '2024-10-11 14:01:28'),
(452, 26, 'login', 'Login-Successful', '2024-10-11 14:11:06'),
(453, 27, 'login', 'Login-Successful', '2024-10-11 14:11:50'),
(454, 1, 'login', 'Login-Successful', '2024-10-11 14:12:30'),
(455, 26, 'login', 'Login-Successful', '2024-10-11 14:13:35'),
(456, 25, 'login', 'Login-Successful', '2024-10-11 14:14:47'),
(457, 25, 'C', 'UpdateRoom', '2024-10-11 14:16:00'),
(458, 1, 'login', 'Login-Successful', '2024-10-11 14:19:20'),
(459, 1, 'C', 'UpdateRoom', '2024-10-11 14:19:24'),
(460, 1, 'C', 'UpdateRoom', '2024-10-11 14:19:24'),
(461, 1, 'C', 'UpdateRoom', '2024-10-11 14:19:24'),
(462, 1, 'C', 'UpdateRoom', '2024-10-11 14:19:25'),
(463, 1, 'C', 'UpdateRoom', '2024-10-11 14:19:25'),
(464, 1, 'C', 'UpdateRoom', '2024-10-11 14:19:25'),
(465, 1, 'C', 'UpdateRoom', '2024-10-11 14:19:25'),
(466, 1, 'C', 'UpdateRoom', '2024-10-11 14:19:26'),
(467, 1, 'C', 'UpdateRoom', '2024-10-11 14:19:26'),
(468, 1, 'login', 'Login-Successful', '2024-10-11 14:24:41'),
(469, 1, 'login', 'Login-Successful', '2024-10-11 14:37:43'),
(470, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:49'),
(471, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:50'),
(472, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:50'),
(473, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:51'),
(474, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:51'),
(475, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:51'),
(476, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:51'),
(477, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:52'),
(478, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:53'),
(479, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:54'),
(480, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:56'),
(481, 1, 'C', 'UpdateRoom', '2024-10-11 14:47:56'),
(482, 1, 'login', 'Login-Successful', '2024-10-11 14:48:25'),
(483, 1, 'C', 'UpdateRoom', '2024-10-11 14:48:28'),
(484, 1, 'C', 'UpdateRoom', '2024-10-11 14:48:28'),
(485, 1, 'C', 'UpdateRoom', '2024-10-11 14:48:28'),
(486, 1, 'C', 'UpdateRoom', '2024-10-11 14:48:29'),
(487, 1, 'C', 'UpdateRoom', '2024-10-11 14:48:41'),
(488, 1, 'C', 'UpdateRoom', '2024-10-11 14:48:41'),
(489, 1, 'C', 'UpdateRoom', '2024-10-11 14:48:41'),
(490, 1, 'C', 'UpdateRoom', '2024-10-11 14:48:42'),
(491, 26, 'login', 'Login-Successful', '2024-10-11 14:55:28'),
(492, 1, 'login', 'Login-Successful', '2024-10-11 15:00:40'),
(493, 1, 'C', 'UpdateRoom', '2024-10-11 15:01:02'),
(494, 1, 'C', 'UpdateRoom', '2024-10-11 15:01:02'),
(495, 1, 'C', 'UpdateRoom', '2024-10-11 15:01:03'),
(496, 1, 'C', 'UpdateRoom', '2024-10-11 15:01:22'),
(497, 1, 'C', 'UpdateRoom', '2024-10-11 15:01:22'),
(498, 1, 'C', 'UpdateRoom', '2024-10-11 15:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `type` varchar(1) DEFAULT NULL,
  `roomno` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `type`, `roomno`, `status`, `image_path`) VALUES
(1, 'A', 100, 0, NULL),
(2, 'A', 101, 0, NULL),
(3, 'A', 102, 0, NULL),
(4, 'B', 103, 0, NULL),
(5, 'B', 104, 0, NULL),
(6, 'A', 200, 0, NULL),
(7, 'A', 201, 0, NULL),
(8, 'A', 202, 0, NULL),
(9, 'B', 203, 0, NULL),
(10, 'B', 204, 0, NULL),
(11, 'A', 300, 0, NULL),
(12, 'A', 301, 0, NULL),
(13, 'A', 302, 0, NULL),
(14, 'B', 303, 0, NULL),
(15, 'B', 304, 0, NULL),
(16, 'C', 400, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `rank`) VALUES
(1, 'KabAdmin1@example.net', '$2b$10$bXbIQE2AFWk1s3FXt//1uuJLNgrp0WDi/av5xDSCW0DafHRm0EXie', 1),
(2, 'example1@email.com', '$2b$10$9F4IdIdhquMofL2oahRWKeu9OIIGupaLpycmTX4O9ISSlhiScqDj2', 0),
(3, 'user.test01@domain.org', '$2b$10$/h8sRHYDhmPS8OqxqkcCtOCWxBxowQNj2ajs3P/MFWL59U.YvOhNO', 0),
(4, 'randomuser123@sample.net', '$2b$10$VB9aI4P81jvWm6LSep0i3e2tDeiTlmMs2IVXTyt9liKylXxrgh1dK', 0),
(5, 'demoaccount@website.com', '$2b$10$MJTISozZUAnEwVuYzDqyoO.nQq3fNGs4wtOYBzHJJsQNZi61Z8ZtG', 0),
(6, 'myemail100@provider.org', '$2b$10$A8ECHLd6/LVE98ckntEhCeb.JM9zPG4WWA3f4SHp5reLErzef68rC', 0),
(7, 'username_xx@service.net', '$2b$10$r/nDuZzDBjjRSYJaIEg5j.6YJPOsVlqJE01bfpONy3WFYf5XcbS3S', 0),
(8, 'tempuser09@mail.com', '$2b$10$4WjVVRVXO/7lSBA5t0bh1.uqLM5bRaC/515ATfshJlwYh6KnnVfhq', 0),
(9, 'testemail2024@domain.com', '$2b$10$4Zi1/TcLZX8lteJQT/5nMuNCfQg6sg4gkAarA.aLlJndi4gbsYFPi', 0),
(10, 'trialuser22@server.org', '$2b$10$T2NH30tn4K/TzWr3zwZjM.M6f0Ww3cQZVWCyUPemdbcd0voSUQjOu', 0),
(11, 'kimpongphanu@gmail.com', '$2b$10$vJXkCCDhe6lH0TtE3eqld.ZZCZIi4Bh8gIVepBM8BqxjAZsdIveXS', 0),
(12, 'testemail2024@domain.com', '$2b$10$3MebN6EnpiyD/2JA9bTb9.YzVLKzl4J405xmLjfm/REUN4mhICaEK', 0),
(13, 'kakmha123@email.net', '$2b$10$Z/qikiDNgsQS7JVpCI3sgeOyMt1Vqznfirp415b7iFQR2nuj/WrLq', 0),
(14, 'kakmha123@email.ner', '$2b$10$ej/vx/wrfORpn9gDbSfkxuCY.bXbuoaFN4As9ulnZxgAzczdbGJpe', 0),
(15, 'kakmha123@email.nes', '$2b$10$YUPIhVcWpzgEOqyzT1RGce4we8NSFkgEgp6evEF/efILG9MUsKU92', 0),
(16, 'kakmha123@email.com', '$2b$10$wV5uScfYkUa/4tKJMxKpOOPavBNH5UYjv9DE/m0XuZfPjdG2p.hwy', 0),
(17, 'kimpongpddnu@gmail.com', '$2b$10$J4GHGPkdFg0bQGlHTql0Ae8BfptqtVC.x.nliW2iyOZUrT5e5Xxvy', 0),
(18, 'kimpongpddnu@gmail.com', '$2b$10$7XMBXRPBWEZddYX6ImA0O.IR550fF.32JPkM8YdfHeG2KV/9WffSy', 0),
(19, 'kimpongdsdnu@gmail.com', '$2b$10$WKCbihGO9Ixy5nmUGKMdYuTi0IvDBkZIo8k6c.RvqlyNjN6SjcVk.', 0),
(20, 'kimpongphanu@gmail.com', '$2b$10$QSLSYh/hojShg2nupGtUeu1z4VDPbVaWLeUvl/ThYwqtWtUZ.4IHa', 0),
(21, 'kimpongphanu@gmail.com', '$2b$10$r8JNl8hsXd34VPLkMMwbeuiODSGC2kk5I/h4bi7aV.swAQbT3sIV2', 0),
(22, 'kimpongphanu@gmail.com', '$2b$10$CsFMZpl6awYEFBDXhSdpNOa.uxgUG0hUUCT4v.bDHXheV7MpO37jO', 0),
(23, 'kimpongphanu@gmail.com', '$2b$10$KjOiHb/nDWIfbRH6jNVgN.OxC9v4eswnLCK3r2fI9AgATZCIWvBJK', 0),
(24, 'kimpongphanu@gmail.com', '$2b$10$lkOaxK403aV.Uga07aBVk.Fhtd6q1S0lh6PpHdLQa94q.w0QUaf5O', 0),
(25, 'kimponasdasgphanu@gmail.com', '$2b$10$saAzSiKbf0IjJxdzeZaIHO.qWuGb06ZitMkZQJeLfWTzmEeFBX0Om', 0),
(26, 'penon5555@gmail.com', '$2b$10$PQw5wl38ADGzADsz.pd9VeWP5/52x5E4sg16OWGCb.F1WKwy0ez8u', 0),
(27, 'patcharapon.me@gmail.com', '$2b$10$4vVKuUJWYtaoMHMZXmuSleLD4e6LJqca9ljvW19NfXpWvpjBt2ZO6', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `phone`) VALUES
(1, 'System1', 'AdminKim', 'KabAdmin1@example.net', '022130356'),
(2, 'Lapin', 'Srisoi', 'example1@email.com', '0674694503'),
(3, 'Pawat', 'Weerapongsarn', 'user.test01@domain.org', '0601116192'),
(4, 'Chonnipa', 'Phumphattanatham', 'randomuser123@sample.net', '0611061006'),
(5, 'Dararat', 'Lertkoonawong', 'demoaccount@website.com', '0618383260'),
(6, 'Sudawadee', 'Pasakul', 'myemail100@provider.org', '0621625152'),
(7, 'Prompong', 'Boondee', 'username_xx@service.net', '0635749571'),
(8, 'Bunnisa', 'Kanjanamas', 'tempuser09@mail.com', '0636729740'),
(9, 'Krittin', 'Sukanansarn', 'testemail2024@domain.com', '0636881646'),
(10, 'Nareeya', 'Wongpattana', 'trialuser22@server.org', '0643558823'),
(11, 'adam', 'smith', 'kimpongphanu@gmail.com', '0985676543'),
(12, 'Krittindfd', 'Sukanansarnsfs', 'testemail2024@domain.com', '0636881643'),
(13, 'kkkkkkk', 'yyyyyyy', 'kakmha123@email.net', '0123456780'),
(14, 'kkkkkkkdd', 'yyyyyyyss', 'kakmha123@email.ner', '0123456783'),
(15, 'kkkkkkkdds', 'yyyyyyysss', 'kakmha123@email.nes', '0123456786'),
(16, 'kkkkkkdd', 'yyyyyyyss', 'kakmha123@email.com', '0123456732'),
(17, 'adamdd', 'smithss', 'kimpongpddnu@gmail.com', '0985676523'),
(19, 'adamdddd', 'smithssss', 'kimpongdsdnu@gmail.com', '0985676547'),
(25, 'pongphanu', 'sunsan', 'kimponasdasgphanu@gmail.com', '0647344268'),
(26, 'Thanapat', 'Wantem', 'penon5555@gmail.com', '0952733367'),
(27, 'Patcharapon', 'Chirakowithayaohat', 'patcharapon.me@gmail.com', '0612292942');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `images2`
--
ALTER TABLE `images2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_ibfk_1` (`user_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `images2`
--
ALTER TABLE `images2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=499;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
