CREATE DATABASE  IF NOT EXISTS `torneios_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `torneios_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: torneios_db
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `atleta`
--

DROP TABLE IF EXISTS `atleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atleta` (
  `ID_Atleta` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  `Nacionalidade` varchar(50) DEFAULT NULL,
  `ID_Modalidade` int DEFAULT NULL,
  PRIMARY KEY (`ID_Atleta`),
  KEY `ID_Modalidade` (`ID_Modalidade`),
  CONSTRAINT `atleta_ibfk_1` FOREIGN KEY (`ID_Modalidade`) REFERENCES `modalidade` (`ID_Modalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atleta`
--

LOCK TABLES `atleta` WRITE;
/*!40000 ALTER TABLE `atleta` DISABLE KEYS */;
/*!40000 ALTER TABLE `atleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fase`
--

DROP TABLE IF EXISTS `fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fase` (
  `ID_Fase` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Tipo` enum('Eliminatória','Pontos Corridos') NOT NULL,
  PRIMARY KEY (`ID_Fase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase`
--

LOCK TABLES `fase` WRITE;
/*!40000 ALTER TABLE `fase` DISABLE KEYS */;
/*!40000 ALTER TABLE `fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `ID_Grupo` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(10) NOT NULL,
  `ID_Fase` int DEFAULT NULL,
  PRIMARY KEY (`ID_Grupo`),
  KEY `ID_Fase` (`ID_Fase`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`ID_Fase`) REFERENCES `fase` (`ID_Fase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidade`
--

DROP TABLE IF EXISTS `modalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidade` (
  `ID_Modalidade` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Tipo` enum('Individual','Equipe') NOT NULL,
  PRIMARY KEY (`ID_Modalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidade`
--

LOCK TABLES `modalidade` WRITE;
/*!40000 ALTER TABLE `modalidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `modalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partida` (
  `ID_Partida` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Local` varchar(100) DEFAULT NULL,
  `ID_Torneio` int DEFAULT NULL,
  PRIMARY KEY (`ID_Partida`),
  KEY `ID_Torneio` (`ID_Torneio`),
  CONSTRAINT `partida_ibfk_3` FOREIGN KEY (`ID_Torneio`) REFERENCES `torneio` (`ID_Torneio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partida`
--

LOCK TABLES `partida` WRITE;
/*!40000 ALTER TABLE `partida` DISABLE KEYS */;
/*!40000 ALTER TABLE `partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado`
--

DROP TABLE IF EXISTS `resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado` (
  `ID_Resultado` int NOT NULL AUTO_INCREMENT,
  `ID_Partida` int DEFAULT NULL,
  `Pontos_Conquistados` int NOT NULL,
  `Status_Partida` enum('V','E','D') NOT NULL,
  PRIMARY KEY (`ID_Resultado`),
  KEY `ID_Partida` (`ID_Partida`),
  CONSTRAINT `resultado_ibfk_1` FOREIGN KEY (`ID_Partida`) REFERENCES `partida` (`ID_Partida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado`
--

LOCK TABLES `resultado` WRITE;
/*!40000 ALTER TABLE `resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_classificacao`
--

DROP TABLE IF EXISTS `tabela_classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_classificacao` (
  `ID_Tabela` int NOT NULL AUTO_INCREMENT,
  `ID_Resultado` int DEFAULT NULL,
  `Pontos_Totais` int DEFAULT '0',
  `Vitorias` int DEFAULT '0',
  `Empates` int DEFAULT '0',
  `Derrotas` int DEFAULT '0',
  `Posicao` int DEFAULT NULL,
  `id_fase` int DEFAULT NULL,
  PRIMARY KEY (`ID_Tabela`),
  KEY `tabela_classificacao_ibfk_2_idx` (`ID_Resultado`),
  KEY `id_fase_idx` (`id_fase`),
  CONSTRAINT `id_fase` FOREIGN KEY (`id_fase`) REFERENCES `fase` (`ID_Fase`),
  CONSTRAINT `tabela_classificacao_ibfk_2` FOREIGN KEY (`ID_Resultado`) REFERENCES `resultado` (`ID_Resultado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_classificacao`
--

LOCK TABLES `tabela_classificacao` WRITE;
/*!40000 ALTER TABLE `tabela_classificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabela_classificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time` (
  `ID_Time` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `País` varchar(50) DEFAULT NULL,
  `ID_Modalidade` int DEFAULT NULL,
  PRIMARY KEY (`ID_Time`),
  KEY `ID_Modalidade` (`ID_Modalidade`),
  CONSTRAINT `time_ibfk_1` FOREIGN KEY (`ID_Modalidade`) REFERENCES `modalidade` (`ID_Modalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneio`
--

DROP TABLE IF EXISTS `torneio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `torneio` (
  `ID_Torneio` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Data_Inicio` date DEFAULT NULL,
  `Data_Fim` date DEFAULT NULL,
  `Formato` enum('Eliminatório','Pontos Corridos') NOT NULL,
  `id_modalide` int DEFAULT NULL,
  PRIMARY KEY (`ID_Torneio`),
  KEY `id_modalide_idx` (`id_modalide`),
  CONSTRAINT `id_modalide` FOREIGN KEY (`id_modalide`) REFERENCES `modalidade` (`ID_Modalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneio`
--

LOCK TABLES `torneio` WRITE;
/*!40000 ALTER TABLE `torneio` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-08 20:35:44
