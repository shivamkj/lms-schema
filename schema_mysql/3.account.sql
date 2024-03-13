-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE account (
  id             BIGINT PRIMARY KEY AUTO_INCREMENT,
  email          VARCHAR(255) UNIQUE,
  phone          VARCHAR(15) UNIQUE,
  auth_providers JSON,
  permission     VARBINARY(255),
  details_filled BOOLEAN,
  c_ids          VARCHAR(255),
  first_name     VARCHAR(100),
  last_name      VARCHAR(100),
  profile_pic    VARCHAR(2000),
  gender         SMALLINT CHECK (gender > 0 AND gender < 4),
  date_of_birth  BIGINT,
  created_at     BIGINT NOT NULL,
  updated_at     BIGINT NOT NULL
) AUTO_INCREMENT = 10101;
