-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/6/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/5/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE point DROP COLUMN is_record;

;

COMMIT;

