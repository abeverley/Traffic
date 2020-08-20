-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/6/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/7/001-auto.yml':;

;
BEGIN;

;
CREATE INDEX point_idx_is_record on point (is_record);

;

COMMIT;

