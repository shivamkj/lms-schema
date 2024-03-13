-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE live_class (
  id           INTEGER PRIMARY KEY,
  course_id    INTEGER REFERENCES course (id),
  catalogue_id INTEGER REFERENCES catalogue (id),
  teacher_id   INTEGER REFERENCES account (id),
  starts_at    INTEGER NOT NULL,
  duration     INTEGER NOT NULL,
  class_status INTEGER NOT NULL CHECK (class_status > 0 AND class_status < 5)
);

CREATE TABLE live_class_material (
  id            INTEGER PRIMARY KEY,
  live_class_id INTEGER REFERENCES live_class (id),
  document_id   INTEGER REFERENCES document (id),
  pdf_id        INTEGER REFERENCES pdf (id),
  test_id       INTEGER REFERENCES test (id),
  video_id      INTEGER REFERENCES video (id)
);
