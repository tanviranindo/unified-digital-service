-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2022 at 02:12 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uds-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `file_id` bigint(20) NOT NULL,
  `directory` bit(1) DEFAULT NULL,
  `file` bit(1) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `last_modified_date` date DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(23);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `enabled`, `name`, `password`, `surname`, `username`) VALUES
(3, 'admin@gmail.com', b'1', 'Admin', '$2a$10$cG2sxVpv6HriDnx6uzF8/u1sxtz6dCMo6KxMJEIL1Ge5CMi/5MLdq', 'Admin', 'admin'),
(4, 'user1@gmail.com', b'1', 'User1', '$2a$10$YKASf8DngJCf8B4T1080BeENGUoVjHWMq3Y5YmOWxPj0uOHlCrFlG', 'User1', 'user1'),
(5, 'user2@gmail.com', b'1', 'User2', '$2a$10$W3XjN28CxFRibRD5eNAND.HA/RtzKgZ80HPBqTyQmw0DxvEaBBdRa', 'User2', 'user2'),
(6, 'user3@gmail.com', b'1', 'User3', '$2a$10$whPG6hon7x5m9k0owmB8eeym3QqasNzSeEvDp41uxyID9ayH19A22', 'User3', 'user3'),
(7, 'user4@gmail.com', b'1', 'User4', '$2a$10$qfm7SlaKK9KFISXg0/BdKemQrj7c9UzpRWN2HitAho8I/60gdGl5a', 'User4', 'user4'),
(8, 'user5@gmail.com', b'1', 'User5', '$2a$10$.jrEs9v0.cdjl0ESqhRyS.XhxpTvI2s1NoS2WKp1QFhRuW2iFjr5i', 'User5', 'user5'),
(9, 'user6@gmail.com', b'1', 'User6', '$2a$10$Vf19elSrQLgjceRcMo1TLuopTSryCtcN21Qa1HABQ5BVFAG/NWpXu', 'User6', 'user6'),
(10, 'user7@gmail.com', b'1', 'User7', '$2a$10$IB50RF5KMJM41WfE..SGAuvOqW/OsYMPHpGMXI8sXNfmsfB4sKOdq', 'User7', 'user7'),
(11, 'user8@gmail.com', b'1', 'User8', '$2a$10$WAlnZYKil8W6tdNNKFktFehSLNHSNtREuCj.dAyB1uQu9gsZsLKfO', 'User8', 'user8'),
(12, 'user9@gmail.com', b'1', 'User9', '$2a$10$8LM7Dgd5.OwbbtIccwFinuorJ.gGLNzmyrTQG9pWq67x42rbz55dG', 'User9', 'user9'),
(13, 'user10@gmail.com', b'1', 'User10', '$2a$10$aK2171X0B0NDkJDA8UR3PObtfY0HaqKJoMgM729ocG7p.g/tFKCOe', 'User10', 'user10'),
(14, 'user11@gmail.com', b'1', 'User11', '$2a$10$wmT/5OH9hcaG9xRZ9se9p.eYhkdA7gmD9oJwACHPKZZCJExDy6XPe', 'User11', 'user11'),
(15, 'user12@gmail.com', b'1', 'User12', '$2a$10$0dGqmLgR2hbjIegbnDykXeByZHqG5U34z22RLaVr6ytD6je8OgnCW', 'User12', 'user12'),
(16, 'user13@gmail.com', b'1', 'User13', '$2a$10$PYNrQyMdUw73EQnJucxw5er/1z5V53hMA.o/UeObUU3jEeVVXZq.a', 'User13', 'user13'),
(17, 'user14@gmail.com', b'1', 'User14', '$2a$10$6ZMwBWw5XPX4Z7PH.2miN.koxikROeC0AaadxIIMHn/y5ub24RIDO', 'User14', 'user14'),
(18, 'user15@gmail.com', b'1', 'User15', '$2a$10$eyWGVZlQOWUOlAYRjtrO1ea0irTQajjq/1EfoLCxevejb73cPz5Au', 'User15', 'user15'),
(19, 'user16@gmail.com', b'1', 'User16', '$2a$10$0ePGVpVLgieLIkeYnnghB.RxD2yPLANYkSb0/v6WnhBfE1kmUP/M6', 'User16', 'user16'),
(20, 'user17@gmail.com', b'1', 'User17', '$2a$10$birS6RnfQXTg6oGYF1JflOIse6Vrh30no998cPgzR9jig/HqI5Alm', 'User17', 'user17'),
(21, 'user18@gmail.com', b'1', 'User18', '$2a$10$5d2PxpfJ0AblVHDAc8iv/uejUFJNOWNPUUmLT3..oM48yDKqbpeau', 'User18', 'user18'),
(22, 'user19@gmail.com', b'1', 'User19', '$2a$10$GWWMlSgY03tzsjFKRtDJ3.EQENGmAMCUZHuihANtcMjFbRJQSp10K', 'User19', 'user19');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  ADD KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
