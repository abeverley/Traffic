-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/9/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/10/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE point ADD COLUMN is_pp smallint NOT NULL;

;
CREATE INDEX point_idx_is_pp on point (is_pp);

;
ALTER TABLE subject ADD COLUMN type character varying(16);

;

COMMIT;

