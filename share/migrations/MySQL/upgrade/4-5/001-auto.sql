-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/4/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/5/001-auto.yml':;

;
BEGIN;

;
SET foreign_key_checks=0;

;
CREATE TABLE `layer` (
  `id` integer NOT NULL auto_increment,
  `key` text NULL,
  `type` text NULL,
  `kml` longtext NULL,
  PRIMARY KEY (`id`)
);

;
SET foreign_key_checks=1;

;

COMMIT;

