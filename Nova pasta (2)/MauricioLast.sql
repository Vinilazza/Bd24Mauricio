CREATE DATABASE  IF NOT EXISTS `torneios_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `torneios_db`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: torneios_db
-- ------------------------------------------------------
-- Server version	8.0.39

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
  PRIMARY KEY (`ID_Atleta`)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase`
--

LOCK TABLES `fase` WRITE;
/*!40000 ALTER TABLE `fase` DISABLE KEYS */;
INSERT INTO `fase` VALUES (1,'Fase de Grupos','Pontos Corridos'),(2,'Quartas de Final','Eliminatória'),(3,'Semifinal','Eliminatória'),(4,'Final','Eliminatória'),(5,'Primeira Fase','Pontos Corridos');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Grupo A',1),(2,'Grupo B',1),(3,'Grupo C',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidade`
--

LOCK TABLES `modalidade` WRITE;
/*!40000 ALTER TABLE `modalidade` DISABLE KEYS */;
INSERT INTO `modalidade` VALUES (1,'Futebol','Equipe'),(2,'Vôlei','Equipe'),(3,'Futebol','Equipe');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partida`
--

LOCK TABLES `partida` WRITE;
/*!40000 ALTER TABLE `partida` DISABLE KEYS */;
INSERT INTO `partida` VALUES (1,'2024-01-15','Estádio 1',1),(2,'2024-01-16','Estádio 2',1),(3,'2024-01-17','Estádio 3',1),(4,'2024-01-18','Estádio 4',1),(5,'2024-11-05','Estádio Principal',1);
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
  `Gols_Marcados` int DEFAULT '0',
  `Gols_Sofridos` int DEFAULT '0',
  PRIMARY KEY (`ID_Resultado`),
  KEY `ID_Partida` (`ID_Partida`),
  CONSTRAINT `resultado_ibfk_1` FOREIGN KEY (`ID_Partida`) REFERENCES `partida` (`ID_Partida`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado`
--

LOCK TABLES `resultado` WRITE;
/*!40000 ALTER TABLE `resultado` DISABLE KEYS */;
INSERT INTO `resultado` VALUES (1,1,3,'V',0,0),(2,1,0,'D',0,0),(3,2,3,'V',0,0),(4,2,0,'D',0,0),(5,1,1,'E',0,0),(6,1,1,'E',0,0),(7,1,3,'V',0,0),(8,2,1,'E',0,0),(9,3,0,'D',0,0),(10,1,3,'V',3,1),(11,2,1,'E',2,2),(12,3,0,'D',1,4);
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
  `Saldo_Gols` int DEFAULT '0',
  `Gols_Marcados` int DEFAULT '0',
  `Gols_Sofridos` int DEFAULT '0',
  PRIMARY KEY (`ID_Tabela`),
  KEY `tabela_classificacao_ibfk_2_idx` (`ID_Resultado`),
  KEY `id_fase_idx` (`id_fase`),
  CONSTRAINT `id_fase` FOREIGN KEY (`id_fase`) REFERENCES `fase` (`ID_Fase`),
  CONSTRAINT `tabela_classificacao_ibfk_2` FOREIGN KEY (`ID_Resultado`) REFERENCES `resultado` (`ID_Resultado`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_classificacao`
--

LOCK TABLES `tabela_classificacao` WRITE;
/*!40000 ALTER TABLE `tabela_classificacao` DISABLE KEYS */;
INSERT INTO `tabela_classificacao` VALUES (1,1,3,1,0,0,1,1,0,0,0),(2,2,0,0,0,1,2,1,0,0,0),(3,3,3,1,0,0,1,1,0,0,0),(4,4,0,0,0,1,2,1,0,0,0),(5,5,1,0,1,0,NULL,1,0,0,0),(6,6,1,0,1,0,NULL,1,0,0,0),(7,7,3,1,0,0,NULL,NULL,0,0,0),(8,8,1,0,1,0,NULL,NULL,0,0,0),(9,9,0,0,0,1,NULL,NULL,0,0,0),(10,10,3,1,0,0,NULL,NULL,2,3,1),(11,11,1,0,1,0,NULL,NULL,0,2,2),(12,12,0,0,0,1,NULL,NULL,-3,1,4);
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
  `id_atleta` int DEFAULT NULL,
  PRIMARY KEY (`ID_Time`),
  KEY `ID_Modalidade` (`ID_Modalidade`),
  KEY `id_atleta_idx` (`id_atleta`),
  CONSTRAINT `id_atleta` FOREIGN KEY (`id_atleta`) REFERENCES `atleta` (`ID_Atleta`),
  CONSTRAINT `time_ibfk_1` FOREIGN KEY (`ID_Modalidade`) REFERENCES `modalidade` (`ID_Modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` VALUES (1,'Time A','Brasil',1,NULL),(2,'Time B','Argentina',1,NULL),(3,'Time C','Chile',1,NULL),(4,'Time D','Uruguai',1,NULL),(5,'Time E','Peru',1,NULL),(6,'Time F','Colômbia',1,NULL),(7,'Time G','Equador',1,NULL),(8,'Time H','Paraguai',1,NULL),(9,'Time J','Venezuela',1,NULL),(10,'Time K','Bolivia',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneio`
--

LOCK TABLES `torneio` WRITE;
/*!40000 ALTER TABLE `torneio` DISABLE KEYS */;
INSERT INTO `torneio` VALUES (1,'Torneio de Futebol','2024-03-01','2024-12-31','Pontos Corridos',1),(2,'Campeonato de Futebol','2024-11-01','2024-11-30','Pontos Corridos',1);
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

-- Dump completed on 2024-11-20 18:38:50
