-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/2/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/3/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `subject` (
  `id` integer NOT NULL auto_increment,
  `title` text NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

;
SET foreign_key_checks=1;

;
ALTER TABLE point ADD COLUMN subject_id integer NULL,
                  ADD INDEX point_idx_subject_id (subject_id),
                  ADD CONSTRAINT point_fk_subject_id FOREIGN KEY (subject_id) REFERENCES subject (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
                  ENGINE=InnoDB;

;

COMMIT;

