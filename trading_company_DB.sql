CREATE DATABASE  IF NOT EXISTS `trading_company` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trading_company`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trading_company
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill_body_in`
--

DROP TABLE IF EXISTS `bill_body_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_body_in` (
  `bill_body_in_id` int NOT NULL AUTO_INCREMENT,
  `bill_in_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(6,1) DEFAULT NULL,
  `discount` decimal(6,1) DEFAULT '0.0',
  PRIMARY KEY (`bill_body_in_id`),
  KEY `in_bodytohead` (`bill_in_id`),
  KEY `in_prod_bill` (`prod_id`),
  CONSTRAINT `in_bodytohead` FOREIGN KEY (`bill_in_id`) REFERENCES `bill_in` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `in_prod_bill` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_body_in`
--

LOCK TABLES `bill_body_in` WRITE;
/*!40000 ALTER TABLE `bill_body_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_body_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_body_out`
--

DROP TABLE IF EXISTS `bill_body_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_body_out` (
  `bill_body_out_id` int NOT NULL AUTO_INCREMENT,
  `bill_out_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(6,1) DEFAULT NULL,
  `discount` decimal(6,1) DEFAULT '0.0',
  PRIMARY KEY (`bill_body_out_id`),
  KEY `out_bodytohead` (`bill_out_id`),
  KEY `out_prod_bill` (`prod_id`),
  CONSTRAINT `out_bodytohead` FOREIGN KEY (`bill_out_id`) REFERENCES `bill_out` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `out_prod_bill` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_body_out`
--

LOCK TABLES `bill_body_out` WRITE;
/*!40000 ALTER TABLE `bill_body_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_body_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_in`
--

DROP TABLE IF EXISTS `bill_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_in` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `bill_date` date NOT NULL,
  `emp_id` int NOT NULL,
  `bill_sup_id` int NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `in_bill_emp` (`emp_id`),
  KEY `in_bill_sup` (`bill_sup_id`),
  CONSTRAINT `in_bill_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `in_bill_sup` FOREIGN KEY (`bill_sup_id`) REFERENCES `supplier` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_in`
--

LOCK TABLES `bill_in` WRITE;
/*!40000 ALTER TABLE `bill_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_out`
--

DROP TABLE IF EXISTS `bill_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_out` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `bill_date` date NOT NULL,
  `emp_id` int NOT NULL,
  `bill_cus_id` int NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `out_bill_emp` (`emp_id`),
  KEY `out_bill_cus` (`bill_cus_id`),
  CONSTRAINT `out_bill_cus` FOREIGN KEY (`bill_cus_id`) REFERENCES `customer` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `out_bill_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_out`
--

LOCK TABLES `bill_out` WRITE;
/*!40000 ALTER TABLE `bill_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cheque_category`
--

DROP TABLE IF EXISTS `cheque_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cheque_category` (
  `ctg_id` int NOT NULL AUTO_INCREMENT,
  `ctg_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ctg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheque_category`
--

LOCK TABLES `cheque_category` WRITE;
/*!40000 ALTER TABLE `cheque_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cheque_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `area` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `tax_no` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ctg_id` int NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `ctg_id` (`ctg_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ctg_id`) REFERENCES `customer_category` (`ctg_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_category`
--

DROP TABLE IF EXISTS `customer_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_category` (
  `ctg_id` int NOT NULL AUTO_INCREMENT,
  `ctg_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ctg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_category`
--

LOCK TABLES `customer_category` WRITE;
/*!40000 ALTER TABLE `customer_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_has`
--

DROP TABLE IF EXISTS `emp_has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_has` (
  `emp_id` int NOT NULL,
  `role_id` int NOT NULL,
  `per_role_id` int NOT NULL,
  KEY `emp_id` (`emp_id`),
  KEY `role_id` (`role_id`),
  KEY `per_role_id` (`per_role_id`),
  CONSTRAINT `emp_has_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_has_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_has_ibfk_3` FOREIGN KEY (`per_role_id`) REFERENCES `permissions` (`per_role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_has`
--

LOCK TABLES `emp_has` WRITE;
/*!40000 ALTER TABLE `emp_has` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `nationalID` varchar(15) NOT NULL,
  `region_id` int NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `salary` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Niveen','012589654458','42422523420',1,'maamon','2021-12-03','neven40@gmail.com',4000.00),(2,'Islam','01525469523','424225423420',2,'Khalifa','2021-12-03','islaam@gmail.com',3500.00),(3,'Alaa','01025436598','424422523420',3,'El-Tahrir','2021-12-03','Alaa399@gmail.com',4500.00),(4,'Ibrahim','01232532697','424225234230',4,'Fire El-Nasser','2021-12-03','Ibrahim38@gmail.com',6000.00),(5,'Ali','01025125463','424122523420',5,'Ain Shams','2021-12-03','AliFikry200@gmail.com',7500.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses_category`
--

DROP TABLE IF EXISTS `expenses_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses_category` (
  `ctg_id` int NOT NULL AUTO_INCREMENT,
  `ctg_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ctg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses_category`
--

LOCK TABLES `expenses_category` WRITE;
/*!40000 ALTER TABLE `expenses_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `emp_id` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`,`password`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password` (`password`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'n123','123'),(2,'Islam345','ert25vh'),(3,'Alaa125','dffr56hbb21'),(4,'Ibrahim654','wer12f52'),(5,'1','1');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `per_role_id` int NOT NULL AUTO_INCREMENT,
  `per_name` char(20) NOT NULL,
  PRIMARY KEY (`per_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `ctg_id` int NOT NULL,
  PRIMARY KEY (`prod_id`),
  UNIQUE KEY `code` (`code`),
  KEY `ctg_id` (`ctg_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ctg_id`) REFERENCES `product_category` (`ctg_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `ctg_id` int NOT NULL AUTO_INCREMENT,
  `ctg_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ctg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `region_name` char(20) NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Sarayat'),(2,'Zagazig'),(3,'Giza'),(4,'Shaqia'),(5,'Cairo');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  `role_descibtion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `prod_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(6,1) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `stock_id` (`prod_id`),
  CONSTRAINT `stock_id` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `area` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `tax_no` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ctg_id` int NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `ctg_id` (`ctg_id`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`ctg_id`) REFERENCES `supplier_category` (`ctg_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_category`
--

DROP TABLE IF EXISTS `supplier_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_category` (
  `ctg_id` int NOT NULL AUTO_INCREMENT,
  `ctg_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ctg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_category`
--

LOCK TABLES `supplier_category` WRITE;
/*!40000 ALTER TABLE `supplier_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplies` (
  `person_id` int NOT NULL,
  `prod_id` int NOT NULL,
  PRIMARY KEY (`person_id`,`prod_id`),
  KEY `prod_id` (`prod_id`),
  CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `employee` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'trading_company'
--

--
-- Dumping routines for database 'trading_company'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-06 14:56:12
