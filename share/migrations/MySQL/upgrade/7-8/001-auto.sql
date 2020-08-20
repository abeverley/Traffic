-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/7/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/8/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
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

;
SET foreign_key_checks=1;

;

COMMIT;

