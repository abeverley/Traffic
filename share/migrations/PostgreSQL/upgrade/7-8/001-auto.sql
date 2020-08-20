-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/7/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/8/001-auto.yml':;

;
BEGIN;

;
CREATE TABLE "comment" (
  "id" serial NOT NULL,
  "feedback" character varying(32),
  "comment" text,
  "point_id" integer,
  PRIMARY KEY ("id")
);
CREATE INDEX "comment_idx_point_id" on "comment" ("point_id");
CREATE INDEX "comment_idx_feedback" on "comment" ("feedback");

;
ALTER TABLE "comment" ADD CONSTRAINT "comment_fk_point_id" FOREIGN KEY ("point_id")
  REFERENCES "point" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE;

;

COMMIT;

