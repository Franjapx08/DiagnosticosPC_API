-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema diag_pc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema diag_pc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `diag_pc` DEFAULT CHARACTER SET utf8 ;
USE `diag_pc` ;

-- -----------------------------------------------------
-- Table `diag_pc`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diag_pc`.`Usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(199) NOT NULL,
  `email` VARCHAR(199) NOT NULL,
  `password` VARCHAR(99) NOT NULL,
  `tipoUser` INT NOT NULL COMMENT '0 = admin\n1 = normal',
  `estatus` INT NOT NULL COMMENT '0 = activo\n1 = desactivo\n2 = eliminado',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diag_pc`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diag_pc`.`Clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(199) NOT NULL,
  `email` VARCHAR(199) NOT NULL,
  `Celular` VARCHAR(50) NOT NULL,
  `Referencia` VARCHAR(99) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diag_pc`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `diag_pc`.`Producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(199) NOT NULL,
  `Marca` VARCHAR(199) NOT NULL,
  `Modelo` VARCHAR(199) NOT NULL,
  `NoSerie` VARCHAR(199) NOT NULL,
  `Observacion` LONGTEXT NOT NULL,
  `ReporteFalla` LONGTEXT NOT NULL,
  `FechaIngreso` DATE NOT NULL,
  `HoraIngreso` TIME NOT NULL,
  `Usuarios_id` INT NOT NULL,
  `Clientes_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Producto_Usuarios_idx` (`Usuarios_id` ASC),
  INDEX `fk_Producto_Clientes1_idx` (`Clientes_id` ASC),
  CONSTRAINT `fk_Producto_Usuarios`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `diag_pc`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `diag_pc`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
