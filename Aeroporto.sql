CREATE DATABASE  IF NOT EXISTS `aeroporto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aeroporto`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: aeroporto
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
-- Table structure for table `aeronave`
--

DROP TABLE IF EXISTS `aeronave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeronave` (
  `Id_Aeronave` int NOT NULL AUTO_INCREMENT,
  `Nome_Aeronave` varchar(255) NOT NULL,
  `id_tipoAeronave` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Aeronave`),
  CONSTRAINT `id_tipoaeronave` FOREIGN KEY (`Id_Aeronave`) REFERENCES `tipo_aeronave` (`Id_Tipo_Aeronave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeronave`
--

LOCK TABLES `aeronave` WRITE;
/*!40000 ALTER TABLE `aeronave` DISABLE KEYS */;
/*!40000 ALTER TABLE `aeronave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeroporto`
--

DROP TABLE IF EXISTS `aeroporto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeroporto` (
  `Id_Aeroporto` int NOT NULL,
  `Nome_Aeroporto` varchar(255) NOT NULL,
  `Estado` varchar(255) NOT NULL,
  `Cidade` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_Aeroporto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeroporto`
--

LOCK TABLES `aeroporto` WRITE;
/*!40000 ALTER TABLE `aeroporto` DISABLE KEYS */;
/*!40000 ALTER TABLE `aeroporto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escala`
--

DROP TABLE IF EXISTS `escala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escala` (
  `Id_Escala` int NOT NULL AUTO_INCREMENT,
  `Horario_Partida_Prog` datetime NOT NULL,
  `Horario_Chegada_Prog` datetime NOT NULL,
  `Horario_Partida_Real` datetime NOT NULL,
  `Horario_Chegada_Real` datetime NOT NULL,
  `id_voo` int DEFAULT NULL,
  PRIMARY KEY (`Id_Escala`),
  KEY `id_voo_idx` (`id_voo`),
  CONSTRAINT `id_voo` FOREIGN KEY (`id_voo`) REFERENCES `voos` (`Id_Voos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escala`
--

LOCK TABLES `escala` WRITE;
/*!40000 ALTER TABLE `escala` DISABLE KEYS */;
/*!40000 ALTER TABLE `escala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poltrona`
--

DROP TABLE IF EXISTS `poltrona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poltrona` (
  `Id_Poltrona` int NOT NULL AUTO_INCREMENT,
  `Coluna` varchar(1) NOT NULL,
  `Fileira` int NOT NULL,
  `id_Aeronave` int DEFAULT NULL,
  PRIMARY KEY (`Id_Poltrona`),
  KEY `id_aeronave_idx` (`id_Aeronave`),
  CONSTRAINT `id_aeronave` FOREIGN KEY (`id_Aeronave`) REFERENCES `aeronave` (`Id_Aeronave`),
  CONSTRAINT `id_Preferencia` FOREIGN KEY (`Id_Poltrona`) REFERENCES `preferencia` (`Id_Preferencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poltrona`
--

LOCK TABLES `poltrona` WRITE;
/*!40000 ALTER TABLE `poltrona` DISABLE KEYS */;
/*!40000 ALTER TABLE `poltrona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferencia`
--

DROP TABLE IF EXISTS `preferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferencia` (
  `Id_Preferencia` int NOT NULL AUTO_INCREMENT,
  `Tipo_Preferencia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Preferencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferencia`
--

LOCK TABLES `preferencia` WRITE;
/*!40000 ALTER TABLE `preferencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `Id_Reserva` int NOT NULL AUTO_INCREMENT,
  `Id_Escala` int NOT NULL,
  `Id_Poltrona` int NOT NULL,
  `Id_Preferencial` int NOT NULL,
  PRIMARY KEY (`Id_Reserva`),
  KEY `Fk_Id_poltrona` (`Id_Poltrona`),
  CONSTRAINT `Fk_Id_poltrona` FOREIGN KEY (`Id_Poltrona`) REFERENCES `poltrona` (`Id_Poltrona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_aeronave`
--

DROP TABLE IF EXISTS `tipo_aeronave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_aeronave` (
  `Id_Tipo_Aeronave` int NOT NULL AUTO_INCREMENT,
  `Nome_tipo` varchar(255) NOT NULL,
  `Qtd_Motores` int NOT NULL,
  `Max_poltronas` int NOT NULL,
  PRIMARY KEY (`Id_Tipo_Aeronave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_aeronave`
--

LOCK TABLES `tipo_aeronave` WRITE;
/*!40000 ALTER TABLE `tipo_aeronave` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_aeronave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voos`
--

DROP TABLE IF EXISTS `voos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voos` (
  `Id_Voos` int NOT NULL AUTO_INCREMENT,
  `Id_Aeroporto_Origem` int NOT NULL,
  `Id_Aeroporto_Destino` int NOT NULL,
  `id_tipos_aeronaves` int DEFAULT NULL,
  `id_reserva` int DEFAULT NULL,
  PRIMARY KEY (`Id_Voos`),
  KEY `FK_Id_Aeroporto_Origem` (`Id_Aeroporto_Origem`),
  KEY `FK_Id_Aeroporto_Destino` (`Id_Aeroporto_Destino`),
  KEY `id_poltrona_idx` (`id_reserva`),
  CONSTRAINT `FK_Id_Aeroporto_Destino` FOREIGN KEY (`Id_Aeroporto_Destino`) REFERENCES `aeroporto` (`Id_Aeroporto`),
  CONSTRAINT `FK_Id_Aeroporto_Origem` FOREIGN KEY (`Id_Aeroporto_Origem`) REFERENCES `aeroporto` (`Id_Aeroporto`),
  CONSTRAINT `id_poltrona` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`Id_Reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voos`
--

LOCK TABLES `voos` WRITE;
/*!40000 ALTER TABLE `voos` DISABLE KEYS */;
/*!40000 ALTER TABLE `voos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 21:30:07
