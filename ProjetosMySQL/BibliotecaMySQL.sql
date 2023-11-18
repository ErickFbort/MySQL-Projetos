CREATE DATABASE  IF NOT EXISTS `projeto_biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projeto_biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: projeto_biblioteca
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `autores`
--

CREATE TABLE `autores` (
  `id_autores` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_autores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autores/livros`
--

DROP TABLE IF EXISTS `autores/livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores/livros` (
  `id_autor` int NOT NULL,
  `id_livro` int NOT NULL,
  KEY `fk_autores_idx` (`id_autor`),
  KEY `fk_livros_idx` (`id_livro`),
  CONSTRAINT `fk_autores` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autores`),
  CONSTRAINT `fk_livros` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores/livros`
--

LOCK TABLES `autores/livros` WRITE;
/*!40000 ALTER TABLE `autores/livros` DISABLE KEYS */;
/*!40000 ALTER TABLE `autores/livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `comentarios` varchar(150) NOT NULL,
  `nota` double NOT NULL,
  `id_cpf` varchar(15) NOT NULL,
  `id_livro` int NOT NULL,
  `id_emprestimos` int NOT NULL,
  KEY `fk_cpf_idx` (`id_cpf`),
  KEY `ForeyKey_livro_idx` (`id_livro`),
  KEY `ForeyKey_emprestimo_idx` (`id_emprestimos`),
  CONSTRAINT `fk_cpf` FOREIGN KEY (`id_cpf`) REFERENCES `leitor` (`CPF`),
  CONSTRAINT `ForeyKey_emprestimo` FOREIGN KEY (`id_emprestimos`) REFERENCES `emprestimo` (`id_emprestimo`),
  CONSTRAINT `ForeyKey_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoras`
--

DROP TABLE IF EXISTS `editoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoras` (
  `cod_editoras` int NOT NULL AUTO_INCREMENT,
  `nome_editoras` varchar(45) NOT NULL,
  `id_livro` int NOT NULL,
  PRIMARY KEY (`cod_editoras`),
  KEY `foreignKEY_LIVRO_idx` (`id_livro`),
  CONSTRAINT `ForeyKey_Book` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoras`
--

LOCK TABLES `editoras` WRITE;
/*!40000 ALTER TABLE `editoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `editoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `id_emprestimo` int NOT NULL AUTO_INCREMENT,
  `id_CPF` varchar(15) NOT NULL,
  `id_reserva` int NOT NULL,
  PRIMARY KEY (`id_emprestimo`),
  KEY `forey_key_CPF_idx` (`id_CPF`),
  KEY `foreignKey_reserva_idx` (`id_reserva`),
  CONSTRAINT `foreyK_CPF` FOREIGN KEY (`id_CPF`) REFERENCES `leitor` (`CPF`),
  CONSTRAINT `foreyK_reservas` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,'333.444.555-66',2),
(2,'222.333.444-55',1),
(3,'555.555.555-55',4),
(4,'475.392.444-99',3);
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimos_exemplares`
--

DROP TABLE IF EXISTS `emprestimos_exemplares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos_exemplares` (
  `id_exemplar` int NOT NULL,
  `id_emprestimo` int NOT NULL,
  `id_emprestimos_exemplares` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_emprestimos_exemplares`),
  KEY `fk_exemplar_idx` (`id_exemplar`),
  KEY `fk_emprestimo_idx` (`id_emprestimo`),
  CONSTRAINT `forey_key_emprestimo` FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimo` (`id_emprestimo`),
  CONSTRAINT `forey_key_exemplar` FOREIGN KEY (`id_exemplar`) REFERENCES `exemplares` (`id_exemplares`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos_exemplares`
--

LOCK TABLES `emprestimos_exemplares` WRITE;
/*!40000 ALTER TABLE `emprestimos_exemplares` DISABLE KEYS */;
INSERT INTO `emprestimos_exemplares` VALUES (7,3,1),(4,4,2);
/*!40000 ALTER TABLE `emprestimos_exemplares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemplares`
--

DROP TABLE IF EXISTS `exemplares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exemplares` (
  `id_exemplares` int NOT NULL AUTO_INCREMENT,
  `id_livro` int NOT NULL,
  `estado_exemplar` varchar(45) NOT NULL,
  `quantidade_exemplares` int DEFAULT NULL,
  PRIMARY KEY (`id_exemplares`),
  KEY `id_book_idx` (`id_livro`),
  CONSTRAINT `id_book` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplares`
--

LOCK TABLES `exemplares` WRITE;
/*!40000 ALTER TABLE `exemplares` DISABLE KEYS */;
INSERT INTO `exemplares` VALUES (4,1,'Bons Estado',20),(5,2,'Bons Estado',15),(6,3,'Danificados',30),(7,4,'Retirados para reparo',22);
/*!40000 ALTER TABLE `exemplares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Romance'),(2,'Aventura'),(3,'Suspense'),(4,'Terro'),(5,'Investigação'),(6,'Infantil');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitor`
--

DROP TABLE IF EXISTS `leitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leitor` (
  `CPF` varchar(15) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitor`
--

LOCK TABLES `leitor` WRITE;
/*!40000 ALTER TABLE `leitor` DISABLE KEYS */;
INSERT INTO `leitor` VALUES ('123.456.789-00','joão da silva','1990-05-15','(11) 98765-4321','Rua das Flores, 123'),('222.333.444-55','carlos santos','1995-09-25','(21) 9876-5432','Avenida Central, 456'),('333.444.555-66','mariana oliveira','1980-12-05','(31) 1234-5678','Travessa das Flores, 789'),('475.392.444-99','larissa','2002-03-02','(34) 93333-4444','Rua alberta, 2345'),('555.555.555-55','pedro santos','2000-03-10','(31) 12345-6789','Travessa das Árvores, 789'),('987.654.321-00','maria oliveira','1985-08-20','(21) 55555-5555','Avenida Principal, 456'),('987.654.321-99','erik','2004-04-24','(47) 98888-2222','Rua do Amor, 2247');
/*!40000 ALTER TABLE `leitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `id_livro` int NOT NULL AUTO_INCREMENT,
  `isbn` varchar(18) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `sinopse` varchar(150) NOT NULL,
  `ano` date NOT NULL,
  `classificacao_idade` varchar(45) NOT NULL,
  PRIMARY KEY (`id_livro`,`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'999-99-99999-999-9','Harry potter','As incriveis aventuras de hary potter com seus colegas no mundo bruxo','2013-04-10','Livre'),
(2,'123-45-67890-000-0','Game of thrones','Historia iconica da guerra dos tronos o que ocorre no tempo dereis e rainhas ','2020-09-10','Adulto'),
(3,'111-11-11111-111-1','Starfild','O espaço não foi feito pra gente, entenda o por que. ','2023-06-22','Adulto'),
(4,'222-22-22222-222-2','Romeu e julieta','Releia o grande romance classico da historia do casal aos contos que mais se encaixão nos opostos se atraem.  ','1998-05-11','Livre'),
(5,'333-33-33333-333-3','Galinha Pintadinha','Galinha pintadinha e suas musicas','2010-07-23','Livre');
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro_genero`
--

DROP TABLE IF EXISTS `livro_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro_genero` (
  `id_genero` int NOT NULL,
  `id_livro` int NOT NULL,
  `id_livro_genero` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_livro_genero`),
  KEY `FK_GENERO_idx` (`id_genero`),
  KEY `FK_LIVRO_idx` (`id_livro`),
  CONSTRAINT `genero_ForeignKey` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `livro_ForeignKey` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro_genero`
--

LOCK TABLES `livro_genero` WRITE;
/*!40000 ALTER TABLE `livro_genero` DISABLE KEYS */;
INSERT INTO `livro_genero` VALUES (1,4,1),(2,2,2),(3,3,3),(6,5,4);
/*!40000 ALTER TABLE `livro_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_livro` int NOT NULL,
  `id_CPF` varchar(15) NOT NULL,
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `data_notificacao` date DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_final` date DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `forey_key_CPF_idx` (`id_CPF`),
  KEY `CE_livro_idx` (`id_livro`),
  CONSTRAINT `CE_CPF` FOREIGN KEY (`id_CPF`) REFERENCES `leitor` (`CPF`),
  CONSTRAINT `CE_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'222.333.444-55',1,'2023-09-14','2023-09-13','2023-09-15'),
(2,'333.444.555-66',2,'2023-09-17','2023-09-15','2023-09-18'),
(3,'475.392.444-99',3,'2023-09-20','2023-09-17','2023-09-21'),
(4,'555.555.555-55',4,'2023-09-15','2023-09-13','2023-09-16');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-13 22:20:17
