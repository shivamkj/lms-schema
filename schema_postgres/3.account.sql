-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE account (
  id             BIGINT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY (START WITH 10101 INCREMENT BY 1),
  email          TEXT CHECK (LENGTH(email) <= 255) UNIQUE,
  phone          TEXT CHECK (LENGTH(phone) <= 15) UNIQUE,
  auth_providers JSONB,
  permission     BYTEA,
  details_filled BOOLEAN,
  c_ids          TEXT CHECK (LENGTH(c_ids) <= 255),
  first_name     TEXT CHECK (LENGTH(first_name) <= 100),
  last_name      TEXT CHECK (LENGTH(last_name) <= 100),
  profile_pic    TEXT CHECK (LENGTH(profile_pic) <= 2000),
  gender         SMALLINT CHECK (gender > 0 AND gender < 4),
  date_of_birth  BIGINT,
  created_at     BIGINT NOT NULL,
  updated_at     BIGINT NOT NULL
);