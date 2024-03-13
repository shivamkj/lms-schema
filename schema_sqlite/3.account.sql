-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE account (
  id             INTEGER PRIMARY KEY,
  email          TEXT CHECK (LENGTH(email) <= 255) UNIQUE,
  phone          TEXT CHECK (LENGTH(phone) <= 15) UNIQUE,
  auth_providers JSONB,
  permission     BLOB,
  details_filled BOOLEAN,
  c_ids          TEXT CHECK (LENGTH(c_ids) <= 255),
  first_name     TEXT CHECK (LENGTH(first_name) <= 100),
  last_name      TEXT CHECK (LENGTH(last_name) <= 100),
  profile_pic    TEXT CHECK (LENGTH(profile_pic) <= 2000),
  gender         INTEGER CHECK (gender > 0 AND gender < 4),
  date_of_birth  INTEGER,
  created_at     INTEGER NOT NULL,
  updated_at     INTEGER NOT NULL
);
