-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Wed Apr 29 07:22:47 2020
-- 
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
  "file_name" text,
  "file_mimetype" text,
  "file_content" bytea,
  "thumbnail" bytea,
  "thumbnail_width" integer,
  "thumbnail_height" integer,
  PRIMARY KEY ("id")
);

;
