-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 22, 2015 at 07:00 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE IF NOT EXISTS `acl` (
  `access` varchar(20) NOT NULL,
`accessId` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `acl`
--

INSERT INTO `acl` (`access`, `accessId`) VALUES
('account-A', 24),
('account-CD', 27),
('account-D', 26),
('account-E', 25),
('admin-A', 8),
('admin-D', 10),
('admin-E', 9),
('email-A', 1),
('email-D', 3),
('email-E', 2),
('group-A', 4),
('group-AE', 22),
('group-D', 6),
('group-E', 5),
('group-RE', 23),
('repair-check', 20),
('send-B', 12),
('send-S', 11),
('sender-A', 13),
('sender-D', 15),
('sender-E', 14),
('sync-db', 7),
('theme-A', 16),
('theme-D', 18),
('theme-E', 17),
('unsub-dis', 19),
('view', 21);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(150) NOT NULL,
  `pin` int(4) NOT NULL,
  `last_activity` int(10) NOT NULL,
  `last_login` int(10) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `pin`, `last_activity`, `last_login`, `level`) VALUES
(1, 'admin', '90cefae3f2eb5027799cbe5d3f7cbd90', 1234, 1429729172, 1429728920, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_accounts`
--

CREATE TABLE IF NOT EXISTS `email_accounts` (
`id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` int(10) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `default` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `email_accounts`
--

INSERT INTO `email_accounts` (`id`, `email`, `date`, `admin_id`, `default`) VALUES
(1, 'google@cistoner.org', 1429719269, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
`id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `date` int(10) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `name`, `description`, `date`, `admin_id`) VALUES
(1, 'test', '', 1429719226, 1),
(2, 'test2', '', 1429719302, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_subscribers`
--

CREATE TABLE IF NOT EXISTS `group_subscribers` (
  `group_id` int(11) NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_subscribers`
--

INSERT INTO `group_subscribers` (`group_id`, `subscriber_id`, `date`) VALUES
(1, 1, 483655),
(1, 2, 93878459);

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE IF NOT EXISTS `keys` (
  `admin_id` int(11) NOT NULL,
  `api_key` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
`id` int(11) NOT NULL,
  `data` text NOT NULL,
  `filename` text NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `data`, `filename`, `time`) VALUES
(1, 'LOGIN FAILURE', '/Users/minhazav/Sites/mail-management-tool/libs/log.php', 1429718814),
(2, '[ajaxserver] PERMISSION BREACH ATTEMPT FOR:ADD_EMAIL USER:1', '/Users/minhazav/Sites/mail-management-tool/libs/log.php', 1429718873),
(3, 'SESSION EXPIRED FOR USER ID 1', '/Users/minhazav/Sites/mail-management-tool/libs/log.php', 1429722065),
(4, 'LOGIN FAILURE', '/Users/minhazav/Sites/mail-management-tool/libs/log.php', 1429722066),
(5, 'SESSION EXPIRED FOR USER ID 1', '/Users/minhazav/Sites/mail-management-tool/libs/log.php', 1429725342),
(6, 'SESSION EXPIRED FOR USER ID 1', '/Users/minhazav/Sites/mail-management-tool/libs/log.php', 1429728913);

-- --------------------------------------------------------

--
-- Table structure for table `mails`
--

CREATE TABLE IF NOT EXISTS `mails` (
`id` int(11) NOT NULL,
  `data` text NOT NULL,
  `date` int(10) NOT NULL,
  `recievers` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `email_account_id` int(11) NOT NULL,
  `sucessful` int(11) NOT NULL DEFAULT '0',
  `failed` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE IF NOT EXISTS `subscribers` (
`id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `date`) VALUES
(1, 'abc@gmail.com', 1429718989),
(2, 'bbb@gmail.com', 1429719482),
(4, 'minhazav@gmail.com', 1429719677);

-- --------------------------------------------------------

--
-- Table structure for table `useraccess`
--

CREATE TABLE IF NOT EXISTS `useraccess` (
  `userId` int(11) NOT NULL,
  `accessId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useraccess`
--

INSERT INTO `useraccess` (`userId`, `accessId`) VALUES
(1, 24),
(1, 27),
(1, 26),
(1, 25),
(1, 8),
(1, 10),
(1, 9),
(1, 1),
(1, 3),
(1, 2),
(1, 4),
(1, 22),
(1, 6),
(1, 5),
(1, 23),
(1, 20),
(1, 12),
(1, 11),
(1, 13),
(1, 15),
(1, 14),
(1, 7),
(1, 16),
(1, 18),
(1, 17),
(1, 19),
(1, 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acl`
--
ALTER TABLE `acl`
 ADD PRIMARY KEY (`accessId`), ADD UNIQUE KEY `access` (`access`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `email_accounts`
--
ALTER TABLE `email_accounts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mails`
--
ALTER TABLE `mails`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acl`
--
ALTER TABLE `acl`
MODIFY `accessId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `email_accounts`
--
ALTER TABLE `email_accounts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `mails`
--
ALTER TABLE `mails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
