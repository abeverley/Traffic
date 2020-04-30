-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/3/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/2/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE point DROP FOREIGN KEY point_fk_subject_id,
                  DROP INDEX point_idx_subject_id,
                  DROP COLUMN subject_id,
                  ALTER TABLE point;

;
DROP TABLE subject;

;

COMMIT;

