-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/8/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/9/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE comment ADD COLUMN postcode text;

;

COMMIT;

