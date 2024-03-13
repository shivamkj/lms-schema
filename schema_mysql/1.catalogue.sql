-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE catalogue_type (
  id     SMALLINT PRIMARY KEY AUTO_INCREMENT,
  name   VARCHAR(30) NOT NULL UNIQUE,
  parent SMALLINT NOT NULL REFERENCES catalogue_type (id)
) AUTO_INCREMENT = 1;

CREATE TABLE catalogue (
  id         SMALLINT PRIMARY KEY AUTO_INCREMENT,
  type       SMALLINT NOT NULL REFERENCES catalogue_type (id),
  name       VARCHAR(100) NOT NULL,
  icon       VARCHAR(255),
  attributes JSON,
  parent     SMALLINT NOT NULL REFERENCES catalogue (id)
) AUTO_INCREMENT = 1;
