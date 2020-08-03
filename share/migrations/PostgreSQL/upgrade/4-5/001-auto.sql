-- Convert schema '/srv/Traffic/share/migrations/_source/deploy/4/001-auto.yml' to '/srv/Traffic/share/migrations/_source/deploy/5/001-auto.yml':;

;
BEGIN;

;
CREATE TABLE "layer" (
  "id" serial NOT NULL,
  "key" text,
  "type" text,
  "kml" text,
  PRIMARY KEY ("id")
);

;

COMMIT;

