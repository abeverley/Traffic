-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/10/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/9/001-auto.yml':;

;
BEGIN;

;
DROP INDEX point_idx_is_pp;

;
ALTER TABLE point DROP COLUMN is_pp;

;
ALTER TABLE subject DROP COLUMN type;

;

COMMIT;

