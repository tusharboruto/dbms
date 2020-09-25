-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`person` (
  `ID` DECIMAL(10,0) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `BirthDate` DATE NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Aadhar ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`faculty` (
  `Faculty ID` INT NOT NULL,
  `Mobile Num` DECIMAL(10,0) NOT NULL,
  `email id` VARCHAR(45) NOT NULL,
  `Salary` VARCHAR(45) NOT NULL,
  `Unique_id` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`Faculty ID`, `Unique_id`),
  UNIQUE INDEX `Faculty ID_UNIQUE` (`Faculty ID` ASC) VISIBLE,
  UNIQUE INDEX `Mobile Num_UNIQUE` (`Mobile Num` ASC) VISIBLE,
  UNIQUE INDEX `email id_UNIQUE` (`email id` ASC) VISIBLE,
  UNIQUE INDEX `Unique_id_UNIQUE` (`Unique_id` ASC) VISIBLE,
  CONSTRAINT `Unique_id`
    FOREIGN KEY (`Unique_id`)
    REFERENCES `mydb`.`person` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`department` (
  `Dept Number` INT NOT NULL,
  `Department Name` VARCHAR(45) NOT NULL,
  `Dept_head_id` INT NOT NULL,
  PRIMARY KEY (`Dept Number`, `Dept_head_id`),
  UNIQUE INDEX `Dept Number_UNIQUE` (`Dept Number` ASC) VISIBLE,
  UNIQUE INDEX `Department Name_UNIQUE` (`Department Name` ASC) VISIBLE,
  UNIQUE INDEX `Dept_head_id_UNIQUE` (`Dept_head_id` ASC) VISIBLE,
  CONSTRAINT `Dept_head_id`
    FOREIGN KEY (`Dept_head_id`)
    REFERENCES `mydb`.`faculty` (`Faculty ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`courses` (
  `Course ID` INT NOT NULL,
  `Course Name` INT NOT NULL,
  `dept_id` INT NOT NULL,
  PRIMARY KEY (`Course ID`),
  INDEX `dept_id_idx` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `dept_id`
    FOREIGN KEY (`dept_id`)
    REFERENCES `mydb`.`department` (`Dept Number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`collegecourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`collegecourses` (
  `collegecoursesid` INT NOT NULL,
  `facultyid` INT NOT NULL,
  `semester` INT NOT NULL,
  PRIMARY KEY (`collegecoursesid`, `facultyid`, `semester`),
  INDEX `facultyid_idx` (`facultyid` ASC) VISIBLE,
  CONSTRAINT `collegecourseid`
    FOREIGN KEY (`collegecoursesid`)
    REFERENCES `mydb`.`courses` (`Course ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `facultyid`
    FOREIGN KEY (`facultyid`)
    REFERENCES `mydb`.`faculty` (`Faculty ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `Roll Number` INT NOT NULL,
  `mobile number` DECIMAL(10,0) NOT NULL,
  `email id` VARCHAR(45) NOT NULL,
  `Unique_No` DECIMAL(10,0) NOT NULL,
  `qualification` INT NULL DEFAULT '12',
  PRIMARY KEY (`Roll Number`, `Unique_No`),
  UNIQUE INDEX `Roll Number_UNIQUE` (`Roll Number` ASC) VISIBLE,
  UNIQUE INDEX `mobile number_UNIQUE` (`mobile number` ASC) VISIBLE,
  UNIQUE INDEX `email id_UNIQUE` (`email id` ASC) VISIBLE,
  UNIQUE INDEX `Unique_id_UNIQUE` (`Unique_No` ASC) VISIBLE,
  CONSTRAINT `Unique_No`
    FOREIGN KEY (`Unique_No`)
    REFERENCES `mydb`.`person` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`enroll`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enroll` (
  `faculty_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`faculty_id`, `course_id`, `student_id`),
  INDEX `student_id_idx` (`student_id` ASC) VISIBLE,
  INDEX `courseid_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `courseid`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`collegecourses` (`collegecoursesid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `faculty_id`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `mydb`.`collegecourses` (`facultyid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`student` (`Roll Number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`faculty advisor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`faculty advisor` (
  `Advisor ID` INT NOT NULL,
  `stud_id` INT NOT NULL,
  PRIMARY KEY (`Advisor ID`, `stud_id`),
  INDEX `student_id_idx` (`stud_id` ASC) VISIBLE,
  CONSTRAINT `Advisor ID`
    FOREIGN KEY (`Advisor ID`)
    REFERENCES `mydb`.`faculty` (`Faculty ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `stud_id`
    FOREIGN KEY (`stud_id`)
    REFERENCES `mydb`.`stud` (`Roll Number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
