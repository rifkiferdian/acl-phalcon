-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 13, 2017 at 05:55 AM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.6.23-1+deprecated+dontuse+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acl_phalcon`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE `acl` (
  `id` int(11) NOT NULL,
  `controller` varchar(32) DEFAULT NULL,
  `action` varchar(32) DEFAULT NULL,
  `parent` int(128) NOT NULL DEFAULT '0',
  `label_menu` varchar(128) DEFAULT NULL,
  `child` varchar(128) DEFAULT NULL,
  `usergroup_id` varchar(128) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `except_user` varchar(128) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='-manajemen hak akses user,usergroup terhadap modul sesuai hak akses user nya';

--
-- Dumping data for table `acl`
--

INSERT INTO `acl` (`id`, `controller`, `action`, `parent`, `label_menu`, `child`, `usergroup_id`, `icon`, `except_user`, `aktif`) VALUES
(22, 'acl', '', 0, 'Access Control List', '', ',1,', 'fa-cogs', '', 'Y'),
(81, 'adminsetup', 'webGroup', 0, 'Usergroup', '', ',1,', 'fa-folder-o', '', 'Y'),
(136, 'test', 'menu', 0, 'contoh Menu', NULL, ',1,3,2,', 'fa-folder-o', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `ref_sys_usergroup`
--

CREATE TABLE `ref_sys_usergroup` (
  `id` int(2) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `deskripsi` text,
  `aktif` enum('Y','N') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_sys_usergroup`
--

INSERT INTO `ref_sys_usergroup` (`id`, `nama`, `deskripsi`, `aktif`, `created`) VALUES
(1, 'Admin', '', 'Y', '2017-05-09 23:45:57'),
(3, 'user', 'bla-bla', 'Y', '2017-05-09 23:46:53'),
(2, 'Karyawan', 'bla-bla', 'Y', '2017-05-09 23:46:43');

-- --------------------------------------------------------

--
-- Table structure for table `ref_user`
--

CREATE TABLE `ref_user` (
  `id` int(11) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `usergroup` varchar(16) NOT NULL,
  `passwd` char(128) DEFAULT NULL,
  `nama` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_user`
--

INSERT INTO `ref_user` (`id`, `uid`, `usergroup`, `passwd`, `nama`, `email`, `aktif`) VALUES
(1, 'admin', ',1,2,3,', '21232f297a57a5a743894a0e4a801fc3', 'maman2', 'admin@ll.com', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_sys_usergroup`
--
ALTER TABLE `ref_sys_usergroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_user`
--
ALTER TABLE `ref_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acl`
--
ALTER TABLE `acl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;
--
-- AUTO_INCREMENT for table `ref_sys_usergroup`
--
ALTER TABLE `ref_sys_usergroup`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121213;
--
-- AUTO_INCREMENT for table `ref_user`
--
ALTER TABLE `ref_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
