-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE test (
  id                 INTEGER PRIMARY KEY,
  name               TEXT NOT NULL,
  locale             INTEGER REFERENCES locale (id),
  is_multi_type      BOOLEAN,
  paragraphs         JSONB,
  time_limit         INTEGER,
  total_questions    INTEGER,
  marks_per_question INTEGER,
  parent_id          INTEGER REFERENCES test (id)
);

CREATE TABLE test_catalogue (
  test_id      INTEGER REFERENCES test (id),
  catalogue_id INTEGER REFERENCES catalogue (id),
  PRIMARY KEY (test_id, catalogue_id)
);

CREATE TABLE question (
  id                INTEGER PRIMARY KEY,
  test_id           INTEGER NOT NULL REFERENCES test (id),
  question_type     INTEGER NOT NULL CHECK (question_type > 0 AND question_type < 7),
  question_text     TEXT,
  question_metadata JSONB NOT NULL,
  answer            TEXT NOT NULL,
  difficulty        INTEGER CHECK (difficulty > 0 AND difficulty < 4),
  related_para      INTEGER
);

CREATE TABLE test_submission (
  id              INTEGER PRIMARY KEY,
  test_id         INTEGER NOT NULL REFERENCES test (id),
  correct_answers INTEGER NOT NULL,
  wrong_answers   INTEGER NOT NULL,
  questions_left  INTEGER
);

CREATE TABLE reported_question (
  id          INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL REFERENCES question (id),
  reportd_by  INTEGER NOT NULL REFERENCES account (id),
  reviewed    BOOLEAN,
  reviewed_by INTEGER REFERENCES account (id),
  reported_on INTEGER NOT NULL
);
