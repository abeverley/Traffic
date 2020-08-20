-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Thu Aug 20 11:25:38 2020
-- 
;
--
-- Table: layer
--
CREATE TABLE "layer" (
  "id" serial NOT NULL,
  "key" text,
  "type" text,
  "kml" text,
  PRIMARY KEY ("id")
);

;
--
-- Table: point
--
CREATE TABLE "point" (
  "id" serial NOT NULL,
  "submitted" timestamp,
  "lat" numeric(10,8),
  "long" numeric(10,8),
  "postcode" text,
  "comment" text,
  "subject_id" integer,
  "file_name" text,
  "file_mimetype" text,
  "file_content" bytea,
  "thumbnail" bytea,
  "thumbnail_width" integer,
  "thumbnail_height" integer,
  "is_record" smallint NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX "point_idx_subject_id" on "point" ("subject_id");
CREATE INDEX "point_idx_is_record" on "point" ("is_record");

;
--
-- Table: subject
--
CREATE TABLE "subject" (
  "id" serial NOT NULL,
  "title" text,
  "order" integer,
  PRIMARY KEY ("id")
);

;
--
-- Foreign Key Definitions
--

;
ALTER TABLE "point" ADD CONSTRAINT "point_fk_subject_id" FOREIGN KEY ("subject_id")
  REFERENCES "subject" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE;

;