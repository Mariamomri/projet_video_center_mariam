-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 30, 2026 at 03:46 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_center_mariam_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260727120311', '2026-07-27 12:10:55', 20),
('DoctrineMigrations\\Version20260727175031', '2026-07-27 17:59:18', 147),
('DoctrineMigrations\\Version20260727202916', '2026-07-27 20:33:40', 71),
('DoctrineMigrations\\Version20260727212411', '2026-07-27 21:28:00', 95),
('DoctrineMigrations\\Version20260727215659', '2026-07-27 21:59:06', 33),
('DoctrineMigrations\\Version20260728211253', '2026-07-28 21:16:25', 83);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `selector` varchar(20) NOT NULL,
  `hashed_token` varchar(100) NOT NULL,
  `requested_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_verified` tinyint NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_size` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `created_at`, `updated_at`, `is_verified`, `image_name`, `image_size`) VALUES
(1, 'codegirlbxl@gmail.com', '[]', '$2y$13$Hmqsh7H8wMPiK5S/7iLs7eFaYfZ5IQjYQjsaul12RPDLqe1ykCQSe', 'Mariam', 'Omri', '2026-07-27 20:34:42', '2026-07-27 20:34:42', 1, 'default.jpg', NULL),
(2, 'julien@video.com', '[]', '$2y$13$GPJYvHQ5mrh08kQPiBsRy.SPNj9lSsmHqIKh76liN3jMju1W1tmta', 'Julien', 'Dunia', '2026-07-28 22:26:01', '2026-07-28 22:50:31', 1, 'wp3263966-6a477fe394706691515296-6a6932372cfdd659748819.webp', 101138),
(3, 'lara@video.com', '[]', '$2y$13$OeCWFsODBXuMgdBZmrqGbeqB9rbK6tblLcFLdf1eGQw/AGpKau6dO', 'Lara', 'Croft', '2026-07-28 23:37:42', '2026-07-29 00:29:40', 1, 'lara-6a69497459bf2116423871.jpg', 9623),
(4, 'James@video.com', '[]', '$2y$13$M2n4lLbaCsAR8RDx9LgUbeU/3BH.hCDQbHpfM8XsPe5pLIPEaQ5SW', 'James', 'Bond', '2026-07-28 23:39:03', '2026-07-28 23:47:22', 1, 'james-bond-sean-connery-6a477b9b7d10c350357591-6a693f8acca36995185306.jpg', 24872),
(5, 'wolf@video.com', '[]', '$2y$13$lk9tyu9MqEcQO5X1F5JmX.TpMEvJpAdrYuTdpMBV4ZpsesdXQGMlK', 'Wolf', 'Bianco', '2026-07-28 23:40:10', '2026-07-30 14:50:50', 0, 'wolf-6a6b64cae9a8b073692418.jpg', 511198);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `video_link` varchar(500) NOT NULL,
  `descritpion` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  `premium_video` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_29AA6432A76ED395` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `video_link`, `descritpion`, `created_at`, `updated_at`, `user_id`, `premium_video`) VALUES
(2, 'Spiderman', 'https://www.youtube.com/embed/8TZMtslA3UY', 'spider il film di sempre', '2026-07-27 20:48:58', '2026-07-27 20:48:58', 1, 0),
(3, 'Jackie Chan', 'https://www.youtube.com/embed/cDYicbmUxhg', 'Jackie il super hero', '2026-07-27 20:58:59', '2026-07-27 20:58:59', 1, 0),
(4, 'Symfony tuto', 'https://www.youtube.com/embed/OsUqvaQam34&list=PLjwdMgw5TTLXuvlGqP18gbJCYVg7y6Fig', 'sei bravo ma Julien spiega meglio', '2026-07-27 21:01:29', '2026-07-27 21:01:29', 1, 0),
(5, 'Spiderman 4', 'https://www.youtube.com/embed/62bIsvRcPv0', 'last film in the cinema', '2026-07-27 22:16:39', '2026-07-27 22:16:39', 1, 1),
(6, 'Avatar', 'https://www.youtube.com/embed/Z9lvyEXdXLQ', 'Avatar: Fire and Ash', '2026-07-28 23:02:25', '2026-07-28 23:02:25', 2, 1),
(11, 'Dragon Ball Z', 'https://www.youtube.com/embed/cok5yqXMuOI', 'Dragon Ball Z: Frieza Saga - Multiverse | Epic Action Short Film', '2026-07-29 00:16:08', '2026-07-29 00:16:08', 4, 0),
(10, 'dragon ball', 'https://www.youtube.com/embed/jKpvMDi-kYw', 'Dragon Ball | Episode 1 | VF | ADN', '2026-07-29 00:14:09', '2026-07-29 00:14:09', 4, 0),
(12, 'Dragon Ball Z', 'https://www.youtube.com/embed/cok5yqXMuOI', 'Dragon Ball Z: Frieza Saga - Multiverse | Epic Action Short Film', '2026-07-29 00:17:03', '2026-07-29 00:17:03', 4, 0),
(13, 'THE WOLF CHILD', 'https://www.youtube.com/embed/yxQWqnuAcRQ', 'THE WOLF CHILD - Film completo francese - Famiglia - HD - 1080', '2026-07-29 00:19:06', '2026-07-29 00:19:06', 4, 1),
(14, 'Wonder Woman', 'https://www.youtube.com/embed/u1NlmFa0-68', 'Wonder Woman 1984 | Young Diana Takes on The Amazon Games | Warner Bros. Entertainment', '2026-07-29 00:20:49', '2026-07-29 00:20:49', 4, 1),
(15, 'Swab Battle', 'https://www.youtube.com/embed/YaFg-73TmAI', 'The Great Cotton Swab Battle 🐜 Minuscule Movie Clip 🎬🍿', '2026-07-29 00:23:34', '2026-07-29 00:23:34', 4, 1),
(16, 'Tomb Raider                                       ', 'https://www.youtube.com/embed/Q-OK4s487RY', 'Tomb Raider (2001) Movie | Angelina Jolie, Daniel Craig | Review and Reaction', '2026-07-29 00:33:51', '2026-07-29 00:33:51', 3, 0),
(22, 'AVATAR', 'https://www.youtube.com/embed/M8To7iorkxQ', 'AVATAR Full Movie 2025: Pandora World | Superhero FXL Fantasy Movies 2025 in English (Game Movie)', '2026-07-30 15:11:06', '2026-07-30 15:11:06', 2, 0),
(17, 'Danger Woman 2', 'https://www.youtube.com/embed/0f_v67TtQhg', 'Danger Woman 2 : Angelina Jolie | New Action Movie 2025 | Full Movie | 4K Ultra', '2026-07-29 00:37:29', '2026-07-29 00:37:29', 3, 0),
(21, 'DUNE', 'https://www.youtube.com/embed/zgCwEthqdv8', 'Les films DUNE en 25 minutes !', '2026-07-30 15:08:17', '2026-07-30 15:08:17', 2, 1),
(18, 'Cassandra', 'https://www.youtube.com/embed/ClJunEbFaZc', 'Cassandra | Angelina Jolie | New Fantasy Movie 2024 | Full Movie | 4K Ultra', '2026-07-29 00:39:47', '2026-07-29 00:39:47', 3, 1),
(19, 'BE WEAPONS', 'https://www.youtube.com/embed/Fq4SKEh4Xbk', 'WEAPONS : Angelina Jolie | New Action Movie Concept AI 2025 | Full Movie 4K Ultra', '2026-07-29 00:42:30', '2026-07-29 00:42:30', 3, 1),
(23, 'CODEWARS', 'https://www.youtube.com/embed/=cvdjpSwkk58', 'EXPLICATION DU SITE CODEWARS - APPRENDRE A CODER', '2026-07-30 15:13:58', '2026-07-30 15:13:58', 2, 0),
(25, 'Leetcode', 'https://www.youtube.com/embed/GPIuPRqDGG8', 'The unfair way I got good at Leetcode', '2026-07-30 15:23:25', '2026-07-30 15:23:25', 2, 0),
(26, 'Learn Symfony', 'https://www.youtube.com/embed/i_jgWZItCGI', 'Learn Symfony in 1 Hour', '2026-07-30 15:30:12', '2026-07-30 15:30:12', 1, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
