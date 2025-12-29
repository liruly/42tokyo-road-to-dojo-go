-- -----------------------------------------------------
-- Database
-- -----------------------------------------------------

CREATE DATABASE IF NOT EXISTS `game` DEFAULT CHARACTER SET utf8mb4 ;
USE `game` ;

SET CHARSET utf8mb4;

-- -----------------------------------------------------
--  Table `users`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `game`.`users` (
	`id` VARCHAR(128) NOT NULL COMMENT 'ユーザーID',
	`name` VARCHAR(128) NOT NULL COMMENT 'ユーザー名',
	`token` VARCHAR(128) NOT NULL COMMENT 'トークン',
	`high_score` INT NOT NULL DEFAULT 0 COMMENT 'ハイスコア',
	`coin` INT NOT NULL DEFAULT 0 COMMENT 'コイン',
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
	`updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
	PRIMARY KEY (`id`)
	UNIQUE KEY `token` (`token`))
ENGINE = InnoDB
COMMENT = 'ユーザー';

-- -----------------------------------------------------
--  Table `collection_items`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `game`.`collection_items` (
	`id` VARCHAR(128) NOT NULL COMMENT 'コレクションアイテムID',
	`name` VARCHAR(128) NOT NULL COMMENT 'コレクションアイテム名',
	`rarity` INT NOT NULL COMMENT 'レアリティ',
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
	`updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
	PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'コレクションアイテム';

-- -----------------------------------------------------
--  Table `user_collections`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `game`.`user_collections` (
	`user_id` VARCHAR(128) NOT NULL COMMENT 'ユーザーID',
	`collection_id` VARCHAR(128) NOT NULL COMMENT 'コレクションアイテムID',
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
	PRIMARY KEY (`user_id`, `collection_id`))
ENGINE = InnoDB
COMMENT = 'ユーザーのコレクション';

-- -----------------------------------------------------
--  Table `gacha_contents`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `game`.`gacha_contents` (
	`collection_id` VARCHAR(128) NOT NULL COMMENT 'コレクションアイテムID',
	`weight` INT NOT NULL COMMENT '重み',
	PRIMARY KEY (`collection_id`))
ENGINE = InnoDB
COMMENT = 'ガチャの内容';

-- -----------------------------------------------------
--  Table `rankings`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `game`.`rankings` (
	`user_id` VARCHAR(128) NOT NULL COMMENT 'ユーザーID',
	`score` INT NOT NULL COMMENT 'スコア',
	`updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時',
	PRIMARY KEY (`user_id`))
ENGINE = InnoDB
COMMENT = 'ランキング';

