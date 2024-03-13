-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE video (
  id               INTEGER PRIMARY KEY AUTO_INCREMENT,
  title            VARCHAR(255) NOT NULL,
  is_public        BOOLEAN NOT NULL,
  processing_state SMALLINT NOT NULL CHECK (processing_state > 0 AND processing_state < 4),
  duration         SMALLINT NOT NULL,
  video_url        VARCHAR(255),
  thumbnail_url    VARCHAR(255),
  processed_url    VARCHAR(255),
  uploaded_at      BIGINT NOT NULL,
  uploaded_by      BIGINT NOT NULL REFERENCES account (id)
) AUTO_INCREMENT = 1;

CREATE TABLE video_catalogue (
  video_id     INTEGER REFERENCES video (id),
  catalogue_id SMALLINT REFERENCES catalogue (id),
  PRIMARY KEY (video_id, catalogue_id)
);
