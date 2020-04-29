-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/1/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/2/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE point ADD COLUMN thumbnail bytea;

;
ALTER TABLE point ADD COLUMN thumbnail_width integer;

;
ALTER TABLE point ADD COLUMN thumbnail_height integer;

;

COMMIT;

