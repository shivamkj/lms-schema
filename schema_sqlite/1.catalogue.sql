-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE catalogue_type (
  id     INTEGER PRIMARY KEY,
  name   TEXT CHECK (LENGTH(name) <= 30) NOT NULL UNIQUE,
  parent INTEGER NOT NULL REFERENCES catalogue_type (id)
);

CREATE TABLE catalogue (
  id         INTEGER PRIMARY KEY,
  type       INTEGER NOT NULL REFERENCES catalogue_type (id),
  name       TEXT CHECK (LENGTH(name) <= 100) NOT NULL,
  icon       TEXT CHECK (LENGTH(icon) <= 255),
  attributes JSONB,
  parent     INTEGER NOT NULL REFERENCES catalogue (id)
);
