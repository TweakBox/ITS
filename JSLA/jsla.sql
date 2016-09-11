/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : jsla

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-09-12 01:43:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_accounts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_accounts`;
CREATE TABLE `tbl_accounts` (
  `_id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_level` varchar(255) DEFAULT NULL,
  `attempts` int(11) DEFAULT '0',
  `reference_id` varchar(10) DEFAULT NULL,
  `oldpassword` varchar(255) DEFAULT 'true',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_accounts
-- ----------------------------
INSERT INTO `tbl_accounts` VALUES ('1', '1', 'Student', '0', '1', 'true');
INSERT INTO `tbl_accounts` VALUES ('2', '2', 'Student', '0', '2', 'true');
INSERT INTO `tbl_accounts` VALUES ('3', '3', 'Student', '0', '3', 'true');
INSERT INTO `tbl_accounts` VALUES ('4', '4', 'Student', '0', '4', 'true');
INSERT INTO `tbl_accounts` VALUES ('5', '5', 'Student', '0', '5', 'true');
INSERT INTO `tbl_accounts` VALUES ('6', '6', 'Student', '0', '6', 'true');
INSERT INTO `tbl_accounts` VALUES ('7', '7', 'Student', '0', '7', 'true');
INSERT INTO `tbl_accounts` VALUES ('8', '8', 'Student', '0', '8', 'true');
INSERT INTO `tbl_accounts` VALUES ('9', '9', 'Student', '0', '9', 'true');
INSERT INTO `tbl_accounts` VALUES ('10', '10', 'Student', '0', '10', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000001', '1', 'Teacher', '0', '1000000001', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000002', '2', 'Teacher', '0', '1000000002', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000003', '3', 'Teacher', '0', '1000000003', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000004', '4', 'Teacher', '0', '1000000004', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000005', '5', 'Teacher', '0', '1000000005', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000006', '6', 'Teacher', '0', '1000000006', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000007', '7', 'Teacher', '0', '1000000007', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000008', '8', 'Teacher', '0', '1000000008', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000009', '9', 'Teacher', '0', '1000000009', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000010', '10', 'Teacher', '0', '1000000010', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000011', '11', 'Teacher', '0', '1000000011', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000012', '12', 'Teacher', '0', '1000000012', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000013', '13', 'Teacher', '0', '1000000013', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000014', '14', 'Teacher', '0', '1000000014', 'true');
INSERT INTO `tbl_accounts` VALUES ('1000000015', '15', 'Teacher', '0', '1000000015', 'true');

-- ----------------------------
-- Table structure for tbl_announcements
-- ----------------------------
DROP TABLE IF EXISTS `tbl_announcements`;
CREATE TABLE `tbl_announcements` (
  `_id` int(11) NOT NULL,
  `DatePosted` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Poster` blob,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_announcements
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_branchinfo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_branchinfo`;
CREATE TABLE `tbl_branchinfo` (
  `_id` int(11) NOT NULL,
  `Branch` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_branchinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_classlist
-- ----------------------------
DROP TABLE IF EXISTS `tbl_classlist`;
CREATE TABLE `tbl_classlist` (
  `_id` int(11) NOT NULL,
  `Section_id` int(11) DEFAULT NULL,
  `Student_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_classlist
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_homeworkpassed
-- ----------------------------
DROP TABLE IF EXISTS `tbl_homeworkpassed`;
CREATE TABLE `tbl_homeworkpassed` (
  `_id` int(11) NOT NULL,
  `Homework_id` int(11) DEFAULT NULL,
  `Student_id` int(11) DEFAULT NULL,
  `ContentFile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_homeworkpassed
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_priviledge
-- ----------------------------
DROP TABLE IF EXISTS `tbl_priviledge`;
CREATE TABLE `tbl_priviledge` (
  `_id` int(11) NOT NULL,
  `Priviledge` varchar(255) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_priviledge
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_quizanswer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_quizanswer`;
CREATE TABLE `tbl_quizanswer` (
  `_id` int(11) NOT NULL,
  `Quiz_id` int(11) DEFAULT NULL,
  `Student_id` int(11) DEFAULT NULL,
  `Score` varchar(255) DEFAULT NULL,
  `Answers` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_quizanswer
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_quizcontent
-- ----------------------------
DROP TABLE IF EXISTS `tbl_quizcontent`;
CREATE TABLE `tbl_quizcontent` (
  `_id` int(11) NOT NULL,
  `Question` varchar(255) DEFAULT NULL,
  `CorrectAnswer` varchar(255) DEFAULT NULL,
  `QuestionType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_quizcontent
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_quizinfo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_quizinfo`;
CREATE TABLE `tbl_quizinfo` (
  `_id` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Class_id` int(11) DEFAULT NULL,
  `QuizType` varchar(255) DEFAULT NULL,
  `No.ofItem` varchar(255) DEFAULT NULL,
  `Points` varchar(255) DEFAULT NULL,
  `DatePosted` datetime DEFAULT NULL,
  `DateDue` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_quizinfo
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_sectioninfo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sectioninfo`;
CREATE TABLE `tbl_sectioninfo` (
  `_id` int(11) NOT NULL,
  `Section` varchar(255) DEFAULT NULL,
  `Yearlevel` varchar(255) DEFAULT NULL,
  `Track_ID` varchar(255) DEFAULT NULL,
  `Branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_sectioninfo
-- ----------------------------
INSERT INTO `tbl_sectioninfo` VALUES ('1', 'STEM101', '11', null, null);
INSERT INTO `tbl_sectioninfo` VALUES ('2', 'STEM102', '11', null, null);
INSERT INTO `tbl_sectioninfo` VALUES ('3', 'STEM103', '11', null, null);
INSERT INTO `tbl_sectioninfo` VALUES ('4', 'GAS101', '11', null, null);
INSERT INTO `tbl_sectioninfo` VALUES ('5', 'ABM101', '11', null, null);
INSERT INTO `tbl_sectioninfo` VALUES ('6', 'ABM102', '11', null, null);
INSERT INTO `tbl_sectioninfo` VALUES ('7', 'HE101', '11', null, null);
INSERT INTO `tbl_sectioninfo` VALUES ('8', 'ICT101', '11', null, null);

-- ----------------------------
-- Table structure for tbl_studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_studentinfo`;
CREATE TABLE `tbl_studentinfo` (
  `_id` varchar(255) NOT NULL,
  `Lastname` varchar(255) DEFAULT NULL,
  `Firstname` varchar(255) DEFAULT NULL,
  `Middlename` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `GLastname` varchar(255) DEFAULT NULL,
  `GFirstname` varchar(255) DEFAULT NULL,
  `GMiddlename` varchar(255) DEFAULT NULL,
  `GContact` int(11) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Avatar` blob,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_studentinfo
-- ----------------------------
INSERT INTO `tbl_studentinfo` VALUES ('1', 'Alde', 'Alken', 'Abadiez', 'Male', 'Alde', 'Leonila', null, '903245698', 'Active', null);
INSERT INTO `tbl_studentinfo` VALUES ('10', 'Dael', 'Dave John', 'Zabala', 'Male', 'Zabala', 'Ana Marie ', 'Trinio', '905942080', 'Active', null);
INSERT INTO `tbl_studentinfo` VALUES ('2', 'Anchuelo', 'Avy Liezel', 'Bonavente', 'Female', 'Anchuelo', 'Roda', null, '6659784', 'Active', null);
INSERT INTO `tbl_studentinfo` VALUES ('3', 'Andres', 'Jan Ashley', 'Villegas', 'Male', 'Andres', 'Joel', 'Cruz', '906202425', 'Active', null);
INSERT INTO `tbl_studentinfo` VALUES ('4', 'Aquino', 'Eugene', 'Saniel', 'Male', 'Aquino', 'Rene', null, '6619874', 'Active', null);
INSERT INTO `tbl_studentinfo` VALUES ('5', 'Buendia', 'Ram Andrew', 'Guibani', 'Male', 'Buendia', 'Carla ', 'Santos', '6548791', 'Active', null);
INSERT INTO `tbl_studentinfo` VALUES ('6', 'Buenviaje', 'John Andrei', 'Bas', 'Male', 'Buenviaje', 'Susan', 'Deso', '6978456', 'Active', null);
INSERT INTO `tbl_studentinfo` VALUES ('7', ' Bulan', 'Alyssa Mae', 'Aquino', 'Female', 'Bulan', 'Bituin', 'Aquino', '917999656', 'Active', null);
INSERT INTO `tbl_studentinfo` VALUES ('8', 'Cansino', 'Lyyana Kayle', 'Borja', 'Female', 'Cansino', 'Bueno', null, '6349785', 'Active', null);
INSERT INTO `tbl_studentinfo` VALUES ('9', 'Cruz', 'Irine Claire', 'Borja', 'Female', 'Cruz', 'Henry', 'Vallestero', '926555689', 'Active', null);

-- ----------------------------
-- Table structure for tbl_studentupload
-- ----------------------------
DROP TABLE IF EXISTS `tbl_studentupload`;
CREATE TABLE `tbl_studentupload` (
  `_id` int(11) NOT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `Subject_id` int(11) DEFAULT NULL,
  `Section_id` int(11) DEFAULT NULL,
  `FileAddress` varchar(255) DEFAULT NULL,
  `Staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_studentupload
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_subjectinfo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_subjectinfo`;
CREATE TABLE `tbl_subjectinfo` (
  `_id` int(11) NOT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `Yearlevel` varchar(255) DEFAULT NULL,
  `Track_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `Track_id` (`Track_id`),
  CONSTRAINT `tbl_subjectinfo_ibfk_1` FOREIGN KEY (`Track_id`) REFERENCES `tbl_trackinfo` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_subjectinfo
-- ----------------------------
INSERT INTO `tbl_subjectinfo` VALUES ('1', 'General Mathematics', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('2', '21st Century Literary from the Philippines and the World', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('3', 'Media Information and Literacy', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('4', 'Introduction to the Philosophy of the Human Person', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('5', 'Earth and Life Science', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('6', 'Physical Education and Health 1', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('7', 'Organization and Management', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('8', 'Business Mathematics', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('9', 'Pre-Calculus', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('10', 'Elective 1 (Animation)', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('11', 'Elective 1* HUMS- Introduction to the World Religions and Belief Systems', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('12', 'Programming C++', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('13', 'Cookery 1', '11', null);
INSERT INTO `tbl_subjectinfo` VALUES ('14', 'Bread and Pastry', '11', null);

-- ----------------------------
-- Table structure for tbl_teacherclass
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacherclass`;
CREATE TABLE `tbl_teacherclass` (
  `_ID` int(11) NOT NULL,
  `Subject_id` int(11) DEFAULT NULL,
  `Section_id` int(11) DEFAULT NULL,
  `Faculty_id` int(11) DEFAULT NULL,
  `SchoolYear` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_teacherclass
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_teacherinfo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacherinfo`;
CREATE TABLE `tbl_teacherinfo` (
  `_id` varchar(255) NOT NULL,
  `Lastname` varchar(255) DEFAULT NULL,
  `Firstname` varchar(255) DEFAULT NULL,
  `Middlename` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Avatar` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_teacherinfo
-- ----------------------------
INSERT INTO `tbl_teacherinfo` VALUES ('1000000001', 'Del Rosario', 'Michelle', 'F', 'Female', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000002', 'Libramonte', 'Roel', null, 'Male', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000003', 'Almocera', 'Florence Nicole', null, null, null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000004', 'Pajarillo', 'Jose Alfredo', null, 'Male', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000005', 'Rondilla', 'Carizza', null, 'Female', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000006', 'Bendana', 'Arleth', 'A', 'Female', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000007', 'Chua', 'Denis', null, 'Female', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000008', 'Antonil', 'Norman', null, 'Male', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000009', 'Apid', 'Alwen', null, 'Male', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000010', 'Camacho', 'Marvin', null, 'Male', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000011', 'Francisco', 'John Paul', null, 'Male', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000012', 'Quintal', 'Enrico', null, 'Male', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000013', 'Ojeda', 'Dominic', null, 'Male', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000014', 'De Vera', 'Ma. Jocelyn', 'A', 'Female', null, 'Active');
INSERT INTO `tbl_teacherinfo` VALUES ('1000000015', 'Domiguez', 'Brian Tracy', null, 'Male', null, 'Active');

-- ----------------------------
-- Table structure for tbl_teacherupload
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacherupload`;
CREATE TABLE `tbl_teacherupload` (
  `_id` int(11) NOT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `Subject_id` int(11) DEFAULT NULL,
  `Section_id` int(11) DEFAULT NULL,
  `FileAddress` varchar(255) DEFAULT NULL,
  `Staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_teacherupload
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_trackinfo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_trackinfo`;
CREATE TABLE `tbl_trackinfo` (
  `_id` int(11) NOT NULL,
  `Track` varchar(255) DEFAULT NULL,
  `Branch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `Branch_id` (`Branch_id`),
  CONSTRAINT `tbl_trackinfo_ibfk_1` FOREIGN KEY (`Branch_id`) REFERENCES `tbl_branchinfo` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_trackinfo
-- ----------------------------
INSERT INTO `tbl_trackinfo` VALUES ('1', 'Accounting, Business and Management', null);
INSERT INTO `tbl_trackinfo` VALUES ('2', 'Science, Technology and Engineering Math', null);
INSERT INTO `tbl_trackinfo` VALUES ('3', 'General Academic Strands', null);
INSERT INTO `tbl_trackinfo` VALUES ('4', 'TVL-ICT(Programming and Hardware Servicing)', null);
INSERT INTO `tbl_trackinfo` VALUES ('5', 'TVL-Home Economics:Culinary Arts', null);
