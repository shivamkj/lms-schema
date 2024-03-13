-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE video (
  id               INTEGER PRIMARY KEY,
  title            TEXT CHECK (LENGTH(title) <= 255) NOT NULL,
  is_public        BOOLEAN NOT NULL,
  processing_state INTEGER NOT NULL CHECK (processing_state > 0 AND processing_state < 4),
  duration         INTEGER NOT NULL,
  video_url        TEXT CHECK (LENGTH(video_url) <= 255),
  thumbnail_url    TEXT CHECK (LENGTH(thumbnail_url) <= 255),
  processed_url    TEXT CHECK (LENGTH(processed_url) <= 255),
  uploaded_at      INTEGER NOT NULL,
  uploaded_by      INTEGER NOT NULL REFERENCES account (id)
);

CREATE TABLE video_catalogue (
  video_id     INTEGER REFERENCES video (id),
  catalogue_id INTEGER REFERENCES catalogue (id),
  PRIMARY KEY (video_id, catalogue_id)
);
