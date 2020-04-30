-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/2/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/3/001-auto.yml':;

;
BEGIN;

;
CREATE TABLE "subject" (
  "id" serial NOT NULL,
  "title" text,
  PRIMARY KEY ("id")
);

;
ALTER TABLE point ADD COLUMN subject_id integer;

;
CREATE INDEX point_idx_subject_id on point (subject_id);

;
ALTER TABLE point ADD CONSTRAINT point_fk_subject_id FOREIGN KEY (subject_id)
  REFERENCES subject (id) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE;

;

COMMIT;

