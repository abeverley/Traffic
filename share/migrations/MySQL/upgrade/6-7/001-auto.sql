-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/6/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/7/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE point ADD INDEX point_idx_is_record (is_record);

;

COMMIT;

