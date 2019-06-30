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
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Categoria ;

CREATE TABLE IF NOT EXISTS Categoria (
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Produto ;

CREATE TABLE IF NOT EXISTS Produto (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `quantidade` INT NULL,
  `preco` VARCHAR(45) NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `categoria`),
  CONSTRAINT `fk_Produto_Categoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `mydb`.`Categoria` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;