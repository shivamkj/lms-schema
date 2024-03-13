-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE locale (
  id   INTEGER PRIMARY KEY,
  name TEXT CHECK (LENGTH(name) <= 30) UNIQUE NOT NULL
);
