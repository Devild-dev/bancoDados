-- MySQL Script generated by MySQL Workbench
-- Sat Jun  3 20:35:04 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Login`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Login` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Login` (
  `idLogin` INT NULL AUTO_INCREMENT,
  `nome` VARCHAR(10) NOT NULL,
  `senha` VARCHAR(10) NOT NULL,
  `tipo_usuario` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idLogin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`apartamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`apartamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`apartamento` (
  `arcondicionado` TINYINT(1) UNSIGNED NULL,
  `suite` TINYINT(1) UNSIGNED NULL,
  `andar` INT UNSIGNED NOT NULL,
  `idimovel` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idimovel`),
  CONSTRAINT `fk_apartamento_imovel1`
    FOREIGN KEY (`idimovel`)
    REFERENCES `mydb`.`imovel` (`idimovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--
-- Definition of table `apartamento`
--

--
-- Definition of table `bairro`
--

-- -----------------------------------------------------
-- Table `mydb`.`bairro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`bairro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`bairro` (
  `idbairro` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idcidade` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idbairro`),
  CONSTRAINT `fk_bairro_cidade1`
    FOREIGN KEY (`idcidade`)
    REFERENCES `mydb`.`cidade` (`idcidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idbairro_UNIQUE` ON `mydb`.`bairro` (`idbairro` ASC) ;

CREATE INDEX `fk_bairro_cidade1_idx` ON `mydb`.`bairro` (`idcidade` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`casa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`casa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`casa` (
  `piscina` TINYINT(1) UNSIGNED NULL,
  `idimovel` INT UNSIGNED NOT NULL,
  `porao` VARCHAR(45) NULL,
  PRIMARY KEY (`idimovel`),
  CONSTRAINT `fk_casa_imovel1`
    FOREIGN KEY (`idimovel`)
    REFERENCES `mydb`.`imovel` (`idimovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cidade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`cidade` (
  `idcidade` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idestado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idcidade`),
  CONSTRAINT `fk_cidade_estado1`
    FOREIGN KEY (`idestado`)
    REFERENCES `mydb`.`estado` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idcidade_UNIQUE` ON `mydb`.`cidade` (`idcidade` ASC) ;

CREATE INDEX `fk_cidade_estado1_idx` ON `mydb`.`cidade` (`idcidade` ASC) ;

--
-- Definition of table `cidade`
--


/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` (`idcidade`,`nome`,`idestado`) VALUES 
 (1,'Feijó',1),
 (2,'Palmeira dos Índios',2),
 (3, 'Salvador',3);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;


--
-- Definition of table `contrato`
--

-- -----------------------------------------------------
-- Table `mydb`.`contrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`contrato` ;

CREATE TABLE IF NOT EXISTS `mydb`.`contrato` (
  `idcontrato` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `numero_do_contrato` INT NOT NULL,
  `quantidade_de_meses` TINYINT(2) UNSIGNED NOT NULL,
  `status` TINYINT(1) UNSIGNED NOT NULL,
  `idimovel` INT UNSIGNED NOT NULL,
  `idproprietario` INT UNSIGNED NOT NULL,
  `idinquilino` INT UNSIGNED NOT NULL,
  `valor_aluguel` DECIMAL(7,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`idcontrato`),
  CONSTRAINT `fk_contrato_imovel1`
    FOREIGN KEY (`idimovel`)
    REFERENCES `mydb`.`imovel` (`idimovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_proprietario1`
    FOREIGN KEY (`idproprietario`)
    REFERENCES `mydb`.`proprietario` (`idproprietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_inquilino1`
    FOREIGN KEY (`idinquilino`)
    REFERENCES `mydb`.`inquilino` (`idinquilino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idcontrato_UNIQUE` ON `mydb`.`contrato` (`idcontrato` ASC) ;

CREATE INDEX `fk_contrato_imovel1_idx` ON `mydb`.`contrato` (`idimovel` ASC) ;

CREATE INDEX `fk_contrato_proprietario1_idx` ON `mydb`.`contrato` (`idproprietario` ASC) ;

CREATE INDEX `fk_contrato_inquilino1_idx` ON `mydb`.`contrato` (`idinquilino` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`estado` ;

CREATE TABLE IF NOT EXISTS `mydb`.`estado` (
  `idestado` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idestado_UNIQUE` ON `mydb`.`estado` (`idestado` ASC) ;

--
-- Definition of table `estado`
--


/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`idestado`,`nome`) VALUES 
(1,'Acre'),
(2,'Amapá'),
(3,'Bahia');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;


--
-- Definition of table `imagens`
--


-- -----------------------------------------------------
-- Table `mydb`.`imagens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`imagens` ;

CREATE TABLE IF NOT EXISTS `mydb`.`imagens` (
  `idimagens` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `conteudo` VARCHAR(100) NOT NULL,
  `idimovel` INT UNSIGNED NOT NULL,
  `descricao` TEXT NULL,
  `imagenscol` VARCHAR(45) NULL,
  PRIMARY KEY (`idimagens`),
  CONSTRAINT `fk_imagens_imovel1`
    FOREIGN KEY (`idimovel`)
    REFERENCES `mydb`.`imovel` (`idimovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idimagens_UNIQUE` ON `mydb`.`imagens` (`idimagens` ASC) ;

CREATE INDEX `fk_imagens_imovel1_idx` ON `mydb`.`imagens` (`idimovel` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`imovel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`imovel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`imovel` (
  `idimovel` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantidade_quartos` TINYINT(10) UNSIGNED NULL,
  `valor_condominio` DECIMAL(6,2) NULL,
  `valor_aluguel` DECIMAL(7,2) UNSIGNED NOT NULL,
  `numero_do_local` INT(4) UNSIGNED NOT NULL,
  `data_vencimento_aluguel` DATE NOT NULL,
  `idpredio` INT UNSIGNED NOT NULL,
  `metros_quadrados` DECIMAL(3,2) UNSIGNED NOT NULL,
  `garagem` TINYINT(1) UNSIGNED NULL,
  PRIMARY KEY (`idimovel`),
  CONSTRAINT `fk_imovel_predio1`
    FOREIGN KEY (`idpredio`)
    REFERENCES `mydb`.`predio` (`idpredio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idimovel_UNIQUE` ON `mydb`.`imovel` (`idimovel` ASC) ;

CREATE INDEX `fk_imovel_predio1_idx` ON `mydb`.`imovel` (`idpredio` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`inquilino`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`inquilino` ;

CREATE TABLE IF NOT EXISTS `mydb`.`inquilino` (
  `idinquilino` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `celular1` BIGINT(11) UNSIGNED NOT NULL,
  `celular2` BIGINT(11) UNSIGNED NULL,
  `e-mail` VARCHAR(60) NOT NULL,
  `Login_idLogin` INT NOT NULL,
  PRIMARY KEY (`idinquilino`),
  CONSTRAINT `fk_inquilino_Login1`
    FOREIGN KEY (`Login_idLogin`)
    REFERENCES `mydb`.`Login` (`idLogin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idinquilino_UNIQUE` ON `mydb`.`inquilino` (`idinquilino` ASC) ;

CREATE INDEX `fk_inquilino_Login1_idx` ON `mydb`.`inquilino` (`Login_idLogin` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa_fisica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pessoa_fisica` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pessoa_fisica` (
  `cpf` INT(11) UNSIGNED NOT NULL,
  `idinquilino` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idinquilino`),
  CONSTRAINT `fk_pessoa_fisica_inquilino1`
    FOREIGN KEY (`idinquilino`)
    REFERENCES `mydb`.`inquilino` (`idinquilino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_pessoa_fisica_inquilino1_idx` ON `mydb`.`pessoa_fisica` (`idinquilino` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`pessoa_juridica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pessoa_juridica` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pessoa_juridica` (
  `cnpj` INT(14) UNSIGNED NOT NULL,
  `idinquilino` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idinquilino`),
  CONSTRAINT `fk_pessoa_fisica_copy1_inquilino1`
    FOREIGN KEY (`idinquilino`)
    REFERENCES `mydb`.`inquilino` (`idinquilino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_pessoa_fisica_copy1_inquilino1_idx` ON `mydb`.`pessoa_juridica` (`idinquilino` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`ponto_comercial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ponto_comercial` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ponto_comercial` (
  `localizacao` TINYINT(1) UNSIGNED NOT NULL,
  `idimovel` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idimovel`),
  CONSTRAINT `fk_ponto_comercial_imovel1`
    FOREIGN KEY (`idimovel`)
    REFERENCES `mydb`.`imovel` (`idimovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`predio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`predio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`predio` (
  `idpredio` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(100) NOT NULL,
  `CEP` INT(8) NOT NULL,
  `quantidade_apartamentos` INT(3) UNSIGNED NOT NULL,
  `idbairro` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idpredio`),
  CONSTRAINT `fk_predio_bairro`
    FOREIGN KEY (`idbairro`)
    REFERENCES `mydb`.`bairro` (`idbairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idpredio_UNIQUE` ON `mydb`.`predio` (`idpredio` ASC) ;

CREATE INDEX `fk_predio_bairro_idx` ON `mydb`.`predio` (`idbairro` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`proprietario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`proprietario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`proprietario` (
  `idproprietario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `cpf` INT(11) UNSIGNED NOT NULL,
  `chave_pix` VARCHAR(45) NOT NULL,
  `Login_idLogin` INT NOT NULL,
  PRIMARY KEY (`idproprietario`),
  CONSTRAINT `fk_proprietario_Login1`
    FOREIGN KEY (`Login_idLogin`)
    REFERENCES `mydb`.`Login` (`idLogin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idproprietario_UNIQUE` ON `mydb`.`proprietario` (`idproprietario` ASC) ;

CREATE INDEX `fk_proprietario_Login1_idx` ON `mydb`.`proprietario` (`Login_idLogin` ASC) ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
