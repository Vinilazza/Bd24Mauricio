CREATE DATABASE aeroporto

CREATE TABLE `aeronave` (
  `Id_Aeronave` int NOT NULL AUTO_INCREMENT,
  `Nome_Aeronave` varchar(255) NOT NULL,
  `Id_Tipo_Aeronave` int NOT NULL,
  PRIMARY KEY (`Id_Aeronave`),
  KEY `FK_Id_tipo_aeronave` (`Id_Tipo_Aeronave`),
  CONSTRAINT `FK_Id_tipo_aeronave` FOREIGN KEY (`Id_Tipo_Aeronave`) REFERENCES `tipo_aeronave` (`Id_Tipo_Aeronave`)
)

CREATE TABLE `aeroporto` (
  `Id_Aeroporto` int NOT NULL,
  `Nome_Aeroporto` varchar(255) NOT NULL,
  `Estado` varchar(255) NOT NULL,
  `Cidade` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_Aeroporto`)
)

CREATE TABLE `aterrissagem` (
  `Id_Aterrissagem` int NOT NULL AUTO_INCREMENT,
  `Id_Tipo_Aeronave` int NOT NULL,
  `Id_aeroporto` int NOT NULL,
  PRIMARY KEY (`Id_Aterrissagem`),
  KEY `Fk_Id_tipo` (`Id_Tipo_Aeronave`),
  KEY `FK_Id_aeroporto_aterrisagem` (`Id_aeroporto`),
  CONSTRAINT `FK_Id_aeroporto_aterrisagem` FOREIGN KEY (`Id_aeroporto`) REFERENCES `aeroporto` (`Id_Aeroporto`),
  CONSTRAINT `Fk_Id_tipo` FOREIGN KEY (`Id_Tipo_Aeronave`) REFERENCES `aeronave` (`Id_Tipo_Aeronave`)
)

CREATE TABLE `cliente` (
  `Id_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Id_reserva` int NOT NULL,
  PRIMARY KEY (`Id_Cliente`),
  KEY `Fk_Id_reserva` (`Id_reserva`),
  CONSTRAINT `Fk_Id_reserva` FOREIGN KEY (`Id_reserva`) REFERENCES `reserva` (`Id_Reserva`)
) 

CREATE TABLE `escala` (
  `Id_Escala` int NOT NULL AUTO_INCREMENT,
  `Horario_Partida_Prog` datetime NOT NULL,
  `Horario_Chegada_Prog` datetime NOT NULL,
  `Horario_Partida_Real` datetime NOT NULL,
  `Horario_Chegada_Real` datetime NOT NULL,
  `id_aeroporto` int DEFAULT NULL,
  PRIMARY KEY (`Id_Escala`),
  KEY `idAeroporto_idx` (`id_aeroporto`),
  CONSTRAINT `idAeroporto` FOREIGN KEY (`id_aeroporto`) REFERENCES `aeroporto` (`Id_Aeroporto`)
)

CREATE TABLE `poltrona` (
  `Id_Poltrona` int NOT NULL AUTO_INCREMENT,
  `Coluna` varchar(1) NOT NULL,
  `Fileira` int NOT NULL,
  PRIMARY KEY (`Id_Poltrona`)
)

CREATE TABLE `preferencia` (
  `Id_Preferencia` int NOT NULL AUTO_INCREMENT,
  `Tipo_Preferencia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_Preferencia`)
)

CREATE TABLE `reserva` (
  `Id_Reserva` int NOT NULL AUTO_INCREMENT,
  `Id_Escala` int NOT NULL,
  `Id_Aeronave` int NOT NULL,
  `Id_Poltrona` int NOT NULL,
  `Id_Preferencial` int NOT NULL,
  PRIMARY KEY (`Id_Reserva`),
  KEY `FK_Id_Escala_Reserva` (`Id_Escala`),
  KEY `Fk_Id_aeronave_Reserva` (`Id_Aeronave`),
  KEY `Fk_Id_poltrona` (`Id_Poltrona`),
  KEY `Fk_Id_preferencial` (`Id_Preferencial`),
  CONSTRAINT `Fk_Id_aeronave_Reserva` FOREIGN KEY (`Id_Aeronave`) REFERENCES `aeronave` (`Id_Aeronave`),
  CONSTRAINT `FK_Id_Escala_Reserva` FOREIGN KEY (`Id_Escala`) REFERENCES `escala` (`Id_Escala`),
  CONSTRAINT `Fk_Id_poltrona` FOREIGN KEY (`Id_Poltrona`) REFERENCES `poltrona` (`Id_Poltrona`),
  CONSTRAINT `Fk_Id_preferencial` FOREIGN KEY (`Id_Preferencial`) REFERENCES `preferencia` (`Id_Preferencia`)
)

CREATE TABLE `tipo_aeronave` (
  `Id_Tipo_Aeronave` int NOT NULL AUTO_INCREMENT,
  `Nome_tipo` varchar(255) NOT NULL,
  `Qtd_Motores` int NOT NULL,
  `Max_poltronas` int NOT NULL,
  PRIMARY KEY (`Id_Tipo_Aeronave`)
)

CREATE TABLE `voos` (
  `Id_Voos` int NOT NULL AUTO_INCREMENT,
  `Id_Aeroporto_Origem` int NOT NULL,
  `Id_Aeroporto_Destino` int NOT NULL,
  `Id_Escala` int NOT NULL,
  `Id_Aeronave` int DEFAULT NULL,
  PRIMARY KEY (`Id_Voos`),
  KEY `FK_Id_Aeroporto_Origem` (`Id_Aeroporto_Origem`),
  KEY `FK_Id_Aeroporto_Destino` (`Id_Aeroporto_Destino`),
  KEY `FK_Id_Escala` (`Id_Escala`),
  KEY `id_aeronave_idx` (`Id_Aeronave`),
  CONSTRAINT `FK_Id_Aeroporto_Destino` FOREIGN KEY (`Id_Aeroporto_Destino`) REFERENCES `aeroporto` (`Id_Aeroporto`),
  CONSTRAINT `FK_Id_Aeroporto_Origem` FOREIGN KEY (`Id_Aeroporto_Origem`) REFERENCES `aeroporto` (`Id_Aeroporto`),
  CONSTRAINT `FK_Id_Escala` FOREIGN KEY (`Id_Escala`) REFERENCES `escala` (`Id_Escala`),
  CONSTRAINT `id_aeronave` FOREIGN KEY (`Id_Aeronave`) REFERENCES `aeronave` (`Id_Aeronave`)
)