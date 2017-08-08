-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 08, 2017 lúc 08:44 AM
-- Phiên bản máy phục vụ: 10.1.22-MariaDB
-- Phiên bản PHP: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `challenge08`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`id`, `teacher_id`, `name`, `description`, `created_at`) VALUES
(1, 8, 'Highway Patrol Pilot', 'Repellat id nobis blanditiis ut voluptas illum aut velit. Mollitia et sunt ea.', '2017-10-02 00:35:05'),
(2, 1, 'Molding Machine Operator', 'Explicabo porro eius deserunt quis. Quis alias quaerat expedita modi nobis et qui.', '2017-08-08 14:24:40'),
(3, 1, 'Plumber', 'Id distinctio placeat ipsam repudiandae ex magni. Blanditiis accusantium accusantium nulla.', '2017-10-06 14:27:12'),
(4, 3, 'Textile Knitting Machine Operator', 'Ut error impedit occaecati ipsum enim. Et soluta quos corrupti.', '2017-09-19 00:42:39'),
(5, 9, 'Millwright', 'Ducimus ab inventore eum illo ratione in. Veritatis aut rerum distinctio.', '2017-08-04 04:51:43'),
(6, 6, 'Transportation Inspector', 'Quis voluptatem sed et quaerat cum eos vel. Est saepe temporibus voluptas nihil velit aut.', '2017-09-18 06:00:07'),
(7, 10, 'Dietetic Technician', 'Ea hic rem et beatae dolor. Autem ab nostrum cum doloremque. Esse quas est est qui.', '2017-08-08 10:40:45'),
(8, 8, 'Chemistry Teacher', 'Maxime beatae dolorem tenetur cupiditate aut. Vero tempore aliquid id id est dolor cum.', '2017-08-24 01:35:20'),
(9, 9, 'Coaches and Scout', 'Beatae quibusdam illum omnis ea vel maxime. Dolore velit ad voluptatibus officia animi.', '2017-10-10 13:49:24'),
(10, 6, 'Gas Pumping Station Operator', 'Hic corporis ducimus dignissimos aut. Ut pariatur nam laudantium.', '2017-10-14 08:26:56'),
(11, 8, 'Textile Machine Operator', 'Aut non nemo id aut ipsam. Vero voluptas harum hic fugit. Optio necessitatibus molestiae quod.', '2017-08-29 09:51:13'),
(12, 9, 'Auditor', 'Praesentium est commodi tenetur. Voluptatem possimus recusandae quae aperiam.', '2017-09-29 11:59:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `homeworks`
--

CREATE TABLE `homeworks` (
  `id` int(11) NOT NULL,
  `homework` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `flag` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `homeworks`
--

INSERT INTO `homeworks` (`id`, `homework`, `class_id`, `created_at`, `flag`) VALUES
(1, '{\"title\":\"Challenge 1.pdf\",\"path\":\"1501754356.pdf\"}', 1, '2017-08-02 21:08:16', 1),
(2, '{\"title\":\"Challenge 1501755715\",\"hint\":\"T\\u00ecnh chi\\u1ebfn s\\u0129 ngo\\u00e0i bi\\u00ean gi\\u1edbi Vi\\u1ec7t B\\u1eafc\",\"path\":\"dong_chi.txt\"}', 1, '2017-08-02 22:08:55', 2),
(3, '{\"title\":\"Challenge 2.pdf\",\"path\":\"1502155353.pdf\"}', 1, '2017-08-08 01:08:33', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `members`
--

CREATE TABLE `members` (
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT '30',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `members`
--

INSERT INTO `members` (`student_id`, `class_id`, `accepted`, `created_at`) VALUES
(13, 1, 1, '2017-08-07 18:08:09'),
(13, 2, 0, '2017-08-04 03:08:16'),
(13, 3, 0, '2017-08-04 03:08:37'),
(13, 4, 0, '2017-08-04 03:08:13'),
(13, 12, 0, '2017-08-07 18:08:51'),
(15, 10, 1, '2017-10-06 10:04:53'),
(18, 1, 1, '2017-09-25 07:30:12'),
(20, 1, 0, '2017-10-12 01:01:04'),
(20, 11, 0, '2017-09-07 10:36:40'),
(23, 8, 0, '2017-09-13 16:23:17'),
(24, 9, 1, '2017-08-15 00:26:14'),
(24, 12, 0, '2017-08-28 12:25:43'),
(35, 11, 0, '2017-09-25 02:01:24'),
(43, 3, 1, '2017-09-22 08:40:20'),
(44, 5, 0, '2017-10-18 18:51:44'),
(44, 11, 0, '2017-09-08 22:43:52'),
(51, 4, 1, '2017-08-26 16:09:43'),
(58, 2, 0, '2017-10-06 23:29:00'),
(66, 7, 0, '2017-10-16 01:37:48'),
(70, 2, 1, '2017-08-05 12:11:44'),
(71, 10, 1, '2017-09-29 23:34:02'),
(72, 1, 0, '2017-08-07 18:08:47'),
(72, 2, 0, '2017-09-27 21:34:25'),
(74, 6, 1, '2017-09-18 08:35:23'),
(75, 9, 1, '2017-09-16 02:41:45'),
(76, 6, 0, '2017-08-22 13:05:20'),
(78, 3, 1, '2017-08-28 12:12:36'),
(81, 6, 1, '2017-10-18 19:28:49'),
(81, 8, 1, '2017-09-02 15:17:59'),
(85, 10, 0, '2017-09-09 10:48:03'),
(85, 12, 0, '2017-10-03 09:13:30'),
(86, 11, 1, '2017-08-03 09:13:18'),
(87, 5, 0, '2017-08-03 16:33:45'),
(90, 1, 1, '2017-10-18 21:17:09'),
(90, 4, 1, '2017-09-21 15:22:50'),
(90, 9, 0, '2017-08-18 08:42:30'),
(94, 6, 1, '2017-09-26 04:12:07'),
(97, 5, 1, '2017-09-21 10:52:51'),
(100, 12, 0, '2017-08-24 09:35:07'),
(102, 6, 0, '2017-10-04 16:59:25'),
(104, 4, 0, '2017-09-21 11:16:28'),
(106, 6, 0, '2017-09-26 10:42:31'),
(115, 9, 1, '2017-08-05 23:56:59'),
(117, 11, 1, '2017-09-28 13:06:41'),
(118, 11, 0, '2017-09-14 09:46:43'),
(121, 9, 1, '2017-10-04 11:44:02'),
(124, 4, 0, '2017-10-09 10:06:33'),
(124, 9, 1, '2017-10-17 04:27:04'),
(127, 2, 0, '2017-09-18 13:51:40'),
(128, 5, 1, '2017-08-26 00:36:24'),
(130, 11, 0, '2017-10-18 05:00:35'),
(131, 3, 1, '2017-10-14 15:49:44'),
(132, 9, 0, '2017-09-26 03:37:02'),
(134, 4, 0, '2017-08-22 08:32:01'),
(135, 6, 1, '2017-09-08 14:22:42'),
(136, 11, 1, '2017-09-01 01:07:17'),
(144, 12, 0, '2017-08-31 10:49:56'),
(146, 5, 1, '2017-09-26 09:44:50'),
(146, 6, 1, '2017-10-16 16:52:42'),
(148, 7, 1, '2017-09-05 07:05:31'),
(149, 10, 0, '2017-10-18 17:01:21'),
(149, 11, 1, '2017-08-05 23:41:02'),
(150, 2, 1, '2017-09-30 11:57:12'),
(153, 3, 0, '2017-09-16 17:15:45'),
(155, 4, 0, '2017-08-10 21:54:55'),
(155, 8, 0, '2017-10-07 03:45:10'),
(155, 10, 1, '2017-08-27 13:18:14'),
(156, 4, 0, '2017-09-13 09:27:10'),
(157, 5, 1, '2017-09-13 08:20:10'),
(161, 2, 1, '2017-10-09 17:36:17'),
(162, 9, 0, '2017-10-18 10:41:05'),
(166, 10, 1, '2017-10-02 01:30:20'),
(169, 5, 0, '2017-08-25 03:18:42'),
(176, 8, 1, '2017-09-04 21:07:09'),
(178, 5, 1, '2017-09-15 20:01:57'),
(179, 5, 1, '2017-09-02 09:37:37'),
(183, 2, 1, '2017-10-11 08:23:37'),
(183, 9, 0, '2017-10-07 21:45:26'),
(183, 12, 0, '2017-09-12 04:56:04'),
(184, 8, 0, '2017-09-12 17:56:23'),
(185, 4, 1, '2017-08-19 13:16:11'),
(188, 3, 1, '2017-08-13 16:45:16'),
(190, 12, 0, '2017-10-07 00:14:29'),
(192, 2, 0, '2017-09-23 20:53:54'),
(193, 11, 1, '2017-09-28 13:52:04'),
(196, 6, 0, '2017-08-12 14:31:32'),
(196, 8, 1, '2017-09-23 12:24:00'),
(199, 6, 0, '2017-09-25 04:47:00'),
(201, 9, 1, '2017-10-03 21:48:16'),
(202, 10, 0, '2017-09-12 22:54:09'),
(203, 12, 1, '2017-10-18 01:19:49'),
(204, 1, 0, '2017-10-07 03:48:04'),
(208, 1, 1, '2017-08-17 09:55:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` mediumtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `created_at`) VALUES
(1, 8, 13, 'hi', '2017-08-03 19:08:20'),
(2, 8, 13, 'abc', '2017-08-03 19:08:27'),
(3, 8, 13, 'abc', '2017-08-03 19:08:57'),
(4, 8, 13, 'abc', '2017-08-03 19:08:05'),
(5, 8, 13, 'a', '2017-08-03 19:08:01'),
(6, 8, 13, 'a', '2017-08-03 19:08:40'),
(7, 8, 13, 'a', '2017-08-03 19:08:18'),
(8, 8, 13, 'abc2113', '2017-08-03 19:08:33'),
(9, 8, 13, 'abc2113', '2017-08-03 19:08:38'),
(10, 8, 13, 'abc2113', '2017-08-03 19:08:56'),
(11, 8, 13, '213', '2017-08-03 19:08:12'),
(12, 8, 13, '213', '2017-08-03 19:08:22'),
(13, 8, 13, '3', '2017-08-03 19:08:29'),
(14, 8, 13, '323432', '2017-08-03 19:08:32'),
(15, 8, 13, '323432', '2017-08-03 19:08:36'),
(16, 8, 13, '323432sfd', '2017-08-03 19:08:39'),
(17, 8, 13, 'adf', '2017-08-03 19:08:20'),
(18, 8, 13, 'adf24213', '2017-08-03 19:08:25'),
(19, 8, 13, NULL, '2017-08-03 19:08:34'),
(20, 8, 13, 'safsd', '2017-08-03 19:08:53'),
(21, 8, 13, 's213', '2017-08-03 19:08:25'),
(22, 8, 13, 's21333', '2017-08-03 19:08:27'),
(23, 8, 13, '123', '2017-08-03 19:08:37'),
(24, 8, 13, 'safd', '2017-08-03 19:08:44'),
(25, 8, 13, 'ádf', '2017-08-03 19:08:50'),
(26, 8, 13, '125', '2017-08-03 19:08:54'),
(27, 8, 8, 'hi 55', '2017-08-03 20:08:32'),
(28, 13, 15, 'hi', '2017-08-08 00:08:15'),
(29, 13, 15, 'hi 123', '2017-08-08 00:08:20'),
(30, 13, 15, 'hi 123\n2', '2017-08-08 00:08:33'),
(31, 13, 15, 'hi 123\n2', '2017-08-08 00:08:34'),
(32, 13, 15, 'hi 12322\n2', '2017-08-08 00:08:34'),
(33, 8, 5, 'hi', '2017-08-08 01:08:33'),
(34, 8, 5, '3', '2017-08-08 01:08:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `submit_homeworks`
--

CREATE TABLE `submit_homeworks` (
  `student_id` int(11) NOT NULL,
  `homework_id` int(11) NOT NULL,
  `data` varchar(512) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `submit_homeworks`
--

INSERT INTO `submit_homeworks` (`student_id`, `homework_id`, `data`, `flag`, `created_at`) VALUES
(13, 1, '{\"title\":\"CongViecTuan26-06.xlsx\",\"path\":\"1502174467.xlsx\"}', 1, '2017-08-07 18:08:07'),
(18, 1, '{\"title\":\"Danh_gia_Sinh_vien_VPMN_Thang_6-2017.xlsx\",\"path\":\"1502155858.xlsx\"}', 1, '2017-08-08 01:08:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(512) NOT NULL,
  `role` tinyint(1) DEFAULT '1',
  `phone_number` varchar(64) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remember_token` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `role`, `phone_number`, `created_at`, `remember_token`) VALUES
(1, 'nienow.liana@hotmail.com', 'Ivory', '$2y$10$bqEpnXc3z/UvP50ZZleDDeUi6437YZQmenyQr7kScUPMr/fpi5/Yi', 2, '+1-290-527-6743', '2017-08-19 00:45:06', NULL),
(2, 'egrant@hotmail.com', 'Lorenz', '$2y$10$J/EoMzd4LnZHnuSK5bA/a.ai.QOaAkY8zMxF.p69oQMKjkU2N6CRm', 2, '+1-290-527-6743', '2017-09-21 06:00:00', NULL),
(3, 'melany09@crona.com', 'Kurtis', '$2y$10$jrtRZrgeHaEOL28RJDNxt.4gLONQeMVVY5mu/r4ObCI.Zoi4k0o9q', 2, '+1-290-527-6743', '2017-09-20 23:16:24', NULL),
(4, 'oren58@hoppe.net', 'Greyson', '$2y$10$xsN917umm88j2Ce4y/hjo.icjd2fmmxursysNH1aLaoZBynbDVF2O', 2, '+1-290-527-6743', '2017-09-29 19:55:56', NULL),
(5, 'switting@okon.com', 'Claudine', '$2y$10$5xJvdl1mdlKhlDK8n92o2eDCXKE9YoOCTITMortAEIeoJ7c2cwhQq', 2, '+1-290-527-6743', '2017-10-08 12:59:19', NULL),
(6, 'rachelle.bradtke@yahoo.com', 'Joseph', '$2y$10$5jJUiEu6hpd33oIVYTFkD.rJWhoFeLYjl8qDZBKSVWSJrGln0sGlS', 2, '+1-290-527-6743', '2017-08-25 21:25:12', NULL),
(7, 'jayne99@hamill.info', 'Alexander', '$2y$10$Qq6NCQiuox548V.NBdi4nuhPDN2aSph68lx620RICY7oQ8RRUcGnS', 2, '+1-290-527-6743', '2017-08-19 03:25:13', NULL),
(8, 'walsh.afton@yahoo.com', 'Talia', '$2y$10$Cwro3PVNOxn34jARtOTP0O54ZlRWesK2Bfz.zt.rLDB/iKvW4P8YK', 2, '+1-290-527-6745', '2017-09-13 00:11:22', NULL),
(9, 'meagan.champlin@price.com', 'Sidney', '$2y$10$v/asTmQUOslvQXurl2x1n.YuOx5v6pHaLHni26EfmdAnQSK51oRgm', 2, '+1-290-527-6743', '2017-09-30 13:05:09', NULL),
(10, 'sarai.walker@hotmail.com', 'Edmund', '$2y$10$iwSu6ehVbGQaU69mfAPZBe4BwNdak6mSppBv3PDvgdvdvOl9dB1.C', 2, '+1-290-527-6743', '2017-09-08 14:38:54', NULL),
(11, 'ward.einar@hotmail.com', 'Sherman', '$2y$10$2gbOpAqsfwwyAUDoIX3oFuT22RcgqfrJPYRaCL0zSnJ0GopPv57Hu', 2, '+1-290-527-6743', '2017-08-11 11:57:27', NULL),
(12, 'sid48@gmail.com', 'Ora', '$2y$10$RVes4/dPPwaRq6MTxRL91eE7E6JaFoJmQdhZ2ykfl1SFe5XCUmCvy', 2, '+1-290-527-6743', '2017-08-17 19:06:35', NULL),
(13, 'ansley65@gmail.com', 'Florencio Shanahan Jr.', '$2y$10$AL3fCTxiWpe51HMSfiRPje2AxRbCCFy3wFMXJ7RGaSPLf5hpFBIH.', 1, '+1-290-527-9999', '2017-08-26 19:31:33', 'v0JTpbqBw1eyJkOdE2v6L6Xdiw6nncEWzdzDmGg3aOcervY31zpoEY9CR1Tc'),
(14, 'reinger.izaiah@yahoo.com', 'Delphia Lebsack', '$2y$10$ZUHefDKNxnNc1qKy/q./O.Bocl6aNoIKjyLaukB25Bf3.qBEmFUEW', 1, '+1-290-527-6743', '2017-09-21 17:42:15', NULL),
(15, 'vwehner@schowalter.com', 'Dr. Archibald Ruecker PhD', '$2y$10$HJi8MwqVBm9hOj/e/TqMP.aSGTpCpPIvUUAO07B735SB1pSs7HTze', 1, '+1-290-527-6743', '2017-09-12 19:00:44', NULL),
(16, 'ondricka.anais@lubowitz.com', 'Allen Treutel', '$2y$10$fueUnM1I8YbxeJwtZu9Xae/oReUTc04hTjsiknc9F9h4BGGgxrcqu', 1, '+1-290-527-6743', '2017-10-04 01:23:07', NULL),
(17, 'hemmerich@gmail.com', 'Laurine Stanton', '$2y$10$A.BN3HJCle14YrfZyvcguuH4L37VHoUa9WGFMMcoiAZZN8clfW4si', 1, '+1-290-527-6743', '2017-08-08 14:56:03', NULL),
(18, 'kihn.eula@yahoo.com', 'Josefa VonRueden', '$2y$10$vx0LY8dvhzthsM/KuBOfje8MTsDLF3mhUcIbwP/F17/1hqa7svsZC', 1, '+1-290-527-6743', '2017-09-04 04:57:55', '7ZDWf3U6I9QdZw9F59SZSqWxniVlgv2wQfkbQ8ggx4wnj9Xa151hOSp6Japb'),
(19, 'wisozk.meaghan@lueilwitz.com', 'Justine Tromp DVM', '$2y$10$0x9749XX6NtmSt1TBTmSs.yWZ1WWArTGBPe6e2pCw83k0ORo/pb2q', 1, '+1-290-527-6743', '2017-09-07 05:01:15', NULL),
(20, 'bwaters@moore.com', 'Miss Miracle Lang', '$2y$10$FIpKEg0Cgh7lI6kohaC/Fe6kijIHrlZPL.iIfZjAyB.LQ1J2uwrQm', 1, '+1-290-527-6743', '2017-10-19 08:23:41', NULL),
(21, 'sbogan@hotmail.com', 'Derek Kovacek', '$2y$10$W0jOxWTj4aojtb6.7EkFueh7rXkpmStTyvmV94amrJ9d6CCvgt16G', 1, '+1-290-527-6743', '2017-09-30 23:43:20', NULL),
(22, 'zturner@yahoo.com', 'Alexis Fisher Jr.', '$2y$10$oerZBRuvao4Wu5mvd6v3b.BW5lpwnNgb1giMu6AcgxsziNILgXHy.', 1, '+1-290-527-6743', '2017-08-12 00:47:19', NULL),
(23, 'burdette.kuhic@ebert.biz', 'Dr. Colin Willms III', '$2y$10$r64CioBChnmx9YUpPbDXa.XC4diw/XN4Fs0724KEfB9RDVDw/BozS', 1, '+1-290-527-6743', '2017-08-30 14:43:28', NULL),
(24, 'rhermiston@yahoo.com', 'Mrs. Shaniya Swift', '$2y$10$FIc5SzMS.UlGa3CKZuI2bOX1Jh4EzvSmJmtM5MlDxYYdJm.Q943W2', 1, '+1-290-527-6743', '2017-09-11 20:53:43', NULL),
(25, 'keegan.keebler@oconner.com', 'Miss Kasey Ryan', '$2y$10$muHCW8Z8c67jSmLk7P0.lu7mFcTp7NpYbgVLNKX/odvJD7L/rRpm2', 1, '+1-290-527-6743', '2017-08-03 16:57:12', NULL),
(26, 'lebert@johns.com', 'Evan Schuster', '$2y$10$SkBRiObQWK7Cyg1HgzpdZ.CedcvL0e2GiWj2JdY65yiqFLZjUy7kW', 1, '+1-290-527-6743', '2017-08-14 14:00:44', NULL),
(27, 'myrl96@hotmail.com', 'Jed Gottlieb', '$2y$10$iAPw2YW0.gp7MwIQDoIHaeVn9OMweyOq6iARiRdcW6dqmhMz8xfv.', 1, '+1-290-527-6743', '2017-08-17 23:40:10', NULL),
(28, 'thane@hegmann.com', 'Ms. Lavina Roberts', '$2y$10$q4CVg7cHIKjBJlZL2sljZ.s.5hgZTN7XLwAq0TQ4FP4SWUIkDfHYS', 1, '+1-290-527-6743', '2017-10-16 15:05:10', NULL),
(29, 'demarco30@pagac.com', 'Mervin Turcotte MD', '$2y$10$DrCACvT9GpfoMNnrCRcKV..osqgB354EoXald2N9rHBh0/bCF5mxS', 1, '+1-290-527-6743', '2017-08-05 16:54:11', NULL),
(30, 'oullrich@goodwin.com', 'Alena Volkman', '$2y$10$7W9DEyx4.0D5FqqymsQfEeetneGs2bQ8B0zf01m5XWfazjs6wsF6m', 1, '+1-290-527-6743', '2017-08-25 13:02:02', NULL),
(31, 'tania.block@hotmail.com', 'Vella Upton', '$2y$10$8aAJ9TV/ELqbSpNVjh0tSOHB6hxxQwvLBd17M673jJbIV4bMUuPJy', 1, '+1-290-527-6743', '2017-08-28 20:22:40', NULL),
(32, 'turcotte.kaitlin@ernser.com', 'Michaela Thompson', '$2y$10$jmu1xKPnKgaN53ftZwrtOOhSrE9GucrlCbcILZ795ATevaVYAtS8O', 1, '+1-290-527-6743', '2017-09-16 17:36:15', NULL),
(33, 'adell17@gmail.com', 'Tamia Sanford', '$2y$10$orVqLC7AfFGljkvAMKg98ekz75fLHC5sr9nioh8245WLB05LIxEdG', 1, '+1-290-527-6743', '2017-10-09 13:14:30', NULL),
(34, 'ankunding.maryse@hotmail.com', 'Erika Turner DDS', '$2y$10$JfTSwI0RqGinewJzurJMLOfpjxF4G3i2EyjL3yOud9WEp.B03Sfz2', 1, '+1-290-527-6743', '2017-08-12 20:50:23', NULL),
(35, 'vyost@yahoo.com', 'Dr. Leone Heathcote', '$2y$10$ABd9DSISF.qqcxhE1.i1BOtwtFtwWk5FgXUpK5GGLPkgwQACbmF7a', 1, '+1-290-527-6743', '2017-10-18 06:17:52', NULL),
(36, 'qaufderhar@bergnaum.com', 'Gayle Kohler', '$2y$10$ZOlfG7E/mtSCGMDuvzJBeObZn0dRbLLs8BEk4vq6RmxOKxfgnpB2C', 1, '+1-290-527-6743', '2017-08-14 12:16:51', NULL),
(37, 'walsh.jazmyn@grady.com', 'Ms. Sarina Corwin', '$2y$10$8RNyig9HbeBeklTezUWC.OUHsfvfCBC28vU0a5de3Tmh7yJtax4rC', 1, '+1-290-527-6743', '2017-08-25 23:24:24', NULL),
(38, 'regan.kovacek@lang.biz', 'Hadley Gutkowski', '$2y$10$LWr6UKpHx8OSEbvwIzLB7O.yvSS0C0ojAjOd8S3TbVt35F5HvQ4P2', 1, '+1-290-527-6743', '2017-09-05 21:55:01', NULL),
(39, 'vern.cummerata@herzog.com', 'River Bernhard Sr.', '$2y$10$JgSRXdlc8iVJfUTDnPoqP.SPD/0RBnj.xI5u6bQoBdLmTeJukaTCm', 1, '+1-290-527-6743', '2017-08-27 11:12:17', NULL),
(40, 'olesch@gmail.com', 'Megane Feest', '$2y$10$Ab1z4J.OdYwaFXnz4T/EPetbM..T8yUv..sXcp353pRhx/Bj.Ek2i', 1, '+1-290-527-6743', '2017-08-09 09:48:15', NULL),
(41, 'lreilly@emmerich.com', 'Mrs. Bulah Funk', '$2y$10$CQafwRfmPNGM.gC6GHsiJ.8blb4YK9LoeE6S4hUTRS18p0TFbviOa', 1, '+1-290-527-6743', '2017-10-11 09:46:36', NULL),
(42, 'schoen.lois@hotmail.com', 'Marlon Rowe Sr.', '$2y$10$ko9jDfJ/VptP1LGqQskBd.lJc9DvU6VpGj7pZz30DdSWZHr267B1C', 1, '+1-290-527-6743', '2017-09-12 05:14:08', NULL),
(43, 'wlittle@harris.com', 'Andreanne Kertzmann PhD', '$2y$10$APJhZf5.JYeKlcGJpa8eWOAtmcMXAnbg2ZzAk1iIEoO5ff.qxUJU2', 1, '+1-290-527-6743', '2017-08-03 03:57:33', NULL),
(44, 'wwatsica@gmail.com', 'Nelda Bergnaum', '$2y$10$9ckRtxMJVbGodhQLBMgYzOoT/BVL7GnBnBw/bNIfoNZLz/f8lBoKm', 1, '+1-290-527-6743', '2017-09-23 15:16:01', NULL),
(45, 'sim.monahan@prohaska.biz', 'Emery Cassin', '$2y$10$lBPb0T3jh3CLBF1cJ1CBwO0d/Rt8BTT0VD8kwjUH1NSwwv7Ln09V.', 1, '+1-290-527-6743', '2017-09-18 16:37:46', NULL),
(46, 'hope59@yahoo.com', 'Prof. Cecilia Kilback', '$2y$10$6dd5j964fCePt7N3MozFEezCj8C2h1HBwiPrWma9uJG8gnALZHO72', 1, '+1-290-527-6743', '2017-09-17 16:16:39', NULL),
(47, 'pkoelpin@luettgen.com', 'Mrs. Jennifer Watsica', '$2y$10$vTDLxgrkU39bcVZHrXp02ej.Rs5zBM.2Gj2k3ZdBIwGRUvxa969lS', 1, '+1-290-527-6743', '2017-08-13 11:00:09', NULL),
(48, 'marie.osinski@hotmail.com', 'Dashawn Cummings', '$2y$10$ZzwgtM2eyhzlmN9OpOok/.n3JaKhx3GNh6oCvkf.A4/hySNSE8pdK', 1, '+1-290-527-6743', '2017-10-15 11:51:23', NULL),
(49, 'okon.jackie@gmail.com', 'Tanner Muller Jr.', '$2y$10$sN5aEfU9SgqntP8cHjOBzuHvJV3ySYbOC3jWkY6Pr.9IooNsB8H5G', 1, '+1-290-527-6743', '2017-10-12 14:35:36', NULL),
(50, 'cgutmann@yahoo.com', 'Nikolas Nitzsche', '$2y$10$efSi1OAL4gIMpGWZUjy1YO9jMGrfYa32x6OWR3hcF6TSC2lnGHhHG', 1, '+1-290-527-6743', '2017-08-13 13:25:50', NULL),
(51, 'preston77@yahoo.com', 'Miss Kaylie Bosco DVM', '$2y$10$Xq2hfAmc8KVT.K5vot7n6.twZb.yxn8nve.xnqJ2gDtZTcS5/19rm', 1, '+1-290-527-6743', '2017-10-03 06:31:47', NULL),
(52, 'spencer.josefina@treutel.com', 'Michael Reichel Jr.', '$2y$10$BEXgV/R4hEjcuB6cyAA9o.kL67dA1QMEuKHZlpR0uAeZSDGwSv4nq', 1, '+1-290-527-6743', '2017-08-14 12:10:26', NULL),
(53, 'koss.merle@yahoo.com', 'Rose Paucek IV', '$2y$10$EDRrk2GcGhtZeqLeU/HV/.BTcZxYVedkmWUYp0fzbROJJiVcAoHOS', 1, '+1-290-527-6743', '2017-08-12 07:34:35', NULL),
(54, 'bruen.aniyah@yahoo.com', 'Dandre O\'Keefe DDS', '$2y$10$u/YNjB7dSfoa/Fu3Jlk9JOfY.QuFNplMRJDgiYodqZXSrlJlVWX6u', 1, '+1-290-527-6743', '2017-08-07 23:51:35', NULL),
(55, 'aryanna.marks@gusikowski.com', 'Vito Robel', '$2y$10$94j.89l5A3SNPxry3t6Ihu1TjyVHuXrSJD.9QJmSkZ6BlVLHvFxYW', 1, '+1-290-527-6743', '2017-10-06 22:19:59', NULL),
(56, 'fschmeler@douglas.com', 'Kaylah Kessler', '$2y$10$k/FVMkx1hLypTXCiqJV0Ze3MBNv4wFX.IAyd7h2RcSDc1x9Pff6FC', 1, '+1-290-527-6743', '2017-09-25 02:10:59', NULL),
(57, 'gregorio47@kunze.com', 'Bennett Heaney', '$2y$10$gRU1epydjBPFmtxRPUs5BuPAOPBGjIGfb7VYAAVtLLo6CfCDAK5wK', 1, '+1-290-527-6743', '2017-10-18 00:59:31', NULL),
(58, 'littel.cordell@hotmail.com', 'Ms. Antonina Reilly V', '$2y$10$8uI97I7ecj2nAbi5JbChWuhUnjflh9c0MIGWfY.LbvtFfWV1gxk6S', 1, '+1-290-527-6743', '2017-08-17 00:51:16', NULL),
(59, 'deangelo.bartoletti@yahoo.com', 'Linnea Barrows', '$2y$10$chZZG28vWvR0eppWOvHDZurpgieYWyx4612b0RYqoeQfRbiO2YPCe', 1, '+1-290-527-6743', '2017-08-30 21:42:20', NULL),
(60, 'theresa.runolfsson@gmail.com', 'Bailey Boehm', '$2y$10$dfZRWO1gfDdxBeXQkMd8a.zvvffu9CL4iEF4TGwpnWeOcu2dfnD46', 1, '+1-290-527-6743', '2017-08-05 03:08:41', NULL),
(61, 'charles48@fisher.com', 'Colton Bauch', '$2y$10$JxLD41bnv.mmIsuwy4XgwuT1E9HGGkvA/lGICWOHBVd./tpgvQkxG', 1, '+1-290-527-6743', '2017-10-03 17:35:33', NULL),
(62, 'ella22@mann.com', 'Prof. Destiny Rolfson', '$2y$10$ipdUOjGjo.UoKO0j4vHay.a56E68DySZNYJ/WyamyYdXG1KQAxz2q', 1, '+1-290-527-6743', '2017-08-08 00:29:36', NULL),
(63, 'bzboncak@rippin.org', 'Evert Wiza DVM', '$2y$10$SYYwiaXFioe5FeU3PTe3jedIDxZSw5mqUJ1kDHefx69zv1JHpIRnm', 1, '+1-290-527-6743', '2017-09-12 16:32:21', NULL),
(64, 'delpha.torp@dooley.biz', 'Barbara Marvin', '$2y$10$VvExH12tsXlx9xBs0QYJWuK8oWr./dXTbTva27tqv6yyPyfGrH2KW', 1, '+1-290-527-6743', '2017-10-18 19:25:39', NULL),
(65, 'hermann10@hotmail.com', 'Carmine Mohr', '$2y$10$IphbH1SYI1FkWJXRAHx23OwNpIeRI.LY7hnJEA2CXd8HnbUy.PWdG', 1, '+1-290-527-6743', '2017-08-16 09:46:29', NULL),
(66, 'nkilback@yahoo.com', 'Dr. Wyman Simonis PhD', '$2y$10$dbjMMc/iJorf2d8XQsEscOWieZ1/XRB7GTBzI1cleqhNx1rnyoKIK', 1, '+1-290-527-6743', '2017-10-03 18:52:13', NULL),
(67, 'alford74@ward.net', 'Gordon Boyer', '$2y$10$A1SRe/h.Xp9H16IUMVlC0.jqIbR6zsuMxIL7tEY9VJsgQlIZzSIJy', 1, '+1-290-527-6743', '2017-10-01 14:42:10', NULL),
(68, 'idaugherty@dietrich.com', 'Krystel Schaefer', '$2y$10$vfQZGPq3.uwZbrmtEWUb6OO5TvuEdzb/x782gIau2vQ84s5.vwhUi', 1, '+1-290-527-6743', '2017-09-07 19:10:04', NULL),
(69, 'dickens.nelle@becker.org', 'Stephen Gleichner', '$2y$10$6EP12OPjuwNDFF4pwtRvPO4PiZKcRRNtDkYRposwK74SLntw.qEBC', 1, '+1-290-527-6743', '2017-10-16 17:53:51', NULL),
(70, 'alfreda.friesen@hotmail.com', 'Trycia Olson', '$2y$10$qQvb3P.nOgID2DQgfN7wUefxZKoW6rsMRKn4ceEN33EUTc/OGw/W2', 1, '+1-290-527-6743', '2017-09-10 21:48:46', NULL),
(71, 'kuvalis.mya@beer.net', 'Ted Konopelski', '$2y$10$RG8fQK0WD1UelvVcxaI/SOcb3h/NKxM30b64pOOS/r.eYNxcXtFXC', 1, '+1-290-527-6743', '2017-08-22 04:28:55', NULL),
(72, 'gleichner.leda@hotmail.com', 'Randall Ankunding', '$2y$10$zR5OgrKykgn1uEPu5yVbSuoG.UUVNVO3rDBDYIUEUX3KzItKOjO5O', 1, '+1-290-527-6743', '2017-08-27 21:52:07', '8JLnfrXfFPQnNvhhRwGHuYDjibGPROFxt8z9VxKlFgrVEe4Ah2qwbd2rOdCJ'),
(73, 'caterina00@hauck.com', 'Sunny Corwin', '$2y$10$H5d1vkXvmsjRtLdBjUUqguCNGRfqIeLoI2whzzoROh51pwAcPATDu', 1, '+1-290-527-6743', '2017-08-08 20:21:39', NULL),
(74, 'balistreri.korey@hotmail.com', 'Prof. Conner Blick', '$2y$10$12TYRHM043MrIgr6DMtQFenwnUgBS2JYVHUD5r38SShtaHHzLDIcK', 1, '+1-290-527-6743', '2017-08-03 13:17:09', NULL),
(75, 'plynch@yahoo.com', 'Yasmin Jast', '$2y$10$U.c/ALf5H5juSTsEEejVzOQCAKcVCEVc./aCP9jsPnV1J9lRjYf.O', 1, '+1-290-527-6743', '2017-09-11 15:58:51', NULL),
(76, 'bhane@doyle.com', 'Alanna Klocko', '$2y$10$MkEEDwzTploVuUj8Jf4QReWDMrD7dC.y37bg.97c/B2WG54vm6wDO', 1, '+1-290-527-6743', '2017-09-24 02:45:46', NULL),
(77, 'kyle36@gmail.com', 'Mrs. Chloe Rolfson DDS', '$2y$10$bNWRpJk2iWYtwgBLWPwxBuLN642vhulu8tiTp7JAmf0wtk6NIjcGa', 1, '+1-290-527-6743', '2017-09-05 12:38:15', NULL),
(78, 'sally00@kuhlman.com', 'Wellington Hagenes', '$2y$10$NzLFo6CTxTYDpRJYIqlFt.80hzmJ7fimhL8XjxXR1jibcarQ1EL/a', 1, '+1-290-527-6743', '2017-10-02 03:38:18', NULL),
(79, 'chessel@hotmail.com', 'Aida Thiel PhD', '$2y$10$RmoSEsrIX/6QWWAQVGaa0.M1cTDtXHXHv.6LKqfJWLJUmvn.tf4EG', 1, '+1-290-527-6743', '2017-09-19 00:10:58', NULL),
(80, 'wzieme@west.com', 'Mr. Garland Leannon', '$2y$10$Lbbaak8NAj0BcG5hHQBxW.b/ja6dlwWx.QpPoCl0lwn7hNjPKbuEi', 1, '+1-290-527-6743', '2017-08-15 19:23:09', NULL),
(81, 'qrosenbaum@kassulke.com', 'Prof. Eunice Kulas', '$2y$10$7EtW2jTyNEwqz4xY.bYYUu8Yrdk7paPOqaI.cnTOROzN4bFzZp8lS', 1, '+1-290-527-6743', '2017-10-04 00:54:01', NULL),
(82, 'tzulauf@hotmail.com', 'Annabelle Marks', '$2y$10$fZqcxdjbiAgY0vtoWsr7KeCJl0wLohJxcmmz4PuJHFauOjh5Bz/2S', 1, '+1-290-527-6743', '2017-10-07 19:03:39', NULL),
(83, 'amorar@yahoo.com', 'Jayson Hessel', '$2y$10$ELx72s0gjsYFUaQkCvSCAO/ifWuDEAXAY.uzgnJ6T/FDQfXCBr5Xm', 1, '+1-290-527-6743', '2017-09-21 08:58:20', NULL),
(84, 'leonie88@yahoo.com', 'Rogers Streich', '$2y$10$meuN8e4o8rszomUha1cm8.IhjkJ1LmkBI3JU7x7Ctpjch2AEn92se', 1, '+1-290-527-6743', '2017-10-03 22:20:39', NULL),
(85, 'silas.welch@yahoo.com', 'Mrs. Maritza Weissnat Sr.', '$2y$10$SxchZlo.bT8m62oscFdOYOwsJ7agfLITuJEssPChln1xgFBo/Pns2', 1, '+1-290-527-6743', '2017-10-11 15:45:57', NULL),
(86, 'cwehner@hotmail.com', 'Samantha Cormier', '$2y$10$34p6YfHmntTZajTx61ppKeOoyABL5sanfc7/AP2RlYjCfyOysTE26', 1, '+1-290-527-6743', '2017-09-25 11:39:12', NULL),
(87, 'callie50@yahoo.com', 'Reyna Labadie', '$2y$10$wDSWI4AjprwWoBh054mpHO3irSsFLWDqUKQ12dxRcNNESeg4TWyY6', 1, '+1-290-527-6743', '2017-09-28 08:40:42', NULL),
(88, 'wisozk.gene@brekke.com', 'Bernice Hand DVM', '$2y$10$dWhG/0VXqXJ0mUffDcNMTuW3u1PZ4r5hAB85LcZSb4RXzvYXITaCO', 1, '+1-290-527-6743', '2017-08-20 05:56:09', NULL),
(89, 'zupton@daugherty.com', 'Prof. Dasia Romaguera DVM', '$2y$10$Of2hduaOTd.wOFNa8XUoDeq/veZbUY/Ux8Die7qpaSQE.vrjP6hv2', 1, '+1-290-527-6743', '2017-09-13 19:55:09', NULL),
(90, 'waters.ernie@dibbert.com', 'Coralie Kerluke', '$2y$10$3NjUptSlw/RXkpKKEDZo2e5pb.TDl2tNhs9AN7mLEM2UU1FQg2WCy', 1, '+1-290-527-6743', '2017-10-07 13:48:58', NULL),
(91, 'brennan.gottlieb@hotmail.com', 'Mr. Lee Farrell', '$2y$10$ub8JPZMAKBLCA48LXOKII.r/cCFrIEbfOZV5HxBI9p1xipnpIXBB.', 1, '+1-290-527-6743', '2017-09-13 07:35:47', NULL),
(92, 'akeem17@bode.biz', 'Danika Upton', '$2y$10$r7kuYqxBBsCCy1HhVI7G7.IpO/QKloG0cei6lvKFAu3nOs9Lq1ZR2', 1, '+1-290-527-6743', '2017-08-18 08:18:38', NULL),
(93, 'quitzon.damion@yahoo.com', 'Greyson Franecki', '$2y$10$nP6/Z2ekeJybBof59uGr2OtLL8q5kD134xlIzVFQcr1ZAm/jSIUtm', 1, '+1-290-527-6743', '2017-09-25 14:45:01', NULL),
(94, 'grant.elwin@beatty.biz', 'Gregg Cruickshank', '$2y$10$LURW5wGWx6QYUuoeFsVKQOuTdEHDtEErxCCdwf5QPMj1jCZkoNM0u', 1, '+1-290-527-6743', '2017-08-27 12:28:21', NULL),
(95, 'bettye09@hotmail.com', 'Lambert Howell', '$2y$10$f20O1Vkkc3Gw25nzEag4.u8I3RGB1s2st6hx1H/SMxYjtgg9ccaPy', 1, '+1-290-527-6743', '2017-10-01 01:13:26', NULL),
(96, 'domenic.gorczany@gmail.com', 'Grover Kunze', '$2y$10$AjGaqGeQb9RvS9IvwO2L0uDx8mVVMDZKCLs6sMMHf4WtkBTVl.eh.', 1, '+1-290-527-6743', '2017-09-26 08:40:09', NULL),
(97, 'gennaro63@dare.com', 'Prof. Ford Gusikowski PhD', '$2y$10$wk3AGoiMLsFTU072MKHKuuubjwlwaVT.Ila46cZlg6WlYQmv11E0y', 1, '+1-290-527-6743', '2017-09-14 18:56:16', NULL),
(98, 'qbatz@yahoo.com', 'Dr. Frederik Hilpert V', '$2y$10$N8akFfe/KqH/QJz0Jt6jjubhQAo8i0tYXil/psFh3g4sfAUtpjXpu', 1, '+1-290-527-6743', '2017-09-11 23:20:45', NULL),
(99, 'rudolph23@hotmail.com', 'Emerson Green', '$2y$10$.8wZ7ED5jDnj5FBiISKqCuQ/hf16p6xtIJxs3hNgeI0kP26HUFb9.', 1, '+1-290-527-6743', '2017-08-20 20:00:45', NULL),
(100, 'kenton.jakubowski@yahoo.com', 'Prof. Carolina Kerluke Sr.', '$2y$10$6D43WXtelpu.gaKoeT1uMeBvFFb0FtJPzsWer6GPE8OhyLCMghLhS', 1, '+1-290-527-6743', '2017-09-08 12:29:35', NULL),
(101, 'obahringer@gmail.com', 'Prof. Zack Steuber III', '$2y$10$N23Np4NpzpIdC5V.oz4G/OoegfkksCKEX776.d1LEWRlh0Nl/Sed2', 1, '+1-290-527-6743', '2017-09-04 08:01:08', NULL),
(102, 'scrooks@hotmail.com', 'Torrance Krajcik III', '$2y$10$I0r/QqNWYO6HkHRtB0UBFue0/CJF4c/ysHCRwRg06b//ywijgj5NS', 1, '+1-290-527-6743', '2017-08-20 20:14:16', NULL),
(103, 'batz.christy@hotmail.com', 'Rodrick VonRueden', '$2y$10$0e11zhuV02/HuA9Fc3zr0O7liTpsB.5v/8TOxgjLbRBOY5bxl2jaC', 1, '+1-290-527-6743', '2017-10-02 17:47:01', NULL),
(104, 'ivory79@yahoo.com', 'Lia Kling', '$2y$10$HrclaL5MsiJ6NqPZfTkVCuwgn8xP7nbIqensKGB0etZ5p5IBl9d7W', 1, '+1-290-527-6743', '2017-09-04 03:51:06', NULL),
(105, 'mmills@pfeffer.info', 'Eusebio Conroy Sr.', '$2y$10$b9iP/dRQ9fLyMA.suxCVwOF7QmNQOe6W/6MNZa0aW59Tb.XFPgzMy', 1, '+1-290-527-6743', '2017-08-07 19:07:21', NULL),
(106, 'natasha59@hotmail.com', 'Ressie Kutch I', '$2y$10$PgXw0mqXW8bgLRZ7bJ44GuFrrpWCed1IC8auhd8uJS8yrhjsY3oJ2', 1, '+1-290-527-6743', '2017-10-15 09:38:55', NULL),
(107, 'dosinski@monahan.com', 'Emmett Zulauf', '$2y$10$6wjMASTLSUPWvpry6raNN.xizeK0lF5uX7GyS/npwT9iYEziTKg6.', 1, '+1-290-527-6743', '2017-08-06 17:31:33', NULL),
(108, 'romaguera.jasen@yahoo.com', 'Kaela Quitzon DDS', '$2y$10$3UkejD8rJu8owPD88KzyEuCOl0Dt9TZH3mr1lOVSJsTuHQgiM0CrK', 1, '+1-290-527-6743', '2017-10-09 07:08:01', NULL),
(109, 'rodger.volkman@upton.com', 'Gunnar Abbott', '$2y$10$u/1XbGD0s7q6oKMXKrfg2ONKQhDFbNHPdHI09I0corvgOT0rus/42', 1, '+1-290-527-6743', '2017-09-13 03:30:08', NULL),
(110, 'louisa45@hotmail.com', 'Megane Schroeder', '$2y$10$44AYZca4iPJLJ5Sw/qJVb.McXm7TxIOs2TgHhoRwc/OT8In96Gzhq', 1, '+1-290-527-6743', '2017-08-05 20:43:43', NULL),
(111, 'denesik.rowland@quitzon.biz', 'Ms. Oceane Mosciski II', '$2y$10$/nsKGV8KlEKQW9PnsYxqwu8jz3m9rv7jBIEuYkTeITrhVgBeHk9FO', 1, '+1-290-527-6743', '2017-09-01 17:37:32', NULL),
(112, 'pbernhard@hotmail.com', 'Elisabeth Wunsch', '$2y$10$ULIMp7XiTDBQa6JYWUUSMOLp60QFYsMCxX0cb8R4iAoU6U/FzXtyO', 1, '+1-290-527-6743', '2017-09-17 17:50:51', NULL),
(113, 'hailie.murray@yahoo.com', 'Prof. Madeline Mills III', '$2y$10$tb40.83DZ71aKb89AWRSMuLNV/VrSkhFkhjVbRgR.1/YCCLPWfJ0y', 1, '+1-290-527-6743', '2017-10-07 23:54:00', NULL),
(114, 'haag.general@kilback.biz', 'Ora Bednar', '$2y$10$iWIijzGL5OcfVK52ktrawOPACqrd8lk86oRGKA90iociI3pgl6MKC', 1, '+1-290-527-6743', '2017-09-02 13:50:05', NULL),
(115, 'adrienne.herman@hotmail.com', 'Dino Hamill', '$2y$10$fuo2KPd3N8.FbWFPO26xku4FMV.F9Tkb58lbD7VzusvkIfQbZrPMK', 1, '+1-290-527-6743', '2017-09-04 04:49:46', NULL),
(116, 'gerda86@blick.net', 'Katelynn Durgan', '$2y$10$6LmaPA6CSp0jw74ZoLyu7ORd.xZxurcs3x48UJmPqHVZLM9Mf2uhe', 1, '+1-290-527-6743', '2017-08-10 19:33:15', NULL),
(117, 'hallie.hermiston@gmail.com', 'Delia Bogan', '$2y$10$9Jtyywm93ljum3zETqgq8.5KLm08ybjmlhhJpZKltaGEZjr7bdGkK', 1, '+1-290-527-6743', '2017-08-25 15:37:38', NULL),
(118, 'tpouros@gmail.com', 'Helmer Mosciski', '$2y$10$T5vDyipW/1YxEEpozHY4Quf4YUkGJGtYgNxpjdzZ7KsbG91lokZ7K', 1, '+1-290-527-6743', '2017-09-29 03:35:51', NULL),
(119, 'pearlie66@schuppe.com', 'Odessa Swift', '$2y$10$iuyqE.bZcz9UT0Lr9JYG2ur0pA/zl.mMzS6pBictQAv71aUu2Xq3i', 1, '+1-290-527-6743', '2017-10-11 04:15:34', NULL),
(120, 'jonas.dibbert@feest.com', 'Dr. Garnet Gibson', '$2y$10$lXAbmLICfnO6UnzZKtjh.uNbWRt0RBq15uFy7s/Pwx.Ued7VDXInG', 1, '+1-290-527-6743', '2017-08-20 08:03:03', NULL),
(121, 'ehackett@yahoo.com', 'Mr. Jermain Feest', '$2y$10$v9xbVm79AW9s8ZemPGgPq.AzNqCl2cGmF.IYAQMAh86PF3C/mCfyW', 1, '+1-290-527-6743', '2017-10-19 15:46:16', NULL),
(122, 'jarrell75@yahoo.com', 'Hannah Parisian', '$2y$10$.jGUjusha5GWK5I.wuHIeePJr4qhkoD701znfhkelLi7CJwEw41I6', 1, '+1-290-527-6743', '2017-09-29 14:03:22', NULL),
(123, 'randal09@hotmail.com', 'Dr. Kali Wisozk Jr.', '$2y$10$HEe2JRosy7Jf.4JhJXFMg.4lFW3Gj8W0LZcWA8bKR3QkHAizCtc0W', 1, '+1-290-527-6743', '2017-09-04 21:24:55', NULL),
(124, 'johnson.alfred@hotmail.com', 'Zack King', '$2y$10$mqee4bv00EnZF0x/zUU2GO8lKlwAgMEd04JHlQrAsPSJL4iiDD6.K', 1, '+1-290-527-6743', '2017-10-01 02:24:06', NULL),
(125, 'spagac@gmail.com', 'Mr. Miguel Schiller', '$2y$10$Nf6nP4tNgrVOv2UIddd.UeaLWP4KCFgBLUQiX3uD69qQ51ldYWHsm', 1, '+1-290-527-6743', '2017-08-07 07:27:47', NULL),
(126, 'trystan.dicki@hirthe.com', 'Adella Jast', '$2y$10$pGBmezI7HCwXXcfRp7pVkOd0I4Tjo2dSz1mq54xJi9LgZ/cjIVxIu', 1, '+1-290-527-6743', '2017-09-24 09:28:32', NULL),
(127, 'vterry@heathcote.com', 'Rolando Shields', '$2y$10$j71QX74rhlexAasuCR4ulu6yxf0D9P8RwnKpwQCDF3ayx3o1A.Evi', 1, '+1-290-527-6743', '2017-10-04 04:08:49', NULL),
(128, 'dcrona@hotmail.com', 'Ms. Sonya Dare', '$2y$10$q9aT5LqE7wRnKQLjDVqZke5xIE8bzPWv5IjJ6ukXFIgzRaxoisUz.', 1, '+1-290-527-6743', '2017-09-22 03:05:29', NULL),
(129, 'cindy.runte@gmail.com', 'Dominique Prohaska', '$2y$10$vruRR2ED.Ja6hNYXDf4pnuxcHtmu8zAHT0k5Nj1n0WMzFUKUWxFEu', 1, '+1-290-527-6743', '2017-10-10 03:58:38', NULL),
(130, 'cordie.cartwright@hotmail.com', 'Arne Powlowski', '$2y$10$OEKHonuHJs.oOf5Bq8F/0uxMIw9Z2GPRNy3nQccasVVy7Vg7IgsjO', 1, '+1-290-527-6743', '2017-09-22 04:15:20', NULL),
(131, 'stark.rosario@hotmail.com', 'Lavonne Rutherford', '$2y$10$xIRl2clckMoXD9t2fNM4Ou8/gsR0y6lv1F1owFIs1dEK3opGiJltS', 1, '+1-290-527-6743', '2017-10-06 15:38:09', NULL),
(132, 'orpha03@hotmail.com', 'Keon Rempel', '$2y$10$Pkk0iPYOTg0zXsp22t4VVeT8bjK6zLdH5rSmXQPYp5Q76cVQM6mxS', 1, '+1-290-527-6743', '2017-10-10 21:55:54', NULL),
(133, 'terrell.larkin@volkman.com', 'Bernadine Morar', '$2y$10$FZMQn0tPLwmt4Rk/Pj3vxOblgVUhBKWFmNCewOiVhyLqH8xboRJWK', 1, '+1-290-527-6743', '2017-10-02 16:42:43', NULL),
(134, 'qgusikowski@wehner.org', 'Felipe Kertzmann', '$2y$10$tXlW6u.xOAJ.P42axPWSful7uZkwDAiVcWpt.fyoJLyegSOW72zly', 1, '+1-290-527-6743', '2017-09-11 03:16:25', NULL),
(135, 'macie81@becker.com', 'Charlene Abbott', '$2y$10$ILTHi/lRtG.iz4nJT6HnreBhg75n5ngjbD2QmdGzWiuYmhioNqsqW', 1, '+1-290-527-6743', '2017-09-25 01:10:37', NULL),
(136, 'jacinto93@skiles.com', 'Prudence Dooley', '$2y$10$2QGFkp3J5U9CXzz4YXEetO3IFOQ3rnuea8px2G3uvUI.RqYCQu8Lm', 1, '+1-290-527-6743', '2017-09-11 10:08:46', NULL),
(137, 'cicero.brown@gmail.com', 'Adan Abbott PhD', '$2y$10$EJK9jlDNKLmsTP1i2jlC0uJZGHGd0iK5oAWZZglgULsHKSmWkVvYm', 1, '+1-290-527-6743', '2017-09-03 19:56:03', NULL),
(138, 'dschulist@berge.info', 'Dawn Lakin', '$2y$10$AAW1gK1CvGXi9qUdLzbTA.SEhHDPInST7mIIuCW0Z3JzSQtqVdbnG', 1, '+1-290-527-6743', '2017-09-16 13:36:35', NULL),
(139, 'morton83@mckenzie.com', 'Ms. Clarissa Mann V', '$2y$10$UOOet6j649i3VqC0arU54ueNLWSa5EhEgWxVXsKcyzhdJmE2fX6mu', 1, '+1-290-527-6743', '2017-09-24 08:49:39', NULL),
(140, 'kertzmann.maia@streich.com', 'Luz Barton', '$2y$10$RURcwoKSdWWCmJMjMjN39OCkQzlF6vZ6Wogqv1Oqz2o8lBnkTzdK6', 1, '+1-290-527-6743', '2017-09-16 10:15:24', NULL),
(141, 'wyman.ferry@gmail.com', 'Alexis Kozey', '$2y$10$a9gwhERa1C.LiQ4sa9Q.xe1IrwjF8hBT1C.LVEK3iOgS6lCmEaIEi', 1, '+1-290-527-6743', '2017-09-25 14:24:10', NULL),
(142, 'zakary.beer@hotmail.com', 'Kelton Dach V', '$2y$10$Nsr/twqvk84KctrQr9KtCOm5QDE4VJbC6McRTKeVmgRUbave7gqvS', 1, '+1-290-527-6743', '2017-10-07 06:01:49', NULL),
(143, 'gfarrell@runte.org', 'Jeramie Yost', '$2y$10$SxC9FfJRQaPJPpdHDa8KNO2omFGX2yfymv6TL5UPrTOyhOSdCKivS', 1, '+1-290-527-6743', '2017-09-15 17:12:13', NULL),
(144, 'koelpin.emmanuel@swift.net', 'Dina Nolan II', '$2y$10$.w4I/.5ky9b4Rxi7yhNiXe00dT4MHfd4fXy8tp.2dlhDNPUkoqcoe', 1, '+1-290-527-6743', '2017-08-06 08:55:02', NULL),
(145, 'langosh.blake@gislason.com', 'Dr. Colleen Lang', '$2y$10$GTkjRi5QHldKAJlkY.KfD.8xe2ipA9.NoPiK3TOJK84VsQVz6V5ye', 1, '+1-290-527-6743', '2017-10-07 09:33:08', NULL),
(146, 'mertz.lionel@cartwright.net', 'Rosamond Wintheiser', '$2y$10$1ycH0LOaqxtY.PpgzBN35eHELr6KpCP/dSaSDxz9UhC8gumL4RBYi', 1, '+1-290-527-6743', '2017-09-22 09:09:12', NULL),
(147, 'brice@gmail.com', 'Fermin Windler', '$2y$10$xN4IAeMGRHDPMRlvZJZcPOko98GMQTXEfLdsIo7XBKKaSc9jya74q', 1, '+1-290-527-6743', '2017-10-15 07:12:03', NULL),
(148, 'rath.petra@turner.info', 'Kianna Miller', '$2y$10$I3klFc7Gv0LC0t45WVK1r.0i2zvfsDi/zL9XCqql6l4JVR4VdqiVO', 1, '+1-290-527-6743', '2017-09-09 23:25:36', NULL),
(149, 'garth.wyman@yahoo.com', 'Lew Rice', '$2y$10$uIFH7uRypdEPVur7fMNsW.1ab3/YY.NDfoEbuNa3Rfson8AsrF7oi', 1, '+1-290-527-6743', '2017-09-26 20:03:20', NULL),
(150, 'blanda.krystel@jaskolski.info', 'Reinhold Stokes', '$2y$10$Gvw9SJFq1upFkZpQtgxAOuPI9wwiixHeW317NmMH/ZYldpkmslN4a', 1, '+1-290-527-6743', '2017-08-03 07:51:55', NULL),
(151, 'stamm.briana@yahoo.com', 'Harmon Yost', '$2y$10$1huoogEi5MRRjlxSeOANe.fsRvggTQVNcQnjdZy5k6eyxiaJ5SxSq', 1, '+1-290-527-6743', '2017-09-22 18:01:41', NULL),
(152, 'gussie.willms@grady.com', 'Laney Ernser', '$2y$10$BTIXqMQm1RDZeBM9724hXuFlRPr17cYPAU.Lwl6Ktb96eiGPaL1lC', 1, '+1-290-527-6743', '2017-09-13 17:54:27', NULL),
(153, 'francisco.herzog@gerhold.com', 'Dortha Casper', '$2y$10$Y8W2u2C5t36rlXYeZIfEPuMo.UXACVBCjzUQRjMpbIjqA0cn2kB8C', 1, '+1-290-527-6743', '2017-09-27 20:59:34', NULL),
(154, 'monty30@harber.org', 'Hattie Brakus', '$2y$10$pt0iHRWO49QZndMG9uVrG.dXDDts8ysIkgHG3XsV8ZqI5bpDgD1xq', 1, '+1-290-527-6743', '2017-09-20 15:57:28', NULL),
(155, 'bbayer@abshire.com', 'Rafael Considine', '$2y$10$nLzazKvb3wVdWQMT7Fttj.4QXxxy7syHBLa1DARhNLhUkZRaHvLeu', 1, '+1-290-527-6743', '2017-10-04 20:06:57', NULL),
(156, 'schoen.okey@kuhic.com', 'Prof. Jadyn Howe DVM', '$2y$10$Ui9SCs1lXKlLKKKVMhozzOQ41hVeEM/t6JaUwTYd6M/LNtgVrBLlu', 1, '+1-290-527-6743', '2017-08-22 22:37:28', NULL),
(157, 'lelah89@watsica.org', 'Sid Klocko IV', '$2y$10$um.7Y9BWLoI.JdX8E7BY.er8A23nps0RuDrHW2Yqz02NpkjjrGza.', 1, '+1-290-527-6743', '2017-09-15 07:29:05', NULL),
(158, 'schumm.jamil@hotmail.com', 'Malcolm Leuschke', '$2y$10$3rrmIJ1ZY2yr/i4nAoy8OuuOyyLI.GoQqqZrt2IeYFRig3npVaPyq', 1, '+1-290-527-6743', '2017-08-07 04:27:57', NULL),
(159, 'igorczany@collins.com', 'Mervin Farrell', '$2y$10$tsBnd8zFJAEHXJkb3EQrG.ny1wUFapzG6QSDHLHPu3r5VX7PIp7o.', 1, '+1-290-527-6743', '2017-08-14 17:40:55', NULL),
(160, 'chermiston@heaney.biz', 'Shania Vandervort', '$2y$10$Noy4CjRN9bj4kymGKLpqqOEq.SbirgH3Xk2hFhxvRsyzNqcPAa6bC', 1, '+1-290-527-6743', '2017-09-10 09:04:52', NULL),
(161, 'zboncak.kenya@mccullough.net', 'Kayli Hartmann', '$2y$10$MIFXPTrz6jkdRCUL2A.2seMv0lU9r0wj5/QaGESi9Xf4p.z7lgOrm', 1, '+1-290-527-6743', '2017-08-24 06:43:12', NULL),
(162, 'umertz@boyer.com', 'Prof. Solon Willms', '$2y$10$vC1.fE78/D99GxTbhNt7LeNe6JIJYso9qrXxnJrJgg9fB7jJt5zNm', 1, '+1-290-527-6743', '2017-08-08 19:55:58', NULL),
(163, 'jlangworth@corwin.com', 'Leora Wyman', '$2y$10$IvzHff2BZxxXIrQPhT6Cq.W1kIm6wsVtyb5M1Ob1SvkTnBhsiW/Oe', 1, '+1-290-527-6743', '2017-09-03 07:54:46', NULL),
(164, 'corwin.grady@mcdermott.com', 'Mr. Osvaldo Koepp', '$2y$10$0XqcB/mP0jCmr5MZwKm36ukD6XN9ZhkbZdNf9Io23VBdiGg3DG0wG', 1, '+1-290-527-6743', '2017-09-15 07:54:33', NULL),
(165, 'kurt89@gmail.com', 'Miss Mabel Huels', '$2y$10$vj8/0Fi8OMxPb9BxCgId3OnHkjxaw2V4S3/JBZh0iL6e8lHZ7sl52', 1, '+1-290-527-6743', '2017-08-29 23:06:04', NULL),
(166, 'vincent57@gmail.com', 'Johann Nicolas III', '$2y$10$iBJAtIPL4K4VF5AmBoaJU.h.dWx9hbqvWBX0SwMdp7Q2qFQUmfquu', 1, '+1-290-527-6743', '2017-10-19 15:46:17', NULL),
(167, 'valentine.paucek@jerde.net', 'Ms. Heloise Carroll Jr.', '$2y$10$Z5CLNebJKEwC/BYh3.jC8Oj8ShPAB7DSaTinQKG/2vRTp7q4J364S', 1, '+1-290-527-6743', '2017-08-31 05:17:09', NULL),
(168, 'nina.veum@ferry.com', 'Keven Heidenreich', '$2y$10$nFK3M5sCGC.UIOmbjEPTpugHBP/5fhPI/yd0K6W1fiO/7VqO9RQX2', 1, '+1-290-527-6743', '2017-09-03 00:46:14', NULL),
(169, 'blair28@hotmail.com', 'Courtney Pacocha', '$2y$10$dSlajwfxGzj9EuE0bWk8QOhzTZITZvTnHZHCo.UEBePbt9erpi8Uu', 1, '+1-290-527-6743', '2017-09-20 00:43:29', NULL),
(170, 'hhuels@yahoo.com', 'Minnie Harvey', '$2y$10$VyCMl7eIf.MbsoAHckX1R.dk1WAAGkqho1/hRWR/ohbUasqbM0Aeu', 1, '+1-290-527-6743', '2017-09-02 23:36:40', NULL),
(171, 'bryon.oberbrunner@haag.com', 'Delta Kris', '$2y$10$9LazRQSXzUbL.YX0YEECSOYKOb8Vl5xhacduiXyxGSZC2Crkf.k/C', 1, '+1-290-527-6743', '2017-09-11 02:52:54', NULL),
(172, 'dessie87@gmail.com', 'Ms. Sandy Kihn II', '$2y$10$0DTnOlKki7RMGucTldzYVuZRZjaQcT9/ZT4.knMks3POiD0y8WkU6', 1, '+1-290-527-6743', '2017-08-25 06:23:23', NULL),
(173, 'wlangworth@gmail.com', 'Amy Boyle', '$2y$10$gWdYlTm9UKBECJYDVBlrlOr/lMx5m6JtuA/gOjxPo5z6j54aILSbK', 1, '+1-290-527-6743', '2017-08-20 07:20:47', NULL),
(174, 'frippin@thompson.com', 'Sedrick Macejkovic', '$2y$10$PVhzVrQosavp5wwpwrE9feMn8m9D4Nl.SoVXEBNSi/ZYX8tOYn.nC', 1, '+1-290-527-6743', '2017-09-10 11:28:03', NULL),
(175, 'elisa80@sauer.net', 'Hardy Hermiston', '$2y$10$u6hT8gsdKxSxq1Q1Dft7bOX77hKqbh3xm3fqb3vg.5kb0U6Xtge42', 1, '+1-290-527-6743', '2017-08-07 21:16:19', NULL),
(176, 'erodriguez@yahoo.com', 'Mara Predovic', '$2y$10$1vu3iX.WT4jOQ4Gx47CmS.X36SQfBuHOkY4VKNlW5GgDohAjKFFTq', 1, '+1-290-527-6743', '2017-08-28 06:33:59', NULL),
(177, 'wunsch.emilie@smitham.com', 'Sydney Weimann DDS', '$2y$10$GmWbJOTFwZk.tTqxux3QHutI34ypD4k5BfrcqbNSAZmE8jha58xKq', 1, '+1-290-527-6743', '2017-09-28 12:01:19', NULL),
(178, 'oran64@simonis.org', 'Bernhard Schaden', '$2y$10$4q/j3X7ICRksIeE.QhCQN.WpXs4urmCzqpNCiYTUZuOWRX2EEH5.2', 1, '+1-290-527-6743', '2017-08-23 12:30:20', NULL),
(179, 'rafaela53@swift.org', 'Mr. Darron Kunze DVM', '$2y$10$hVym3R5mB3IdRp625xgXmOuY2h3IzEwQWBoj3m4MMcYVX5zWo/EIG', 1, '+1-290-527-6743', '2017-10-18 05:49:44', NULL),
(180, 'nedra08@pfannerstill.net', 'Braulio Beer', '$2y$10$1otzB/4XlFnQPZkoCkHtbucAdC91riAyY2JH8haaqtPlLcJvi6fAy', 1, '+1-290-527-6743', '2017-08-09 08:43:58', NULL),
(181, 'erich.kozey@streich.com', 'Delilah Sawayn', '$2y$10$185Dh.BYZWkojZqrSz2MSO8TQ7HqZXeoNlupL9.3KyE/wmrVZbeQS', 1, '+1-290-527-6743', '2017-09-20 21:57:52', NULL),
(182, 'paxton75@yahoo.com', 'Dr. Ladarius Jacobs', '$2y$10$YiACMF77hlV8jZLZ5LJdPOHE3OalvPy0zCNp0TBxVTFsiaOy5Q5gK', 1, '+1-290-527-6743', '2017-09-25 19:39:46', NULL),
(183, 'maggio.stone@haley.com', 'Miss Gina Lang III', '$2y$10$WKVEt7RYN1/xK/L.n6BunuTi./O18kksk8000BO738TIM/EDENxoq', 1, '+1-290-527-6743', '2017-08-31 05:58:03', NULL),
(184, 'saul.bailey@gmail.com', 'Ms. Hettie Robel', '$2y$10$/maOARrZi7oV9wQ3VnPkTe7L4u.UTkbQQgSz4.6v5SPtlBqPUFN/S', 1, '+1-290-527-6743', '2017-09-21 08:08:58', NULL),
(185, 'zackery.erdman@skiles.com', 'Prof. Garland Miller', '$2y$10$xT4KIOsklPTe2sw0KoQU.eiPYGWV/WnguxhJNaYvc7zLNVfTnTYSW', 1, '+1-290-527-6743', '2017-09-24 15:21:36', NULL),
(186, 'rheaney@yahoo.com', 'Maymie Gutmann III', '$2y$10$s.NeBwhwQA91Kkla3mhhNekxhaIqJGESs/H6iJ/gBr5L19aq5vzl6', 1, '+1-290-527-6743', '2017-10-15 18:25:30', NULL),
(187, 'jules43@yahoo.com', 'Jefferey Parisian', '$2y$10$Xj8wlBiQ2KI3f2f2JUCbH.ce6qXwOIlrAGjLuIsVo3GzPYZPtr8om', 1, '+1-290-527-6743', '2017-10-05 02:03:45', NULL),
(188, 'rblock@walsh.com', 'Prof. Isac Aufderhar Sr.', '$2y$10$3KHtzfTeRJTdsyzXtYwuBOy3TwRKz1qMYc/Z1jbmeJNixEo0kvaAS', 1, '+1-290-527-6743', '2017-10-14 13:54:38', NULL),
(189, 'nmcclure@vonrueden.biz', 'Nels Collins', '$2y$10$EpWgsoMWrpPJFYS5ewJy4ei7al2jSJ7V.djRwoD94Ur.gi2BAqTmS', 1, '+1-290-527-6743', '2017-10-13 03:43:16', NULL),
(190, 'wade.donnelly@cartwright.com', 'Luna Barrows', '$2y$10$UuWCMjV9qeAKvYzClNWnoebalNXVXwEyIhFY89F1d9uhsnhuz5P7W', 1, '+1-290-527-6743', '2017-08-29 02:59:27', NULL),
(191, 'jacinto.dickinson@cormier.com', 'Douglas Zieme', '$2y$10$LzS5hc0yfBngchUOFVcUn.TjQ7tkvsdUQl9ntlhKbE4jwb8pTrF1C', 1, '+1-290-527-6743', '2017-08-20 17:39:36', NULL),
(192, 'kacey.bernhard@gmail.com', 'Mrs. Audreanne Conn', '$2y$10$wyCBFq9OjEkOqE22KPwl7eqivVcuLXz3OjZmRPhxm5DEKsz2aneWa', 1, '+1-290-527-6743', '2017-08-15 05:55:21', NULL),
(193, 'doyle29@hotmail.com', 'Paul Brakus', '$2y$10$DUSLDwZ/fK0JJgplU8ZtR.zQ7GcXk4d6yeEojtX0CzWbsXzlSdRzG', 1, '+1-290-527-6743', '2017-08-25 18:27:46', NULL),
(194, 'windler.cielo@hotmail.com', 'Dr. Aglae Jacobson', '$2y$10$kmSd6/JNzhAfz.wZ9wCI4O7y1HUzZfs4NFwIFbjgCAzcMUrVz021W', 1, '+1-290-527-6743', '2017-10-09 18:43:44', NULL),
(195, 'sanford.hyatt@yahoo.com', 'Vicente Carter III', '$2y$10$gTQXEwH8sMrr1cDGv8LVvOpXU1yBS.PjGkOFWO.ARAihhVt8kkwC.', 1, '+1-290-527-6743', '2017-10-08 10:39:50', NULL),
(196, 'robbie.satterfield@bosco.com', 'Aidan Bode', '$2y$10$2iRHI3BdAy5i.CwPQxRNBOoKc9vYaprdApofnR1CAK69ihHfMxPi2', 1, '+1-290-527-6743', '2017-10-06 17:32:58', NULL),
(197, 'ohoeger@lockman.com', 'Miss Andreane Hoppe', '$2y$10$ml3DKMmAyZ/zbGMm4x/YSu1zAyOWUErbcRXvWhLjoZVmOauY5g8By', 1, '+1-290-527-6743', '2017-09-25 13:50:36', NULL),
(198, 'wolf.wendell@gmail.com', 'Miss Mya McLaughlin', '$2y$10$.lzsHS3AzesProayrpnAU.TnGOXm7z40TgaFrSUgjjfS14ayodOJa', 1, '+1-290-527-6743', '2017-09-22 14:28:29', NULL),
(199, 'alfredo71@hotmail.com', 'Fabiola Langosh', '$2y$10$NSp7DAtoGf.A6Rr8ATISseLjQl7L4bgIbLRzJ5fi.5aHmpcxL8bAi', 1, '+1-290-527-6743', '2017-09-01 09:01:28', NULL),
(200, 'mohr.lexus@gislason.com', 'Jerod Auer', '$2y$10$OAPZTI/wXtijq8JjCm497ug54wxrryLzZ4OWS/ybe5wxh4oZNbMW2', 1, '+1-290-527-6743', '2017-08-28 09:41:50', NULL),
(201, 'schimmel.everett@strosin.org', 'Mrs. Hilda Marquardt Sr.', '$2y$10$rp7xTt/9xNE/P6.Um5StOOBciWpP6B7KLfSTKwKjutwxeTbqHRNRS', 1, '+1-290-527-6743', '2017-08-09 18:35:26', NULL),
(202, 'tcarroll@nitzsche.biz', 'Mr. Javon Cartwright', '$2y$10$yIgvByy7mcTKe8sYYovKI.1iZBPeX3ucTvckyjwsVeL1s2ZzAQRlm', 1, '+1-290-527-6743', '2017-08-18 03:31:36', NULL),
(203, 'milton.goyette@nikolaus.org', 'Cathryn Bechtelar', '$2y$10$UhURjQT6loIXBunP7qIiTOoZitgrBsVsSEMDFiJZ.yxrZl33dKhDi', 1, '+1-290-527-6743', '2017-10-18 10:11:14', NULL),
(204, 'qbraun@hotmail.com', 'Virginie Eichmann', '$2y$10$N/L4Rx.YogDkCcAfKt/.zOANX.c4mb/2hGMzaJCX7Sm.LZjVILyOW', 1, '+1-290-527-6743', '2017-09-30 10:15:58', NULL),
(205, 'cleve71@hotmail.com', 'Ethyl Fisher', '$2y$10$Ckz5NPCyxqvZjKatRKFrw.K43bS2wS.voJf0NOTq0dBVqi/rarh4W', 1, '+1-290-527-6743', '2017-10-16 15:55:54', NULL),
(206, 'polly01@hotmail.com', 'Ms. Kailee Lowe', '$2y$10$VoNZ2u5PyYDD2EQQppKe/O4kXSD9mYxHr3OhcDQbbXVoxmZbs5g6y', 1, '+1-290-527-6743', '2017-08-13 03:21:53', NULL),
(207, 'trippin@veum.net', 'Brandon Breitenberg', '$2y$10$C1n3OlJ0imEpTGMM60c8Teci8sNDSqaYYy1hROk3RgXZWrGdmhdP6', 1, '+1-290-527-6743', '2017-08-04 18:14:33', NULL),
(208, 'cole.melba@yahoo.com', 'Amina Gusikowski', '$2y$10$9TOA9wWedLplqp/84Y.Vz.mscoppCYag.WFDRRauxrOxiINrdOP8C', 1, '+1-290-527-6743', '2017-10-11 07:13:40', NULL),
(209, 'jada07@considine.com', 'Margaret Schuppe', '$2y$10$jCOFKdZBl52KVcfo322F6O5nPAIf4KFpPutyn4QyVVkhQ/LiMNh0q', 1, '+1-290-527-6743', '2017-08-26 02:34:40', NULL),
(210, 'bennie.ward@kunde.biz', 'Dr. Deondre Cremin', '$2y$10$B02PAX6KUJiUV05UwJuDBebJDEONgtfWg17OpJlp97VFaN.dawTH6', 1, '+1-290-527-6743', '2017-09-02 04:51:42', NULL),
(211, 'annamae.oberbrunner@yahoo.com', 'Emil Kunze', '$2y$10$vQpHidpywmwABAog7Xfqm.8DlsVDNZKA4cyUvmLIsdNP58yRxQoCm', 1, '+1-290-527-6743', '2017-10-04 07:15:45', NULL),
(212, 'domingo.batz@ebert.biz', 'Wilburn Wiza', '$2y$10$K.R/Yq14JpgaeRpLaSSuBOj5nPdxpZuT8rNJ22gFj8uXHHrbGxXv2', 1, '+1-290-527-6743', '2017-10-08 16:59:26', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`,`teacher_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_classes_users1_idx` (`teacher_id`);

--
-- Chỉ mục cho bảng `homeworks`
--
ALTER TABLE `homeworks`
  ADD PRIMARY KEY (`id`,`class_id`),
  ADD KEY `fk_homeworks_classes_idx` (`class_id`);

--
-- Chỉ mục cho bảng `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`student_id`,`class_id`),
  ADD KEY `fk_users_has_classes_classes1_idx` (`class_id`),
  ADD KEY `fk_users_has_classes_users1_idx` (`student_id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`,`sender_id`,`receiver_id`),
  ADD KEY `fk_users_has_users_users2_idx` (`receiver_id`),
  ADD KEY `fk_users_has_users_users1_idx` (`sender_id`);

--
-- Chỉ mục cho bảng `submit_homeworks`
--
ALTER TABLE `submit_homeworks`
  ADD PRIMARY KEY (`student_id`,`homework_id`),
  ADD KEY `fk_members_has_homeworks_homeworks1_idx` (`homework_id`),
  ADD KEY `fk_members_has_homeworks_members1_idx` (`student_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT cho bảng `homeworks`
--
ALTER TABLE `homeworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `fk_classes_users1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `homeworks`
--
ALTER TABLE `homeworks`
  ADD CONSTRAINT `fk_homeworks_classes` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `fk_users_has_classes_classes1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_classes_users1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_users_has_users_users1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_has_users_users2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `submit_homeworks`
--
ALTER TABLE `submit_homeworks`
  ADD CONSTRAINT `fk_members_has_homeworks_homeworks1` FOREIGN KEY (`homework_id`) REFERENCES `homeworks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_members_has_homeworks_members1` FOREIGN KEY (`student_id`) REFERENCES `members` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
