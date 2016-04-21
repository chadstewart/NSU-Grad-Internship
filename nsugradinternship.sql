-- MySQL dump 10.13  Distrib 5.1.73, for Win64 (unknown)
--
-- Host: localhost    Database: nsugradinternship
-- ------------------------------------------------------
-- Server version	5.1.73-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `AgencyID` int(11) NOT NULL AUTO_INCREMENT,
  `AgencyName` varchar(50) NOT NULL,
  `AgencyAddress` varchar(100) NOT NULL,
  `AgencyWebsite` varchar(50) DEFAULT NULL,
  `AgencyPhoneNumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`AgencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (6,'random','random','random',555);
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agencyassessment`
--

DROP TABLE IF EXISTS `agencyassessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencyassessment` (
  `AgencyAssessmentID` int(11) NOT NULL AUTO_INCREMENT,
  `RealView` int(1) NOT NULL,
  `SupervisorMeetingRating` int(1) NOT NULL,
  `ProjectTraining` int(1) NOT NULL,
  `ChallengingWork` int(1) NOT NULL,
  `TreatedAsEmployee` int(1) NOT NULL,
  `WorkRelationship` int(1) NOT NULL,
  `EmploymentPreperation` int(1) NOT NULL,
  `Paid` varchar(3) NOT NULL,
  `OtherCompensation` varchar(50) NOT NULL,
  `PermanentPosition` varchar(3) NOT NULL,
  `Recommended` varchar(3) NOT NULL,
  `OtherDetails` longtext,
  `AgencyID` int(10) DEFAULT NULL,
  `SubmissionDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`AgencyAssessmentID`),
  KEY `FK_agencyassessment_agency` (`AgencyID`),
  CONSTRAINT `FK_agencyassessment_agency` FOREIGN KEY (`AgencyID`) REFERENCES `agency` (`AgencyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencyassessment`
--

LOCK TABLES `agencyassessment` WRITE;
/*!40000 ALTER TABLE `agencyassessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `agencyassessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internship`
--

DROP TABLE IF EXISTS `internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internship` (
  `InternshipID` int(11) NOT NULL AUTO_INCREMENT,
  `InternshipStatus` varchar(15) NOT NULL,
  `JobDescription` longtext,
  `OfferLetterLink` varchar(150) NOT NULL,
  `StuID` int(10) DEFAULT NULL,
  `AgencyID` int(10) DEFAULT NULL,
  `AgencySupervisorID` int(10) DEFAULT NULL,
  `FacultySupervisorID` int(10) DEFAULT NULL,
  `AssessmentID1` int(10) DEFAULT NULL,
  `AssessmentID2` int(10) DEFAULT NULL,
  `AssessmentID3` int(10) DEFAULT NULL,
  `AssessmentID4` int(10) DEFAULT NULL,
  `SubmissionDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StatusChangeDate` datetime DEFAULT NULL,
  `AssessmentDueDate1` datetime DEFAULT NULL,
  `AssessmentDueDate2` datetime DEFAULT NULL,
  `AssessmentDueDate3` datetime DEFAULT NULL,
  `AssessmentDueDate4` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `SemesterCode` int(8) DEFAULT NULL,
  PRIMARY KEY (`InternshipID`),
  KEY `FK_internship_student` (`StuID`),
  KEY `FK_internship_agency` (`AgencyID`),
  KEY `FK_internship_supervisor` (`AgencySupervisorID`),
  KEY `FK_internship_supervisor_faculty` (`FacultySupervisorID`),
  KEY `FK_internship_studentassessment_1` (`AssessmentID1`),
  KEY `FK_internship_studentassessment_2` (`AssessmentID2`),
  KEY `FK_internship_studentassessment_3` (`AssessmentID3`),
  KEY `FK_internship_studentassessment_4` (`AssessmentID4`),
  CONSTRAINT `FK_internship_agency` FOREIGN KEY (`AgencyID`) REFERENCES `agency` (`AgencyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_internship_student` FOREIGN KEY (`StuID`) REFERENCES `student` (`StuID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_internship_studentassessment_1` FOREIGN KEY (`AssessmentID1`) REFERENCES `studentassessment` (`StuAssessID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_internship_studentassessment_2` FOREIGN KEY (`AssessmentID2`) REFERENCES `studentassessment` (`StuAssessID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_internship_studentassessment_3` FOREIGN KEY (`AssessmentID3`) REFERENCES `studentassessment` (`StuAssessID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_internship_studentassessment_4` FOREIGN KEY (`AssessmentID4`) REFERENCES `studentassessment` (`StuAssessID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_internship_supervisor` FOREIGN KEY (`AgencySupervisorID`) REFERENCES `supervisor` (`SupervisorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_internship_supervisor_faculty` FOREIGN KEY (`FacultySupervisorID`) REFERENCES `supervisor` (`SupervisorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internship`
--

LOCK TABLES `internship` WRITE;
/*!40000 ALTER TABLE `internship` DISABLE KEYS */;
INSERT INTO `internship` VALUES (3,'pending','I am a baby','test',6,6,3,NULL,NULL,NULL,NULL,NULL,'2016-04-20 16:49:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `StuID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(10) DEFAULT NULL,
  `Major` varchar(25) NOT NULL,
  `InternshipID` int(10) DEFAULT NULL,
  PRIMARY KEY (`StuID`),
  KEY `FK_student_user` (`UserID`),
  KEY `FK_student_internship` (`InternshipID`),
  CONSTRAINT `FK_student_internship` FOREIGN KEY (`InternshipID`) REFERENCES `internship` (`InternshipID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_student_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (6,7,'random',3);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentassessment`
--

DROP TABLE IF EXISTS `studentassessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentassessment` (
  `StuAssessID` int(11) NOT NULL AUTO_INCREMENT,
  `Attendance` int(1) NOT NULL,
  `Punctuality` int(1) NOT NULL,
  `Attitude` int(1) NOT NULL,
  `AcceptCritisim` int(1) NOT NULL,
  `Motivated` int(1) NOT NULL,
  `Ethical` int(1) NOT NULL,
  `PerformTasks` int(1) NOT NULL,
  `VerbalCommSkills` int(1) NOT NULL,
  `WrittenCommSkills` int(1) NOT NULL,
  `AnalyticalSkills` int(1) NOT NULL,
  `MeetsDeadlines` int(1) NOT NULL,
  `Priorities` int(1) NOT NULL,
  `OtherDetails` longtext NOT NULL,
  `InternshipID` int(10) DEFAULT NULL,
  `SubmissionDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`StuAssessID`),
  KEY `FK_studentassessment_internship` (`InternshipID`),
  CONSTRAINT `FK_studentassessment_internship` FOREIGN KEY (`InternshipID`) REFERENCES `internship` (`InternshipID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentassessment`
--

LOCK TABLES `studentassessment` WRITE;
/*!40000 ALTER TABLE `studentassessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentassessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisor` (
  `SupervisorID` int(11) NOT NULL AUTO_INCREMENT,
  `SupervisorName` varchar(50) NOT NULL,
  `SupervisorEmail` varchar(50) NOT NULL,
  `SupervisorPhoneNumber` int(10) DEFAULT NULL,
  `SupervisorRole` varchar(15) NOT NULL,
  `AgencyID` int(10) DEFAULT NULL,
  `SupervisorDepartment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SupervisorID`),
  KEY `FK_supervisor_agency` (`AgencyID`),
  CONSTRAINT `FK_supervisor_agency` FOREIGN KEY (`AgencyID`) REFERENCES `agency` (`AgencyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES (3,'random','random',555,'Agency',6,NULL);
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) NOT NULL,
  `PhoneNumber` int(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `SignUpDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'random',954,'random','boo','Student','2016-04-20 16:49:28');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-21  9:04:34
