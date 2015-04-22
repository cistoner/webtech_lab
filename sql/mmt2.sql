-- phpMyAdmin SQL Dump
-- version 4.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2015 at 11:30 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

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
-- Table structure for table `template`
--

CREATE TABLE IF NOT EXISTS `template` (
`id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `content`) VALUES
(2, 'asdas', 'hi{{@name}}<div>enter this contest&nbsp;</div><div>link{{@abhi-link}}</div>'),
(3, 'abhi', '<span style="font-style: normal;">hi </span><i>{{@name}}</i><div style="font-style: normal;"><br></div><div style="font-style: normal;">go to this link{{@link}}</div>');

-- --------------------------------------------------------

--
-- Table structure for table `template_parameter`
--

CREATE TABLE IF NOT EXISTS `template_parameter` (
`id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `template_parameter`
--

INSERT INTO `template_parameter` (`id`, `template_id`, `name`) VALUES
(2, 2, 'name'),
(3, 2, 'abhi-link'),
(4, 3, 'name'),
(5, 3, 'link');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `template`
--
ALTER TABLE `template`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_parameter`
--
ALTER TABLE `template_parameter`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `template_parameter`
--
ALTER TABLE `template_parameter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
