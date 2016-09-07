/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100113
Source Host           : localhost:3306
Source Database       : jsla

Target Server Type    : MYSQL
Target Server Version : 100113
File Encoding         : 65001

Date: 2016-09-07 23:51:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for meta_file
-- ----------------------------
DROP TABLE IF EXISTS `meta_file`;
CREATE TABLE `meta_file` (
  `File_ID` varchar(9) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `SubjectIID` varchar(9) NOT NULL,
  `Description` text NOT NULL,
  `UploadedBy` varchar(9) NOT NULL,
  `UploadedTo` varchar(9) NOT NULL,
  `FilePath` text NOT NULL,
  PRIMARY KEY (`File_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of meta_file
-- ----------------------------

-- ----------------------------
-- Table structure for tblquizinfo
-- ----------------------------
DROP TABLE IF EXISTS `tblquizinfo`;
CREATE TABLE `tblquizinfo` (
  `QuizID` varchar(9) NOT NULL,
  `QuizTitle` varchar(255) DEFAULT NULL,
  `SubjectID` varchar(9) DEFAULT NULL,
  `TeacherID` varchar(9) DEFAULT NULL,
  `quizType` varchar(255) DEFAULT NULL,
  `Year` varchar(255) DEFAULT NULL,
  `SectionID` varchar(9) DEFAULT NULL,
  `No.ofItem` int(11) DEFAULT NULL,
  `Points` int(11) DEFAULT NULL,
  PRIMARY KEY (`QuizID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblquizinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_accounts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_accounts`;
CREATE TABLE `tbl_accounts` (
  `UserId` varchar(9) NOT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `AccType` varchar(25) DEFAULT NULL,
  `ReferenceId` varchar(255) DEFAULT NULL,
  `Attempts` int(11) DEFAULT '0',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_accounts
-- ----------------------------
INSERT INTO `tbl_accounts` VALUES ('123123123', '123123123', 'Student', '123123123', '0');
INSERT INTO `tbl_accounts` VALUES ('202020', '222222', 'Teacher', null, '0');
INSERT INTO `tbl_accounts` VALUES ('303030', '333333', 'Admin', null, '0');

-- ----------------------------
-- Table structure for tbl_course
-- ----------------------------
DROP TABLE IF EXISTS `tbl_course`;
CREATE TABLE `tbl_course` (
  `CourseID` varchar(9) NOT NULL,
  `Course` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_course
-- ----------------------------
INSERT INTO `tbl_course` VALUES ('1', 'ICT', null);

-- ----------------------------
-- Table structure for tbl_homeroom
-- ----------------------------
DROP TABLE IF EXISTS `tbl_homeroom`;
CREATE TABLE `tbl_homeroom` (
  `HomeRoomID` varchar(9) NOT NULL,
  `SectionID` varchar(9) DEFAULT NULL,
  `Year` varchar(25) DEFAULT NULL,
  `Adviser` varchar(255) DEFAULT NULL,
  `Room` varchar(5) DEFAULT NULL,
  `No.ofStudent` int(11) DEFAULT NULL,
  PRIMARY KEY (`HomeRoomID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_homeroom
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_homework
-- ----------------------------
DROP TABLE IF EXISTS `tbl_homework`;
CREATE TABLE `tbl_homework` (
  `Homework_Id` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `Teacher_Id` varchar(9) DEFAULT NULL,
  `Section_Id` int(11) DEFAULT NULL,
  `Subject_Id` int(11) DEFAULT NULL,
  `DatePosted` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `DateDue` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Homework_Id`),
  KEY `Teacher_Id` (`Teacher_Id`),
  KEY `Subject_Id` (`Subject_Id`),
  KEY `Section_Id` (`Section_Id`),
  CONSTRAINT `tbl_homework_ibfk_1` FOREIGN KEY (`Teacher_Id`) REFERENCES `tbl_teachers` (`Teacher_Id`),
  CONSTRAINT `tbl_homework_ibfk_3` FOREIGN KEY (`Subject_Id`) REFERENCES `tbl_subject` (`Subject_ID`),
  CONSTRAINT `tbl_homework_ibfk_4` FOREIGN KEY (`Section_Id`) REFERENCES `tbl_sections` (`Section_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_homework
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_notes
-- ----------------------------
DROP TABLE IF EXISTS `tbl_notes`;
CREATE TABLE `tbl_notes` (
  `Note_ID` varchar(9) NOT NULL,
  `Subject_ID` int(11) DEFAULT NULL,
  `Stud_ID` varchar(9) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Content` text,
  PRIMARY KEY (`Note_ID`),
  KEY `Subject_ID` (`Subject_ID`),
  CONSTRAINT `tbl_notes_ibfk_1` FOREIGN KEY (`Subject_ID`) REFERENCES `tbl_subject` (`Subject_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_notes
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sections
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sections`;
CREATE TABLE `tbl_sections` (
  `Section_ID` int(11) NOT NULL,
  `Section` varchar(255) DEFAULT NULL,
  `Course_ID` varchar(255) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  PRIMARY KEY (`Section_ID`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `tbl_sections_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `tbl_course` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_sections
-- ----------------------------
INSERT INTO `tbl_sections` VALUES ('1', 'Integrity', '1', '9');
INSERT INTO `tbl_sections` VALUES ('2', 'Fortitude', '1', '10');
INSERT INTO `tbl_sections` VALUES ('3', 'Piety', '1', '10');

-- ----------------------------
-- Table structure for tbl_student
-- ----------------------------
DROP TABLE IF EXISTS `tbl_student`;
CREATE TABLE `tbl_student` (
  `Stud_ID` varchar(9) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `Section_ID` int(11) NOT NULL,
  `Avatar` blob,
  PRIMARY KEY (`Stud_ID`),
  KEY `Section_ID` (`Section_ID`),
  CONSTRAINT `tbl_student_ibfk_1` FOREIGN KEY (`Section_ID`) REFERENCES `tbl_sections` (`Section_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_student
-- ----------------------------
INSERT INTO `tbl_student` VALUES ('#####-###', 'aga', 'gaga', 'gaga', '1', null);
INSERT INTO `tbl_student` VALUES ('000000000', 'Ortiz', 'Patricia', null, '1', null);
INSERT INTO `tbl_student` VALUES ('101010101', 'Balabis', 'Joyce', 'Mir', '1', null);
INSERT INTO `tbl_student` VALUES ('123123123', 'Okura', 'Ryota', 'Borja', '1', null);

-- ----------------------------
-- Table structure for tbl_subject
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subject`;
CREATE TABLE `tbl_subject` (
  `Subject_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Subject_Code` varchar(255) DEFAULT NULL,
  `Subject_Name` varchar(25) DEFAULT NULL,
  `Year` varchar(25) DEFAULT NULL,
  `CourseID` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`Subject_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_subject
-- ----------------------------
INSERT INTO `tbl_subject` VALUES ('1', null, 'Oral Communication', null, null);
INSERT INTO `tbl_subject` VALUES ('2', null, 'Earth & Life Science', null, null);
INSERT INTO `tbl_subject` VALUES ('3', null, 'Earth Science', null, null);
INSERT INTO `tbl_subject` VALUES ('4', null, 'Literature', null, null);
INSERT INTO `tbl_subject` VALUES ('5', null, 'Multimedia', null, null);
INSERT INTO `tbl_subject` VALUES ('6', null, 'Programming', null, null);
INSERT INTO `tbl_subject` VALUES ('7', null, 'Animation', null, null);
INSERT INTO `tbl_subject` VALUES ('8', null, '21st Century', null, null);
INSERT INTO `tbl_subject` VALUES ('9', null, 'Physical Education', null, null);
INSERT INTO `tbl_subject` VALUES ('10', null, 'Business Math', null, null);
INSERT INTO `tbl_subject` VALUES ('11', null, 'General Math', null, null);
INSERT INTO `tbl_subject` VALUES ('12', null, 'Pre-Calculus', null, null);
INSERT INTO `tbl_subject` VALUES ('13', null, 'Differential Calculus', null, null);

-- ----------------------------
-- Table structure for tbl_teachers
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teachers`;
CREATE TABLE `tbl_teachers` (
  `Teacher_Id` varchar(9) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `MiddleInitial` varchar(3) DEFAULT NULL,
  `Avatar` varchar(255) DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  PRIMARY KEY (`Teacher_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_teachers
-- ----------------------------
INSERT INTO `tbl_teachers` VALUES ('202020', 'balabis', 'joyce', 'm', null, '');
INSERT INTO `tbl_teachers` VALUES ('303030', 'albania', 'eman', 'l', null, '');

-- ----------------------------
-- View structure for vw_studentinfo
-- ----------------------------
DROP VIEW IF EXISTS `vw_studentinfo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vw_studentinfo` AS SELECT
tbl_student.Stud_ID,
tbl_student.LastName,
tbl_student.FirstName,
tbl_student.MiddleName,
tbl_sections.Section,
tbl_course.Course,
tbl_sections.`Year`
FROM
tbl_student
INNER JOIN tbl_sections ON tbl_student.Section_ID = tbl_sections.Section_ID
INNER JOIN tbl_course ON tbl_sections.Course_ID = tbl_course.CourseID ;
SET FOREIGN_KEY_CHECKS=1;
