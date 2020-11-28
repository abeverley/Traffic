-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/9/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/10/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE point ADD COLUMN is_pp smallint NOT NULL,
                  ADD INDEX point_idx_is_pp (is_pp);

;
ALTER TABLE subject ADD COLUMN type varchar(16) NULL;

;

COMMIT;

