-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 20, 2026 at 01:23 PM
-- Server version: 10.6.23-MariaDB-cll-lve-log
-- PHP Version: 8.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skytanza_wifi`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 2, 'register', 'User registered successfully', '196.249.98.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 11:01:15'),
(2, 2, 'login', 'User logged in successfully', '196.249.98.242', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 11:01:22'),
(3, 3, 'register', 'User registered successfully', '196.249.98.242', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 11:17:21'),
(4, 3, 'login', 'User logged in successfully', '196.249.98.242', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 11:17:42'),
(5, 3, 'login', 'User logged in successfully', '196.249.98.242', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 11:38:11'),
(6, 2, 'login', 'User logged in successfully', '196.249.113.205', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 16:05:07'),
(7, 3, 'login', 'User logged in successfully', '196.249.113.205', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 16:16:55'),
(8, 3, 'login', 'User logged in successfully', '196.249.113.205', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 16:17:00'),
(9, 2, 'logout', 'User logged out', '196.249.113.205', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 16:31:54'),
(10, 2, 'login', 'User logged in successfully', '196.249.113.205', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 16:32:09'),
(11, 3, 'logout', 'User logged out', '196.249.113.205', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 16:32:34'),
(12, 3, 'login', 'User logged in successfully', '196.249.113.205', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 16:32:38'),
(13, 3, 'logout', 'User logged out', '196.249.113.205', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 17:21:38'),
(14, 3, 'login', 'User logged in successfully', '196.249.113.205', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 17:22:20'),
(15, 3, 'login', 'User logged in successfully', '196.249.113.205', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 17:53:48'),
(16, 3, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 18:31:14'),
(17, 3, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 18:55:50'),
(18, 3, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 19:58:06'),
(19, 2, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 20:00:51'),
(20, 3, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 20:51:40'),
(21, 3, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 22:04:19'),
(22, 2, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 22:54:22'),
(23, 3, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-04 23:17:21'),
(24, 2, 'logout', 'User logged out', '196.249.96.93', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 23:53:30'),
(25, 2, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-04 23:53:33'),
(26, 3, 'login', 'User logged in successfully', '197.250.226.210', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-05 04:03:53'),
(27, 3, 'login', 'User logged in successfully', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-05 04:46:39'),
(28, 3, 'login', 'User logged in successfully', '196.249.120.176', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-05 07:52:12'),
(29, 2, 'login', 'User logged in successfully', '196.249.120.176', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-05 08:21:12'),
(30, 3, 'login', 'User logged in successfully', '196.249.120.176', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-05 08:53:11'),
(31, 3, 'login', 'User logged in successfully', '196.249.93.187', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-05 09:39:08'),
(32, 2, 'login', 'User logged in successfully', '196.249.98.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-05 12:35:04'),
(33, 3, 'login', 'User logged in successfully', '196.249.113.20', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-05 14:28:07'),
(34, 2, 'login', 'User logged in successfully', '196.249.111.173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 05:21:49'),
(35, 3, 'login', 'User logged in successfully', '196.249.111.173', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-06 06:16:46'),
(36, 3, 'login', 'User logged in successfully', '196.249.111.173', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-06 06:56:56'),
(37, 3, 'login', 'User logged in successfully', '196.249.111.173', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-06 07:50:11'),
(38, 2, 'login', 'User logged in successfully', '196.249.111.173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 09:43:18'),
(39, 2, 'login', 'User logged in successfully', '196.249.98.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-06 16:27:01'),
(40, 3, 'login', 'User logged in successfully', '196.249.97.251', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', '2026-10-06 21:16:21'),
(41, 2, 'login', 'User logged in', '196.249.93.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-07 15:37:00'),
(42, 2, 'login', 'User logged in', '196.249.111.251', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-07 17:23:29'),
(43, 2, 'login', 'User logged in', '197.186.71.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-12 15:55:49'),
(44, 2, 'login', 'User logged in', '197.186.71.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-12 16:20:59'),
(45, 2, 'login', 'User logged in', '197.186.68.95', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-12 18:35:08'),
(46, 2, 'login', 'User logged in', '197.186.68.95', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-12 18:35:19'),
(47, 2, 'logout', 'User logged out', '197.186.68.95', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-12 18:48:11'),
(48, 1, 'login', 'User logged in', '197.186.68.95', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-12 18:48:38'),
(49, 1, 'download_source', 'index.php for RADIUS server', '197.186.68.95', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-12 19:10:00'),
(50, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 05:59:12'),
(51, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 05:59:18'),
(52, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 09:01:09'),
(53, 1, 'download_source', 'index.php for RADIUS server', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 09:01:33'),
(54, 1, 'download_source', 'index.php for RADIUS server', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 09:04:04'),
(55, 1, 'logout', 'User logged out', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 09:55:44'),
(56, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 09:56:53'),
(57, 1, 'logout', 'User logged out', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 09:59:59'),
(58, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 10:03:44'),
(59, 1, 'logout', 'User logged out', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 10:05:24'),
(60, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 10:07:55'),
(61, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 10:48:13'),
(62, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 12:47:20'),
(63, 1, 'logout', 'User logged out', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 13:17:29'),
(64, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 13:17:31'),
(65, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 14:05:44'),
(66, 1, 'logout', 'User logged out', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 14:12:30'),
(67, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 14:12:33'),
(68, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 15:06:43'),
(69, 1, 'logout', 'User logged out', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 15:28:18'),
(70, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 15:28:20'),
(71, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 15:28:25'),
(72, 1, 'logout', 'User logged out', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 15:43:38'),
(73, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 16:30:05'),
(74, 3, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-13 16:33:18'),
(75, 3, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-13 17:10:53'),
(76, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 19:33:40'),
(77, 1, 'omada_controller_save', 'OMADA  OC 200 https://euw1-omada-essential-controller.tplinkcloud.com', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-13 19:58:13'),
(78, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-13 21:35:11'),
(79, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-13 21:35:17'),
(80, 1, 'order_confirm', 'SKY2610132243289A82', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-13 21:35:29'),
(81, 1, 'order_confirm', 'SKY2610132243289A82', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-13 21:35:44'),
(82, 1, 'omada_controller_save', 'omada https://euw1-omada-northbound.tplinkcloud.com', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-13 22:31:56'),
(83, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 05:21:09'),
(84, 1, 'omada_setup', 'EAP225 Main → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 05:40:04'),
(85, 1, 'omada_controller_save', 'Omada Cloud EUW1 https://euw1-omada-northbound.tplinkcloud.com', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 05:41:14'),
(86, 1, 'omada_setup', 'EAP225 Main → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 05:41:14'),
(87, 1, 'logout', 'User logged out', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 06:28:04'),
(88, 3, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-14 06:30:27'),
(89, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 06:31:17'),
(90, 1, 'omada_controller_save', 'Omada Cloud EUW1 https://euw1-omada-northbound.tplinkcloud.com', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 06:47:28'),
(91, 1, 'omada_setup', 'A8-29-DC-10-5C-18 → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 06:47:29'),
(92, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 12:52:32'),
(93, 1, 'omada_controller_save', 'OMADA CLOUD https://euw1-omada-northbound.tplinkcloud.com (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 13:13:48'),
(94, 1, 'omada_controller_save', 'Omada Cloud EUW1 https://euw1-omada-northbound.tplinkcloud.com (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 13:24:24'),
(95, 1, 'omada_setup', 'EAP225 Main → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 13:24:25'),
(96, 1, 'omada_setup', 'A8-29-DC-10-5C-18 → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 13:45:34'),
(97, 1, 'omada_setup', 'A8-29-DC-10-5C-18 → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 14:34:08'),
(98, 1, 'link_fix', '#14 ok 4 warn 3 fail 1', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 14:34:08'),
(99, 1, 'link_check', '#14 ok 4 warn 3 fail 1', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 14:34:14'),
(100, 1, 'download_source', 'index.php for RADIUS server', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 14:43:56'),
(101, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 15:42:42'),
(102, 1, 'omada_setup', 'A8-29-DC-10-5C-18 → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 15:51:44'),
(103, 1, 'link_fix', '#14 ok 5 warn 1 fail 2', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 15:51:44'),
(104, 1, 'logout', 'User logged out', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 16:14:41'),
(105, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 16:14:43'),
(106, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 16:26:34'),
(107, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 16:26:39'),
(108, 1, 'download_source', 'index.php for RADIUS server', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 16:27:04'),
(109, 3, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-14 17:02:15'),
(110, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 17:06:12'),
(111, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 17:06:15'),
(112, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 18:41:36'),
(113, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 18:41:41'),
(114, 1, 'omada_setup', 'A8-29-DC-10-5C-18 → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 19:23:46'),
(115, 1, 'omada_default_inform', 'Linked Omada Inform URL omada://65.109.35.14?dPort=29810&mPort=29814&omadacId=6acf85545651212b5ca146e6', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 19:37:57'),
(116, 1, 'download_source', 'index.php for RADIUS server', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:03:06'),
(117, 1, 'omada_controller_save', 'omada claud https://65.109.35.14:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:20:53'),
(118, 1, 'omada_api_check', 'omada claud → 1 failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:22:15'),
(119, 1, 'omada_site_create', 'chamazi → Token: cannot reach controller: [Via RADIUS server] the Omada relay on the RADIUS server is not running (needs RADIUS box v5.9)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:22:35'),
(120, 1, 'omada_controller_save', 'omada claud https://65.109.35.14:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:34:46'),
(121, 1, 'omada_controller_save', 'omada claud https://65.109.35.14:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:35:26'),
(122, 1, 'omada_controller_save', 'omada claud https://65.109.35.14:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:35:49'),
(123, 1, 'omada_setup', 'A8-29-DC-10-5C-18 → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:37:09'),
(124, 1, 'link_fix', '#15 ok 6 warn 2 fail 1', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:37:17'),
(125, 1, 'omada_site_create', 'chamazi → Token: cannot reach controller: [Via RADIUS server] Failed to connect to 65.109.35.14 port 8043 after 8002 ms: Timeout was reached', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 21:41:58'),
(126, 1, 'omada_controller_save', 'Omada Cloud EUW1 https://euw1-omada-northbound.tplinkcloud.com', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 22:03:26'),
(127, 1, 'omada_default_inform', 'Linked Omada Inform URL omada://65.109.35.14?dPort=29810&mPort=29814&omadacId=6acf85545651212b5ca146e6', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 22:03:47'),
(128, 1, 'omada_default_inform', 'Linked Omada Inform URL omada://65.109.35.14?dPort=29810&mPort=29814&omadacId=6acf85545651212b5ca146e6', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 22:03:58'),
(129, 1, 'omada_default_inform', 'Linked Omada Inform URL omada://65.109.35.14?dPort=29810&mPort=29814&omadacId=6acf85545651212b5ca146e6', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 22:04:13'),
(130, 1, 'omada_setup', 'EAP225 Main → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 22:46:32'),
(131, 1, 'omada_default_inform', 'Linked Omada Inform URL omada://65.109.35.14?dPort=29810&mPort=29814&omadacId=6acf85545651212b5ca146e6', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 23:13:07'),
(132, 1, 'omada_default_inform', 'Linked Omada Inform URL omada://65.109.35.14?dPort=29810&mPort=29814&omadacId=6acf85545651212b5ca146e6', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 23:13:26'),
(133, 1, 'omada_default_inform', 'Linked Omada Inform URL omada://65.109.35.14?dPort=29810&mPort=29814&omadacId=6acf85545651212b5ca146e6', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 23:13:43'),
(134, 1, 'omada_controller_save', 'Omada Controller 65.109.35.14 https://65.109.35.14:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 23:25:19'),
(135, 1, 'omada_controller_save', 'Omada Controller 65.109.35.14 https://65.109.35.14:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-14 23:27:15'),
(136, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 05:00:32'),
(137, 1, 'omada_default_inform', 'Linked Omada Inform URL omada://65.109.35.14?dPort=29810&mPort=29814&omadacId=6acf85545651212b5ca146e6', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 05:00:47'),
(138, 1, 'omada_setup', 'A8-29-DC-10-5C-18 → manual', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 05:15:34'),
(139, 1, 'omada_controller_save', 'Omada Controller 192.168.18.4 https://192.168.18.4:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 06:18:53'),
(140, 1, 'omada_setup', 'EAP225 Main → failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 06:19:24'),
(141, 1, 'omada_setup', 'EAP225 Main → failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 06:22:43'),
(142, 1, 'omada_setup', 'EAP225 Main → failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 06:23:23'),
(143, 1, 'link_fix', '#18 ok 6 warn 2 fail 1', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 06:23:31'),
(144, 1, 'omada_setup', 'EAP225 Main → failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 06:26:18'),
(145, 1, 'omada_setup', 'EAP225 Main → failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 06:30:57'),
(146, 1, 'omada_setup', 'Kariakoo Main → failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 06:40:50'),
(147, 1, 'download_source', 'index.php for RADIUS server', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 07:07:34'),
(148, 1, 'download_source', 'index.php for RADIUS server', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 07:07:55'),
(149, 1, 'download_source', 'index.php for RADIUS server', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 07:07:56'),
(150, 1, 'omada_default_inform', 'Linked Omada Inform URL omada://65.109.35.14?dPort=29810&mPort=29814&omadacId=6acf85545651212b5ca146e6', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 07:49:39'),
(151, 1, 'omada_controller_save', 'Omada Controller 169.58.93.38 https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 07:52:42'),
(152, 1, 'omada_setup', 'Kariakoo Main → failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 07:52:43'),
(153, 1, 'omada_controller_save', 'Omada Controller 169.58.93.38 http://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:03:05'),
(154, 1, 'omada_setup', 'EAP225 Main → failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:03:06'),
(155, 1, 'omada_setup', 'EAP225 Main → failed', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:10:53'),
(156, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:29:49'),
(157, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:30:34'),
(158, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:30:51'),
(159, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:30:54'),
(160, 1, 'omada_setup', 'EAP225 Main → partial', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:37:02'),
(161, 1, 'download_source', 'index.php for RADIUS server', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:46:51'),
(162, 1, 'omada_setup', 'EAP225 Main → partial', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 08:53:35'),
(163, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 09:01:53'),
(164, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 09:01:56'),
(165, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 09:01:59'),
(166, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 09:02:02'),
(167, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 09:02:04'),
(168, 1, 'omada_setup', 'EAP225 Main → partial', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 09:05:49'),
(169, 1, 'link_fix', '#21 ok 9 warn 2 fail 2', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 09:05:51'),
(170, 1, 'omada_setup', 'SKY 5G KITONGA → partial', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 09:51:55'),
(171, 1, 'omada_setup', 'EAP225 Main → partial', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 10:02:28'),
(172, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 11:35:40'),
(173, 1, 'login', 'User logged in', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 12:29:36'),
(174, 1, 'order_confirm', 'SKY261015140014EC03', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 12:58:25'),
(175, 1, 'order_confirm', 'SKY261015140014EC03', '197.186.18.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 12:58:33'),
(176, 3, 'login', 'User logged in', '196.249.109.201', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-15 13:45:03'),
(177, 3, 'omada_default_inform', 'Linked Omada Inform URL omada://169.58.93.38?dPort=29810&mPort=29814&omadacId=cb886e281a1029cbdafb1c93f14ba1', '196.249.109.201', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-15 13:45:13'),
(178, 3, 'login', 'User logged in', '196.249.111.169', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-15 14:18:48'),
(179, 3, 'login', 'User logged in', '196.249.111.169', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-15 14:32:22'),
(180, 3, 'login', 'User logged in', '197.186.66.17', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-15 15:39:39'),
(181, 3, 'login', 'User logged in', '196.249.111.169', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-15 16:35:33'),
(182, 3, 'logout', 'User logged out', '196.249.111.169', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-15 16:37:39'),
(183, 1, 'login', 'User logged in', '196.249.111.169', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-15 16:37:56'),
(184, 1, 'login', 'User logged in', '196.249.111.169', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Mobile Safari/537.36', '2026-10-15 17:04:07'),
(185, 1, 'login', 'User logged in', '197.186.16.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 17:44:24'),
(186, 1, 'login', 'User logged in', '197.186.16.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 17:44:47'),
(187, 1, 'login', 'User logged in', '197.186.16.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-15 20:36:50'),
(188, 1, 'login', 'User logged in', '197.186.16.63', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-15 20:58:55'),
(189, 1, 'order_confirm', 'SKY261015220557A386', '197.186.16.63', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-15 21:04:11'),
(190, 1, 'order_confirm', 'SKY261015225955F7F3', '197.186.16.63', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-15 21:04:25'),
(191, 1, 'login', 'User logged in', '197.186.18.106', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 05:15:59'),
(192, 1, 'login', 'User logged in', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:20:31'),
(193, 1, 'login', 'User logged in', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:36:53'),
(194, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba KITONGA NAMBA 2 → ok', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:40:32'),
(195, 3, 'login', 'User logged in', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:44:33'),
(196, 3, 'omada_api_check', 'Omada Controller 169.58.93.38 → 1 failed', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:46:34'),
(197, 3, 'logout', 'User logged out', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:48:03'),
(198, 1, 'login', 'User logged in', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:48:07'),
(199, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:49:05'),
(200, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:49:35'),
(201, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba Whattsap status → ok', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:50:59'),
(202, 1, 'omada_ssid_delete', '6ad090a5f65217666e9773ba 6ad1d763f65217666e978517 → ok', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:54:48'),
(203, 1, 'omada_ssid_delete', '6ad090a5f65217666e9773ba 6ad1d4f0f65217666e9784ff → ok', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:54:55'),
(204, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba SKY TANZANIA SUPERKASI → ok', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:55:19'),
(205, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba SKY HOTSPOT → ok', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:56:02'),
(206, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba SKY PRODUCTIONS → ok', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 07:56:41'),
(207, 1, 'login', 'User logged in', '197.186.18.106', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 08:43:30'),
(208, 1, 'order_confirm', 'SKY2610161156062924', '197.186.18.106', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 09:55:44'),
(209, 1, 'login', 'User logged in', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 10:59:44'),
(210, 1, 'login', 'User logged in', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 11:07:09'),
(211, 1, 'login', 'User logged in', '196.249.113.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 12:07:48'),
(212, 1, 'login', 'User logged in', '197.186.1.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 15:33:35'),
(213, 1, 'login', 'User logged in', '196.249.92.110', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-16 16:36:12'),
(214, 1, 'login', 'User logged in', '197.186.1.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-16 18:27:53'),
(215, 1, 'login', 'User logged in', '197.186.1.207', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 02:36:59'),
(216, 1, 'login', 'User logged in', '197.186.1.207', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 02:53:50'),
(217, 1, 'login', 'User logged in', '197.186.1.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 03:32:47'),
(218, 1, 'login', 'User logged in', '197.186.1.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 03:32:51'),
(219, 1, 'login', 'User logged in', '196.249.98.76', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 10:40:23'),
(220, 1, 'login', 'User logged in', '196.249.98.76', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 11:47:58'),
(221, 1, 'login', 'User logged in', '196.249.109.231', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 12:53:33'),
(222, 1, 'login', 'User logged in', '196.249.98.80', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 14:21:21'),
(223, 1, 'login', 'User logged in', '196.249.113.139', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 14:29:33'),
(224, 1, 'login', 'User logged in', '196.249.120.166', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 15:34:27'),
(225, 1, 'login', 'User logged in', '196.249.120.166', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 16:23:48'),
(226, 1, 'login', 'User logged in', '197.186.3.229', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-17 18:14:48'),
(227, 1, 'login', 'User logged in', '197.186.3.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 18:24:56'),
(228, 1, 'login', 'User logged in', '197.186.3.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 18:25:00'),
(229, 1, 'login', 'User logged in', '197.186.3.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 19:14:31'),
(230, 1, 'login', 'User logged in', '197.186.3.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 22:44:10'),
(231, 1, 'logout', 'User logged out', '197.186.3.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 23:21:31'),
(232, 1, 'login', 'User logged in', '197.186.3.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-17 23:21:34'),
(233, 1, 'login', 'User logged in', '196.249.113.130', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 05:55:56'),
(234, 1, 'order_confirm', 'SKY2610152312278177', '197.186.3.229', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 06:40:26'),
(235, 1, 'login', 'User logged in', '197.186.3.229', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 06:55:51'),
(236, 1, 'login', 'User logged in', '197.186.3.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 07:10:26'),
(237, 1, 'login', 'User logged in', '196.249.98.249', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 08:35:55');
INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `description`, `ip_address`, `user_agent`, `created_at`) VALUES
(238, 1, 'login', 'User logged in', '196.249.98.249', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 09:18:59'),
(239, 1, 'login', 'User logged in', '196.249.98.249', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 09:20:21'),
(240, 1, 'login', 'User logged in', '196.249.98.249', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 10:15:59'),
(241, 1, 'login', 'User logged in', '196.249.98.249', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 10:44:53'),
(242, 1, 'logout', 'User logged out', '196.249.98.249', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 10:45:05'),
(243, 1, 'login', 'User logged in', '169.255.184.216', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 12:51:01'),
(244, 1, 'order_confirm', 'SKY261016130036119F', '169.255.184.216', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 12:52:17'),
(245, 1, 'logout', 'User logged out', '169.255.184.216', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 13:00:14'),
(246, 1, 'login', 'User logged in', '169.255.184.216', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 13:00:59'),
(247, 1, 'login', 'User logged in', '196.249.98.237', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-18 13:54:03'),
(248, 1, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 14:02:16'),
(249, 1, 'login', 'User logged in', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 15:33:07'),
(250, 1, 'login', 'User logged in', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 17:36:12'),
(251, 1, 'omada_setup', 'EAP225 Main → partial', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:01:13'),
(252, 1, 'omada_ssid_delete', '6ad090a5f65217666e9773ba 6ad0a4b1f65217666e977d48 → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:06:08'),
(253, 1, 'omada_ssid_delete', '6ad090a5f65217666e9773ba 6ad1d8b9f65217666e97853c → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:06:17'),
(254, 1, 'omada_ssid_delete', '6ad090a5f65217666e9773ba 6ad1d867f65217666e97852d → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:06:27'),
(255, 1, 'omada_ssid_delete', '6ad090a5f65217666e9773ba 6ad1d892f65217666e978536 → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:06:33'),
(256, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba SKY 5G SUPERKASI → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:08:40'),
(257, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba SKY PRODUCTIONS → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:09:08'),
(258, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba SKY TECHNOLOGY → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:09:30'),
(259, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba SKY KITONGA → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:09:42'),
(260, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba SKY MABANDO → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:10:04'),
(261, 1, 'omada_ssid_create', '6ad090a5f65217666e9773ba SKY TANZANIA 5G → ok', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 18:10:39'),
(262, 1, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 19:05:39'),
(263, 1, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 19:05:44'),
(264, 1, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 20:01:40'),
(265, 1, 'login', 'User logged in', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-18 20:33:45'),
(266, 1, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 05:03:29'),
(267, 1, 'omada_setup', 'EAP225 Main → failed', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 06:12:18'),
(268, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 06:18:02'),
(269, 1, 'omada_setup', 'EAP225 Main → partial', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 06:20:23'),
(270, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 06:34:34'),
(271, 1, 'omada_setup', 'EAP225 Main → partial', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 06:48:16'),
(272, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 07:21:05'),
(273, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 07:25:47'),
(274, 1, 'login', 'User logged in', '169.58.93.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 07:31:03'),
(275, 1, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 09:07:13'),
(276, 1, 'omada_controller_save', 'OMADA CONTROLLER VPS https://169.58.93.38:8043 (Open API)', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 10:02:03'),
(277, 1, 'omada_api_check', 'OMADA CONTROLLER VPS → 0 failed', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 10:03:29'),
(278, 1, 'omada_setup', 'EAP225 Main → partial', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 10:25:13'),
(279, 1, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 11:17:06'),
(280, 1, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 12:28:31'),
(281, 3, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-19 12:58:29'),
(282, 1, 'admin_broadcast', 'HABARI → 2', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 13:03:35'),
(283, 1, 'admin_broadcast', 'Kuna tatizo upande wa kutoa pesa → 2', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 13:04:35'),
(284, 3, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-19 13:52:45'),
(285, 1, 'login', 'User logged in', '197.186.28.103', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 15:32:30'),
(286, 1, 'login', 'User logged in', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 20:17:32'),
(287, 1, 'login', 'User logged in', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 20:17:36'),
(288, 1, 'logout', 'User logged out', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 21:38:08'),
(289, 1, 'login', 'User logged in', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 21:38:11'),
(290, 1, 'logout', 'User logged out', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 23:05:05'),
(291, 1, 'login', 'User logged in', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 23:05:20'),
(292, 1, 'omada_ssid_create', '6ad5b69e8ec5264bf49149fd BANDO BEI NAFUU → ok', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 23:07:44'),
(293, 1, 'omada_ssid_create', '6ad5b69e8ec5264bf49149fd SKY 5G WIFI → ok', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 23:08:18'),
(294, 1, 'omada_ssid_create', '6ad5b69e8ec5264bf49149fd SKY INTERNET SOLUTION → ok', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 23:08:45'),
(295, 1, 'omada_ssid_create', '6ad5b69e8ec5264bf49149fd SKY 5G KITONGA → ok', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 23:09:35'),
(296, 1, 'omada_ssid_create', '6ad5b69e8ec5264bf49149fd MTAANI BANDO 5G → ok', '197.186.19.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-19 23:09:58'),
(297, 1, 'login', 'User logged in', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 06:52:41'),
(298, 1, 'logout', 'User logged out', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 07:42:25'),
(299, 1, 'login', 'User logged in', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 07:42:28'),
(300, 1, 'payment_recheck', 'SKY2610152312278177 → true', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 08:47:29'),
(301, 1, 'admin_broadcast', 'HABARIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII → 2', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 08:53:12'),
(302, 3, 'login', 'User logged in', '196.249.96.13', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Mobile Safari/537.36', '2026-10-20 10:44:19'),
(303, 1, 'login', 'User logged in', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 11:01:46'),
(304, 1, 'login', 'User logged in', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 11:01:49'),
(305, 1, 'payment_confirm', 'SKY261020140027DEFC TZS 500 0612710364', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 11:48:21'),
(306, 1, 'payment_confirm', 'SKY261020125608AD5E TZS 500 0612710364', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 11:52:23'),
(307, 1, 'sonic_push_test', 'USSD push sent to 0612710364 • order sp_6ad760a210aa6 • HTTP 200 • https://api.sonicpesa.com/api/v1/payment/create_order • {\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"s', '197.186.6.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', '2026-10-20 12:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` enum('info','warning','success','danger') DEFAULT 'info',
  `target_audience` enum('all','sellers','customers','admins') DEFAULT 'all',
  `is_active` tinyint(1) DEFAULT 1,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `api_key` varchar(64) NOT NULL,
  `api_secret` varchar(64) NOT NULL,
  `permissions` text DEFAULT NULL,
  `last_used` datetime DEFAULT NULL,
  `status` enum('active','revoked') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `backup_type` enum('full','partial','incremental') DEFAULT 'full',
  `status` enum('pending','completed','failed') DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_rate_limit`
--

CREATE TABLE `client_rate_limit` (
  `id` int(11) NOT NULL,
  `mac_address` varchar(64) NOT NULL,
  `action` varchar(40) NOT NULL,
  `hit_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_sessions`
--

CREATE TABLE `client_sessions` (
  `id` int(11) NOT NULL,
  `session_token` varchar(64) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mac_address` varchar(17) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `router_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT 0.00,
  `order_id` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_status` enum('pending','completed','failed','cancelled') DEFAULT 'pending',
  `session_status` enum('inactive','active','expired') DEFAULT 'inactive',
  `session_start` datetime DEFAULT NULL,
  `session_end` datetime DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_method` varchar(30) DEFAULT NULL,
  `failure_reason` varchar(500) DEFAULT NULL,
  `sonic_response` text DEFAULT NULL,
  `poll_count` int(11) DEFAULT 0,
  `router_ssid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_sessions`
--

INSERT INTO `client_sessions` (`id`, `session_token`, `phone`, `mac_address`, `ip_address`, `user_agent`, `router_id`, `package_id`, `voucher_id`, `amount`, `order_id`, `transaction_id`, `payment_status`, `session_status`, `session_start`, `session_end`, `duration_minutes`, `created_at`, `updated_at`, `payment_method`, `failure_reason`, `sonic_response`, `poll_count`, `router_ssid`) VALUES
(1, '28897bd5d2d2a857a1b0e0b63ad8f7d587ba26c7240d8843', '255612710364', '', '196.249.96.93', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', 1, 2, NULL, 500.00, NULL, NULL, 'failed', 'inactive', NULL, NULL, 0, '2026-10-04 22:47:29', '2026-10-04 22:47:34', NULL, 'The balance of customer is not enough for the payment9009', NULL, 0, 'SkyTanza-Sample-878'),
(2, '8a8d38e55b897868cc42b50b692c207a7d0f98856cb994b0', '255715645325', '', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 1, 2, NULL, 500.00, 'sp_6ac2d8ff7d170', NULL, 'pending', 'inactive', NULL, NULL, 0, '2026-10-04 22:53:50', '2026-10-04 22:53:56', NULL, NULL, NULL, 0, 'SkyTanza-Sample-878'),
(3, '35668a854a6c1e9ba29700648b4d5f164b3e0515c126ff5e', '255715645325', '', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 1, 2, NULL, 500.00, 'sp_6ac2db3fab02f', NULL, 'pending', 'inactive', NULL, NULL, 0, '2026-10-04 23:03:27', '2026-10-04 23:03:32', NULL, NULL, NULL, 0, 'SkyTanza-Sample-878'),
(4, 'c8440f57342c81f148fe976b8c4dbe7c554e6d2fd526beef', '255715645325', '', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 1, 2, NULL, 500.00, NULL, NULL, 'failed', 'inactive', NULL, NULL, 0, '2026-10-04 23:03:47', '2026-10-04 23:03:52', NULL, 'Rejecting, user having another on going USSD session.', NULL, 0, 'SkyTanza-Sample-878'),
(5, '6271144a4f455fec262363ad1fff08e4e7569b2f22fc3651', '255715645325', '', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 1, 2, NULL, 500.00, 'sp_6ac2db677fb11', NULL, 'pending', 'inactive', NULL, NULL, 0, '2026-10-04 23:04:06', '2026-10-04 23:04:12', NULL, NULL, NULL, 0, 'SkyTanza-Sample-878'),
(6, '41679d58242148c69ce6b445ed4d9c8ec6ea604d401f1136', '255715645325', '', '196.249.96.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 1, 2, NULL, 500.00, 'sp_6ac2dc7e266e0', NULL, 'pending', 'inactive', NULL, NULL, 0, '2026-10-04 23:08:45', '2026-10-04 23:08:50', NULL, NULL, NULL, 0, 'SkyTanza-Sample-878'),
(7, 'f1310f6e58551f5742c04f505628c15ebb04473413b75d48', '255612710364', '', '196.249.120.176', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 1, 2, 1, 500.00, 'sp_6ac3650d5fbbb', '', 'completed', 'active', '2026-10-05 08:51:43', '2026-10-05 09:41:43', 50, '2026-10-05 08:51:24', '2026-10-05 08:51:43', NULL, NULL, NULL, 0, 'SkyTanza-Sample-878'),
(8, '95c29f5d535c30f55540e4f724395297481acd7b267341a9', '255612710334', '', '196.249.93.187', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 1, 2, NULL, 500.00, NULL, NULL, 'failed', 'inactive', NULL, NULL, 0, '2026-10-05 09:01:31', '2026-10-05 09:01:36', NULL, 'The balance of customer is not enough for the payment9009', NULL, 0, 'SkyTanza-Sample-878'),
(9, '8919a12af1c1418c2f20f10cf5dd327a96c0ab3d31b319ed', '255612710364', '', '196.249.93.187', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 1, 2, NULL, 500.00, 'sp_6ac3679a4957a', NULL, 'pending', 'inactive', NULL, NULL, 0, '2026-10-05 09:02:17', '2026-10-05 09:02:22', NULL, NULL, NULL, 0, 'SkyTanza-Sample-878'),
(10, '91e25171aa0b21732b89c795b920b07711853a3144519671', '255612710364', '', '196.249.93.187', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Mobile Safari/537.36', 2, 3, 2, 500.00, 'sp_6ac37cd319414', '', 'completed', 'active', '2026-10-05 10:33:08', '2026-10-05 14:33:08', 240, '2026-10-05 10:32:50', '2026-10-05 10:33:08', NULL, NULL, NULL, 0, 'SkyTanza-Sample-842');

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `status` enum('pending','paid','cancelled') DEFAULT 'pending',
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `exchange_rate` decimal(15,6) DEFAULT 1.000000,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_profiles`
--

CREATE TABLE `customer_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `first_seen` datetime NOT NULL,
  `last_seen` datetime DEFAULT NULL,
  `total_sessions` int(11) DEFAULT 0,
  `total_spent` decimal(15,2) DEFAULT 0.00,
  `total_data_used_mb` decimal(15,2) DEFAULT 0.00,
  `avg_session_minutes` int(11) DEFAULT 0,
  `favorite_package_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `is_vip` tinyint(1) DEFAULT 0,
  `is_blocked` tinyint(1) DEFAULT 0,
  `block_reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enforcer_log`
--

CREATE TABLE `enforcer_log` (
  `id` int(11) NOT NULL,
  `ran_at` datetime DEFAULT current_timestamp(),
  `routers_checked` int(11) DEFAULT 0,
  `sessions_expired` int(11) DEFAULT 0,
  `sessions_disconnected` int(11) DEFAULT 0,
  `errors` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_articles`
--

CREATE TABLE `help_articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category` varchar(100) DEFAULT 'general',
  `tags` varchar(255) DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `helpful_yes` int(11) DEFAULT 0,
  `helpful_no` int(11) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  `is_published` tinyint(1) DEFAULT 1,
  `author_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotspot_clients`
--

CREATE TABLE `hotspot_clients` (
  `id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `mac_address` varchar(17) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `bytes_in` bigint(20) DEFAULT 0,
  `bytes_out` bigint(20) DEFAULT 0,
  `uptime_seconds` bigint(20) DEFAULT 0,
  `is_authorized` tinyint(1) DEFAULT 0,
  `session_id` int(11) DEFAULT NULL,
  `last_seen` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_adjustments`
--

CREATE TABLE `hs_adjustments` (
  `id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `minutes` int(11) NOT NULL,
  `old_value` varchar(40) DEFAULT NULL,
  `new_value` varchar(40) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_adjustments`
--

INSERT INTO `hs_adjustments` (`id`, `voucher_id`, `seller_id`, `minutes`, `old_value`, `new_value`, `reason`, `created_at`) VALUES
(1, 241, 1, 15, '60', '75', 'Quick +15m', '2026-10-15 18:19:11'),
(2, 397, 1, 15, '60', '75', 'Bulk adjustment', '2026-10-20 06:59:52'),
(3, 397, 1, -15, '75', '60', 'Quick -15m', '2026-10-20 07:20:37'),
(4, 397, 1, -15, '60', '45', 'Quick -15m', '2026-10-20 07:20:37'),
(5, 397, 1, -15, '45', '30', 'Quick -15m', '2026-10-20 07:20:38'),
(6, 397, 1, -15, '30', '15', 'Quick -15m', '2026-10-20 07:20:38'),
(7, 397, 1, -15, '15', '1', 'Quick -15m', '2026-10-20 07:20:38'),
(8, 397, 1, -15, '1', '1', 'Quick -15m', '2026-10-20 07:20:38'),
(9, 397, 1, -15, '1', '1', 'Quick -15m', '2026-10-20 07:20:38'),
(10, 397, 1, -15, '1', '1', 'Quick -15m', '2026-10-20 07:20:39'),
(11, 397, 1, -15, '1', '1', 'Quick -15m', '2026-10-20 07:20:39'),
(12, 397, 1, -15, '1', '1', 'Quick -15m', '2026-10-20 07:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `hs_blocked_macs`
--

CREATE TABLE `hs_blocked_macs` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `mac` varchar(17) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_controllers`
--

CREATE TABLE `hs_controllers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ctype` enum('local','cloud') DEFAULT 'local',
  `base_url` varchar(255) NOT NULL,
  `omadac_id` varchar(64) DEFAULT NULL,
  `client_id` varchar(128) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `verify_ssl` tinyint(1) DEFAULT 0,
  `inform_url` varchar(512) DEFAULT NULL,
  `controller_ver` varchar(40) DEFAULT NULL,
  `api_ver` varchar(20) DEFAULT NULL,
  `access_token` text DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `token_expires` datetime DEFAULT NULL,
  `last_ok` datetime DEFAULT NULL,
  `last_error` varchar(255) DEFAULT NULL,
  `last_sync` datetime DEFAULT NULL,
  `sites_json` mediumtext DEFAULT NULL,
  `paths_json` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cloud_host` varchar(120) DEFAULT NULL,
  `cloud_dport` int(11) DEFAULT 29810,
  `cloud_mport` int(11) DEFAULT 443,
  `region` varchar(16) DEFAULT NULL,
  `site_dev_user` varchar(64) DEFAULT NULL,
  `site_dev_pass` varchar(255) DEFAULT NULL,
  `conn_mode` varchar(10) NOT NULL DEFAULT 'auto',
  `direct_fail_at` datetime DEFAULT NULL,
  `last_via` varchar(10) DEFAULT NULL,
  `shared_keys` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_controllers`
--

INSERT INTO `hs_controllers` (`id`, `user_id`, `name`, `ctype`, `base_url`, `omadac_id`, `client_id`, `client_secret`, `verify_ssl`, `inform_url`, `controller_ver`, `api_ver`, `access_token`, `refresh_token`, `token_expires`, `last_ok`, `last_error`, `last_sync`, `sites_json`, `paths_json`, `created_at`, `cloud_host`, `cloud_dport`, `cloud_mport`, `region`, `site_dev_user`, `site_dev_pass`, `conn_mode`, `direct_fail_at`, `last_via`, `shared_keys`) VALUES
(17, 1, 'OMADA CONTROLLER VPS', 'local', 'https://169.58.93.38:8043', 'aef4abb4f65c9d7b1734351cdcf3542b', 'fb0503ad5ddb4d35bbf5dc16e488d12c', '2b042234320d42e2b2b5973bf73bf423', 0, 'omada://169.58.93.38?dPort=29810&mPort=29814&omadacId=cb886e281a1029cbdafb1c93f14ba1', '5.15.24.19', '3', 'AT-FLXxhQaHAGgjvMot1tb9Hb0sR1VvUS6f', 'RT-uUQOTREIjHk5PgtG9gBlL7HbIlTWf49d', '2026-10-20 17:02:39', '2026-10-20 16:20:51', NULL, '2026-10-20 16:20:51', '[{\"id\":\"6ad5b69e8ec5264bf49149fd\",\"name\":\"EAP225 Main\"}]', '{\"spec\":true,\"found\":{\"sites\":\"/v1/sites\",\"devices\":\"/v1/sites/{siteId}/devices\",\"clients\":\"/v1/sites/{siteId}/clients\",\"adopt\":\"/v1/sites/{siteId}/devices/{deviceMac}/start-adopt\",\"adopt_result\":\"/v1/sites/{siteId}/devices/{deviceMac}/adopt-result\",\"reboot\":\"/v1/sites/{siteId}/devices/{deviceMac}/reboot\",\"locate\":\"/v1/sites/{siteId}/devices/{deviceMac}/locate\",\"add_by_key\":\"/v1/sites/{siteId}/multi-devices/devicekey-add\",\"add_status\":\"/v1/sites/{siteId}/multi-devices/add/{operateId}/status\",\"client_block\":\"/v1/sites/{siteId}/clients/{clientMac}/block\",\"client_unblock\":\"/v1/sites/{siteId}/clients/{clientMac}/unblock\",\"client_reconnect\":\"/v1/sites/{siteId}/clients/{clientMac}/reconnect\"},\"at\":\"2026-10-19T13:03:29+03:00\"}', '2026-10-15 08:03:05', NULL, 29810, 443, NULL, 'skyadmin', 'v1:FyN6e10+rB2df4pDzeNMzAdcx1+MtsEngi1tYQZpw5PgSnNXwPrhpAGT', 'relay', NULL, 'relay', 0),
(18, 3, 'Omada Controller 169.58.93.38', 'local', 'https://169.58.93.38:8043', 'cb886f2e281a1029cbdafb1c93f14ba1', 'e297a520af804accbfaf57e0a26057db', '3f5eedb2942d4977b7f93408b251eb2a', 0, 'omada://169.58.93.38?dPort=29810&mPort=29814&omadacId=cb886e281a1029cbdafb1c93f14ba1', '5.15.24.19', '3', 'AT-lRzQKWFGL59A4sdEYanujImoYk3ywpEP', 'RT-7oWqk4FN9M1mWcYzGJvMUPMM120RNQNK', '2026-10-16 12:46:33', '2026-10-16 10:46:35', NULL, '2026-10-20 16:20:51', NULL, NULL, '2026-10-15 13:45:13', NULL, 29810, 443, NULL, NULL, NULL, 'auto', NULL, 'relay', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hs_dae_queue`
--

CREATE TABLE `hs_dae_queue` (
  `id` int(11) NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `acct_session_id` varchar(64) DEFAULT NULL,
  `nas_ip` varchar(45) DEFAULT NULL,
  `framed_ip` varchar(45) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `status` enum('pending','sent','done','failed') DEFAULT 'pending',
  `attempts` int(11) DEFAULT 0,
  `last_result` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_dae_queue`
--

INSERT INTO `hs_dae_queue` (`id`, `voucher_id`, `session_id`, `username`, `mac`, `acct_session_id`, `nas_ip`, `framed_ip`, `reason`, `status`, `attempts`, `last_result`, `created_at`, `updated_at`) VALUES
(1, 397, 350, 'B4MTRMJD', '36:2E:83:D5:E3:C5', '73e7d80055c7408a83bbdbd6605b8120', '169.58.93.38', '192.168.18.9', 'Time reduced by seller', 'failed', 3, 'No reply from 169.58.93.38:3799 (is UDP 3799 reachable?)', '2026-10-20 07:20:38', '2026-10-20 07:21:19'),
(2, 397, 350, 'B4MTRMJD', '36:2E:83:D5:E3:C5', '73e7d80055c7408a83bbdbd6605b8120', '169.58.93.38', '192.168.18.9', 'Time reduced by seller', 'failed', 3, 'No reply from 169.58.93.38:3799 (is UDP 3799 reachable?)', '2026-10-20 07:21:21', '2026-10-20 07:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `hs_devices`
--

CREATE TABLE `hs_devices` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `model` varchar(50) DEFAULT 'EAP225',
  `ap_mac` varchar(17) NOT NULL,
  `ssid` varchar(64) DEFAULT NULL,
  `site_name` varchar(100) DEFAULT 'Default',
  `controller_url` varchar(255) DEFAULT NULL,
  `lipa_info` varchar(255) DEFAULT NULL,
  `nas_ip` varchar(45) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `nas_id` varchar(32) DEFAULT NULL,
  `radius_secret` varchar(64) DEFAULT NULL,
  `acct_secret` varchar(64) DEFAULT NULL,
  `radius_src_ip` varchar(45) DEFAULT NULL,
  `radius_last_auth` datetime DEFAULT NULL,
  `dae_target` varchar(64) DEFAULT NULL,
  `secrets_rotated_at` datetime DEFAULT NULL,
  `omada_nas_id` varchar(64) DEFAULT NULL,
  `nas_learned_at` datetime DEFAULT NULL,
  `nas_seen` varchar(64) DEFAULT NULL,
  `controller_id` int(11) DEFAULT NULL,
  `omada_site_id` varchar(64) DEFAULT NULL,
  `omada_status` varchar(32) DEFAULT NULL,
  `omada_status_at` datetime DEFAULT NULL,
  `omada_online_at` datetime DEFAULT NULL,
  `omada_clients` int(11) DEFAULT 0,
  `omada_model` varchar(64) DEFAULT NULL,
  `omada_ip` varchar(45) DEFAULT NULL,
  `omada_fw` varchar(80) DEFAULT NULL,
  `omada_uptime` varchar(64) DEFAULT NULL,
  `inform_host` varchar(120) DEFAULT NULL,
  `inform_dport` int(11) DEFAULT 29810,
  `inform_mport` int(11) DEFAULT 443,
  `omada_serial` varchar(40) DEFAULT NULL,
  `omada_device_key` varchar(64) DEFAULT NULL,
  `ssid_id` varchar(64) DEFAULT NULL,
  `radius_profile_id` varchar(64) DEFAULT NULL,
  `portal_id` varchar(64) DEFAULT NULL,
  `provision_status` enum('idle','running','done','failed') DEFAULT 'idle',
  `provision_at` datetime DEFAULT NULL,
  `provision_error` varchar(255) DEFAULT NULL,
  `omada_sn` varchar(32) DEFAULT NULL,
  `omada_wlan_id` varchar(64) DEFAULT NULL,
  `omada_ssid_id` varchar(64) DEFAULT NULL,
  `omada_radius_id` varchar(64) DEFAULT NULL,
  `omada_portal_id` varchar(64) DEFAULT NULL,
  `omada_vgroup_id` varchar(64) DEFAULT NULL,
  `voucher_mode` varchar(10) NOT NULL DEFAULT 'radius',
  `prov_state` varchar(24) DEFAULT NULL,
  `prov_log` mediumtext DEFAULT NULL,
  `prov_at` datetime DEFAULT NULL,
  `prov_opts` text DEFAULT NULL,
  `prov_user` varchar(64) DEFAULT NULL,
  `prov_pass` varchar(255) DEFAULT NULL,
  `prov_adopt_at` datetime DEFAULT NULL,
  `router_model_id` int(11) DEFAULT NULL,
  `health_json` mediumtext DEFAULT NULL,
  `health_at` datetime DEFAULT NULL,
  `portal_seen_at` datetime DEFAULT NULL,
  `portal_target` varchar(160) DEFAULT NULL,
  `extra_ssids` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_devices`
--

INSERT INTO `hs_devices` (`id`, `user_id`, `device_name`, `model`, `ap_mac`, `ssid`, `site_name`, `controller_url`, `lipa_info`, `nas_ip`, `location`, `last_seen`, `is_active`, `created_at`, `nas_id`, `radius_secret`, `acct_secret`, `radius_src_ip`, `radius_last_auth`, `dae_target`, `secrets_rotated_at`, `omada_nas_id`, `nas_learned_at`, `nas_seen`, `controller_id`, `omada_site_id`, `omada_status`, `omada_status_at`, `omada_online_at`, `omada_clients`, `omada_model`, `omada_ip`, `omada_fw`, `omada_uptime`, `inform_host`, `inform_dport`, `inform_mport`, `omada_serial`, `omada_device_key`, `ssid_id`, `radius_profile_id`, `portal_id`, `provision_status`, `provision_at`, `provision_error`, `omada_sn`, `omada_wlan_id`, `omada_ssid_id`, `omada_radius_id`, `omada_portal_id`, `omada_vgroup_id`, `voucher_mode`, `prov_state`, `prov_log`, `prov_at`, `prov_opts`, `prov_user`, `prov_pass`, `prov_adopt_at`, `router_model_id`, `health_json`, `health_at`, `portal_seen_at`, `portal_target`, `extra_ssids`) VALUES
(27, 1, 'EAP225 Main', 'EAP225', 'A8:29:DC:10:5C:18', 'SKY HOTSPOT', 'EAP225 Main', 'https://wifi.skytanzania.co.tz', '', '169.58.93.38', 'CHAMAZI', '2026-10-20 16:23:07', 1, '2026-10-19 06:48:10', 'SKYGA3KUMASU', 'ebRWqrCfrgHVkM9Zwvvw', 'CecEDyj237gYQPGKJPbU', '169.58.93.38', '2026-10-20 15:54:45', '', '2026-10-19 09:48:10', 'TP-Link', '2026-10-20 01:29:05', NULL, 17, '6ad5b69e8ec5264bf49149fd', 'connected', '2026-10-20 16:20:51', '2026-10-20 16:20:51', 0, 'EAP225-Outdoor(EU) v3.0', '192.168.18.3', '5.2.4 Build 20251024 Rel. 63790', '4h 2m 14s', NULL, 29810, 443, NULL, NULL, NULL, NULL, NULL, 'idle', NULL, NULL, NULL, '6ad5b69f8ec5264bf4914a17', '6ad5bd2e8a1f4c475edbf804', '6ad5bd2c8a1f4c475edbf802', NULL, NULL, 'radius', 'done', '[{\"step\":\"controller\",\"status\":\"ok\",\"msg\":\"Open API connected • OMADA CONTROLLER VPS\",\"at\":\"13:25:11\"},{\"step\":\"site\",\"status\":\"ok\",\"msg\":\"Using site: EAP225 Main\",\"at\":\"13:25:11\"},{\"step\":\"device\",\"status\":\"ok\",\"msg\":\"EAP225 is already in this site • CONNECTED\",\"at\":\"13:25:11\"},{\"step\":\"radius\",\"status\":\"ok\",\"msg\":\"RADIUS profile ready (updated): SkyRadius-27 → 169.58.93.38:1812/1813\",\"at\":\"13:25:12\"},{\"step\":\"ssid\",\"status\":\"ok\",\"msg\":\"SSID ready: SKY HOTSPOT\",\"at\":\"13:25:12\"},{\"step\":\"portal\",\"status\":\"fail\",\"msg\":\"POST /sites/6ad5b69e8ec5264bf49149fd/portal → Parameter [portalCustomize] should not be null. (errorCode -1001, HTTP 200)\",\"at\":\"13:25:13\"},{\"step\":\"vouchers\",\"status\":\"skip\",\"msg\":\"No vouchers requested\",\"at\":\"13:25:13\"}]', '2026-10-19 13:25:13', '{\"site_mode\":\"new\",\"site_name\":\"EAP225 Main\",\"scenario\":\"\",\"sn\":\"\",\"voucher_mode\":\"radius\"}', 'skytanzania', '', NULL, 1, '[{\"key\":\"website\",\"status\":\"ok\",\"msg\":\"https://wifi.skytanzania.co.tz/index\",\"fix\":\"admin\"},{\"key\":\"radius_ip\",\"status\":\"ok\",\"msg\":\"169.58.93.38 • UDP 1812/1813\",\"fix\":\"admin\"},{\"key\":\"radius_box\",\"status\":\"ok\",\"msg\":\"v6.1.2 • skyradius • from 169.58.93.38\",\"fix\":\"admin\"},{\"key\":\"router\",\"status\":\"ok\",\"msg\":\"Passwords ready • NAS ID SKYGA3KUMASU\",\"fix\":\"\"},{\"key\":\"cloud\",\"status\":\"ok\",\"msg\":\"OMADA CONTROLLER VPS • 169.58.93.38\",\"fix\":\"link\"},{\"key\":\"relay\",\"status\":\"ok\",\"msg\":\"Via RADIUS server (skyradius) • v6.1.2\",\"fix\":\"admin\"},{\"key\":\"api\",\"status\":\"ok\",\"msg\":\"Open API connected • Omada ID aef4abb4f65c9d7b1734351cdcf3542b\",\"fix\":\"\"},{\"key\":\"site\",\"status\":\"ok\",\"msg\":\"EAP225 Main\",\"fix\":\"\"},{\"key\":\"device\",\"status\":\"fail\",\"msg\":\"ADOPT FAILED • EAP225-Outdoor(EU) v3.0 • 192.168.18.2 • 0 client(s)\",\"fix\":\"adopt\"},{\"key\":\"ssid\",\"status\":\"ok\",\"msg\":\"SKY HOTSPOT • Guest • Open\",\"fix\":\"\"},{\"key\":\"radius_profile\",\"status\":\"ok\",\"msg\":\"SkyRadius-27 → 169.58.93.38:1812/1813\",\"fix\":\"\"},{\"key\":\"portal\",\"status\":\"fail\",\"msg\":\"The portal is missing in Omada\",\"fix\":\"setup\"},{\"key\":\"preauth\",\"status\":\"fail\",\"msg\":\"The website is not in Pre-Authentication Access — phones cannot open the portal\",\"fix\":\"setup\"},{\"key\":\"portal_reach\",\"status\":\"warn\",\"msg\":\"No phone has opened the portal from this EAP225 yet — join the SSID with a phone to test\",\"fix\":\"sheet\"},{\"key\":\"radius_traffic\",\"status\":\"warn\",\"msg\":\"No RADIUS request from this EAP225 in the last 10 minutes\",\"fix\":\"sheet\"}]', '2026-10-19 09:48:18', '2026-10-20 15:53:49', 'https://169.58.93.38:8843', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_omada_jobs`
--

CREATE TABLE `hs_omada_jobs` (
  `id` bigint(20) NOT NULL,
  `ctrl_id` int(11) DEFAULT NULL,
  `kind` varchar(8) NOT NULL DEFAULT 'http',
  `method` varchar(8) NOT NULL DEFAULT 'GET',
  `url` varchar(1024) NOT NULL DEFAULT '',
  `host` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `headers` mediumtext DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `timeout_s` int(11) NOT NULL DEFAULT 10,
  `verify_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('pending','taken','done','expired') NOT NULL DEFAULT 'pending',
  `claim` varchar(32) DEFAULT NULL,
  `res_code` int(11) DEFAULT NULL,
  `res_body` mediumtext DEFAULT NULL,
  `res_error` varchar(500) DEFAULT NULL,
  `res_ms` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `taken_at` datetime DEFAULT NULL,
  `done_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_omada_sites`
--

CREATE TABLE `hs_omada_sites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ctrl_id` int(11) DEFAULT NULL,
  `site_id` varchar(64) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_omada_vgroups`
--

CREATE TABLE `hs_omada_vgroups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ctrl_id` int(11) DEFAULT NULL,
  `site_id` varchar(64) NOT NULL,
  `group_id` varchar(64) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `batch` varchar(20) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_orders`
--

CREATE TABLE `hs_orders` (
  `id` int(11) NOT NULL,
  `order_ref` varchar(40) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `client_mac` varchar(17) DEFAULT NULL,
  `status` enum('pending','paid','failed','expired','cancelled') NOT NULL DEFAULT 'pending',
  `voucher_id` int(11) DEFAULT NULL,
  `gateway_ref` varchar(100) DEFAULT NULL,
  `gateway_response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paid_at` datetime DEFAULT NULL,
  `sonic_order_id` varchar(100) DEFAULT NULL,
  `sonic_transaction_id` varchar(100) DEFAULT NULL,
  `sonic_status` varchar(20) DEFAULT 'pending',
  `sonic_amount` int(11) DEFAULT NULL,
  `package_type` varchar(20) DEFAULT 'wifi',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `raw_response` text DEFAULT NULL,
  `client_ip` varchar(45) DEFAULT NULL,
  `ssid` varchar(64) DEFAULT NULL,
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `admin_note` varchar(500) DEFAULT NULL,
  `reconnect_done` tinyint(1) NOT NULL DEFAULT 0,
  `reconnect_at` datetime DEFAULT NULL,
  `sp_status` varchar(30) DEFAULT NULL,
  `sp_transid` varchar(100) DEFAULT NULL,
  `sp_channel` varchar(50) DEFAULT NULL,
  `sp_checked_at` datetime DEFAULT NULL,
  `sp_check_count` int(11) NOT NULL DEFAULT 0,
  `webhook_at` datetime DEFAULT NULL,
  `fulfill_error` varchar(500) DEFAULT NULL,
  `fulfill_attempts` int(11) NOT NULL DEFAULT 0,
  `pkg_name` varchar(100) DEFAULT NULL,
  `pkg_minutes` int(11) DEFAULT NULL,
  `pkg_mode` varchar(12) DEFAULT NULL,
  `pkg_data_mb` int(11) DEFAULT NULL,
  `pkg_down` decimal(7,2) DEFAULT NULL,
  `pkg_up` decimal(7,2) DEFAULT NULL,
  `pkg_devices` int(11) DEFAULT NULL,
  `pkg_valid_days` int(11) DEFAULT NULL,
  `sp_event` varchar(40) DEFAULT NULL,
  `sp_webhook_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_orders`
--

INSERT INTO `hs_orders` (`id`, `order_ref`, `seller_id`, `package_id`, `device_id`, `phone`, `amount`, `client_mac`, `status`, `voucher_id`, `gateway_ref`, `gateway_response`, `created_at`, `paid_at`, `sonic_order_id`, `sonic_transaction_id`, `sonic_status`, `sonic_amount`, `package_type`, `start_date`, `end_date`, `updated_at`, `raw_response`, `client_ip`, `ssid`, `confirmed_by`, `confirmed_at`, `admin_note`, `reconnect_done`, `reconnect_at`, `sp_status`, `sp_transid`, `sp_channel`, `sp_checked_at`, `sp_check_count`, `webhook_at`, `fulfill_error`, `fulfill_attempts`, `pkg_name`, `pkg_minutes`, `pkg_mode`, `pkg_data_mb`, `pkg_down`, `pkg_up`, `pkg_devices`, `pkg_valid_days`, `sp_event`, `sp_webhook_count`) VALUES
(1, 'SKY2610132243289A82', 1, 1, 10, '0612718364', 600.00, '16:CA:B7:5D:D3:13', 'expired', NULL, NULL, NULL, '2026-10-13 19:43:28', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(2, 'SKY261015140014EC03', 1, 1, 23, '0762080137', 600.00, '12:68:32:86:B3:3D', 'expired', NULL, NULL, NULL, '2026-10-15 11:00:14', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(3, 'SKY2610152201329210', 1, 1, 23, '0612710364', 600.00, '84:C5:A6:78:CA:C6', 'expired', NULL, NULL, NULL, '2026-10-15 19:01:32', NULL, NULL, NULL, 'pending', 600, '0', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(4, 'SKY261015220557A386', 1, 1, 23, '0612710364', 600.00, '84:C5:A6:78:CA:C6', 'expired', NULL, NULL, NULL, '2026-10-15 19:05:57', NULL, NULL, NULL, 'pending', 600, '0', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(5, 'SKY261015221230EDFF', 1, 1, 23, '0612710364', 600.00, '84:C5:A6:78:CA:C6', 'expired', NULL, 'sp_6ad1259f1b550', '{\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"sp_6ad1259f1b550\",\"reference\":\"S20768193142\",\"amount\":600,\"currency\":\"TZS\",\"payment_status\":\"PENDING\",\"status\":\"PENDING\",\"creation_date\":\"2026-10-15 22:13:18\",\"transid\":null,\"channel\":null,\"msisdn\":\"255612710364\",\"order_status_data\":{\"order_id\":\"sp_6ad1259f1b550\",\"creation_date\":\"2026-10-15 22:13:18\",\"amount\":\"600\",\"payment_status\":\"PENDING\",\"transid\":null,\"channel\":null,\"reference\":null,\"msisdn\":null}}}', '2026-10-15 19:12:30', NULL, 'sp_6ad1259f1b550', NULL, 'pending', 600, '0', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(6, 'SKY261015222441CFEC', 1, 1, 23, '0612710364', 200.00, '12:68:32:86:B3:3D', 'expired', NULL, 'sp_6ad12879cd35e', '{\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"sp_6ad12879cd35e\",\"reference\":\"S20768205733\",\"amount\":200,\"currency\":\"TZS\",\"payment_status\":\"PENDING\",\"status\":\"PENDING\",\"creation_date\":\"2026-10-15 22:25:29\",\"transid\":null,\"channel\":null,\"msisdn\":\"255612710364\",\"order_status_data\":{\"order_id\":\"sp_6ad12879cd35e\",\"creation_date\":\"2026-10-15 22:25:29\",\"amount\":\"200\",\"payment_status\":\"PENDING\",\"transid\":null,\"channel\":null,\"reference\":null,\"msisdn\":null}}}', '2026-10-15 19:24:41', NULL, 'sp_6ad12879cd35e', NULL, 'pending', 200, '0', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(7, 'SKY261015223224ABCF', 1, 1, 23, '0612710364', 200.00, '12:68:32:86:B3:3D', 'expired', NULL, 'sp_6ad12a49555c9', '{\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"sp_6ad12a49555c9\",\"reference\":\"S20768212145\",\"amount\":200,\"currency\":\"TZS\",\"payment_status\":\"PENDING\",\"status\":\"PENDING\",\"creation_date\":\"2026-10-15 22:33:13\",\"transid\":null,\"channel\":null,\"msisdn\":\"255612710364\",\"order_status_data\":{\"order_id\":\"sp_6ad12a49555c9\",\"creation_date\":\"2026-10-15 22:33:13\",\"amount\":\"200\",\"payment_status\":\"PENDING\",\"transid\":null,\"channel\":null,\"reference\":null,\"msisdn\":null}}}', '2026-10-15 19:32:24', NULL, 'sp_6ad12a49555c9', NULL, 'pending', 200, '0', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(8, 'SKY261015224301A9EC', 1, 1, 23, '0612710364', 200.00, '12:68:32:86:B3:3D', 'expired', NULL, 'sp_6ad12cc6b111f', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad12cc6b111f\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287817958432046\",\"reference\":\"1932446918\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T19:43:07.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad12cc6b111f\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', '2026-10-15 19:43:01', NULL, 'sp_6ad12cc6b111f', NULL, 'pending', 200, '0', NULL, NULL, '2026-10-20 11:26:24', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad12cc6b111f\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287817958432046\",\"reference\":\"1932446918\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T19:43:07.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad12cc6b111f\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(9, 'SKY26101522535786F9', 1, 1, 23, '0612710364', 200.00, '84:C5:A6:78:CA:C6', 'expired', NULL, 'sp_6ad12f56d84b0', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad12f56d84b0\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287824578392201\",\"reference\":\"1932457894\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T19:54:06.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad12f56d84b0\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', '2026-10-15 19:53:57', NULL, 'sp_6ad12f56d84b0', NULL, 'pending', 200, '0', NULL, NULL, '2026-10-20 11:26:24', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad12f56d84b0\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287824578392201\",\"reference\":\"1932457894\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T19:54:06.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad12f56d84b0\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(10, 'SKY261015225704CA42', 1, 1, 23, '0612710364', 200.00, '12:68:32:86:B3:3D', 'expired', NULL, NULL, NULL, '2026-10-15 19:57:04', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(11, 'SKY2610152258446077', 1, 1, 23, '0612710364', 200.00, '84:C5:A6:78:CA:C6', 'expired', NULL, NULL, NULL, '2026-10-15 19:58:44', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(12, 'SKY261015225955F7F3', 1, 1, 23, '0612710364', 200.00, '84:C5:A6:78:CA:C6', 'expired', NULL, 'sp_6ad130bbe3c81', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad130bbe3c81\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287828128350883\",\"reference\":\"1932463099\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T20:00:00.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad130bbe3c81\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', '2026-10-15 19:59:55', NULL, 'sp_6ad130bbe3c81', NULL, 'pending', 200, '0', NULL, NULL, '2026-10-20 11:26:24', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad130bbe3c81\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287828128350883\",\"reference\":\"1932463099\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T20:00:00.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad130bbe3c81\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(13, 'SKY2610152312278177', 1, 1, 23, '0612710364', 200.00, '12:68:32:86:B3:3D', 'expired', NULL, 'sp_6ad133ac0d33c', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad133ac0d33c\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287835638332942\",\"reference\":\"1932476401\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T20:12:33.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad133ac0d33c\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', '2026-10-15 20:12:27', NULL, 'sp_6ad133ac0d33c', NULL, 'pending', 200, '0', NULL, NULL, '2026-10-20 11:26:24', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad133ac0d33c\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287835638332942\",\"reference\":\"1932476401\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T20:12:33.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad133ac0d33c\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', NULL, NULL, 1, '2026-10-20 11:47:29', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(14, 'SKY261015232612541A', 1, 1, 23, '0612710364', 200.00, '12:68:32:86:B3:3D', 'paid', 285, 'sp_6ad136e55ea68', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad136e55ea68\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287843878382811\",\"reference\":\"1932489442\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T20:26:20.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad136e55ea68\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', '2026-10-15 20:26:12', '2026-10-15 23:26:35', 'sp_6ad136e55ea68', '6287843878382811', 'completed', 200, '0', NULL, NULL, '2026-10-20 11:26:24', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad136e55ea68\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287843878382811\",\"reference\":\"1932489442\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T20:26:20.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad136e55ea68\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(15, 'SKY261015233308DDC9', 1, 1, 23, '0612710364', 200.00, '12:68:32:86:B3:3D', 'paid', 286, 'sp_6ad13885a9d8f', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad13885a9d8f\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287848038440713\",\"reference\":\"1932496499\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T20:33:14.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad13885a9d8f\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', '2026-10-15 20:33:08', '2026-10-15 23:33:28', 'sp_6ad13885a9d8f', '6287848038440713', 'completed', 200, '0', NULL, NULL, '2026-10-20 11:26:24', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad13885a9d8f\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6287848038440713\",\"reference\":\"1932496499\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-15T20:33:14.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad13885a9d8f\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(16, 'SKY2610161140540D89', 1, 1, 23, '0612710364', 200.00, 'AA:47:E3:45:8F:3C', 'paid', 289, 'sp_6ad1e317719d2', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad1e317719d2\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6288420728401636\",\"reference\":\"1933224344\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-16T08:41:01.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad1e317719d2\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', '2026-10-16 08:40:54', '2026-10-16 11:41:38', 'sp_6ad1e317719d2', '6288420728401636', 'completed', 200, '0', NULL, NULL, '2026-10-20 11:26:24', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad1e317719d2\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6288420728401636\",\"reference\":\"1933224344\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-16T08:41:01.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad1e317719d2\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(17, 'SKY2610161156062924', 1, 1, 23, '0612710364', 500.00, '16:7B:95:67:FD:91', 'expired', NULL, NULL, NULL, '2026-10-16 08:56:06', NULL, NULL, NULL, 'pending', 500, '0', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(18, 'SKY26101611572578A2', 1, 1, 23, '0612710364', 200.00, '16:7B:95:67:FD:91', 'paid', 290, 'sp_6ad1e6f5c2684', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad1e6f5c2684\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6288430578431364\",\"reference\":\"1933240857\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-16T08:57:30.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad1e6f5c2684\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', '2026-10-16 08:57:25', '2026-10-16 11:57:43', 'sp_6ad1e6f5c2684', '6288430578431364', 'completed', 200, '0', NULL, NULL, '2026-10-20 11:26:24', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad1e6f5c2684\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6288430578431364\",\"reference\":\"1933240857\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-16T08:57:30.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad1e6f5c2684\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@skytanza.com\",\"buyer_name\":\"WiFi Customer\"}}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(19, 'SKY261016130036119F', 1, 1, 23, '0612710364', 200.00, '26:86:02:E6:AF:5E', 'expired', NULL, NULL, NULL, '2026-10-16 10:00:36', NULL, NULL, NULL, 'pending', 200, '0', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(20, 'SKY261018182139E5F3', 1, 1, 23, '0612710364', 200.00, '84:C5:A6:78:CA:C6', 'expired', NULL, NULL, NULL, '2026-10-18 15:21:39', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 11:26:24', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(21, 'SKY261020122923BB61', 1, 1, 27, '0612710364', 200.00, '84:C5:A6:78:CA:C6', 'expired', NULL, 'sp_6ad73473ef476', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '2026-10-20 09:29:23', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 13:21:40', NULL, '197.186.6.17', 'SKY HOTSPORT COMPANY', NULL, NULL, NULL, 0, NULL, 'PENDING', 'S20774809696', NULL, '2026-10-20 16:21:40', 323, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(22, 'SKY261020125608AD5E', 1, 1, 27, '0612710364', 500.00, '3A:FC:9E:B9:64:BD', 'paid', 549, 'sp_6ad73ab8d3fe3', '{\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"sp_6ad73ab8d3fe3\",\"reference\":\"S20774836626\",\"amount\":500,\"currency\":\"TZS\",\"payment_status\":\"PENDING\",\"status\":\"PENDING\",\"creation_date\":\"2026-10-20 12:56:55\",\"transid\":null,\"channel\":null,\"msisdn\":\"255612710364\",\"order_status_data\":{\"order_id\":\"sp_6ad73ab8d3fe3\",\"creation_date\":\"2026-10-20 12:56:55\",\"amount\":\"500\",\"payment_status\":\"PENDING\",\"transid\":null,\"channel\":null,\"reference\":null,\"msisdn\":null}}}', '2026-10-20 09:56:08', '2026-10-20 14:52:23', NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 11:53:42', NULL, '197.186.6.17', 'BANDO BEI NAFUU', 1, '2026-10-20 14:52:23', NULL, 1, '2026-10-20 14:53:42', 'CONFIRMED', '6292465868441454', 'HALOPESATZ', '2026-10-20 14:51:37', 15, NULL, '', 2, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(23, 'SKY261020140027DEFC', 1, 1, 27, '0612710364', 500.00, '26:86:02:E6:AF:5E', 'paid', 548, 'sp_6ad749cc77393', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad749cc77393\",\"payment_status\":\"PENDING\",\"amount\":500,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774901442\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T11:00:33.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad749cc77393\",\"status\":\"PENDING\",\"amount\":\"500.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '2026-10-20 11:00:27', '2026-10-20 14:48:21', NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 11:48:21', NULL, '197.186.6.17', 'SKY HOTSPOT', 1, '2026-10-20 14:48:21', NULL, 0, NULL, 'CONFIRMED', '6292504388432269', 'HALOPESATZ', '2026-10-20 14:48:19', 48, NULL, '', 3, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(24, 'SKY2610201456033E26', 1, 1, 27, '0612710364', 500.00, '3A:BB:1F:B4:0C:3E', 'pending', NULL, NULL, 'PUSH FAILED: HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '2026-10-20 11:56:03', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 11:56:04', NULL, '196.249.96.13', 'MTAANI BANDO 5G', NULL, NULL, NULL, 0, NULL, 'PUSH_FAILED', NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(25, 'SKY2610201456531059', 1, 1, 27, '0612710364', 500.00, '3A:BB:1F:B4:0C:3E', 'pending', NULL, NULL, 'PUSH FAILED: HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '2026-10-20 11:56:53', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 11:56:54', NULL, '196.249.96.13', 'MTAANI BANDO 5G', NULL, NULL, NULL, 0, NULL, 'PUSH_FAILED', NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(26, 'SKY2610201512187FCD', 1, 1, 27, '0612710364', 500.00, '16:CA:B7:5D:D3:13', 'pending', NULL, NULL, 'PUSH FAILED: HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '2026-10-20 12:12:18', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 12:12:19', NULL, '196.249.96.13', 'SKY 5G KITONGA', NULL, NULL, NULL, 0, NULL, 'PUSH_FAILED', NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(27, 'SKY2610201513476409', 1, 3, 27, '0612710364', 5000.00, '16:CA:B7:5D:D3:13', 'pending', NULL, NULL, 'PUSH FAILED: HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '2026-10-20 12:13:47', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 12:13:47', NULL, '196.249.96.13', 'SKY 5G KITONGA', NULL, NULL, NULL, 0, NULL, 'PUSH_FAILED', NULL, NULL, NULL, 0, NULL, NULL, 0, 'WEEK 1', 46, 'online', 0, 5.00, 2.00, 1, 30, NULL, 0),
(28, 'SKY261020152042125C', 1, 1, 27, '0612710364', 200.00, '16:CA:B7:5D:D3:13', 'pending', NULL, NULL, 'PUSH FAILED: HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '2026-10-20 12:20:42', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 12:20:43', NULL, '196.249.96.13', 'SKY 5G KITONGA', NULL, NULL, NULL, 0, NULL, 'PUSH_FAILED', NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(29, 'SKY26102015301809D6', 1, 1, 27, '0612710364', 200.00, '84:C5:A6:78:CA:C6', 'failed', NULL, NULL, 'PUSH FAILED: HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • HTTP 404 {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n} | retry: HTTP 404 {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '2026-10-20 12:30:18', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 12:30:20', NULL, '197.186.6.17', 'SKY HOTSPOT', NULL, NULL, NULL, 0, NULL, 'PUSH_FAILED', NULL, NULL, NULL, 0, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(30, 'SKY2610201539204CE4', 1, 1, 27, '0612710364', 200.00, '84:C5:A6:78:CA:C6', 'paid', 550, 'sp_6ad76100752ca', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76100752ca\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6292563818430451\",\"reference\":\"1939223393\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T12:39:34.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76100752ca\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '2026-10-20 12:39:20', '2026-10-20 15:39:45', NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 12:39:45', NULL, '197.186.6.17', 'SKY 5G KITONGA', NULL, NULL, NULL, 0, NULL, 'SUCCESS', '6292563818430451', 'HALOPESATZ', '2026-10-20 15:39:45', 2, NULL, '', 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(31, 'SKY261020154616F47A', 1, 1, 27, '0667357937', 200.00, '82:86:B6:CF:AF:72', 'pending', NULL, 'sp_6ad76298d0be7', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '2026-10-20 12:46:16', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 13:21:39', NULL, '197.186.6.17', 'SKY HOTSPORT COMPANY', NULL, NULL, NULL, 0, NULL, 'PENDING', 'S20775006444', NULL, '2026-10-20 16:21:39', 38, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(32, 'SKY2610201548093491', 1, 1, 27, '0752527937', 200.00, '82:86:B6:CF:AF:72', 'pending', NULL, 'sp_6ad7630a8fa25', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '2026-10-20 12:48:09', NULL, NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 13:21:38', NULL, '197.186.6.17', 'SKY HOTSPORT COMPANY', NULL, NULL, NULL, 0, NULL, 'PENDING', 'S20775008351', NULL, '2026-10-20 16:21:38', 31, NULL, NULL, 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(33, 'SKY261020154849FF31', 1, 1, 27, '0612710364', 200.00, '16:CA:B7:5D:D3:13', 'paid', 551, 'sp_6ad76331efd9d', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76331efd9d\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6292569428441304\",\"reference\":\"1939232058\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T12:48:54.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76331efd9d\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '2026-10-20 12:48:49', '2026-10-20 15:49:08', NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 12:49:08', NULL, '196.249.96.13', 'SKY 5G KITONGA', NULL, NULL, NULL, 0, NULL, 'SUCCESS', '6292569428441304', 'HALOPESATZ', '2026-10-20 15:49:08', 1, NULL, '', 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0),
(34, 'SKY261020155411ED42', 1, 1, 27, '0683277378', 200.00, '3E:4F:9E:91:E7:2A', 'paid', 552, 'sp_6ad7647484b2f', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7647484b2f\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255683277378\",\"transid\":\"BP261020.1554.174557\",\"reference\":\"1939237729\",\"channel\":\"AIRTELMONEY\",\"msisdn\":\"255683277378\",\"created_at\":\"2026-10-20T12:54:21.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7647484b2f\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '2026-10-20 12:54:11', '2026-10-20 15:54:42', NULL, NULL, 'pending', NULL, 'wifi', NULL, NULL, '2026-10-20 12:54:42', NULL, '197.186.6.17', 'SKY HOTSPOT', NULL, NULL, NULL, 0, NULL, 'SUCCESS', 'BP261020.1554.174557', 'AIRTELMONEY', '2026-10-20 15:54:42', 4, NULL, '', 0, 'MASAA 6', 300, 'online', 0, 10.00, 5.00, 1, 30, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hs_packages`
--

CREATE TABLE `hs_packages` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `duration_minutes` int(11) NOT NULL,
  `time_mode` enum('continuous','online') DEFAULT 'continuous',
  `data_limit_mb` int(11) DEFAULT 0,
  `speed_down_mbps` decimal(7,2) DEFAULT 5.00,
  `speed_up_mbps` decimal(7,2) DEFAULT 2.00,
  `max_devices` int(11) DEFAULT 1,
  `validity_days` int(11) DEFAULT 30,
  `show_on_portal` tinyint(1) DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1,
  `sort_order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `package_type` varchar(20) DEFAULT 'wifi',
  `duration_days` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_packages`
--

INSERT INTO `hs_packages` (`id`, `seller_id`, `device_id`, `name`, `description`, `price`, `duration_minutes`, `time_mode`, `data_limit_mb`, `speed_down_mbps`, `speed_up_mbps`, `max_devices`, `validity_days`, `show_on_portal`, `is_active`, `sort_order`, `created_at`, `package_type`, `duration_days`) VALUES
(1, 1, 27, 'MASAA 6', 'WIFI YA BUREE', 200.00, 300, 'online', 0, 10.00, 5.00, 1, 30, 1, 1, 0, '2026-10-13 15:08:42', 'wifi', NULL),
(2, 1, NULL, 'MASAA 24', 'MASAA', 1000.00, 2600, 'online', 0, 5.00, 2.00, 1, 30, 1, 1, 0, '2026-10-20 09:34:30', 'wifi', NULL),
(3, 1, NULL, 'WEEK 1', 'WEEK 1', 5000.00, 46, 'online', 0, 5.00, 2.00, 1, 30, 1, 1, 0, '2026-10-20 09:35:08', 'wifi', NULL),
(4, 1, NULL, 'MWEZI 1', 'MWEZI 1', 10000.00, 60, 'online', 0, 5.00, 2.00, 1, 30, 1, 1, 0, '2026-10-20 09:35:59', 'wifi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_payment_events`
--

CREATE TABLE `hs_payment_events` (
  `id` bigint(20) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_ref` varchar(40) DEFAULT NULL,
  `gateway_ref` varchar(100) DEFAULT NULL,
  `source` varchar(20) NOT NULL DEFAULT '',
  `http_code` int(11) NOT NULL DEFAULT 0,
  `state` varchar(30) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_payment_events`
--

INSERT INTO `hs_payment_events` (`id`, `order_id`, `order_ref`, `gateway_ref`, `source`, `http_code`, `state`, `message`, `body`, `ip`, `created_at`) VALUES
(1, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 200, 'SUCCESS', 'paid', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad749cc77393\",\"payment_status\":\"SUCCESS\",\"amount\":500,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6292504388432269\",\"reference\":\"1939124391\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T11:00:33.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad749cc77393\",\"status\":\"SUCCESS\",\"amount\":\"500.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 11:26:25'),
(2, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'fulfill', 0, 'ERROR', 'Cannot add or update a child row: a foreign key constraint fails (`skytanza_wifi`.`transactions`, CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL)', '', '197.186.6.17', '2026-10-20 11:26:25'),
(3, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 200, 'SUCCESS', 'paid', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73ab8d3fe3\",\"payment_status\":\"SUCCESS\",\"amount\":500,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6292465868441454\",\"reference\":\"1939059814\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:56:13.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73ab8d3fe3\",\"status\":\"SUCCESS\",\"amount\":\"500.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 11:26:26'),
(4, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'fulfill', 0, 'ERROR', 'Cannot add or update a child row: a foreign key constraint fails (`skytanza_wifi`.`transactions`, CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL)', '', '197.186.6.17', '2026-10-20 11:26:26'),
(5, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 11:26:27'),
(6, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 200, 'SUCCESS', 'paid', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad749cc77393\",\"payment_status\":\"SUCCESS\",\"amount\":500,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6292504388432269\",\"reference\":\"1939124391\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T11:00:33.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad749cc77393\",\"status\":\"SUCCESS\",\"amount\":\"500.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 11:27:39'),
(7, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'fulfill', 0, 'ERROR', 'Cannot add or update a child row: a foreign key constraint fails (`skytanza_wifi`.`transactions`, CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL)', '', '169.58.93.38', '2026-10-20 11:27:39'),
(8, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 200, 'SUCCESS', 'paid', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73ab8d3fe3\",\"payment_status\":\"SUCCESS\",\"amount\":500,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6292465868441454\",\"reference\":\"1939059814\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:56:13.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73ab8d3fe3\",\"status\":\"SUCCESS\",\"amount\":\"500.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 11:27:40'),
(9, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'fulfill', 0, 'ERROR', 'Cannot add or update a child row: a foreign key constraint fails (`skytanza_wifi`.`transactions`, CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL)', '', '169.58.93.38', '2026-10-20 11:27:40'),
(10, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 11:27:41'),
(11, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:29:39'),
(12, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:29:40'),
(13, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:29:41'),
(14, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:30:32'),
(15, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:30:39'),
(16, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'customer', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:30:40'),
(17, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:30:47'),
(18, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:31:19'),
(19, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:31:26'),
(20, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:31:33'),
(21, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:31:39'),
(22, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:31:40'),
(23, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:31:40'),
(24, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:31:41'),
(25, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:31:48'),
(26, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:31:55'),
(27, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:32:02'),
(28, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:32:09'),
(29, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:32:17'),
(30, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:32:24'),
(31, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:32:31'),
(32, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:32:38'),
(33, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:33:38'),
(34, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:33:39'),
(35, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:33:40'),
(36, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:35:39'),
(37, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:35:40'),
(38, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:35:41'),
(39, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:37:39'),
(40, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:37:40'),
(41, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:37:41'),
(42, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:39:39'),
(43, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:39:40'),
(44, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:39:41'),
(45, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:41:38'),
(46, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:41:39'),
(47, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:41:40'),
(48, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:43:24'),
(49, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:43:32'),
(50, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:43:33'),
(51, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'fulfill', 0, 'ERROR', 'Cannot add or update a child row: a foreign key constraint fails (`skytanza_wifi`.`transactions`, CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL)', '', '197.186.6.17', '2026-10-20 11:43:51'),
(52, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:44:39'),
(53, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:44:40'),
(54, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:44:41'),
(55, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:45:06'),
(56, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:45:18'),
(57, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:45:31'),
(58, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:45:32'),
(59, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:45:47'),
(60, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:46:01'),
(61, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'customer', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:46:07'),
(62, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'customer', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:46:08'),
(63, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:46:09'),
(64, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:46:16'),
(65, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:46:31'),
(66, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:46:45'),
(67, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:46:46'),
(68, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:46:47'),
(69, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:46:48'),
(70, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:47:00'),
(71, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:47:10'),
(72, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:47:25'),
(73, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:47:40'),
(74, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:47:47'),
(75, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:47:54'),
(76, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:48:05'),
(77, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:48:19'),
(78, 23, 'SKY261020140027DEFC', 'sp_6ad749cc77393', 'fulfill', 200, 'PAID', 'Voucher WB8ZR7MW issued (manual)', '', '197.186.6.17', '2026-10-20 11:48:21'),
(79, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:48:22'),
(80, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:48:23'),
(81, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:49:41'),
(82, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:49:41'),
(83, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:51:37'),
(84, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:51:38'),
(85, 22, 'SKY261020125608AD5E', 'sp_6ad73ab8d3fe3', 'fulfill', 200, 'PAID', 'Voucher MGXPU39N issued (manual)', '', '197.186.6.17', '2026-10-20 11:52:23'),
(86, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:53:37'),
(87, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 11:55:08'),
(88, 24, 'SKY2610201456033E26', '', 'create', 404, 'PUSH_FAILED', 'USSD push failed', 'HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:56:04'),
(89, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:56:42'),
(90, 25, 'SKY2610201456531059', '', 'create', 404, 'PUSH_FAILED', 'USSD push failed', 'HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 11:56:54'),
(91, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 11:58:37'),
(92, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:00:37'),
(93, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:02:37'),
(94, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:04:37'),
(95, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:06:36'),
(96, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:08:37'),
(97, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:10:37'),
(98, 26, 'SKY2610201512187FCD', '', 'create', 404, 'PUSH_FAILED', 'USSD push failed', 'HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 12:12:19'),
(99, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:12:37'),
(100, 27, 'SKY2610201513476409', '', 'create', 404, 'PUSH_FAILED', 'USSD push failed', 'HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 12:13:47'),
(101, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:14:37'),
(102, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:16:37'),
(103, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:18:37'),
(104, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:20:37'),
(105, 28, 'SKY261020152042125C', '', 'create', 404, 'PUSH_FAILED', 'USSD push failed', 'HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '196.249.96.13', '2026-10-20 12:20:43'),
(106, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:22:37'),
(107, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:23:37'),
(108, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:25:38'),
(109, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:27:44'),
(110, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:28:32'),
(111, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:28:43'),
(112, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:28:57'),
(113, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:29:05'),
(114, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:29:12'),
(115, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:29:27'),
(116, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:29:28'),
(117, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:29:40'),
(118, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:29:41'),
(119, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:29:49'),
(120, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:30:00'),
(121, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:30:16'),
(122, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:30:17'),
(123, 29, 'SKY26102015301809D6', '', 'create', 404, 'PUSH_FAILED', 'USSD push failed', 'HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • HTTP 404 {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n} | retry: HTTP 404 {\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:30:20'),
(124, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:30:31'),
(125, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:30:46'),
(126, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:31:01'),
(127, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:31:09'),
(128, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:31:17'),
(129, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:31:32'),
(130, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:31:33'),
(131, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:31:37'),
(132, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:31:43'),
(133, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:31:58'),
(134, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:31:59'),
(135, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:32:13'),
(136, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:32:14'),
(137, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:32:25'),
(138, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:32:36'),
(139, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:32:44'),
(140, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:32:52'),
(141, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:33:07'),
(142, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:33:08'),
(143, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:33:15'),
(144, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:33:23'),
(145, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:33:31'),
(146, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:33:37'),
(147, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:33:39'),
(148, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:33:48'),
(149, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:33:58'),
(150, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:34:06'),
(151, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:34:21'),
(152, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:34:22'),
(153, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:34:29'),
(154, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:34:37'),
(155, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:34:48'),
(156, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:35:03'),
(157, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:35:04'),
(158, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:35:18'),
(159, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:35:19'),
(160, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:35:29'),
(161, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '169.58.93.38', '2026-10-20 12:35:37'),
(162, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:35:44'),
(163, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 404, 'HTTP_404', 'pending', '{\n    \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/order_status_simple could not be found.\"\n}', '197.186.6.17', '2026-10-20 12:35:45'),
(164, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:35:59'),
(165, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:36:00'),
(166, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:36:14'),
(167, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:36:15'),
(168, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:36:22'),
(169, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:36:30');
INSERT INTO `hs_payment_events` (`id`, `order_id`, `order_ref`, `gateway_ref`, `source`, `http_code`, `state`, `message`, `body`, `ip`, `created_at`) VALUES
(170, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:36:38'),
(171, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:36:46'),
(172, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:37:01'),
(173, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:37:02'),
(174, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:37:09'),
(175, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:37:17'),
(176, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:37:25'),
(177, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:37:33'),
(178, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:37:41'),
(179, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:37:44'),
(180, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:37:50'),
(181, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:37:59'),
(182, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:38:08'),
(183, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:38:23'),
(184, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:38:24'),
(185, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:38:31'),
(186, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:38:39'),
(187, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:38:50'),
(188, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:38:58'),
(189, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:39:07'),
(190, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:39:15'),
(191, 30, 'SKY2610201539204CE4', 'sp_6ad76100752ca', 'create', 200, 'PUSH_SENT', 'USSD push sent to 0612710364', '{\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"sp_6ad76100752ca\",\"reference\":\"S20775000073\",\"amount\":200,\"currency\":\"TZS\",\"payment_status\":\"PENDING\",\"status\":\"PENDING\",\"creation_date\":\"2026-10-20 15:40:15\",\"transid\":null,\"channel\":null,\"msisdn\":\"255612710364\",\"order_status_data\":{\"order_id\":\"sp_6ad76100752ca\",\"creation_date\":\"2026-10-20 15:40:15\",\"amount\":\"200\",\"payment_status\":\"PENDING\",\"transid\":null,\"channel\":null,\"reference\":null,\"msisdn\":null}}}', '197.186.6.17', '2026-10-20 12:39:34'),
(192, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:39:34'),
(193, 30, 'SKY2610201539204CE4', 'sp_6ad76100752ca', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76100752ca\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20775000073\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T12:39:34.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76100752ca\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:39:38'),
(194, 30, 'SKY2610201539204CE4', 'sp_6ad76100752ca', 'status', 200, 'SUCCESS', 'paid', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76100752ca\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6292563818430451\",\"reference\":\"1939223393\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T12:39:34.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76100752ca\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:39:45'),
(195, 30, 'SKY2610201539204CE4', 'sp_6ad76100752ca', 'fulfill', 200, 'PAID', 'Voucher 4XUPA4EW issued (sonicpesa)', '', '197.186.6.17', '2026-10-20 12:39:45'),
(196, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:39:46'),
(197, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:39:46'),
(198, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:39:56'),
(199, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:40:05'),
(200, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:40:13'),
(201, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:40:28'),
(202, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:40:29'),
(203, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:40:39'),
(204, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:40:47'),
(205, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:40:55'),
(206, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:41:06'),
(207, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:41:14'),
(208, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:41:22'),
(209, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:41:37'),
(210, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:41:37'),
(211, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:41:38'),
(212, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:41:45'),
(213, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:41:53'),
(214, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:42:01'),
(215, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:42:09'),
(216, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:42:17'),
(217, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:42:25'),
(218, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:42:33'),
(219, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:42:41'),
(220, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:42:49'),
(221, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:42:57'),
(222, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:43:05'),
(223, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:43:13'),
(224, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:43:21'),
(225, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:43:29'),
(226, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:43:37'),
(227, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:43:37'),
(228, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:43:45'),
(229, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:43:53'),
(230, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:44:01'),
(231, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:44:09'),
(232, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:44:17'),
(233, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:44:25'),
(234, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:44:33'),
(235, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:44:41'),
(236, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:44:49'),
(237, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:44:57'),
(238, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:45:05'),
(239, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:45:13'),
(240, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:45:21'),
(241, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:45:29');
INSERT INTO `hs_payment_events` (`id`, `order_id`, `order_ref`, `gateway_ref`, `source`, `http_code`, `state`, `message`, `body`, `ip`, `created_at`) VALUES
(242, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:45:37'),
(243, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:45:37'),
(244, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:45:45'),
(245, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:45:52'),
(246, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:46:00'),
(247, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:46:08'),
(248, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:46:15'),
(249, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'create', 200, 'PUSH_SENT', 'USSD push sent to 0667357937', '{\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"reference\":\"S20775006444\",\"amount\":200,\"currency\":\"TZS\",\"payment_status\":\"PENDING\",\"status\":\"PENDING\",\"creation_date\":\"2026-10-20 15:47:04\",\"transid\":null,\"channel\":null,\"msisdn\":\"255667357937\",\"order_status_data\":{\"order_id\":\"sp_6ad76298d0be7\",\"creation_date\":\"2026-10-20 15:47:04\",\"amount\":\"200\",\"payment_status\":\"PENDING\",\"transid\":null,\"channel\":null,\"reference\":null,\"msisdn\":null}}}', '197.186.6.17', '2026-10-20 12:46:23'),
(250, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:46:23'),
(251, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:46:27'),
(252, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:46:34'),
(253, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:46:35'),
(254, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:46:37'),
(255, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:46:42'),
(256, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:46:47'),
(257, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:46:50'),
(258, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:46:58'),
(259, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:46:59'),
(260, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:47:05'),
(261, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:47:11'),
(262, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:47:11'),
(263, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:47:19'),
(264, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:47:23'),
(265, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:47:27'),
(266, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'customer', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:47:33'),
(267, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:47:34'),
(268, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:47:35'),
(269, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:47:37'),
(270, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:47:38'),
(271, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:47:42'),
(272, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:47:47'),
(273, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:47:49'),
(274, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:47:58'),
(275, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:47:59'),
(276, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:48:12'),
(277, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'create', 200, 'PUSH_SENT', 'USSD push sent to 0752527937', '{\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"reference\":\"S20775008351\",\"amount\":200,\"currency\":\"TZS\",\"payment_status\":\"PENDING\",\"status\":\"PENDING\",\"creation_date\":\"2026-10-20 15:48:57\",\"transid\":null,\"channel\":null,\"msisdn\":\"255752527937\",\"order_status_data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"creation_date\":\"2026-10-20 15:48:57\",\"amount\":\"200\",\"payment_status\":\"PENDING\",\"transid\":null,\"channel\":null,\"reference\":null,\"msisdn\":null}}}', '197.186.6.17', '2026-10-20 12:48:15'),
(278, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:48:20'),
(279, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:48:23'),
(280, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:48:27'),
(281, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:48:35'),
(282, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:48:35'),
(283, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:48:37'),
(284, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:48:38'),
(285, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:48:39'),
(286, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:48:43'),
(287, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:48:47'),
(288, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:48:50'),
(289, 33, 'SKY261020154849FF31', 'sp_6ad76331efd9d', 'create', 200, 'PUSH_SENT', 'USSD push sent to 0612710364', '{\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"sp_6ad76331efd9d\",\"reference\":\"S20775009384\",\"amount\":200,\"currency\":\"TZS\",\"payment_status\":\"PENDING\",\"status\":\"PENDING\",\"creation_date\":\"2026-10-20 15:49:37\",\"transid\":null,\"channel\":null,\"msisdn\":\"255612710364\",\"order_status_data\":{\"order_id\":\"sp_6ad76331efd9d\",\"creation_date\":\"2026-10-20 15:49:37\",\"amount\":\"200\",\"payment_status\":\"PENDING\",\"transid\":null,\"channel\":null,\"reference\":null,\"msisdn\":null}}}', '196.249.96.13', '2026-10-20 12:48:54'),
(290, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:48:58'),
(291, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:48:59'),
(292, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:49:06'),
(293, 33, 'SKY261020154849FF31', 'sp_6ad76331efd9d', 'status', 200, 'SUCCESS', 'paid', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76331efd9d\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":\"6292569428441304\",\"reference\":\"1939232058\",\"channel\":\"HALOPESATZ\",\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T12:48:54.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76331efd9d\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '196.249.96.13', '2026-10-20 12:49:08'),
(294, 33, 'SKY261020154849FF31', 'sp_6ad76331efd9d', 'fulfill', 200, 'PAID', 'Voucher XFDP74J2 issued (sonicpesa)', '', '196.249.96.13', '2026-10-20 12:49:08'),
(295, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:49:11'),
(296, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:49:14'),
(297, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:49:23'),
(298, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:49:30'),
(299, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:49:31'),
(300, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:49:35'),
(301, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:49:47'),
(302, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:49:52'),
(303, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:49:52'),
(304, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:49:53'),
(305, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:49:59'),
(306, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:50:11'),
(307, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:50:23'),
(308, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:50:35'),
(309, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:50:37'),
(310, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:50:38'),
(311, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:50:47'),
(312, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:50:59'),
(313, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:51:11'),
(314, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:51:23');
INSERT INTO `hs_payment_events` (`id`, `order_id`, `order_ref`, `gateway_ref`, `source`, `http_code`, `state`, `message`, `body`, `ip`, `created_at`) VALUES
(315, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:51:35'),
(316, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:51:37'),
(317, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:51:38'),
(318, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:51:39'),
(319, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:51:47'),
(320, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:51:59'),
(321, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:52:11'),
(322, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:52:23'),
(323, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:52:35'),
(324, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:52:37'),
(325, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:52:38'),
(326, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:52:47'),
(327, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:52:59'),
(328, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:53:11'),
(329, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:53:23'),
(330, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:53:35'),
(331, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:53:38'),
(332, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:53:38'),
(333, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:53:39'),
(334, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:53:47'),
(335, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:53:59'),
(336, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:54:11'),
(337, 34, 'SKY261020155411ED42', 'sp_6ad7647484b2f', 'create', 200, 'PUSH_SENT', 'USSD push sent to 0683277378', '{\"status\":\"success\",\"message\":\"Payment order created successfully! Push USSD sent to your phone.\",\"data\":{\"order_id\":\"sp_6ad7647484b2f\",\"reference\":\"S20775014834\",\"amount\":200,\"currency\":\"TZS\",\"payment_status\":\"PENDING\",\"status\":\"PENDING\",\"creation_date\":\"2026-10-20 15:54:59\",\"transid\":null,\"channel\":null,\"msisdn\":\"255683277378\",\"order_status_data\":{\"order_id\":\"sp_6ad7647484b2f\",\"creation_date\":\"2026-10-20 15:54:59\",\"amount\":\"200\",\"payment_status\":\"PENDING\",\"transid\":null,\"channel\":null,\"reference\":null,\"msisdn\":null}}}', '197.186.6.17', '2026-10-20 12:54:21'),
(338, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:54:23'),
(339, 34, 'SKY261020155411ED42', 'sp_6ad7647484b2f', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7647484b2f\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255683277378\",\"transid\":null,\"reference\":\"S20775014834\",\"channel\":null,\"msisdn\":\"255683277378\",\"created_at\":\"2026-10-20T12:54:21.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7647484b2f\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:54:26'),
(340, 34, 'SKY261020155411ED42', 'sp_6ad7647484b2f', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7647484b2f\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255683277378\",\"transid\":null,\"reference\":\"S20775014834\",\"channel\":null,\"msisdn\":\"255683277378\",\"created_at\":\"2026-10-20T12:54:21.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7647484b2f\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:54:33'),
(341, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:54:35'),
(342, 34, 'SKY261020155411ED42', 'sp_6ad7647484b2f', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7647484b2f\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255683277378\",\"transid\":null,\"reference\":\"S20775014834\",\"channel\":null,\"msisdn\":\"255683277378\",\"created_at\":\"2026-10-20T12:54:21.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7647484b2f\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:54:37'),
(343, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:54:38'),
(344, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:54:39'),
(345, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:54:40'),
(346, 34, 'SKY261020155411ED42', 'sp_6ad7647484b2f', 'status', 200, 'SUCCESS', 'paid', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7647484b2f\",\"payment_status\":\"SUCCESS\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255683277378\",\"transid\":\"BP261020.1554.174557\",\"reference\":\"1939237729\",\"channel\":\"AIRTELMONEY\",\"msisdn\":\"255683277378\",\"created_at\":\"2026-10-20T12:54:21.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7647484b2f\",\"status\":\"SUCCESS\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '197.186.6.17', '2026-10-20 12:54:42'),
(347, 34, 'SKY261020155411ED42', 'sp_6ad7647484b2f', 'fulfill', 200, 'PAID', 'Voucher VU3V3488 issued (sonicpesa)', '', '197.186.6.17', '2026-10-20 12:54:42'),
(348, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:54:47'),
(349, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:54:59'),
(350, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:55:20'),
(351, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:55:37'),
(352, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:55:38'),
(353, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:55:44'),
(354, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:55:56'),
(355, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:56:08'),
(356, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:56:20'),
(357, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:56:37'),
(358, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:56:37'),
(359, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:56:38'),
(360, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:56:51'),
(361, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:57:03'),
(362, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:57:16'),
(363, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:57:27'),
(364, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:57:37'),
(365, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:57:38'),
(366, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:57:39'),
(367, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:57:39'),
(368, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:57:51'),
(369, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:58:04'),
(370, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:58:15'),
(371, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:58:27'),
(372, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:58:39'),
(373, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:58:51'),
(374, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:59:04'),
(375, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:59:15'),
(376, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:59:27'),
(377, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:59:39'),
(378, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:59:39'),
(379, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 12:59:40'),
(380, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 12:59:40'),
(381, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 12:59:51'),
(382, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:00:03'),
(383, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:00:15'),
(384, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:00:27'),
(385, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:00:39'),
(386, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:00:51');
INSERT INTO `hs_payment_events` (`id`, `order_id`, `order_ref`, `gateway_ref`, `source`, `http_code`, `state`, `message`, `body`, `ip`, `created_at`) VALUES
(387, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:01:03'),
(388, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:01:15'),
(389, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:01:27'),
(390, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:01:38'),
(391, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:01:38'),
(392, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:01:39'),
(393, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:01:39'),
(394, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:01:51'),
(395, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:02:03'),
(396, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:02:15'),
(397, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:02:27'),
(398, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:02:39'),
(399, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:02:51'),
(400, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:03:03'),
(401, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:03:15'),
(402, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:03:27'),
(403, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:03:37'),
(404, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:03:38'),
(405, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:03:39'),
(406, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:03:39'),
(407, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:03:51'),
(408, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:04:03'),
(409, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:04:15'),
(410, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:04:28'),
(411, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:04:40'),
(412, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:04:52'),
(413, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:05:05'),
(414, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:05:17'),
(415, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:05:29'),
(416, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:05:38'),
(417, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:05:39'),
(418, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:05:40'),
(419, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:05:41'),
(420, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:05:53'),
(421, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:06:05'),
(422, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:06:17'),
(423, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:06:29'),
(424, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:06:41'),
(425, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:06:53'),
(426, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:07:05'),
(427, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:07:17'),
(428, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:07:29'),
(429, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:07:38'),
(430, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:07:39'),
(431, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:07:40'),
(432, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:07:41'),
(433, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:07:53'),
(434, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:08:05'),
(435, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:08:17'),
(436, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:08:30'),
(437, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:08:42'),
(438, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:08:54'),
(439, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:09:06'),
(440, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:09:19'),
(441, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:09:30'),
(442, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:09:38'),
(443, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:09:39'),
(444, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:09:40'),
(445, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:09:42'),
(446, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:09:54'),
(447, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:10:06'),
(448, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:10:18'),
(449, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:10:30'),
(450, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:10:42'),
(451, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:10:54'),
(452, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:11:06'),
(453, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:11:18'),
(454, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:11:30'),
(455, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:11:38'),
(456, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:11:39'),
(457, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:11:40'),
(458, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:11:42');
INSERT INTO `hs_payment_events` (`id`, `order_id`, `order_ref`, `gateway_ref`, `source`, `http_code`, `state`, `message`, `body`, `ip`, `created_at`) VALUES
(459, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:11:54'),
(460, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:12:06'),
(461, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:12:18'),
(462, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:12:30'),
(463, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:12:42'),
(464, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:12:54'),
(465, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:13:06'),
(466, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:13:19'),
(467, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:13:31'),
(468, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:13:38'),
(469, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:13:39'),
(470, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:13:40'),
(471, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'status', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '197.186.6.17', '2026-10-20 13:13:43'),
(472, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:15:38'),
(473, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:15:39'),
(474, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:15:40'),
(475, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:17:38'),
(476, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:17:38'),
(477, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:17:39'),
(478, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:19:38'),
(479, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:19:39'),
(480, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:19:40'),
(481, 32, 'SKY2610201548093491', 'sp_6ad7630a8fa25', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad7630a8fa25\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255752527937\",\"transid\":null,\"reference\":\"S20775008351\",\"channel\":null,\"msisdn\":\"255752527937\",\"created_at\":\"2026-10-20T12:48:15.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad7630a8fa25\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:21:38'),
(482, 31, 'SKY261020154616F47A', 'sp_6ad76298d0be7', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad76298d0be7\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255667357937\",\"transid\":null,\"reference\":\"S20775006444\",\"channel\":null,\"msisdn\":\"255667357937\",\"created_at\":\"2026-10-20T12:46:23.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad76298d0be7\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"customer@mikekaapp.com\",\"buyer_name\":\"Customer\"}}', '169.58.93.38', '2026-10-20 13:21:39'),
(483, 21, 'SKY261020122923BB61', 'sp_6ad73473ef476', 'poll', 200, 'PENDING', 'pending', '{\"status\":\"success\",\"message\":\"Order status retrieved successfully\",\"data\":{\"order_id\":\"sp_6ad73473ef476\",\"payment_status\":\"PENDING\",\"amount\":200,\"currency\":\"TZS\",\"phone\":\"255612710364\",\"transid\":null,\"reference\":\"S20774809696\",\"channel\":null,\"msisdn\":\"255612710364\",\"created_at\":\"2026-10-20T09:29:28.000000Z\",\"cached\":true},\"transaction\":{\"order_id\":\"sp_6ad73473ef476\",\"status\":\"PENDING\",\"amount\":\"200.00\",\"buyer_email\":\"wifi255612710364@wifi.skytanzania.co.tz\",\"buyer_name\":\"WiFi 255612710364\"}}', '169.58.93.38', '2026-10-20 13:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `hs_provision_log`
--

CREATE TABLE `hs_provision_log` (
  `id` bigint(20) NOT NULL,
  `device_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `step` varchar(40) NOT NULL,
  `status` enum('pending','running','ok','failed','skipped') DEFAULT 'pending',
  `message` varchar(500) DEFAULT NULL,
  `payload` mediumtext DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hs_provision_runs`
--

CREATE TABLE `hs_provision_runs` (
  `id` bigint(20) NOT NULL,
  `device_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(30) NOT NULL,
  `phase` varchar(30) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_provision_runs`
--

INSERT INTO `hs_provision_runs` (`id`, `device_id`, `user_id`, `action`, `phase`, `message`, `created_at`) VALUES
(86, 27, 1, 'added', '', 'TP-Link Omada EAP225 • EAP225 Main', '2026-10-19 06:48:10'),
(87, 27, 1, 'setup', 'partial', 'Partly configured — see the log', '2026-10-19 06:48:16'),
(88, 27, 1, 'connect', 'adopting', 'Adopting the EAP225…', '2026-10-19 06:48:23'),
(89, 27, 1, 'connect', 'adopting', 'Adopting the EAP225…', '2026-10-19 09:07:24'),
(90, 27, 1, 'connect', 'adopting', 'Adopting the EAP225…', '2026-10-19 09:53:11'),
(91, 27, 1, 'connect', 'need_login', 'Adoption failed: wrong EAP225 username/password. Type its login (factory default admin/admin) and press Provision & connect again.', '2026-10-19 09:53:17'),
(92, 27, 1, 'connect', 'adopting', 'Adopting the EAP225…', '2026-10-19 09:54:02'),
(93, 27, 1, 'connect', 'provisioning', 'Omada is sending the configuration (SSID, portal, RADIUS) to the EAP225…', '2026-10-19 09:54:08'),
(94, 27, 1, 'connect', 'connected', 'The EAP225 is CONNECTED and the hotspot is live. • IP 192.168.18.2', '2026-10-19 09:54:42'),
(95, 27, 1, 'updated', '', 'TP-Link Omada EAP225 • EAP225 Main', '2026-10-19 10:25:11'),
(96, 27, 1, 'setup', 'partial', 'Partly configured — see the log', '2026-10-19 10:25:13'),
(97, 27, 1, 'connect', 'connected', 'The EAP225 is CONNECTED and the hotspot is live. • IP 192.168.18.2', '2026-10-19 10:25:28'),
(98, 27, 1, 'updated', '', 'TP-Link Omada EAP225 • EAP225 Main', '2026-10-19 10:34:42'),
(99, 27, 1, 'connect', 'connected', 'The EAP225 is CONNECTED and the hotspot is live. • IP 192.168.18.2', '2026-10-19 12:33:00'),
(100, 27, 1, 'updated', '', 'TP-Link Omada EAP225 • EAP225 Main', '2026-10-19 21:42:17'),
(101, 27, 1, 'updated', '', 'TP-Link Omada EAP225 • EAP225 Main', '2026-10-19 21:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `hs_radius_log`
--

CREATE TABLE `hs_radius_log` (
  `id` bigint(20) NOT NULL,
  `kind` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `ap_mac` varchar(17) DEFAULT NULL,
  `nas_ip` varchar(45) DEFAULT NULL,
  `result` varchar(16) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `nas_id` varchar(64) DEFAULT NULL,
  `src_ip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_radius_log`
--

INSERT INTO `hs_radius_log` (`id`, `kind`, `username`, `mac`, `ap_mac`, `nas_ip`, `result`, `message`, `created_at`, `nas_id`, `src_ip`) VALUES
(1, 'auth', 'Q62SRBNW', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 1h', '2026-10-15 12:05:27', 'SKYUZ9SDDDQG', '169.58.93.38'),
(2, 'acct', 'Q62SRBNW', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-15 12:05:29', 'SKYUZ9SDDDQG', '169.58.93.38'),
(3, 'acct', 'Q62SRBNW', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop Session-Timeout 22.1 MB 59m', '2026-10-15 13:05:30', 'SKYUZ9SDDDQG', '169.58.93.38'),
(4, 'auth', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 1h', '2026-10-15 13:30:16', 'SKYUZ9SDDDQG', '169.58.93.38'),
(5, 'acct', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-15 13:30:29', 'SKYUZ9SDDDQG', '169.58.93.38'),
(6, 'acct', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 3.8 MB 7m', '2026-10-15 13:43:31', 'SKYUZ9SDDDQG', '169.58.93.38'),
(7, 'acct', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-15 13:47:52', 'SKYUZ9SDDDQG', '169.58.93.38'),
(8, 'acct', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 7.3 MB 10m', '2026-10-15 14:00:40', 'SKYUZ9SDDDQG', '169.58.93.38'),
(9, 'auth', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 41m', '2026-10-15 17:50:09', 'SKYUZ9SDDDQG', '169.58.93.38'),
(10, 'acct', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-15 17:50:29', 'SKYUZ9SDDDQG', '169.58.93.38'),
(11, 'auth', '2DEWSC42', '12:68:32:86:B3:3D', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 1h', '2026-10-15 18:13:58', 'SKYUZ9SDDDQG', '169.58.93.38'),
(12, 'acct', '2DEWSC42', '12:68:32:86:B3:3D', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-15 18:14:00', 'SKYUZ9SDDDQG', '169.58.93.38'),
(13, 'acct', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop Session-Timeout 50.2 MB 40m', '2026-10-15 18:31:15', 'SKYUZ9SDDDQG', '169.58.93.38'),
(14, 'auth', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 1m', '2026-10-15 18:40:59', 'SKYUZ9SDDDQG', '169.58.93.38'),
(15, 'acct', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-15 18:41:00', 'SKYUZ9SDDDQG', '169.58.93.38'),
(16, 'acct', 'LUK3G66B', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop Session-Timeout 2.3 MB 1m', '2026-10-15 18:42:00', 'SKYUZ9SDDDQG', '169.58.93.38'),
(17, 'acct', '2DEWSC42', '12:68:32:86:B3:3D', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop Session-Timeout 135.7 MB 1h', '2026-10-15 19:13:59', 'SKYUZ9SDDDQG', '169.58.93.38'),
(18, 'auth', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 1h', '2026-10-16 09:56:23', 'SKYUZ9SDDDQG', '169.58.93.38'),
(19, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-16 09:56:29', 'SKYUZ9SDDDQG', '169.58.93.38'),
(20, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 68 MB 16m', '2026-10-16 10:14:06', 'SKYUZ9SDDDQG', '169.58.93.38'),
(21, 'auth', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 43m', '2026-10-17 19:09:28', 'SKYUZ9SDDDQG', '169.58.93.38'),
(22, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-17 19:09:29', 'SKYUZ9SDDDQG', '169.58.93.38'),
(23, 'auth', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 41m', '2026-10-17 19:13:04', 'SKYUZ9SDDDQG', '169.58.93.38'),
(24, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-17 19:13:30', 'SKYUZ9SDDDQG', '169.58.93.38'),
(25, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 27.5 MB 2m', '2026-10-17 19:29:41', 'SKYUZ9SDDDQG', '169.58.93.38'),
(26, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 16.5 MB 11m', '2026-10-17 19:29:42', 'SKYUZ9SDDDQG', '169.58.93.38'),
(27, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-17 19:44:22', 'SKYUZ9SDDDQG', '169.58.93.38'),
(28, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-17 19:44:23', 'SKYUZ9SDDDQG', '169.58.93.38'),
(29, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop Session-Timeout 0 B 0dak', '2026-10-17 19:52:49', 'SKYUZ9SDDDQG', '169.58.93.38'),
(30, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 21.6 MB 8m', '2026-10-17 19:52:50', 'SKYUZ9SDDDQG', '169.58.93.38'),
(31, 'auth', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 20m', '2026-10-17 19:54:54', 'SKYUZ9SDDDQG', '169.58.93.38'),
(32, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-17 19:54:59', 'SKYUZ9SDDDQG', '169.58.93.38'),
(33, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 3.2 MB 1m', '2026-10-17 19:56:46', 'SKYUZ9SDDDQG', '169.58.93.38'),
(34, 'auth', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Karibu! Muda uliobaki: 19m', '2026-10-17 19:59:15', 'SKYUZ9SDDDQG', '169.58.93.38'),
(35, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-17 19:59:29', 'SKYUZ9SDDDQG', '169.58.93.38'),
(36, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 66.4 MB 16m', '2026-10-17 20:15:19', 'SKYUZ9SDDDQG', '169.58.93.38'),
(37, 'acct', '', '', '', NULL, 'ok', 'Accounting-Off (router restarted)', '2026-10-19 05:51:17', 'SKYM47E4YGT8', '197.186.28.103'),
(38, 'portal', 'B4MTRMJD', '36:2E:83:D5:E3:C5', 'A8:29:DC:10:5C:18', NULL, 'fail', 'Phone could NOT reach omada.skytanzania.co.tz (169.58.93.38) before login — add it to Pre-Authentication Access (Connection health → Fix automatically)', '2026-10-19 22:01:45', 'SKYGA3KUMASU', '196.249.113.181'),
(39, 'portal', 'B4MTRMJD', '36:2E:83:D5:E3:C5', 'A8:29:DC:10:5C:18', NULL, 'fail', 'Phone could NOT reach omada.skytanzania.co.tz (169.58.93.38) before login — add it to Pre-Authentication Access (Connection health → Fix automatically)', '2026-10-19 22:02:03', 'SKYGA3KUMASU', '196.249.113.181'),
(40, 'portal', 'B4MTRMJD', '36:2E:83:D5:E3:C5', 'A8:29:DC:10:5C:18', NULL, 'fail', 'Phone could NOT reach omada.skytanzania.co.tz (169.58.93.38) before login — add it to Pre-Authentication Access (Connection health → Fix automatically)', '2026-10-19 22:05:48', 'SKYGA3KUMASU', '196.249.113.181'),
(41, 'portal', 'B4MTRMJD', '36:2E:83:D5:E3:C5', 'A8:29:DC:10:5C:18', NULL, 'fail', 'Phone could NOT reach omada.skytanzania.co.tz (169.58.93.38) before login — add it to Pre-Authentication Access (Connection health → Fix automatically)', '2026-10-19 22:05:59', 'SKYGA3KUMASU', '196.249.113.181'),
(42, 'auth', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 3m', '2026-10-19 22:29:05', 'SKYGA3KUMASU', '169.58.93.38'),
(43, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-19 22:29:07', 'SKYGA3KUMASU', '169.58.93.38'),
(44, 'acct', '3PPRWVFK', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop Session-Timeout 24 MB 1m', '2026-10-19 22:32:36', 'SKYGA3KUMASU', '169.58.93.38'),
(45, 'auth', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 1h', '2026-10-19 22:38:51', 'SKYGA3KUMASU', '169.58.93.38'),
(46, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-19 22:39:07', 'SKYGA3KUMASU', '169.58.93.38'),
(47, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 127.9 MB 12m', '2026-10-19 23:12:23', 'SKYGA3KUMASU', '169.58.93.38'),
(48, 'auth', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 47m', '2026-10-19 23:18:47', 'SKYGA3KUMASU', '169.58.93.38'),
(49, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-19 23:19:07', 'SKYGA3KUMASU', '169.58.93.38'),
(50, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 0 B 0min', '2026-10-19 23:23:36', 'SKYGA3KUMASU', '169.58.93.38'),
(51, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-19 23:35:10', 'SKYGA3KUMASU', '169.58.93.38'),
(52, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-19 23:35:11', 'SKYGA3KUMASU', '169.58.93.38'),
(53, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop Session-Timeout 109.9 MB 1m', '2026-10-19 23:38:56', 'SKYGA3KUMASU', '169.58.93.38'),
(54, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 75.4 MB 2m', '2026-10-19 23:38:58', 'SKYGA3KUMASU', '169.58.93.38'),
(55, 'auth', 'B4MTRMJD', '36:2E:83:D5:E3:C5', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 1h', '2026-10-20 06:50:32', 'SKYGA3KUMASU', '169.58.93.38'),
(56, 'acct', 'B4MTRMJD', '36:2E:83:D5:E3:C5', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 06:50:37', 'SKYGA3KUMASU', '169.58.93.38'),
(57, 'auth', 'T56FQ2QD', '3A:BB:1F:B4:0C:3E', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 1h', '2026-10-20 07:22:44', 'SKYGA3KUMASU', '169.58.93.38'),
(58, 'acct', 'T56FQ2QD', '3A:BB:1F:B4:0C:3E', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 07:23:07', 'SKYGA3KUMASU', '169.58.93.38'),
(59, 'acct', 'B4MTRMJD', '36:2E:83:D5:E3:C5', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 81.2 MB 31m', '2026-10-20 07:27:07', 'SKYGA3KUMASU', '169.58.93.38'),
(60, 'acct', 'T56FQ2QD', '3A:BB:1F:B4:0C:3E', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 15.8 MB 11m', '2026-10-20 07:39:04', 'SKYGA3KUMASU', '169.58.93.38'),
(61, 'auth', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 44m', '2026-10-20 09:36:57', 'SKYGA3KUMASU', '169.58.93.38'),
(62, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 09:37:07', 'SKYGA3KUMASU', '169.58.93.38'),
(63, 'acct', 'QUMBRRH7', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop Session-Timeout 525 MB 44m', '2026-10-20 10:21:13', 'SKYGA3KUMASU', '169.58.93.38'),
(64, 'auth', '4Q7LRW66', 'AA:E0:BA:FE:FF:DE', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 1h', '2026-10-20 11:20:03', 'SKYGA3KUMASU', '169.58.93.38'),
(65, 'acct', '4Q7LRW66', 'AA:E0:BA:FE:FF:DE', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 11:20:07', 'SKYGA3KUMASU', '169.58.93.38'),
(66, 'acct', '4Q7LRW66', 'AA:E0:BA:FE:FF:DE', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 19.4 MB 2m', '2026-10-20 11:27:37', 'SKYGA3KUMASU', '169.58.93.38'),
(67, 'auth', 'GHT77W6G', '7E:EC:5E:B9:D4:29', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 1h', '2026-10-20 11:41:58', 'SKYGA3KUMASU', '169.58.93.38'),
(68, 'acct', 'GHT77W6G', '7E:EC:5E:B9:D4:29', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 11:42:07', 'SKYGA3KUMASU', '169.58.93.38'),
(69, 'auth', 'WB8ZR7MW', '26:86:02:E6:AF:5E', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 5h', '2026-10-20 11:48:29', 'SKYGA3KUMASU', '169.58.93.38'),
(70, 'acct', 'WB8ZR7MW', '26:86:02:E6:AF:5E', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 11:48:37', 'SKYGA3KUMASU', '169.58.93.38'),
(71, 'acct', 'GHT77W6G', '7E:EC:5E:B9:D4:29', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 12.1 MB 2m', '2026-10-20 11:49:43', 'SKYGA3KUMASU', '169.58.93.38'),
(72, 'acct', 'GHT77W6G', '7E:EC:5E:B9:D4:29', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 12.1 MB 2m', '2026-10-20 11:50:07', 'SKYGA3KUMASU', '169.58.93.38'),
(73, 'acct', 'GHT77W6G', '7E:EC:5E:B9:D4:29', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 11:55:38', 'SKYGA3KUMASU', '169.58.93.38'),
(74, 'acct', 'WB8ZR7MW', '26:86:02:E6:AF:5E', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 715.4 KB 6m', '2026-10-20 12:00:10', 'SKYGA3KUMASU', '169.58.93.38'),
(75, 'acct', 'GHT77W6G', '7E:EC:5E:B9:D4:29', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 1.1 KB 0min', '2026-10-20 12:00:41', 'SKYGA3KUMASU', '169.58.93.38'),
(76, 'auth', '4XUPA4EW', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 5h', '2026-10-20 12:39:48', 'SKYGA3KUMASU', '169.58.93.38'),
(77, 'acct', '4XUPA4EW', '84:C5:A6:78:CA:C6', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 12:40:07', 'SKYGA3KUMASU', '169.58.93.38'),
(78, 'auth', 'XFDP74J2', '16:CA:B7:5D:D3:13', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 5h', '2026-10-20 12:49:11', 'SKYGA3KUMASU', '169.58.93.38'),
(79, 'acct', 'XFDP74J2', '16:CA:B7:5D:D3:13', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 12:49:37', 'SKYGA3KUMASU', '169.58.93.38'),
(80, 'auth', 'VU3V3488', '3E:4F:9E:91:E7:2A', 'A8:29:DC:10:5C:18', NULL, 'accept', 'Welcome! Time left: 5h', '2026-10-20 12:54:45', 'SKYGA3KUMASU', '169.58.93.38'),
(81, 'acct', 'VU3V3488', '3E:4F:9E:91:E7:2A', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 12:55:08', 'SKYGA3KUMASU', '169.58.93.38'),
(82, 'acct', 'XFDP74J2', '16:CA:B7:5D:D3:13', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 8.3 MB 7m', '2026-10-20 13:01:41', 'SKYGA3KUMASU', '169.58.93.38'),
(83, 'acct', 'VU3V3488', '3E:4F:9E:91:E7:2A', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Stop User-Request 57.7 MB 5m', '2026-10-20 13:05:11', 'SKYGA3KUMASU', '169.58.93.38'),
(84, 'acct', 'VU3V3488', '3E:4F:9E:91:E7:2A', 'A8:29:DC:10:5C:18', NULL, 'ok', 'Start', '2026-10-20 13:13:06', 'SKYGA3KUMASU', '169.58.93.38');

-- --------------------------------------------------------

--
-- Table structure for table `hs_router_models`
--

CREATE TABLE `hs_router_models` (
  `id` int(11) NOT NULL,
  `code` varchar(40) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(60) NOT NULL,
  `kind` varchar(30) DEFAULT 'access_point',
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(40) DEFAULT 'wifi',
  `is_active` tinyint(1) DEFAULT 1,
  `sort_order` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_router_models`
--

INSERT INTO `hs_router_models` (`id`, `code`, `brand`, `model`, `kind`, `description`, `icon`, `is_active`, `sort_order`, `created_at`) VALUES
(1, 'omada-eap225', 'TP-Link Omada', 'EAP225', 'access_point', 'AC1350 ceiling-mount Wi-Fi access point • External RADIUS portal • Omada Cloud / OC200', 'wifi', 1, 1, '2026-10-14 06:26:29'),
(2, 'omada-eap245', 'TP-Link Omada', 'EAP245', 'access_point', 'AC1750 ceiling-mount access point', 'wifi', 0, 2, '2026-10-14 06:26:29'),
(3, 'omada-eap110-outdoor', 'TP-Link Omada', 'EAP110-Outdoor', 'access_point', '300 Mbps outdoor access point', 'tower-broadcast', 0, 3, '2026-10-14 06:26:29');

-- --------------------------------------------------------

--
-- Table structure for table `hs_sessions`
--

CREATE TABLE `hs_sessions` (
  `id` bigint(20) NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `unique_id` varchar(64) NOT NULL,
  `acct_session_id` varchar(64) DEFAULT NULL,
  `mac` varchar(17) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `nas_ip` varchar(45) DEFAULT NULL,
  `ap_mac` varchar(17) DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `stopped_at` datetime DEFAULT NULL,
  `session_time` int(11) DEFAULT 0,
  `bytes_in` bigint(20) UNSIGNED DEFAULT 0,
  `bytes_out` bigint(20) UNSIGNED DEFAULT 0,
  `status` enum('active','closed','stale') DEFAULT 'active',
  `terminate_cause` varchar(64) DEFAULT NULL,
  `nas_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_sessions`
--

INSERT INTO `hs_sessions` (`id`, `voucher_id`, `seller_id`, `device_id`, `username`, `unique_id`, `acct_session_id`, `mac`, `ip`, `nas_ip`, `ap_mac`, `started_at`, `updated_at`, `stopped_at`, `session_time`, `bytes_in`, `bytes_out`, `status`, `terminate_cause`, `nas_id`) VALUES
(1, 277, 1, 23, 'Q62SRBNW', '50e85d107e431ef432af94ed76e1c90a', '1b59c2dbbc8f43fca44184ac82846d17', '84:C5:A6:78:CA:C6', '192.168.18.4', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-15 15:05:29', '2026-10-15 16:05:29', '2026-10-15 16:05:29', 3593, 6431586, 16760878, 'closed', 'Session-Timeout', 'SKYUZ9SDDDQG'),
(63, 280, 1, 23, 'LUK3G66B', 'dd2c719f9625e13543515a56691a0940', '9f8c9d5fed774e24a3c2fce5f260bb5b', '84:C5:A6:78:CA:C6', '192.168.18.4', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-15 16:30:29', '2026-10-15 16:43:31', '2026-10-15 16:43:31', 479, 1227225, 2722737, 'closed', 'User-Request', 'SKYUZ9SDDDQG'),
(73, 280, 1, 23, 'LUK3G66B', 'a741d3aab8606c4ef04a5812107ada68', '36df05c471ac40d5b4e96be2e465f896', '84:C5:A6:78:CA:C6', '192.168.18.4', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-15 16:47:52', '2026-10-15 17:00:40', '2026-10-15 17:00:40', 659, 648242, 6957962, 'closed', 'User-Request', 'SKYUZ9SDDDQG'),
(87, 280, 1, 23, 'LUK3G66B', '7b3c036e3bda9078d11820626170d52d', 'bd1db1fa626a46499fa2adac4ed3d82d', '84:C5:A6:78:CA:C6', '192.168.18.7', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-15 20:50:29', '2026-10-15 21:31:15', '2026-10-15 21:31:15', 2408, 5793050, 46888327, 'closed', 'Session-Timeout', 'SKYUZ9SDDDQG'),
(112, 241, 1, 23, '2DEWSC42', 'bec6431e2153059da88c7edbf9e6f582', 'c8344c9874da4c1bab4aa685402b0a5d', '12:68:32:86:B3:3D', '192.168.18.3', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-15 21:13:59', '2026-10-15 22:13:59', '2026-10-15 22:13:59', 3600, 18168903, 124080490, 'closed', 'Session-Timeout', 'SKYUZ9SDDDQG'),
(158, 280, 1, 23, 'LUK3G66B', '8adea580556127909fa28da544ac00cd', '53e62a6515ab45ec806a3a1a31cde870', '84:C5:A6:78:CA:C6', '192.168.18.7', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-15 21:40:59', '2026-10-15 21:41:59', '2026-10-15 21:41:59', 58, 580214, 1849043, 'closed', 'Session-Timeout', 'SKYUZ9SDDDQG'),
(194, 279, 1, 23, '3PPRWVFK', '916b964a64d6d5132b27e07c1335a527', 'portal-916b964a64d6d513', '84:C5:A6:78:CA:C6', '', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-16 12:31:09', '2026-10-19 13:38:14', NULL, 0, 0, 0, 'stale', 'No-Accounting', 'SKYUZ9SDDDQG'),
(195, 279, 1, 23, '3PPRWVFK', '014fe640d29ebb7e24ba21e45626d0d1', '4421457e7c7e4bc4bf7b2d18b2f3a428', '84:C5:A6:78:CA:C6', '192.168.18.6', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-16 12:56:29', '2026-10-16 13:14:06', '2026-10-16 12:59:41', 1016, 4129575, 67200887, 'closed', 'User-Request', 'SKYUZ9SDDDQG'),
(200, 276, 1, 23, 'PAP8P39V', '7730afb21a1d28d65dafed170104bc15', 'portal-7730afb21a1d28d6', '26:86:02:E6:AF:5E', '', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-16 13:01:28', '2026-10-16 13:01:28', NULL, 0, 0, 0, 'stale', 'No-Accounting', 'SKYUZ9SDDDQG'),
(207, 219, 1, 23, '5F7D7NZ5', '346401ebb65c6d17add878388e827306', 'portal-346401ebb65c6d17', '12:68:32:86:B3:3D', '', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-16 13:06:32', '2026-10-16 13:06:32', NULL, 0, 0, 0, 'stale', 'No-Accounting', 'SKYUZ9SDDDQG'),
(216, 271, 1, 23, 'X2ZHGVYJ', '7536149b15722fcc24a7ffe350c77597', 'portal-7536149b15722fcc', 'AA:47:E3:45:8F:3C', '', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 21:26:08', '2026-10-17 21:27:51', NULL, 0, 0, 0, 'stale', 'No-Accounting', 'SKYUZ9SDDDQG'),
(217, 268, 1, 23, 'YRBYGXGJ', '1e04d2e3ce170a633003a22719d0295f', 'portal-1e04d2e3ce170a63', 'BE:27:23:B1:AD:AF', '', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 21:31:37', '2026-10-17 21:31:37', NULL, 0, 0, 0, 'stale', 'No-Accounting', 'SKYUZ9SDDDQG'),
(218, 279, 1, 23, '3PPRWVFK', 'd6eeb5d16bd24d1e89e3620a397212d0', 'b3eab4e4e79a4487907ddf47cae918c0', '84:C5:A6:78:CA:C6', '192.168.18.5', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 22:09:29', '2026-10-17 22:29:41', '2026-10-17 22:10:15', 177, 5043932, 23827063, 'closed', 'User-Request', 'SKYUZ9SDDDQG'),
(221, 238, 1, 23, 'UEQ7ETEX', 'd023ffd93d2b66d9a39571ef1abe49dd', 'portal-d023ffd93d2b66d9', '12:68:32:86:B3:3D', '', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 22:11:41', '2026-10-17 22:11:41', NULL, 0, 0, 0, 'stale', 'No-Accounting', 'SKYUZ9SDDDQG'),
(224, 279, 1, 23, '3PPRWVFK', '3b1b0981e60f24d571ed5c10e97ccf53', '1910b46af1f943b5a49cd9ccdbe7269b', '84:C5:A6:78:CA:C6', '192.168.18.5', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 22:13:29', '2026-10-17 22:29:41', '2026-10-17 22:29:41', 692, 5698755, 11651480, 'closed', 'User-Request', 'SKYUZ9SDDDQG'),
(229, 296, 1, 23, 'Q4TH73G9', '178c0a1726df0ac4bd8d686eb4eb1d28', 'portal-178c0a1726df0ac4', '26:86:02:E6:AF:5E', '', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 22:15:35', '2026-10-17 22:15:35', NULL, 0, 0, 0, 'stale', 'No-Accounting', 'SKYUZ9SDDDQG'),
(252, 279, 1, 23, '3PPRWVFK', 'c58d915ade5c846a2bf657e9a65cbd3f', 'cf3a2ddaf62c4bc29ff47d392b11acec', '84:C5:A6:78:CA:C6', '192.168.18.5', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 22:44:21', '2026-10-17 22:52:49', '2026-10-17 22:52:49', 508, 4565061, 18099349, 'closed', 'User-Request', 'SKYUZ9SDDDQG'),
(253, 279, 1, 23, '3PPRWVFK', '7106f1aa9e0dfba5625b1d61ddcff566', 'd8c599ebf1ad46038969fb407ca7459f', '84:C5:A6:78:CA:C6', '192.168.18.5', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 22:44:22', '2026-10-17 22:52:49', '2026-10-17 22:52:49', 0, 0, 0, 'closed', 'Session-Timeout', 'SKYUZ9SDDDQG'),
(274, 279, 1, 23, '3PPRWVFK', 'b537a96a9c16e2bfe25bd2f9d6d830ba', '7ac356e7d7a249d8bd4b5be02095b355', '84:C5:A6:78:CA:C6', '192.168.18.5', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 22:54:59', '2026-10-17 22:56:46', '2026-10-17 22:56:46', 36, 1036049, 2291457, 'closed', 'User-Request', 'SKYUZ9SDDDQG'),
(277, 279, 1, 23, '3PPRWVFK', '81cd4cc66487c877d90d83a2338e396b', '990183da68f049968602c2a7251acd48', '84:C5:A6:78:CA:C6', '192.168.18.5', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-17 22:59:29', '2026-10-17 23:15:19', '2026-10-17 23:15:19', 962, 5554157, 64070931, 'closed', 'User-Request', 'SKYUZ9SDDDQG'),
(294, 412, 1, 27, '23PASZ5W', 'c07f0777e11d0eee6e92d829822145b4', 'portal-c07f0777e11d0eee', '36:2E:83:D5:E3:C5', '', '', 'A8:29:DC:10:5C:18', '2026-10-19 13:36:46', '2026-10-19 14:15:19', NULL, 0, 0, 0, 'stale', 'No-Accounting', 'SKYGA3KUMASU'),
(295, 279, 1, 27, '3PPRWVFK', 'f767cd69a3021a19185c46a19931082d', 'cd353e58090e4063a538b4476c3521f2', '84:C5:A6:78:CA:C6', '192.168.18.4', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 01:29:07', '2026-10-20 01:32:36', '2026-10-20 01:32:36', 87, 678378, 24500637, 'closed', 'Session-Timeout', 'SKYGA3KUMASU'),
(300, 401, 1, 27, 'QUMBRRH7', '1e65ece7d69bc3b70ca90e5826477cc1', '0842ee7acfb54180a9b5686287f8e4c5', '84:C5:A6:78:CA:C6', '192.168.18.4', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 01:39:07', '2026-10-20 02:12:23', '2026-10-20 02:12:23', 762, 4010177, 130083640, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(335, 401, 1, 27, 'QUMBRRH7', 'c5312a1bb5950ab7445fa526b9067fc1', 'c7b90da343ff4a2c8378ca49b2cb0651', '84:C5:A6:78:CA:C6', '192.168.18.4', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 02:19:07', '2026-10-20 02:23:36', '2026-10-20 02:23:36', 0, 0, 0, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(338, 401, 1, 27, 'QUMBRRH7', '2fa520c2771d13a1566f35e389322131', 'b9fbedf5750149228aab2ed65522e0c6', '84:C5:A6:78:CA:C6', '192.168.18.4', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 02:35:10', '2026-10-20 02:38:56', '2026-10-20 02:38:56', 19, 1607513, 113602564, 'closed', 'Session-Timeout', 'SKYGA3KUMASU'),
(339, 401, 1, 27, 'QUMBRRH7', '65adfe5494033b45641341e81909562a', 'be13242f7d1444e7a1df07841ca1e17d', '84:C5:A6:78:CA:C6', '192.168.18.4', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 02:35:10', '2026-10-20 02:38:56', '2026-10-20 02:38:56', 167, 1177472, 77877505, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(350, 397, 1, 27, 'B4MTRMJD', 'a8e0de6c8cd1d99f11809bddde20fdf3', '73e7d80055c7408a83bbdbd6605b8120', '36:2E:83:D5:E3:C5', '192.168.18.9', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 09:50:37', '2026-10-20 10:27:07', '2026-10-20 10:27:07', 1875, 6264298, 78888126, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(383, 370, 1, 27, 'T56FQ2QD', '3e6b42c5526cf19903b63c2cbd4e9a6b', 'f63a97810dcb46518bda1b7eeed3d6dd', '3A:BB:1F:B4:0C:3E', '192.168.18.5', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 10:23:06', '2026-10-20 10:39:04', '2026-10-20 10:39:04', 670, 1934073, 14675912, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(398, 401, 1, 27, 'QUMBRRH7', '1a7e1820335fa5b53f4c79a2aba68d62', 'f05d3f91d5494b9d8bcb961d4b2c15ad', '84:C5:A6:78:CA:C6', '192.168.18.2', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 12:37:07', '2026-10-20 13:21:13', '2026-10-20 13:21:13', 2645, 12245156, 538218002, 'closed', 'Session-Timeout', 'SKYGA3KUMASU'),
(444, 413, 1, 27, '4Q7LRW66', '5a677257e9633a8550ecd331c0e8d54a', 'a3f90e5983f24a3ebb91e2f8213ac5c3', 'AA:E0:BA:FE:FF:DE', '192.168.18.24', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 14:20:07', '2026-10-20 14:27:37', '2026-10-20 14:27:37', 131, 958926, 19402536, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(449, 403, 1, 27, 'GHT77W6G', '5a7a62dcc09fa1f2c6cd220cbda294dd', '29e63221b45743928dc4ecddc3d0dbb9', '7E:EC:5E:B9:D4:29', '192.168.18.25', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 14:42:07', '2026-10-20 14:50:06', '2026-10-20 14:49:41', 152, 932497, 11798701, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(453, 548, 1, 27, 'WB8ZR7MW', '9b921bd8c057e1879b31fe3474ba9324', 'e29dd33e9c9a4579bb539e259ae9869f', '26:86:02:E6:AF:5E', '192.168.18.4', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 14:48:37', '2026-10-20 15:00:10', '2026-10-20 15:00:10', 398, 307781, 424825, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(463, 403, 1, 27, 'GHT77W6G', '50f0824b448aa4bd2a0ffbf05ef91706', '106ac48ccb15407caed0e9c5a4ae738b', '7E:EC:5E:B9:D4:29', '192.168.18.25', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 14:55:38', '2026-10-20 15:00:40', '2026-10-20 15:00:40', 0, 888, 197, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(467, 550, 1, 27, '4XUPA4EW', '40243d007f9d6e1b2c28b77ea9158052', '3708979fe5634c3da60c5709d15e602b', '84:C5:A6:78:CA:C6', '192.168.18.2', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 15:40:07', '2026-10-20 16:22:37', NULL, 2513, 19380596, 640314555, 'active', NULL, 'SKYGA3KUMASU'),
(478, 551, 1, 27, 'XFDP74J2', 'ebe491e1c400f1e92d53077918a0f47a', 'a3c996940d664401bc3b83e12a54e99c', '16:CA:B7:5D:D3:13', '192.168.18.26', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 15:49:36', '2026-10-20 16:01:41', '2026-10-20 16:01:41', 436, 6303571, 2437248, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(490, 552, 1, 27, 'VU3V3488', '6c0eda29f7485b25b2d9c3832fc2734b', '0e7d0626ab4149edb729c863529bfbc5', '3E:4F:9E:91:E7:2A', '192.168.18.31', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 15:55:07', '2026-10-20 16:05:11', '2026-10-20 16:05:11', 315, 5740382, 54710148, 'closed', 'User-Request', 'SKYGA3KUMASU'),
(519, 552, 1, 27, 'VU3V3488', '559c9da33910635c8d8e3ee9123cd16c', 'cd498101f6cb4265af577042839ef808', '3E:4F:9E:91:E7:2A', '192.168.18.31', '169.58.93.38', 'A8:29:DC:10:5C:18', '2026-10-20 16:13:06', '2026-10-20 16:23:06', NULL, 534, 8473246, 288476845, 'active', NULL, 'SKYGA3KUMASU');

-- --------------------------------------------------------

--
-- Table structure for table `hs_vouchers`
--

CREATE TABLE `hs_vouchers` (
  `id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `batch` varchar(20) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT 0.00,
  `duration_minutes` int(11) NOT NULL,
  `time_mode` enum('continuous','online') DEFAULT 'continuous',
  `data_limit_mb` int(11) DEFAULT 0,
  `speed_down_mbps` decimal(7,2) DEFAULT 0.00,
  `speed_up_mbps` decimal(7,2) DEFAULT 0.00,
  `max_devices` int(11) DEFAULT 1,
  `status` enum('available','sold','active','expired','exhausted','blocked','cancelled') DEFAULT 'available',
  `source` enum('batch','online','manual','omada') DEFAULT 'batch',
  `sold_to_phone` varchar(20) DEFAULT NULL,
  `sold_at` datetime DEFAULT NULL,
  `first_used_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `data_used_bytes` bigint(20) UNSIGNED DEFAULT 0,
  `seconds_used` int(11) DEFAULT 0,
  `last_mac` varchar(17) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ext_ref` varchar(64) DEFAULT NULL,
  `ext_vid` varchar(64) DEFAULT NULL,
  `order_ref` varchar(50) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT 'sonicpesa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_vouchers`
--

INSERT INTO `hs_vouchers` (`id`, `package_id`, `seller_id`, `device_id`, `code`, `batch`, `price`, `duration_minutes`, `time_mode`, `data_limit_mb`, `speed_down_mbps`, `speed_up_mbps`, `max_devices`, `status`, `source`, `sold_to_phone`, `sold_at`, `first_used_at`, `expires_at`, `valid_until`, `data_used_bytes`, `seconds_used`, `last_mac`, `last_seen`, `created_at`, `ext_ref`, `ext_vid`, `order_ref`, `paid_at`, `payment_method`) VALUES
(1, 1, 1, NULL, 'N2SBTC5A', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(2, 1, 1, NULL, '9WSVF72V', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(3, 1, 1, NULL, 'TXLGRLA6', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(4, 1, 1, NULL, 'AGSPLUN7', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(5, 1, 1, NULL, '78Y8HVWT', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(6, 1, 1, NULL, 'ESFD5XUW', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(7, 1, 1, NULL, '8U6WWLVX', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(8, 1, 1, NULL, '7A5FUXL5', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(9, 1, 1, NULL, '7G69K3ML', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(10, 1, 1, NULL, '6TDWPRJ4', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(11, 1, 1, NULL, 'S7UVFPEZ', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(12, 1, 1, NULL, 'GYS9D6PC', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(13, 1, 1, NULL, '4J4MBLCZ', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(14, 1, 1, NULL, 'ZQWE52SX', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(15, 1, 1, NULL, 'MWSTA7UM', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(16, 1, 1, NULL, 'G7Y77T3Z', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(17, 1, 1, NULL, 'TZBMMA9X', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(18, 1, 1, NULL, 'TU2ALWKV', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(19, 1, 1, NULL, '47C7W6A2', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(20, 1, 1, NULL, 'UWXUJE9Q', 'B261013180851E3', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-12 18:08:54', 0, 0, NULL, NULL, '2026-10-13 15:08:54', NULL, NULL, NULL, NULL, 'sonicpesa'),
(23, 1, 1, NULL, 'S6TDXUD7', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(24, 1, 1, NULL, '2BWB4DZU', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(25, 1, 1, NULL, 'LLYCYLUJ', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(26, 1, 1, NULL, '7U6TY8NY', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(27, 1, 1, NULL, 'NZ7YSSXK', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(28, 1, 1, NULL, 'QSA4HRQB', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(29, 1, 1, NULL, 'R58Y2L2U', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(30, 1, 1, NULL, 'PPQEHK96', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(31, 1, 1, NULL, 'SKJXPC4H', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(32, 1, 1, NULL, 'C2L98RMH', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(33, 1, 1, NULL, 'GKW2RME9', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(34, 1, 1, NULL, '8ZEGG23S', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(35, 1, 1, NULL, '9QCM75PN', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(36, 1, 1, NULL, '3728YSTL', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(37, 1, 1, NULL, 'J55S37L7', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(38, 1, 1, NULL, '96HBH4K3', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(39, 1, 1, NULL, 'C6AMNQQS', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(40, 1, 1, NULL, 'EHGPTB4H', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(41, 1, 1, NULL, 'DHSPE2A8', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(42, 1, 1, NULL, 'HHUJSD4V', 'B2610140840F44C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 08:40:04', 0, 0, NULL, NULL, '2026-10-14 05:40:04', NULL, NULL, NULL, NULL, 'sonicpesa'),
(43, 1, 1, NULL, 'WVUM4UK3', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(44, 1, 1, NULL, 'PYCWYKER', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(45, 1, 1, NULL, '4KABHD4C', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(46, 1, 1, NULL, 'ZCWB4R4U', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(47, 1, 1, NULL, '4PT9DTT5', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(48, 1, 1, NULL, 'RB6GHE6E', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(49, 1, 1, NULL, 'YSU9G9VC', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(50, 1, 1, NULL, 'HZVN89TR', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(51, 1, 1, NULL, 'JA7FSTLE', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(52, 1, 1, NULL, '3AG2BENR', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(53, 1, 1, NULL, 'H646LEDX', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(54, 1, 1, NULL, 'UHXBAF3C', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(55, 1, 1, NULL, 'HJZXSPE6', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(56, 1, 1, NULL, 'YDPGUH95', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(57, 1, 1, NULL, 'Q92HLVHU', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(58, 1, 1, NULL, 'EBBL52HN', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(59, 1, 1, NULL, 'RP78NN6G', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(60, 1, 1, NULL, 'NMSCSGNE', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(61, 1, 1, NULL, 'Y3JJ2XF9', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(62, 1, 1, NULL, 'RAPQR8H8', 'B2610140947FB49', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 09:47:29', 0, 0, NULL, NULL, '2026-10-14 06:47:29', NULL, NULL, NULL, NULL, 'sonicpesa'),
(63, 1, 1, NULL, 'GZVVDVTY', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(64, 1, 1, NULL, '6UDBLQSL', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(65, 1, 1, NULL, 'AXN3UJL3', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(66, 1, 1, NULL, 'HMFSHDV9', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(67, 1, 1, NULL, '4RUA77JH', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(68, 1, 1, NULL, '4ML6M36L', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(69, 1, 1, NULL, 'ZYJ46LEA', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(70, 1, 1, NULL, 'TCZGCANU', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(71, 1, 1, NULL, 'XUQ9KKM7', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(72, 1, 1, NULL, '62XTAS9K', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(73, 1, 1, NULL, 'JCRX2U5A', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(74, 1, 1, NULL, 'SN2PL2KT', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(75, 1, 1, NULL, '5H8AJREP', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(76, 1, 1, NULL, 'JQCBCZGF', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(77, 1, 1, NULL, 'ZX9WNL4Z', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(78, 1, 1, NULL, 'EJZGE9Z2', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(79, 1, 1, NULL, 'Z9ARF224', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(80, 1, 1, NULL, '2FP4847H', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(81, 1, 1, NULL, 'JCJEX3QY', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(82, 1, 1, NULL, 'RPNM2DXK', 'B26101416241914', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:24:25', 0, 0, NULL, NULL, '2026-10-14 13:24:25', NULL, NULL, NULL, NULL, 'sonicpesa'),
(83, 1, 1, NULL, 'EZLGN99X', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(84, 1, 1, NULL, 'J762L6FR', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(85, 1, 1, NULL, 'RN2KJRT7', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(86, 1, 1, NULL, 'L8GPXRBC', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(87, 1, 1, NULL, 'MW2HXLQJ', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(88, 1, 1, NULL, 'QKW33VF9', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(89, 1, 1, NULL, 'U3H4KAJF', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(90, 1, 1, NULL, 'KDCGD9ZF', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(91, 1, 1, NULL, 'E7TTS4CU', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(92, 1, 1, NULL, 'J749VH8C', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(93, 1, 1, NULL, 'QYZYPV93', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(94, 1, 1, NULL, 'EM9NABS7', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(95, 1, 1, NULL, 'NQKKDAYP', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(96, 1, 1, NULL, 'WA75GYV9', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(97, 1, 1, NULL, 'DZP9SMKX', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(98, 1, 1, NULL, '4DPVN9FJ', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(99, 1, 1, NULL, '5SVR6M75', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(100, 1, 1, NULL, '6TKTBFUP', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(101, 1, 1, NULL, 'A5V2DJ2D', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(102, 1, 1, NULL, 'TSDJAERR', 'B26101416457107', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 16:45:34', 0, 0, NULL, NULL, '2026-10-14 13:45:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(103, 1, 1, NULL, 'KLMV2QH2', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(104, 1, 1, NULL, 'QQR6GP7A', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(105, 1, 1, NULL, 'XS68DZML', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(106, 1, 1, NULL, 'GUWP3H8Y', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(107, 1, 1, NULL, '5FN94UN4', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(108, 1, 1, NULL, '25ASUS46', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(109, 1, 1, NULL, 'UGDS324S', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(110, 1, 1, NULL, 'CG9MVVJS', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(111, 1, 1, NULL, '3Z4G4CLX', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(112, 1, 1, NULL, 'KMJPCMRW', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(113, 1, 1, NULL, 'AZAEVT99', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(114, 1, 1, NULL, '9DBMZC39', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(115, 1, 1, NULL, 'DCFVSBDH', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(116, 1, 1, NULL, 'FRBUYUNL', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(117, 1, 1, NULL, 'UE6YMVMK', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(118, 1, 1, NULL, '24HXA3XU', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(119, 1, 1, NULL, 'CGAQPW8V', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(120, 1, 1, NULL, '2VGB5RCE', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(121, 1, 1, NULL, '54AXZ6KR', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(122, 1, 1, NULL, '9PZB34V3', 'B2610142223145C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-13 22:23:46', 0, 0, NULL, NULL, '2026-10-14 19:23:46', NULL, NULL, NULL, NULL, 'sonicpesa'),
(123, 1, 1, NULL, 'HWGZRU4U', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(124, 1, 1, NULL, 'JSVSYB4K', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(125, 1, 1, NULL, 'RBBSAWU4', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(126, 1, 1, NULL, 'YVVQNE8K', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(127, 1, 1, NULL, 'N7GJE54X', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(128, 1, 1, NULL, 'AHYY79BL', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(129, 1, 1, NULL, 'CYC4T3YT', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(130, 1, 1, NULL, 'R5AGPSRQ', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(131, 1, 1, NULL, 'GDMQJYJU', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(132, 1, 1, NULL, 'RUH8G3F3', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(133, 1, 1, NULL, 'F6D8RRJ7', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(134, 1, 1, NULL, 'HFCWBHDH', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(135, 1, 1, NULL, 'AVJ6YDXM', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(136, 1, 1, NULL, 'FGXBHWP4', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(137, 1, 1, NULL, 'ASLA92QU', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(138, 1, 1, NULL, 'UFM8HQ9G', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(139, 1, 1, NULL, 'DZEGC78B', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(140, 1, 1, NULL, 'N47HSWGS', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(141, 1, 1, NULL, 'HWVSXYUQ', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(142, 1, 1, NULL, '7W4WQV9B', 'B26101501172F25', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:17:06', 0, 0, NULL, NULL, '2026-10-14 22:17:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(143, 1, 1, NULL, 'KQEFXPAF', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(144, 1, 1, NULL, 'RZB6E8C3', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(145, 1, 1, NULL, 'W9BJQN2M', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(146, 1, 1, NULL, '5NEXZGFN', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(147, 1, 1, NULL, 'FPHHFNX3', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(148, 1, 1, NULL, '4CEEVRWG', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(149, 1, 1, NULL, 'BELAU84B', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(150, 1, 1, NULL, 'YSMZX9SJ', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(151, 1, 1, NULL, 'GCGA9VCG', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(152, 1, 1, NULL, 'PRWWSKCD', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(153, 1, 1, NULL, 'P7LHLDDL', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(154, 1, 1, NULL, 'T28WFLF8', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(155, 1, 1, NULL, 'B8SJJ4PE', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(156, 1, 1, NULL, 'ULXRKSAX', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(157, 1, 1, NULL, 'EVDK7549', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(158, 1, 1, NULL, 'CV5PYU2L', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(159, 1, 1, NULL, '582TVR9R', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(160, 1, 1, NULL, 'FNQAULHR', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(161, 1, 1, NULL, 'NBQ9KP6E', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(162, 1, 1, NULL, '8K7GB26M', 'B2610150146E94C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 01:46:32', 0, 0, NULL, NULL, '2026-10-14 22:46:32', NULL, NULL, NULL, NULL, 'sonicpesa'),
(163, 1, 1, NULL, '6P5SUT3L', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(164, 1, 1, NULL, 'U7459D4Z', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(165, 1, 1, NULL, 'TWYXPAH5', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(166, 1, 1, NULL, 'MBHWV8AY', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(167, 1, 1, NULL, 'B7KUYH9Z', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(168, 1, 1, NULL, 'JM38N6JS', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(169, 1, 1, NULL, '6BMY9JS5', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(170, 1, 1, NULL, 'L7CPWNFM', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(171, 1, 1, NULL, '77GWEXF8', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(172, 1, 1, NULL, 'MR44GWZL', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(173, 1, 1, NULL, '6JTVMZRL', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(174, 1, 1, NULL, 'LPESEENM', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(175, 1, 1, NULL, '8B6GPDZS', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(176, 1, 1, NULL, 'XXPUXRNB', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(177, 1, 1, NULL, '3K6JWG8Q', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(178, 1, 1, NULL, '3PZJHSD8', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(179, 1, 1, NULL, 'R7KTLHVV', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(180, 1, 1, NULL, '8ER36JCZ', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(181, 1, 1, NULL, '49B5NZQN', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(182, 1, 1, NULL, 'G25SGHE4', 'B2610150815E9DB', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 08:15:34', 0, 0, NULL, NULL, '2026-10-15 05:15:34', NULL, NULL, NULL, NULL, 'sonicpesa'),
(183, 1, 1, NULL, 'CK5PB3UV', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(184, 1, 1, NULL, 'XQDH9K2J', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(185, 1, 1, NULL, 'Y6X76GTV', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(186, 1, 1, NULL, '7TLNHK4Z', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(187, 1, 1, NULL, '8KP25ZPY', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(188, 1, 1, NULL, 'XU5YBPCN', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(189, 1, 1, NULL, '5MNTKHPM', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(190, 1, 1, NULL, '3MWUHQE5', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(191, 1, 1, NULL, 'NK7UTH8H', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(192, 1, 1, NULL, 'MM996L4W', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(193, 1, 1, NULL, 'DPERN526', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(194, 1, 1, NULL, '74R4CDRE', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(195, 1, 1, NULL, '4JRXHFSL', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(196, 1, 1, NULL, 'X66MSLSC', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(197, 1, 1, NULL, 'J98U4FV5', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(198, 1, 1, NULL, 'B56UQBTP', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(199, 1, 1, NULL, 'LSRT2Z5V', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(200, 1, 1, NULL, '8X8MX52F', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(201, 1, 1, NULL, 'KG6R4R3G', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(202, 1, 1, NULL, 'FTJ48ZQ4', 'B2610150919EDBE', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:19:24', 0, 0, NULL, NULL, '2026-10-15 06:19:24', NULL, NULL, NULL, NULL, 'sonicpesa'),
(203, 1, 1, NULL, '7GF8DXP5', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(204, 1, 1, NULL, 'PL2253QK', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(205, 1, 1, NULL, 'YH4S55U4', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(206, 1, 1, NULL, 'HVZZJC9V', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(207, 1, 1, NULL, 'NM6ETV8X', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(208, 1, 1, NULL, 'XR4SF7VP', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(209, 1, 1, NULL, 'KNDYVXLB', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(210, 1, 1, NULL, 'WCHRB8W3', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(211, 1, 1, NULL, 'AL5A7RLJ', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(212, 1, 1, NULL, 'MJKHXMN6', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(213, 1, 1, NULL, 'CKU8JM8Y', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa');
INSERT INTO `hs_vouchers` (`id`, `package_id`, `seller_id`, `device_id`, `code`, `batch`, `price`, `duration_minutes`, `time_mode`, `data_limit_mb`, `speed_down_mbps`, `speed_up_mbps`, `max_devices`, `status`, `source`, `sold_to_phone`, `sold_at`, `first_used_at`, `expires_at`, `valid_until`, `data_used_bytes`, `seconds_used`, `last_mac`, `last_seen`, `created_at`, `ext_ref`, `ext_vid`, `order_ref`, `paid_at`, `payment_method`) VALUES
(214, 1, 1, NULL, 'QWEP6EDB', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(215, 1, 1, NULL, 'J2C9E42X', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(216, 1, 1, NULL, '3CRF95MD', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(217, 1, 1, NULL, 'PLHFP76K', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(218, 1, 1, NULL, 'HYU8R8QZ', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(219, 1, 1, NULL, '5F7D7NZ5', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'active', 'batch', NULL, '2026-10-16 13:06:32', '2026-10-16 13:06:32', NULL, '2026-11-14 09:26:18', 0, 0, '12:68:32:86:B3:3D', '2026-10-16 13:06:32', '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(220, 1, 1, NULL, 'LKKY253Y', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(221, 1, 1, NULL, 'V2DXBKWM', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(222, 1, 1, NULL, 'GT3T3R6Q', 'B261015092649F2', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 09:26:18', 0, 0, NULL, NULL, '2026-10-15 06:26:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(223, 1, 1, NULL, 'PXG5DW7R', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(224, 1, 1, NULL, 'FE3SWPJ9', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(225, 1, 1, NULL, '5L2W7Q2X', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(226, 1, 1, NULL, 'LFFPZEZF', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(227, 1, 1, NULL, 'UHEAD6RP', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(228, 1, 1, NULL, 'J2L5DXHX', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(229, 1, 1, NULL, '9WLDSSUB', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(230, 1, 1, NULL, '92X28WVD', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(231, 1, 1, NULL, 'E23YJVMS', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(232, 1, 1, NULL, 'BCWX7C46', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(233, 1, 1, NULL, '297PMVLD', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(234, 1, 1, NULL, 'EUY6MKZ8', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(235, 1, 1, NULL, 'E6ADQ252', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(236, 1, 1, NULL, 'F4BVNH5M', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(237, 1, 1, NULL, 'AW6ZV3EY', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(238, 1, 1, NULL, 'UEQ7ETEX', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'active', 'batch', NULL, '2026-10-17 22:11:41', '2026-10-17 22:11:41', NULL, '2026-11-14 11:03:06', 0, 0, '12:68:32:86:B3:3D', '2026-10-17 22:11:41', '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(239, 1, 1, NULL, 'KKJYKK75', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(240, 1, 1, NULL, 'UTBRCTHR', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(241, 1, 1, NULL, '2DEWSC42', 'B2610151103AF7C', 600.00, 75, 'online', 0, 5.00, 2.00, 1, 'active', 'batch', NULL, '2026-10-15 21:12:08', '2026-10-15 21:12:08', NULL, '2026-11-14 11:03:06', 142249393, 3600, '12:68:32:86:B3:3D', '2026-10-15 21:13:58', '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(242, 1, 1, NULL, 'AU7MNCHT', 'B2610151103AF7C', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 11:03:06', 0, 0, NULL, NULL, '2026-10-15 08:03:06', NULL, NULL, NULL, NULL, 'sonicpesa'),
(243, 1, 1, 22, 'Bs9zIM4h', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(244, 1, 1, 22, 'JTokyShF', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(245, 1, 1, 22, 'cbbIhYME', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(246, 1, 1, 22, 'ny8YKzG8', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(247, 1, 1, 22, 'h0wm7rHA', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(248, 1, 1, 22, 'DYFDjmDJ', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(249, 1, 1, 22, 'cP9480am', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(250, 1, 1, 22, 'TVAxbzQF', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(251, 1, 1, 22, 'EwBFxn8l', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(252, 1, 1, 22, 'k5J1ZgDn', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(253, 1, 1, 22, 'Dcxm5BPx', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(254, 1, 1, 22, 'P6yBrQMb', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(255, 1, 1, 22, 'fjwrqCV4', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(256, 1, 1, 22, 'l0MB1g9W', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(257, 1, 1, 22, 'l3WWQSg3', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(258, 1, 1, 22, 'zntheYw6', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(259, 1, 1, 22, 'REemYZ5V', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(260, 1, 1, 22, 'yCDQv5co', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(261, 1, 1, 22, 'bTZ4psQ4', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(262, 1, 1, 22, 'XNZ7XP7Z', 'OM26101512517A', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'omada', NULL, NULL, NULL, NULL, '2026-11-14 12:51:53', 0, 0, NULL, NULL, '2026-10-15 09:51:55', '6ad0a23af65217666e977d02', NULL, NULL, NULL, 'sonicpesa'),
(263, 1, 1, NULL, 'GY2LLSKM', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(264, 1, 1, NULL, 'GWXL9YKQ', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(265, 1, 1, NULL, 'YQWYWCY3', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(266, 1, 1, NULL, '66PVHZM7', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(267, 1, 1, NULL, 'HN38R6HJ', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(268, 1, 1, NULL, 'YRBYGXGJ', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'active', 'batch', NULL, '2026-10-17 21:31:37', '2026-10-17 21:31:37', NULL, '2026-11-14 13:02:28', 0, 0, 'BE:27:23:B1:AD:AF', '2026-10-17 21:31:37', '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(269, 1, 1, NULL, 'FDMQ3LHB', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(270, 1, 1, NULL, 'X76J84QX', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(271, 1, 1, NULL, 'X2ZHGVYJ', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'active', 'batch', NULL, '2026-10-17 21:26:08', '2026-10-17 21:26:08', NULL, '2026-11-14 13:02:28', 0, 0, 'AA:47:E3:45:8F:3C', '2026-10-17 21:27:51', '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(272, 1, 1, NULL, '4H2N68WK', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(273, 1, 1, NULL, 'QU9ZXZRM', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(274, 1, 1, NULL, 'A8EQWC9F', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(275, 1, 1, NULL, 'TBMMY6YC', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(276, 1, 1, NULL, 'PAP8P39V', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'active', 'batch', NULL, '2026-10-16 13:01:28', '2026-10-16 13:01:28', NULL, '2026-11-14 13:02:28', 0, 0, '26:86:02:E6:AF:5E', '2026-10-16 13:01:28', '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(277, 1, 1, NULL, 'Q62SRBNW', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'active', 'batch', NULL, '2026-10-15 15:05:27', '2026-10-15 15:05:27', NULL, '2026-11-14 13:02:28', 23192464, 3593, '84:C5:A6:78:CA:C6', '2026-10-15 15:05:27', '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(278, 1, 1, NULL, 'ZM67GNBK', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(279, 1, 1, NULL, '3PPRWVFK', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'active', 'batch', NULL, '2026-10-16 12:31:09', '2026-10-16 12:31:09', NULL, '2026-11-14 13:02:28', 238347711, 3478, '84:C5:A6:78:CA:C6', '2026-10-20 01:29:05', '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(280, 1, 1, NULL, 'LUK3G66B', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'expired', 'batch', NULL, '2026-10-15 16:30:16', '2026-10-15 16:30:16', NULL, '2026-11-14 13:02:28', 66666800, 3604, '84:C5:A6:78:CA:C6', '2026-10-15 21:40:59', '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(281, 1, 1, NULL, 'CZVTSBBA', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-14 13:02:28', 0, 0, NULL, NULL, '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(282, 1, 1, NULL, 'EUVTFMTQ', 'B2610151302B7D4', 600.00, 60, 'online', 0, 5.00, 2.00, 1, 'active', 'batch', NULL, '2026-10-16 01:12:33', '2026-10-16 01:12:33', NULL, '2026-11-14 13:02:28', 0, 0, '12:68:32:86:B3:3D', '2026-10-16 11:37:21', '2026-10-15 10:02:28', NULL, NULL, NULL, NULL, 'sonicpesa'),
(285, 1, 1, NULL, 'FWGLWWSW', NULL, 0.00, 60, 'continuous', 0, 5.00, 2.00, 1, 'expired', '', NULL, '2026-10-15 23:26:35', '2026-10-15 23:26:35', NULL, '2026-11-14 23:26:35', 0, 0, '12:68:32:86:B3:3D', '2026-10-15 23:26:35', '2026-10-15 20:26:35', NULL, NULL, 'SKY261015232612541A', '2026-10-15 23:26:35', 'sonicpesa'),
(286, 1, 1, NULL, '9YCXE25L', NULL, 0.00, 60, 'continuous', 0, 5.00, 2.00, 1, 'expired', '', NULL, '2026-10-15 23:33:28', '2026-10-15 23:33:28', NULL, '2026-11-14 23:33:28', 0, 0, '12:68:32:86:B3:3D', '2026-10-15 23:56:20', '2026-10-15 20:33:28', NULL, NULL, 'SKY261015233308DDC9', '2026-10-15 23:33:28', 'sonicpesa'),
(289, 1, 1, NULL, '6W5NUMFU', NULL, 0.00, 60, 'continuous', 0, 5.00, 2.00, 1, 'active', '', NULL, '2026-10-16 11:41:38', '2026-10-16 11:41:38', NULL, '2026-11-15 11:41:38', 0, 0, 'AA:47:E3:45:8F:3C', '2026-10-16 11:41:42', '2026-10-16 08:41:38', NULL, NULL, 'SKY2610161140540D89', '2026-10-16 11:41:38', 'sonicpesa'),
(290, 1, 1, NULL, '9H9TG5ZW', NULL, 0.00, 60, 'continuous', 0, 10.00, 5.00, 1, 'expired', '', NULL, '2026-10-16 11:57:43', '2026-10-16 12:57:40', '2026-10-16 13:57:40', '2026-11-15 11:57:43', 0, 0, '16:7B:95:67:FD:91', '2026-10-16 12:57:40', '2026-10-16 08:57:43', NULL, NULL, 'SKY26101611572578A2', '2026-10-16 11:57:43', 'sonicpesa'),
(292, 1, 1, 23, 'MHA79FT9', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(293, 1, 1, 23, 'CXELRLYR', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(294, 1, 1, 23, '7MBGNLHZ', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(295, 1, 1, 23, 'KW284YZ3', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(296, 1, 1, 23, 'Q4TH73G9', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'active', 'batch', NULL, '2026-10-17 22:15:35', '2026-10-17 22:15:35', NULL, '2026-11-16 22:14:38', 0, 0, '26:86:02:E6:AF:5E', '2026-10-17 22:15:35', '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(297, 1, 1, 23, 'ZCQ6XHHS', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(298, 1, 1, 23, '5ZJX49AS', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(299, 1, 1, 23, 'JWX2UWNN', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(300, 1, 1, 23, 'RB4QN2BW', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(301, 1, 1, 23, 'UH7LQ8JE', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(302, 1, 1, 23, '8YBY2DLG', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(303, 1, 1, 23, '3D3HSQ3P', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(304, 1, 1, 23, '9YJUGDAV', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(305, 1, 1, 23, 'AESCT8DH', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(306, 1, 1, 23, '9LZMTG83', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(307, 1, 1, 23, '24RUL6YW', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(308, 1, 1, 23, 'SEYDSL3P', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(309, 1, 1, 23, 'KZFRCWRN', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(310, 1, 1, 23, 'U89Q7APB', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(311, 1, 1, 23, 'DXKU6Q77', 'B26101722146D9F', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-16 22:14:38', 0, 0, NULL, NULL, '2026-10-17 19:14:38', NULL, NULL, NULL, NULL, 'sonicpesa'),
(314, 1, 1, NULL, '4ER3B8MK', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(315, 1, 1, NULL, 'LF6AZ6GP', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(316, 1, 1, NULL, 'UTBAB5EJ', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(317, 1, 1, NULL, 'LXUCVVRN', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(318, 1, 1, NULL, 'XL2YUDPX', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(319, 1, 1, NULL, '6TN6XHBS', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(320, 1, 1, NULL, 'YRVGAVFV', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(321, 1, 1, NULL, 'U28QRPQC', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(322, 1, 1, NULL, 'CUC3Y6FD', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(323, 1, 1, NULL, '3A2Z2SRE', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(324, 1, 1, NULL, 'PF2N3LUJ', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(325, 1, 1, NULL, '7FRJGYYX', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(326, 1, 1, NULL, 'HQ3D6C7S', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(327, 1, 1, NULL, '5RYVD9XL', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(328, 1, 1, NULL, 'BMBW8MCZ', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(329, 1, 1, NULL, 'AWT6DTCM', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(330, 1, 1, NULL, 'CHEXPBU6', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(331, 1, 1, NULL, 'C32LTBA9', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(332, 1, 1, NULL, 'K9GQDCLQ', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(333, 1, 1, NULL, 'QUNDVSKU', 'B26101821019529', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:01:13', 0, 0, NULL, NULL, '2026-10-18 18:01:13', NULL, NULL, NULL, NULL, 'sonicpesa'),
(334, 1, 1, NULL, 'XKG7Q33F', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(335, 1, 1, NULL, 'LHHDF9PT', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(336, 1, 1, NULL, 'QYCCF6QA', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(337, 1, 1, NULL, 'LKKJT9LG', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(338, 1, 1, NULL, '8VZA32T2', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(339, 1, 1, NULL, 'VV5YYKLB', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(340, 1, 1, NULL, 'NCY2EHRD', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(341, 1, 1, NULL, 'NRRD93FJ', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(342, 1, 1, NULL, 'XFWRB3UZ', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(343, 1, 1, NULL, 'SRL2HS72', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(344, 1, 1, NULL, 'UTCLQ69E', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(345, 1, 1, NULL, 'EDFN6JHL', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(346, 1, 1, NULL, 'VKBHYWWY', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(347, 1, 1, NULL, 'QTTEPLV5', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(348, 1, 1, NULL, 'UGLQFCGK', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(349, 1, 1, NULL, 'NHHBTU2G', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(350, 1, 1, NULL, 'AXMUSU6C', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(351, 1, 1, NULL, '675784BZ', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(352, 1, 1, NULL, 'XNQ87ZUC', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(353, 1, 1, NULL, '9WJEC2DS', 'B261018211323ED', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-17 21:13:39', 0, 0, NULL, NULL, '2026-10-18 18:13:39', NULL, NULL, NULL, NULL, 'sonicpesa'),
(354, 1, 1, NULL, '98SJV236', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(355, 1, 1, NULL, 'P6UDTUQQ', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(356, 1, 1, NULL, 'WLBEBGYG', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(357, 1, 1, NULL, 'YPP82HSD', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(358, 1, 1, NULL, 'GSR6WZJV', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(359, 1, 1, NULL, 'L366DTP5', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(360, 1, 1, NULL, 'JSANJDBE', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(361, 1, 1, NULL, '23N7YEJV', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(362, 1, 1, NULL, 'QHPPGC2A', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(363, 1, 1, NULL, '87TBKL2Z', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(364, 1, 1, NULL, 'G66PAAWH', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(365, 1, 1, NULL, 'Q3TGDY2W', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(366, 1, 1, NULL, 'NPSE8VMM', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(367, 1, 1, NULL, 'LEXQ6UY9', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(368, 1, 1, NULL, 'ECWHBACS', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(369, 1, 1, NULL, 'J6RB87MB', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(370, 1, 1, NULL, 'T56FQ2QD', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'active', 'batch', NULL, '2026-10-20 10:22:44', '2026-10-20 10:22:44', NULL, '2026-11-18 09:12:18', 16609985, 670, '3A:BB:1F:B4:0C:3E', '2026-10-20 10:22:44', '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(371, 1, 1, NULL, 'AURV34MR', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(372, 1, 1, NULL, 'D2RA6YUP', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(373, 1, 1, NULL, 'A4ARE58M', 'B261019091223A2', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:12:18', 0, 0, NULL, NULL, '2026-10-19 06:12:18', NULL, NULL, NULL, NULL, 'sonicpesa'),
(374, 1, 1, NULL, 'BPP7LY5G', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(375, 1, 1, NULL, '355M3U6L', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(376, 1, 1, NULL, '8D6ZDVEG', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(377, 1, 1, NULL, 'CT9FV3GS', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(378, 1, 1, NULL, 'ZNN6M3LB', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(379, 1, 1, NULL, 'HCU9CGEB', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(380, 1, 1, NULL, 'QJCUVFUN', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(381, 1, 1, NULL, 'TJSUDKD7', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(382, 1, 1, NULL, 'VQ3ATZP5', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(383, 1, 1, NULL, 'PAN5F2DJ', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(384, 1, 1, NULL, 'FXJRJM4F', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(385, 1, 1, NULL, 'J3QB852Z', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(386, 1, 1, NULL, '87SYED8Y', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(387, 1, 1, NULL, '7PDXX77S', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(388, 1, 1, NULL, 'E5BDC4WT', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(389, 1, 1, NULL, 'DKW5BUAN', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(390, 1, 1, NULL, 'WZ59UFBF', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(391, 1, 1, NULL, 'NRLEBTTG', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(392, 1, 1, NULL, 'MJZY8PGB', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(393, 1, 1, NULL, 'ZM97X5YW', 'B26101909203E2C', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:20:23', 0, 0, NULL, NULL, '2026-10-19 06:20:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(394, 1, 1, NULL, 'YLJJ8KJJ', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(395, 1, 1, NULL, 'ELSXPK9D', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(396, 1, 1, NULL, 'AV4VJYUS', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(397, 1, 1, NULL, 'B4MTRMJD', 'B261019094805E0', 200.00, 1, 'online', 0, 10.00, 5.00, 1, 'expired', 'batch', NULL, '2026-10-20 09:50:32', '2026-10-20 09:50:32', NULL, '2026-11-18 09:48:16', 85152424, 1875, '36:2E:83:D5:E3:C5', '2026-10-20 09:50:32', '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(398, 1, 1, NULL, 'E62FN5UT', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(399, 1, 1, NULL, 'JWUA9WPA', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(400, 1, 1, NULL, 'CTKJRZVV', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(401, 1, 1, NULL, 'QUMBRRH7', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'active', 'batch', NULL, '2026-10-20 01:38:51', '2026-10-20 01:38:51', NULL, '2026-11-18 09:48:16', 878822029, 3593, '84:C5:A6:78:CA:C6', '2026-10-20 12:36:57', '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(402, 1, 1, NULL, 'JFUW6G7P', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(403, 1, 1, NULL, 'GHT77W6G', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'active', 'batch', NULL, '2026-10-20 14:41:58', '2026-10-20 14:41:58', NULL, '2026-11-18 09:48:16', 12732283, 152, '7E:EC:5E:B9:D4:29', '2026-10-20 14:41:58', '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(404, 1, 1, NULL, 'LSSXL466', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(405, 1, 1, NULL, '5JKFZCK7', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(406, 1, 1, NULL, 'SEHQV9MN', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(407, 1, 1, NULL, 'ST4SC2LP', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(408, 1, 1, NULL, 'YPUNXF4L', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(409, 1, 1, NULL, 'ZLDMAESH', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(410, 1, 1, NULL, 'WLPSST8P', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(411, 1, 1, NULL, 'YZ3D6VY9', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'available', 'batch', NULL, NULL, NULL, NULL, '2026-11-18 09:48:16', 0, 0, NULL, NULL, '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(412, 1, 1, NULL, '23PASZ5W', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'active', 'batch', NULL, '2026-10-19 13:36:46', '2026-10-19 13:36:46', NULL, '2026-11-18 09:48:16', 0, 0, '36:2E:83:D5:E3:C5', '2026-10-19 14:15:19', '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(413, 1, 1, NULL, '4Q7LRW66', 'B261019094805E0', 200.00, 60, 'online', 0, 10.00, 5.00, 1, 'active', 'batch', NULL, '2026-10-20 14:20:03', '2026-10-20 14:20:03', NULL, '2026-11-18 09:48:16', 20361462, 131, 'AA:E0:BA:FE:FF:DE', '2026-10-20 14:20:03', '2026-10-19 06:48:16', NULL, NULL, NULL, NULL, 'sonicpesa'),
(548, 1, 1, 27, 'WB8ZR7MW', 'P261020144831A2', 500.00, 300, 'online', 0, 10.00, 5.00, 1, 'active', 'online', '0612710364', '2026-10-20 14:48:21', '2026-10-20 14:48:29', NULL, '2026-11-19 14:48:21', 732606, 398, '26:86:02:E6:AF:5E', '2026-10-20 14:48:29', '2026-10-20 11:48:21', NULL, NULL, NULL, NULL, 'sonicpesa'),
(549, 1, 1, 27, 'MGXPU39N', 'P2610201452BC9B', 500.00, 300, 'online', 0, 10.00, 5.00, 1, 'sold', 'online', '0612710364', '2026-10-20 14:52:23', NULL, NULL, '2026-11-19 14:52:23', 0, 0, NULL, NULL, '2026-10-20 11:52:23', NULL, NULL, NULL, NULL, 'sonicpesa'),
(550, 1, 1, 27, '4XUPA4EW', 'P261020153921B6', 200.00, 300, 'online', 0, 10.00, 5.00, 1, 'active', 'online', '0612710364', '2026-10-20 15:39:45', '2026-10-20 15:39:48', NULL, '2026-11-19 15:39:45', 659695151, 2513, '84:C5:A6:78:CA:C6', '2026-10-20 15:39:48', '2026-10-20 12:39:45', NULL, NULL, NULL, NULL, 'sonicpesa'),
(551, 1, 1, 27, 'XFDP74J2', 'P2610201549849E', 200.00, 300, 'online', 0, 10.00, 5.00, 1, 'active', 'online', '0612710364', '2026-10-20 15:49:08', '2026-10-20 15:49:11', NULL, '2026-11-19 15:49:08', 8740819, 436, '16:CA:B7:5D:D3:13', '2026-10-20 15:49:11', '2026-10-20 12:49:08', NULL, NULL, NULL, NULL, 'sonicpesa'),
(552, 1, 1, 27, 'VU3V3488', 'P26102015541F15', 200.00, 300, 'online', 0, 10.00, 5.00, 1, 'active', 'online', '0683277378', '2026-10-20 15:54:42', '2026-10-20 15:54:45', NULL, '2026-11-19 15:54:42', 357400621, 849, '3E:4F:9E:91:E7:2A', '2026-10-20 15:54:45', '2026-10-20 12:54:42', NULL, NULL, NULL, NULL, 'sonicpesa');

-- --------------------------------------------------------

--
-- Table structure for table `hs_voucher_macs`
--

CREATE TABLE `hs_voucher_macs` (
  `id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `mac` varchar(17) NOT NULL,
  `first_seen` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hs_voucher_macs`
--

INSERT INTO `hs_voucher_macs` (`id`, `voucher_id`, `mac`, `first_seen`, `last_seen`) VALUES
(1, 277, '84:C5:A6:78:CA:C6', '2026-10-15 15:05:27', '2026-10-15 15:05:27'),
(2, 280, '84:C5:A6:78:CA:C6', '2026-10-15 16:30:16', '2026-10-15 21:40:59'),
(4, 241, '12:68:32:86:B3:3D', '2026-10-15 21:12:08', '2026-10-15 21:13:58'),
(10, 285, '12:68:32:86:B3:3D', '2026-10-15 23:26:35', '2026-10-15 23:26:35'),
(11, 286, '12:68:32:86:B3:3D', '2026-10-15 23:33:28', '2026-10-15 23:56:20'),
(16, 282, '12:68:32:86:B3:3D', '2026-10-16 01:12:33', '2026-10-16 11:37:21'),
(19, 289, 'AA:47:E3:45:8F:3C', '2026-10-16 11:41:38', '2026-10-16 11:41:42'),
(21, 279, '84:C5:A6:78:CA:C6', '2026-10-16 12:31:09', '2026-10-20 01:29:05'),
(25, 290, '16:7B:95:67:FD:91', '2026-10-16 12:57:40', '2026-10-16 12:57:40'),
(27, 276, '26:86:02:E6:AF:5E', '2026-10-16 13:01:28', '2026-10-16 13:01:28'),
(28, 219, '12:68:32:86:B3:3D', '2026-10-16 13:06:32', '2026-10-16 13:06:32'),
(30, 271, 'AA:47:E3:45:8F:3C', '2026-10-17 21:26:08', '2026-10-17 21:27:51'),
(32, 268, 'BE:27:23:B1:AD:AF', '2026-10-17 21:31:37', '2026-10-17 21:31:37'),
(41, 238, '12:68:32:86:B3:3D', '2026-10-17 22:11:41', '2026-10-17 22:11:41'),
(44, 296, '26:86:02:E6:AF:5E', '2026-10-17 22:15:35', '2026-10-17 22:15:35'),
(48, 412, '36:2E:83:D5:E3:C5', '2026-10-19 13:36:46', '2026-10-19 14:15:19'),
(53, 401, '84:C5:A6:78:CA:C6', '2026-10-20 01:38:51', '2026-10-20 12:36:57'),
(55, 397, '36:2E:83:D5:E3:C5', '2026-10-20 09:50:32', '2026-10-20 09:50:32'),
(56, 370, '3A:BB:1F:B4:0C:3E', '2026-10-20 10:22:44', '2026-10-20 10:22:44'),
(58, 413, 'AA:E0:BA:FE:FF:DE', '2026-10-20 14:20:03', '2026-10-20 14:20:03'),
(59, 403, '7E:EC:5E:B9:D4:29', '2026-10-20 14:41:58', '2026-10-20 14:41:58'),
(60, 548, '26:86:02:E6:AF:5E', '2026-10-20 14:48:29', '2026-10-20 14:48:29'),
(61, 550, '84:C5:A6:78:CA:C6', '2026-10-20 15:39:48', '2026-10-20 15:39:48'),
(62, 551, '16:CA:B7:5D:D3:13', '2026-10-20 15:49:11', '2026-10-20 15:49:11'),
(63, 552, '3E:4F:9E:91:E7:2A', '2026-10-20 15:54:45', '2026-10-20 15:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT 0.00,
  `tax_rate` decimal(5,2) DEFAULT 0.00,
  `discount_amount` decimal(15,2) DEFAULT 0.00,
  `total_amount` decimal(15,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'TZS',
  `status` enum('draft','sent','paid','overdue','cancelled') DEFAULT 'draft',
  `due_date` date DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  `is_starred` tinyint(1) DEFAULT 0,
  `is_archived` tinyint(1) DEFAULT 0,
  `is_deleted_by_sender` tinyint(1) DEFAULT 0,
  `is_deleted_by_receiver` tinyint(1) DEFAULT 0,
  `attachments` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `parent_id`, `subject`, `message`, `is_read`, `read_at`, `is_starred`, `is_archived`, `is_deleted_by_sender`, `is_deleted_by_receiver`, `attachments`, `created_at`) VALUES
(1, 3, 1, NULL, 'Habari', 'Nakukubali', 0, NULL, 0, 0, 0, 0, NULL, '2026-10-05 09:41:11');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `type` enum('info','success','warning','error','payment') DEFAULT 'info',
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `link` varchar(500) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `is_read`, `created_at`, `link`, `icon`, `read_at`) VALUES
(1, 2, 'HABARI', 'MABADILIKO YA VIFURUSHI', 'info', 0, '2026-10-19 13:03:35', NULL, 'bullhorn', NULL),
(2, 3, 'HABARI', 'MABADILIKO YA VIFURUSHI', 'info', 0, '2026-10-19 13:03:35', NULL, 'bullhorn', NULL),
(3, 2, 'Kuna tatizo upande wa kutoa pesa', 'tunashughulikia tatizo hili kuweni wapole', 'info', 0, '2026-10-19 13:04:35', NULL, 'bullhorn', NULL),
(4, 3, 'Kuna tatizo upande wa kutoa pesa', 'tunashughulikia tatizo hili kuweni wapole', 'info', 0, '2026-10-19 13:04:35', NULL, 'bullhorn', NULL),
(5, 1, 'Access point offline', 'EAP225 Main → Omada status HEARTBEAT_MISSED', 'error', 0, '2026-10-19 18:21:27', '?page=hotspot&id=27', 'triangle-exclamation', NULL),
(6, 1, 'Access point online', 'EAP225 Main CONNECTED • 0 client(s)', 'success', 0, '2026-10-19 19:59:56', '?page=hotspot&id=27', 'wifi', NULL),
(7, 1, 'NAS ID received from Omada', 'EAP225 Main: TP-Link', 'info', 0, '2026-10-19 22:29:05', '?page=hotspot&id=27', 'tower-broadcast', NULL),
(8, 1, 'Access point offline', 'EAP225 Main → Omada status PROVISIONING', 'error', 0, '2026-10-19 23:09:36', '?page=hotspot&id=27', 'triangle-exclamation', NULL),
(9, 1, 'Access point online', 'EAP225 Main CONNECTED • 0 client(s)', 'success', 0, '2026-10-19 23:12:56', '?page=hotspot&id=27', 'wifi', NULL),
(10, 1, 'Access point offline', 'EAP225 Main → Omada status HEARTBEAT_MISSED', 'error', 0, '2026-10-20 07:35:59', '?page=hotspot&id=27', 'triangle-exclamation', NULL),
(11, 2, 'HABARIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII', 'ENJOY', 'info', 0, '2026-10-20 08:53:12', NULL, 'bullhorn', NULL),
(12, 3, 'HABARIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII', 'ENJOY', 'info', 0, '2026-10-20 08:53:12', NULL, 'bullhorn', NULL),
(13, 1, 'Access point online', 'EAP225 Main CONNECTED • 0 client(s)', 'success', 0, '2026-10-20 09:27:38', '?page=hotspot&id=27', 'wifi', NULL),
(14, 1, 'Customer says payment was made', 'SKY261020125608AD5E • TZS 500 • 0612710364', 'payment', 0, '2026-10-20 09:57:22', '?page=orders&status=pending', 'money-bill', NULL),
(15, 1, 'Customer says payment was made', 'SKY261020140027DEFC • TZS 500 • 0612710364', 'payment', 0, '2026-10-20 11:01:30', '?page=orders&status=pending', 'money-bill', NULL),
(16, 1, 'Customer says payment was made', 'SKY261020140027DEFC • TZS 500 • 0612710364', 'payment', 0, '2026-10-20 11:30:40', '?page=transactions&status=attention', 'money-bill', NULL),
(17, 1, 'Customer says payment was made', 'SKY261020140027DEFC • TZS 500 • 0612710364', 'payment', 0, '2026-10-20 11:46:07', '?page=transactions&status=attention', 'money-bill', NULL),
(18, 1, 'New sale', 'SKY261020140027DEFC • TZS 500 • 0612710364 • WB8ZR7MW', 'success', 0, '2026-10-20 11:48:21', '?page=transactions&status=paid', 'check', NULL),
(19, 1, 'New sale', 'SKY261020125608AD5E • TZS 500 • 0612710364 • MGXPU39N', 'success', 0, '2026-10-20 11:52:23', '?page=transactions&status=paid', 'check', NULL),
(20, 1, 'Payment pending', 'SKY2610201456033E26 • TZS 500 • 0612710364 • MASAA 6', 'payment', 0, '2026-10-20 11:56:04', '?page=transactions&status=attention', 'money-bill', NULL),
(21, 1, 'Customer says payment was made', 'SKY2610201456033E26 • TZS 500 • 0612710364', 'payment', 0, '2026-10-20 11:56:26', '?page=transactions&status=attention', 'money-bill', NULL),
(22, 1, 'Payment pending', 'SKY2610201456531059 • TZS 500 • 0612710364 • MASAA 6', 'payment', 0, '2026-10-20 11:56:54', '?page=transactions&status=attention', 'money-bill', NULL),
(23, 1, 'Payment pending', 'SKY2610201512187FCD • TZS 500 • 0612710364 • MASAA 6', 'payment', 0, '2026-10-20 12:12:19', '?page=transactions&status=attention', 'money-bill', NULL),
(24, 1, 'Customer says payment was made', 'SKY2610201512187FCD • TZS 500 • 0612710364', 'payment', 0, '2026-10-20 12:12:39', '?page=transactions&status=attention', 'money-bill', NULL),
(25, 1, 'Payment pending', 'SKY2610201513476409 • TZS 5,000 • 0612710364 • WEEK 1', 'payment', 0, '2026-10-20 12:13:47', '?page=transactions&status=attention', 'money-bill', NULL),
(26, 1, 'Customer says payment was made', 'SKY2610201513476409 • TZS 5,000 • 0612710364', 'payment', 0, '2026-10-20 12:20:36', '?page=transactions&status=attention', 'money-bill', NULL),
(27, 1, 'Payment pending', 'SKY261020152042125C • TZS 200 • 0612710364 • MASAA 6', 'payment', 0, '2026-10-20 12:20:43', '?page=transactions&status=attention', 'money-bill', NULL),
(28, 1, 'USSD push failed', 'SKY26102015301809D6 • 0612710364 • HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • HTTP 404 { \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\" } | retry: HTTP 404 { \"message\": \"The route api/v1/https//api.sonicpe', 'error', 0, '2026-10-20 12:30:20', '?page=transactions&status=failed', 'triangle-exclamation', NULL),
(29, 1, 'Customer says payment was made', 'SKY261020152042125C • TZS 200 • 0612710364', 'payment', 0, '2026-10-20 12:36:04', '?page=transactions&status=attention', 'money-bill', NULL),
(30, 1, 'New sale', 'SKY2610201539204CE4 • TZS 200 • 0612710364 • 4XUPA4EW', 'success', 0, '2026-10-20 12:39:45', '?page=transactions&status=paid', 'check', NULL),
(31, 1, 'Customer says payment was made', 'SKY261020154616F47A • TZS 200 • 0667357937', 'payment', 0, '2026-10-20 12:47:33', '?page=transactions&status=attention', 'money-bill', NULL),
(32, 1, 'New sale', 'SKY261020154849FF31 • TZS 200 • 0612710364 • XFDP74J2', 'success', 0, '2026-10-20 12:49:08', '?page=transactions&status=paid', 'check', NULL),
(33, 1, 'New sale', 'SKY261020155411ED42 • TZS 200 • 0683277378 • VU3V3488', 'success', 0, '2026-10-20 12:54:42', '?page=transactions&status=paid', 'check', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration_minutes` int(11) NOT NULL,
  `data_limit_mb` int(11) DEFAULT 0,
  `speed_limit_mbps` int(11) DEFAULT 5,
  `max_devices` int(11) DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `client_session_id` int(11) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'TZS',
  `order_id` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `package_type` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'pending',
  `payment_method` varchar(30) DEFAULT NULL,
  `gateway_response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `failure_reason` varchar(500) DEFAULT NULL,
  `router_id` int(11) DEFAULT NULL,
  `router_ssid` varchar(100) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `seller_id`, `voucher_id`, `client_session_id`, `amount`, `currency`, `order_id`, `transaction_id`, `phone_number`, `package_type`, `payment_status`, `payment_method`, `gateway_response`, `created_at`, `updated_at`, `failure_reason`, `router_id`, `router_ssid`, `package_id`) VALUES
(1, NULL, 3, NULL, 3, 500.00, 'TZS', NULL, NULL, '255715645325', 'wifi', 'pending', 'sonicpesa', NULL, '2026-10-04 23:03:27', '2026-10-04 23:03:27', NULL, 1, 'SkyTanza-Sample-878', 2),
(2, NULL, 3, NULL, 4, 500.00, 'TZS', NULL, NULL, '255715645325', 'wifi', 'pending', 'sonicpesa', NULL, '2026-10-04 23:03:47', '2026-10-04 23:03:47', NULL, 1, 'SkyTanza-Sample-878', 2),
(3, NULL, 3, 1, 7, 500.00, 'TZS', 'sp_6ac3650d5fbbb', NULL, '255612710364', 'wifi', 'completed', 'sonicpesa', '{\"order_id\":\"sp_6ac3650d5fbbb\",\"transaction_id\":null,\"phone\":\"255612710364\",\"amount\":\"500.00\",\"package_id\":2,\"router_id\":1,\"voucher_code\":\"SKY631E2F7F\",\"paid_at\":\"2026-10-05 08:51:43\"}', '2026-10-05 08:51:43', '2026-10-05 08:51:43', NULL, NULL, NULL, NULL),
(4, NULL, 2, 2, 10, 500.00, 'TZS', 'sp_6ac37cd319414', NULL, '255612710364', 'wifi', 'completed', 'sonicpesa', '{\"order_id\":\"sp_6ac37cd319414\",\"transaction_id\":null,\"phone\":\"255612710364\",\"amount\":\"500.00\",\"package_id\":3,\"router_id\":2,\"voucher_code\":\"SKY9D2EEAC5\",\"paid_at\":\"2026-10-05 10:33:08\"}', '2026-10-05 10:33:08', '2026-10-05 10:33:08', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_attempts`
--

CREATE TABLE `payment_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `mac_address` varchar(32) DEFAULT NULL,
  `transaction_ref` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_type` enum('percentage','fixed') DEFAULT 'percentage',
  `discount_value` decimal(10,2) NOT NULL,
  `min_amount` decimal(10,2) DEFAULT 0.00,
  `max_discount` decimal(10,2) DEFAULT 0.00,
  `usage_limit` int(11) DEFAULT 0,
  `used_count` int(11) DEFAULT 0,
  `per_user_limit` int(11) DEFAULT 1,
  `seller_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `starts_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_code_usage`
--

CREATE TABLE `promo_code_usage` (
  `id` int(11) NOT NULL,
  `promo_code_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `api_endpoint` varchar(255) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `api_secret` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `name`, `code`, `logo`, `api_endpoint`, `api_key`, `api_secret`, `status`, `created_at`) VALUES
(1, 'Vodacom', 'VODACOM', NULL, NULL, NULL, NULL, 'active', '2026-10-04 10:59:33'),
(2, 'Airtel', 'AIRTEL', NULL, NULL, NULL, NULL, 'active', '2026-10-04 10:59:33'),
(3, 'Tigo', 'TIGO', NULL, NULL, NULL, NULL, 'active', '2026-10-04 10:59:33'),
(4, 'Halotel', 'HALOTEL', NULL, NULL, NULL, NULL, 'active', '2026-10-04 10:59:33'),
(5, 'TTCL', 'TTCL', NULL, NULL, NULL, NULL, 'active', '2026-10-04 10:59:33');

-- --------------------------------------------------------

--
-- Table structure for table `rate_limits`
--

CREATE TABLE `rate_limits` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `action` varchar(50) NOT NULL,
  `attempts` int(11) DEFAULT 1,
  `window_start` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rate_limits`
--

INSERT INTO `rate_limits` (`id`, `identifier`, `action`, `attempts`, `window_start`) VALUES
(88, '197.186.28.103', 'login', 1, '2026-10-19 18:32:30'),
(96, '197.186.28.103|36:2E:83:D5:E3:C5', 'portal_check', 2, '2026-10-19 18:35:00'),
(99, '197.186.28.103|84:C5:A6:78:CA:C6', 'portal_check', 2, '2026-10-19 18:35:48'),
(102, '197.186.19.197|84:C5:A6:78:CA:C6', 'portal_check', 9, '2026-10-20 02:38:59'),
(103, '197.186.19.197', 'login', 2, '2026-10-20 02:05:08'),
(104, '197.186.19.197|36:2E:83:D5:E3:C5', 'portal_check', 2, '2026-10-20 01:47:25'),
(105, '196.249.113.181|36:2E:83:D5:E3:C5', 'portal_check', 8, '2026-10-20 01:01:44'),
(106, '196.249.113.181|36:2E:83:D5:E3:C5', 'portal_report', 4, '2026-10-20 01:01:45'),
(107, '196.249.113.242|36:2E:83:D5:E3:C5', 'portal_check', 6, '2026-10-20 01:42:35'),
(108, '197.186.19.197|3A:BB:1F:B4:0C:3E', 'portal_check', 6, '2026-10-20 02:13:33'),
(109, '197.186.6.17|36:2E:83:D5:E3:C5', 'portal_check', 3, '2026-10-20 14:11:19'),
(110, '196.249.113.112|36:2E:83:D5:E3:C5', 'portal_check', 3, '2026-10-20 08:26:30'),
(111, '197.186.6.17|84:C5:A6:78:CA:C6', 'portal_check', 2, '2026-10-20 16:01:11'),
(112, '197.186.6.17|16:CA:B7:5D:D3:13', 'portal_check', 4, '2026-10-20 09:03:41'),
(113, '197.186.6.17', 'login', 2, '2026-10-20 14:01:46'),
(114, '197.186.6.17|CA:59:74:07:B9:E5', 'portal_check', 3, '2026-10-20 10:17:05'),
(115, '197.186.6.17|3A:BB:1F:B4:0C:3E', 'portal_check', 1, '2026-10-20 14:55:51'),
(116, '197.186.6.17|84:C5:A6:78:CA:C6', 'portal_mine', 1, '2026-10-20 15:38:59'),
(117, '197.186.6.17|84:C5:A6:78:CA:C6', 'portal_buy', 2, '2026-10-20 15:30:18'),
(118, 'spSKY261020122923BB61', 'sp_status', 1, '2026-10-20 16:13:42'),
(119, '197.186.6.17|3A:FC:9E:B9:64:BD', 'portal_check', 1, '2026-10-20 12:55:34'),
(120, '197.186.6.17|3A:FC:9E:B9:64:BD', 'portal_mine', 3, '2026-10-20 12:55:34'),
(121, '197.186.6.17|3A:FC:9E:B9:64:BD', 'portal_buy', 1, '2026-10-20 12:56:08'),
(122, 'spSKY261020125608AD5E', 'sp_status', 1, '2026-10-20 13:03:09'),
(123, '197.186.6.17|3A:FC:9E:B9:64:BD', 'portal_ipaid', 2, '2026-10-20 12:57:21'),
(124, 'ipaidSKY261020125608AD5E', 'ipaid_notify', 1, '2026-10-20 12:57:22'),
(125, '197.186.6.17|36:2E:83:D5:E3:C5', 'portal_mine', 1, '2026-10-20 15:05:57'),
(126, '196.249.96.13', 'login', 1, '2026-10-20 13:44:19'),
(127, 'spSKY261020125608AD5E', 'sp_bg', 1, '2026-10-20 14:51:37'),
(128, 'spSKY261020122923BB61', 'sp_bg', 1, '2026-10-20 16:21:39'),
(129, '197.186.6.17|26:86:02:E6:AF:5E', 'portal_mine', 1, '2026-10-20 14:45:05'),
(130, '197.186.6.17|26:86:02:E6:AF:5E', 'portal_buy', 1, '2026-10-20 14:00:27'),
(131, 'spSKY261020140027DEFC', 'sp_status', 1, '2026-10-20 14:48:11'),
(132, 'spSKY261020140027DEFC', 'sp_bg', 1, '2026-10-20 14:46:39'),
(133, '197.186.6.17|26:86:02:E6:AF:5E', 'portal_ipaid', 1, '2026-10-20 14:30:39'),
(134, 'ipaidSKY261020140027DEFC', 'ipaid_notify', 1, '2026-10-20 14:46:07'),
(135, '197.186.6.17|26:86:02:E6:AF:5E', 'portal_check', 1, '2026-10-20 14:45:06'),
(136, '197.186.6.17|AA:E0:BA:FE:FF:DE', 'portal_check', 4, '2026-10-20 14:19:56'),
(137, '197.186.6.17|AA:E0:BA:FE:FF:DE', 'portal_mine', 2, '2026-10-20 14:14:28'),
(138, '197.186.6.17|7E:EC:5E:B9:D4:29', 'portal_mine', 1, '2026-10-20 14:33:17'),
(139, '197.186.6.17|7E:EC:5E:B9:D4:29', 'portal_check', 1, '2026-10-20 14:33:17'),
(140, '196.249.96.13|7E:EC:5E:B9:D4:29', 'portal_check', 5, '2026-10-20 14:41:52'),
(141, '196.249.96.13|7E:EC:5E:B9:D4:29', 'portal_mine', 3, '2026-10-20 14:41:52'),
(142, '196.249.96.13|26:86:02:E6:AF:5E', 'portal_mine', 5, '2026-10-20 14:45:07'),
(143, '196.249.96.13|26:86:02:E6:AF:5E', 'portal_ipaid', 2, '2026-10-20 14:46:06'),
(144, '196.249.96.13|26:86:02:E6:AF:5E', 'portal_check', 3, '2026-10-20 14:46:31'),
(145, '197.186.6.17|3A:BB:1F:B4:0C:3E', 'portal_mine', 1, '2026-10-20 14:55:51'),
(146, '196.249.96.13|3A:BB:1F:B4:0C:3E', 'portal_mine', 1, '2026-10-20 15:02:58'),
(147, '196.249.96.13|3A:BB:1F:B4:0C:3E', 'portal_buy', 2, '2026-10-20 14:56:03'),
(148, '196.249.96.13|3A:BB:1F:B4:0C:3E', 'portal_ipaid', 1, '2026-10-20 14:56:26'),
(149, 'ipaidSKY2610201456033E26', 'ipaid_notify', 1, '2026-10-20 14:56:26'),
(150, '196.249.96.13|36:2E:83:D5:E3:C5', 'portal_mine', 1, '2026-10-20 15:05:59'),
(151, '196.249.96.13|16:CA:B7:5D:D3:13', 'portal_mine', 1, '2026-10-20 15:48:16'),
(152, '196.249.96.13|16:CA:B7:5D:D3:13', 'portal_buy', 1, '2026-10-20 15:48:49'),
(153, '196.249.96.13|16:CA:B7:5D:D3:13', 'portal_ipaid', 2, '2026-10-20 15:36:04'),
(154, 'ipaidSKY2610201512187FCD', 'ipaid_notify', 1, '2026-10-20 15:12:39'),
(155, '197.186.6.17|16:CA:B7:5D:D3:13', 'portal_mine', 1, '2026-10-20 15:47:14'),
(156, 'ipaidSKY2610201513476409', 'ipaid_notify', 1, '2026-10-20 15:20:36'),
(157, '197.186.6.17|16:CA:B7:5D:D3:13', 'portal_buy', 4, '2026-10-20 15:27:26'),
(158, 'spfail1', 'sp_push_fail', 1, '2026-10-20 15:30:20'),
(159, 'ipaidSKY261020152042125C', 'ipaid_notify', 1, '2026-10-20 15:36:04'),
(160, '197.186.6.17|82:86:B6:CF:AF:72', 'portal_mine', 1, '2026-10-20 15:46:05'),
(161, 'spSKY2610201539204CE4', 'sp_bg', 1, '2026-10-20 15:39:36'),
(162, 'spSKY2610201539204CE4', 'sp_status', 1, '2026-10-20 15:39:37'),
(163, '197.186.6.17|EA:40:D7:8B:23:46', 'portal_mine', 1, '2026-10-20 15:43:27'),
(164, '197.186.6.17|7E:0E:21:D4:B2:FB', 'portal_mine', 1, '2026-10-20 15:45:09'),
(165, '197.186.6.17|82:86:B6:CF:AF:72', 'portal_buy', 2, '2026-10-20 15:46:16'),
(166, 'spSKY261020154616F47A', 'sp_status', 1, '2026-10-20 15:47:55'),
(167, 'spSKY261020154616F47A', 'sp_bg', 1, '2026-10-20 16:21:38'),
(168, '197.186.6.17|82:86:B6:CF:AF:72', 'portal_ipaid', 1, '2026-10-20 15:47:32'),
(169, 'ipaidSKY261020154616F47A', 'ipaid_notify', 1, '2026-10-20 15:47:33'),
(170, 'spSKY2610201548093491', 'sp_status', 1, '2026-10-20 15:49:13'),
(171, 'spSKY2610201548093491', 'sp_bg', 1, '2026-10-20 16:21:37'),
(172, 'spSKY261020154849FF31', 'sp_status', 1, '2026-10-20 15:49:07'),
(173, '196.249.96.13|16:CA:B7:5D:D3:13', 'portal_check', 2, '2026-10-20 15:49:10'),
(174, '197.186.6.17|3E:4F:9E:91:E7:2A', 'portal_mine', 1, '2026-10-20 15:53:50'),
(175, '197.186.6.17|3E:4F:9E:91:E7:2A', 'portal_buy', 1, '2026-10-20 15:54:11'),
(176, 'spSKY261020155411ED42', 'sp_status', 1, '2026-10-20 15:54:41'),
(177, 'spSKY261020155411ED42', 'sp_bg', 1, '2026-10-20 15:54:37'),
(178, '197.186.6.17|3E:4F:9E:91:E7:2A', 'portal_check', 2, '2026-10-20 15:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(11) NOT NULL,
  `referrer_id` int(11) NOT NULL,
  `referred_id` int(11) NOT NULL,
  `referral_code` varchar(50) NOT NULL,
  `bonus_amount` decimal(15,2) DEFAULT 0.00,
  `bonus_paid` tinyint(1) DEFAULT 0,
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `title` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `is_published` tinyint(1) DEFAULT 1,
  `seller_reply` text DEFAULT NULL,
  `seller_replied_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routers`
--

CREATE TABLE `routers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `device_name` varchar(100) NOT NULL,
  `device_type` enum('tp-link','omada','mikrotik','ubiquiti','other') DEFAULT 'tp-link',
  `model` varchar(100) DEFAULT NULL,
  `mac_address` varchar(17) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `ssid` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `api_port` int(11) DEFAULT 80,
  `api_username` varchar(50) DEFAULT NULL,
  `api_password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `bandwidth_limit` int(11) DEFAULT 0,
  `max_clients` int(11) DEFAULT 50,
  `status` enum('online','offline','maintenance') DEFAULT 'offline',
  `last_seen` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip_subnet` varchar(30) DEFAULT NULL,
  `api_url` varchar(255) DEFAULT NULL,
  `api_user` varchar(80) DEFAULT NULL,
  `api_pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `router_bandwidth`
--

CREATE TABLE `router_bandwidth` (
  `id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL,
  `download_mbps` decimal(10,2) DEFAULT 0.00,
  `upload_mbps` decimal(10,2) DEFAULT 0.00,
  `latency_ms` int(11) DEFAULT 0,
  `packet_loss_percent` decimal(5,2) DEFAULT 0.00,
  `connected_clients` int(11) DEFAULT 0,
  `cpu_usage_percent` decimal(5,2) DEFAULT 0.00,
  `memory_usage_percent` decimal(5,2) DEFAULT 0.00,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_time_adjustments`
--

CREATE TABLE `session_time_adjustments` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `adjustment_minutes` int(11) NOT NULL,
  `old_expiry` datetime DEFAULT NULL,
  `new_expiry` datetime DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `router_was_offline` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_group` varchar(50) DEFAULT 'general',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`, `setting_group`, `updated_at`) VALUES
(1, 'site_name', 'SkyTanza WiFi', 'general', '2026-10-04 10:59:33'),
(2, 'site_url', 'https://wifi.skytanzania.co.tz/index.php', 'general', '2026-10-14 17:16:58'),
(3, 'currency', 'TZS', 'general', '2026-10-04 10:59:33'),
(4, 'commission_percentage', '20', 'payment', '2026-10-04 10:59:33'),
(5, 'admin_commission', '10', 'payment', '2026-10-04 10:59:33'),
(6, 'min_withdrawal', '31997', 'payment', '2026-10-20 08:51:49'),
(7, 'withdrawal_fee', '500', 'payment', '2026-10-04 10:59:33'),
(8, 'registration_bonus', '0', 'payment', '2026-10-04 10:59:33'),
(9, 'session_timeout', '60', 'wifi', '2026-10-04 10:59:33'),
(10, 'auto_disconnect', '1', 'wifi', '2026-10-04 10:59:33'),
(13, 'platform_commission_percent', '4', 'payment', '2026-10-20 08:52:04'),
(14, 'radius_strict_ap', '0', 'radius', '2026-10-12 16:20:53'),
(15, 'radius_idle_timeout', '884', 'radius', '2026-10-14 17:16:58'),
(16, 'radius_allowed_ips', '', 'radius', '2026-10-12 16:20:53'),
(17, 'radius_reply_lang', 'sw', 'radius', '2026-10-12 16:20:53'),
(18, 'voucher_length', '8', 'general', '2026-10-12 16:20:53'),
(19, 'controller_url', 'http://0.0.0.0', 'radius', '2026-10-14 17:12:30'),
(20, 'hk_last_run', '1792502557', 'system', '2026-10-20 13:22:37'),
(21, 'hk_last_result', '2026-10-20 16:22:37 {\"stale\":0,\"expired\":0,\"orders_expired\":0,\"payouts\":0,\"payments_confirmed\":0}', 'system', '2026-10-20 13:22:37'),
(22, 'schema_version', '17', 'system', '2026-10-20 12:12:00'),
(28, 'radius_server_ip', '169.58.93.38', 'radius', '2026-10-13 09:53:35'),
(29, 'acct_server_ip', '169.58.93.38', 'radius', '2026-10-14 17:12:30'),
(30, 'dae_enabled', '1', 'radius', '2026-10-12 18:35:06'),
(31, 'radius_server_seen', '1792502571', 'radius', '2026-10-20 13:22:51'),
(32, 'radius_server_info', '{\"version\":\"6.1.2\",\"host\":\"skyradius\",\"uptime\":35534,\"relay_pid\":285184,\"relay_mode\":\"child\",\"queue\":0,\"stats\":{\"accept\":9,\"reject\":0,\"acct\":190,\"dropped\":1,\"dae_ok\":0,\"dae_fail\":6,\"api_errors\":1,\"learned\":0},\"unknown\":[],\"badpw\":[],\"ip\":\"169.58.93.38\"}', 'radius', '2026-10-20 13:22:51'),
(2214, 'omada_last_sync', '1792502571', 'system', '2026-10-20 13:22:51'),
(3637, 'starter_vouchers', '20', 'provision', '2026-10-13 21:54:02'),
(3638, 'starter_package_minutes', '60', 'provision', '2026-10-13 21:54:02'),
(3639, 'starter_package_price', '500', 'provision', '2026-10-13 21:54:02'),
(3738, 'server_errors', '[{\"ref\":\"4B4FE015\",\"at\":\"2026-10-19 16:02:05\",\"msg\":\"mysqli_sql_exception: Unknown column \'link\' in \'INSERT INTO\' [called from line 2555 ← 5815]\",\"where\":\"index.php:1302\",\"url\":\"/?page=admin\"},{\"ref\":\"3A36E0B1\",\"at\":\"2026-10-18 18:21:39\",\"msg\":\"mysqli_sql_exception: Unknown column \'link\' in \'INSERT INTO\' [called from line 2830 ← 5248 ← 5552]\",\"where\":\"index.php:1290\",\"url\":\"/?ajax=portal_buy\"},{\"ref\":\"5603E9D2\",\"at\":\"2026-10-18 17:08:56\",\"msg\":\"mysqli_sql_exception: Unknown column \'sonic_pesa_withdrawal_id\' in \'WHERE\' [called from line 1295 ← 5429 ← 5422 ← 6498]\",\"where\":\"index.php:1290\",\"url\":\"/?page=radius\"},{\"ref\":\"26DB31B3\",\"at\":\"2026-10-15 18:40:07\",\"msg\":\"mysqli_sql_exception: Unknown column \'sms_enabled\' in \'SET\' [called from line 1298 ← 6251]\",\"where\":\"index.php:1290\",\"url\":\"/?page=settings\"},{\"ref\":\"A6B3C2D9\",\"at\":\"2026-10-15 14:58:28\",\"msg\":\"mysqli_sql_exception: Unknown column \'link\' in \'INSERT INTO\' [called from line 2830 ← 2926 ← 5098 ← 5007 ← 5480]\",\"where\":\"index.php:1290\",\"url\":\"/index?radius=authorize\"},{\"ref\":\"F072F1C2\",\"at\":\"2026-10-15 14:00:14\",\"msg\":\"mysqli_sql_exception: Unknown column \'link\' in \'INSERT INTO\' [called from line 2830 ← 5248 ← 5552]\",\"where\":\"index.php:1290\",\"url\":\"/?ajax=portal_buy\"},{\"ref\":\"8BABD302\",\"at\":\"2026-10-14 01:26:44\",\"msg\":\"mysqli_sql_exception: Unknown column \'region\' in \'INSERT INTO\' [called from line 2228 ← 3621]\",\"where\":\"index.php:814\",\"url\":\"/index?page=devices\"}]', 'general', '2026-10-19 13:02:05'),
(3750, 'omada_site_region', 'Tanzania', 'omada', '2026-10-13 22:30:55'),
(3751, 'omada_site_timezone', 'Africa/Nairobi', 'omada', '2026-10-13 22:30:55'),
(6550, 'omada_push_since', '1791997950', 'omada', '2026-10-14 17:12:30'),
(6551, 'omada_push_needed', '0', 'omada', '2026-10-14 17:12:36'),
(6642, 'api_probe', '{\"base\":\"https://wifi.skytanzania.co.tz\",\"start\":\"https://wifi.skytanzania.co.tz/index.php\",\"url\":\"https://wifi.skytanzania.co.tz/index\",\"redirects\":[\"301 → https://wifi.skytanzania.co.tz/index?radius=ping\"],\"ok\":true,\"code\":403,\"msg\":\"\",\"at\":1792498707}', 'general', '2026-10-20 12:18:27'),
(6643, 'api_endpoint', 'https://wifi.skytanzania.co.tz/index', 'general', '2026-10-14 16:54:50'),
(7398, 'omada_relay_seen', '1792502602', 'omada', '2026-10-20 13:23:22'),
(7399, 'omada_relay_info', '{\"version\":\"6.1.2\",\"host\":\"skyradius\",\"pid\":285184,\"uptime\":35555,\"stats\":{\"jobs\":170,\"ok\":170,\"fail\":0,\"last_ms\":47,\"last_at\":\"2026-10-20T16:20:51+03:00\",\"last_error\":\"\"},\"pcntl\":true,\"standalone\":false,\"os\":\"Linux\",\"ip\":\"169.58.93.38\",\"at\":\"2026-10-20T16:23:12+03:00\"}', 'omada', '2026-10-20 13:23:12'),
(7400, 'omada_default_client_id', 'e297a520af804accbfaf57e0a26057db', 'omada', '2026-10-15 07:49:13'),
(7401, 'omada_default_client_secret', 'v1:1wWr7MgJelzuBMnxZO3z0o+FJuaaJq3WqGtTYlu4tlhN3zqUhQ9m0IFRn2/x+gSheQ2jQy2Elh89hpZO', 'omada', '2026-10-15 07:49:13'),
(9177, 'om_vsync_1', '1792500616', 'general', '2026-10-20 12:50:16'),
(17150, 'omada_default_inform', 'omada://169.58.93.38?dPort=29810&mPort=29814&omadacId=cb886e281a1029cbdafb1c93f14ba1', 'general', '2026-10-15 08:25:57'),
(18111, 'omada_relay:skyradius', '{\"host\":\"skyradius\",\"version\":\"6.1.1\",\"os\":\"Linux\",\"pid\":40695,\"standalone\":false,\"nets\":[\"169.58.0.0/17\",\"172.17.0.0/16\"],\"stats\":{\"jobs\":27,\"ok\":20,\"fail\":7,\"last_ms\":4,\"last_at\":\"2026-10-15T11:22:52+03:00\",\"last_error\":\"Failed to connect to 192.168.18.4 port 8043 after 8003 ms: Timeout was reached\"},\"ip\":\"169.58.93.38\",\"seen\":1792052763}', 'general', '2026-10-15 08:26:03'),
(23560, 'om_vsync_3', '1792493285', 'general', '2026-10-20 10:48:05'),
(126942, 'sonic_collect_endpoint', '', 'payment', '2026-10-20 12:37:31'),
(126943, 'sales_contact_phone', '0612710364', 'payment', '2026-10-20 08:26:25'),
(127349, 'allow_registration', '1', 'general', '2026-10-20 08:51:49'),
(129286, 'sp_poll_last', '1792502557', 'system', '2026-10-20 13:22:37'),
(129695, 'sonic_api_key', 'v1:JO/SBkbvdBKQaUxd3xloEtfuNRuNXclL3VDS/4V80rV1+ui0MFVd/Thj3Lijd/TZGN8eMrTf7uQW5Q4l+0G+XVjqhCtE9wcxVup8fA==', 'payment', '2026-10-20 11:29:21'),
(129696, 'sonic_api_secret', '', 'payment', '2026-10-20 11:26:24'),
(130686, 'sp_last_push_error', '2026-10-20 15:30:20 • SKY26102015301809D6 • 0612710364 • TZS 200 • HTTP 404 The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found. • HTTP 404 { \"message\": \"The route api/v1/https//api.sonicpesa.com/api/v1/payment/create_order_simple could not be found.\" } | retry: HTTP 404 { \"message\": \"The route api/v1/https//api.sonicpe', 'general', '2026-10-20 12:30:20'),
(130801, 'omada_portal_auth_url', '', 'general', '2026-10-20 12:37:31');

-- --------------------------------------------------------

--
-- Table structure for table `sonicpesa_orders`
--

CREATE TABLE `sonicpesa_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `client_mac` varchar(50) NOT NULL,
  `client_ip` varchar(45) DEFAULT NULL,
  `package_id` int(11) NOT NULL,
  `router_id` int(11) NOT NULL DEFAULT 0,
  `order_id` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `currency` varchar(5) DEFAULT 'TZS',
  `payment_method` varchar(20) DEFAULT NULL,
  `payment_phone` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'pending',
  `transaction_id` varchar(100) DEFAULT NULL,
  `provider_ref` varchar(150) DEFAULT NULL,
  `metadata` text DEFAULT NULL,
  `raw_response` text DEFAULT NULL,
  `voucher_id` int(11) DEFAULT 0,
  `session_id` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_payments`
--

CREATE TABLE `sp_payments` (
  `id` int(11) NOT NULL,
  `sp_order_id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL,
  `currency` varchar(5) DEFAULT 'TZS',
  `phone_number` varchar(20) DEFAULT NULL,
  `package_type` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'pending',
  `transaction_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(11) NOT NULL,
  `ticket_number` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT 'general',
  `priority` enum('low','medium','high','urgent') DEFAULT 'medium',
  `status` enum('open','in_progress','resolved','closed') DEFAULT 'open',
  `assigned_to` int(11) DEFAULT NULL,
  `resolution` text DEFAULT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `resolved_by` int(11) DEFAULT NULL,
  `satisfaction_rating` int(11) DEFAULT NULL,
  `satisfaction_comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `ticket_number`, `user_id`, `subject`, `category`, `priority`, `status`, `assigned_to`, `resolution`, `resolved_at`, `resolved_by`, `satisfaction_rating`, `satisfaction_comment`, `created_at`, `updated_at`) VALUES
(1, 'TKT6AC370DD71D3D', 3, 'Zbbsbs', 'general', '', 'open', NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-05 09:41:49', '2026-10-05 09:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `system_health`
--

CREATE TABLE `system_health` (
  `id` int(11) NOT NULL,
  `metric_name` varchar(100) NOT NULL,
  `metric_value` decimal(15,2) DEFAULT NULL,
  `metric_unit` varchar(20) DEFAULT NULL,
  `status` enum('healthy','warning','critical') DEFAULT 'healthy',
  `details` text DEFAULT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `country` varchar(100) DEFAULT 'Tanzania',
  `region` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_staff_reply` tinyint(1) DEFAULT 0,
  `attachments` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `ticket_id`, `user_id`, `message`, `is_staff_reply`, `attachments`, `created_at`) VALUES
(1, 1, 3, 'Z z z', 0, NULL, '2026-10-05 09:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `transaction_ref` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `currency` varchar(10) DEFAULT 'TZS',
  `payment_method` varchar(30) NOT NULL DEFAULT '',
  `payment_phone` varchar(20) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `type` enum('purchase','deposit','withdrawal','commission','refund','adjustment') NOT NULL,
  `status` enum('pending','completed','failed','cancelled','refunded') DEFAULT 'pending',
  `commission` decimal(10,2) DEFAULT 0.00,
  `admin_commission` decimal(10,2) DEFAULT 0.00,
  `seller_amount` decimal(10,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `provider_ref` varchar(120) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT 'pending',
  `payment_gateway` varchar(20) DEFAULT 'sonicpesa',
  `sp_order_id` varchar(100) DEFAULT NULL,
  `sp_transaction_id` varchar(100) DEFAULT NULL,
  `package_type` varchar(50) DEFAULT NULL,
  `webhook_payload` text DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `provider_status` varchar(50) DEFAULT NULL,
  `provider_response` text DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `callback_received` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `seller_id`, `voucher_id`, `transaction_ref`, `amount`, `currency`, `payment_method`, `payment_phone`, `payment_details`, `type`, `status`, `commission`, `admin_commission`, `seller_amount`, `notes`, `completed_at`, `created_at`, `provider_ref`, `payment_status`, `payment_gateway`, `sp_order_id`, `sp_transaction_id`, `package_type`, `webhook_payload`, `confirmed_at`, `provider_status`, `provider_response`, `order_id`, `callback_received`) VALUES
(148, NULL, 1, 548, 'SKY261020140027DEFC', 500.00, 'TZS', 'manual', '0612710364', NULL, 'purchase', 'completed', 0.00, 0.00, 0.00, 'Portal order', '2026-10-20 14:48:21', '2026-10-20 11:48:21', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(149, NULL, 1, 548, 'SKY261020140027DEFC-C', 20.00, 'TZS', 'internal', NULL, NULL, 'commission', 'completed', 0.00, 0.00, 0.00, 'Platform commission 4%', '2026-10-20 14:48:21', '2026-10-20 11:48:21', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(150, NULL, 1, 549, 'SKY261020125608AD5E', 500.00, 'TZS', 'manual', '0612710364', NULL, 'purchase', 'completed', 0.00, 0.00, 0.00, 'Portal order', '2026-10-20 14:52:23', '2026-10-20 11:52:23', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(151, NULL, 1, 549, 'SKY261020125608AD5E-C', 20.00, 'TZS', 'internal', NULL, NULL, 'commission', 'completed', 0.00, 0.00, 0.00, 'Platform commission 4%', '2026-10-20 14:52:23', '2026-10-20 11:52:23', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(152, NULL, 1, 550, 'SKY2610201539204CE4', 200.00, 'TZS', 'sonicpesa', '0612710364', NULL, 'purchase', 'completed', 0.00, 0.00, 0.00, 'Portal order | 6292563818430451', '2026-10-20 15:39:45', '2026-10-20 12:39:45', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(153, NULL, 1, 550, 'SKY2610201539204CE4-C', 8.00, 'TZS', 'internal', NULL, NULL, 'commission', 'completed', 0.00, 0.00, 0.00, 'Platform commission 4%', '2026-10-20 15:39:45', '2026-10-20 12:39:45', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(154, NULL, 1, 551, 'SKY261020154849FF31', 200.00, 'TZS', 'sonicpesa', '0612710364', NULL, 'purchase', 'completed', 0.00, 0.00, 0.00, 'Portal order | 6292569428441304', '2026-10-20 15:49:08', '2026-10-20 12:49:08', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(155, NULL, 1, 551, 'SKY261020154849FF31-C', 8.00, 'TZS', 'internal', NULL, NULL, 'commission', 'completed', 0.00, 0.00, 0.00, 'Platform commission 4%', '2026-10-20 15:49:08', '2026-10-20 12:49:08', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(156, NULL, 1, 552, 'SKY261020155411ED42', 200.00, 'TZS', 'sonicpesa', '0683277378', NULL, 'purchase', 'completed', 0.00, 0.00, 0.00, 'Portal order | BP261020.1554.174557', '2026-10-20 15:54:42', '2026-10-20 12:54:42', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(157, NULL, 1, 552, 'SKY261020155411ED42-C', 8.00, 'TZS', 'internal', NULL, NULL, 'commission', 'completed', 0.00, 0.00, 0.00, 'Platform commission 4%', '2026-10-20 15:54:42', '2026-10-20 12:54:42', NULL, 'pending', 'sonicpesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `user_type` enum('admin','seller','customer') DEFAULT 'customer',
  `balance` decimal(15,2) DEFAULT 0.00,
  `status` enum('active','inactive','suspended') DEFAULT 'active',
  `email_verified` tinyint(1) DEFAULT 0,
  `phone_verified` tinyint(1) DEFAULT 0,
  `verification_token` varchar(100) DEFAULT NULL,
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` varchar(30) DEFAULT 'seller'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone`, `password`, `full_name`, `user_type`, `balance`, `status`, `email_verified`, `phone_verified`, `verification_token`, `reset_token`, `reset_expires`, `last_login`, `created_at`, `updated_at`, `role`) VALUES
(1, 'skytanzania', 'joshuankuumba@gmail.com', '0700000000', '$2y$10$Zp60hSU.qo2r6Q.bPnggrum6SYuFVacgnWFQQ8lsN6uo3JWI2xwHO', 'System Administrator', 'admin', 1536.00, 'active', 1, 1, NULL, NULL, NULL, '2026-10-20 14:01:49', '2026-10-04 10:59:33', '2026-10-20 12:54:42', 'seller'),
(2, 'joshuankuyumba@gmail.com', 'skytanzania54@gmail.com', '0612710364', '$2y$10$DVeGZJ/oIOmt/GGtBzCCseqPSI/81TutfRw1ZLNXENYEiG.VUzUzW', 'JOSHUA ELIAK EDISON', 'seller', 25400.00, 'active', 0, 0, '2b8dec8749dff13af8bf0ff3ffef74c74280fd2633b787b0c681908347b02199', NULL, NULL, '2026-10-12 21:35:19', '2026-10-04 11:01:15', '2026-10-12 18:35:19', 'seller'),
(3, 'skytanzania12', 'joshuankuyumba98@gmail.com', '0715645325', '$2y$10$Rb/SFO0QxjJiZW.vxfjaiOnGVaHntmUNAP0ADBDf/UggIxzeTpzP2', 'Dddd Xxxx', 'seller', 100400.00, 'active', 0, 0, 'b4416950e9c896d943d3fda2b9c703f8a37ad6ed6398205e56c11e0189dee438', NULL, NULL, '2026-10-20 13:44:19', '2026-10-04 11:17:21', '2026-10-20 10:44:19', 'seller');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `voucher_code` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration_minutes` int(11) NOT NULL,
  `data_limit_mb` int(11) DEFAULT 0,
  `status` enum('available','sold','used','expired','cancelled') DEFAULT 'available',
  `sold_to` int(11) DEFAULT NULL,
  `sold_at` datetime DEFAULT NULL,
  `used_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sp_order_id` varchar(100) DEFAULT NULL,
  `payment_ref` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `webhooks`
--

CREATE TABLE `webhooks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `events` text NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_triggered` datetime DEFAULT NULL,
  `failure_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `webhook_logs`
--

CREATE TABLE `webhook_logs` (
  `id` int(11) NOT NULL,
  `webhook_id` int(11) NOT NULL,
  `event` varchar(100) NOT NULL,
  `payload` text DEFAULT NULL,
  `response_code` int(11) DEFAULT NULL,
  `response_body` text DEFAULT NULL,
  `success` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wifi_sessions`
--

CREATE TABLE `wifi_sessions` (
  `id` int(11) NOT NULL,
  `voucher_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `router_id` int(11) NOT NULL,
  `mac_address` varchar(17) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `device_name` varchar(100) DEFAULT NULL,
  `session_start` datetime NOT NULL,
  `session_end` datetime DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT 0,
  `data_used_mb` decimal(10,2) DEFAULT 0.00,
  `status` enum('active','expired','disconnected','blocked') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sp_order_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `fee` decimal(10,2) DEFAULT 0.00,
  `net_amount` decimal(15,2) NOT NULL,
  `method` enum('mpesa','tigopesa','airtelmoney','halopesa','bank') NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `status` enum('pending','processing','completed','rejected') DEFAULT 'pending',
  `admin_notes` text DEFAULT NULL,
  `processed_by` int(11) DEFAULT NULL,
  `processed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `amount`, `fee`, `net_amount`, `method`, `account_number`, `account_name`, `status`, `admin_notes`, `processed_by`, `processed_at`, `created_at`) VALUES
(1, 3, 5000.00, 500.00, 4500.00, 'halopesa', '0612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Unauthorized: Invalid API key. Unauthorized. Invalid API credentials.', NULL, NULL, '2026-10-04 18:02:57'),
(2, 3, 5000.00, 500.00, 4500.00, 'halopesa', '0612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Unauthorized: Invalid API key. Unauthorized. Invalid API credentials.', NULL, NULL, '2026-10-04 18:04:28'),
(3, 3, 5000.00, 500.00, 4500.00, 'halopesa', '0612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Unauthorized: Invalid API key. Unauthorized. Invalid API credentials.', NULL, NULL, '2026-10-04 18:05:29'),
(4, 3, 5000.00, 500.00, 4500.00, 'halopesa', '0612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Unauthorized: Invalid API key. Unauthorized. Invalid API credentials.', NULL, NULL, '2026-10-04 18:31:37'),
(5, 3, 5000.00, 500.00, 4500.00, 'halopesa', '0612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Internal System Failure. Please try again later.', NULL, NULL, '2026-10-04 18:56:26'),
(6, 3, 5000.00, 500.00, 4500.00, 'halopesa', '0612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Internal System Failure. Please try again later.', NULL, NULL, '2026-10-04 19:01:53'),
(7, 3, 5000.00, 500.00, 4500.00, 'halopesa', '255612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Internal System Failure. Please try again later.', NULL, NULL, '2026-10-04 19:02:50'),
(8, 3, 30000.00, 3000.00, 27000.00, 'halopesa', '255612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Internal System Failure. Please try again later.', NULL, NULL, '2026-10-04 19:07:28'),
(9, 2, 50000.00, 5000.00, 45000.00, 'halopesa', '0612710364', 'meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Bad Request: Invalid parameters. Insufficient balance! You need 45,000 TZS to withdraw.', NULL, NULL, '2026-10-04 19:17:49'),
(10, 2, 30000.00, 3000.00, 27000.00, 'halopesa', '0612710364', 'meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Internal System Failure. Please try again later.', NULL, NULL, '2026-10-04 19:19:09'),
(11, 2, 35000.00, 3500.00, 31500.00, 'halopesa', '0612710364', 'meresiana mathew', 'pending', NULL, NULL, NULL, '2026-10-04 19:34:29'),
(12, 3, 35000.00, 3416.00, 31584.00, 'halopesa', '255612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Bad Request: Invalid parameters. Insufficient balance! You need 33,600 TZS to withdraw.', NULL, NULL, '2026-10-05 00:45:03'),
(13, 3, 63000.00, 6148.80, 56851.20, 'mpesa', '0612710364', 'Meresiana mathew', 'rejected', 'Sonic Pesa payout failed: Bad Request: Invalid parameters. Insufficient balance! You need 60,480 TZS to withdraw.', NULL, NULL, '2026-10-05 01:06:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_active` (`is_active`),
  ADD KEY `idx_audience` (`target_audience`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_key` (`api_key`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_key` (`api_key`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_table` (`table_name`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `client_rate_limit`
--
ALTER TABLE `client_rate_limit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mac_action` (`mac_address`,`action`,`hit_at`);

--
-- Indexes for table `client_sessions`
--
ALTER TABLE `client_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_token` (`session_token`),
  ADD KEY `idx_token` (`session_token`),
  ADD KEY `idx_phone` (`phone`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_mac` (`mac_address`),
  ADD KEY `idx_status` (`payment_status`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `voucher_id` (`voucher_id`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `customer_profiles`
--
ALTER TABLE `customer_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_customer_seller` (`user_id`,`seller_id`),
  ADD KEY `favorite_package_id` (`favorite_package_id`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `idx_vip` (`is_vip`);

--
-- Indexes for table `enforcer_log`
--
ALTER TABLE `enforcer_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_articles`
--
ALTER TABLE `help_articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_published` (`is_published`),
  ADD KEY `idx_slug` (`slug`);

--
-- Indexes for table `hotspot_clients`
--
ALTER TABLE `hotspot_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_router_mac` (`router_id`,`mac_address`),
  ADD KEY `idx_session` (`session_id`),
  ADD KEY `idx_mac` (`mac_address`);

--
-- Indexes for table `hs_adjustments`
--
ALTER TABLE `hs_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `voucher_id` (`voucher_id`);

--
-- Indexes for table `hs_blocked_macs`
--
ALTER TABLE `hs_blocked_macs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_sm` (`seller_id`,`mac`);

--
-- Indexes for table `hs_controllers`
--
ALTER TABLE `hs_controllers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `hs_dae_queue`
--
ALTER TABLE `hs_dae_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `hs_devices`
--
ALTER TABLE `hs_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_ap` (`ap_mac`),
  ADD UNIQUE KEY `uniq_nas` (`nas_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_nas_seen` (`nas_seen`),
  ADD KEY `idx_ctrl` (`controller_id`);

--
-- Indexes for table `hs_omada_jobs`
--
ALTER TABLE `hs_omada_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_claim` (`claim`);

--
-- Indexes for table `hs_omada_sites`
--
ALTER TABLE `hs_omada_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_us` (`user_id`,`site_id`),
  ADD KEY `idx_site` (`site_id`);

--
-- Indexes for table `hs_omada_vgroups`
--
ALTER TABLE `hs_omada_vgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_ug` (`user_id`,`group_id`),
  ADD KEY `idx_site` (`site_id`);

--
-- Indexes for table `hs_orders`
--
ALTER TABLE `hs_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_ref` (`order_ref`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `idx_hs_orders_sonic` (`sonic_order_id`),
  ADD KEY `idx_gw` (`gateway_ref`),
  ADD KEY `idx_mac` (`client_mac`);

--
-- Indexes for table `hs_packages`
--
ALTER TABLE `hs_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `hs_payment_events`
--
ALTER TABLE `hs_payment_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_gw` (`gateway_ref`);

--
-- Indexes for table `hs_provision_log`
--
ALTER TABLE `hs_provision_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dev` (`device_id`),
  ADD KEY `idx_step` (`step`);

--
-- Indexes for table `hs_provision_runs`
--
ALTER TABLE `hs_provision_runs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dev` (`device_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `hs_radius_log`
--
ALTER TABLE `hs_radius_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_nas` (`nas_id`);

--
-- Indexes for table `hs_router_models`
--
ALTER TABLE `hs_router_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_code` (`code`);

--
-- Indexes for table `hs_sessions`
--
ALTER TABLE `hs_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_unique` (`unique_id`),
  ADD KEY `idx_voucher` (`voucher_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `idx_mac` (`mac`),
  ADD KEY `idx_nas` (`nas_id`);

--
-- Indexes for table `hs_vouchers`
--
ALTER TABLE `hs_vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_code` (`code`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `idx_batch` (`batch`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `hs_voucher_macs`
--
ALTER TABLE `hs_voucher_macs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_vm` (`voucher_id`,`mac`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `idx_invoice_number` (`invoice_number`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `idx_sender` (`sender_id`),
  ADD KEY `idx_receiver` (`receiver_id`),
  ADD KEY `idx_read` (`is_read`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_read` (`is_read`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_router` (`router_id`),
  ADD KEY `idx_seller` (`seller_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_status` (`payment_status`);

--
-- Indexes for table `payment_attempts`
--
ALTER TABLE `payment_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ip` (`ip_address`),
  ADD KEY `idx_mac` (`mac_address`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_active` (`is_active`),
  ADD KEY `idx_seller` (`seller_id`);

--
-- Indexes for table `promo_code_usage`
--
ALTER TABLE `promo_code_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `idx_promo` (`promo_code_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `rate_limits`
--
ALTER TABLE `rate_limits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_id_action` (`identifier`,`action`),
  ADD KEY `idx_window` (`window_start`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_referrer` (`referrer_id`),
  ADD KEY `idx_referred` (`referred_id`),
  ADD KEY `idx_paid` (`bonus_paid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `voucher_id` (`voucher_id`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `idx_rating` (`rating`),
  ADD KEY `idx_published` (`is_published`);

--
-- Indexes for table `routers`
--
ALTER TABLE `routers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mac_address` (`mac_address`),
  ADD KEY `provider_id` (`provider_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_mac` (`mac_address`);

--
-- Indexes for table `router_bandwidth`
--
ALTER TABLE `router_bandwidth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_router` (`router_id`),
  ADD KEY `idx_recorded` (`recorded_at`);

--
-- Indexes for table `session_time_adjustments`
--
ALTER TABLE `session_time_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_session` (`session_id`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `sonicpesa_orders`
--
ALTER TABLE `sonicpesa_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_order` (`order_id`),
  ADD KEY `idx_status` (`payment_status`),
  ADD KEY `idx_mac` (`client_mac`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `sp_payments`
--
ALTER TABLE `sp_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_status` (`payment_status`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_number` (`ticket_number`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `resolved_by` (`resolved_by`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_priority` (`priority`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `system_health`
--
ALTER TABLE `system_health`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_metric` (`metric_name`),
  ADD KEY `idx_recorded` (`recorded_at`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_active` (`is_active`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_ticket` (`ticket_id`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_ref` (`transaction_ref`),
  ADD KEY `voucher_id` (`voucher_id`),
  ADD KEY `idx_ref` (`transaction_ref`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_seller` (`seller_id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_txn_ref` (`transaction_ref`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_phone` (`phone`),
  ADD KEY `idx_user_type` (`user_type`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voucher_code` (`voucher_code`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `sold_to` (`sold_to`),
  ADD KEY `idx_code` (`voucher_code`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_seller` (`seller_id`);

--
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_active` (`is_active`);

--
-- Indexes for table `webhook_logs`
--
ALTER TABLE `webhook_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_webhook` (`webhook_id`),
  ADD KEY `idx_created` (`created_at`);

--
-- Indexes for table `wifi_sessions`
--
ALTER TABLE `wifi_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_id` (`voucher_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_mac` (`mac_address`),
  ADD KEY `idx_router` (`router_id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `processed_by` (`processed_by`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_rate_limit`
--
ALTER TABLE `client_rate_limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_sessions`
--
ALTER TABLE `client_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_profiles`
--
ALTER TABLE `customer_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enforcer_log`
--
ALTER TABLE `enforcer_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_articles`
--
ALTER TABLE `help_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotspot_clients`
--
ALTER TABLE `hotspot_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_adjustments`
--
ALTER TABLE `hs_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hs_blocked_macs`
--
ALTER TABLE `hs_blocked_macs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_controllers`
--
ALTER TABLE `hs_controllers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `hs_dae_queue`
--
ALTER TABLE `hs_dae_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hs_devices`
--
ALTER TABLE `hs_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `hs_omada_jobs`
--
ALTER TABLE `hs_omada_jobs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3555;

--
-- AUTO_INCREMENT for table `hs_omada_sites`
--
ALTER TABLE `hs_omada_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_omada_vgroups`
--
ALTER TABLE `hs_omada_vgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_orders`
--
ALTER TABLE `hs_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `hs_packages`
--
ALTER TABLE `hs_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hs_payment_events`
--
ALTER TABLE `hs_payment_events`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=484;

--
-- AUTO_INCREMENT for table `hs_provision_log`
--
ALTER TABLE `hs_provision_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hs_provision_runs`
--
ALTER TABLE `hs_provision_runs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `hs_radius_log`
--
ALTER TABLE `hs_radius_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `hs_router_models`
--
ALTER TABLE `hs_router_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hs_sessions`
--
ALTER TABLE `hs_sessions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;

--
-- AUTO_INCREMENT for table `hs_vouchers`
--
ALTER TABLE `hs_vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=553;

--
-- AUTO_INCREMENT for table `hs_voucher_macs`
--
ALTER TABLE `hs_voucher_macs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_attempts`
--
ALTER TABLE `payment_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_code_usage`
--
ALTER TABLE `promo_code_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `rate_limits`
--
ALTER TABLE `rate_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routers`
--
ALTER TABLE `routers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `router_bandwidth`
--
ALTER TABLE `router_bandwidth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_time_adjustments`
--
ALTER TABLE `session_time_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131499;

--
-- AUTO_INCREMENT for table `sonicpesa_orders`
--
ALTER TABLE `sonicpesa_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_payments`
--
ALTER TABLE `sp_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_health`
--
ALTER TABLE `system_health`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webhook_logs`
--
ALTER TABLE `webhook_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wifi_sessions`
--
ALTER TABLE `wifi_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD CONSTRAINT `api_keys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `backups`
--
ALTER TABLE `backups`
  ADD CONSTRAINT `backups_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `commissions`
--
ALTER TABLE `commissions`
  ADD CONSTRAINT `commissions_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commissions_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commissions_ibfk_3` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_profiles`
--
ALTER TABLE `customer_profiles`
  ADD CONSTRAINT `customer_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_profiles_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_profiles_ibfk_3` FOREIGN KEY (`favorite_package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `help_articles`
--
ALTER TABLE `help_articles`
  ADD CONSTRAINT `help_articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hotspot_clients`
--
ALTER TABLE `hotspot_clients`
  ADD CONSTRAINT `hotspot_clients_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_adjustments`
--
ALTER TABLE `hs_adjustments`
  ADD CONSTRAINT `hs_adjustments_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `hs_vouchers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_controllers`
--
ALTER TABLE `hs_controllers`
  ADD CONSTRAINT `hs_controllers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_devices`
--
ALTER TABLE `hs_devices`
  ADD CONSTRAINT `hs_devices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_packages`
--
ALTER TABLE `hs_packages`
  ADD CONSTRAINT `hs_packages_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_packages_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `hs_devices` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hs_provision_log`
--
ALTER TABLE `hs_provision_log`
  ADD CONSTRAINT `hs_provision_log_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `hs_devices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_provision_runs`
--
ALTER TABLE `hs_provision_runs`
  ADD CONSTRAINT `hs_provision_runs_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `hs_devices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_sessions`
--
ALTER TABLE `hs_sessions`
  ADD CONSTRAINT `hs_sessions_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `hs_vouchers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hs_vouchers`
--
ALTER TABLE `hs_vouchers`
  ADD CONSTRAINT `hs_vouchers_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `hs_packages` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_vouchers_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_voucher_macs`
--
ALTER TABLE `hs_voucher_macs`
  ADD CONSTRAINT `hs_voucher_macs_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `hs_vouchers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `messages` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `packages_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD CONSTRAINT `promo_codes_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promo_code_usage`
--
ALTER TABLE `promo_code_usage`
  ADD CONSTRAINT `promo_code_usage_ibfk_1` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promo_code_usage_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promo_code_usage_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_ibfk_1` FOREIGN KEY (`referrer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `referrals_ibfk_2` FOREIGN KEY (`referred_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `routers`
--
ALTER TABLE `routers`
  ADD CONSTRAINT `routers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `routers_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `router_bandwidth`
--
ALTER TABLE `router_bandwidth`
  ADD CONSTRAINT `router_bandwidth_ibfk_1` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `session_time_adjustments`
--
ALTER TABLE `session_time_adjustments`
  ADD CONSTRAINT `session_time_adjustments_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `wifi_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `session_time_adjustments_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_tickets_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `support_tickets_ibfk_3` FOREIGN KEY (`resolved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD CONSTRAINT `vouchers_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vouchers_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vouchers_ibfk_3` FOREIGN KEY (`sold_to`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD CONSTRAINT `webhooks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `webhook_logs`
--
ALTER TABLE `webhook_logs`
  ADD CONSTRAINT `webhook_logs_ibfk_1` FOREIGN KEY (`webhook_id`) REFERENCES `webhooks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wifi_sessions`
--
ALTER TABLE `wifi_sessions`
  ADD CONSTRAINT `wifi_sessions_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wifi_sessions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wifi_sessions_ibfk_3` FOREIGN KEY (`router_id`) REFERENCES `routers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `withdrawals_ibfk_2` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
