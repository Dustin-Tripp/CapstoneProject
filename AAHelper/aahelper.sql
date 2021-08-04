-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306

-- Generation Time: Apr 23, 2021 at 09:49 PM

-- Generation Time: Apr 21, 2021 at 12:20 AM

-- Server version: 8.0.22
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aahelper`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
CREATE TABLE IF NOT EXISTS `advisor` (
  `advid` varchar(9) NOT NULL DEFAULT '',
  `fname` varchar(20) NOT NULL COMMENT 'First name of advisor',
  `lname` varchar(30) NOT NULL COMMENT 'Last name of advisor',
  `email` varchar(50) NOT NULL COMMENT 'Email address tied to this account',
  `phone` varchar(10) NOT NULL COMMENT 'Phone number of advisor',
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`advid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`advid`, `fname`, `lname`, `email`, `phone`, `password`) VALUES
('002111333', 'George', 'Li', 'zli2@semo.edu', '8273641743', 'Test@123'),
('002111444', 'Ziping', 'Liu', 'zliu@semo.edu', '4832753859', 'Test@123');

-- --------------------------------------------------------

--
-- Table structure for table `coreq`
--

DROP TABLE IF EXISTS `coreq`;
CREATE TABLE IF NOT EXISTS `coreq` (
  `courseid` varchar(7) NOT NULL,
  `coreqid` varchar(7) NOT NULL,
  PRIMARY KEY (`courseid`,`coreqid`),
  KEY `coreqid` (`coreqid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coreq`
--

INSERT INTO `coreq` (`courseid`, `coreqid`) VALUES

('CS495', 'CS499');

('CS380', 'CS350'),
('CS390', 'CS350'),
('CS445', 'CS350'),
('CS220', 'MATH110');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `courseid` varchar(7) NOT NULL COMMENT ' Primary key for the table. Unique to each class',
  `classname` varchar(50) NOT NULL COMMENT ' Name of the class',
  `units` int NOT NULL COMMENT ' Number of units for this class',
  `term` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseid`, `classname`, `units`, `term`) VALUES

('AC221', 'Principles of Accounting I', 3, '111'),
('AC222', 'Principles of Accounting II', 3, '111'),
('CF120', 'The Child: Conception to Adulthood', 3, '110'),
('CS101', 'Python Programming', 3, '110'),
('CS220', 'Intro to CS I', 3, '111'),
('CS225', 'Intro to CS II', 4, '111'),
('CS300', 'Computer Science III', 3, '010'),
('CS363', 'Web Programming', 3, '011'),
('CS440', 'Database', 3, '100'),
('CS445', 'Software Engineering', 3, '100'),
('CS495', 'Senior Seminar', 1, '110'),
('CS499', 'Capstone Experience', 3, '110'),
('DS104', 'Interior Design', 3, '110'),
('EC215', 'Principles of Microeconomics', 3, '111'),
('EC225', 'Principles of Macroeconomics', 3, '111'),
('EN100', 'English Composition', 3, '111'),
('EN140', 'Rhet and Crit Thinking', 3, '100'),
('FN235', 'Nutrition for Health', 3, '110'),
('GO150', 'Earth Science Envir Hazards', 4, '011'),
('IS145', 'Intro to Web Development', 3, '111'),
('IS175', 'Computer Information Systems I', 3, '110'),
('IS245', 'Web Development and Security', 3, '010'),
('IS275', 'Computer Information Systems II', 3, '101'),
('IS299', 'Security in Data Protocols', 3, '100'),
('IS340', 'Information Technology', 3, '010'),
('IS360', 'Mobile Application Development', 3, '010'),
('IS420', 'Human Computer Interaction', 3, '100'),
('IS440', 'Web Design for Elec Commerce', 3, '111'),
('IS448', 'IS/IT Project Management', 3, '110'),
('IS465', 'Management Support Systems', 3, '100'),
('IS575', 'IS/IT Strategy and Management', 3, '110'),
('IU315', 'Ethics in the Cyber World', 3, '111'),
('LI220', 'Fiction and the Human Experience', 3, '111'),
('MA223', 'Probability and Statistics', 3, '110'),
('MATH151', 'Applied Calculus I', 3, '111'),
('MK301', 'Principles of Marketing', 3, '111'),
('OS200', 'Survey of Social Sciences', 3, '110'),
('PS104', 'Comp Pol Systems', 3, '111'),
('SC107', 'Online Oral Presentations', 3, '111'),
('UI100', 'First Year Seminar', 1, '111'),
('US107', 'American History II', 3, '111');

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
CREATE TABLE IF NOT EXISTS `major` (
  `majorid` varchar(4) NOT NULL,
  `courseid` varchar(7) NOT NULL,
  `required` varchar(12) NOT NULL,
  PRIMARY KEY (`majorid`,`courseid`),
  KEY `courseid` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`majorid`, `courseid`, `required`) VALUES

('CIS', 'AC222', 'ELECTIVE'),
('CIS', 'CF120', 'ELECTIVE'),
('CIS', 'CS101', 'REQUIRED'),
('CIS', 'CS300', 'REQUIRED'),
('CIS', 'CS440', 'REQUIRED'),
('CIS', 'CS445', 'REQUIRED'),
('CIS', 'CS495', 'REQUIRED'),
('CIS', 'CS499', 'REQUIRED'),
('CIS', 'DS104', 'ELECTIVE'),
('CIS', 'EC215', 'ELECTIVE'),
('CIS', 'EC225', 'ELECTIVE'),
('CIS', 'EN100', 'REQUIRED'),
('CIS', 'EN140', 'ELECTIVE'),
('CIS', 'FN235', 'ELECTIVE'),
('CIS', 'GO150', 'ELECTIVE'),
('CIS', 'IS145', 'REQUIRED'),
('CIS', 'IS175', 'REQUIRED'),
('CIS', 'IS245', 'REQUIRED'),
('CIS', 'IS275', 'REQUIRED'),
('CIS', 'IS299', 'REQUIRED'),
('CIS', 'IS340', 'REQUIRED'),
('CIS', 'IS360', 'REQUIRED'),
('CIS', 'IS420', 'REQUIRED'),
('CIS', 'IS440', 'REQUIRED'),
('CIS', 'IS448', 'REQUIRED'),
('CIS', 'IS465', 'REQUIRED'),
('CIS', 'IS575', 'REQUIRED'),
('CIS', 'IU315', 'REQUIRED'),
('CIS', 'LI220', 'REQUIRED'),
('CIS', 'MA223', 'REQUIRED'),
('CIS', 'MK301', 'ELECTIVE'),
('CIS', 'OS200', 'ELECTIVE'),
('CIS', 'PS104', 'ELECTIVE'),
('CIS', 'SC107', 'ELECTIVE'),
('CIS', 'UI100', 'ELECTIVE'),
('CIS', 'US107', 'ELECTIVE');


-- --------------------------------------------------------

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
CREATE TABLE IF NOT EXISTS `prereq` (
  `courseid` varchar(7) NOT NULL,
  `prereqid` varchar(7) NOT NULL,
  PRIMARY KEY (`courseid`,`prereqid`),
  KEY `prereqid` (`prereqid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prereq`
--

INSERT INTO `prereq` (`courseid`, `prereqid`) VALUES

('AC222', 'AC221'),
('CS220', 'CS101'),
('CS300', 'CS220'),
('IS299', 'CS220'),
('CS300', 'CS225'),
('CS440', 'CS225'),
('CS445', 'CS225'),
('CS499', 'CS225'),
('IS360', 'CS225'),
('IS420', 'CS225'),
('IU315', 'CS225'),
('IS465', 'CS440'),
('CS499', 'CS445'),
('EC225', 'EC215'),
('EN140', 'EN100'),
('LI220', 'EN100'),
('IS245', 'IS175'),
('IS275', 'IS175'),
('IS299', 'IS245'),
('IS420', 'IS245'),
('IS440', 'IS245'),
('IS340', 'IS275'),
('IS448', 'IS340'),
('IS575', 'IS340'),
('MA223', 'MATH151');
-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentid` varchar(9) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `major` varchar(4) NOT NULL COMMENT 'Major of student',
  `advid` varchar(9) NOT NULL,

  `startyear` varchar(4) NOT NULL,

  PRIMARY KEY (`studentid`),
  KEY `advid` (`advid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--


INSERT INTO `student` (`studentid`, `fname`, `lname`, `email`, `password`, `major`, `advid`, `startyear`) VALUES
('002405470', 'Dustin ', 'Tripp', 'dmtripp1s@semo.edu', 'Test@123', 'CS', '002111444', '2021'),
('002406078', 'Matthew', 'Moore', 'mdmoore5s@semo.edu', 'Test@123', 'CIS', '002111333', '2021');


-- --------------------------------------------------------

--
-- Table structure for table `studentcourse`
--

DROP TABLE IF EXISTS `studentcourse`;
CREATE TABLE IF NOT EXISTS `studentcourse` (
  `studentid` varchar(9) NOT NULL COMMENT 'Unique identifier for each registered professor, Primary Key',
  `courseid` varchar(7) NOT NULL COMMENT 'unique identifier part of a composite primary key',
  `grade` varchar(2) NOT NULL COMMENT 'the grade received by the student',
  `termtaken` varchar(5) NOT NULL COMMENT 'Which term the class was taken',
  `status` char(1) NOT NULL COMMENT 'character that describes the status of the class in relation to the student.',
  PRIMARY KEY (`studentid`,`courseid`),
  KEY `courseid` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentcourse`
--

INSERT INTO `studentcourse` (`studentid`, `courseid`, `grade`, `termtaken`, `status`) VALUES

('002406078', 'CS220', 'A-', '20101', 'C'),
('002406078', 'CS225', 'B', '20011', 'C'),
('002406078', 'CS363', 'B+', '20431', 'C'),
('002406078', 'MATH151', 'B+', '20131', 'C');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coreq`
--
ALTER TABLE `coreq`
  ADD CONSTRAINT `coreq_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `courses` (`courseid`),
  ADD CONSTRAINT `coreq_ibfk_2` FOREIGN KEY (`coreqid`) REFERENCES `courses` (`courseid`);

--
-- Constraints for table `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `major_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `courses` (`courseid`);

--
-- Constraints for table `prereq`
--
ALTER TABLE `prereq`
  ADD CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`courseid`) REFERENCES `courses` (`courseid`),
  ADD CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereqid`) REFERENCES `courses` (`courseid`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`advid`) REFERENCES `advisor` (`advid`);

--
-- Constraints for table `studentcourse`
--
ALTER TABLE `studentcourse`
  ADD CONSTRAINT `studentcourse_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`),
  ADD CONSTRAINT `studentcourse_ibfk_2` FOREIGN KEY (`courseid`) REFERENCES `courses` (`courseid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
