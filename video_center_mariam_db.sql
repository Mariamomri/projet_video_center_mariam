-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 30, 2026 at 12:49 AM
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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `author_id` int NOT NULL,
  `video_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CF675F31B` (`author_id`),
  KEY `IDX_9474526C29C1004E` (`video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `author_id`, `video_id`, `created_at`) VALUES
(2, 'Super!!!!', 4, 2, '2026-08-24 08:25:16'),
(3, 'top film!', 4, 2, '2026-08-24 10:29:40');

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
('DoctrineMigrations\\Version20260728211253', '2026-07-28 21:16:25', 83),
('DoctrineMigrations\\Version20260824074824', '2026-08-24 07:52:32', 93),
('DoctrineMigrations\\Version20260824082112', '2026-08-24 08:22:47', 25),
('DoctrineMigrations\\Version20260827110926', '2026-08-27 11:12:32', 400);

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `created_at`, `updated_at`, `is_verified`, `image_name`, `image_size`) VALUES
(1, 'mary@video.com', '[]', '$2y$13$Hmqsh7H8wMPiK5S/7iLs7eFaYfZ5IQjYQjsaul12RPDLqe1ykCQSe', 'Mariam', 'Omri', '2026-07-27 20:34:42', '2026-07-30 16:37:51', 1, 'mariam-6a6b7ddf9c55d773192830.jpg', 58097),
(2, 'julien@video.com', '[]', '$2y$13$WaBfoKCwJpjzTbLKRxK5a.K3FmnA4sR4nQo1hYmH1Vrf.ImDZDKHK', 'Julien', 'Dunia', '2026-07-28 22:26:01', '2026-07-28 22:50:31', 1, 'wp3263966-6a477fe394706691515296-6a6932372cfdd659748819.webp', 101138),
(3, 'lara@video.com', '[]', '$2y$13$OeCWFsODBXuMgdBZmrqGbeqB9rbK6tblLcFLdf1eGQw/AGpKau6dO', 'Lara', 'Croft', '2026-07-28 23:37:42', '2026-07-29 00:29:40', 1, 'lara-6a69497459bf2116423871.jpg', 9623),
(4, 'James@video.com', '[]', '$2y$13$wyTuozQUvJngvXWVyS6ULuuGC2ZwSJuBT0Wco2C5G0j8jL.CMa0KK', 'James', 'Bond', '2026-07-28 23:39:03', '2026-07-28 23:47:22', 1, 'james-bond-sean-connery-6a477b9b7d10c350357591-6a693f8acca36995185306.jpg', 24872),
(5, 'wolf@video.com', '[]', '$2y$13$lk9tyu9MqEcQO5X1F5JmX.TpMEvJpAdrYuTdpMBV4ZpsesdXQGMlK', 'Wolf', 'Bianco', '2026-07-28 23:40:10', '2026-07-30 14:50:50', 0, 'wolf-6a6b64cae9a8b073692418.jpg', 511198),
(6, 'ciao@video.be', '[]', '$2y$13$sPgq.jFUmdmR7wKQsetvfeUU6LKskD5h/MkaKnVTmhLOIYhw86pSW', 'ciao', 'ciao', '2026-07-30 22:42:13', '2026-07-30 22:42:13', 0, 'default.jpg', NULL),
(7, 'bella@video.com', '[]', '$2y$13$4jP74XPm10alBKgpZmJwYeFmjiCqGR8hFZXSd2vVfG7OEWfTQrQW6', 'bella', 'ciao', '2026-08-30 01:05:02', '2026-08-30 01:06:45', 1, 'default.jpg', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `video_link`, `descritpion`, `created_at`, `updated_at`, `user_id`, `premium_video`) VALUES
(2, 'Spiderman', 'https://www.youtube.com/embed/8TZMtslA3UY', 'spider il film di sempre', '2026-07-27 20:48:58', '2026-08-30 02:46:18', 1, 0),
(3, 'Jackie Chan', 'https://www.youtube.com/embed/cDYicbmUxhg', 'Jackie il super hero', '2026-07-27 20:58:59', '2026-08-30 02:45:39', 1, 0),
(29, 'Faunutland', 'https://www.youtube.com/embed/j7pEJtGXhhI', 'Faunutland | Family Fantasy Adventure | Free Movie', '2026-08-30 01:09:00', '2026-08-30 01:31:50', 7, 1),
(5, 'Spiderman 4', 'https://www.youtube.com/embed/62bIsvRcPv0', 'last film in the cinema', '2026-07-27 22:16:39', '2026-08-29 22:45:58', 1, 1),
(6, 'Avatar', 'https://www.youtube.com/embed/Z9lvyEXdXLQ', 'Avatar: Fire and Ash', '2026-07-28 23:02:25', '2026-08-30 02:41:31', 2, 1),
(11, 'Dragon Ball Z', 'https://www.youtube.com/embed/cok5yqXMuOI', 'Dragon Ball Z: Frieza Saga - Multiverse | Epic Action Short Film', '2026-07-29 00:16:08', '2026-08-30 02:41:34', 4, 0),
(10, 'dragon ball', 'https://www.youtube.com/embed/jKpvMDi-kYw', 'Dragon Ball | Episode 1 | VF | ADN', '2026-07-29 00:14:09', '2026-08-29 22:44:59', 4, 0),
(12, 'The Warrior Who Defied Fate', 'https://www.youtube.com/embed/fX2zDaJ2Gjk', 'The Warrior Who Defied Fate | Full Fantasy Adventure Movie in English', '2026-07-29 00:17:03', '2026-08-30 02:41:37', 4, 0),
(13, 'THE WOLF CHILD', 'https://www.youtube.com/embed/yxQWqnuAcRQ', 'THE WOLF CHILD - Film completo francese - Famiglia - HD - 1080', '2026-07-29 00:19:06', '2026-08-30 02:41:35', 4, 1),
(14, 'Wonder Woman', 'https://www.youtube.com/embed/u1NlmFa0-68', 'Wonder Woman 1984 | Young Diana Takes on The Amazon Games | Warner Bros. Entertainment', '2026-07-29 00:20:49', '2026-08-30 01:57:38', 4, 1),
(15, 'Swab Battle', 'https://www.youtube.com/embed/YaFg-73TmAI', 'The Great Cotton Swab Battle 🐜 Minuscule Movie Clip 🎬🍿', '2026-07-29 00:23:34', '2026-07-29 00:23:34', 4, 1),
(16, 'Tomb Raider                                       ', 'https://www.youtube.com/embed/Q-OK4s487RY', 'Tomb Raider (2001) Movie | Angelina Jolie, Daniel Craig | Review and Reaction', '2026-07-29 00:33:51', '2026-08-30 01:57:42', 3, 0),
(22, 'AVATAR', 'https://www.youtube.com/embed/M8To7iorkxQ', 'AVATAR Full Movie 2025: Pandora World | Superhero FXL Fantasy Movies 2025 in English (Game Movie)', '2026-07-30 15:11:06', '2026-08-29 23:32:41', 2, 0),
(17, 'Danger Woman 2', 'https://www.youtube.com/embed/0f_v67TtQhg', 'Danger Woman 2 : Angelina Jolie | New Action Movie 2025 | Full Movie | 4K Ultra', '2026-07-29 00:37:29', '2026-07-29 00:37:29', 3, 0),
(21, 'DUNE', 'https://www.youtube.com/embed/zgCwEthqdv8', 'Les films DUNE en 25 minutes !', '2026-07-30 15:08:17', '2026-08-30 01:57:43', 2, 1),
(18, 'Cassandra', 'https://www.youtube.com/embed/ClJunEbFaZc', 'Cassandra | Angelina Jolie | New Fantasy Movie 2024 | Full Movie | 4K Ultra', '2026-07-29 00:39:47', '2026-08-30 01:57:48', 3, 1),
(19, 'WEAPONS', 'https://www.youtube.com/embed/Fq4SKEh4Xbk', 'WEAPONS : Angelina Jolie | New Action Movie Concept AI 2025 | Full Movie 4K Ultra', '2026-07-29 00:42:30', '2026-08-30 01:48:41', 3, 1),
(23, 'Arnold Schwarzenegger', 'https://www.youtube.com/embed/JDuKeXGORwM', 'He Walked Into A Movie… And The Action Became Real | Arnold Schwarzenegger | Full Action Movie', '2026-07-30 15:13:58', '2026-08-30 01:41:25', 2, 0),
(25, 'Harry Potter', 'https://www.youtube.com/embed/NWoQz0HtQGU', 'Harry Potter Films 1-8 Full Movie Series Recap Marathon', '2026-07-30 15:23:25', '2026-08-30 02:45:30', 2, 1),
(26, 'I Am Dragon', 'https://www.youtube.com/embed/YZ5zMnzo2Vk', 'I Am Dragon  | FULL FANTASY MOVIE | THE MOVIE ZONE', '2026-07-30 15:30:12', '2026-08-30 02:44:46', 1, 0),
(30, 'LEGION: Dawn of Empire', 'https://www.youtube.com/embed/G-G51TQBHzE', 'LEGION: Dawn of Empire | 2026 Full Movie | English | Sci-Fi | Action | 4K', '2026-08-30 01:38:44', '2026-08-30 01:38:44', 1, 0),
(31, 'Ben Kingsley In MYSTERY OF THE HEALER', 'https://www.youtube.com/embed/U_1v7GXYbzU', 'Ben Kingsley In MYSTERY OF THE HEALER - Hollywood Free Movie | Full Action Adventure English Movie', '2026-08-30 01:46:11', '2026-08-30 01:46:11', 2, 1),
(32, 'Action Movie', 'https://www.youtube.com/embed/X5W5SqQaZ7k', 'Official New 2026 Action Movie Full Movie English Hollywood Action Movies 2026 - HD', '2026-08-30 01:48:02', '2026-08-30 02:45:02', 2, 0),
(33, 'Dragon Ball Z', 'https://www.youtube.com/embed/Dx4UrPUVpzM', 'Dragon Ball Z - Il Film (2026) | Scontro tra Leggende Super Saiyan | Teaser Trailer', '2026-08-30 01:50:05', '2026-08-30 01:57:29', 2, 1),
(34, 'Lara Croft: Tomb Raider', 'https://www.youtube.com/embed/PTS_900qXwU', 'Lara Croft: Tomb Raider 2001 Full Movie | Action/Adventure | Angelina Jolie, Jon Voight | HD Movie', '2026-08-30 01:53:24', '2026-08-30 01:53:24', 3, 0),
(35, 'The Owl Woman', 'https://www.youtube.com/embed/ldwmSaJSNoM', 'The Owl Woman : New Action Movie 2025 | Angelina Jolie | Full Movie | 4K Ultra #actionmovies', '2026-08-30 01:54:58', '2026-08-30 02:42:50', 3, 1),
(36, 'Rise of the Tomb Raider Gameplay Story', 'https://www.youtube.com/embed/BUrTK_Qxii8', 'Rise of the Tomb Raider Gameplay Story – Fanmade Cutscenes Edit [ENG] | FullHDvideos4me', '2026-08-30 01:56:54', '2026-08-30 01:57:14', 3, 0),
(37, 'Kena: Bridge of Spirits', 'https://www.youtube.com/embed/SLahFiAo6bY', 'Kena: Bridge of Spirits - Full Movie (ALL CUTSCENES w/ SUBTITLES) [1080p 60FPS HD]', '2026-08-30 02:04:03', '2026-08-30 02:04:03', 1, 0),
(38, 'Kung Fu Panda', 'https://www.youtube.com/embed/g6VJUi6KuKY', 'Po\'s Funniest Training Scenes | Kung Fu Panda Movies | Family Flicks', '2026-08-30 02:06:14', '2026-08-30 02:06:14', 1, 1),
(39, 'SONIC', 'https://www.youtube.com/embed/HK6_l3xjPBg', 'SONIC Vs ROBOTNIK Best Action Scenes 4K ᴴᴰ', '2026-08-30 02:07:10', '2026-08-30 02:07:10', 1, 0),
(40, 'The Boss Baby\'s', 'https://www.youtube.com/embed/YU6sRWdzEMc', 'The Boss Baby\'s Best Scenes', '2026-08-30 02:09:07', '2026-08-30 02:09:07', 1, 1),
(41, 'Inside Out 2', 'https://www.youtube.com/embed/O8XIYWOaYC4', 'Inside Out 2 Full Movie 2024 || Maya Hawke, Adèle Exarchopoulos, Tony Hale - Facts & Review', '2026-08-30 02:10:35', '2026-08-30 02:10:35', 1, 1),
(42, 'Dwayne Johnson', 'https://www.youtube.com/embed/gFiptJvLsk4', 'Dwayne Johnson, Gal Gadot e Ryan Reynolds in THE BURGLARS - Film d\'azione di Hollywood gratuito i...', '2026-08-30 02:12:34', '2026-08-30 02:13:01', 1, 0),
(43, 'Action Adventure 2026', 'https://www.youtube.com/embed/6KAi-Qn-qeA', '🎬 Hollywood Action Adventure 2026 | Full English Movie with Non Stop Action Scenes', '2026-08-30 02:14:56', '2026-08-30 02:14:56', 1, 0),
(44, 'Anunnaki', 'https://www.youtube.com/embed/1ACAvOhVJEw', 'Film Anunnaki | Film completo sugli Anunnaki in italiano | Fantascienza [Film I.A.]', '2026-08-30 02:16:15', '2026-08-30 02:16:15', 1, 1),
(45, 'Azione Hit', 'https://www.youtube.com/embed/Yc7OFTVjOJg', '2025 Azione Hit! Le forze speciali fanno irruzione in una base terroristica, salvano un compagno di', '2026-08-30 02:17:49', '2026-08-30 02:17:49', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `video_user`
--

DROP TABLE IF EXISTS `video_user`;
CREATE TABLE IF NOT EXISTS `video_user` (
  `video_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`video_id`,`user_id`),
  KEY `IDX_8A048B9529C1004E` (`video_id`),
  KEY `IDX_8A048B95A76ED395` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `video_user`
--

INSERT INTO `video_user` (`video_id`, `user_id`) VALUES
(2, 2),
(2, 4),
(3, 2),
(6, 2),
(6, 4),
(10, 4),
(11, 4),
(12, 2),
(13, 2),
(13, 4),
(16, 3),
(16, 4),
(18, 4),
(19, 2),
(21, 3),
(22, 4),
(25, 4),
(29, 7),
(33, 3),
(35, 3),
(36, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
