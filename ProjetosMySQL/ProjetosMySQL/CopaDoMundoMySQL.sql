CREATE DATABASE  IF NOT EXISTS `copamundo1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `copamundo1`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: copamundo1
-- ------------------------------------------------------
-- Server version	8.0.34
---------------------------------------------------------
--
-- Table structure for table `arbitragem`
--

DROP TABLE IF EXISTS `arbitragem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitragem` (
  `id_arbitro` int NOT NULL AUTO_INCREMENT,
  `registro_bid` double NOT NULL,
  `nome_arbitro` varchar(45) NOT NULL,
  PRIMARY KEY (`id_arbitro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cartões`
--

DROP TABLE IF EXISTS `cartões`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartões` (
  `id_cartões` int NOT NULL AUTO_INCREMENT,
  `amarelos` int NOT NULL,
  `vermelhos` int NOT NULL,
  PRIMARY KEY (`id_cartões`),
  CONSTRAINT `fk_cartões_seleção` FOREIGN KEY (`id_cartões`) REFERENCES `seleção` (`id_seleção`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chaves/grupos`
--

DROP TABLE IF EXISTS `chaves/grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chaves/grupos` (
  `id_chave` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_chave`),
  CONSTRAINT `fk_seleçãoDesseGP` FOREIGN KEY (`id_chave`) REFERENCES `seleção` (`id_seleção`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estadio`
--

DROP TABLE IF EXISTS `estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadio` (
  `id_estadio` int NOT NULL AUTO_INCREMENT,
  `capacidade` int NOT NULL,
  `endereço` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estadio`),
  CONSTRAINT `fk_Chave/Jogos` FOREIGN KEY (`id_estadio`) REFERENCES `chaves/grupos` (`id_chave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jogador`
--

DROP TABLE IF EXISTS `jogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogador` (
  `id_jogador` int NOT NULL AUTO_INCREMENT,
  `nome_jogador` varchar(45) NOT NULL,
  `peso` int NOT NULL,
  `altura` int NOT NULL,
  `CPF` char(11) NOT NULL,
  PRIMARY KEY (`id_jogador`,`CPF`),
  CONSTRAINT `fk_seleção` FOREIGN KEY (`id_jogador`) REFERENCES `seleção` (`id_seleção`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jogos`
--

DROP TABLE IF EXISTS `jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogos` (
  `id_jogos` int NOT NULL AUTO_INCREMENT,
  `data` int NOT NULL,
  `hora` int NOT NULL,
  `resultaJogos` varchar(45) NOT NULL,
  PRIMARY KEY (`id_jogos`),
  CONSTRAINT `fk_JogoDaChaveX` FOREIGN KEY (`id_jogos`) REFERENCES `chaves/grupos` (`id_chave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partida` (
  `id_partida` int NOT NULL AUTO_INCREMENT,
  `data_partida` varchar(45) NOT NULL,
  `resultado_partida` double NOT NULL,
  PRIMARY KEY (`id_partida`,`resultado_partida`),
  CONSTRAINT `fk_id_estadio` FOREIGN KEY (`id_partida`) REFERENCES `estadio` (`id_estadio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publi_presente`
--

DROP TABLE IF EXISTS `publi_presente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publi_presente` (
  `venda_ingreço` int NOT NULL,
  `publi_presente` double NOT NULL,
  PRIMARY KEY (`venda_ingreço`),
  CONSTRAINT `fk_estadioUtilizado` FOREIGN KEY (`venda_ingreço`) REFERENCES `estadio` (`id_estadio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seleção`
--

DROP TABLE IF EXISTS `seleção`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seleção` (
  `id_seleção` int NOT NULL AUTO_INCREMENT,
  `nome_seleção` varchar(60) NOT NULL,
  `titulares` varchar(60) NOT NULL,
  `cartões_Seleção` int NOT NULL,
  PRIMARY KEY (`id_seleção`),
  KEY `fk_jogadores_idx` (`titulares`),
  CONSTRAINT `fk_jogadores` FOREIGN KEY (`id_seleção`) REFERENCES `jogador` (`id_jogador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substituições`
--

DROP TABLE IF EXISTS `substituições`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `substituições` (
  `id_substituições` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_substituições`),
  CONSTRAINT `fk_jogadoresSubstituidos` FOREIGN KEY (`id_substituições`) REFERENCES `jogador` (`id_jogador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabelajogos`
--

DROP TABLE IF EXISTS `tabelajogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabelajogos` (
  `id_tabelaJogos` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_tabelaJogos`),
  CONSTRAINT `fk_Chavesparticipantes` FOREIGN KEY (`id_tabelaJogos`) REFERENCES `chaves/grupos` (`id_chave`),
  CONSTRAINT `fk_JogosPertencTable` FOREIGN KEY (`id_tabelaJogos`) REFERENCES `jogos` (`id_jogos`),
  CONSTRAINT `fk_seleçãoDessaTable` FOREIGN KEY (`id_tabelaJogos`) REFERENCES `seleção` (`id_seleção`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- Dump completed on 2023-11-14 21:56:13
