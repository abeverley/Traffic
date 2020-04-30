-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/3/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/2/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE point DROP CONSTRAINT point_fk_subject_id;

;
DROP INDEX point_idx_subject_id;

;
ALTER TABLE point DROP COLUMN subject_id;

;
DROP TABLE subject CASCADE;

;

COMMIT;

