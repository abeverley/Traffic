-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Mon Apr 27 10:27:01 2020
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
  PRIMARY KEY ("id")
);

;
