-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fornecedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `CNPJ` INT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categoria` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `Nome` INT NOT NULL,
  PRIMARY KEY (`Nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Produto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `Código` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Quantidade` INT NULL,
  `Preço` VARCHAR(45) NULL,
  `Categoria_Nome` INT NOT NULL,
  PRIMARY KEY (`Código`, `Categoria_Nome`),
  CONSTRAINT `fk_Produto_Categoria1`
    FOREIGN KEY (`Categoria_Nome`)
    REFERENCES `mydb`.`Categoria` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto_has_Fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Produto_has_Fornecedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Produto_has_Fornecedor` (
  `Produto_Código` INT NOT NULL,
  `Fornecedor_CNPJ` INT NOT NULL,
  PRIMARY KEY (`Produto_Código`, `Fornecedor_CNPJ`),
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto`
    FOREIGN KEY (`Produto_Código`)
    REFERENCES `mydb`.`Produto` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`Fornecedor_CNPJ`)
    REFERENCES `mydb`.`Fornecedor` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Funcionario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `CPF` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Telefone` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `CPF` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `Valor total` INT NULL,
  `Data de emissão` DATE NULL,
  `Funcionario_CPF` INT NOT NULL,
  `Cliente_CPF` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Funcionario_CPF`, `Cliente_CPF`),
  CONSTRAINT `fk_Pedido_Funcionario1`
    FOREIGN KEY (`Funcionario_CPF`)
    REFERENCES `mydb`.`Funcionario` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `mydb`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Pedido_has_Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pedido_has_Produto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pedido_has_Produto` (
  `Pedido_idPedido` INT NOT NULL,
  `Produto_Código` INT NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`, `Produto_Código`),
  CONSTRAINT `fk_Pedido_has_Produto_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Código`)
    REFERENCES `mydb`.`Produto` (`Código`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
categoria

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
