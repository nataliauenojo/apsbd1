
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
  `codigo` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Quantidade` INT NULL,
  `Preço` VARCHAR(45) NULL,
  `Categoria_Nome` INT NOT NULL,
  PRIMARY KEY (`codigo`, `Categoria_Nome`),
  CONSTRAINT `fk_Produto_Categoria1`
    FOREIGN KEY (`Categoria_Nome`)
    REFERENCES `mydb`.`Categoria` (`Nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

