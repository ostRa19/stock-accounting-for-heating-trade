-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Июн 14 2020 г., 03:35
-- Версия сервера: 5.7.29-0ubuntu0.18.04.1
-- Версия PHP: 7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `my_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admins`
--

INSERT IGNORE INTO `admins` (`id`, `name`, `job_title`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Administrator', 'admin@gmail.com', '$2y$10$oFCvEfe0nM0AB.CmfD/isuapmmi5O1lLHSRkpg/dYJylv6XTeT4yi', 'PS6eRH8Q725uA4vCy9EkzYJAzGXEy5rNx5dECR05amxh1aTWQPwR5MbzBJ6u', '2020-05-27 09:15:50', '2020-05-27 09:15:50');

-- --------------------------------------------------------

--
-- Структура таблицы `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
CREATE TABLE `catalogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `catalogs`
--

INSERT IGNORE INTO `catalogs` (`id`, `name`, `description`, `parent_id`, `image`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Котли', 'простий опис', NULL, 'images/categories/cat_1592039773.jpg', 0, '2020-05-24 14:12:18', '2020-06-13 06:16:13'),
(2, 'Радіатори', 'простий опис', NULL, 'images/categories/cat_1592039783.jpg', 1, '2020-05-24 14:12:18', '2020-06-13 06:16:23'),
(3, 'Конвекторні обігрівачі', 'простий опис', NULL, '3.jpg', 2, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(4, 'Теплові завіси', 'простий опис', NULL, '4.jpg', 3, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(5, 'Електричні котли', 'простий опис', 1, '5.jpg', 0, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(6, 'Газові котли', 'простий опис', 1, '6.jpg', 1, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(7, 'Твердопаливні котли', 'простий опис', 1, '7.jpg', 2, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(8, 'Алюмінієві радіатори', 'простий опис', 2, '8.jpg', 0, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(9, 'Біметалеві радіатори', 'простий опис', 2, '9.jpg', 1, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(10, 'Стальні радіатори', 'простий опис', 2, '10.jpg', 2, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(11, 'Інфрачервоні обогрівачі', 'простий опис', 3, '11.jpg', 0, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(12, 'Газові обогрівачі', 'простий опис', 3, '12.jpg', 1, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(13, 'Керамічні обогрівачі', 'простий опис', 3, '13.jpg', 2, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(14, 'Бойлери', 'простий опис', 5, '14.jpg', 0, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(15, 'Газові колонки', 'простий опис', 5, '15.jpg', 1, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(16, 'Проточні водонагрівачі', 'простий опис', 5, '16.jpg', 2, '2020-05-24 14:12:18', '2020-05-24 14:12:18'),
(18, 'теплова завіса надпотужна', 'ще одна категорія товарів', 4, 'images/categories/cat_1592039913.jpg', 2, '2020-06-13 06:18:33', '2020-06-13 06:18:33');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT IGNORE INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(3, NULL, 1, 'Котли', 'котли', '2020-05-06 07:12:14', '2020-05-07 10:58:59'),
(4, NULL, 1, 'Радіатори', 'радіатори', '2020-05-06 07:13:34', '2020-05-07 10:59:52'),
(5, NULL, 1, 'Конвекторні обігрівачі', 'конвекторні обігрівачі', '2020-05-06 07:13:50', '2020-05-07 11:01:48'),
(6, NULL, 1, 'Теплові завіси', 'теплові завіси', '2020-05-06 07:15:06', '2020-05-07 11:02:17'),
(7, NULL, 1, 'Водонагрівачі', 'водонагрівачі', '2020-05-06 07:15:53', '2020-05-07 11:02:50'),
(8, NULL, 1, 'Тепла підлога і обладнання', 'тепла підлога і обладнання', '2020-05-07 11:04:53', '2020-05-07 11:04:53'),
(9, 3, 1, 'Твердопаливні котли', 'твердопаливні котли', '2020-05-07 11:05:51', '2020-05-07 11:05:51'),
(10, 3, 1, 'Електричні котли', 'електричні котли', '2020-05-07 11:06:34', '2020-05-07 11:06:34'),
(11, 3, 1, 'Газові котли', 'газові котли', '2020-05-07 11:06:54', '2020-05-07 11:06:54'),
(12, 9, 1, 'Твердопаливні піролізні котли', 'твердопаливні піролізні котли', '2020-05-07 11:10:11', '2020-05-07 11:10:11'),
(13, 9, 1, 'Пелетні твердопаливні котли', 'пелетні твердопаливні котли', '2020-05-07 11:10:33', '2020-05-07 11:10:33'),
(14, 10, 1, 'Компактні електричні котли', 'Компактні електричні котли', '2020-05-07 11:11:04', '2020-05-07 11:11:04'),
(15, 4, 1, 'Алюмінієві радіатори', 'алюмінієві радіатори', '2020-05-07 11:29:11', '2020-05-07 11:29:11'),
(16, 15, 1, 'Твердопаливні промислові котли', 'твердопаливні промислові котли', '2020-05-07 11:29:35', '2020-05-07 11:29:35'),
(17, 15, 1, 'Біметалеві радіатори', 'біметалеві радіатори', '2020-05-07 11:29:50', '2020-05-07 11:29:50'),
(18, 5, 1, 'Інфрачервоні обігрівачі', 'інфрачервоні обігрівачі', '2020-05-07 11:30:41', '2020-05-07 11:30:41'),
(19, 5, 1, 'Газові конвектори', 'газові конвектори', '2020-05-07 11:34:47', '2020-05-07 11:34:47'),
(20, 5, 1, 'Керамічні обогрівачі', 'керамічні обогрівачі', '2020-05-07 11:35:14', '2020-05-07 11:35:14'),
(21, 7, 1, 'Бойлери', 'бойлери', '2020-05-07 11:35:29', '2020-05-07 11:35:29'),
(22, 6, 1, 'Електричні теплові завіси', 'електричні теплові завіси', '2020-05-07 11:59:15', '2020-05-07 11:59:15'),
(23, 7, 1, 'Проточні водонагрівачі', 'проточні водонагрівачі', '2020-05-07 11:59:55', '2020-05-07 11:59:55'),
(24, 22, 1, 'Горизонтальні теплові завіси', 'горизонтальні теплові завіси', '2020-05-07 12:02:27', '2020-05-07 12:02:27'),
(25, 22, 1, 'Вертикальні теплові завіси', 'вертикальні теплові завіси', '2020-05-07 12:03:28', '2020-05-07 12:03:28'),
(26, 7, 1, 'Електричні водонагрівачі', 'електричні водонагрівачі', '2020-05-07 12:03:57', '2020-05-07 12:03:57'),
(27, 7, 1, 'Газові колонки', 'газові колонки', '2020-05-07 12:04:51', '2020-05-07 12:04:51'),
(28, 3, 1, 'Настінні газові котли', 'Настінні газові котли', '2020-05-07 12:05:12', '2020-05-07 12:05:12'),
(29, 8, 1, 'Підлогові газові котли', 'підлогові газові котли', '2020-05-07 12:05:32', '2020-05-07 12:05:32');

-- --------------------------------------------------------

--
-- Структура таблицы `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
CREATE TABLE `deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `commentary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '1',
  `status` enum('pending payment','process','completed','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending payment',
  `delivery_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `deliveries`
--

INSERT IGNORE INTO `deliveries` (`id`, `commentary`, `total`, `created_at`, `updated_at`, `admin_id`, `status`, `delivery_label`) VALUES
(1, '', 1523.70, '2020-05-25 14:48:36', '2020-05-25 14:48:36', 1, 'completed', 'ule_1590428916'),
(2, '', 787.60, '2020-05-25 17:31:55', '2020-05-25 17:31:55', 2, 'pending payment', 'ule_1590438715');

-- --------------------------------------------------------

--
-- Структура таблицы `delivery_data`
--

DROP TABLE IF EXISTS `delivery_data`;
CREATE TABLE `delivery_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `is_related_product` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT IGNORE INTO `migrations` (`id`, `migration`, `batch`) VALUES
(51, '2014_10_12_000000_create_users_table', 1),
(52, '2014_10_12_100000_create_password_resets_table', 1),
(53, '2017_10_08_113015_create_products_table', 1),
(54, '2017_10_08_114109_create_orders_table', 1),
(55, '2017_10_08_114503_create_related_products_table', 1),
(56, '2017_10_08_115559_create_order_data_table', 1),
(57, '2017_10_24_071139_add_cart_to_users', 1),
(58, '2017_11_05_070115_create_catalogs_table', 1),
(59, '2017_11_05_071437_add_catalog_to_product', 1),
(60, '2017_11_08_134904_create_units_table', 1),
(61, '2017_11_08_175930_create_properties_table', 1),
(62, '2017_11_09_073633_create_product_property_table', 1),
(63, '2017_11_12_152737_add_priority_to_properties_table', 1),
(64, '2017_11_12_174417_add_type_to_properties_table', 1),
(65, '2017_11_13_071534_create_property_values_table', 1),
(66, '2017_11_13_072524_alter_first_properties_table', 1),
(67, '2017_11_15_211208_change_propidcol_product_properties_table', 1),
(68, '2017_12_02_202911_create_admins_table', 1),
(69, '2017_12_21_200452_add_force_logout_users_table', 1),
(70, '2017_12_22_074807_add_user_id_orders_table', 1),
(71, '2017_12_22_112834_create_shipping_methods_table', 1),
(72, '2018_01_02_074253_create_products_related_products_table', 1),
(73, '2018_01_02_075043_remove_columns_from_related_products_table', 1),
(74, '2018_01_05_100641_alter_status_orders_table', 1),
(75, '2019_02_04_175305_alter_users_table_change_type_column_cart', 1),
(76, '2020_06_08_150841_create_supply_table', 2),
(77, '2020_06_08_150850_create_supply_products_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `commentary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `status` enum('pending payment','process','completed','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending payment',
  `order_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT IGNORE INTO `orders` (`id`, `commentary`, `total`, `created_at`, `updated_at`, `user_id`, `status`, `order_label`) VALUES
(1, '', 1523.70, '2020-05-25 14:48:36', '2020-05-25 14:48:36', 1, 'completed', 'ule_1590428916'),
(2, '', 787.60, '2020-05-25 17:31:55', '2020-05-25 17:31:55', 2, 'process', 'ule_1590438715'),
(3, '', 769.35, '2020-06-13 18:54:00', '2020-06-13 18:54:00', 1, 'pending payment', 'ule_1592085240'),
(4, '', 754.35, '2020-06-13 18:54:21', '2020-06-13 18:54:21', 1, 'pending payment', 'ule_1592085261'),
(5, '', 3032.40, '2020-06-13 19:19:49', '2020-06-13 19:19:49', 2, 'completed', 'ule_1592086789'),
(6, '', 3032.40, '2020-06-13 19:19:50', '2020-06-13 19:19:50', 2, 'pending payment', 'ule_1592086790'),
(7, '', 3786.75, '2020-06-13 19:50:11', '2020-06-13 19:50:11', 2, 'completed', 'ule_1592088611'),
(8, '', 2278.05, '2020-06-13 20:02:44', '2020-06-13 20:02:44', 2, 'pending payment', 'ule_1592089364'),
(9, '', 2278.05, '2020-06-13 20:03:08', '2020-06-13 20:03:08', 2, 'deleted', 'ule_1592089388'),
(10, '', 754.35, '2020-06-13 20:04:21', '2020-06-13 20:04:21', 2, 'pending payment', 'ule_1592089461');

-- --------------------------------------------------------

--
-- Структура таблицы `order_data`
--

DROP TABLE IF EXISTS `order_data`;
CREATE TABLE `order_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `is_related_product` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_data`
--

INSERT IGNORE INTO `order_data` (`id`, `order_id`, `product_id`, `is_related_product`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 754.35, 2, '2020-05-25 14:48:36', '2020-05-25 14:48:36'),
(2, 2, 14, 0, 787.60, 1, '2020-05-25 17:31:55', '2020-05-25 17:31:55'),
(3, 3, 1, 0, 754.35, 1, '2020-06-13 18:54:00', '2020-06-13 18:54:00'),
(4, 4, 1, 0, 754.35, 1, '2020-06-13 18:54:21', '2020-06-13 18:54:21'),
(5, 5, 1, 0, 754.35, 1, '2020-06-13 19:19:49', '2020-06-13 19:19:49'),
(6, 5, 1, 0, 754.35, 1, '2020-06-13 19:19:49', '2020-06-13 19:19:49'),
(7, 5, 1, 0, 754.35, 2, '2020-06-13 19:19:49', '2020-06-13 19:19:49'),
(8, 6, 1, 0, 754.35, 1, '2020-06-13 19:19:50', '2020-06-13 19:19:50'),
(9, 6, 1, 0, 754.35, 1, '2020-06-13 19:19:50', '2020-06-13 19:19:50'),
(10, 6, 1, 0, 754.35, 2, '2020-06-13 19:19:50', '2020-06-13 19:19:50'),
(11, 7, 1, 0, 754.35, 5, '2020-06-13 19:50:11', '2020-06-13 19:50:11'),
(12, 8, 1, 0, 754.35, 3, '2020-06-13 20:02:44', '2020-06-13 20:02:44'),
(13, 9, 1, 0, 754.35, 1, '2020-06-13 20:03:08', '2020-06-13 20:03:08'),
(14, 9, 1, 0, 754.35, 2, '2020-06-13 20:03:08', '2020-06-13 20:03:08'),
(15, 10, 1, 0, 754.35, 1, '2020-06-13 20:04:21', '2020-06-13 20:04:21');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `password_resets`
--

INSERT IGNORE INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('radraf16@gmail.com', '$2y$10$9fyYegv8GoV4oMkDsmdfj.vDUm/ULxeDdzbsovkh8HGVl8UIfQxoK', '2020-06-12 10:59:31');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `qty_order` int(11) NOT NULL,
  `qty_delivery` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `catalog_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT IGNORE INTO `products` (`id`, `name`, `description`, `price`, `image`, `qty`, `qty_order`, `qty_delivery`, `created_at`, `updated_at`, `catalog_id`) VALUES
(1, 'Quia et veritatis delectus dolor.', 'Est provident labore non fugit. Quia deserunt suscipit impedit ratione molestiae unde.', 754.35, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(2, 'Quo et reiciendis dolore possimus fugit quas.', 'Et dolorum sapiente maiores. Cupiditate dolorum omnis minus cumque et ad eius.', 477.68, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(3, 'Non aut eos optio.', 'Tenetur in saepe ducimus at qui enim harum. Ut reiciendis placeat ipsam. Magni quo sit nemo rerum deserunt enim.', 521.37, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(4, 'Error porro possimus alias dignissimos minima delectus corrupti.', 'Optio velit iure hic sit. Sit perspiciatis qui similique ipsa quam. Eius sunt facilis omnis necessitatibus quia esse iure autem.', 976.29, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(5, 'Nesciunt minima nemo harum iure et assumenda et.', 'Nemo odit quod vero qui. Consequatur ducimus sit et. Commodi et a dolorem modi.', 407.31, 'prod3.jpg', 0, 0, 2, '2020-05-25 11:55:12', '2020-06-13 18:22:18', 14),
(6, 'Eos voluptas itaque sit labore.', 'Tenetur totam exercitationem officia maxime. Rerum dicta inventore quis rerum commodi dolores quia. Quibusdam odio est nemo.', 447.10, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(7, 'Doloribus aut voluptas ipsa tempora aperiam.', 'Dolor minima reiciendis voluptatem eum. Asperiores facilis vitae enim dolorem nihil odit. Est est minima quae illo.', 624.43, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(8, 'Mollitia ducimus velit saepe voluptatem.', 'Est voluptas est deserunt unde nemo est aspernatur. Nihil velit molestiae repellendus dolore ut. Laudantium repudiandae accusantium est eius occaecati.', 394.36, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(9, 'Rerum nam dolor atque eos facere.', 'Est aliquid quo aspernatur unde delectus alias. Dolores velit modi id eveniet vel veritatis.', 360.62, 'prod6.jpg', 13, 0, 0, '2020-05-25 11:55:12', '2020-06-13 17:45:35', 5),
(10, 'Aut nostrum reprehenderit itaque doloribus aliquam occaecati aut.', 'Aperiam ratione eum molestias iusto non doloremque deleniti nulla. Consequuntur quia adipisci et illum dolores. Voluptatem vero corrupti in voluptatibus eveniet odio doloribus.', 664.22, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(11, 'Sed quod deserunt odit consectetur nisi.', 'Et non architecto deserunt sit placeat quisquam aut. Sint non sint cum omnis eius adipisci. Voluptas perspiciatis corrupti velit aut officiis et ut.', 646.51, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(12, 'Rerum explicabo et voluptas iste eius ullam.', 'Voluptatum dolorum voluptatem accusantium nobis. Voluptatem quasi eligendi ut nobis nemo.', 432.90, 'prod6.jpg', 0, 0, 4, '2020-05-25 11:55:12', '2020-06-13 18:22:18', 14),
(13, 'Odio quo illum consequuntur recusandae.', 'Voluptatum soluta voluptate distinctio necessitatibus quia cumque. Suscipit consequatur voluptatum voluptatem.', 606.90, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(14, 'Voluptatem et qui in a ut qui.', 'Reprehenderit sed accusantium consequatur rem pariatur voluptas nulla. Sed est incidunt excepturi at.', 787.60, 'prod2.jpg', 12, 0, 0, '2020-05-25 11:55:12', '2020-06-13 17:45:50', 8),
(15, 'In natus assumenda consequatur veniam necessitatibus et officiis molestiae.', 'Aliquid non eaque aut sed saepe. Sed molestiae eligendi rem at delectus ut amet. Perspiciatis iure blanditiis repellat ratione.', 58.48, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(16, 'Sed quia voluptas consequatur nam aut aut.', 'Assumenda commodi laboriosam harum ipsa cupiditate. Qui magnam quo aliquam qui et quaerat fugit. Et eos unde est tempore officiis qui at voluptatem.', 130.34, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(17, 'Harum sed animi distinctio itaque adipisci magnam.', 'Quia repudiandae est aut dignissimos rerum ea eum. Similique sit odit occaecati et non aut.', 785.33, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(18, 'Ratione placeat dolorem autem molestias magni laboriosam.', 'Id eos vel commodi nulla quas ut id. Rem et odio enim dolorem similique.', 445.87, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(19, 'Fugit eaque ut animi pariatur doloremque.', 'Porro quia ut impedit illo alias. Dolores qui quasi nobis necessitatibus. Enim nisi ea non doloremque.', 930.56, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 8),
(20, 'Consequatur voluptas officiis nulla nisi qui.', 'Dolorem in praesentium ipsum dolor recusandae quia corrupti. Veniam qui minus sit mollitia eligendi quo.', 916.63, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(21, 'Sapiente nesciunt veritatis laboriosam maxime sit.', 'Numquam aliquid voluptas sit autem laboriosam vel dolores. Porro inventore dolorem voluptatem dolorem magnam vitae inventore.', 218.65, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(22, 'Ullam enim dicta ab perspiciatis omnis sint.', 'Eveniet excepturi maxime repellat est. Culpa consectetur consequatur possimus animi. Sunt cupiditate officia possimus vitae alias.', 425.62, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(23, 'Sint deserunt alias eum voluptatum qui fugit error.', 'Qui voluptatibus quo sequi aut molestiae nesciunt rerum. Optio id consectetur alias. Voluptatem tempore praesentium laborum nihil aut exercitationem qui sit.', 89.27, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(24, 'Perspiciatis eum recusandae atque voluptatem reprehenderit vel accusantium.', 'In ut repellendus dignissimos non sequi voluptas. Voluptatem rerum hic et distinctio tempore et facilis qui.', 43.60, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(25, 'Aut accusantium expedita cupiditate eos maxime incidunt debitis.', 'Laborum ut ipsum aut. Expedita est suscipit occaecati occaecati sit. Cum iste quod quia quo quidem laudantium.', 828.29, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(26, 'Et animi eos quibusdam quis assumenda dolorem totam quia.', 'Ipsum repudiandae non officiis sed cupiditate reiciendis enim. Doloribus velit id dolorem quidem. Ea rem quisquam dolorum doloremque quidem cupiditate.', 463.93, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(27, 'Explicabo aliquid nulla excepturi aut et repellendus non.', 'Velit qui necessitatibus sunt placeat earum est amet. Consequatur ducimus corrupti odit iure ea.', 617.86, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(28, 'Eveniet itaque aut veritatis aut voluptas officia quaerat.', 'Animi et maxime exercitationem et nihil ab fuga. Distinctio aut et et eveniet et autem.', 338.69, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(29, 'Omnis itaque sapiente veniam quia dolores quod.', 'Neque optio cupiditate eius adipisci ut rerum. Enim maiores ab aut praesentium fugit vel. Beatae provident voluptas neque nemo harum.', 901.36, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(30, 'Quod consequatur eos provident dolores.', 'Id quia consectetur animi laborum facere sit. Dolor doloremque facilis dolorem facere et odit.', 443.48, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(31, 'Laboriosam nobis repellendus dolor et et praesentium.', 'Dicta aliquid eius et corporis qui. Saepe amet est neque. Cumque occaecati qui nam maiores nihil ut maiores.', 641.66, 'prod2.jpg', 29, 0, 0, '2020-05-25 11:55:12', '2020-06-13 07:22:23', 2),
(32, 'Quasi maxime autem harum vitae ea et molestias aperiam.', 'Aut dolor itaque aperiam laudantium cupiditate. In eius necessitatibus corporis et nemo deserunt. Delectus assumenda dignissimos aliquid harum sed iure esse.', 902.26, 'prod1.jpg', 50, 0, 0, '2020-05-25 11:55:12', '2020-06-13 17:45:27', 12),
(33, 'Quia possimus sed ipsam et.', 'Saepe ut ut officia porro eum animi cumque. Aut pariatur velit voluptatibus architecto ut enim. Error autem rerum necessitatibus dolorem in cupiditate.', 528.47, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(34, 'Blanditiis voluptas aut et.', 'Autem nulla vero molestias dignissimos qui. Accusamus occaecati nam perferendis dignissimos tempora aliquam. Dolor molestias odio non voluptas voluptates.', 7.58, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(35, 'Vel et incidunt velit.', 'Repellat sint consequatur inventore numquam libero est enim. Corrupti quia animi ut dolore non eum illo.', 697.30, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(36, 'Odio nostrum sint quis nam.', 'Pariatur est natus exercitationem et totam eius vitae aut. Incidunt impedit ea atque voluptates non deleniti.', 453.85, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 8),
(37, 'Explicabo blanditiis exercitationem ducimus.', 'Expedita ut ad harum. In velit qui reiciendis quia. Provident culpa aut officiis minima sint minus optio officia.', 276.57, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(38, 'Odit sint esse sunt sint omnis dolor.', 'Iusto provident repellendus rem laborum natus. Voluptas quas non beatae possimus aut veniam. Magnam assumenda sit aut.', 494.26, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 9),
(39, 'Mollitia delectus sint fuga quia dolorum.', 'Sint dolores totam id et nulla minima. Odit minima optio nemo quod qui aspernatur fugit. In perspiciatis impedit et.', 297.19, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(40, 'Qui modi ut rerum cupiditate ut in non amet.', 'Ipsum sit ut amet veritatis. Consequatur illum explicabo aut vero.', 482.69, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(41, 'Veritatis reprehenderit exercitationem tenetur libero reprehenderit similique ut.', 'Dolores iusto doloremque nihil earum. Voluptatem impedit sed in officia.', 641.07, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(42, 'Rerum et repellat ut sed illo.', 'Non molestias quae aut quas dolor. Aspernatur facilis aut qui sed ea.', 8.35, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(43, 'Voluptatum modi voluptatem praesentium laborum est voluptas.', 'Totam iure eos vel ut ea minima et quisquam. Nam nesciunt omnis quia ut omnis. Nisi sunt rerum nulla repudiandae.', 311.33, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(44, 'Fugit sint cum corporis repellat molestiae.', 'Praesentium amet repudiandae eligendi id. Qui sunt non sit eaque voluptas quia aut.', 915.24, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(45, 'Minus earum assumenda labore.', 'Blanditiis sit eos exercitationem ab voluptate ut. Dolores vel molestias ratione. Omnis autem illo ipsum ea ducimus.', 291.51, 'prod2.jpg', 55, 0, 0, '2020-05-25 11:55:12', '2020-06-13 11:47:26', 9),
(46, 'Nobis est quis repellat eum quis fugiat qui.', 'Repudiandae amet quisquam aut officia deserunt molestias. Ut quia et velit doloremque nisi et quia repudiandae.', 32.61, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(47, 'Praesentium sapiente officia veniam similique iure.', 'Vitae sint voluptas impedit fugiat sed. Veniam ad quia saepe sit magnam atque atque.', 480.82, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(48, 'Cupiditate itaque qui necessitatibus nihil autem.', 'Beatae et maxime similique consequatur at eligendi. Vitae natus quo tempora voluptates.', 735.07, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(49, 'Molestias incidunt explicabo qui vitae maiores est necessitatibus.', 'Non consequuntur est repellendus et sed aut. Quis molestias quisquam adipisci pariatur itaque. Aliquid quos deserunt deleniti et molestias.', 252.67, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 1),
(50, 'Quia exercitationem quam beatae aut voluptatibus maiores.', 'Et soluta et illum. Quasi iusto recusandae ducimus.', 743.20, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(51, 'Iure dolore praesentium culpa sed sint qui quis sit.', 'Libero voluptates qui omnis quia. Perferendis ut est explicabo veritatis odio aut. Dolorem quis et nemo quam aut.', 583.21, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(52, 'Aut sed temporibus eos et adipisci iste unde.', 'Omnis amet aliquid quo et quasi eligendi. Eos autem qui quibusdam fugit aperiam.', 82.79, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 8),
(53, 'Atque et rerum aperiam delectus debitis.', 'Maxime dicta minima totam. Blanditiis inventore aut velit neque qui.', 565.71, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(54, 'Officia aut et ipsum repudiandae magni corrupti et a.', 'Pariatur et facilis dolores voluptas debitis sit. Dolores nemo ad doloremque iusto. Suscipit doloremque ut eligendi aliquid.', 517.00, 'prod3.jpg', 5, 0, 0, '2020-05-25 11:55:12', '2020-06-13 11:47:26', 12),
(55, 'Unde similique temporibus inventore.', 'Impedit eum rerum delectus itaque veritatis. Impedit sit voluptatem est sed quod. Maiores aut voluptates aliquid voluptatibus est ut voluptatibus ut.', 368.52, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(56, 'Ut est reprehenderit modi asperiores maxime voluptas.', 'Quis perferendis ipsam sint voluptas quo. Quia vitae optio earum omnis ipsa tempore debitis dolorem. Quia laborum voluptatem et sequi.', 361.01, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(57, 'Aut consequatur excepturi rem consequatur qui.', 'Qui temporibus minima suscipit qui non tempora nesciunt. Voluptatibus ratione vel fugit quaerat est. Aut eligendi optio libero ab id.', 15.43, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(58, 'Voluptatem consequatur non accusamus nisi doloribus enim voluptas.', 'Molestiae at rerum qui optio earum quos alias consectetur. Veniam eveniet aut molestiae enim labore.', 494.34, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 1),
(59, 'Doloribus mollitia corrupti quo inventore aut nihil.', 'Ab veniam expedita et neque eius beatae. Id laudantium illum possimus nihil et laboriosam qui.', 965.47, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(60, 'Molestiae quisquam necessitatibus sint.', 'Omnis sit sit consequatur quibusdam. Commodi sint dignissimos expedita voluptatum. Qui cum earum quisquam debitis.', 972.49, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(61, 'Nostrum quo nisi quidem eaque magni est.', 'Itaque non sit delectus unde ducimus. Et libero molestiae et eos omnis temporibus doloremque. Hic nesciunt et voluptate perspiciatis earum.', 762.13, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(62, 'Illo quaerat culpa aut perferendis quam exercitationem placeat.', 'Voluptatum voluptatibus doloremque eum. Quod magni voluptatem ut asperiores. Nihil natus quaerat cum ratione.', 555.47, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(63, 'Reiciendis ratione aut iusto et.', 'Quia error ex porro enim maxime veniam. Veniam corporis nam exercitationem.', 601.02, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(64, 'Reprehenderit omnis porro sed officia harum.', 'Sit fugit et rem corrupti itaque. Optio minima pariatur similique enim aut quasi eos modi. Voluptate sunt necessitatibus ut id earum.', 129.22, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 1),
(65, 'Rerum nobis est architecto quia et consequatur aperiam.', 'Id exercitationem doloremque voluptatum iste velit ut. Molestias temporibus aut necessitatibus ut eum in distinctio est. Consequuntur eius blanditiis necessitatibus sint.', 973.51, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 1),
(66, 'Incidunt labore vel sequi id accusamus et sequi a.', 'Consectetur et non laborum qui qui. Ea nam quo sed voluptatum facere.', 22.93, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 1),
(67, 'Omnis occaecati et at ipsa voluptatem.', 'Ipsum repellat aut ut officia odio voluptas eaque. Hic harum quibusdam eum. Voluptas qui rerum soluta repellendus eligendi nisi et.', 848.58, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(68, 'Totam voluptatum sint exercitationem et temporibus.', 'Odit suscipit sit accusamus quis voluptatibus. Alias officia dolor nam voluptas. Magni eaque dolor quibusdam quas quo et.', 459.84, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(69, 'Neque illo cum sint quidem ut.', 'Minus recusandae sed reiciendis. Quam alias deleniti repudiandae voluptatum.', 737.71, 'prod3.jpg', 0, 0, 1, '2020-05-25 11:55:12', '2020-06-13 18:22:18', 3),
(70, 'Iste voluptatibus quas nemo.', 'Dolore voluptatem perferendis est rerum officia consequatur id. Aspernatur in debitis optio tempore ad qui saepe quam. Ad cupiditate et similique tempore aut itaque minus.', 871.62, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(71, 'Quos laudantium id ullam ea.', 'Dolor distinctio unde ipsam qui molestiae. Pariatur nihil molestias repellendus magni reprehenderit dignissimos eos. Assumenda recusandae sit esse et similique eum ea.', 879.83, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(72, 'Ex recusandae totam qui est nulla aperiam impedit.', 'Animi eius amet nulla omnis et dicta doloremque. Dolore id voluptatibus adipisci consequuntur sint doloremque asperiores.', 935.58, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(73, 'Ut perspiciatis voluptas commodi suscipit et excepturi.', 'Est sit ut ab facere distinctio consequatur autem velit. Natus et earum qui eveniet nostrum.', 197.54, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(74, 'Facere necessitatibus et ratione facere et.', 'Et velit ullam dignissimos sed. Ut doloremque omnis quis nisi voluptate labore facilis.', 67.50, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(75, 'Ducimus est aut quam explicabo aperiam qui dolores.', 'Inventore sed est modi est dolor veritatis id. Temporibus ea sed quia assumenda voluptatibus soluta voluptatum.', 700.55, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(76, 'Aperiam eum praesentium fuga consequatur.', 'Debitis molestias ipsum numquam sed. Consequatur nostrum error distinctio aliquam. Sit consequatur laudantium et voluptatem vero itaque expedita.', 119.32, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(77, 'Dolores iure consequuntur at.', 'Libero quia aut eligendi sed quasi magnam voluptas praesentium. Excepturi natus ea harum impedit libero soluta vel.', 415.07, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(78, 'Cum suscipit fuga corrupti ullam accusantium.', 'Fugit culpa ratione magni atque rerum. Voluptate sit facere voluptatem minima ea. Voluptatibus ipsam quaerat rerum illum labore.', 50.70, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(79, 'Illo distinctio magni officia.', 'Ducimus odio reprehenderit velit quibusdam nihil accusantium harum. Mollitia voluptatem ut quisquam. Ipsum quia totam suscipit consectetur sit ipsam.', 888.75, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(80, 'Omnis nulla assumenda ipsam autem ut est distinctio.', 'Vel quae placeat esse. Consequatur dolor repudiandae sed explicabo veritatis. Est neque autem sed impedit cum eveniet nostrum.', 697.61, 'prod2.jpg', 0, 0, 3, '2020-05-25 11:55:12', '2020-06-13 18:22:18', 13),
(81, 'Rerum esse exercitationem labore facilis dolor possimus.', 'Et et cum asperiores aut. Quisquam reprehenderit assumenda maxime labore omnis temporibus.', 327.94, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(82, 'Libero enim qui earum sit ut doloremque debitis.', 'Ab et et provident placeat est eos vero facilis. Illum quas veritatis consequuntur aspernatur omnis. Ipsum veritatis facilis quia facere.', 261.14, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(83, 'Omnis nam natus voluptatem sint iusto et.', 'Excepturi sit id laborum hic. Non et inventore id est sit non non. Consequatur beatae aut id fuga sunt.', 845.99, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(84, 'Distinctio molestiae atque laudantium.', 'Qui provident dolorum expedita rem voluptatem tenetur. Nihil sint pariatur tenetur et quod nesciunt.', 556.40, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(85, 'Porro omnis architecto veritatis reiciendis.', 'Est debitis hic omnis nostrum. Aut repudiandae aut eum non.', 218.97, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(86, 'Ut laborum esse unde.', 'Ea reprehenderit consequatur magni perspiciatis id earum. Ut veritatis suscipit placeat consequatur perspiciatis enim. Facere quia dolorem sunt asperiores vel.', 684.12, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(87, 'Omnis voluptatem eaque corrupti quia.', 'Deleniti aspernatur qui quod pariatur. Id est aut ut beatae doloribus quod commodi. Et assumenda quaerat dolore debitis in tempore voluptatem.', 188.46, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(88, 'Atque et dicta ut vero.', 'Commodi aut laborum quidem et voluptates eius non et. Laborum quia doloribus reiciendis nobis qui perferendis velit nobis. Voluptas adipisci consequuntur eaque.', 490.31, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(89, 'Qui id totam qui et illum est.', 'Fugiat repellendus tenetur qui in corporis odit. Sed placeat ex eligendi magnam. Corrupti voluptatem at quibusdam ea nemo facilis.', 442.91, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(90, 'Id soluta cumque consequatur aut quo vel quos.', 'Voluptatem magnam alias est in. Reprehenderit doloremque voluptatum accusamus ut alias quis amet. Et ut reiciendis commodi.', 991.33, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(91, 'Iste aliquid animi et quis voluptatem eligendi.', 'Aliquam sint quo non culpa aut. Alias omnis dolor quia eligendi maxime similique.', 199.30, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(92, 'In nihil animi et expedita.', 'Eius quibusdam repellat maxime exercitationem molestiae fugiat. Ut eius eveniet ullam beatae ipsa est sit ipsa.', 614.23, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(93, 'Voluptas aut quos sunt ratione dolorem quia velit fuga.', 'Reiciendis delectus est cum aperiam iusto dolores doloribus possimus. Corrupti enim dolore unde aliquam blanditiis voluptates. Excepturi incidunt rerum est suscipit odit et sit.', 914.25, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(94, 'Ducimus expedita facere expedita suscipit.', 'Omnis vitae nostrum nemo laudantium veritatis. Sed numquam fuga autem et et aut quia. Aperiam consequatur est non facilis et ipsam quam.', 961.46, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(95, 'Facilis officiis quam quam facere eos fuga dignissimos.', 'Voluptas rerum velit ipsum quibusdam at consequuntur modi architecto. Delectus amet molestias sunt et.', 919.35, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(96, 'Similique quidem nesciunt harum ut.', 'Qui quia est id corrupti. Eveniet voluptates ullam sit omnis id culpa. Neque et eius molestiae autem rerum consequuntur.', 506.42, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(97, 'Eaque ducimus sed ullam quia.', 'Est qui tenetur et pariatur qui. Molestiae facere et accusantium.', 711.40, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(98, 'Dolore ducimus magnam maiores sint qui sit numquam.', 'Maxime a voluptatibus consequatur necessitatibus. Consectetur quisquam autem beatae id id. Quae ipsa et qui et perferendis.', 934.63, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(99, 'Optio blanditiis qui consequatur ad aliquam est.', 'Amet iure fuga dignissimos aliquam impedit rem. Aliquam sed commodi non quasi et porro magni rem.', 348.78, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(100, 'Doloribus consequuntur sed est quibusdam placeat eveniet.', 'Reprehenderit officiis tenetur quis voluptatem. In et minima alias rerum omnis et.', 439.33, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(101, 'Quasi accusantium porro modi ratione error.', 'Assumenda sequi nostrum et. Incidunt eos eum voluptas libero facilis vitae neque temporibus. Vel sint alias voluptas nesciunt.', 985.39, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(102, 'Quos velit quaerat aliquid excepturi id numquam eum.', 'Quos enim quia similique pariatur aut reprehenderit. Ut aperiam voluptate consequatur sunt autem vitae.', 326.83, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(103, 'Aut voluptatibus sequi ipsa quo.', 'Commodi error animi consequuntur nihil fugiat ea amet quam. Porro quo est enim delectus sunt in.', 113.46, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 9),
(104, 'Cumque aliquam saepe consequatur quia dolor qui et.', 'Amet architecto qui fugit animi voluptate. Ipsum rerum fugiat voluptates accusantium velit qui error. Debitis consequatur voluptas temporibus rerum.', 131.87, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(105, 'Fugiat quasi illo minus quaerat asperiores voluptatum.', 'Possimus sed aut molestias voluptas. Rerum corporis reprehenderit aut quaerat nemo aperiam assumenda quia. Commodi consequatur amet non soluta quia.', 277.13, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(106, 'Voluptates quibusdam saepe sunt consequatur qui veritatis.', 'Amet quo sit cum reiciendis ipsam et ratione. Et dolore qui error ut nesciunt ad aut. Est eius ad neque molestiae rerum rerum non.', 508.74, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 9),
(107, 'Provident aut esse reiciendis rerum quaerat.', 'Praesentium fugiat vero nulla nisi et. Assumenda hic provident ipsam fugiat porro nobis.', 614.79, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(108, 'Similique praesentium possimus ipsam.', 'Magni numquam tempora aut sed quos. Ut ut in doloremque hic autem illo necessitatibus. Tempore dolorem minima in eum.', 632.51, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(109, 'Totam non omnis molestias qui magnam cupiditate eos.', 'A incidunt placeat qui nobis. Voluptatibus optio rerum itaque voluptas itaque. Est maiores et sequi magnam impedit dolor praesentium.', 848.55, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(110, 'Cumque dolorem vero tenetur et reiciendis a.', 'Facere enim ex fuga sint et consequuntur. In nihil totam aspernatur nisi molestiae.', 766.56, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(111, 'Vel aliquam praesentium unde illo deleniti ab.', 'Dolorem distinctio sit unde inventore consectetur porro. Et nam sequi est qui cupiditate qui error. Quam ut porro qui quibusdam officia.', 210.47, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(112, 'Vel velit iure inventore.', 'Id quos nihil ut soluta molestiae sed. Quia soluta omnis nesciunt eos quaerat. Sequi corporis tempore mollitia molestiae.', 566.26, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(113, 'Exercitationem ut et voluptas.', 'Consequuntur incidunt et optio a quaerat dolorum unde. Voluptatum porro eveniet voluptas voluptatem quas id.', 378.89, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(114, 'Laboriosam non adipisci sed sint explicabo quis laboriosam.', 'Ex itaque soluta doloribus natus tempora. Et eum est debitis et est. Voluptates quia saepe consequatur nobis quam occaecati et.', 570.61, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 9),
(115, 'Perspiciatis soluta laborum quibusdam adipisci sunt sed doloribus quas.', 'Perspiciatis hic debitis tenetur nam quam voluptas nesciunt. Dolorem porro optio placeat inventore sint quod in aut. Esse vero quia odio.', 499.86, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(116, 'Numquam quasi itaque enim delectus recusandae et autem.', 'Quibusdam nisi mollitia voluptates alias. Eum et vero exercitationem dolorum ut voluptatibus. Alias rerum ea error sed.', 479.83, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(117, 'Nisi est totam vitae non nihil quos sit sunt.', 'Optio quam in aliquam excepturi. Distinctio dolor fugit ratione voluptatem.', 175.18, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(118, 'In et quia earum voluptatem maiores quisquam.', 'Omnis sequi tempora non dolor sed necessitatibus perspiciatis. Molestias doloremque ad mollitia est tenetur.', 379.69, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(119, 'Vero est sequi molestiae et dicta delectus error.', 'Corporis reiciendis iure possimus non. Ipsum voluptas aliquid velit aut nulla.', 995.91, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(120, 'Possimus et voluptatum aut est animi voluptas.', 'Explicabo laborum numquam voluptas ut. Aut voluptatem quia ut atque aut quia.', 930.98, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(121, 'Qui quisquam aperiam fugiat.', 'Quas aut consequuntur consequatur aut sed. Odit necessitatibus consequatur nostrum ea. Eveniet possimus incidunt exercitationem dignissimos quisquam nulla.', 611.92, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(122, 'Consequatur veniam cumque consectetur explicabo facilis.', 'Eius repudiandae non cum illo minus distinctio qui. Eius molestiae error ipsum dicta nobis veniam voluptas sunt. Cupiditate occaecati molestias dolores repudiandae saepe veritatis distinctio.', 678.69, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(123, 'Sequi impedit consectetur assumenda reiciendis dolorem voluptate pariatur.', 'Ipsa aut ut magni consequuntur pariatur eum. Expedita ad rem molestiae repudiandae dolores voluptatem. Unde animi voluptatem ea accusantium aut error soluta ut.', 972.27, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(124, 'Autem deleniti dolorem hic dolore quam.', 'Culpa cum et libero inventore eligendi et reiciendis provident. Delectus dolorem eum nisi velit vel sit qui. Temporibus voluptatum excepturi ut iusto voluptatibus dolores.', 464.27, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(125, 'Qui quae id laboriosam quibusdam deserunt temporibus provident.', 'Aperiam deserunt quis consectetur aut. Ipsum sapiente et quis ex magni distinctio. Non earum ut eum recusandae omnis quidem asperiores.', 39.63, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(126, 'At et corrupti ad voluptatem voluptas autem.', 'Tempore voluptas distinctio est nulla alias. Reprehenderit repudiandae aut deserunt itaque. Inventore eos eveniet quia maxime qui quis quos deserunt.', 745.45, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(127, 'Placeat qui velit voluptas occaecati vitae enim.', 'Adipisci earum rerum et qui qui velit sint. Tempora ipsum odio veritatis dicta iste. Repellat aliquid deserunt ipsa neque et autem.', 862.55, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(128, 'Assumenda doloremque ipsum ducimus veniam est maxime quo.', 'Error aliquid recusandae enim est optio impedit nemo. Voluptatem architecto et impedit.', 80.23, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(129, 'Veniam et recusandae cupiditate non ab ducimus animi nisi.', 'Voluptatem eius dolor omnis. Sit animi et architecto quos quia cupiditate accusantium.', 902.52, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(130, 'Est pariatur voluptatum et aspernatur.', 'Ex odio ea aut est necessitatibus omnis minima. Porro vel dicta iusto quas id. Magnam sunt minus accusantium aut necessitatibus nihil laboriosam.', 692.23, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(131, 'Dolores aspernatur assumenda voluptatum qui omnis.', 'Tempora est est et porro vel quas est incidunt. Qui voluptatem consequuntur voluptas officia praesentium voluptatem.', 455.07, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 9),
(132, 'Est qui dolor dolores est velit quae.', 'Quas aut ipsa est maxime neque voluptatum. Eum fugit fugit error quis.', 732.70, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(133, 'Est nulla sequi itaque tempora alias quidem accusantium.', 'Corrupti pariatur quidem perspiciatis ipsa ipsum maiores. Rem necessitatibus praesentium commodi necessitatibus aut laudantium id. Ut nihil earum vero molestiae illum rerum illo voluptatem.', 954.30, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(134, 'Et dolorem omnis ducimus officiis et quam voluptatem.', 'Beatae ducimus et dolorem aut fuga aut. Porro ratione et illum consequatur nemo voluptates ratione facere.', 314.01, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(135, 'Eveniet laudantium aut et id at.', 'Amet at facilis quod itaque. Odio aspernatur quia rerum quod tempore doloribus cumque.', 855.13, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(136, 'Qui recusandae et similique a amet facilis rerum rem.', 'Eaque corrupti a labore dicta cumque sed. Voluptates occaecati quia error accusamus fugiat est cumque.', 85.26, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(137, 'Beatae aliquam voluptatem quia ut quod nulla voluptas.', 'Ea aperiam distinctio cum eos amet tempore. Vero facere aut dignissimos ducimus in blanditiis velit.', 84.58, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 9),
(138, 'Eos quia iusto molestiae dolores ut velit praesentium.', 'Labore quo voluptatem corporis et incidunt. Nihil est et aut cupiditate ut.', 643.43, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 9),
(139, 'Qui cupiditate exercitationem explicabo quas necessitatibus placeat sint.', 'Est facilis et non possimus doloremque nesciunt nobis. Vel consequatur aperiam eveniet possimus est asperiores necessitatibus.', 895.63, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(140, 'Necessitatibus ducimus aut suscipit nulla.', 'Vero dolores neque ducimus minima voluptatem ut laudantium. Perferendis aut tenetur qui quis.', 543.36, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(141, 'Magnam quasi temporibus voluptatem ex ut.', 'Facere aut sed recusandae quaerat quas. Temporibus odit officiis vitae fuga et voluptatem. Earum eum qui quod ea.', 301.46, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(142, 'Minima quasi in et provident veritatis commodi.', 'Quibusdam molestias et et iure delectus. Incidunt nihil repellendus qui laudantium. Sequi dolorum eos reiciendis explicabo nihil.', 921.18, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 8),
(143, 'Sit exercitationem et aut cumque.', 'Deleniti impedit excepturi et quibusdam. Magnam nesciunt qui voluptates facere fuga dolorum eos earum. Et dolorem voluptatum voluptas quod quisquam possimus neque.', 515.40, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(144, 'Maxime nisi culpa inventore aut optio.', 'Corrupti et velit itaque officia. Quasi facilis eligendi sint id aperiam at sit. Adipisci recusandae est nam rerum laudantium vel.', 933.42, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(145, 'Eius in voluptatem vel est voluptatum laboriosam fugit.', 'Excepturi vel aut officia ducimus omnis deleniti repellendus. Ea culpa dolor qui est dolorum consequatur. Dolore corrupti aperiam labore vel.', 406.78, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4),
(146, 'Non alias aliquam nesciunt.', 'Maxime aut non veritatis voluptatem illo eveniet unde. Autem nostrum aperiam cupiditate qui quia voluptas. Libero ea dolores ut veritatis.', 351.64, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(147, 'Aut hic ad maiores quasi fugit.', 'Impedit voluptatum adipisci voluptatem alias esse rerum. Quas praesentium nihil occaecati ab maiores. Minus tenetur qui voluptates modi excepturi magni placeat.', 600.26, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 9),
(148, 'Ea et voluptate culpa nulla culpa et eum.', 'Ut eveniet voluptas omnis laboriosam odit officia ut. Molestiae rerum mollitia libero voluptates.', 904.15, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 8),
(149, 'Aut assumenda beatae qui vel quos assumenda.', 'Sed odio aut labore voluptas beatae ut ipsam. Sed porro provident occaecati. Amet ipsa sed officia ratione.', 646.69, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(150, 'Ut esse animi molestiae vitae pariatur quibusdam voluptates aliquam.', 'Tempora alias suscipit esse odio officiis voluptatem. Omnis eius ducimus quae dolorum.', 681.71, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 1),
(151, 'Soluta at at cupiditate ut quisquam nam.', 'Voluptatem eius eos autem qui. Voluptas aut consectetur nihil neque quisquam. Non eum non occaecati deserunt sit quis blanditiis quia.', 190.66, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(152, 'Sunt velit qui ipsum et modi praesentium.', 'Magni placeat harum fuga. Tempora dignissimos error officiis dolorum.', 252.69, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(153, 'Ratione iste temporibus quis nulla qui.', 'Eaque dolor ratione deleniti neque sed dolorem reprehenderit. Aliquam sapiente sed tenetur. Non ab et reiciendis tempora vel recusandae.', 182.85, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(154, 'Alias deleniti consequuntur facere aut aut exercitationem.', 'Iste possimus ut sunt sapiente non tempora. Non quia voluptatibus quo quasi.', 759.08, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 1),
(155, 'Mollitia qui modi itaque omnis veniam rerum repellendus tenetur.', 'Facilis est incidunt rerum aut assumenda explicabo unde. Qui hic aut ex quae necessitatibus et. Perferendis minima eum ut praesentium ut qui nihil.', 722.56, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(156, 'Eligendi rerum maiores consequatur commodi.', 'Quis tenetur fugiat dolor eaque. Dolores cupiditate occaecati explicabo eaque quis. Autem facilis repellendus aliquid eaque veniam voluptas.', 801.75, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(157, 'Expedita voluptatibus in aut accusamus est itaque et.', 'Nostrum eos eaque minus voluptas id id. Aperiam impedit voluptates sit accusamus repudiandae consequuntur. Odit eum maiores totam nobis.', 715.89, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(158, 'Quidem quidem voluptatibus quo repellendus ducimus.', 'In dolores officiis voluptatum rerum officia voluptates et. Dolor dicta qui sapiente error. Laudantium voluptatem maiores suscipit debitis culpa tenetur deleniti.', 247.70, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(159, 'Delectus quam qui sit nulla labore.', 'Sed nemo iure dolorem eum nostrum sequi velit. Laborum aut aut ratione voluptas qui est eligendi.', 68.92, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2),
(160, 'Autem reprehenderit rerum eligendi repellendus quibusdam modi.', 'Voluptas omnis molestiae eum itaque. Ea qui magnam atque hic illum.', 677.76, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(161, 'Qui dolor accusamus nulla non.', 'Rem rerum ducimus rerum omnis et. Ea ea deserunt expedita eos placeat harum.', 935.37, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(162, 'Repudiandae consequatur odit sit eius.', 'Quam praesentium et modi tempore earum rem. Et voluptatem sed reprehenderit necessitatibus culpa nobis. Qui quo ullam fuga facilis officiis aut non.', 194.36, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(163, 'Repudiandae natus iusto voluptate beatae inventore.', 'Id minima quas aut qui laudantium dignissimos. Ut perferendis at est asperiores commodi recusandae.', 232.99, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(164, 'Cumque magnam odit aperiam cumque eum incidunt velit.', 'Rem similique est ipsa totam cumque eius excepturi. Commodi sit ut qui.', 257.90, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(165, 'Temporibus consequatur dignissimos aliquid qui molestias maxime numquam.', 'Provident praesentium eos veritatis qui. Autem labore quasi natus.', 489.19, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(166, 'Molestiae eum quae magnam perspiciatis accusantium.', 'Doloremque eum dolorum veniam ut quaerat. Suscipit voluptatem ut reiciendis necessitatibus dolores aut. Reprehenderit dolorem doloribus cumque iusto officiis quod quidem aut.', 812.48, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(167, 'Eum ratione et ut quo.', 'Voluptatem modi nostrum dolorem vitae odit officiis. Quia corrupti hic eum.', 687.53, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(168, 'Repudiandae et corrupti velit inventore aut ut.', 'Reprehenderit ut et enim eligendi natus dolores eos exercitationem. Dolore omnis et eos aut numquam. Sed ad non tempora error.', 805.11, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(169, 'Iure et voluptatem optio amet similique facilis.', 'Ipsam sunt beatae sunt et. Et autem sit voluptas. Eum odit deleniti voluptatum esse sed dolorem perferendis omnis.', 700.45, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(170, 'Blanditiis assumenda animi vel dolor deleniti velit magni.', 'Quis explicabo provident accusamus quis reiciendis libero eligendi. Aut odio autem ipsam voluptas. Voluptas quae labore omnis est aut voluptatem facere.', 662.49, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(171, 'Repellat eum vero ratione porro iusto.', 'Asperiores quia sed fugiat dolor dolore. Harum quidem voluptatem id voluptatem veniam.', 314.50, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 6),
(172, 'Ut qui voluptatibus laboriosam culpa similique.', 'Consequuntur quia nihil fugit qui et non autem et. Perferendis et laudantium modi excepturi porro et velit.', 548.42, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(173, 'In aut saepe nihil velit.', 'Omnis quo aut ex. Molestiae cumque libero explicabo magnam excepturi.', 131.35, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(174, 'Velit et id quis odit.', 'Dignissimos nihil est quae. Velit sequi nostrum eveniet sunt neque sed enim est.', 354.39, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 9),
(175, 'Quasi velit facilis nam eveniet quidem libero.', 'Enim atque dolorum illo quasi. Adipisci voluptatem soluta quod.', 566.27, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(176, 'Impedit veniam maxime et mollitia quasi at ab.', 'Numquam officia minima omnis voluptatem. Est libero eligendi error.', 867.91, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(177, 'Quas quis ea fugiat rerum amet aspernatur.', 'Asperiores animi ea quia vel sequi. Quibusdam ea ea dolorem quam placeat corporis libero.', 915.59, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 7),
(178, 'Et odio autem dolores ex perspiciatis.', 'Culpa voluptatem quod quia temporibus necessitatibus vero. Dolorem est et sit. Aut ut nesciunt voluptates et laboriosam.', 388.88, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 8),
(179, 'Et officiis possimus explicabo non aliquid.', 'Sunt iste nihil ex quidem consequatur optio. Officia facilis rem vel et voluptas magni. Perferendis fugiat perspiciatis eos asperiores ex.', 902.77, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(180, 'Impedit aperiam soluta exercitationem eos placeat sit incidunt.', 'Id aut qui et natus itaque culpa reiciendis. Laudantium ea alias quo laudantium enim repudiandae. Nesciunt et id similique beatae ad.', 921.96, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 8),
(181, 'Error laboriosam quis et placeat corporis dolores qui.', 'Atque maxime aut tenetur expedita dicta dolorum. Adipisci sed deleniti non sed rerum. Distinctio nisi quia mollitia ea ut accusantium perspiciatis nulla.', 803.94, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(182, 'Molestias minima cupiditate esse odio est sit eligendi.', 'Totam ea quaerat consequatur a ipsum. Pariatur rem et corporis aut rerum saepe nobis.', 922.81, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 13),
(183, 'Qui et fuga corporis consequatur consectetur possimus eveniet eum.', 'Doloremque veritatis consectetur aut. Nulla nihil quod ut qui molestiae.', 659.01, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 1),
(184, 'Quidem rerum nemo et ut quis repudiandae asperiores et.', 'Odio repudiandae molestias natus laudantium natus. Itaque delectus assumenda asperiores eius asperiores quasi. Accusantium culpa perferendis tempore facere iste autem sit.', 59.46, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(185, 'Eos esse molestiae nostrum sit.', 'Ea occaecati eveniet voluptatem. Dolores distinctio soluta est sit quo ea dolorum placeat. Quasi aut quod quos nulla.', 525.13, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(186, 'Similique tempora accusantium ea officia ut modi perferendis.', 'Qui et et et magni qui consectetur sit deserunt. Enim molestiae omnis voluptatem dolores architecto. Fugiat et sunt eligendi est voluptas.', 670.20, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 5),
(187, 'Esse est voluptatibus accusamus eum et.', 'Sit esse aspernatur quas perspiciatis. Repudiandae nihil harum velit praesentium. Fuga eveniet repudiandae omnis quae.', 322.02, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 12),
(188, 'Dolor nihil occaecati at mollitia ut et.', 'Nam magnam est excepturi sapiente recusandae laboriosam. Esse adipisci quam numquam iusto ut.', 147.35, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(189, 'Assumenda quo qui assumenda voluptates iste non.', 'Aut illo voluptatibus ut dolorem dignissimos impedit consequatur molestiae. Aperiam explicabo corporis necessitatibus qui eos.', 155.54, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(190, 'Aliquid aut quaerat nihil dolores nobis ipsam.', 'Praesentium ut et adipisci repellendus nam sint. Similique blanditiis ea iste labore distinctio.', 285.64, 'prod6.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(191, 'Nihil vitae qui aliquam optio dolorum facilis.', 'Culpa ipsam voluptatem soluta. Minima consequatur nisi vitae dignissimos non. Sequi qui hic repudiandae saepe ea.', 755.71, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 11),
(192, 'Ea et inventore sapiente aut itaque.', 'Pariatur reprehenderit non maxime maiores id. Saepe distinctio quisquam ipsa ut quaerat ex.', 787.65, 'prod4.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 14),
(193, 'Quo atque delectus enim quae sunt autem dolor in.', 'Deserunt ut sint perspiciatis assumenda. Quibusdam in placeat porro quo voluptatibus sint voluptatem. Ratione harum autem hic omnis distinctio sequi dolorem.', 921.51, 'prod5.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 3),
(194, 'Mollitia laborum in officiis est.', 'Sunt dolore culpa natus perferendis quo itaque dolor laudantium. Esse nostrum perferendis maxime eveniet mollitia. Ipsum quis asperiores ratione.', 371.85, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 1),
(195, 'Consequatur officia fugit hic praesentium tempora impedit corporis sed.', 'Soluta consequatur est libero et et. Culpa minima aut ea debitis impedit tenetur.', 463.79, 'prod2.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 10),
(196, 'Non non vero ab et.', 'Id aut sed voluptatem rerum omnis sed. Voluptatem omnis omnis aut et quia. Nostrum qui omnis commodi eius eos.', 809.11, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 15),
(197, 'Et quia blanditiis natus laborum incidunt consectetur voluptatem.', 'Alias officia autem temporibus ea quam et. Veniam aliquid ad dolor qui similique. Possimus modi quo et culpa veritatis.', 776.52, 'prod3.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 4);
INSERT IGNORE INTO `products` (`id`, `name`, `description`, `price`, `image`, `qty`, `qty_order`, `qty_delivery`, `created_at`, `updated_at`, `catalog_id`) VALUES
(198, 'Et aut debitis qui rem modi a asperiores.', 'Illum dolor laudantium enim suscipit magnam odit. Earum harum sed doloremque optio. Tenetur quia magni et et est voluptatem expedita.', 440.26, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 16),
(199, 'Dolores cumque adipisci id.', 'Ullam enim corporis voluptatum sunt impedit quae magnam. Veritatis saepe voluptatem nemo natus porro in quia. Sed ea eligendi voluptatem occaecati minus voluptate.', 834.62, 'prod1.jpg', 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `products_related_products`
--

DROP TABLE IF EXISTS `products_related_products`;
CREATE TABLE `products_related_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `related_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products_related_products`
--

INSERT IGNORE INTO `products_related_products` (`id`, `related_product_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 163, 1, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(2, 194, 1, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(3, 189, 1, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(4, 59, 1, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(5, 166, 1, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(6, 122, 2, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(7, 43, 2, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(8, 51, 2, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(9, 149, 2, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(10, 11, 2, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(11, 180, 3, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(12, 131, 3, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(13, 82, 3, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(14, 168, 3, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(15, 100, 3, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(16, 156, 4, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(17, 102, 4, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(18, 55, 4, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(19, 186, 4, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(20, 3, 4, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(21, 60, 5, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(22, 78, 5, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(23, 84, 5, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(24, 94, 5, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(25, 177, 5, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(26, 179, 6, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(27, 114, 6, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(28, 99, 6, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(29, 175, 6, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(30, 159, 6, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(31, 179, 7, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(32, 33, 7, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(33, 35, 7, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(34, 130, 7, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(35, 133, 7, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(36, 138, 8, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(37, 28, 8, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(38, 83, 8, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(39, 152, 8, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(40, 10, 8, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(41, 44, 9, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(42, 171, 9, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(43, 88, 9, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(44, 174, 9, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(45, 76, 9, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(46, 38, 10, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(47, 145, 10, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(48, 83, 10, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(49, 154, 10, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(50, 127, 10, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(51, 191, 11, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(52, 114, 11, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(53, 45, 11, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(54, 18, 11, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(55, 155, 11, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(56, 187, 12, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(57, 9, 12, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(58, 55, 12, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(59, 16, 12, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(60, 13, 12, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(61, 128, 13, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(62, 189, 13, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(63, 185, 13, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(64, 150, 13, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(65, 61, 13, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(66, 126, 14, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(67, 170, 14, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(68, 99, 14, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(69, 108, 14, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(70, 27, 14, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(71, 192, 15, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(72, 163, 15, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(73, 32, 15, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(74, 84, 15, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(75, 124, 15, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(76, 107, 16, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(77, 103, 16, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(78, 125, 16, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(79, 88, 16, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(80, 12, 16, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(81, 101, 17, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(82, 135, 17, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(83, 132, 17, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(84, 195, 17, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(85, 90, 17, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(86, 35, 18, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(87, 12, 18, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(88, 166, 18, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(89, 124, 18, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(90, 144, 18, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(91, 165, 19, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(92, 164, 19, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(93, 154, 19, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(94, 133, 19, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(95, 6, 19, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(96, 186, 20, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(97, 26, 20, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(98, 7, 20, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(99, 77, 20, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(100, 133, 20, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(101, 190, 21, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(102, 99, 21, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(103, 142, 21, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(104, 128, 21, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(105, 100, 21, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(106, 99, 22, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(107, 47, 22, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(108, 130, 22, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(109, 107, 22, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(110, 96, 22, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(111, 139, 23, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(112, 94, 23, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(113, 63, 23, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(114, 189, 23, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(115, 143, 24, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(116, 74, 24, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(117, 174, 24, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(118, 45, 24, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(119, 30, 24, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(120, 186, 25, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(121, 11, 25, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(122, 117, 25, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(123, 109, 25, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(124, 51, 25, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(125, 24, 26, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(126, 58, 26, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(127, 49, 26, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(128, 99, 26, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(129, 98, 26, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(130, 62, 27, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(131, 21, 27, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(132, 88, 27, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(133, 5, 27, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(134, 111, 27, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(135, 84, 28, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(136, 16, 28, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(137, 67, 28, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(138, 107, 28, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(139, 5, 28, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(140, 3, 29, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(141, 76, 29, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(142, 85, 29, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(143, 75, 29, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(144, 103, 29, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(145, 163, 30, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(146, 158, 30, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(147, 142, 30, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(148, 102, 30, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(149, 81, 30, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(150, 129, 31, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(151, 117, 31, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(152, 90, 31, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(153, 125, 31, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(154, 46, 31, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(155, 94, 32, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(156, 52, 32, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(157, 92, 32, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(158, 108, 32, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(159, 23, 32, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(160, 198, 33, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(161, 94, 33, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(162, 57, 33, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(163, 88, 33, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(164, 27, 33, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(165, 6, 34, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(166, 196, 34, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(167, 60, 34, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(168, 41, 34, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(169, 174, 34, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(170, 5, 35, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(171, 21, 35, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(172, 14, 35, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(173, 123, 35, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(174, 15, 35, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(175, 8, 36, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(176, 199, 36, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(177, 12, 36, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(178, 138, 36, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(179, 185, 36, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(180, 185, 37, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(181, 73, 37, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(182, 106, 37, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(183, 167, 37, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(184, 70, 37, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(185, 149, 38, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(186, 45, 38, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(187, 8, 38, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(188, 64, 38, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(189, 178, 38, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(190, 178, 39, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(191, 194, 39, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(192, 147, 39, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(193, 97, 39, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(194, 162, 39, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(195, 72, 40, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(196, 166, 40, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(197, 193, 40, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(198, 139, 40, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(199, 109, 40, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(200, 168, 41, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(201, 65, 41, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(202, 200, 41, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(203, 103, 41, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(204, 37, 41, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(205, 129, 42, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(206, 166, 42, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(207, 21, 42, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(208, 152, 42, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(209, 194, 42, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(210, 48, 43, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(211, 104, 43, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(212, 173, 43, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(213, 179, 43, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(214, 197, 43, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(215, 39, 44, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(216, 27, 44, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(217, 7, 44, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(218, 98, 44, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(219, 89, 44, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(220, 8, 45, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(221, 43, 45, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(222, 191, 45, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(223, 173, 45, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(224, 119, 45, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(225, 175, 46, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(226, 173, 46, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(227, 65, 46, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(228, 68, 46, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(229, 114, 46, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(230, 125, 47, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(231, 48, 47, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(232, 81, 47, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(233, 167, 47, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(234, 184, 47, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(235, 158, 48, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(236, 33, 48, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(237, 32, 48, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(238, 22, 48, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(239, 98, 48, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(240, 34, 49, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(241, 188, 49, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(242, 131, 49, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(243, 112, 49, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(244, 64, 49, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(245, 131, 50, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(246, 33, 50, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(247, 150, 50, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(248, 134, 50, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(249, 137, 50, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(250, 188, 51, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(251, 132, 51, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(252, 136, 51, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(253, 68, 51, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(254, 81, 51, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(255, 39, 52, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(256, 58, 52, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(257, 80, 52, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(258, 79, 52, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(259, 96, 52, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(260, 197, 53, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(261, 5, 53, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(262, 23, 53, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(263, 74, 53, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(264, 55, 53, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(265, 106, 54, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(266, 93, 54, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(267, 46, 54, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(268, 5, 54, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(269, 148, 54, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(270, 107, 55, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(271, 90, 55, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(272, 99, 55, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(273, 141, 55, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(274, 183, 55, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(275, 61, 56, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(276, 140, 56, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(277, 122, 56, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(278, 138, 56, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(279, 142, 57, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(280, 51, 57, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(281, 93, 57, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(282, 107, 57, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(283, 22, 57, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(284, 196, 58, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(285, 107, 58, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(286, 52, 58, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(287, 18, 58, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(288, 43, 58, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(289, 75, 59, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(290, 100, 59, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(291, 119, 59, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(292, 61, 59, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(293, 80, 59, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(294, 12, 60, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(295, 28, 60, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(296, 144, 60, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(297, 32, 60, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(298, 120, 60, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(299, 14, 61, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(300, 33, 61, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(301, 178, 61, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(302, 199, 61, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(303, 184, 61, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(304, 44, 62, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(305, 35, 62, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(306, 145, 62, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(307, 13, 62, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(308, 60, 62, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(309, 167, 63, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(310, 180, 63, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(311, 126, 63, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(312, 143, 63, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(313, 157, 63, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(314, 76, 64, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(315, 149, 64, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(316, 85, 64, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(317, 1, 64, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(318, 130, 64, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(319, 124, 65, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(320, 51, 65, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(321, 53, 65, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(322, 128, 65, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(323, 158, 65, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(324, 14, 66, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(325, 179, 66, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(326, 122, 66, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(327, 174, 66, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(328, 19, 66, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(329, 163, 67, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(330, 47, 67, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(331, 18, 67, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(332, 157, 67, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(333, 62, 67, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(334, 139, 68, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(335, 65, 68, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(336, 181, 68, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(337, 65, 68, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(338, 132, 68, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(339, 49, 69, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(340, 82, 69, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(341, 125, 69, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(342, 184, 69, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(343, 107, 69, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(344, 174, 70, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(345, 40, 70, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(346, 188, 70, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(347, 182, 70, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(348, 192, 70, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(349, 150, 71, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(350, 87, 71, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(351, 64, 71, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(352, 100, 71, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(353, 25, 71, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(354, 12, 72, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(355, 100, 72, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(356, 149, 72, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(357, 6, 72, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(358, 187, 72, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(359, 117, 73, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(360, 166, 73, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(361, 152, 73, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(362, 62, 73, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(363, 95, 73, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(364, 36, 74, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(365, 72, 74, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(366, 88, 74, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(367, 82, 74, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(368, 119, 74, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(369, 199, 75, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(370, 138, 75, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(371, 84, 75, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(372, 149, 75, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(373, 130, 75, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(374, 99, 76, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(375, 166, 76, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(376, 181, 76, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(377, 158, 76, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(378, 82, 76, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(379, 107, 77, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(380, 72, 77, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(381, 196, 77, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(382, 52, 77, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(383, 184, 77, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(384, 123, 78, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(385, 79, 78, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(386, 29, 78, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(387, 191, 78, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(388, 130, 78, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(389, 135, 79, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(390, 49, 79, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(391, 151, 79, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(392, 133, 79, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(393, 58, 79, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(394, 77, 80, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(395, 175, 80, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(396, 186, 80, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(397, 98, 80, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(398, 77, 81, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(399, 93, 81, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(400, 34, 81, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(401, 175, 81, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(402, 69, 81, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(403, 109, 82, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(404, 39, 82, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(405, 172, 82, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(406, 125, 82, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(407, 105, 82, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(408, 60, 83, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(409, 33, 83, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(410, 182, 83, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(411, 66, 83, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(412, 105, 83, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(413, 2, 84, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(414, 96, 84, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(415, 105, 84, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(416, 48, 84, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(417, 186, 84, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(418, 33, 85, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(419, 75, 85, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(420, 87, 85, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(421, 75, 85, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(422, 186, 85, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(423, 50, 86, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(424, 153, 86, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(425, 12, 86, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(426, 161, 86, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(427, 120, 86, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(428, 158, 87, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(429, 76, 87, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(430, 165, 87, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(431, 184, 87, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(432, 188, 87, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(433, 40, 88, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(434, 24, 88, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(435, 127, 88, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(436, 166, 88, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(437, 63, 88, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(438, 114, 89, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(439, 23, 89, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(440, 134, 89, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(441, 188, 89, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(442, 53, 89, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(443, 170, 90, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(444, 105, 90, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(445, 42, 90, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(446, 28, 90, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(447, 149, 90, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(448, 76, 91, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(449, 177, 91, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(450, 67, 91, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(451, 153, 91, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(452, 68, 91, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(453, 80, 92, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(454, 81, 92, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(455, 145, 92, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(456, 169, 92, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(457, 77, 92, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(458, 179, 93, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(459, 175, 93, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(460, 27, 93, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(461, 40, 93, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(462, 165, 93, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(463, 73, 94, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(464, 76, 94, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(465, 8, 94, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(466, 110, 94, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(467, 54, 94, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(468, 148, 95, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(469, 1, 95, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(470, 137, 95, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(471, 167, 95, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(472, 6, 95, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(473, 148, 96, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(474, 29, 96, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(475, 102, 96, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(476, 44, 96, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(477, 70, 96, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(478, 164, 97, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(479, 85, 97, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(480, 23, 97, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(481, 106, 97, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(482, 137, 97, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(483, 38, 98, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(484, 123, 98, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(485, 95, 98, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(486, 33, 98, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(487, 92, 98, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(488, 135, 99, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(489, 95, 99, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(490, 166, 99, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(491, 135, 99, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(492, 42, 99, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(493, 55, 100, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(494, 118, 100, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(495, 133, 100, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(496, 173, 100, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(497, 38, 100, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(498, 9, 101, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(499, 53, 101, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(500, 134, 101, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(501, 128, 101, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(502, 90, 101, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(503, 198, 102, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(504, 64, 102, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(505, 131, 102, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(506, 126, 102, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(507, 95, 102, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(508, 192, 103, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(509, 162, 103, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(510, 52, 103, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(511, 181, 103, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(512, 65, 103, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(513, 45, 104, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(514, 124, 104, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(515, 195, 104, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(516, 58, 104, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(517, 151, 104, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(518, 159, 105, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(519, 22, 105, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(520, 4, 105, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(521, 20, 105, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(522, 88, 105, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(523, 19, 106, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(524, 131, 106, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(525, 184, 106, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(526, 46, 106, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(527, 187, 106, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(528, 2, 107, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(529, 167, 107, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(530, 6, 107, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(531, 54, 107, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(532, 193, 107, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(533, 128, 108, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(534, 134, 108, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(535, 182, 108, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(536, 3, 108, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(537, 31, 108, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(538, 196, 109, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(539, 57, 109, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(540, 70, 109, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(541, 86, 109, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(542, 45, 109, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(543, 153, 110, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(544, 189, 110, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(545, 104, 110, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(546, 137, 110, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(547, 49, 110, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(548, 138, 111, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(549, 152, 111, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(550, 38, 111, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(551, 54, 111, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(552, 163, 111, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(553, 61, 112, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(554, 59, 112, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(555, 90, 112, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(556, 127, 112, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(557, 2, 112, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(558, 19, 113, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(559, 99, 113, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(560, 83, 113, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(561, 107, 113, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(562, 129, 113, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(563, 156, 114, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(564, 82, 114, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(565, 128, 114, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(566, 3, 114, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(567, 196, 114, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(568, 134, 115, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(569, 200, 115, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(570, 101, 115, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(571, 11, 115, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(572, 60, 115, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(573, 142, 116, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(574, 197, 116, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(575, 43, 116, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(576, 95, 116, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(577, 38, 116, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(578, 97, 117, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(579, 102, 117, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(580, 194, 117, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(581, 89, 117, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(582, 12, 117, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(583, 103, 118, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(584, 137, 118, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(585, 147, 118, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(586, 95, 118, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(587, 64, 118, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(588, 90, 119, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(589, 65, 119, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(590, 82, 119, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(591, 12, 119, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(592, 20, 119, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(593, 183, 120, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(594, 54, 120, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(595, 146, 120, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(596, 189, 120, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(597, 196, 120, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(598, 162, 121, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(599, 38, 121, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(600, 138, 121, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(601, 141, 121, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(602, 170, 121, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(603, 98, 122, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(604, 188, 122, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(605, 51, 122, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(606, 19, 122, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(607, 176, 122, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(608, 157, 123, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(609, 19, 123, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(610, 189, 123, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(611, 161, 123, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(612, 187, 123, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(613, 82, 124, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(614, 181, 124, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(615, 149, 124, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(616, 199, 124, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(617, 13, 124, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(618, 157, 125, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(619, 45, 125, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(620, 89, 125, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(621, 179, 125, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(622, 145, 125, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(623, 108, 126, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(624, 16, 126, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(625, 124, 126, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(626, 62, 126, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(627, 110, 126, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(628, 93, 127, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(629, 46, 127, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(630, 44, 127, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(631, 13, 127, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(632, 147, 127, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(633, 10, 128, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(634, 48, 128, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(635, 154, 128, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(636, 91, 128, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(637, 140, 129, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(638, 64, 129, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(639, 4, 129, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(640, 106, 129, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(641, 87, 129, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(642, 27, 130, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(643, 3, 130, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(644, 144, 130, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(645, 5, 130, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(646, 20, 130, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(647, 175, 131, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(648, 22, 131, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(649, 87, 131, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(650, 124, 131, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(651, 73, 131, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(652, 16, 132, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(653, 143, 132, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(654, 96, 132, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(655, 67, 132, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(656, 136, 132, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(657, 158, 133, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(658, 185, 133, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(659, 178, 133, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(660, 79, 133, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(661, 32, 133, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(662, 156, 134, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(663, 48, 134, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(664, 120, 134, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(665, 142, 134, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(666, 112, 134, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(667, 160, 135, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(668, 166, 135, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(669, 174, 135, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(670, 133, 135, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(671, 118, 135, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(672, 19, 136, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(673, 104, 136, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(674, 128, 136, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(675, 63, 136, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(676, 170, 136, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(677, 62, 137, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(678, 14, 137, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(679, 100, 137, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(680, 195, 137, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(681, 37, 137, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(682, 58, 138, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(683, 2, 138, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(684, 52, 138, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(685, 115, 138, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(686, 115, 138, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(687, 48, 139, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(688, 26, 139, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(689, 77, 139, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(690, 61, 139, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(691, 12, 139, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(692, 14, 140, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(693, 75, 140, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(694, 3, 140, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(695, 19, 140, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(696, 190, 140, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(697, 183, 141, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(698, 34, 141, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(699, 137, 141, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(700, 131, 141, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(701, 186, 141, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(702, 58, 142, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(703, 127, 142, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(704, 198, 142, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(705, 37, 142, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(706, 143, 142, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(707, 31, 143, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(708, 165, 143, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(709, 158, 143, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(710, 146, 143, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(711, 105, 143, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(712, 80, 144, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(713, 72, 144, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(714, 166, 144, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(715, 25, 144, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(716, 86, 144, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(717, 190, 145, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(718, 197, 145, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(719, 100, 145, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(720, 25, 145, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(721, 151, 145, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(722, 7, 146, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(723, 72, 146, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(724, 187, 146, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(725, 159, 146, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(726, 197, 146, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(727, 113, 147, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(728, 65, 147, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(729, 85, 147, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(730, 48, 147, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(731, 130, 147, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(732, 141, 148, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(733, 161, 148, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(734, 151, 148, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(735, 145, 148, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(736, 81, 148, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(737, 175, 149, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(738, 152, 149, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(739, 95, 149, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(740, 69, 149, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(741, 54, 149, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(742, 170, 150, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(743, 141, 150, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(744, 23, 150, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(745, 20, 150, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(746, 135, 150, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(747, 32, 151, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(748, 45, 151, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(749, 125, 151, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(750, 88, 151, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(751, 102, 152, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(752, 108, 152, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(753, 2, 152, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(754, 74, 152, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(755, 49, 152, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(756, 170, 153, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(757, 20, 153, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(758, 92, 153, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(759, 151, 153, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(760, 2, 153, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(761, 123, 154, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(762, 45, 154, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(763, 75, 154, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(764, 49, 154, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(765, 94, 154, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(766, 108, 155, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(767, 166, 155, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(768, 96, 155, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(769, 69, 155, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(770, 54, 155, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(771, 85, 156, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(772, 57, 156, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(773, 45, 156, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(774, 10, 156, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(775, 87, 156, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(776, 120, 157, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(777, 86, 157, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(778, 34, 157, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(779, 110, 157, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(780, 126, 157, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(781, 183, 158, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(782, 2, 158, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(783, 99, 158, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(784, 168, 158, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(785, 157, 158, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(786, 18, 159, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(787, 37, 159, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(788, 161, 159, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(789, 193, 159, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(790, 17, 159, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(791, 162, 160, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(792, 126, 160, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(793, 98, 160, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(794, 111, 160, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(795, 168, 160, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(796, 10, 161, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(797, 84, 161, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(798, 69, 161, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(799, 134, 161, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(800, 171, 161, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(801, 103, 162, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(802, 18, 162, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(803, 8, 162, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(804, 44, 162, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(805, 152, 162, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(806, 90, 163, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(807, 85, 163, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(808, 102, 163, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(809, 186, 163, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(810, 146, 163, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(811, 58, 164, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(812, 45, 164, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(813, 112, 164, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(814, 12, 164, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(815, 170, 164, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(816, 12, 165, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(817, 192, 165, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(818, 114, 165, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(819, 166, 165, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(820, 105, 165, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(821, 75, 166, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(822, 47, 166, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(823, 141, 166, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(824, 56, 166, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(825, 159, 166, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(826, 196, 167, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(827, 97, 167, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(828, 152, 167, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(829, 59, 167, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(830, 125, 167, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(831, 184, 168, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(832, 37, 168, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(833, 198, 168, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(834, 139, 168, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(835, 200, 168, '2020-05-25 11:55:13', '2020-05-25 11:55:13');
INSERT IGNORE INTO `products_related_products` (`id`, `related_product_id`, `product_id`, `created_at`, `updated_at`) VALUES
(836, 5, 169, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(837, 168, 169, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(838, 98, 169, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(839, 9, 169, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(840, 117, 169, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(841, 181, 170, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(842, 184, 170, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(843, 83, 170, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(844, 99, 170, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(845, 17, 170, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(846, 45, 171, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(847, 104, 171, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(848, 115, 171, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(849, 35, 171, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(850, 158, 171, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(851, 22, 172, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(852, 148, 172, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(853, 14, 172, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(854, 180, 172, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(855, 112, 172, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(856, 127, 173, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(857, 130, 173, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(858, 105, 173, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(859, 37, 173, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(860, 93, 173, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(861, 8, 174, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(862, 75, 174, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(863, 185, 174, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(864, 154, 174, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(865, 116, 174, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(866, 26, 175, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(867, 25, 175, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(868, 36, 175, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(869, 54, 175, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(870, 179, 175, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(871, 65, 176, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(872, 96, 176, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(873, 31, 176, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(874, 108, 176, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(875, 95, 176, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(876, 36, 177, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(877, 130, 177, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(878, 131, 177, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(879, 86, 177, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(880, 85, 177, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(881, 39, 178, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(882, 187, 178, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(883, 18, 178, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(884, 197, 178, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(885, 98, 178, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(886, 67, 179, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(887, 133, 179, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(888, 90, 179, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(889, 46, 179, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(890, 136, 179, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(891, 85, 180, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(892, 31, 180, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(893, 195, 180, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(894, 184, 180, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(895, 142, 180, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(896, 80, 181, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(897, 82, 181, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(898, 93, 181, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(899, 156, 181, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(900, 103, 181, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(901, 152, 182, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(902, 179, 182, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(903, 144, 182, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(904, 198, 182, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(905, 52, 182, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(906, 115, 183, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(907, 150, 183, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(908, 28, 183, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(909, 129, 183, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(910, 101, 183, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(911, 102, 184, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(912, 76, 184, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(913, 158, 184, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(914, 1, 184, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(915, 88, 184, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(916, 79, 185, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(917, 178, 185, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(918, 164, 185, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(919, 9, 185, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(920, 163, 185, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(921, 75, 186, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(922, 72, 186, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(923, 53, 186, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(924, 179, 186, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(925, 40, 186, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(926, 45, 187, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(927, 184, 187, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(928, 126, 187, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(929, 146, 187, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(930, 89, 187, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(931, 176, 188, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(932, 22, 188, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(933, 163, 188, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(934, 14, 188, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(935, 166, 188, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(936, 150, 189, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(937, 172, 189, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(938, 148, 189, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(939, 140, 189, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(940, 96, 189, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(941, 52, 190, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(942, 25, 190, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(943, 41, 190, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(944, 25, 190, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(945, 45, 190, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(946, 84, 191, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(947, 69, 191, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(948, 46, 191, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(949, 77, 191, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(950, 180, 191, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(951, 95, 192, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(952, 84, 192, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(953, 177, 192, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(954, 27, 192, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(955, 6, 192, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(956, 1, 193, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(957, 179, 193, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(958, 177, 193, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(959, 15, 193, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(960, 35, 193, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(961, 152, 194, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(962, 170, 194, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(963, 98, 194, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(964, 171, 194, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(965, 146, 194, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(966, 30, 195, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(967, 122, 195, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(968, 31, 195, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(969, 42, 195, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(970, 22, 195, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(971, 111, 196, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(972, 199, 196, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(973, 82, 196, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(974, 52, 196, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(975, 12, 196, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(976, 195, 197, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(977, 53, 197, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(978, 38, 197, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(979, 2, 197, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(980, 120, 197, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(981, 154, 198, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(982, 179, 198, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(983, 130, 198, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(984, 188, 198, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(985, 91, 198, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(986, 15, 199, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(987, 16, 199, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(988, 13, 199, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(989, 130, 199, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(990, 58, 199, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(991, 168, 200, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(992, 132, 200, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(993, 5, 200, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(994, 53, 200, '2020-05-25 11:55:13', '2020-05-25 11:55:13'),
(995, 84, 200, '2020-05-25 11:55:13', '2020-05-25 11:55:13');

-- --------------------------------------------------------

--
-- Структура таблицы `product_property`
--

DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_value_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_property`
--

INSERT IGNORE INTO `product_property` (`id`, `property_value_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(2, 9, 2, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(3, 4, 3, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(4, 3, 4, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(5, 4, 5, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(6, 6, 6, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(7, 7, 7, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(8, 4, 8, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(9, 12, 9, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(10, 10, 10, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(11, 11, 11, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(12, 4, 12, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(13, 7, 13, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(15, 6, 15, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(16, 11, 16, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(17, 7, 17, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(18, 4, 18, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(19, 8, 19, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(20, 12, 20, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(21, 11, 21, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(22, 3, 22, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(23, 7, 23, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(24, 12, 24, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(25, 2, 25, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(26, 11, 26, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(27, 1, 27, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(28, 10, 28, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(29, 6, 29, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(30, 2, 30, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(31, 9, 31, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(32, 10, 32, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(33, 8, 33, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(34, 9, 34, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(35, 6, 35, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(36, 8, 36, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(37, 12, 37, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(38, 8, 38, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(39, 3, 39, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(40, 4, 40, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(41, 5, 41, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(42, 8, 42, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(43, 7, 43, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(44, 10, 44, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(46, 2, 46, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(47, 12, 47, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(48, 10, 48, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(49, 2, 49, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(50, 1, 50, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(51, 10, 51, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(52, 11, 52, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(53, 10, 53, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(54, 1, 54, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(55, 6, 55, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(56, 11, 56, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(57, 12, 57, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(58, 7, 58, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(59, 4, 59, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(60, 10, 60, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(61, 5, 61, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(62, 5, 62, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(63, 11, 63, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(64, 2, 64, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(65, 7, 65, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(66, 9, 66, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(67, 3, 67, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(68, 7, 68, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(69, 4, 69, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(70, 10, 70, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(71, 6, 71, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(72, 11, 72, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(73, 12, 73, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(74, 5, 74, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(75, 4, 75, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(76, 12, 76, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(77, 5, 77, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(78, 11, 78, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(79, 5, 79, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(80, 4, 80, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(81, 2, 81, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(82, 7, 82, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(83, 8, 83, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(84, 8, 84, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(85, 5, 85, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(86, 3, 86, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(87, 8, 87, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(88, 12, 88, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(89, 7, 89, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(90, 3, 90, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(91, 2, 91, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(92, 4, 92, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(93, 8, 93, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(94, 7, 94, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(95, 12, 95, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(96, 7, 96, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(97, 2, 97, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(98, 3, 98, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(99, 5, 99, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(100, 13, 1, '2020-05-25 15:41:34', '2020-05-25 15:41:34'),
(101, 15, 45, '2020-06-13 06:53:54', '2020-06-13 06:53:54'),
(102, 16, 14, '2020-06-13 17:45:50', '2020-06-13 17:45:50');

-- --------------------------------------------------------

--
-- Структура таблицы `properties`
--

DROP TABLE IF EXISTS `properties`;
CREATE TABLE `properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prop_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('number','selector') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'number'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `properties`
--

INSERT IGNORE INTO `properties` (`id`, `name`, `prop_group_id`, `created_at`, `updated_at`, `priority`, `type`) VALUES
(1, 'Виробник', NULL, '2020-05-25 11:55:13', '2020-05-25 11:55:13', '0', 'selector'),
(2, 'Вага', NULL, '2020-05-25 11:55:13', '2020-05-25 11:55:13', '1', 'number');

-- --------------------------------------------------------

--
-- Структура таблицы `property_values`
--

DROP TABLE IF EXISTS `property_values`;
CREATE TABLE `property_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `property_values`
--

INSERT IGNORE INTO `property_values` (`id`, `property_id`, `value`, `unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Atem', NULL, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(2, 1, 'BAXI', NULL, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(3, 1, 'Bosch', NULL, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(4, 1, 'Immergas', NULL, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(5, 1, 'Tenko', NULL, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(6, 1, 'Westen', NULL, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(7, 2, '1', 1, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(8, 2, '5', 1, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(9, 2, '10', 1, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(10, 2, '20', 1, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(11, 2, '50', 1, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(12, 2, '99.5', 1, '2020-05-25 11:55:14', '2020-05-25 11:55:14'),
(13, 2, '12', NULL, '2020-05-25 15:41:34', '2020-05-25 15:41:34'),
(15, 1, '1', NULL, '2020-06-13 06:53:54', '2020-06-13 06:53:54'),
(16, 1, '6', NULL, '2020-06-13 17:45:50', '2020-06-13 17:45:50');

-- --------------------------------------------------------

--
-- Структура таблицы `related_products`
--

DROP TABLE IF EXISTS `related_products`;
CREATE TABLE `related_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL,
  `impressions` int(11) NOT NULL,
  `choices` int(11) NOT NULL,
  `deleting` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `related_products`
--

INSERT IGNORE INTO `related_products` (`id`, `points`, `impressions`, `choices`, `deleting`, `created_at`, `updated_at`) VALUES
(1, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(2, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(3, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(4, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(5, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(6, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(7, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(8, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(9, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(10, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(11, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(12, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(13, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(14, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(15, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(16, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(17, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(18, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(19, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(20, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(21, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(22, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(23, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(24, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(25, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(26, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(27, 999, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 17:31:55'),
(28, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(29, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(30, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(31, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(32, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(33, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(34, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(35, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(36, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(37, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(38, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(39, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(40, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(41, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(42, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(43, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(44, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(45, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(46, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(47, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(48, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(49, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(50, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(51, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(52, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(53, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(54, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(55, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(56, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(57, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(58, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(59, 998, 0, 0, 0, '2020-05-25 11:55:12', '2020-06-13 20:02:44'),
(60, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(61, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(62, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(63, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(64, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(65, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(66, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(67, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(68, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(69, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(70, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(71, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(72, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(73, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(74, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(75, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(76, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(77, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(78, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(79, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(80, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(81, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(82, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(83, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(84, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(85, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(86, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(87, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(88, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(89, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(90, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(91, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(92, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(93, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(94, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(95, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(96, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(97, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(98, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(99, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(100, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(101, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(102, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(103, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(104, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(105, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(106, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(107, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(108, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(109, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(110, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(111, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(112, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(113, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(114, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(115, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(116, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(117, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(118, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(119, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(120, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(121, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(122, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(123, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(124, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(125, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(126, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(127, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(128, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(129, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(130, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(131, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(132, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(133, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(134, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(135, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(136, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(137, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(138, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(139, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(140, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(141, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(142, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(143, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(144, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(145, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(146, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(147, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(148, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(149, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(150, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(151, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(152, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(153, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(154, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(155, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(156, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(157, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(158, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(159, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(160, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(161, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(162, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(163, 998, 0, 0, 0, '2020-05-25 11:55:12', '2020-06-13 20:03:08'),
(164, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(165, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(166, 998, 0, 0, 0, '2020-05-25 11:55:12', '2020-06-13 20:04:21'),
(167, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(168, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(169, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(170, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(171, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(172, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(173, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(174, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(175, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(176, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(177, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(178, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(179, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(180, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(181, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(182, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(183, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(184, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(185, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(186, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(187, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(188, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(189, 998, 0, 0, 0, '2020-05-25 11:55:12', '2020-06-13 19:19:50'),
(190, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(191, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(192, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(193, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(194, 999, 0, 0, 0, '2020-05-25 11:55:12', '2020-06-13 19:50:11'),
(195, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(196, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(197, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(198, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(199, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12'),
(200, 1000, 0, 0, 0, '2020-05-25 11:55:12', '2020-05-25 11:55:12');

-- --------------------------------------------------------

--
-- Структура таблицы `shipping_methods`
--

DROP TABLE IF EXISTS `shipping_methods`;
CREATE TABLE `shipping_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `class_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `shipping_methods`
--

INSERT IGNORE INTO `shipping_methods` (`id`, `class_name`, `priority`, `enable`, `created_at`, `updated_at`) VALUES
(1, 'FreeShippingMethod', 1, 1, '2020-05-25 11:55:15', '2020-06-13 19:52:41'),
(2, 'FixRateShippingMethod', 0, 1, '2020-05-25 11:55:15', '2020-05-27 09:17:53');

-- --------------------------------------------------------

--
-- Структура таблицы `supply`
--

DROP TABLE IF EXISTS `supply`;
CREATE TABLE `supply` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `general_price` double(8,2) NOT NULL DEFAULT '0.00',
  `status_id` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `supply`
--

INSERT IGNORE INTO `supply` (`id`, `date`, `property_id`, `user_id`, `general_price`, `status_id`, `created_at`, `updated_at`) VALUES
(1, '2020-05-06', 1, 1, 2876.51, 1, '2020-06-13 06:51:44', '2020-06-13 11:47:26'),
(2, '2020-06-02', 4, 1, 5376.76, 0, '2020-06-13 18:22:18', '2020-06-13 18:22:18');

-- --------------------------------------------------------

--
-- Структура таблицы `supply_products`
--

DROP TABLE IF EXISTS `supply_products`;
CREATE TABLE `supply_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supply_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `count` bigint(20) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `supply_products`
--

INSERT IGNORE INTO `supply_products` (`id`, `supply_id`, `product_id`, `count`, `created_at`, `updated_at`) VALUES
(1, 1, 45, 1, '2020-06-13 06:51:44', '2020-06-13 06:51:44'),
(2, 1, 54, 5, '2020-06-13 06:51:44', '2020-06-13 06:51:44'),
(3, 2, 5, 2, '2020-06-13 18:22:18', '2020-06-13 18:22:18'),
(4, 2, 80, 3, '2020-06-13 18:22:18', '2020-06-13 18:22:18'),
(5, 2, 12, 4, '2020-06-13 18:22:18', '2020-06-13 18:22:18'),
(6, 2, 69, 1, '2020-06-13 18:22:18', '2020-06-13 18:22:18');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci,
  `force_logout` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT IGNORE INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `cart`, `force_logout`) VALUES
(1, 'raisa', 'raisa@gmail.com', '$2y$10$gY6Bs2zqojmvci49RD2rI.O5GLWhdEm55a0w.aFbmZx.5NiAzcAI2', NULL, '2020-05-25 14:47:44', '2020-06-12 11:05:44', '', 0),
(2, 't7cup2', 'rai2sa@gmail.com', '$2y$10$gY6Bs2zqojmvci49RD2rI.O5GLWhdEm55a0w.aFbmZx.5NiAzcAI2', NULL, '2020-05-25 17:15:54', '2020-06-13 19:19:49', '', 0),
(3, 'Raisa Ostapenko', 'radraf161@gmail.com', '$2y$10$vuJXUYrwg8hJlza4.0dbeeod.2EL1LQqtvyR33pfvY58CuDpiRQ6u', NULL, '2020-06-12 10:16:31', '2020-06-12 10:58:54', 'a:7:{s:5:\"total\";d:5355.79;s:16:\"shippingMethodId\";i:1;i:3;a:2:{s:10:\"productQty\";i:1;s:16:\"isRelatedProduct\";i:0;}i:6;a:2:{s:10:\"productQty\";s:1:\"3\";s:16:\"isRelatedProduct\";i:0;}i:5;a:2:{s:10:\"productQty\";s:1:\"3\";s:16:\"isRelatedProduct\";i:0;}i:60;a:2:{s:10:\"productQty\";i:1;s:16:\"isRelatedProduct\";i:1;}i:12;a:2:{s:10:\"productQty\";s:1:\"3\";s:16:\"isRelatedProduct\";i:1;}}', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Индексы таблицы `catalogs`
--
ALTER TABLE `catalogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catalogs_name_unique` (`name`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_data`
--
ALTER TABLE `order_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products_related_products`
--
ALTER TABLE `products_related_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_property`
--
ALTER TABLE `product_property`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `property_values`
--
ALTER TABLE `property_values`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `related_products`
--
ALTER TABLE `related_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `supply_products`
--
ALTER TABLE `supply_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `catalogs`
--
ALTER TABLE `catalogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `order_data`
--
ALTER TABLE `order_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT для таблицы `products_related_products`
--
ALTER TABLE `products_related_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=996;
--
-- AUTO_INCREMENT для таблицы `product_property`
--
ALTER TABLE `product_property`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT для таблицы `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `property_values`
--
ALTER TABLE `property_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `related_products`
--
ALTER TABLE `related_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT для таблицы `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `supply`
--
ALTER TABLE `supply`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `supply_products`
--
ALTER TABLE `supply_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
