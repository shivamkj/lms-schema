-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE test (
  id                 INTEGER PRIMARY KEY AUTO_INCREMENT,
  name               TEXT NOT NULL,
  locale             SMALLINT REFERENCES locale (id),
  is_multi_type      BOOLEAN,
  paragraphs         JSON,
  time_limit         SMALLINT,
  total_questions    SMALLINT,
  marks_per_question SMALLINT,
  parent_id          INTEGER REFERENCES test (id)
) AUTO_INCREMENT = 10101;

CREATE TABLE test_catalogue (
  test_id      INTEGER REFERENCES test (id),
  catalogue_id SMALLINT REFERENCES catalogue (id),
  PRIMARY KEY (test_id, catalogue_id)
);

CREATE TABLE question (
  id                BIGINT PRIMARY KEY AUTO_INCREMENT,
  test_id           INTEGER NOT NULL REFERENCES test (id),
  question_type     SMALLINT NOT NULL CHECK (question_type > 0 AND question_type < 7),
  question_text     TEXT,
  question_metadata JSON NOT NULL,
  answer            TEXT NOT NULL,
  difficulty        SMALLINT CHECK (difficulty > 0 AND difficulty < 4),
  related_para      SMALLINT
) AUTO_INCREMENT = 10101;

CREATE TABLE test_submission (
  id              BIGINT PRIMARY KEY AUTO_INCREMENT,
  test_id         INTEGER NOT NULL REFERENCES test (id),
  correct_answers SMALLINT NOT NULL,
  wrong_answers   SMALLINT NOT NULL,
  questions_left  SMALLINT
) AUTO_INCREMENT = 10101;

CREATE TABLE reported_question (
  id          SMALLINT PRIMARY KEY AUTO_INCREMENT,
  question_id BIGINT NOT NULL REFERENCES question (id),
  reportd_by  BIGINT NOT NULL REFERENCES account (id),
  reviewed    BOOLEAN,
  reviewed_by BIGINT REFERENCES account (id),
  reported_on BIGINT NOT NULL
) AUTO_INCREMENT = 1;
