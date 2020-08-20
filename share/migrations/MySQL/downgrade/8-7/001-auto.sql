-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/8/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/7/001-auto.yml':;

;
BEGIN;

;
ALTER TABLE comment DROP FOREIGN KEY comment_fk_point_id;

;
DROP TABLE comment;

;

COMMIT;

