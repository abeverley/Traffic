-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Thu Aug 20 11:34:32 2020
-- 
;
SET foreign_key_checks=0;
--
-- Table: `comment`
--
CREATE TABLE `comment` (
  `id` integer NOT NULL auto_increment,
  `feedback` varchar(32) NULL,
  `comment` text NULL,
  `point_id` integer NULL,
  INDEX `comment_idx_point_id` (`point_id`),
  INDEX `comment_idx_feedback` (`feedback`),
  PRIMARY KEY (`id`),
  CONSTRAINT `comment_fk_point_id` FOREIGN KEY (`point_id`) REFERENCES `point` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;
--
-- Table: `layer`
--
CREATE TABLE `layer` (
  `id` integer NOT NULL auto_increment,
  `key` text NULL,
  `type` text NULL,
  `kml` longtext NULL,
  PRIMARY KEY (`id`)
);
--
-- Table: `point`
--
CREATE TABLE `point` (
  `id` integer NOT NULL auto_increment,
  `submitted` datetime NULL,
  `lat` decimal(10, 8) NULL,
  `long` decimal(10, 8) NULL,
  `postcode` text NULL,
  `comment` text NULL,
  `subject_id` integer NULL,
  `file_name` text NULL,
  `file_mimetype` text NULL,
  `file_content` longblob NULL,
  `thumbnail` longblob NULL,
  `thumbnail_width` integer NULL,
  `thumbnail_height` integer NULL,
  `is_record` smallint NOT NULL,
  INDEX `point_idx_subject_id` (`subject_id`),
  INDEX `point_idx_is_record` (`is_record`),
  PRIMARY KEY (`id`),
  CONSTRAINT `point_fk_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;
--
-- Table: `subject`
--
CREATE TABLE `subject` (
  `id` integer NOT NULL auto_increment,
  `title` text NULL,
  `order` integer NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
SET foreign_key_checks=1;
