-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/2/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/1/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE point DROP COLUMN thumbnail;

;
ALTER TABLE point DROP COLUMN thumbnail_width;

;
ALTER TABLE point DROP COLUMN thumbnail_height;

;

COMMIT;

