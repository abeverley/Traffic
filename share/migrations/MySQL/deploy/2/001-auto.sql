-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Wed Apr 29 07:22:47 2020
-- 
;
SET foreign_key_checks=0;
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
  `file_name` text NULL,
  `file_mimetype` text NULL,
  `file_content` longblob NULL,
  `thumbnail` longblob NULL,
  `thumbnail_width` integer NULL,
  `thumbnail_height` integer NULL,
  PRIMARY KEY (`id`)
);
SET foreign_key_checks=1;
