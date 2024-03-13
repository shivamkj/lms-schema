-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE document (
  id         INTEGER PRIMARY KEY,
  name       TEXT CHECK (LENGTH(name) <= 255) NOT NULL,
  content    TEXT NOT NULL,
  is_public  BOOLEAN,
  c_ids      TEXT CHECK (LENGTH(c_ids) <= 255),
  locale     INTEGER REFERENCES locale (id),
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);

CREATE TABLE document_catalogue (
  document_id  INTEGER REFERENCES document (id),
  catalogue_id INTEGER REFERENCES catalogue (id),
  PRIMARY KEY (document_id, catalogue_id)
);

CREATE TABLE pdf (
  id          INTEGER PRIMARY KEY,
  file_name   TEXT CHECK (LENGTH(file_name) <= 255) NOT NULL,
  file_url    TEXT CHECK (LENGTH(file_url) <= 255) NOT NULL,
  locale      INTEGER REFERENCES locale (id),
  c_ids       TEXT CHECK (LENGTH(c_ids) <= 255),
  is_public   BOOLEAN,
  uploaded_at INTEGER NOT NULL
);

CREATE TABLE pdf_catalogue (
  pdf_id       INTEGER REFERENCES pdf (id),
  catalogue_id INTEGER REFERENCES catalogue (id),
  PRIMARY KEY (pdf_id, catalogue_id)
);
