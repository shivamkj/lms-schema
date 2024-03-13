-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE document (
  id         INTEGER PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(255) NOT NULL,
  content    TEXT NOT NULL,
  is_public  BOOLEAN,
  c_ids      VARCHAR(255),
  locale     SMALLINT REFERENCES locale (id),
  created_at BIGINT NOT NULL,
  updated_at BIGINT NOT NULL
) AUTO_INCREMENT = 10101;

CREATE TABLE document_catalogue (
  document_id  INTEGER REFERENCES document (id),
  catalogue_id SMALLINT REFERENCES catalogue (id),
  PRIMARY KEY (document_id, catalogue_id)
);

CREATE TABLE pdf (
  id          INTEGER PRIMARY KEY AUTO_INCREMENT,
  file_name   VARCHAR(255) NOT NULL,
  file_url    VARCHAR(255) NOT NULL,
  locale      SMALLINT REFERENCES locale (id),
  c_ids       VARCHAR(255),
  is_public   BOOLEAN,
  uploaded_at BIGINT NOT NULL
) AUTO_INCREMENT = 10101;

CREATE TABLE pdf_catalogue (
  pdf_id       INTEGER REFERENCES pdf (id),
  catalogue_id SMALLINT REFERENCES catalogue (id),
  PRIMARY KEY (pdf_id, catalogue_id)
);
