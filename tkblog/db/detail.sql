-- MySQL Script generated by MySQL Workbench
-- Fri Nov 17 16:23:38 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT COMMENT '用户id，主键，自增。',
  `type` TINYINT NULL COMMENT '用户类型，博主，游客。',
  `uname` VARCHAR(45) NULL COMMENT '用户名，varchar(45)',
  `register_time` DATETIME NULL DEFAULT now() COMMENT '注册时间，默认值，getdate()',
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `categories_id` INT NOT NULL AUTO_INCREMENT COMMENT '类别id，主键自增',
  `categories_name` VARCHAR(45) NULL COMMENT '类别名称，无约束',
  `create_time` DATETIME NULL DEFAULT now() COMMENT '类别创建时间，默认，getdate()',
  PRIMARY KEY (`categories_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article` (
  `article_id` INT NOT NULL AUTO_INCREMENT COMMENT '博客id，主键，自增',
  `content` LONGTEXT NULL COMMENT '博客内容，无约束',
  `title` VARCHAR(45) NULL COMMENT '博客标题，varchar(45)，无约束',
  `user_id` INT NULL COMMENT '用户id，外键',
  `categories_id` INT NOT NULL COMMENT '博客类别id，外键',
  `publish_time` DATETIME NULL DEFAULT now() COMMENT '发布时间，默认，getdate()',
  PRIMARY KEY (`article_id`),
  INDEX `fk_article_user1_idx` (`user_id` ASC),
  INDEX `fk_article_categories1_idx` (`categories_id` ASC),
  CONSTRAINT `fk_article_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `mydb`.`categories` (`categories_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_comment` (
  `reviewern_id` INT NOT NULL COMMENT '联合主键',
  `byreviewers_id` INT NOT NULL COMMENT '联合主键',
  `comment` LONGTEXT NULL COMMENT '评论内容，无约束',
  `uc_time` DATETIME NULL DEFAULT now() COMMENT '评论时间，默认，getdate()',
  INDEX `fk_user_has_user2_user2_idx` (`byreviewers_id` ASC),
  INDEX `fk_user_has_user2_user1_idx` (`reviewern_id` ASC),
  PRIMARY KEY (`reviewern_id`, `byreviewers_id`),
  CONSTRAINT `fk_user_has_user2_user1`
    FOREIGN KEY (`reviewern_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user2_user2`
    FOREIGN KEY (`byreviewers_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`article_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`article_comment` (
  `user_iduser` INT NOT NULL COMMENT '联合主键',
  `article_articleid` INT NOT NULL COMMENT '联合主键',
  `comment` LONGTEXT NULL COMMENT '文章评论内容，无约束',
  `ac_time` DATETIME NULL DEFAULT now() COMMENT '文章评论时间，默认，getdate()',
  PRIMARY KEY (`user_iduser`, `article_articleid`),
  INDEX `fk_user_has_article_article1_idx` (`article_articleid` ASC),
  INDEX `fk_user_has_article_user1_idx` (`user_iduser` ASC),
  CONSTRAINT `fk_user_has_article_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_article_article1`
    FOREIGN KEY (`article_articleid`)
    REFERENCES `mydb`.`article` (`article_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;