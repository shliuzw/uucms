-- MySQL dump 10.13  Distrib 5.6.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cms_file
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','1',1),('schema.history','create(5.18.0.1)',1),('schema.version','5.18.0.1',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_account`
--

DROP TABLE IF EXISTS `jy_base_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_account` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户Id',
  `loginName` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户登录名',
  `password` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '密码',
  `salt` varchar(32) NOT NULL,
  `roleId` varchar(32) NOT NULL DEFAULT '0' COMMENT '用户类型(对应jy_base_role的Id)',
  `picUrl` varchar(255) DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名字',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子邮箱',
  `skin` varchar(64) DEFAULT NULL,
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_account`
--

LOCK TABLES `jy_base_account` WRITE;
/*!40000 ALTER TABLE `jy_base_account` DISABLE KEYS */;
INSERT INTO `jy_base_account` VALUES ('0b7276e5e2c84155a644acd4c2019d07','党办','BhF0ioIzpVhVEJ3I2forvA==','3420a3d29c80a95a1b2ca9bb1ad14dd1','18a0e4a91b9f490da700fe59c7b7da2d',NULL,'党委办公室','','skin-0',1,'2017-06-27 15:13:17',NULL,'3S85x6'),('1','sa','c/PV+ZfUVvQCOUj/SSuHqA==','cbff1d518db198171ba033ad4c32c137','4','/cms_file/static/images/system/user/hpic1.jpg','Joker','xx@163.com','skin-3',1,'2015-10-13 11:23:32','2015-12-14 00:03:59',''),('2','admin','TrKIIRVMNi7Mq+ey40eIFw==','d8a773de3aaad1bbe124949b834b4c6f','3',NULL,'公文','xx@163.com','skin-2',1,NULL,'2016-12-02 18:11:36',''),('59302912733146269754c4da2ee694c4','二处','FVtbygx8w2v0OiZjHwD1yQ==','904a71de17a3357149f30010b42dcb07','0d5242efbc4f4d9995121f6062d431a9',NULL,'','','skin-0',1,'2017-11-01 15:23:17',NULL,'9jQ8wC'),('628c5aeb288742888d3df93581d45414','hr','oBfaaJyXLn9zCeAy9GqFqA==','e50af4b925c31c7a2e90b03e685a3bd3','20bd50a12fdf4290ba719c72bfc91849',NULL,'人事经理','','skin-0',1,'2016-02-27 19:11:50',NULL,'5228SG'),('7f6bdf6549a04a00a921ed7f8195d99f','test1','/s6qboPrVt4S4qeaCwhr+A==','cf8af52bb06f4ad47e1f35fca732e229','4',NULL,'test1','aaa@sina.com','skin-0',1,'2016-12-02 18:16:13','2016-12-23 15:27:18','w16Q39'),('90ec3eef5aec457baf70db195c38ea9c','一处','wOzCBoOgncNDxd41miz2ww==','27d007742d9e7b929ba7949d1c0f2ef0','00aeae250ffd43cd94d1f417c08f8fde',NULL,'','','skin-0',1,'2017-11-01 16:09:42',NULL,'6L3Fg6'),('ce3d0dfe79924448b303a7b572d488db','三处','yeaZGkirDUHNU3JYrj0w8w==','81ece954804ec84610735ce059ec8dc6','8661d9bfe9a74e08b4834e66fdf9e3f1',NULL,'','','skin-0',1,'2017-11-01 16:10:02',NULL,'4B9780'),('df6498b3a64542b6b901796a10321f26','财务处','8kn7DQnQqo0Qj/kzXxinDg==','4f3ebeb924f0a534bf598af52bdffc06','20bd50a12fdf4290ba719c72bfc91849',NULL,'','','skin-0',1,'2017-11-01 16:10:54',NULL,'87F0Y5');
/*!40000 ALTER TABLE `jy_base_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_account_position`
--

DROP TABLE IF EXISTS `jy_base_account_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_account_position` (
  `accountId` varchar(32) NOT NULL,
  `posId` varchar(32) NOT NULL,
  PRIMARY KEY (`accountId`,`posId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_account_position`
--

LOCK TABLES `jy_base_account_position` WRITE;
/*!40000 ALTER TABLE `jy_base_account_position` DISABLE KEYS */;
INSERT INTO `jy_base_account_position` VALUES ('1','c63d54663fcc4e27a10e1e6f17772df8'),('1','f6db550f89824d6bb0009fc04af3f25b'),('2','c63d54663fcc4e27a10e1e6f17772df8'),('2','f6db550f89824d6bb0009fc04af3f25b'),('628c5aeb288742888d3df93581d45414','b2da690b91b64408aba7fb820b1bf9cf');
/*!40000 ALTER TABLE `jy_base_account_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_file`
--

DROP TABLE IF EXISTS `jy_base_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_file` (
  `id` varchar(32) NOT NULL COMMENT '文件Id',
  `fileName` varchar(32) NOT NULL COMMENT '文件名',
  `barcode` varchar(32) NOT NULL COMMENT '条形码',
  `orgId` varchar(32) DEFAULT NULL COMMENT '所属部门(对应jy_base_org的Id)',
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_file`
--

LOCK TABLES `jy_base_file` WRITE;
/*!40000 ALTER TABLE `jy_base_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `jy_base_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_file_image`
--

DROP TABLE IF EXISTS `jy_base_file_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_file_image` (
  `id` varchar(32) NOT NULL COMMENT '图片Id',
  `fileId` varchar(32) NOT NULL COMMENT '文件id',
  `barcode` varchar(256) NOT NULL COMMENT '图片地址',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_file_image`
--

LOCK TABLES `jy_base_file_image` WRITE;
/*!40000 ALTER TABLE `jy_base_file_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `jy_base_file_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_filevirtual`
--

DROP TABLE IF EXISTS `jy_base_filevirtual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_filevirtual` (
  `id` varchar(32) NOT NULL COMMENT '文件Id',
  `fileName` varchar(32) NOT NULL COMMENT '文件名',
  `barcode` varchar(32) NOT NULL COMMENT '条形码',
  `orgId` varchar(32) DEFAULT NULL COMMENT '所属部门(对应jy_base_org的Id)',
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_filevirtual`
--

LOCK TABLES `jy_base_filevirtual` WRITE;
/*!40000 ALTER TABLE `jy_base_filevirtual` DISABLE KEYS */;
INSERT INTO `jy_base_filevirtual` VALUES ('082b6bd301904c66b450d426d38276f9','2017 办公室37号传阅卷','20170821151737','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-08-21 15:17:37',NULL,''),('1564e5ebd4504164a4020f02113fa6da','2018年办公室17号传阅卷','20180824143606','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-08-24 14:36:06',NULL,''),('19d0d6e1ad5e4999a0f51d7077341d28','2017 办公室46号传阅卷','20171124101655','2',1,'2017-11-24 10:16:55',NULL,''),('1e837af67a294ec99bfeed4d52333684','2017 办公室40号传阅卷','20170918144620','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-09-18 14:46:20',NULL,''),('21c33f6ebdaf47f2a65f11b76325ec00','2017 办公室39号传阅卷','20170911095359','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-09-11 09:53:59',NULL,''),('33b9e4b4152b4119954da8cb961d4321','2018年第22号传阅件','20181016105757','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-10-16 10:57:57',NULL,''),('33bf9d91f9a44a07a68b19e5026e97aa','2018年办公室21号传阅件','20181009083202','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-10-09 08:32:02',NULL,''),('48fdd37846eb4aa581ab12d73d2df79d','2017 办公室31号传阅卷','20170613085258','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-06-13 08:52:58',NULL,''),('50685545056b42d1b20861c7e51e4f62','2017办公室45号传阅卷','20171113152343','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-11-13 15:23:43',NULL,''),('5204cfe579d54b50a76ba6f273deb718','2018年办公室11号传阅卷','20180502181007','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-05-02 18:10:07',NULL,''),('52cc9682611d46c294f5442f9c7dae00','2018年办公室13号传阅卷','20180713143849','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-07-13 14:38:49',NULL,''),('53bb04e6cb824732b3c33486a6fba5c5','2017 办公室41号传阅卷','20170918144732','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-09-18 14:47:32',NULL,''),('58947a79838247a4a8252f30f34308b6','2018年办公室16号传阅卷','20180810104306','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-08-10 10:43:06',NULL,''),('6ce0c975568b4f039f39e68149c2b9c3','2018年办公室12号传阅卷','20180706153110','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-07-06 15:31:10','2018-07-06 15:31:44',''),('6d79005c76054a71adbf72eaadbe1028','2018 办公室8号传阅卷','20180322103752','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-03-22 10:37:52',NULL,''),('763c38517c6a4e739dcab58a88a0a97c','2018年办公室14号传阅卷','20180720141327','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-07-20 14:13:27',NULL,''),('82a9de1a493d4365a9c9bba590231f87','	2017 办公室32号传阅卷','20170613085905','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-06-13 08:59:05',NULL,''),('89d4e31f9c6f4aa6992b04e82a15b234','2017办公室44号传阅卷','20171113152228','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-11-13 15:22:28',NULL,''),('8c630b62e0a74371868e6c8c92c410e8','BBB','20170710142105','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-07-10 14:21:05',NULL,''),('8e5d8406bea0441da9e4632f1cd330a7','2017 办公室33号传阅卷','20170628144353','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-06-28 14:43:53',NULL,''),('8eead3bcaa5748ec9a9095dbc6c91692','2017 办公室42号传阅卷','20171018151458','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-10-18 15:14:58',NULL,''),('9b7a5fbcad3f4a2184002e5dcd3222a8','2018 办公室7号传阅卷','20180301095722','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-03-01 09:57:22',NULL,''),('a0629ef411b74237a58a4b212d983081','2018年办公室20号传阅件','20180925142626','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-09-25 14:26:26','2018-09-25 14:37:58',''),('a3d38cb32ddf49e69e6420c394391a10','2018年办公室10号传阅卷','20180418164820','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-04-18 16:48:20','2018-04-18 17:38:21',''),('a65d46cf5c3b4fe08f980fd78fa740b0','2017 办公室38号传阅卷','20170821151808','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-08-21 15:18:08',NULL,''),('b1bf5658e1bc4099b34e40678b0cdba8','2018 办公室6号传阅卷','20180301095501','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-03-01 09:55:01',NULL,''),('b7a2135d668e41d981a1645043654f23','2018 办公室2号传阅卷','20180108135948','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-01-08 13:59:48',NULL,''),('c42bf47175814b05998e2af09caa1dea','AAAA','20170710142058','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-07-10 14:20:58',NULL,''),('c5e82ae682a04575b1ecace2dd3f6dd7','2018年办公室15号传阅卷','20180720141528','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-07-20 14:15:28',NULL,''),('c77e74fadde04cd2b048ca13a56db118','2018 办公室1号传阅卷','20180108135839','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-01-08 13:58:39',NULL,''),('cdaebfb7a39e4631a3635b4f02222bb2','2017 办公室35号传阅卷','20170718100836','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-07-18 10:08:36',NULL,''),('da629e1be54e474abf9c22ce4eed354f','2017办公室36号传阅卷','20170718101137','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-07-18 10:11:37',NULL,''),('dac6ddca7e274e92af6cc93af941e7bb','2017 办公室47号传阅卷','20171124101805','2',1,'2017-11-24 10:18:05',NULL,''),('dfd03bf89a4a4327adfea9ac76bf732a','2018年第23号传阅卷','20181023103150','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-10-23 10:31:50',NULL,''),('e3d14c2d60e54a94b7b1c89b6d1de37f','2017 办公室48号传阅卷','20171215144216','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-12-15 14:42:16',NULL,''),('e707dccafe9e4fc1a2d990b934387b19','2018 办公室9号传阅卷','20180322103927','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-03-22 10:39:27',NULL,''),('e8216f897a6a4556b2313e72c8097b34','2018年办公室19号传阅','20180911091310','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-09-11 09:13:10',NULL,''),('ef143d29d4f44f9eb7ee153304d73602','2018年办公室18号传阅','20180830140008','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-08-30 14:00:08','2018-08-30 14:00:13',''),('f6566804c89c4972928eb90ccca6a85c','2017 办公室43号传阅卷','20171018151946','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-10-18 15:19:46',NULL,''),('f89d416d78a84914b9214da7341f3738','2017  办公室34号传阅卷','20170628144514','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-06-28 14:45:14',NULL,''),('f911de343ffb44229f8f7cb8cc945874','2018 办公室5号传阅卷','20180301095411','aa17ba4b94c6430897088f59dfdee6ce',1,'2018-03-01 09:54:11',NULL,''),('fe2e45424ca54bc1bbb781766d9f48d2','2017 办公室49号传阅卷','20171215144332','aa17ba4b94c6430897088f59dfdee6ce',1,'2017-12-15 14:43:32',NULL,'');
/*!40000 ALTER TABLE `jy_base_filevirtual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_filevirtual_tracker`
--

DROP TABLE IF EXISTS `jy_base_filevirtual_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_filevirtual_tracker` (
  `id` varchar(32) NOT NULL COMMENT '跟踪Id',
  `fileId` varchar(32) NOT NULL COMMENT '文件Id',
  `gunNo` varchar(32) NOT NULL COMMENT '扫描枪编码',
  `barcode` varchar(32) NOT NULL COMMENT '条形码',
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_filevirtual_tracker`
--

LOCK TABLES `jy_base_filevirtual_tracker` WRITE;
/*!40000 ALTER TABLE `jy_base_filevirtual_tracker` DISABLE KEYS */;
INSERT INTO `jy_base_filevirtual_tracker` VALUES ('02256b0901324ab1ae83f92882a3c7ba','53bb04e6cb824732b3c33486a6fba5c5','101','20170918144732',1,'2017-09-18 14:49:00',NULL,NULL),('04b6ab863b0546828f0871f527b65cc6','33bf9d91f9a44a07a68b19e5026e97aa','101','20181009083202',1,'2018-10-11 14:01:17','2018-10-11 14:01:17',NULL),('04d44b26112b4ee5a53c8f1ac405847c','5bb0b75480f14be7be74d016c72eec6e','102','20170710135552',1,'2017-07-10 14:04:51','2017-07-10 14:19:41',NULL),('0648d9c4c53749d4ac219c8dfcbe398c','9b7a5fbcad3f4a2184002e5dcd3222a8','101','20180301095722',1,'2018-03-01 09:59:20',NULL,NULL),('071cbe905f3e41038be2d00e01e9e02b','ef143d29d4f44f9eb7ee153304d73602','101','20180830140008',1,'2018-09-05 10:44:00',NULL,NULL),('0946f5f2599649efade4f0baa3fbbda8','82a9de1a493d4365a9c9bba590231f87','101','20170613085905',1,'2017-06-13 09:17:56',NULL,NULL),('0bfe48d44bf249a5ae5c4caa039b5ada','da629e1be54e474abf9c22ce4eed354f','101','20170718101137',1,'2017-07-18 10:12:34','2017-07-18 10:12:35',NULL),('11e3cb1681a246cb8f7b3cdb4932c505','da629e1be54e474abf9c22ce4eed354f','102','20170718101137',1,'2017-07-19 15:02:03','2017-07-19 15:02:07',NULL),('12077c2cc74740adb734da3d30d99d56','e8216f897a6a4556b2313e72c8097b34','107','20180911091310',1,'2018-09-13 09:00:45',NULL,NULL),('1335e013a1e349d7be768fba2622b269','5bb0b75480f14be7be74d016c72eec6e','106','20170710135552',1,'2017-07-10 14:15:17','2017-07-10 14:15:34',NULL),('1704470ad7b048b2b53f94ed62b9cf3a','6a72d6dd524945ffa0cf96b91bd36bf1','107','20170612151103',1,'2017-06-12 15:13:10',NULL,NULL),('177bf8e696594f059643efa61c4e8b7a','82a9de1a493d4365a9c9bba590231f87','106','20170613085905',1,'2017-06-27 14:51:06',NULL,NULL),('17ac8000bde74f3f8ffeda4a2c905485','2eb93c23bce7445e850260d47cbecca6','103','20170706191354',1,'2017-07-06 19:21:02','2017-07-06 19:21:44',NULL),('19e647404b6b4edab7522df0a8d7f740','5bb0b75480f14be7be74d016c72eec6e','101','20170710135552',1,'2017-07-10 14:01:01','2017-07-10 14:20:18',NULL),('1bc4b453b478446bab4f9bba18b53787','21c33f6ebdaf47f2a65f11b76325ec00','102','20170911095359',1,'2017-09-11 10:37:45',NULL,NULL),('1e5396f965094ea496af71ddef547d5d','21c33f6ebdaf47f2a65f11b76325ec00','101','20170911095359',1,'2017-09-11 10:15:11',NULL,NULL),('1e7b85ccb0244cf1bf73720fb058b89d','49db22dc3d3b4e5ca1871f83550659b9','103','20170706191338',1,'2017-07-06 19:21:04','2017-07-06 19:22:03',NULL),('222334550a914104a404d204008f37ee','7d7b308418414fcca5d462393afa4d3a','101','20170612153447',1,'2017-06-12 15:38:25',NULL,NULL),('2655d00ac9b54b288983144107178ede','33bf9d91f9a44a07a68b19e5026e97aa','106','20181009083202',1,'2018-10-11 14:22:20',NULL,NULL),('26f9292870f247329da9e3238be1d916','33bf9d91f9a44a07a68b19e5026e97aa','104','20181009083202',1,'2018-10-11 10:06:12',NULL,NULL),('290e4c71297a4cdb9573df8a935dd5af','6a72d6dd524945ffa0cf96b91bd36bf1','105','20170612151103',1,'2017-06-12 15:26:08',NULL,NULL),('2fa32706c15144f0a402d88673051fc9','9d5127c4458b4d4fbb320ef5a367a273','103','20170215085844',1,'2017-03-15 23:29:15',NULL,NULL),('3057138206164ecaa6d0c927601cdb27','19d0d6e1ad5e4999a0f51d7077341d28','101','20171124101655',1,'2017-11-24 10:19:53',NULL,NULL),('322824ff9ef0442da6cafcf97521402b','c77e74fadde04cd2b048ca13a56db118','101','20180108135839',1,'2018-01-08 14:00:48',NULL,NULL),('3403b5e9fbb146018b357ba1e0a6213b','188c79825f4f4cacb83188ad803727f5','101','20171101153501',1,'2017-11-01 15:35:21',NULL,NULL),('39db2170c228427a826c80af4db2fd29','cdaebfb7a39e4631a3635b4f02222bb2','101','20170718100836',1,'2017-07-18 10:10:20','2017-07-18 10:10:22',NULL),('3a174bd259e24b06b02db72baf822235','6a72d6dd524945ffa0cf96b91bd36bf1','103','20170612151103',1,'2017-06-12 15:30:36',NULL,NULL),('3c874bf9006e49e28be599b36afa0913','6c485a56adc8451e87b0691c2ec10ed1','103','20170706192327',1,'2017-07-06 19:24:31','2017-07-06 19:24:32',NULL),('3c9720b3a30546f083cb57703a25de96','a0629ef411b74237a58a4b212d983081','112','20180925142626',1,'2018-09-27 10:28:21','2018-09-27 10:28:29',NULL),('3ce503455fb04207b3ff290c5b52087a','a0629ef411b74237a58a4b212d983081','111','20180925142626',1,'2018-10-08 09:01:11',NULL,NULL),('3d46e8b88701453cb31dccf19f96bcc3','ef143d29d4f44f9eb7ee153304d73602','104','20180830140008',1,'2018-09-05 10:17:46','2018-09-05 10:18:09',NULL),('3d65391ee8c445ada7b2059e1ec487f0','f23a43a7f2e64fd381d5b25c6150b57a','102','20170710135539',1,'2017-07-10 14:06:11','2017-07-10 14:19:31',NULL),('3eab97ee37284cf2872a01686256e854','48fdd37846eb4aa581ab12d73d2df79d','101','20170613085258',1,'2017-06-13 08:54:00','2017-06-13 08:54:00',NULL),('412e7de465c24db6adbbcfed4a92f7a3','8e5d8406bea0441da9e4632f1cd330a7','101','20170628144353',1,'2017-06-28 14:51:19',NULL,NULL),('421af1793bc7471db6db20795abd2de2','a3d38cb32ddf49e69e6420c394391a10','112','20180418164820',1,'2018-06-20 16:14:37',NULL,NULL),('4503e0682d33490a8be8a9029604998f','077ebb9bf11b4be18efcc8e17f5cebc9','102','20170609093401',1,'2017-06-09 15:15:37','2017-06-09 15:57:45',NULL),('4a22f37907634e85a73842be82e18f76','484a0b48061b4e07ac553d32a1c95adb','105','20170517154625',1,'2017-05-18 14:19:33',NULL,NULL),('4e4e62e9316b459e88c5ab133d525fe6','48fdd37846eb4aa581ab12d73d2df79d','105','20170613085258',1,'2017-06-27 14:52:03',NULL,NULL),('506d7d04384644a68af4507800b4eab8','e8216f897a6a4556b2313e72c8097b34','112','20180911091310',1,'2018-09-11 14:00:30',NULL,NULL),('528df7127892481bb3738dba29a414d8','1e837af67a294ec99bfeed4d52333684','102','20170918144620',1,'2017-09-29 13:46:11',NULL,NULL),('55acdb34b43749f5b8e88564cacb8433','09cc2f08f52a4686a5a28c8d2bd1fe14','105','20170518141456',1,'2017-05-18 14:24:16',NULL,NULL),('57510d85bdb04b49b6827b5c3ada6543','f89d416d78a84914b9214da7341f3738','101','20170628144514',1,'2017-06-28 14:51:30','2017-06-28 14:51:31',NULL),('575db777e813461a9d49aea2ac15fb21','dfd03bf89a4a4327adfea9ac76bf732a','112','20181023103150',1,'2018-10-26 16:14:43','2018-10-26 16:14:45',NULL),('6247baa9f12b42608bede25cf7345afb','e8216f897a6a4556b2313e72c8097b34','104','20180911091310',1,'2018-09-21 10:45:43',NULL,NULL),('670414c5ad90482d9ec1bf1076210589','48fdd37846eb4aa581ab12d73d2df79d','104','20170613085258',1,'2017-06-16 13:42:11','2017-06-16 13:43:33',NULL),('6be494e9886a49738a0efb737ab60c07','33b9e4b4152b4119954da8cb961d4321','104','20181016105757',1,'2018-10-17 10:11:00',NULL,NULL),('6c3c6c1c49a249c493419c482d5fb041','f23a43a7f2e64fd381d5b25c6150b57a','101','20170710135539',1,'2017-07-10 14:01:01','2017-07-10 14:20:17',NULL),('6fd440b47ce2436c865607d5953708c3','e8216f897a6a4556b2313e72c8097b34','106','20180911091310',1,'2018-09-21 10:43:40',NULL,NULL),('7194d18c85ad4a28b922a03578c247eb','82a9de1a493d4365a9c9bba590231f87','104','20170613085905',1,'2017-06-16 13:43:37','2017-06-16 13:55:15',NULL),('743ec855c00e446b8196986967da882a','ef143d29d4f44f9eb7ee153304d73602','111','20180830140008',1,'2018-09-05 10:55:46',NULL,NULL),('74839518175745679b89030b36fe8a95','48fdd37846eb4aa581ab12d73d2df79d','103','20170613085258',1,'2017-06-13 15:55:57',NULL,NULL),('754964cc9c35461d885e14f667b83892','33bf9d91f9a44a07a68b19e5026e97aa','107','20181009083202',1,'2018-10-11 15:11:26','2018-10-11 15:11:41',NULL),('763fde150361445e812736607cd3d120','ef143d29d4f44f9eb7ee153304d73602','107','20180830140008',1,'2018-09-05 10:14:39',NULL,NULL),('7824a289dd804b75b854e57710635143','b9c7376c8509480d8020f50ab611f51f','103','20170706192401',1,'2017-07-06 19:24:46',NULL,NULL),('7a775af5c69749cdac5a2a09945359ef','fe2e45424ca54bc1bbb781766d9f48d2','101','20171215144332',1,'2017-12-15 14:48:47',NULL,NULL),('7cf3c4c98a1f462dac0681a56ddcd422','6a72d6dd524945ffa0cf96b91bd36bf1','102','20170612151103',1,'2017-06-12 15:14:04',NULL,NULL),('803c4c36df294d4d825167e8fcc2bb90','077ebb9bf11b4be18efcc8e17f5cebc9','101','20170609093401',1,'2017-06-09 09:36:58',NULL,NULL),('8073cf1a2ecc4ef1a22d6fe330b2b27f','82a9de1a493d4365a9c9bba590231f87','102','20170613085905',1,'2017-06-13 14:01:13',NULL,NULL),('810b20faae4c4450bc22f7c0583e7ce2','a65d46cf5c3b4fe08f980fd78fa740b0','101','20170821151808',1,'2017-08-21 15:19:59',NULL,NULL),('83826d36b766409cbaf3c0b9b265255c','f89d416d78a84914b9214da7341f3738','103','20170628144514',1,'2017-07-05 10:43:04','2017-07-05 10:46:48',NULL),('897114da82b5493eac26da0475406c32','33b9e4b4152b4119954da8cb961d4321','112','20181016105757',1,'2018-10-17 09:07:48','2018-10-17 09:07:48',NULL),('8e55b8d6ae6b4b528f8f686f182b0891','e707dccafe9e4fc1a2d990b934387b19','101','20180322103927',1,'2018-03-22 10:40:51',NULL,NULL),('90a694b7ddb24aaa86838e3b94afb6b2','89d4e31f9c6f4aa6992b04e82a15b234','101','20171113152228',1,'2017-11-13 15:24:39',NULL,NULL),('91cc5e692832451db0096b93f6edf476','c42bf47175814b05998e2af09caa1dea','101','20170710142058',1,'2017-07-10 14:22:04',NULL,NULL),('930745e844274b208e862523d041970e','33b9e4b4152b4119954da8cb961d4321','111','20181016105757',1,'2018-10-17 14:12:59',NULL,NULL),('967665522f5542f8ba7efa8866551cf6','8c630b62e0a74371868e6c8c92c410e8','102','20170710142105',1,'2017-07-10 14:22:35',NULL,NULL),('9a465ddee2bc42b88101d838b8516fe1','33bf9d91f9a44a07a68b19e5026e97aa','111','20181009083202',1,'2018-10-11 16:13:37',NULL,NULL),('9c7ebee3d41345c4ad71f0d2ac7d2cc7','33b9e4b4152b4119954da8cb961d4321','107','20181016105757',1,'2018-10-17 08:44:34','2018-10-17 08:44:43',NULL),('9ec0bc8716134e288ce970899dd2d5bd','48fdd37846eb4aa581ab12d73d2df79d','102','20170613085258',1,'2017-06-13 14:00:10',NULL,NULL),('9fee033430004240a86c9d0dd7a36816','c42bf47175814b05998e2af09caa1dea','102','20170710142058',1,'2017-07-10 14:22:36','2017-07-10 14:22:45',NULL),('a2b8c1edcc394e92bac944dcfa18ae23','9d5127c4458b4d4fbb320ef5a367a273','104','20170215085844',1,'2017-03-16 14:59:47','2017-03-16 15:01:27',NULL),('a9df801868254c9bbfaf957ef77bb87d','b7a2135d668e41d981a1645043654f23','107','20180108135948',1,'2018-01-15 09:33:28',NULL,NULL),('aa931d9c57844620bacd5a1b5fc22aba','6a72d6dd524945ffa0cf96b91bd36bf1','101','20170612151103',1,'2017-06-12 15:26:53',NULL,NULL),('ade723e0072b4c569062fc21429cf8af','ef143d29d4f44f9eb7ee153304d73602','112','20180830140008',1,'2018-09-05 10:40:26',NULL,NULL),('b12ba67ef2294436a9a5d711fbb51b6f','dfd03bf89a4a4327adfea9ac76bf732a','104','20181023103150',1,'2018-10-29 09:23:23','2018-10-29 09:23:32',NULL),('b5a64574a7a94510bca1f44a153dbe46','33b9e4b4152b4119954da8cb961d4321','106','20181016105757',1,'2018-10-17 09:06:34','2018-10-17 09:06:48',NULL),('b94af219bb084f6999e6928f670a2d3f','ef143d29d4f44f9eb7ee153304d73602','106','20180830140008',1,'2018-09-05 10:10:53','2018-09-05 10:53:11',NULL),('b9984ad932a044ca8fe75c55a701e82e','e3d14c2d60e54a94b7b1c89b6d1de37f','101','20171215144216',1,'2017-12-15 14:48:47',NULL,NULL),('bb4d7e9617db4ae4a11cb2f21105a332','f6566804c89c4972928eb90ccca6a85c','101','20171018151946',1,'2017-10-18 15:24:29',NULL,NULL),('bb6084d01fa3431d96930be50be2df7a','33bf9d91f9a44a07a68b19e5026e97aa','112','20181009083202',1,'2018-10-11 14:16:55','2018-10-11 14:16:57',NULL),('be274ceda58e45f38600f491be9ea6ab','53bb04e6cb824732b3c33486a6fba5c5','102','20170918144732',1,'2017-09-29 13:46:14','2017-09-29 13:46:16',NULL),('c577d053be0f4643bdb604189fa94d63','cdaebfb7a39e4631a3635b4f02222bb2','104','20170718100836',1,'2017-07-27 10:20:46',NULL,NULL),('c5df40c7edde4dd69f76f9c445b20c71','a0629ef411b74237a58a4b212d983081','106','20180925142626',1,'2018-10-08 08:52:04',NULL,NULL),('c604d4dbcd3c4e63a3031ab209e833c2','1e837af67a294ec99bfeed4d52333684','101','20170918144620',1,'2017-09-18 14:48:59',NULL,NULL),('c79d4ea869d14eb8991c126b7de771ff','8eead3bcaa5748ec9a9095dbc6c91692','101','20171018151458',1,'2017-10-18 15:17:03',NULL,NULL),('c99419b317164802a7771ddbdfe115fd','9d5127c4458b4d4fbb320ef5a367a273','101','20170215085844',1,'2017-03-15 22:59:18',NULL,NULL),('cb1f3a57359a4202b59cb49f4d72b531','82a9de1a493d4365a9c9bba590231f87','105','20170613085905',1,'2017-06-27 08:25:19','2017-06-29 13:32:15',NULL),('cce5c6b897404192a5e0804c76d677ed','9d5127c4458b4d4fbb320ef5a367a273','102','20170215085844',1,'2017-03-15 22:54:43','2017-03-16 14:58:11',NULL),('cdb9eac23eb14427bf750b06fac42bae','9d5127c4458b4d4fbb320ef5a367a273','105','20170215085844',1,'2017-03-16 15:17:25',NULL,NULL),('d20345dc08ca4ee7bd81cf44ae33a9ad','8c630b62e0a74371868e6c8c92c410e8','101','20170710142105',1,'2017-07-10 14:22:03',NULL,NULL),('d36f87f86ace4e9183d05dcce088cab3','50685545056b42d1b20861c7e51e4f62','101','20171113152343',1,'2017-11-13 15:24:41',NULL,NULL),('d373871f448e482c890d5c7f77d8e358','33b9e4b4152b4119954da8cb961d4321','101','20181016105757',1,'2018-10-17 08:33:40',NULL,NULL),('d470103f284f4ad4982aadf709d7e945','48fdd37846eb4aa581ab12d73d2df79d','107','20170613085258',1,'2017-06-30 14:28:51',NULL,NULL),('d51eb2c38fa54eda9e79876352c54b81','dac6ddca7e274e92af6cc93af941e7bb','101','20171124101805',1,'2017-11-24 10:19:54',NULL,NULL),('d5f551b4a84d48209c38adaa08c32754','b1bf5658e1bc4099b34e40678b0cdba8','101','20180301095501',1,'2018-03-01 09:59:23',NULL,NULL),('d735149620a84423beb749e49a1b7ae5','b7a2135d668e41d981a1645043654f23','101','20180108135948',1,'2018-01-08 14:00:49',NULL,NULL),('d7c0ed2dbfb14f2d98c6de4812e4f449','082b6bd301904c66b450d426d38276f9','101','20170821151737',1,'2017-08-21 15:19:58',NULL,NULL),('d9b58ba8ce794a429e568a94bd7e36eb','b4fd39b4dae144ef88846a94d89d87ac','101','20170518143013',1,'2017-05-18 14:30:20',NULL,NULL),('dc8ca8e2e9fb4569be40cc34d6d8dfb2','82a9de1a493d4365a9c9bba590231f87','103','20170613085905',1,'2017-06-13 15:50:48',NULL,NULL),('ddafad2f858d4faea28966f2ba821d8d','a0629ef411b74237a58a4b212d983081','101','20180925142626',1,'2018-10-08 08:53:53','2018-10-08 08:53:54',NULL),('e0870df019494204a5724234e51c28aa','da1fc036832b4c8e995aa6a5ffa0190f','105','20170316151131',1,'2017-03-16 15:16:12','2017-03-16 15:16:46',NULL),('e4ccbc0dfbdb47768d22304d7aceff23','f90246d3e15e4491822eb52335ee42d5','103','20170706192344',1,'2017-07-06 19:24:42',NULL,NULL),('e6a7f30bbcd542eeb44a752da04a1fbe','da629e1be54e474abf9c22ce4eed354f','104','20170718101137',1,'2017-07-27 15:56:19',NULL,NULL),('e8a5250297f34bd5ae0825b261d60c20','f2675b41b0bc421c92c8f2d26a35653f','103','20170518143235',1,'2017-05-27 15:11:27','2017-05-27 15:12:13',NULL),('ec3fe7970b854850a77625f349c7f814','f23a43a7f2e64fd381d5b25c6150b57a','106','20170710135539',1,'2017-07-10 14:15:16',NULL,NULL),('efff438748694f8fa00b73faf5516848','6d79005c76054a71adbf72eaadbe1028','101','20180322103752',1,'2018-03-22 10:40:44',NULL,NULL),('f05df1d1b38545859c6437c96265a8c1','a0629ef411b74237a58a4b212d983081','104','20180925142626',1,'2018-09-25 16:04:57',NULL,NULL),('f2e53035764f435d8af8bb7c1af904dc','f2675b41b0bc421c92c8f2d26a35653f','101','20170518143235',1,'2017-05-18 14:32:58',NULL,NULL),('f32dd67b50f34c2e9fca2d14f9ffe9e3','dfd03bf89a4a4327adfea9ac76bf732a','107','20181023103150',1,'2018-10-30 14:29:34','2018-11-01 14:02:26',NULL),('f6c589dce440449ba48263a761b5e1bf','6a72d6dd524945ffa0cf96b91bd36bf1','104','20170612151103',1,'2017-06-12 15:33:18',NULL,NULL),('ff91029343af46d5932f9edb7bd9d82a','dfd03bf89a4a4327adfea9ac76bf732a','111','20181023103150',1,'2018-11-01 15:57:27',NULL,NULL);
/*!40000 ALTER TABLE `jy_base_filevirtual_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_login_log`
--

DROP TABLE IF EXISTS `jy_base_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_login_log` (
  `id` varchar(32) DEFAULT NULL,
  `accountId` varchar(32) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `loginIP` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_login_log`
--

LOCK TABLES `jy_base_login_log` WRITE;
/*!40000 ALTER TABLE `jy_base_login_log` DISABLE KEYS */;
INSERT INTO `jy_base_login_log` VALUES ('dc512603e0dd4beca1baac3328e64878','2','2016-12-02 16:23:42','0:0:0:0:0:0:0:1'),('e96da0150bc4451ca64a4731ac653554','2','2016-12-02 16:35:21','0:0:0:0:0:0:0:1'),('43f802880e5a4489a62ea1f6c6278efb','2','2016-12-02 16:49:59','0:0:0:0:0:0:0:1'),('2ac03775b85b4051b9d68e24f8eee78c','2','2016-12-02 16:51:47','0:0:0:0:0:0:0:1'),('63b7bd9bb8f041c5b6644a9b232b6044','2','2016-12-02 17:09:22','0:0:0:0:0:0:0:1'),('b0c8b6a1fa82432ba5273f40fe53fba7','2','2016-12-02 17:10:24','0:0:0:0:0:0:0:1'),('0005485a1a5b453696d0cabc79d76cd5','2','2016-12-02 17:34:48','0:0:0:0:0:0:0:1'),('be9bfa68ab8648708ca1ae98476156fc','2','2016-12-02 17:58:01','0:0:0:0:0:0:0:1'),('f5440c5b8ddf4fc68c8de2f5e024f882','1','2016-12-02 18:05:59','0:0:0:0:0:0:0:1'),('5c71296cad664a26bdf9a06feebab9d5','1','2016-12-02 18:06:48','0:0:0:0:0:0:0:1'),('8f0288d955d640c3bab5a21c98de5dbe','2','2016-12-02 18:12:46','0:0:0:0:0:0:0:1'),('acc4d161c8354cf3b721154867ff5c52','7f6bdf6549a04a00a921ed7f8195d99f','2016-12-02 18:16:44','0:0:0:0:0:0:0:1'),('52bee1f30f5847b5a11dae3bd87d9fd9','2','2016-12-02 18:58:54','0:0:0:0:0:0:0:1'),('e1bae4745ff245ea8f9ed43a4a76a066','2','2016-12-06 09:57:38','0:0:0:0:0:0:0:1'),('d2321450180749088a052eb0e76c4fee','2','2016-12-06 11:31:53','0:0:0:0:0:0:0:1'),('a92e4cdf529c4707adeb1bf4a211f91b','2','2016-12-06 11:34:12','0:0:0:0:0:0:0:1'),('523f6421a5fd48f693e10167bb920e73','2','2016-12-06 13:24:02','0:0:0:0:0:0:0:1'),('c93b5481f1a2409b9bf84e8bf80441cd','2','2016-12-06 14:09:05','0:0:0:0:0:0:0:1'),('07c146dd666c4f2d8e46d4a5ddea429c','2','2016-12-06 14:48:58','0:0:0:0:0:0:0:1'),('447fef0c8a6248ceb22423a20c8ade1b','2','2016-12-06 14:54:55','0:0:0:0:0:0:0:1'),('477cb9d2ef974133a86b1661af55885c','2','2016-12-06 15:47:52','0:0:0:0:0:0:0:1'),('346b5ac68a214be0a56e6e2339d3e597','2','2016-12-06 16:08:42','0:0:0:0:0:0:0:1'),('576330d003d9410689d565a965a15583','2','2016-12-06 16:20:44','0:0:0:0:0:0:0:1'),('988e1a0c20b7458cb221720df863f4f3','2','2016-12-06 16:32:15','0:0:0:0:0:0:0:1'),('ee326733199541c28ac6251e3cbc7d4e','2','2016-12-06 16:42:45','0:0:0:0:0:0:0:1'),('88d4fb1b4dc54346a489a02d96fe3824','2','2016-12-06 16:43:48','0:0:0:0:0:0:0:1'),('083a65b5ae7b412584c463ae25f20881','2','2016-12-06 16:49:19','0:0:0:0:0:0:0:1'),('621c739e82894472b0bef05ea872d3eb','2','2016-12-06 16:56:15','0:0:0:0:0:0:0:1'),('9d19a64064664ddca9f3981ff2d69299','2','2016-12-08 13:55:09','0:0:0:0:0:0:0:1'),('2639a62ec4264aa296c4ed2351ada0b4','2','2016-12-08 13:59:04','0:0:0:0:0:0:0:1'),('23ee5b060ce94054b1818c23dfdfa105','2','2016-12-08 14:05:38','0:0:0:0:0:0:0:1'),('c141ebddbdce4fa39f108a3f151f11c8','2','2016-12-13 09:51:58','0:0:0:0:0:0:0:1'),('667a452387e74186adb1bbea0347458a','2','2016-12-13 13:10:19','0:0:0:0:0:0:0:1'),('4ce6e764554947c68545e9fceb7bcce9','1','2016-12-13 14:51:02','0:0:0:0:0:0:0:1'),('9007c659f80a4293b1ec3770d93b6d3f','2','2016-12-13 14:51:24','0:0:0:0:0:0:0:1'),('43bb5ad037db48068129d5c77a8e8837','2','2016-12-13 14:56:25','0:0:0:0:0:0:0:1'),('fbb896d5d3c74b7eb482c23293b67b25','2','2016-12-13 15:01:26','0:0:0:0:0:0:0:1'),('be14d48f0b6a4f928a5cf5a5bce901b8','2','2016-12-13 15:08:59','0:0:0:0:0:0:0:1'),('0b846ae420cb46b6984f36c5404773cd','2','2016-12-13 15:11:01','0:0:0:0:0:0:0:1'),('6a0756ecddd0415b802b12182613756b','2','2016-12-13 15:11:36','0:0:0:0:0:0:0:1'),('0579b835fcfa455c9b80537f9e2a94e0','2','2016-12-13 15:29:33','0:0:0:0:0:0:0:1'),('a9c7c8466a58495dbed591e99f4a203d','2','2016-12-19 11:27:27','0:0:0:0:0:0:0:1'),('d1c6ae1f310447a4a3621ceeab256520','2','2016-12-21 18:40:16','0:0:0:0:0:0:0:1'),('bcdfa4770d3c4ecd8174e33db0cef36d','2','2016-12-21 22:34:39','0:0:0:0:0:0:0:1'),('d67c7d372dcf4e3e91b1cbe07b50e4d8','2','2016-12-21 22:38:38','0:0:0:0:0:0:0:1'),('b7baae5659804e1d82f89cf88608c545','2','2016-12-21 23:35:40','0:0:0:0:0:0:0:1'),('090a0c0babfc4fc3863836ad3c313668','2','2016-12-22 10:04:27','0:0:0:0:0:0:0:1'),('e0aa1844567944558991f73844679d15','2','2016-12-22 13:22:44','0:0:0:0:0:0:0:1'),('4e5becdf7c124f0a945337937f30763c','2','2016-12-22 21:14:27','0:0:0:0:0:0:0:1'),('f18aa5c763524efabf01bbe8d5898a35','2','2016-12-22 21:28:37','0:0:0:0:0:0:0:1'),('cbfbb32565284c4baeea59718f1259ea','2','2016-12-22 21:30:59','0:0:0:0:0:0:0:1'),('7c5bbbd4f00643099d4e5488665da2d8','2','2016-12-23 14:17:04','0:0:0:0:0:0:0:1'),('97dabcbdbd0448fda9483b79e7576cfa','2','2016-12-23 15:32:18','0:0:0:0:0:0:0:1'),('537b353a35164fac8c21c728c9ad3b69','2','2016-12-23 16:23:39','0:0:0:0:0:0:0:1'),('8f8bb9bbeb9b4c7696c2ddf16f9aa69f','2','2016-12-27 13:29:38','0:0:0:0:0:0:0:1'),('889449969a554fa28271d62c765c0781','2','2017-02-05 18:49:24','139.226.141.177'),('bcf0c40481c740caaf62473a04ab35de','2','2017-02-07 09:21:13','116.247.102.210'),('c54eb8dc78064e88a8b602aba464ee0c','2','2017-02-07 10:14:05','123.119.133.18'),('75e83a1a7788437ba46f8fe6ade336b6','2','2017-02-07 10:15:33','123.119.133.18'),('f04df3669de74c079567c95dacab2c8b','2','2017-02-09 12:13:00','111.201.21.141'),('e8acaf808807438d861d2aaa80ccc487','2','2017-02-09 15:57:00','111.201.21.141'),('a124a517c90e4d0ab12a92bf60f7cd10','2','2017-02-13 16:58:43','116.247.102.210'),('12e4f571dcb84dfb8430ae8dc51c1e56','2','2017-02-14 09:32:46','0:0:0:0:0:0:0:1'),('705755df48914fd29c0bdeeb98940e9c','2','2017-02-14 09:34:48','0:0:0:0:0:0:0:1'),('fd7a661b429b4531803f323ce1942225','2','2017-02-14 09:41:27','0:0:0:0:0:0:0:1'),('899a6cc2d76f45e8891be26583cf610f','2','2017-02-14 09:47:04','0:0:0:0:0:0:0:1'),('2b2bef60fca543f695b921bc787fb7ed','2','2017-02-14 09:54:23','116.247.102.210'),('5fb4efa0d8cf4abda8f2726436b34a54','2','2017-02-14 13:52:23','117.136.0.189'),('e98a22aee1ec47ff9d7acde8b4e9d46d','2','2017-02-14 13:59:09','61.148.188.22'),('40a23452b75c4fb5a452b059996af0c4','2','2017-02-14 14:00:53','117.136.0.189'),('d610c07b141d4917a3c38bd8b0dd4173','2','2017-02-14 19:03:57','0:0:0:0:0:0:0:1'),('e1660d6b69b04751a8ee92336b3c951d','2','2017-02-14 19:08:37','116.247.102.210'),('198b1ff26d354a6c8bd81b44bb4a9edb','2','2017-02-15 08:55:05','61.148.188.22'),('81705b0ef3db4c1fb2a4019ccfb76c53','2','2017-02-15 11:30:10','114.243.45.39'),('8464f09e2f184de3ae38f912bde27ba5','2','2017-02-15 19:24:10','116.247.102.210'),('ab9f65679efe4293a5fa4f10e7c2631c','2','2017-02-15 19:30:43','116.247.102.210'),('7bfd6c1139904c4fb1153e1d6994a0d1','2','2017-02-15 19:49:11','116.243.230.31'),('5fd5889448804df68ff0d6d6829c9127','2','2017-02-15 19:55:23','116.243.230.31'),('8490f4efe2264d84a2c0e33f095cf9e7','2','2017-03-07 16:30:15','116.247.102.210'),('095509c25d7c4badbf301903aa59db76','2','2017-03-13 16:28:17','61.149.157.178'),('9007c47fb33e48a3930e8e9bfa0f872f','2','2017-03-13 16:57:19','61.149.157.178'),('cd2153246f814511851946a4d441d5b9','2','2017-03-15 20:14:30','114.243.34.126'),('72493788db2f4b68829e692ea07eaa25','2','2017-03-15 22:18:42','114.243.34.126'),('ca20b0ec67644c9183dc8c50bc49e7ab','2','2017-03-15 22:19:11','114.243.34.126'),('bb754d924dd74421a5b4c3b97ce0cf16','2','2017-03-15 22:52:55','114.243.34.126'),('30548572b9154650b25cb46cc309e20f','2','2017-03-16 14:19:22','61.148.188.22'),('2787387976ff40b7a13df1bcd66f534e','2','2017-03-16 14:52:03','61.148.188.22'),('8f41f61aff8e4a7d9a859f95480465cd','2','2017-03-16 15:48:48','61.148.188.22'),('c2da6e4ef1f349458d1bb43aab194fd3','2','2017-03-16 15:52:13','61.148.188.22'),('653c828187d94515addb6b95af450b2d','2','2017-03-16 15:53:52','61.148.188.22'),('ed07f9e30ce94906b1b67e0777cdc9e8','2','2017-03-16 15:55:33','61.148.188.22'),('0bbc4e875ec849b1ad462b9c12aeeadc','2','2017-03-17 09:11:19','61.148.188.22'),('0803b36a2d984866a92d0f1b0a8b38b0','2','2017-03-17 10:09:31','61.148.188.22'),('f587ef10e26046eba4cb189225336106','2','2017-03-17 10:11:04','61.148.188.22'),('7f6139623ecc4c189548225dc8a04a44','2','2017-03-17 10:46:49','61.148.188.22'),('1f4bf1c4c20844a9938b48017c731333','2','2017-03-27 18:02:52','116.247.102.210'),('7c4054ff54de4e329d5e6ac3ad3e4049','2','2017-03-28 14:42:13','116.247.102.210'),('dd3cd4f1fd324df39857b280f61d7bf7','2','2017-03-28 15:46:17','61.148.188.22'),('b88288a5da7443e9bdfb6105a7a76dc2','2','2017-03-28 15:48:44','223.104.3.145'),('18d1862c8e654452b020aca30d207fa6','2','2017-03-28 15:51:53','61.148.188.22'),('1f54f55c94554e11b475a4e40833fec3','1','2017-03-28 15:54:19','61.148.188.22'),('a20a01fcd7dd45e68087943dabddbdfe','2','2017-03-28 15:54:49','61.148.188.22'),('f830e140b3d3447aa8ed466065dd73ed','2','2017-03-29 10:43:09','116.247.102.210'),('6e07ba3bb8604d4ca269c7a6bc756959','2','2017-03-31 09:42:24','61.148.188.22'),('5eabd3b6d5e441a9aec394142f74693e','2','2017-03-31 09:56:04','61.148.188.22'),('2f47911ecda74fab9d9eb1666023ae34','2','2017-03-31 14:38:48','116.247.102.210'),('c039f3296bb6445bbe5e93173d3e32f4','2','2017-04-14 14:59:10','116.247.102.210'),('fac2e3464413429393d016dc3a7cf748','2','2017-04-17 16:40:57','111.201.20.169'),('f852ecc75d05412c8d70f922b474dea8','2','2017-04-17 16:48:50','111.201.20.169'),('632660673f644414bcde1237da978d03','2','2017-04-17 17:04:24','111.201.20.169'),('2b3d2a79b16148d58c856340aa36bc53','2','2017-04-17 17:20:00','111.201.20.169'),('16a6bbea9a734452b04029a195dce289','2','2017-04-17 17:22:07','111.201.20.169'),('16dfcb49b3ed4cf883d16d1facc7dc1b','2','2017-04-17 17:33:15','111.201.20.169'),('3289570c54cd47c0b11071bb89f04d26','2','2017-04-17 17:39:20','116.247.102.210'),('a45fb1ce87184cc9b324d8b2a863ea51','2','2017-04-17 17:50:48','111.201.20.169'),('9691c134992c4cb283b121888cb839d6','2','2017-04-21 14:36:22','61.148.188.22'),('9ef1976acb1043b79d2a3227afe5e880','2','2017-05-09 08:39:12','61.148.188.22'),('07ac6e13bbaf4068ab377f0030552a9d','2','2017-05-11 10:00:00','61.148.188.22'),('c3cf66bcb26d45009fe88c54f89569b0','2','2017-05-11 10:11:09','61.148.188.22'),('b5f20e7f8a5f4c269de68759baa8c768','2','2017-05-11 13:42:16','61.148.188.22'),('63b84cfef0c14ff7815ac0bb81bd928a','2','2017-05-11 20:49:31','123.119.128.202'),('6b9ba1195af44653bbf0bebd50dca17e','2','2017-05-11 20:51:00','123.119.128.202'),('8e869e5e055f43f2b30351316f83063c','2','2017-05-12 08:19:37','61.148.188.22'),('2895b0c730974470927901c840420240','2','2017-05-15 16:38:37','61.148.188.22'),('139e572142aa42f08d41cb773dda54b0','2','2017-05-16 08:26:31','61.148.188.22'),('88d0bb8051394d67b42e64a162c208d1','2','2017-05-16 13:52:26','61.148.188.22'),('0262b01a77964696bd12e331a0368f4e','2','2017-05-17 09:55:39','61.148.188.22'),('e0ab1a1c07aa49319a89ef5df6b29c6a','2','2017-05-17 14:51:04','61.148.188.22'),('e2f2ab0575f3446288429cd372742b78','2','2017-05-17 15:48:14','61.148.188.22'),('8f033985fda141749f5fe7df8648ca52','2','2017-05-17 15:57:23','61.148.188.22'),('6f190bb51f7e401a9b41304df5a201bf','2','2017-05-17 20:07:11','121.69.53.66'),('95c5c2864c8146dd86f283735a5f07ea','2','2017-05-18 08:26:08','61.148.188.22'),('68321334a8ce4a4997052ee8ff6c2838','2','2017-05-18 14:43:00','61.148.188.22'),('061b4c1d878b4813bae253ea77b52e4a','2','2017-05-18 15:36:16','61.148.188.22'),('b0fb77af6aff4a3d97186a6027e1b016','2','2017-05-18 18:20:06','116.247.102.210'),('0a055b777ace4c91ac197dbb9110b4a8','2','2017-05-19 08:31:01','61.148.188.22'),('96894b6b008f413b965289c8dffdeaca','2','2017-05-22 13:56:11','61.148.188.22'),('88cf578f7ebc4596bdc137db5b6d65ac','2','2017-05-23 10:07:40','61.148.188.22'),('f87dbd1cb4e64aa5a2cae49f6bf139a7','2','2017-05-23 17:47:03','116.247.102.210'),('02b424820871414385bca9e44a5e70c7','2','2017-05-23 17:51:35','116.247.102.210'),('0be9d6d497a3410bac8270e84e3fef55','2','2017-05-27 13:32:18','61.148.188.22'),('534f612b94014455bb2a3607ae0b2fa5','2','2017-05-27 13:47:40','223.104.3.186'),('f62b4a7ec77949fca5b50655a886b354','2','2017-05-27 13:48:46','223.104.3.186'),('920599cf973441aca81c83054183b75f','2','2017-05-27 14:19:30','116.247.102.210'),('a7086b8944244c7f9858065b76677bca','2','2017-05-27 14:50:14','223.104.3.186'),('b7a730dd7bcb44e8bfe316ccc580d93d','2','2017-05-27 15:07:40','223.104.3.186'),('b61ef90656f0417c91b8b2d1bbd9bd5c','2','2017-05-27 16:05:42','61.148.188.22'),('c42caf1e79524f3dbf5e1b115bbead82','2','2017-05-27 16:26:51','223.104.3.186'),('07a9ceb1e75f4f14bd464f2fcdf3fe7c','2','2017-05-31 11:06:04','61.148.188.22'),('7b2f188ddf2948ef874b3a1a630b862d','2','2017-05-31 17:59:02','116.247.102.210'),('aba68a0eb00e40e285bef0d85cf2a66d','2','2017-06-07 08:35:16','61.148.188.22'),('15d8feddcc37429fa12d14b443ae6316','2','2017-06-09 09:33:44','61.148.188.22'),('802a69f1f10d49328c91c69749ac1787','2','2017-06-09 09:42:19','61.148.188.22'),('9bae5ca729d34feb9c198b7e647795a7','2','2017-06-09 10:50:54','223.104.3.173'),('1876f3cf2faf4b3bb4f0cfb906c99026','2','2017-06-09 14:10:21','223.104.3.173'),('e6f3a39dca2f4631821a636a9956a441','2','2017-06-09 15:41:04','61.148.188.22'),('2ea7330bf6ee4049a2598d5cfc750559','2','2017-06-12 15:07:40','61.148.188.22'),('402cc0d942304bc9ad407e2f363439a0','2','2017-06-12 15:34:35','61.148.188.22'),('eeb8e4679c684757a4f11b9d7a231511','2','2017-06-12 15:37:27','61.148.188.22'),('0e3904fa6db6402ba074b741f3a182ac','2','2017-06-13 08:22:45','61.148.188.22'),('4fce9b49035f4f6d96bc05cafac96296','2','2017-06-13 14:00:36','61.148.188.22'),('8ba5f73b6fd94f239f95f010c699910a','2','2017-06-13 15:56:43','61.148.188.22'),('3774edf507d341cd97d98d4749c7c3e1','2','2017-06-14 08:42:23','61.148.188.22'),('804f01cb8a304a4f8f8722d590b55ff0','2','2017-06-16 13:44:32','61.148.188.22'),('36c19fcfa7eb49df800392f40fc134c9','2','2017-06-19 08:26:41','61.148.188.22'),('41d43f43c3874d9a9fa1dda6af32161e','2','2017-06-20 10:25:33','61.148.188.22'),('e83665c3cd9b4dd5960590ef749ce30f','2','2017-06-21 09:57:26','61.148.188.22'),('06a7b028128b49359b6d705763ffbd9c','2','2017-06-21 14:19:07','61.148.188.22'),('a1d21689b50d4ea0b6f49f67446caa64','2','2017-06-27 08:36:57','61.148.188.22'),('6d63e47345af4779b399409dccdbf48b','2','2017-06-27 08:40:14','61.148.188.22'),('d256d821ec9e4bb380615f0613659655','2','2017-06-27 14:51:31','61.148.188.22'),('448523e3ffe64e9b995a9c8a214d54dc','2','2017-06-27 15:13:48','61.148.188.22'),('9d962060ac5745999e7b1918fcbf3627','2','2017-06-27 15:14:31','61.148.188.22'),('4dcc2ba287cf4a198a69ffd72e75a3a7','2','2017-06-27 15:14:45','61.148.188.22'),('d5a59cf73e7b480381e77ed5d3e7c509','2','2017-06-27 15:15:05','61.148.188.22'),('5458a1779e3f4fc4a07b364f7758975a','2','2017-06-27 15:15:15','61.148.188.22'),('2fc8174a22384609937eabcbe125f274','2','2017-06-28 14:38:06','61.148.188.22'),('87a41cca351e49898c6f702504e0dd3b','2','2017-06-28 14:43:00','61.148.188.22'),('bec1924f8046405399157f6d42c92db0','2','2017-06-28 15:03:08','61.148.188.22'),('80719b3822dd4a3897af3509a385788b','2','2017-06-28 16:04:09','61.148.188.22'),('2e0e49ef578b4fb1b1db9a94952761b8','2','2017-06-29 09:51:17','61.148.188.22'),('acbfe531bc134b55975262c9b1237da3','2','2017-06-30 14:30:28','61.148.188.22'),('b5746b6da44e4a058b140d123faa4591','2','2017-07-05 13:59:32','61.148.188.22'),('df7bedf8f96b4ac487fdd5953128b56a','2','2017-07-06 19:12:45','114.243.43.131'),('58532f926f464770a3a62f4f9b7fd067','2','2017-07-07 15:31:58','61.148.188.22'),('29058f89232b4deda5b86ce43287d73f','2','2017-07-10 13:53:43','61.148.188.22'),('ead7d804f8db4c7bbc2514f87f9c667d','2','2017-07-10 13:54:00','61.148.188.22'),('04899f8cca564c68b51c23829d3d655c','2','2017-07-10 13:55:10','61.148.188.22'),('858242efa15848739994edee0ae1033f','2','2017-07-18 10:06:32','61.148.188.22'),('2700b2ad19d54401b30a74fc42d864c6','2','2017-08-21 15:14:30','61.148.188.22'),('3ec60b5622c8452e8a6426fa30986742','2','2017-08-25 15:39:40','61.148.188.22'),('454a957298354f3a9e8a5b2c97564e6b','2','2017-08-29 08:24:11','61.148.188.22'),('0a11e1aa9e764a4c8988bb476a4c3f98','2','2017-09-11 09:53:27','61.148.188.22'),('6ac43904eb0e49bc82880d8071ec10b5','2','2017-09-15 09:23:05','61.148.188.22'),('c9afc33ed5354ad0b3379fefe310a959','2','2017-09-18 14:45:34','61.148.188.22'),('997e4a2086e04ab088d2e103f9cd62c3','2','2017-09-20 08:40:06','61.148.188.22'),('deb97c8eb3c843cd8202d2346a96cf75','2','2017-09-20 13:48:50','111.206.175.44'),('5dd59839c12f42988d6879eb74828ebb','2','2017-09-25 14:30:28','61.148.188.22'),('119891a37f654183acba8dbbaa5607a5','2','2017-09-25 14:36:43','61.148.188.22'),('3ce5eb4d7c4242949e53516376fe24c0','2','2017-09-25 21:55:23','139.227.220.108'),('b2d86dd5f9b8475dacc0e7ca70728b3d','2','2017-09-26 15:48:25','61.148.188.22'),('1ab8c3d4b38d4a069209a40e73b7066e','2','2017-10-18 15:14:23','61.148.188.22'),('fe1f5eb3e12a4aabb98aa7225d700a23','2','2017-10-18 15:17:13','61.148.188.22'),('1e58a3e86f2648cca4badce98c2d07ca','2','2017-10-24 15:18:47','61.148.188.22'),('172efc26309846e2a6b50a282fe39df8','2','2017-10-30 14:05:01','61.148.188.22'),('77395692a2044b89957174a92856ab21','2','2017-11-01 14:13:23','61.148.188.22'),('f043570cb55542adbe8f507f96b44842','2','2017-11-01 15:20:32','61.148.188.22'),('268ee742aadf4d3da07ee7382bba2e26','2','2017-11-01 15:22:15','61.148.188.22'),('f8c3511e1ad54543affe73bbbf21919b','59302912733146269754c4da2ee694c4','2017-11-01 15:24:58','61.148.188.22'),('d4fda5204943491fb7fcb58c2de0027e','2','2017-11-01 15:34:49','61.148.188.22'),('eb687cd1d25c4daab9f8c4e692fd0388','2','2017-11-01 15:44:39','61.148.188.22'),('de1a766533cd4dde96c3a1723d139e64','2','2017-11-13 15:21:46','61.148.188.22'),('d702bfc6938a482d91d1d559bfc03aea','2','2017-11-24 10:16:00','61.148.188.22'),('bb9231f6e0ac4b6e853b50b060563db3','2','2017-11-24 10:20:04','61.148.188.22'),('62640b72d0a347d58d409e04777d782e','2','2017-12-15 14:41:35','61.148.188.22'),('88e0da0b15a74815807e714f619c9917','2','2018-01-08 13:58:12','61.148.188.22'),('aa84ad6707e84e9c8d2a2e84320764b7','2','2018-02-17 04:54:41','141.168.253.165'),('6b0da5309d1042b1a08847f3a048442f','2','2018-03-01 09:52:56','61.148.188.22'),('d63bfed2bbcd467ab435fb893a30ef21','2','2018-03-05 08:33:47','61.148.188.22'),('fca11a2e08a34884bf2d569b3f473e6f','2','2018-03-05 08:37:03','61.148.188.22'),('0b702f22785448c78af576c326422606','2','2018-03-20 14:31:54','61.148.188.22'),('a4cdef53824542e3a79cb506622c0704','2','2018-03-22 10:37:02','61.148.188.22'),('06411adcdeab4962a16d70d2e3f2eed0','2','2018-03-22 10:37:26','61.148.188.22'),('bb223fd7edb94f20a1d0ea2b79889eb9','2','2018-04-08 15:13:06','114.248.77.130'),('3ed0d26eaede4c2ab65722bb5735dc7e','2','2018-04-08 15:14:27','114.248.77.130'),('f4d1cb9483194d6c82585b91fb08d01e','2','2018-04-10 15:33:47','114.248.77.130'),('2b1f3b9553954289890fe5c9dde663d1','2','2018-04-10 15:36:29','114.248.77.130'),('8f882718b672485eafc59ed199c4c9f1','2','2018-04-10 15:42:57','114.248.77.130'),('c48d21fb3f4949b7b5e4e8939b28a73e','2','2018-04-18 16:46:13','114.248.77.130'),('4f7b88018a584689a5f6f584c4d4f4d9','2','2018-04-18 16:58:34','202.108.16.80'),('e3aee15f6cfe4857a1b369febc346dae','2','2018-04-19 11:31:54','202.108.16.77'),('40d55ec3e671487caca050372cf5e65d','2','2018-05-02 18:09:16','114.248.77.130'),('bf814a56237444d585613a7b7971a160','2','2018-07-06 15:30:22','114.248.77.130'),('eca48a7e9f2d4ef49af5a493da78a506','2','2018-07-06 15:33:25','114.248.77.130'),('4fbfcb7b559940c98662429176ce88bc','2','2018-07-13 14:38:15','114.248.77.130'),('03afeefd74ba4862beb8b6ab4e64fa86','2','2018-07-20 14:11:51','114.248.77.130'),('8a4bbd9bbcb8428c874655d9f1609613','2','2018-08-10 10:41:14','114.248.77.130'),('8cab8325f3ea4270baebc9634abb4db8','2','2018-08-14 14:24:32','114.248.77.130'),('203f17b35f2a492e960f74a8b0d09b9f','2','2018-08-15 16:04:41','114.248.77.130'),('a4c80f3cfcdf41d3869e94f9eac59171','2','2018-08-24 14:35:10','114.248.77.130'),('97e08ae738424bb3bc1c41a7852ae7a9','2','2018-08-30 13:56:15','114.248.77.130'),('c6d9aa8a8978401d8e114a1ebe123667','2','2018-09-04 08:41:46','114.248.77.130'),('7bba337138ae4ec6851055628f37ab57','2','2018-09-05 10:00:12','114.248.77.130'),('33a3b47e2f02489ea2a13a965b69a57b','2','2018-09-11 09:12:32','114.248.77.130'),('90b6c2ba7134427a9b1f93ea9e9ec6aa','2','2018-09-12 15:53:02','114.248.77.130'),('4e6d529579c74a89b3cddb54a16402dd','2','2018-09-13 08:56:12','114.248.77.130'),('32d7fc274681433187e20a55d22df2aa','2','2018-09-17 15:15:20','114.248.77.130'),('df405809e660420b8712e2fc5dedcc99','2','2018-09-21 10:42:43','114.248.77.130'),('f6c5761964f841feacc3eef605322abb','2','2018-09-21 10:50:21','114.248.77.130'),('76678be9f32b42fd9bd3e2eede40519a','2','2018-09-21 10:51:55','114.248.77.130'),('7b54241f4aed453082dba298174b8f9c','2','2018-09-25 14:17:19','114.248.77.130'),('b14f1e2b9f664bf3a8b5ca0aa464d671','2','2018-09-25 14:20:10','114.248.77.130'),('5bdc4ee6b47d4a85b4c6d69dfc103de9','2','2018-09-25 14:23:57','114.248.77.130'),('a13b0dd2a39f4522a8b9eeca945e1f39','2','2018-09-25 14:29:17','114.248.77.130'),('bae8d253ebe04344be22963257fae737','2','2018-09-25 14:37:44','114.248.77.130'),('93d4e28e13d44ed09778cf35d410ccf7','2','2018-09-27 10:29:32','114.248.77.130'),('0e087ea6b6624d92bd7eec8821f33433','2','2018-09-30 09:43:21','114.248.77.130'),('dd0b1e2148534727a39f8d6ecef031d7','2','2018-10-08 08:43:37','114.248.77.130'),('d3bbe368af334c3489ce4d642b670ad2','2','2018-10-08 08:47:23','114.248.77.130'),('8fa58cf226e34b76bfc5c3fa06789ca4','2','2018-10-08 08:47:40','114.248.77.130'),('18d9cd17193d4b8eba8fe25747136a21','2','2018-10-08 08:51:10','114.248.77.130'),('a41165adb99a48759889102b33b9e1af','2','2018-10-08 08:55:59','114.248.77.130'),('ab252ed5be6840c4a358d35942e7a852','2','2018-10-08 15:24:54','114.248.77.130'),('c3ef612940ff4e49a568ec63fd640726','2','2018-10-08 15:28:41','114.248.77.130'),('67f1a5d9de3f47f5bbb8a1ce36d1ca39','2','2018-10-09 08:31:36','114.248.77.130'),('021a50967b3d492fa5421e26f042c4f3','2','2018-10-11 14:19:44','114.248.77.130'),('cc27862cd2f845688f16dcf3294ec0a3','2','2018-10-11 15:09:44','114.248.77.130'),('691a4192654445eebda6298655ac8dcc','2','2018-10-11 16:07:32','114.248.77.130'),('13d7ac0eeacf4bf4a74efb46646452df','2','2018-10-11 16:14:26','114.248.77.130'),('d5fb0eeb26064315ad6feffd511ed5c2','2','2018-10-12 08:14:46','114.248.77.130'),('2496aa94f79742f39bda54c65e38a706','2','2018-10-15 10:40:04','114.248.77.130'),('4806564438ce4168bfa8bff3906fc8ab','2','2018-10-15 10:53:16','114.248.77.130'),('c51b5cd09577443595ed7dc34e377731','2','2018-10-16 10:55:43','114.248.77.130'),('80a6a0bfaaf64c33820d346f5f5ae91b','2','2018-10-17 08:34:58','114.248.77.130'),('6356fe6152404e5e9e539ab6697ed302','2','2018-10-17 09:06:26','114.248.77.130'),('08968a7c77634114aff8d1e9dca13f94','2','2018-10-17 15:02:02','114.248.77.130'),('7f9760ea98e549828129630482849949','2','2018-10-23 10:22:47','114.248.77.130'),('fa6c55a0109141cc80f88ab0e39c0263','2','2018-10-24 16:03:24','114.248.77.130'),('4a2a8993f3f84752b2d77079801af2c7','2','2018-10-24 16:07:08','114.248.77.130'),('9c3ffdf0718d4445a657d992093ca5b3','2','2018-10-29 10:35:08','114.248.77.130'),('9632febe49044e798dde44b75f5e5345','2','2018-11-02 14:57:43','114.248.77.130');
/*!40000 ALTER TABLE `jy_base_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_org`
--

DROP TABLE IF EXISTS `jy_base_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_org` (
  `id` varchar(32) NOT NULL,
  `pId` varchar(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `isValid` int(2) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_org`
--

LOCK TABLES `jy_base_org` WRITE;
/*!40000 ALTER TABLE `jy_base_org` DISABLE KEYS */;
INSERT INTO `jy_base_org` VALUES ('0a715b759765419f89bc0326e08e9ac5','1','二处',1,'','2017-02-15 08:56:33',NULL),('1','0','公文',1,'','2015-12-09 23:01:36','2016-12-06 10:01:45'),('10','0','合作伙伴',0,'','2015-12-09 23:22:29','2016-12-06 16:24:08'),('11','10','E酷快递',0,'','2015-12-09 23:24:45','2016-12-06 16:10:05'),('12','10','嗨淘商城',0,'','2015-12-09 23:25:29','2016-12-06 16:23:44'),('13','10','第一金融',0,'','2015-12-09 23:27:41','2016-12-06 16:21:10'),('2','1','办公室507',1,'','2015-12-09 23:22:09','2017-05-11 20:53:02'),('3','1','党委办公室',1,'','2015-12-09 23:26:36','2017-02-14 15:17:32'),('4','1','局领导',1,'','2015-12-09 23:20:59','2017-02-15 08:55:53'),('8f080b6180564157aa173cc26e44d1dd','1','财务处',1,'','2016-02-27 19:09:49','2017-02-15 08:56:06'),('aa17ba4b94c6430897088f59dfdee6ce','1','办公室',1,'','2017-05-18 14:32:16',NULL),('c86c602ef10e4a30aac9286f82c54c7e','1','一处',1,'','2016-12-08 14:07:10','2017-02-15 08:56:19'),('de249466902a4f839f16efb73a592072','1','三处',1,'','2017-02-15 08:56:49',NULL),('e039b0ed4e184fe78e3828755aca56f5','1','办公室508',1,'','2017-05-11 20:59:17',NULL);
/*!40000 ALTER TABLE `jy_base_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_org_resources`
--

DROP TABLE IF EXISTS `jy_base_org_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_org_resources` (
  `org_Id` varchar(32) DEFAULT NULL,
  `resources_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_org_resources`
--

LOCK TABLES `jy_base_org_resources` WRITE;
/*!40000 ALTER TABLE `jy_base_org_resources` DISABLE KEYS */;
INSERT INTO `jy_base_org_resources` VALUES ('10','1'),('10','2'),('10','ae8fea67b8434987b718c51fe83bb45d'),('10','1e2cd5e710224cf0ba09bbe5d4ee0009'),('10','fa04b6fe03944f2a9c040dbc9071af9b'),('10','83984d22f9da4991833f506695307b6f'),('10','89ff6bdf54ca4501a264adba8eb0ee39'),('10','15a7d1cec70c47bdbfd41c7f9c694481'),('10','3'),('10','4c97ca25b7e940948b3d403c3b091c81'),('10','d22f22f0bc9a4ad2a6464cca6497a7b4'),('10','51aa6b0b037340b9ae88d22d2a354acf'),('10','4ee50d1722a34edeb6c15bdbf29e556b'),('10','42a2938acb5e4a26b5ec2cc6089b7c2e'),('10','5ba75d14f5b74572bd5ff35d12c58060'),('10','4'),('10','41'),('10','161848b9e16e410e9d3fac6f9c91cad5'),('10','28d4a82889c341bdaceab323b9549245'),('10','3f184c74379c4b668030ba9e55c9caa3'),('10','6d44f1553c424e5c81bd3ed9a4e162f3'),('10','08693c30017e4e45acff89d300067269'),('10','79a76d451f3948f4963b97b6d5bbbf3c'),('10','13'),('10','10'),('10','9575841c8b6a4c58b10e97d82320fd02'),('10','dde1c043e77d48b4ac2f15806a0aec14'),('10','cd7ef89bf12f4ceb98861cf2bcbc96b1'),('10','78b1bf1c0723433099c458e75a8c6901'),('10','75288771d60d4510affe8cb97f42897f'),('10','14'),('10','34507436438c4c7eb9803fa160c2af3c'),('10','dbb1d5db4d7b419db1d221b102a7ad51'),('10','e9480dd6590a4e14a443ee8f76873fd3'),('10','6ea62cf0820248a6a2780a885b82a99d'),('10','21feb456e503484280232730687149f2'),('11','1'),('11','2'),('11','ae8fea67b8434987b718c51fe83bb45d'),('11','1e2cd5e710224cf0ba09bbe5d4ee0009'),('11','fa04b6fe03944f2a9c040dbc9071af9b'),('11','83984d22f9da4991833f506695307b6f'),('11','89ff6bdf54ca4501a264adba8eb0ee39'),('11','15a7d1cec70c47bdbfd41c7f9c694481'),('11','3'),('11','4c97ca25b7e940948b3d403c3b091c81'),('11','d22f22f0bc9a4ad2a6464cca6497a7b4'),('11','51aa6b0b037340b9ae88d22d2a354acf'),('11','4ee50d1722a34edeb6c15bdbf29e556b'),('11','42a2938acb5e4a26b5ec2cc6089b7c2e'),('11','5ba75d14f5b74572bd5ff35d12c58060'),('11','4'),('11','41'),('11','161848b9e16e410e9d3fac6f9c91cad5'),('11','28d4a82889c341bdaceab323b9549245'),('11','3f184c74379c4b668030ba9e55c9caa3'),('11','6d44f1553c424e5c81bd3ed9a4e162f3'),('11','08693c30017e4e45acff89d300067269'),('11','79a76d451f3948f4963b97b6d5bbbf3c'),('2','08693c30017e4e45acff89d300067269'),('2','79a76d451f3948f4963b97b6d5bbbf3c'),('2','25a4bc9c184a4d6c904ce7a3ccb26aae'),('2','b7d11fca02b04742814eb664454d7473'),('2','51424721ec1c4574b2f2a7bc1833c17f'),('2','7b30d8d43df347ada558df820bbec28b'),('2','5d1b45e9b6a84bccb212758ce8f2e906'),('2','273e05eb764f48c18f832520e7ce141e'),('2','0576a0a5825a4c1eafb0fb88369e77f6'),('2','40a146e3febf4cafb930a077f1f048d3'),('1','5'),('1','12'),('1','7c1741c605c148c29113ac804f68f52b'),('1','343914e32c3b458ba797c080b0dfbf85'),('4','58230413e8364b67af2bb65e64252260'),('4','b776518dfdd940e394a15de3974a8610'),('4','52910f91bf3e4b71af4ded1ef67bba48'),('4','18756082926f41329e51d74dda3abc80'),('4','a201aa381c3447aeaae23bdb478b3a06'),('4','b8203143736e4e549b2e0fc3c617d4c4'),('4','55e7a2d527564d9790b9f00a00d34634'),('4','17325e24f35348fd9a287152e3ea8b75'),('4','7537535a8b5d44009f52a3e84ca5dfd8'),('4','c9c822f6c7b94650a6f3944c53738caf'),('4','47ff0c409f314b07b52ba13f1bb81586'),('4','72cbdeff2aea4aea8f348bb6d779a87d'),('4','08693c30017e4e45acff89d300067269'),('4','79a76d451f3948f4963b97b6d5bbbf3c'),('4','25a4bc9c184a4d6c904ce7a3ccb26aae'),('4','b7d11fca02b04742814eb664454d7473'),('4','82652011fe8549d18d4652567f7b1610'),('4','bf888841c15e4da5858299ef99376eb4'),('4','a1b4ef2728d9456aa4e9a85d68c6029e'),('4','747a8ddc90b844c3a12dbe920e777052'),('4','b78f7224d001404c92479532c614dffa'),('4','a2eea33defc64462b3b3df9e64c461fb'),('4','1e87cc3913914c8aa80116270ed03a75'),('4','9bd48a7e0ca74b77b577411c8e4b7c2b'),('4','55053558dc4f4ab0983337386969aced'),('4','ef3a950b6154459589acc7dd7145e0ed'),('4','de998a250fcb4c2ab88981f2093d54f3'),('4','a213cc3a8be64a77b9d8673619230a87'),('4','c669fba98a9446999b62d15bfff1c412'),('4','7579afb168b04a3d99fff9dbe956936e'),('4','7d6a6b7594b14807a3def610f6595804'),('4','9ba1dbda9e414eff8591cda4aea34c32'),('4','51424721ec1c4574b2f2a7bc1833c17f'),('4','7b30d8d43df347ada558df820bbec28b'),('4','5d1b45e9b6a84bccb212758ce8f2e906'),('4','273e05eb764f48c18f832520e7ce141e'),('4','0576a0a5825a4c1eafb0fb88369e77f6'),('4','40a146e3febf4cafb930a077f1f048d3'),('1','58230413e8364b67af2bb65e64252260'),('1','b776518dfdd940e394a15de3974a8610'),('1','52910f91bf3e4b71af4ded1ef67bba48'),('1','18756082926f41329e51d74dda3abc80'),('1','a201aa381c3447aeaae23bdb478b3a06'),('1','b8203143736e4e549b2e0fc3c617d4c4'),('1','55e7a2d527564d9790b9f00a00d34634'),('1','17325e24f35348fd9a287152e3ea8b75'),('1','7537535a8b5d44009f52a3e84ca5dfd8'),('1','c9c822f6c7b94650a6f3944c53738caf'),('1','47ff0c409f314b07b52ba13f1bb81586'),('1','72cbdeff2aea4aea8f348bb6d779a87d'),('1','08693c30017e4e45acff89d300067269'),('1','79a76d451f3948f4963b97b6d5bbbf3c'),('1','25a4bc9c184a4d6c904ce7a3ccb26aae'),('1','b7d11fca02b04742814eb664454d7473'),('1','82652011fe8549d18d4652567f7b1610'),('1','bf888841c15e4da5858299ef99376eb4'),('1','a1b4ef2728d9456aa4e9a85d68c6029e'),('1','747a8ddc90b844c3a12dbe920e777052'),('1','b78f7224d001404c92479532c614dffa'),('1','a2eea33defc64462b3b3df9e64c461fb'),('1','1e87cc3913914c8aa80116270ed03a75'),('1','9bd48a7e0ca74b77b577411c8e4b7c2b'),('1','55053558dc4f4ab0983337386969aced'),('1','ef3a950b6154459589acc7dd7145e0ed'),('1','de998a250fcb4c2ab88981f2093d54f3'),('1','a213cc3a8be64a77b9d8673619230a87'),('1','c669fba98a9446999b62d15bfff1c412'),('1','7579afb168b04a3d99fff9dbe956936e'),('1','7d6a6b7594b14807a3def610f6595804'),('1','9ba1dbda9e414eff8591cda4aea34c32'),('1','51424721ec1c4574b2f2a7bc1833c17f'),('1','7b30d8d43df347ada558df820bbec28b'),('1','5d1b45e9b6a84bccb212758ce8f2e906'),('1','273e05eb764f48c18f832520e7ce141e'),('1','0576a0a5825a4c1eafb0fb88369e77f6'),('1','40a146e3febf4cafb930a077f1f048d3'),('4','5'),('4','12'),('4','7c1741c605c148c29113ac804f68f52b'),('4','343914e32c3b458ba797c080b0dfbf85'),('1','e750134d22094ef3a611fe8300c351e9'),('1','a103f06e9c7f4e8aafc5eaf4c735fd91'),('1','dc4a83f740f54f6b89916321968cbcd3'),('1','9bc994928cc64fdca432fcad2a0b3ba9'),('1','1d906f69a7274cbd8b316903e66fc580'),('1','9cff3045dd824773a70c5a887a2f71ef'),('1','f541a86e629d4eefb014309c921a237e'),('1','e49f8b358da2404293f6ac4e7f7a7a30'),('1','6'),('1','102'),('1','4f057f1a6d05416fbb06206b2aaffb10'),('1','103'),('1','100'),('1','101'),('1','1bc2c9d3d8e644f1a25ce8321f2faf13'),('1','31b0fe86acea4fceb184aecfe521ff0d'),('1','0f5747e8beb24a15899cfd0c0f4c42c0'),('1','9727f259cd8542fc8756b7b9cee9dd54'),('1','404'),('1','332072af224d42a4b2f340f30355b1e1'),('4','e750134d22094ef3a611fe8300c351e9'),('4','a103f06e9c7f4e8aafc5eaf4c735fd91'),('4','dc4a83f740f54f6b89916321968cbcd3'),('4','9bc994928cc64fdca432fcad2a0b3ba9'),('4','1d906f69a7274cbd8b316903e66fc580'),('4','9cff3045dd824773a70c5a887a2f71ef'),('4','f541a86e629d4eefb014309c921a237e'),('4','e49f8b358da2404293f6ac4e7f7a7a30'),('4','6'),('4','102'),('4','4f057f1a6d05416fbb06206b2aaffb10'),('4','103'),('4','100'),('4','101'),('4','1bc2c9d3d8e644f1a25ce8321f2faf13'),('4','31b0fe86acea4fceb184aecfe521ff0d'),('4','0f5747e8beb24a15899cfd0c0f4c42c0'),('4','9727f259cd8542fc8756b7b9cee9dd54'),('4','404'),('4','332072af224d42a4b2f340f30355b1e1'),('8f080b6180564157aa173cc26e44d1dd','58230413e8364b67af2bb65e64252260'),('8f080b6180564157aa173cc26e44d1dd','b776518dfdd940e394a15de3974a8610'),('8f080b6180564157aa173cc26e44d1dd','52910f91bf3e4b71af4ded1ef67bba48'),('8f080b6180564157aa173cc26e44d1dd','18756082926f41329e51d74dda3abc80'),('8f080b6180564157aa173cc26e44d1dd','a201aa381c3447aeaae23bdb478b3a06'),('8f080b6180564157aa173cc26e44d1dd','b8203143736e4e549b2e0fc3c617d4c4'),('8f080b6180564157aa173cc26e44d1dd','55e7a2d527564d9790b9f00a00d34634'),('8f080b6180564157aa173cc26e44d1dd','17325e24f35348fd9a287152e3ea8b75'),('8f080b6180564157aa173cc26e44d1dd','7537535a8b5d44009f52a3e84ca5dfd8'),('8f080b6180564157aa173cc26e44d1dd','c9c822f6c7b94650a6f3944c53738caf'),('8f080b6180564157aa173cc26e44d1dd','47ff0c409f314b07b52ba13f1bb81586'),('8f080b6180564157aa173cc26e44d1dd','72cbdeff2aea4aea8f348bb6d779a87d'),('8f080b6180564157aa173cc26e44d1dd','e750134d22094ef3a611fe8300c351e9'),('8f080b6180564157aa173cc26e44d1dd','a103f06e9c7f4e8aafc5eaf4c735fd91'),('8f080b6180564157aa173cc26e44d1dd','dc4a83f740f54f6b89916321968cbcd3'),('8f080b6180564157aa173cc26e44d1dd','9bc994928cc64fdca432fcad2a0b3ba9'),('8f080b6180564157aa173cc26e44d1dd','1d906f69a7274cbd8b316903e66fc580'),('8f080b6180564157aa173cc26e44d1dd','9cff3045dd824773a70c5a887a2f71ef'),('8f080b6180564157aa173cc26e44d1dd','f541a86e629d4eefb014309c921a237e'),('8f080b6180564157aa173cc26e44d1dd','e49f8b358da2404293f6ac4e7f7a7a30'),('1','9037c1737a904fc3bf18e0ef7a6b6e05'),('4','9037c1737a904fc3bf18e0ef7a6b6e05'),('1','8cc0bcbb9bae4ebe81d263de37ef15a6'),('4','8cc0bcbb9bae4ebe81d263de37ef15a6'),('1','4021171e506b47c083c77a2b96660031'),('4','4021171e506b47c083c77a2b96660031'),('1','bb862412fa86465f8e6e60cfa68dbb29'),('1','0d8efa0550bc4324880bfc0bedbf39e8'),('1','ea90de6638a5440698dcea1491608cdb'),('1','4658d3420c4a4af29ed52222d8dc67c2'),('1','bd03d6a0336345758f7c849ff11f7ffb'),('1','89b35a60c5144202b51eb31529470848'),('1','f2925d51de01454c854b2905e1688fdf'),('1','e3b932aaf9db47278aaa45ea064d04bc'),('1','19293cd2bb0647cb9b9a6d2bbde55dc6'),('1','0fec1587b02e4921acce4a322d71d151'),('1','ddcec615d51b4ab3bf4f90d94fd81b18'),('1','a987e56da5f44750bf31766d81ab436b'),('1','88e744f30f414d0f8a5cf1d2e5de1f83'),('1','8b107b30423d4c6cbfe88c17f21c825e'),('1','b8040d165a924ee6964055acc025d50c'),('1','2669772c9e1f4fadade1861a8a9e790d'),('1','862026e1157143aabea7ea1f6286ed34'),('1','5374888203744b2e9576f6995ddb9662'),('4','bb862412fa86465f8e6e60cfa68dbb29'),('4','0d8efa0550bc4324880bfc0bedbf39e8'),('4','ea90de6638a5440698dcea1491608cdb'),('4','4658d3420c4a4af29ed52222d8dc67c2'),('4','bd03d6a0336345758f7c849ff11f7ffb'),('4','89b35a60c5144202b51eb31529470848'),('4','f2925d51de01454c854b2905e1688fdf'),('4','e3b932aaf9db47278aaa45ea064d04bc'),('4','19293cd2bb0647cb9b9a6d2bbde55dc6'),('4','0fec1587b02e4921acce4a322d71d151'),('4','ddcec615d51b4ab3bf4f90d94fd81b18'),('4','a987e56da5f44750bf31766d81ab436b'),('4','88e744f30f414d0f8a5cf1d2e5de1f83'),('4','8b107b30423d4c6cbfe88c17f21c825e'),('4','b8040d165a924ee6964055acc025d50c'),('4','2669772c9e1f4fadade1861a8a9e790d'),('4','862026e1157143aabea7ea1f6286ed34'),('4','5374888203744b2e9576f6995ddb9662'),('1','11'),('1','71baa196316c4b16817f5644baaba373'),('1','1f50b93daabf493c9d317cffbb0e739e'),('1','4971ebc1cea343e4afec5d22b1cd45bd'),('1','0759eb40124b42deae438213919e4dfa'),('1','eebae621fd6942be908ef783c6e57d35'),('1','63d70cc36a574f70b7edc754d0785107'),('1','5c6d6461e5c94a9e9954fd003af76349'),('1','3a13a0f547cf40869a0f6aa9a86be910'),('1','d7e2c67c169c43959fdc6a95097bcbc8'),('1','c45d42dce99d4faa82701951a24b70cf'),('1','7434d956ce904e2ba6db1dd7933de4e4'),('1','64ef502000d843e389cbc8f006272905'),('1','553ddbde34994fd3ba1e679e712078e7'),('1','76ac6ca0335e4e62a9fd9f744226e6f0'),('1','51e4dbe2fca84cb09192d86019e7cad8'),('1','1a90405b1bf143caa9f9a03f1e28dee9'),('1','709d24289f6a48fb95396bfd3c45fb42'),('1','1'),('1','2'),('1','ae8fea67b8434987b718c51fe83bb45d'),('1','1e2cd5e710224cf0ba09bbe5d4ee0009'),('1','fa04b6fe03944f2a9c040dbc9071af9b'),('1','83984d22f9da4991833f506695307b6f'),('1','89ff6bdf54ca4501a264adba8eb0ee39'),('1','15a7d1cec70c47bdbfd41c7f9c694481'),('1','3'),('1','4c97ca25b7e940948b3d403c3b091c81'),('1','d22f22f0bc9a4ad2a6464cca6497a7b4'),('1','51aa6b0b037340b9ae88d22d2a354acf'),('1','4ee50d1722a34edeb6c15bdbf29e556b'),('1','42a2938acb5e4a26b5ec2cc6089b7c2e'),('1','5ba75d14f5b74572bd5ff35d12c58060'),('1','c73d630ab1004b5a9b71836e8b000de9'),('1','4'),('1','41'),('1','161848b9e16e410e9d3fac6f9c91cad5'),('1','28d4a82889c341bdaceab323b9549245'),('1','3f184c74379c4b668030ba9e55c9caa3'),('1','6d44f1553c424e5c81bd3ed9a4e162f3'),('4','11'),('4','71baa196316c4b16817f5644baaba373'),('4','1f50b93daabf493c9d317cffbb0e739e'),('4','4971ebc1cea343e4afec5d22b1cd45bd'),('4','0759eb40124b42deae438213919e4dfa'),('4','eebae621fd6942be908ef783c6e57d35'),('4','63d70cc36a574f70b7edc754d0785107'),('4','5c6d6461e5c94a9e9954fd003af76349'),('4','3a13a0f547cf40869a0f6aa9a86be910'),('4','d7e2c67c169c43959fdc6a95097bcbc8'),('4','c45d42dce99d4faa82701951a24b70cf'),('4','7434d956ce904e2ba6db1dd7933de4e4'),('4','64ef502000d843e389cbc8f006272905'),('4','553ddbde34994fd3ba1e679e712078e7'),('4','76ac6ca0335e4e62a9fd9f744226e6f0'),('4','51e4dbe2fca84cb09192d86019e7cad8'),('4','1a90405b1bf143caa9f9a03f1e28dee9'),('4','709d24289f6a48fb95396bfd3c45fb42'),('4','1'),('4','2'),('4','ae8fea67b8434987b718c51fe83bb45d'),('4','1e2cd5e710224cf0ba09bbe5d4ee0009'),('4','fa04b6fe03944f2a9c040dbc9071af9b'),('4','83984d22f9da4991833f506695307b6f'),('4','89ff6bdf54ca4501a264adba8eb0ee39'),('4','15a7d1cec70c47bdbfd41c7f9c694481'),('4','3'),('4','4c97ca25b7e940948b3d403c3b091c81'),('4','d22f22f0bc9a4ad2a6464cca6497a7b4'),('4','51aa6b0b037340b9ae88d22d2a354acf'),('4','4ee50d1722a34edeb6c15bdbf29e556b'),('4','42a2938acb5e4a26b5ec2cc6089b7c2e'),('4','5ba75d14f5b74572bd5ff35d12c58060'),('4','c73d630ab1004b5a9b71836e8b000de9'),('4','4'),('4','41'),('4','161848b9e16e410e9d3fac6f9c91cad5'),('4','28d4a82889c341bdaceab323b9549245'),('4','3f184c74379c4b668030ba9e55c9caa3'),('4','6d44f1553c424e5c81bd3ed9a4e162f3'),('0a715b759765419f89bc0326e08e9ac5','11'),('0a715b759765419f89bc0326e08e9ac5','71baa196316c4b16817f5644baaba373'),('0a715b759765419f89bc0326e08e9ac5','1f50b93daabf493c9d317cffbb0e739e'),('0a715b759765419f89bc0326e08e9ac5','4971ebc1cea343e4afec5d22b1cd45bd'),('0a715b759765419f89bc0326e08e9ac5','0759eb40124b42deae438213919e4dfa'),('0a715b759765419f89bc0326e08e9ac5','eebae621fd6942be908ef783c6e57d35'),('0a715b759765419f89bc0326e08e9ac5','63d70cc36a574f70b7edc754d0785107'),('0a715b759765419f89bc0326e08e9ac5','5c6d6461e5c94a9e9954fd003af76349'),('0a715b759765419f89bc0326e08e9ac5','3a13a0f547cf40869a0f6aa9a86be910'),('0a715b759765419f89bc0326e08e9ac5','d7e2c67c169c43959fdc6a95097bcbc8'),('0a715b759765419f89bc0326e08e9ac5','c45d42dce99d4faa82701951a24b70cf'),('8f080b6180564157aa173cc26e44d1dd','11'),('8f080b6180564157aa173cc26e44d1dd','71baa196316c4b16817f5644baaba373'),('8f080b6180564157aa173cc26e44d1dd','1f50b93daabf493c9d317cffbb0e739e'),('8f080b6180564157aa173cc26e44d1dd','4971ebc1cea343e4afec5d22b1cd45bd'),('8f080b6180564157aa173cc26e44d1dd','0759eb40124b42deae438213919e4dfa'),('8f080b6180564157aa173cc26e44d1dd','eebae621fd6942be908ef783c6e57d35'),('8f080b6180564157aa173cc26e44d1dd','63d70cc36a574f70b7edc754d0785107'),('8f080b6180564157aa173cc26e44d1dd','5c6d6461e5c94a9e9954fd003af76349'),('8f080b6180564157aa173cc26e44d1dd','3a13a0f547cf40869a0f6aa9a86be910'),('8f080b6180564157aa173cc26e44d1dd','d7e2c67c169c43959fdc6a95097bcbc8'),('8f080b6180564157aa173cc26e44d1dd','c45d42dce99d4faa82701951a24b70cf'),('c86c602ef10e4a30aac9286f82c54c7e','11'),('c86c602ef10e4a30aac9286f82c54c7e','71baa196316c4b16817f5644baaba373'),('c86c602ef10e4a30aac9286f82c54c7e','1f50b93daabf493c9d317cffbb0e739e'),('c86c602ef10e4a30aac9286f82c54c7e','4971ebc1cea343e4afec5d22b1cd45bd'),('c86c602ef10e4a30aac9286f82c54c7e','0759eb40124b42deae438213919e4dfa'),('c86c602ef10e4a30aac9286f82c54c7e','eebae621fd6942be908ef783c6e57d35'),('c86c602ef10e4a30aac9286f82c54c7e','63d70cc36a574f70b7edc754d0785107'),('c86c602ef10e4a30aac9286f82c54c7e','5c6d6461e5c94a9e9954fd003af76349'),('c86c602ef10e4a30aac9286f82c54c7e','3a13a0f547cf40869a0f6aa9a86be910'),('c86c602ef10e4a30aac9286f82c54c7e','d7e2c67c169c43959fdc6a95097bcbc8'),('c86c602ef10e4a30aac9286f82c54c7e','c45d42dce99d4faa82701951a24b70cf'),('de249466902a4f839f16efb73a592072','11'),('de249466902a4f839f16efb73a592072','71baa196316c4b16817f5644baaba373'),('de249466902a4f839f16efb73a592072','1f50b93daabf493c9d317cffbb0e739e'),('de249466902a4f839f16efb73a592072','4971ebc1cea343e4afec5d22b1cd45bd'),('de249466902a4f839f16efb73a592072','0759eb40124b42deae438213919e4dfa'),('de249466902a4f839f16efb73a592072','eebae621fd6942be908ef783c6e57d35'),('de249466902a4f839f16efb73a592072','63d70cc36a574f70b7edc754d0785107'),('de249466902a4f839f16efb73a592072','5c6d6461e5c94a9e9954fd003af76349'),('de249466902a4f839f16efb73a592072','3a13a0f547cf40869a0f6aa9a86be910'),('de249466902a4f839f16efb73a592072','d7e2c67c169c43959fdc6a95097bcbc8'),('de249466902a4f839f16efb73a592072','c45d42dce99d4faa82701951a24b70cf');
/*!40000 ALTER TABLE `jy_base_org_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_position`
--

DROP TABLE IF EXISTS `jy_base_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_position` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `orgId` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_position`
--

LOCK TABLES `jy_base_position` WRITE;
/*!40000 ALTER TABLE `jy_base_position` DISABLE KEYS */;
INSERT INTO `jy_base_position` VALUES ('1','经理','2','manager','','2016-01-22 00:02:55',NULL),('b2da690b91b64408aba7fb820b1bf9cf','人事经理','8f080b6180564157aa173cc26e44d1dd','manager','','2016-02-27 19:13:06',NULL),('c63d54663fcc4e27a10e1e6f17772df8','董事长','1','president','','2016-01-22 00:45:00','2016-01-22 19:09:46'),('f6db550f89824d6bb0009fc04af3f25b','总经理','1','gmanager','','2016-01-22 00:47:01',NULL);
/*!40000 ALTER TABLE `jy_base_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_resources`
--

DROP TABLE IF EXISTS `jy_base_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_resources` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT 'Id',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '菜单名字',
  `parentId` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '父Id',
  `layer` int(11) NOT NULL,
  `type` int(4) NOT NULL DEFAULT '1' COMMENT '资源类型(1:为菜单，2:功能，3:按钮)',
  `resUrl` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单链接',
  `btnId` varchar(32) DEFAULT NULL,
  `btnFun` varchar(64) DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单Icon',
  `sort` int(10) DEFAULT NULL COMMENT '菜单顺序(由小到大排列)',
  `isValid` int(2) DEFAULT NULL COMMENT '是否有效(1:有效,0:无效)',
  `description` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_resources`
--

LOCK TABLES `jy_base_resources` WRITE;
/*!40000 ALTER TABLE `jy_base_resources` DISABLE KEYS */;
INSERT INTO `jy_base_resources` VALUES ('0576a0a5825a4c1eafb0fb88369e77f6','自动义菜单','51424721ec1c4574b2f2a7bc1833c17f',2,1,'/backstage/weixin/menu/index','','','icon-ellipsis-horizontal ',2,1,'','2015-12-30 22:44:19','2015-12-30 23:12:47'),('0759eb40124b42deae438213919e4dfa','增加','1f50b93daabf493c9d317cffbb0e739e',1,2,'/backstage/filevirtual/add','addBtn','','icon-plus-sign ',1,1,'','2016-12-13 13:14:03','2017-02-13 17:07:10'),('08693c30017e4e45acff89d300067269','系统工具','0',2,1,'','','','icon-legal ',4,1,'','2015-12-07 18:27:41','2016-01-30 00:24:22'),('0f5747e8beb24a15899cfd0c0f4c42c0','zTree3.5','6',3,1,'/static/apidoc/zTree/API_cn.html','','','icon-adn',35,1,'','2015-12-13 14:54:53','2016-01-30 18:36:38'),('1','基础管理','0',1,1,'','','','icon-qrcode',4,1,'','2015-07-15 16:35:17','2017-02-14 09:42:48'),('10','系统字典','13',1,1,'/backstage/sysDict/index','','','icon-dropbox',1,1,'','2015-09-14 16:57:39','2016-01-30 00:28:18'),('100','jQuery UI','6',3,1,'/static/apidoc/jquery/index.html','','','icon-adn',9,1,'jQuery UI','2015-10-09 17:35:39','2016-01-30 18:36:56'),('101','Shiro','6',3,1,'/static/apidoc/shiro/index.html','','','icon-adn',10,1,'','2015-10-23 10:30:14','2016-01-30 18:36:18'),('102','JY','6',3,1,'/static/apidoc/uucastle/index.html',NULL,NULL,'icon-adn',1,1,'JY','2015-11-04 15:32:19',NULL),('103','StringUtils','6',3,1,'/static/apidoc/StringUtils/index.html',NULL,NULL,'icon-adn',4,1,'StringUtils','2015-11-06 09:55:48',NULL),('11','系统首页','0',1,1,'/backstage/adv','','','icon-windows',1,1,'自定义广告页','2015-08-11 11:37:44','2016-01-21 12:19:06'),('12','Web监控','5',4,1,'/druid/index.html',NULL,NULL,'icon-bar-chart',1,1,'Web监控','2015-09-08 10:45:18',NULL),('13','字典管理','0',1,1,'','','','icon-book ',6,1,'','2015-09-25 13:20:42','2016-01-30 00:25:33'),('14','数据字典','13',1,1,'/backstage/dataDict/index','','','icon-stackexchange',2,1,'','2015-09-25 13:30:49','2016-01-30 00:28:55'),('15a7d1cec70c47bdbfd41c7f9c694481','删除','2',1,3,'/backstage/account/del','','del','icon-remove-sign color-red',4,1,'','2015-11-16 10:29:46','2015-11-24 14:53:34'),('161848b9e16e410e9d3fac6f9c91cad5','批量删除','4',1,2,'/backstage/resources/delBatch','delBatchBtn','','icon-trash color-red',2,1,'','2015-11-11 16:01:20','2015-11-13 15:21:27'),('17325e24f35348fd9a287152e3ea8b75','创建模型','55e7a2d527564d9790b9f00a00d34634',2,2,'/backstage/workflow/model/create','addBtn','','icon-plus-sign color-green',1,1,'','2016-01-18 17:42:36','2016-01-18 17:47:29'),('18756082926f41329e51d74dda3abc80','流程定义','58230413e8364b67af2bb65e64252260',2,1,'/backstage/workflow/process/index','','','icon-flickr ',5,1,'','2016-01-19 14:21:40','2016-01-19 20:13:21'),('1a90405b1bf143caa9f9a03f1e28dee9','查看扫描枪','64ef502000d843e389cbc8f006272905',1,3,'/backstage/scangun/find','','check','icon-zoom-in ',1,1,'','2017-02-13 17:15:05',NULL),('1bc2c9d3d8e644f1a25ce8321f2faf13','UEditor','6',3,1,'/static/plugins/ueditor/index.html','','','icon-play-circle ',12,1,'','2015-12-05 15:38:12','2016-01-30 18:36:26'),('1d906f69a7274cbd8b316903e66fc580','签收任务','9bc994928cc64fdca432fcad2a0b3ba9',3,1,'/backstage/workflow/online/myTask/signList','','','icon-envelope-alt ',1,1,'','2016-02-11 23:53:11',NULL),('1e2cd5e710224cf0ba09bbe5d4ee0009','批量删除','2',1,2,'/backstage/account/delBatch','delBatchBtn','','icon-trash color-red',2,1,'','2015-11-16 09:36:13','2016-01-22 18:39:20'),('1e87cc3913914c8aa80116270ed03a75','增加','a2eea33defc64462b3b3df9e64c461fb',2,2,'/backstage/task/scheduleJob/add','addBtn','','icon-plus-sign color-green',1,1,'','2015-12-24 11:28:59','2015-12-24 20:34:47'),('1f50b93daabf493c9d317cffbb0e739e','虚拟文件','71baa196316c4b16817f5644baaba373',1,1,'/backstage/filevirtual/index','','','icon-book ',10,1,'','2016-12-13 13:12:15','2017-02-13 17:06:32'),('2','用户管理','1',1,1,'/backstage/account/index','','','icon-group',1,1,'','2015-07-15 16:35:19','2016-01-30 00:28:06'),('21feb456e503484280232730687149f2','删除','14',1,3,'/backstage/dataDict/del','','del','icon-remove-sign color-red',3,1,'','2015-11-18 16:10:03','2015-11-24 14:25:00'),('25a4bc9c184a4d6c904ce7a3ccb26aae','图表处理','08693c30017e4e45acff89d300067269',2,1,'/backstage/tool/echarts/index','','','icon-align-left ',2,1,'','2015-12-16 15:36:29','2015-12-27 12:08:42'),('273e05eb764f48c18f832520e7ce141e','查看','7b30d8d43df347ada558df820bbec28b',2,3,'/backstage/weixin/follower/find','','check','icon-zoom-in color-purple',1,1,'','2015-12-30 15:43:34','2015-12-30 15:48:10'),('28d4a82889c341bdaceab323b9549245','查看','4',1,3,'/backstage/resources/find','','check','icon-zoom-in color-purple',1,1,'','2015-11-12 15:33:53','2015-11-12 16:19:30'),('3','组织管理','1',1,1,'/backstage/org/role/index','','','icon-github-alt',2,1,'','2015-07-15 16:35:21','2016-01-30 00:28:12'),('31b0fe86acea4fceb184aecfe521ff0d','Quartz','6',3,1,'/static/apidoc/quartz/index.html','','','icon-adn ',33,1,'','2015-12-24 23:03:43','2015-12-24 23:04:22'),('332072af224d42a4b2f340f30355b1e1','500','9727f259cd8542fc8756b7b9cee9dd54',3,1,'/500.jsp','','','icon-exclamation-sign ',100,1,'','2015-11-25 11:28:27','2015-12-13 14:51:32'),('343914e32c3b458ba797c080b0dfbf85','批量删除','7c1741c605c148c29113ac804f68f52b',4,2,'/backstage/loginLog/delBatch','delBatchBtn','','icon-trash color-red',1,1,'','2015-12-24 21:04:24','2015-12-24 21:09:33'),('34507436438c4c7eb9803fa160c2af3c','增加','14',1,2,'/backstage/dataDict/add','addBtn','','icon-plus-sign color-green',1,1,'','2015-11-18 16:03:55','2015-11-24 14:09:42'),('3a13a0f547cf40869a0f6aa9a86be910','跟踪明细','1f50b93daabf493c9d317cffbb0e739e',1,3,'/backstage/filevirtualTracker/find','','findTracker','icon-th-list ',1,1,'','2017-02-13 17:08:38',NULL),('3f184c74379c4b668030ba9e55c9caa3','修改','4',1,3,'/backstage/resources/update','','edit','icon-edit color-blue',2,1,'','2015-11-11 16:50:47','2015-11-12 16:19:24'),('4','菜单管理','1',1,1,'/backstage/resources/index','','','icon-th-large',4,1,'','2015-07-15 16:35:24','2016-01-30 00:28:27'),('4021171e506b47c083c77a2b96660031','上传流程模型','18756082926f41329e51d74dda3abc80',2,2,'/backstage/workflow/process/uploadModel','uploadModel','','icon-cloud-upload ',1,1,'','2016-03-19 18:00:59','2016-03-19 18:01:21'),('404','404','9727f259cd8542fc8756b7b9cee9dd54',3,1,'/404','','','icon-exclamation-sign ',99,1,'404','2015-10-30 17:18:31','2015-12-13 14:51:24'),('40a146e3febf4cafb930a077f1f048d3','配置管理','51424721ec1c4574b2f2a7bc1833c17f',2,1,'/backstage/weixin/config/index','','','icon-cog ',10,1,'','2015-12-30 21:27:02','2015-12-30 21:34:33'),('41','增加','4',1,2,'/backstage/resources/add','addBtn','','icon-plus-sign color-green',1,1,'增加','2015-11-06 11:21:29','2015-11-12 17:32:36'),('42a2938acb5e4a26b5ec2cc6089b7c2e','修改角色','3',1,3,'/backstage/org/role/update','','edit','icon-edit color-blue',3,1,'','2015-11-13 17:13:52','2016-01-22 12:42:42'),('47ff0c409f314b07b52ba13f1bb81586','导出','55e7a2d527564d9790b9f00a00d34634',2,3,'/backstage/workflow/model/export','','exportForm','icon-cloud-download color-pale-orange',3,1,'','2016-01-18 19:04:39','2016-01-18 19:13:50'),('4971ebc1cea343e4afec5d22b1cd45bd','批量删除','1f50b93daabf493c9d317cffbb0e739e',1,2,'/backstage/filevirtual/delBatch','delBatchBtn','','icon-trash ',1,1,'','2016-12-13 13:15:38','2017-02-13 17:15:40'),('4c97ca25b7e940948b3d403c3b091c81','增加角色','3',1,2,'/backstage/org/role/add','addBtn','','icon-plus-sign color-green',1,1,'','2015-11-13 10:12:20','2016-01-22 12:43:20'),('4ee50d1722a34edeb6c15bdbf29e556b','查看角色','3',1,3,'/backstage/org/role/find','','check','icon-zoom-in color-purple',2,1,'','2015-11-13 16:27:36','2016-01-22 12:42:52'),('4f057f1a6d05416fbb06206b2aaffb10','页面UI','6',3,1,'/static/apidoc/JYUI/index.html','','','icon-html5 ',2,1,'','2016-01-30 18:33:58','2016-01-30 18:38:16'),('5','监控管理','0',4,1,'','','','icon-linux',10,1,'','2015-07-15 16:35:25','2016-01-30 03:32:24'),('51424721ec1c4574b2f2a7bc1833c17f','微信管理','0',2,1,'','','','icon-comments-alt ',8,1,'','2015-12-27 15:22:08','2016-01-30 00:24:04'),('51aa6b0b037340b9ae88d22d2a354acf','授权角色权限','3',1,3,'/backstage/org/role/listAuthorized','','authorized','icon-key color-dark-green',1,1,'','2015-11-13 17:41:57','2016-01-22 12:43:02'),('51e4dbe2fca84cb09192d86019e7cad8','删除扫描枪','64ef502000d843e389cbc8f006272905',1,3,'/backstage/scangun/del','','del','icon-remove-sign ',1,1,'','2017-02-13 17:13:33',NULL),('52910f91bf3e4b71af4ded1ef67bba48','历史流程','58230413e8364b67af2bb65e64252260',2,1,'/backstage/workflow/instance/his/index','','','icon-save ',4,1,'','2016-01-20 11:45:23','2016-02-12 13:02:46'),('55053558dc4f4ab0983337386969aced','启动任务','a2eea33defc64462b3b3df9e64c461fb',2,3,'/backstage/task/scheduleJob/resumeJob','','resumeJob','icon-play color-bright-blue',2,1,'','2015-12-24 18:03:54','2015-12-24 20:35:11'),('553ddbde34994fd3ba1e679e712078e7','增加','64ef502000d843e389cbc8f006272905',1,2,'/backstage/scangun/add','addBtn','','icon-plus-sign ',1,1,'','2017-02-13 17:11:56',NULL),('55e7a2d527564d9790b9f00a00d34634','模型工作区','58230413e8364b67af2bb65e64252260',2,1,'/backstage/workflow/model/index','','','icon-edit-sign ',10,1,'','2016-01-08 00:28:33','2016-01-19 14:05:01'),('58230413e8364b67af2bb65e64252260','工作流管理','0',2,1,'','','','icon-briefcase ',3,1,'','2016-01-08 00:27:03','2016-01-30 00:24:53'),('5ba75d14f5b74572bd5ff35d12c58060','删除角色','3',1,3,'/backstage/org/role/del','','del','icon-remove-sign color-red',4,1,'','2015-11-13 17:21:08','2016-01-22 12:42:29'),('5c6d6461e5c94a9e9954fd003af76349','删除文件','1f50b93daabf493c9d317cffbb0e739e',1,3,'/backstage/filevirtual/del','','del','icon-remove-sign ',1,1,'','2016-12-13 13:19:07','2017-02-13 17:09:01'),('5d1b45e9b6a84bccb212758ce8f2e906','同步关注者数据','7b30d8d43df347ada558df820bbec28b',2,2,'/backstage/weixin/follower/syncFollower','syncFollowerBtn','','icon-cloud-download color-pale-blue',1,1,'','2015-12-30 15:42:47','2015-12-30 15:46:04'),('6','Api','0',3,1,'','','','icon-adn',98,1,'Api','2015-09-23 15:56:37','2016-01-30 00:24:45'),('63d70cc36a574f70b7edc754d0785107','查看文件','1f50b93daabf493c9d317cffbb0e739e',1,3,'/backstage/filevirtual/find','','check','icon-zoom-in ',1,1,'','2016-12-13 13:17:31','2017-02-13 17:09:27'),('64ef502000d843e389cbc8f006272905','扫描枪','7434d956ce904e2ba6db1dd7933de4e4',1,1,'/backstage/scangun/index','','','icon-camera ',1,1,'','2017-02-13 17:11:14',NULL),('6d44f1553c424e5c81bd3ed9a4e162f3','删除','4',1,3,'/backstage/resources/del','','del','icon-remove-sign color-red',3,1,'','2015-11-12 16:23:58','2015-11-12 16:31:33'),('6ea62cf0820248a6a2780a885b82a99d','修改','14',1,3,'/backstage/dataDict/update','','edit','icon-edit color-blue',2,1,'','2015-11-18 16:11:53','2015-11-24 14:10:05'),('709d24289f6a48fb95396bfd3c45fb42','修改扫描枪','64ef502000d843e389cbc8f006272905',1,3,'/backstage/scangun/update','','edit','icon-edit ',1,1,'','2017-02-13 17:14:21',NULL),('71baa196316c4b16817f5644baaba373','虚拟文件管理','0',1,1,'','','','icon-file-alt ',2,1,'','2017-02-13 17:05:28','2017-02-14 09:42:26'),('72cbdeff2aea4aea8f348bb6d779a87d','删除模型','55e7a2d527564d9790b9f00a00d34634',2,3,'/backstage/workflow/model/del','','del','icon-remove-sign color-red',6,1,'','2016-01-18 18:27:01','2016-01-18 18:27:32'),('7434d956ce904e2ba6db1dd7933de4e4','扫描枪管理','0',1,1,'','','','icon-camera ',3,1,'','2017-02-13 17:10:15','2017-02-14 09:42:35'),('747a8ddc90b844c3a12dbe920e777052','可拖动上传','82652011fe8549d18d4652567f7b1610',2,1,'/backstage/tool/webuploader/test/more','','','icon-folder-open-alt ',3,1,'','2016-01-06 17:55:19','2016-01-06 17:55:48'),('75288771d60d4510affe8cb97f42897f','删除','10',1,3,'/backstage/sysDict/del','','del','icon-remove-sign color-red',3,1,'','2015-11-16 16:38:16','2015-11-24 11:33:16'),('7537535a8b5d44009f52a3e84ca5dfd8','编辑模型','55e7a2d527564d9790b9f00a00d34634',2,3,'/backstage/workflow/model/edit','','edit','icon-edit color-blue',1,1,'','2016-01-18 18:02:28','2016-01-18 18:28:08'),('7579afb168b04a3d99fff9dbe956936e','定时任务日志','b78f7224d001404c92479532c614dffa',2,1,'/backstage/task/taskLog/index','','','icon-eye-open ',2,1,'','2015-12-24 19:51:42','2015-12-24 20:30:38'),('76ac6ca0335e4e62a9fd9f744226e6f0','批量删除','64ef502000d843e389cbc8f006272905',1,2,'/backstage/scangun/delBatch','delBatchBtn','','icon-trash ',3,1,'','2017-02-13 17:12:44','2017-02-13 17:15:22'),('78b1bf1c0723433099c458e75a8c6901','修改','10',1,3,'/backstage/sysDict/update','','edit','icon-edit color-blue',2,1,'','2015-11-16 16:37:44','2015-11-24 14:08:26'),('79a76d451f3948f4963b97b6d5bbbf3c','邮箱中心','08693c30017e4e45acff89d300067269',2,1,'/backstage/tool/email/index','','','icon-envelope-alt ',1,1,'','2015-12-02 15:57:52','2015-12-25 17:32:49'),('7b30d8d43df347ada558df820bbec28b','关注者管理','51424721ec1c4574b2f2a7bc1833c17f',2,1,'/backstage/weixin/follower/index','','','icon-group ',1,1,'','2015-12-29 23:52:59','2015-12-29 23:53:34'),('7c1741c605c148c29113ac804f68f52b','登录日志','5',4,1,'/backstage/loginLog/index','','','icon-eye-open ',2,1,'','2015-11-25 16:56:41','2015-11-25 17:17:37'),('7d6a6b7594b14807a3def610f6595804','导出日志','7579afb168b04a3d99fff9dbe956936e',2,2,'/backstage/task/taskLog/exportXls','exportXls','','icon-table color-dark-green',1,1,'','2016-01-07 19:24:05','2016-01-07 23:10:20'),('82652011fe8549d18d4652567f7b1610','上传工具','08693c30017e4e45acff89d300067269',2,1,'','','','icon-cloud-upload ',5,1,'','2016-01-06 17:52:47',NULL),('83984d22f9da4991833f506695307b6f','查看','2',1,3,'/backstage/account/find','','check','icon-zoom-in color-purple',2,1,'','2015-11-16 09:49:48','2015-11-24 14:52:57'),('89ff6bdf54ca4501a264adba8eb0ee39','修改','2',1,3,'/backstage/account/update','','edit','icon-edit color-blue',3,1,'','2015-11-16 10:29:15','2015-11-24 14:53:21'),('8cc0bcbb9bae4ebe81d263de37ef15a6','二维码处理','08693c30017e4e45acff89d300067269',2,1,'/backstage/tool/qrCode/index','','','icon-barcode ',3,1,'','2016-04-03 16:24:40',NULL),('9037c1737a904fc3bf18e0ef7a6b6e05','接口工具','08693c30017e4e45acff89d300067269',2,1,'/backstage/tool/interfaceTest/index','','','icon-resize-small ',5,1,'','2016-04-09 19:24:49',NULL),('9575841c8b6a4c58b10e97d82320fd02','增加','10',1,2,'/backstage/sysDict/add','addBtn','','icon-plus-sign color-green',1,1,'','2015-11-16 16:30:02','2015-11-24 11:19:42'),('9727f259cd8542fc8756b7b9cee9dd54','错误页','6',3,1,'','','','icon-tag ',200,1,'','2015-12-13 14:51:00','2016-02-10 17:58:46'),('9ba1dbda9e414eff8591cda4aea34c32','批量删除','7579afb168b04a3d99fff9dbe956936e',2,2,'/backstage/task/taskLog/delBatch','delBatchBtn','','icon-trash color-red',2,1,'','2015-12-24 21:05:06','2016-01-07 22:59:22'),('9bc994928cc64fdca432fcad2a0b3ba9','我的任务','e750134d22094ef3a611fe8300c351e9',3,1,'','','','icon-signout ',2,1,'','2016-01-20 11:59:17','2016-02-12 13:12:35'),('9bd48a7e0ca74b77b577411c8e4b7c2b','运行一次任务','a2eea33defc64462b3b3df9e64c461fb',2,3,'/backstage/task/scheduleJob/runOnce','','runOnce','icon-step-forward color-yellow',1,1,'','2015-12-24 18:08:11','2015-12-24 20:34:54'),('9cff3045dd824773a70c5a887a2f71ef','待办任务','9bc994928cc64fdca432fcad2a0b3ba9',3,1,'/backstage/workflow/online/myTask/todoList','','','icon-tags ',2,1,'','2016-02-11 23:53:52',NULL),('a103f06e9c7f4e8aafc5eaf4c735fd91','任务申请','e750134d22094ef3a611fe8300c351e9',3,1,'','','','icon-paste ',1,1,'','2016-01-20 12:33:14','2016-01-20 16:35:43'),('a1b4ef2728d9456aa4e9a85d68c6029e','文件上传','82652011fe8549d18d4652567f7b1610',2,1,'/backstage/tool/webuploader/test/file','','','icon-folder-close ',2,1,'','2016-01-06 17:54:09',NULL),('a201aa381c3447aeaae23bdb478b3a06','删除流程','18756082926f41329e51d74dda3abc80',2,3,'/backstage/workflow/process/del','','del','icon-remove-sign color-red',1,1,'','2016-01-19 17:47:55','2016-01-19 18:03:39'),('a213cc3a8be64a77b9d8673619230a87','修改任务','a2eea33defc64462b3b3df9e64c461fb',2,3,'/backstage/task/scheduleJob/update','','edit','icon-edit color-blue',5,1,'','2015-12-24 12:42:10','2015-12-24 20:35:35'),('a2eea33defc64462b3b3df9e64c461fb','定时任务管理','b78f7224d001404c92479532c614dffa',2,1,'/backstage/task/scheduleJob/index','','','icon-list-alt ',1,1,'','2015-12-23 18:17:34','2015-12-24 20:34:40'),('ae8fea67b8434987b718c51fe83bb45d','增加','2',1,2,'/backstage/account/add','addBtn','','icon-plus-sign color-green',1,1,'','2015-11-15 17:34:33','2015-11-24 14:52:44'),('b776518dfdd940e394a15de3974a8610','运行中流程','58230413e8364b67af2bb65e64252260',2,1,'/backstage/workflow/instance/pro/index','','','icon-expand ',1,1,'','2016-01-19 14:01:38','2016-02-12 13:02:37'),('b78f7224d001404c92479532c614dffa','任务中心','0',2,1,'','','','icon-bell-alt ',7,1,'','2015-12-23 18:15:23','2016-01-30 00:24:15'),('b7d11fca02b04742814eb664454d7473','地图工具','08693c30017e4e45acff89d300067269',2,1,'/backstage/tool/map/index','','','icon-screenshot ',3,1,'','2015-12-25 17:32:30','2015-12-25 17:33:12'),('b8203143736e4e549b2e0fc3c617d4c4','转换模型','18756082926f41329e51d74dda3abc80',2,3,'/backstage/workflow/process/convertToModel','','convertToModel','icon-edit-sign color-gray',2,1,'','2016-01-19 17:50:41','2016-01-19 18:18:46'),('bf888841c15e4da5858299ef99376eb4','图片上传','82652011fe8549d18d4652567f7b1610',2,1,'/backstage/tool/webuploader/test/img','','','icon-picture ',1,1,'','2016-01-06 17:53:33','2016-01-06 18:02:58'),('c45d42dce99d4faa82701951a24b70cf','生成封面','1f50b93daabf493c9d317cffbb0e739e',1,3,'/backstage/filevirtual/createBarcode','','createBarcode','icon-paper-clip ',1,1,'','2017-04-17 16:57:43','2017-04-17 17:07:39'),('c669fba98a9446999b62d15bfff1c412','删除任务','a2eea33defc64462b3b3df9e64c461fb',2,3,'/backstage/task/scheduleJob/del','','del','icon-remove-sign color-red',6,1,'','2015-12-24 12:42:59','2015-12-24 20:35:02'),('c73d630ab1004b5a9b71836e8b000de9','职务管理','1',1,1,'/backstage/org/position/index','','','icon-user-md ',3,1,'','2016-01-21 23:13:00','2016-01-22 00:17:08'),('c9c822f6c7b94650a6f3944c53738caf','部署','55e7a2d527564d9790b9f00a00d34634',2,3,'/backstage/workflow/model/deploy','','deployModel','icon-retweet color-bright-blue',2,1,'','2016-01-18 19:11:59','2016-01-18 23:08:04'),('cd7ef89bf12f4ceb98861cf2bcbc96b1','查看','10',1,3,'/backstage/sysDict/find','','check','icon-zoom-in color-purple',1,1,'','2015-11-16 16:37:11','2015-11-24 14:25:48'),('d22f22f0bc9a4ad2a6464cca6497a7b4','批量删除角色','3',1,2,'/backstage/org/role/delBatch','delBatchBtn','','icon-trash color-red',2,1,'','2015-11-13 15:21:16','2016-01-22 12:43:12'),('d7e2c67c169c43959fdc6a95097bcbc8','修改文件','1f50b93daabf493c9d317cffbb0e739e',1,3,'/backstage/filevirtual/update','','edit','icon-edit ',1,1,'','2016-12-13 13:18:25','2017-02-13 17:09:37'),('dbb1d5db4d7b419db1d221b102a7ad51','批量删除','14',1,2,'/backstage/dataDict/delBatch','delBatchBtn','','icon-trash color-red',2,1,'','2015-11-18 16:06:31','2015-11-24 14:16:46'),('dc4a83f740f54f6b89916321968cbcd3','请假申请','a103f06e9c7f4e8aafc5eaf4c735fd91',3,1,'/backstage/workflow/online/apply/index','','','icon-paste ',1,1,'','2016-01-20 16:45:09','2016-01-20 17:40:09'),('dde1c043e77d48b4ac2f15806a0aec14','批量删除','10',1,2,'/backstage/sysDict/delBatch','delBatchBtn','','icon-trash color-red',2,1,'','2015-11-16 16:30:33','2015-11-24 14:24:50'),('de998a250fcb4c2ab88981f2093d54f3','查看任务','a2eea33defc64462b3b3df9e64c461fb',2,3,'/backstage/task/scheduleJob/find','','check','icon-zoom-in color-purple',4,1,'','2015-12-24 12:40:39','2015-12-24 20:35:27'),('e49f8b358da2404293f6ac4e7f7a7a30','已结束任务','e750134d22094ef3a611fe8300c351e9',3,1,'/backstage/workflow/online/his/index','','','icon-save ',4,1,'','2016-01-20 12:32:28','2016-01-28 19:04:14'),('e750134d22094ef3a611fe8300c351e9','在线办公','0',3,1,'','','','icon-bell ',3,1,'','2016-01-20 11:49:47','2016-01-30 00:24:41'),('e9480dd6590a4e14a443ee8f76873fd3','查看','14',1,3,'/backstage/dataDict/find','','check','icon-zoom-in color-purple',1,1,'','2015-11-18 16:11:18','2015-11-24 14:10:24'),('eebae621fd6942be908ef783c6e57d35','打印封面','1f50b93daabf493c9d317cffbb0e739e',1,3,'/backstage/filevirtual/createFace','','createFace','icon-list-alt ',1,1,'','2017-04-17 17:01:35','2017-04-17 17:19:48'),('ef3a950b6154459589acc7dd7145e0ed','暂停任务','a2eea33defc64462b3b3df9e64c461fb',2,3,'/backstage/task/scheduleJob/pauseJob','','pauseJob','icon-pause color-dark-gray',3,1,'','2015-12-24 18:05:55','2015-12-24 20:35:19'),('f541a86e629d4eefb014309c921a237e','运行中任务','e750134d22094ef3a611fe8300c351e9',3,1,'/backstage/workflow/online/run/index','','','icon-expand ',3,1,'','2016-01-20 12:31:55','2016-01-28 18:24:09'),('fa04b6fe03944f2a9c040dbc9071af9b','密码重置','2',1,3,'/backstage/account/resetPwd','','resetPwd','icon-unlock-alt color-pale-orange',1,1,'','2015-11-16 10:49:17','2015-11-26 17:16:54');
/*!40000 ALTER TABLE `jy_base_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_role`
--

DROP TABLE IF EXISTS `jy_base_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_role` (
  `id` varchar(32) NOT NULL,
  `orgId` varchar(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `isValid` int(2) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_role`
--

LOCK TABLES `jy_base_role` WRITE;
/*!40000 ALTER TABLE `jy_base_role` DISABLE KEYS */;
INSERT INTO `jy_base_role` VALUES ('00aeae250ffd43cd94d1f417c08f8fde','c86c602ef10e4a30aac9286f82c54c7e','一处公文管理员',1,'','2017-11-01 16:08:24',NULL),('0d5242efbc4f4d9995121f6062d431a9','0a715b759765419f89bc0326e08e9ac5','二处公文管理员',1,'','2017-02-15 08:57:18',NULL),('0f9600afc9274f74b16db37a784a84dc','11','业务员',1,'','2015-12-14 23:07:42',NULL),('1','2','普通角色',1,'普通角色',NULL,'2015-11-24 15:12:08'),('18a0e4a91b9f490da700fe59c7b7da2d','3','普通角色',1,'','2016-12-13 15:24:10',NULL),('2','2','管理员',1,'管理员',NULL,NULL),('20bd50a12fdf4290ba719c72bfc91849','8f080b6180564157aa173cc26e44d1dd','财务处公文管理员',1,'','2016-02-27 19:10:00','2017-11-01 16:10:38'),('3','4','超级管理员',1,'超级管理员',NULL,'2015-12-10 01:28:51'),('4','4','开发者',1,'开发者',NULL,NULL),('8661d9bfe9a74e08b4834e66fdf9e3f1','de249466902a4f839f16efb73a592072','三处公文管理员',1,'','2017-11-01 16:08:58',NULL),('b3c3e4cc8d5d4aac89a4020f459e9934','1','办公室508',1,'','2017-05-11 20:58:21',NULL);
/*!40000 ALTER TABLE `jy_base_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_role_resources`
--

DROP TABLE IF EXISTS `jy_base_role_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_role_resources` (
  `role_id` varchar(32) NOT NULL,
  `resources_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`resources_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_role_resources`
--

LOCK TABLES `jy_base_role_resources` WRITE;
/*!40000 ALTER TABLE `jy_base_role_resources` DISABLE KEYS */;
INSERT INTO `jy_base_role_resources` VALUES ('00aeae250ffd43cd94d1f417c08f8fde','11'),('00aeae250ffd43cd94d1f417c08f8fde','1f50b93daabf493c9d317cffbb0e739e'),('00aeae250ffd43cd94d1f417c08f8fde','3a13a0f547cf40869a0f6aa9a86be910'),('00aeae250ffd43cd94d1f417c08f8fde','63d70cc36a574f70b7edc754d0785107'),('00aeae250ffd43cd94d1f417c08f8fde','71baa196316c4b16817f5644baaba373'),('0d5242efbc4f4d9995121f6062d431a9','1f50b93daabf493c9d317cffbb0e739e'),('0d5242efbc4f4d9995121f6062d431a9','3a13a0f547cf40869a0f6aa9a86be910'),('0d5242efbc4f4d9995121f6062d431a9','63d70cc36a574f70b7edc754d0785107'),('0d5242efbc4f4d9995121f6062d431a9','71baa196316c4b16817f5644baaba373'),('0f9600afc9274f74b16db37a784a84dc','08693c30017e4e45acff89d300067269'),('0f9600afc9274f74b16db37a784a84dc','79a76d451f3948f4963b97b6d5bbbf3c'),('1','1'),('1','2'),('2','1'),('2','15a7d1cec70c47bdbfd41c7f9c694481'),('2','161848b9e16e410e9d3fac6f9c91cad5'),('2','1e2cd5e710224cf0ba09bbe5d4ee0009'),('2','2'),('2','28d4a82889c341bdaceab323b9549245'),('2','3'),('2','3f184c74379c4b668030ba9e55c9caa3'),('2','4'),('2','41'),('2','42a2938acb5e4a26b5ec2cc6089b7c2e'),('2','4c97ca25b7e940948b3d403c3b091c81'),('2','4ee50d1722a34edeb6c15bdbf29e556b'),('2','51aa6b0b037340b9ae88d22d2a354acf'),('2','5ba75d14f5b74572bd5ff35d12c58060'),('2','6d44f1553c424e5c81bd3ed9a4e162f3'),('2','83984d22f9da4991833f506695307b6f'),('2','89ff6bdf54ca4501a264adba8eb0ee39'),('2','ae8fea67b8434987b718c51fe83bb45d'),('2','d22f22f0bc9a4ad2a6464cca6497a7b4'),('2','fa04b6fe03944f2a9c040dbc9071af9b'),('20bd50a12fdf4290ba719c72bfc91849','11'),('20bd50a12fdf4290ba719c72bfc91849','17325e24f35348fd9a287152e3ea8b75'),('20bd50a12fdf4290ba719c72bfc91849','18756082926f41329e51d74dda3abc80'),('20bd50a12fdf4290ba719c72bfc91849','1d906f69a7274cbd8b316903e66fc580'),('20bd50a12fdf4290ba719c72bfc91849','1f50b93daabf493c9d317cffbb0e739e'),('20bd50a12fdf4290ba719c72bfc91849','3a13a0f547cf40869a0f6aa9a86be910'),('20bd50a12fdf4290ba719c72bfc91849','47ff0c409f314b07b52ba13f1bb81586'),('20bd50a12fdf4290ba719c72bfc91849','52910f91bf3e4b71af4ded1ef67bba48'),('20bd50a12fdf4290ba719c72bfc91849','55e7a2d527564d9790b9f00a00d34634'),('20bd50a12fdf4290ba719c72bfc91849','58230413e8364b67af2bb65e64252260'),('20bd50a12fdf4290ba719c72bfc91849','63d70cc36a574f70b7edc754d0785107'),('20bd50a12fdf4290ba719c72bfc91849','71baa196316c4b16817f5644baaba373'),('20bd50a12fdf4290ba719c72bfc91849','72cbdeff2aea4aea8f348bb6d779a87d'),('20bd50a12fdf4290ba719c72bfc91849','7537535a8b5d44009f52a3e84ca5dfd8'),('20bd50a12fdf4290ba719c72bfc91849','9bc994928cc64fdca432fcad2a0b3ba9'),('20bd50a12fdf4290ba719c72bfc91849','9cff3045dd824773a70c5a887a2f71ef'),('20bd50a12fdf4290ba719c72bfc91849','a103f06e9c7f4e8aafc5eaf4c735fd91'),('20bd50a12fdf4290ba719c72bfc91849','a201aa381c3447aeaae23bdb478b3a06'),('20bd50a12fdf4290ba719c72bfc91849','b776518dfdd940e394a15de3974a8610'),('20bd50a12fdf4290ba719c72bfc91849','b8203143736e4e549b2e0fc3c617d4c4'),('20bd50a12fdf4290ba719c72bfc91849','c9c822f6c7b94650a6f3944c53738caf'),('20bd50a12fdf4290ba719c72bfc91849','dc4a83f740f54f6b89916321968cbcd3'),('20bd50a12fdf4290ba719c72bfc91849','e49f8b358da2404293f6ac4e7f7a7a30'),('20bd50a12fdf4290ba719c72bfc91849','e750134d22094ef3a611fe8300c351e9'),('20bd50a12fdf4290ba719c72bfc91849','f541a86e629d4eefb014309c921a237e'),('3','0576a0a5825a4c1eafb0fb88369e77f6'),('3','0759eb40124b42deae438213919e4dfa'),('3','08693c30017e4e45acff89d300067269'),('3','0f5747e8beb24a15899cfd0c0f4c42c0'),('3','1'),('3','100'),('3','101'),('3','102'),('3','103'),('3','11'),('3','12'),('3','15a7d1cec70c47bdbfd41c7f9c694481'),('3','161848b9e16e410e9d3fac6f9c91cad5'),('3','18756082926f41329e51d74dda3abc80'),('3','1a90405b1bf143caa9f9a03f1e28dee9'),('3','1bc2c9d3d8e644f1a25ce8321f2faf13'),('3','1d906f69a7274cbd8b316903e66fc580'),('3','1e2cd5e710224cf0ba09bbe5d4ee0009'),('3','1e87cc3913914c8aa80116270ed03a75'),('3','1f50b93daabf493c9d317cffbb0e739e'),('3','2'),('3','25a4bc9c184a4d6c904ce7a3ccb26aae'),('3','273e05eb764f48c18f832520e7ce141e'),('3','28d4a82889c341bdaceab323b9549245'),('3','3'),('3','31b0fe86acea4fceb184aecfe521ff0d'),('3','343914e32c3b458ba797c080b0dfbf85'),('3','3a13a0f547cf40869a0f6aa9a86be910'),('3','3f184c74379c4b668030ba9e55c9caa3'),('3','4'),('3','40a146e3febf4cafb930a077f1f048d3'),('3','41'),('3','42a2938acb5e4a26b5ec2cc6089b7c2e'),('3','47ff0c409f314b07b52ba13f1bb81586'),('3','4971ebc1cea343e4afec5d22b1cd45bd'),('3','4c97ca25b7e940948b3d403c3b091c81'),('3','4ee50d1722a34edeb6c15bdbf29e556b'),('3','4f057f1a6d05416fbb06206b2aaffb10'),('3','5'),('3','51424721ec1c4574b2f2a7bc1833c17f'),('3','51aa6b0b037340b9ae88d22d2a354acf'),('3','51e4dbe2fca84cb09192d86019e7cad8'),('3','52910f91bf3e4b71af4ded1ef67bba48'),('3','55053558dc4f4ab0983337386969aced'),('3','553ddbde34994fd3ba1e679e712078e7'),('3','55e7a2d527564d9790b9f00a00d34634'),('3','58230413e8364b67af2bb65e64252260'),('3','5ba75d14f5b74572bd5ff35d12c58060'),('3','5c6d6461e5c94a9e9954fd003af76349'),('3','5d1b45e9b6a84bccb212758ce8f2e906'),('3','6'),('3','63d70cc36a574f70b7edc754d0785107'),('3','64ef502000d843e389cbc8f006272905'),('3','6d44f1553c424e5c81bd3ed9a4e162f3'),('3','709d24289f6a48fb95396bfd3c45fb42'),('3','71baa196316c4b16817f5644baaba373'),('3','72cbdeff2aea4aea8f348bb6d779a87d'),('3','7434d956ce904e2ba6db1dd7933de4e4'),('3','747a8ddc90b844c3a12dbe920e777052'),('3','7579afb168b04a3d99fff9dbe956936e'),('3','76ac6ca0335e4e62a9fd9f744226e6f0'),('3','79a76d451f3948f4963b97b6d5bbbf3c'),('3','7b30d8d43df347ada558df820bbec28b'),('3','7c1741c605c148c29113ac804f68f52b'),('3','7d6a6b7594b14807a3def610f6595804'),('3','82652011fe8549d18d4652567f7b1610'),('3','83984d22f9da4991833f506695307b6f'),('3','89ff6bdf54ca4501a264adba8eb0ee39'),('3','9ba1dbda9e414eff8591cda4aea34c32'),('3','9bc994928cc64fdca432fcad2a0b3ba9'),('3','9bd48a7e0ca74b77b577411c8e4b7c2b'),('3','9cff3045dd824773a70c5a887a2f71ef'),('3','a103f06e9c7f4e8aafc5eaf4c735fd91'),('3','a1b4ef2728d9456aa4e9a85d68c6029e'),('3','a201aa381c3447aeaae23bdb478b3a06'),('3','a213cc3a8be64a77b9d8673619230a87'),('3','a2eea33defc64462b3b3df9e64c461fb'),('3','ae8fea67b8434987b718c51fe83bb45d'),('3','b776518dfdd940e394a15de3974a8610'),('3','b78f7224d001404c92479532c614dffa'),('3','b7d11fca02b04742814eb664454d7473'),('3','b8203143736e4e549b2e0fc3c617d4c4'),('3','bf888841c15e4da5858299ef99376eb4'),('3','c45d42dce99d4faa82701951a24b70cf'),('3','c669fba98a9446999b62d15bfff1c412'),('3','c9c822f6c7b94650a6f3944c53738caf'),('3','d22f22f0bc9a4ad2a6464cca6497a7b4'),('3','d7e2c67c169c43959fdc6a95097bcbc8'),('3','dc4a83f740f54f6b89916321968cbcd3'),('3','de998a250fcb4c2ab88981f2093d54f3'),('3','e49f8b358da2404293f6ac4e7f7a7a30'),('3','e750134d22094ef3a611fe8300c351e9'),('3','eebae621fd6942be908ef783c6e57d35'),('3','ef3a950b6154459589acc7dd7145e0ed'),('3','f541a86e629d4eefb014309c921a237e'),('3','fa04b6fe03944f2a9c040dbc9071af9b'),('4','0576a0a5825a4c1eafb0fb88369e77f6'),('4','08693c30017e4e45acff89d300067269'),('4','0f5747e8beb24a15899cfd0c0f4c42c0'),('4','1'),('4','100'),('4','101'),('4','102'),('4','103'),('4','11'),('4','12'),('4','17325e24f35348fd9a287152e3ea8b75'),('4','18756082926f41329e51d74dda3abc80'),('4','1bc2c9d3d8e644f1a25ce8321f2faf13'),('4','1d906f69a7274cbd8b316903e66fc580'),('4','1e2cd5e710224cf0ba09bbe5d4ee0009'),('4','1e87cc3913914c8aa80116270ed03a75'),('4','2'),('4','25a4bc9c184a4d6c904ce7a3ccb26aae'),('4','273e05eb764f48c18f832520e7ce141e'),('4','31b0fe86acea4fceb184aecfe521ff0d'),('4','332072af224d42a4b2f340f30355b1e1'),('4','343914e32c3b458ba797c080b0dfbf85'),('4','4021171e506b47c083c77a2b96660031'),('4','404'),('4','40a146e3febf4cafb930a077f1f048d3'),('4','47ff0c409f314b07b52ba13f1bb81586'),('4','4f057f1a6d05416fbb06206b2aaffb10'),('4','5'),('4','51424721ec1c4574b2f2a7bc1833c17f'),('4','52910f91bf3e4b71af4ded1ef67bba48'),('4','55053558dc4f4ab0983337386969aced'),('4','55e7a2d527564d9790b9f00a00d34634'),('4','58230413e8364b67af2bb65e64252260'),('4','5d1b45e9b6a84bccb212758ce8f2e906'),('4','6'),('4','72cbdeff2aea4aea8f348bb6d779a87d'),('4','747a8ddc90b844c3a12dbe920e777052'),('4','7537535a8b5d44009f52a3e84ca5dfd8'),('4','7579afb168b04a3d99fff9dbe956936e'),('4','79a76d451f3948f4963b97b6d5bbbf3c'),('4','7b30d8d43df347ada558df820bbec28b'),('4','7c1741c605c148c29113ac804f68f52b'),('4','7d6a6b7594b14807a3def610f6595804'),('4','82652011fe8549d18d4652567f7b1610'),('4','83984d22f9da4991833f506695307b6f'),('4','8cc0bcbb9bae4ebe81d263de37ef15a6'),('4','9037c1737a904fc3bf18e0ef7a6b6e05'),('4','9727f259cd8542fc8756b7b9cee9dd54'),('4','9ba1dbda9e414eff8591cda4aea34c32'),('4','9bc994928cc64fdca432fcad2a0b3ba9'),('4','9bd48a7e0ca74b77b577411c8e4b7c2b'),('4','9cff3045dd824773a70c5a887a2f71ef'),('4','a103f06e9c7f4e8aafc5eaf4c735fd91'),('4','a1b4ef2728d9456aa4e9a85d68c6029e'),('4','a201aa381c3447aeaae23bdb478b3a06'),('4','a213cc3a8be64a77b9d8673619230a87'),('4','a2eea33defc64462b3b3df9e64c461fb'),('4','ae8fea67b8434987b718c51fe83bb45d'),('4','b776518dfdd940e394a15de3974a8610'),('4','b78f7224d001404c92479532c614dffa'),('4','b7d11fca02b04742814eb664454d7473'),('4','b8203143736e4e549b2e0fc3c617d4c4'),('4','bf888841c15e4da5858299ef99376eb4'),('4','c669fba98a9446999b62d15bfff1c412'),('4','c9c822f6c7b94650a6f3944c53738caf'),('4','dc4a83f740f54f6b89916321968cbcd3'),('4','de998a250fcb4c2ab88981f2093d54f3'),('4','e49f8b358da2404293f6ac4e7f7a7a30'),('4','e750134d22094ef3a611fe8300c351e9'),('4','ef3a950b6154459589acc7dd7145e0ed'),('4','f541a86e629d4eefb014309c921a237e'),('8661d9bfe9a74e08b4834e66fdf9e3f1','1f50b93daabf493c9d317cffbb0e739e'),('8661d9bfe9a74e08b4834e66fdf9e3f1','3a13a0f547cf40869a0f6aa9a86be910'),('8661d9bfe9a74e08b4834e66fdf9e3f1','63d70cc36a574f70b7edc754d0785107'),('8661d9bfe9a74e08b4834e66fdf9e3f1','71baa196316c4b16817f5644baaba373');
/*!40000 ALTER TABLE `jy_base_role_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_base_scan_gun`
--

DROP TABLE IF EXISTS `jy_base_scan_gun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_base_scan_gun` (
  `id` varchar(32) NOT NULL COMMENT '扫描枪Id',
  `gunNo` varchar(32) NOT NULL COMMENT '扫描枪编码',
  `orgId` varchar(32) DEFAULT NULL COMMENT '所属部门(对应jy_base_org的Id)',
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_base_scan_gun`
--

LOCK TABLES `jy_base_scan_gun` WRITE;
/*!40000 ALTER TABLE `jy_base_scan_gun` DISABLE KEYS */;
INSERT INTO `jy_base_scan_gun` VALUES ('185d46c705b84ce4b0b536b532a5154a','107','de249466902a4f839f16efb73a592072',1,'2017-06-12 15:10:37',NULL,''),('276d2f26c9034c9cbbd4423e18c656eb','111','e039b0ed4e184fe78e3828755aca56f5',1,'2018-04-10 15:36:40',NULL,''),('37b869e3f2f44955b90f001781020ea7','112','3',1,'2018-04-10 15:37:13',NULL,''),('a2f735a50ae04b49bd7233dcf2e8e411','102','e039b0ed4e184fe78e3828755aca56f5',1,'2017-06-12 15:09:43',NULL,''),('b061fce6b5444391ac6baa69c25a99d3','106','0a715b759765419f89bc0326e08e9ac5',1,'2017-06-12 15:10:26',NULL,''),('cd44c4a10f3344e5b74b1c2554374c1a','103','3',1,'2017-06-12 15:09:54',NULL,''),('e33183432f4d49d98b951602348cf4a4','101','c86c602ef10e4a30aac9286f82c54c7e',1,'2017-05-11 20:55:31','2018-04-08 15:16:28',''),('e709b922b6294996af41745b15092e3d','105','c86c602ef10e4a30aac9286f82c54c7e',1,'2017-06-12 15:10:16',NULL,''),('edd0a4c85bc94f4f839da730b2a59518','104','8f080b6180564157aa173cc26e44d1dd',1,'2017-06-12 15:10:05',NULL,'');
/*!40000 ALTER TABLE `jy_base_scan_gun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_data_dict`
--

DROP TABLE IF EXISTS `jy_data_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_data_dict` (
  `id` varchar(32) NOT NULL,
  `dataKey` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `isValid` int(2) NOT NULL DEFAULT '0',
  `description` varchar(128) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_data_dict`
--

LOCK TABLES `jy_data_dict` WRITE;
/*!40000 ALTER TABLE `jy_data_dict` DISABLE KEYS */;
INSERT INTO `jy_data_dict` VALUES ('3900a412e51e43ff83a08c732095b2a3','leaveType','请假类型',1,'请假申请使用','2016-01-21 12:56:25',NULL),('741cae2856aa43d3bb6cc60c8ed2d8a9','isTask','任务状态',1,'任务使用','2015-12-24 13:01:11','2015-12-30 20:12:35'),('9f5bf53e0027414c96002f8a1114aaf6','positionType','职务类别',1,'职务管理使用','2016-01-22 16:13:58','2016-01-22 16:14:13'),('aac903e055014b68a3f09f8eb9ace6bc','logType','日志类型',1,'日志使用','2015-12-24 20:39:15','2015-12-24 20:39:25'),('d6336e1e3ba64dfd885e930eb9d88e32','isValid','状态',1,'全局使用','2015-11-20 15:56:20','2015-12-09 20:56:38'),('e9e083a918dd407aa5d710cdcd3b46a1','1','1',1,'1','2016-01-26 21:42:16',NULL),('ebf0c2e03e0340048ee53e3e7c3f0805','wxSubscribe','订阅情况',1,'微信关注者使用','2015-12-30 15:33:27',NULL);
/*!40000 ALTER TABLE `jy_data_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_data_dict_item`
--

DROP TABLE IF EXISTS `jy_data_dict_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_data_dict_item` (
  `dictId` varchar(32) NOT NULL,
  `value` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sort` int(10) NOT NULL,
  PRIMARY KEY (`dictId`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_data_dict_item`
--

LOCK TABLES `jy_data_dict_item` WRITE;
/*!40000 ALTER TABLE `jy_data_dict_item` DISABLE KEYS */;
INSERT INTO `jy_data_dict_item` VALUES ('3900a412e51e43ff83a08c732095b2a3','bj','病假',3),('3900a412e51e43ff83a08c732095b2a3','gsj','工伤假',2),('3900a412e51e43ff83a08c732095b2a3','hj','婚假',6),('3900a412e51e43ff83a08c732095b2a3','nj','年假',1),('3900a412e51e43ff83a08c732095b2a3','sangj','丧假',7),('3900a412e51e43ff83a08c732095b2a3','shij','事假',4),('3900a412e51e43ff83a08c732095b2a3','syj','生育假',5),('741cae2856aa43d3bb6cc60c8ed2d8a9','0','停用',2),('741cae2856aa43d3bb6cc60c8ed2d8a9','1','启用',1),('9f5bf53e0027414c96002f8a1114aaf6','gmanager','总经理',2),('9f5bf53e0027414c96002f8a1114aaf6','manager','经理',1),('9f5bf53e0027414c96002f8a1114aaf6','president','董事长',3),('aac903e055014b68a3f09f8eb9ace6bc','1','正常',1),('aac903e055014b68a3f09f8eb9ace6bc','2','异常',2),('d6336e1e3ba64dfd885e930eb9d88e32','0','无效',2),('d6336e1e3ba64dfd885e930eb9d88e32','1','有效',1),('e9e083a918dd407aa5d710cdcd3b46a1','1','1',1),('e9e083a918dd407aa5d710cdcd3b46a1','2','2',2),('ebf0c2e03e0340048ee53e3e7c3f0805','0','退订',2),('ebf0c2e03e0340048ee53e3e7c3f0805','1','订阅',1);
/*!40000 ALTER TABLE `jy_data_dict_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_sys_dict`
--

DROP TABLE IF EXISTS `jy_sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_sys_dict` (
  `id` varchar(32) NOT NULL,
  `paramKey` varchar(64) DEFAULT NULL,
  `paramName` varchar(128) DEFAULT NULL,
  `paramValue` varchar(128) DEFAULT NULL,
  `isValid` int(2) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_sys_dict`
--

LOCK TABLES `jy_sys_dict` WRITE;
/*!40000 ALTER TABLE `jy_sys_dict` DISABLE KEYS */;
INSERT INTO `jy_sys_dict` VALUES ('66a38d9aba5142cb9f07ce5e73e5cb5e','gjcss','高级测试师','3',1,'','2015-12-13 23:39:26',NULL),('a1b4403be93a417897269fcabed19c06','kfgcs','开发工程师','1',1,'','2015-12-13 23:38:15','2015-12-13 23:38:46'),('d8a7e57a1447450c97d61aa1df65e41a','xtfxs','系统分析师','2',1,'','2015-12-13 23:38:36','2016-01-30 17:29:59');
/*!40000 ALTER TABLE `jy_sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_task_log`
--

DROP TABLE IF EXISTS `jy_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_task_log` (
  `id` varchar(32) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `className` varchar(128) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_task_log`
--

LOCK TABLES `jy_task_log` WRITE;
/*!40000 ALTER TABLE `jy_task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jy_task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_task_schedule`
--

DROP TABLE IF EXISTS `jy_task_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_task_schedule` (
  `scheduleJobId` varchar(32) NOT NULL,
  `jobName` varchar(64) DEFAULT NULL,
  `jobGroup` varchar(64) DEFAULT NULL,
  `aliasName` varchar(64) DEFAULT NULL,
  `jobClass` varchar(128) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `cronExpression` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`scheduleJobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_task_schedule`
--

LOCK TABLES `jy_task_schedule` WRITE;
/*!40000 ALTER TABLE `jy_task_schedule` DISABLE KEYS */;
INSERT INTO `jy_task_schedule` VALUES ('10001','myTask','dataWork','获取天气','com.uucastlecastle.task.job.WeatherJob',0,'0 0 0,13,18,21 * * ?','通过接口获取天气：每天的0点、13点、18点、21点都执行一次','2015-12-23 13:37:45','2015-12-30 20:11:49'),('18cd508664204f65b491aca8336e0748','syncFollower','weixin',NULL,'com.uucastlecastle.task.job.weixn.SyncFollowerJob',0,'0 0 1 * * ?','微信：每天凌晨1点执行','2015-12-30 18:56:33','2016-01-30 18:05:27'),('2bad38cb73364ac8b63ca47752307133','normal','test','测正常任务','com.uucastlecastle.task.job.Test',0,'/10 * * * * ?','测试正常任务','2015-12-24 17:16:22','2015-12-30 20:10:46'),('a4aa30d39df849648553d9141dc23ace','exception','test','测异常任务','com.uucastlecastle.task.job.Test2',0,'/10 * * * * ?','测试异常任务','2015-12-24 22:52:57','2015-12-30 20:10:39');
/*!40000 ALTER TABLE `jy_task_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jy_tool_email`
--

DROP TABLE IF EXISTS `jy_tool_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jy_tool_email` (
  `id` varchar(32) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `body` text,
  `toList` text,
  `ccList` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jy_tool_email`
--

LOCK TABLES `jy_tool_email` WRITE;
/*!40000 ALTER TABLE `jy_tool_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `jy_tool_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_leave`
--

DROP TABLE IF EXISTS `oa_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_leave` (
  `id` varchar(32) NOT NULL,
  `org` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `approver` varchar(32) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `rejectReason` varchar(256) DEFAULT NULL,
  `pId` varchar(32) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_leave`
--

LOCK TABLES `oa_leave` WRITE;
/*!40000 ALTER TABLE `oa_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_event_click`
--

DROP TABLE IF EXISTS `wx_event_click`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_event_click` (
  `id` varchar(32) NOT NULL,
  `keyId` varchar(32) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `content` varchar(128) DEFAULT NULL,
  `picUrl` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_event_click`
--

LOCK TABLES `wx_event_click` WRITE;
/*!40000 ALTER TABLE `wx_event_click` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_event_click` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_follower`
--

DROP TABLE IF EXISTS `wx_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_follower` (
  `openid` varchar(32) NOT NULL,
  `subscribe` int(4) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `sex` int(4) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `headimgurl` varchar(512) DEFAULT NULL,
  `subscribeTime` datetime DEFAULT NULL,
  `unionid` varchar(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `groupid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_follower`
--

LOCK TABLES `wx_follower` WRITE;
/*!40000 ALTER TABLE `wx_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_menu`
--

DROP TABLE IF EXISTS `wx_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wx_menu` (
  `id` varchar(32) NOT NULL,
  `pId` varchar(32) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `keyId` varchar(32) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `selectType` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wx_menu`
--

LOCK TABLES `wx_menu` WRITE;
/*!40000 ALTER TABLE `wx_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-02 16:22:20
