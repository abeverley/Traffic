-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/3/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/4/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE subject ADD COLUMN `order` integer NULL;

;

COMMIT;

