-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2022 at 04:43 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_pgservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments_tables`
--

CREATE TABLE `appointments_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments_tables`
--

INSERT INTO `appointments_tables` (`id`, `date`, `time`, `owner_id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, '02 Mar 22', '20:45', 2, '1', '2022-02-28 04:45:15', '2022-02-28 04:45:15'),
(4, '21 Feb 22', '15:51', 2, '1', '2022-02-28 04:51:39', '2022-02-28 04:51:39'),
(5, '28 Feb 22', '17:54', 3, '1', '2022-02-28 04:52:49', '2022-02-28 04:52:49'),
(6, '01 Mar 22', '15:54', 2, '1', '2022-02-28 04:54:28', '2022-02-28 04:54:28'),
(7, '28 Mar 22', '05:20', 2, '3', '2022-02-28 05:11:11', '2022-02-28 05:11:11'),
(8, '01 Mar 22', '12:00', 2, '3', '2022-02-28 05:11:37', '2022-02-28 05:11:37'),
(9, '21 Feb 22', '12:00', 2, '3', '2022-02-28 05:12:04', '2022-02-28 05:12:04'),
(10, '02 Mar 22', '12:00', 2, '3', '2022-02-28 05:15:03', '2022-02-28 05:15:03'),
(12, '09 Mar 22', '15:19', 1, '7', '2022-03-07 04:16:38', '2022-03-07 04:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `f_p_models`
--

CREATE TABLE `f_p_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `fp_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fp_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fp_landmark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fp_menu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `fp_food_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fp_kitchen_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `f_p_models`
--

INSERT INTO `f_p_models` (`id`, `user_id`, `fp_name`, `fp_area`, `fp_landmark`, `fp_menu`, `price`, `fp_food_img`, `fp_kitchen_img`, `created_at`, `updated_at`) VALUES
(1, 2, 'Abids', 'Ameerpet', 'Near Metro', 'Mini Tiffin', 150, '1646012830.jpg', '16460128301.jpg', '2022-02-27 20:17:10', '2022-02-27 20:17:10'),
(2, 4, 'Gangotri', 'Guindy', 'Bus Stand', 'Thali Meals', 250, '1646100652.jpg', '16461006521.jpg', '2022-02-28 20:40:52', '2022-02-28 20:40:52'),
(3, 5, 'Sarvana Bhavan', 'Ashok Nagar', 'Near Pillar', 'Poori', 100, '1646114656.jpg', '16461146561.jpg', '2022-03-01 00:34:16', '2022-03-01 00:34:16'),
(4, 6, 'Gauravs', 'Mylapore', 'Tank Area', 'Dosa', 100, '1646114812.jpg', '16461148121.jpg', '2022-03-01 00:36:52', '2022-03-01 00:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `meal_booking_tables`
--

CREATE TABLE `meal_booking_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `consumer_id` int(11) NOT NULL,
  `meal` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meal_booking_tables`
--

INSERT INTO `meal_booking_tables` (`id`, `provider_id`, `consumer_id`, `meal`, `created_at`, `updated_at`) VALUES
(39, 2, 1, 'LUNCH', '2022-03-02 21:30:38', '2022-03-02 21:30:38'),
(40, 4, 1, 'DINNER', '2022-03-02 21:33:31', '2022-03-02 21:33:31'),
(41, 2, 1, 'DINNER', '2022-03-02 21:40:24', '2022-03-02 21:40:24'),
(42, 2, 1, 'LUNCH', '2022-03-03 20:57:47', '2022-03-03 20:57:47'),
(43, 2, 1, 'DINNER', '2022-03-03 21:12:34', '2022-03-03 21:12:34'),
(44, 4, 1, 'LUNCH', '2022-03-03 21:21:31', '2022-03-03 21:21:31'),
(45, 5, 1, 'LUNCH', '2022-03-03 21:38:39', '2022-03-03 21:38:39'),
(46, 5, 1, 'DINNER', '2022-03-03 21:40:22', '2022-03-03 21:40:22'),
(47, 6, 1, 'DINNER', '2022-03-03 21:40:33', '2022-03-03 21:40:33'),
(48, 6, 1, 'LUNCH', '2022-03-03 21:41:09', '2022-03-03 21:41:09'),
(49, 4, 1, 'DINNER', '2022-03-03 21:41:22', '2022-03-03 21:41:22'),
(50, 2, 7, 'LUNCH', '2022-03-07 04:15:41', '2022-03-07 04:15:41'),
(51, 4, 7, 'LUNCH', '2022-03-07 04:19:52', '2022-03-07 04:19:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2022_02_24_010322_create_f_p_models_table', 1),
(7, '2022_02_25_121741_create_meal_booking_tables_table', 1),
(8, '2022_02_28_090539_create_appointments_tables_table', 2),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(12, '2022_02_24_010004_create_p_g_models_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `p_g_models`
--

CREATE TABLE `p_g_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ap_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facilites` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adl_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `persons` smallint(6) NOT NULL,
  `rent` int(11) NOT NULL,
  `certificate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `p_g_models`
--

INSERT INTO `p_g_models` (`id`, `user_id`, `ap_name`, `area`, `facilites`, `adl_info`, `gender`, `usertype`, `city`, `landmark`, `image`, `persons`, `rent`, `certificate`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rams Appartment', 'Nandanam', 'RO Water , Water Heater , Laundry , Room Cleaning', NULL, 'Only Female', NULL, 'Chennai', 'Opp Old Tower Block', '1646051938.jpg', 3, 3000, 'tn091453', '2022-02-28 07:08:58', '2022-02-28 07:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isAdmin` smallint(6) NOT NULL DEFAULT 0,
  `isFoodProvider` smallint(6) NOT NULL DEFAULT 0,
  `isPGServiceProvider` smallint(6) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `email`, `email_verified_at`, `password`, `isAdmin`, `isFoodProvider`, `isPGServiceProvider`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'srini', '9381003591', 'srini01@gmail.com', NULL, '$2y$10$94uRzhNx32AZ9gdjJgpXlechVRt4DpUhn4h1VuUTZcMafr/zAQch6', 0, 0, 1, NULL, '2022-02-27 20:08:04', '2022-02-28 07:08:59'),
(2, 'Sachin', '9841012345', 'sachin@gmail.com', NULL, '$2y$10$8e9rXNOPNhmwCDvXjZt6D.J/VpOX5aOnm/I6ok29GQuGTUY.Yn1Yy', 0, 1, 0, NULL, '2022-02-27 20:14:56', '2022-02-27 22:30:31'),
(3, 'vasu', '9510914075', 'vasuramani2220@gmail.com', NULL, '$2y$10$.mngOPTcbCO3rNu37mWw4.9eVOkFd8RFDImJGWvolIR.hdX2ba/mC', 0, 0, 0, NULL, '2022-02-27 23:15:21', '2022-02-27 23:18:45'),
(4, 'Rahul', '9840098765', 'rahul@gmail.com', NULL, '$2y$10$r3ZAXWWVLRgbgy34wlAlxOVpm0Y1oNE1DVhAnWfHZL/b91c6/OJNe', 0, 1, 0, NULL, '2022-02-28 20:30:35', '2022-02-28 20:40:52'),
(5, 'Ajay', '9843012345', 'ajay@gmail.com', NULL, '$2y$10$gPZLZ98.8uOV6XC4B3kL0.N25iW12V/MZTBVebfXR/nrvsrGEF75i', 0, 1, 0, NULL, '2022-03-01 00:33:07', '2022-03-01 00:34:16'),
(6, 'Kishore', '9840066789', 'kishore@gmail.com', NULL, '$2y$10$.LWAB6/eM4CRdj7yW66yPOuzVwdBB70AbsU4LeDU8Ift2wLkrX5KO', 0, 1, 0, NULL, '2022-03-01 00:36:02', '2022-03-01 00:36:52'),
(7, 'Rahul', '9773126516', 'suvarahul6@gmail.com', NULL, '$2y$10$eiDghxJHt2RfmaQtdfa0lOGnengYfKBVQTlvjNtcLTrTyM8YlY/s.', 0, 0, 0, NULL, '2022-03-07 04:14:24', '2022-03-07 04:24:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments_tables`
--
ALTER TABLE `appointments_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `f_p_models`
--
ALTER TABLE `f_p_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_booking_tables`
--
ALTER TABLE `meal_booking_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `p_g_models`
--
ALTER TABLE `p_g_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_g_models_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments_tables`
--
ALTER TABLE `appointments_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_p_models`
--
ALTER TABLE `f_p_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `meal_booking_tables`
--
ALTER TABLE `meal_booking_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `p_g_models`
--
ALTER TABLE `p_g_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `p_g_models`
--
ALTER TABLE `p_g_models`
  ADD CONSTRAINT `p_g_models_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
