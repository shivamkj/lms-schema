-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE locale (
  id   INTEGER PRIMARY KEY,
  name TEXT CHECK (LENGTH(name) <= 30) UNIQUE NOT NULL
);

CREATE TABLE catalogue_type (
  id     INTEGER PRIMARY KEY,
  name   TEXT CHECK (LENGTH(name) <= 30) NOT NULL UNIQUE,
  parent INTEGER NOT NULL REFERENCES catalogue_type (id)
);

CREATE TABLE catalogue (
  id         INTEGER PRIMARY KEY,
  type       INTEGER NOT NULL REFERENCES catalogue_type (id),
  name       TEXT CHECK (LENGTH(name) <= 100) NOT NULL,
  icon       TEXT CHECK (LENGTH(icon) <= 255),
  attributes JSONB,
  parent     INTEGER NOT NULL REFERENCES catalogue (id)
);

CREATE TABLE document (
  id         INTEGER PRIMARY KEY,
  name       TEXT CHECK (LENGTH(name) <= 255) NOT NULL,
  content    TEXT NOT NULL,
  is_public  BOOLEAN,
  c_ids      TEXT CHECK (LENGTH(c_ids) <= 255),
  locale     INTEGER REFERENCES locale (id),
  created_at INTEGER NOT NULL,
  updated_at INTEGER NOT NULL
);

CREATE TABLE document_catalogue (
  document_id  INTEGER REFERENCES document (id),
  catalogue_id INTEGER REFERENCES catalogue (id),
  PRIMARY KEY (document_id, catalogue_id)
);

CREATE TABLE pdf (
  id          INTEGER PRIMARY KEY,
  file_name   TEXT CHECK (LENGTH(file_name) <= 255) NOT NULL,
  file_url    TEXT CHECK (LENGTH(file_url) <= 255) NOT NULL,
  locale      INTEGER REFERENCES locale (id),
  c_ids       TEXT CHECK (LENGTH(c_ids) <= 255),
  is_public   BOOLEAN,
  uploaded_at INTEGER NOT NULL
);

CREATE TABLE pdf_catalogue (
  pdf_id       INTEGER REFERENCES pdf (id),
  catalogue_id INTEGER REFERENCES catalogue (id),
  PRIMARY KEY (pdf_id, catalogue_id)
);

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

CREATE TABLE course (
  id               INTEGER PRIMARY KEY REFERENCES catalogue (id),
  cid              TEXT CHECK (LENGTH(cid) <= 3) UNIQUE NOT NULL,
  name             TEXT CHECK (LENGTH(name) <= 255) NOT NULL,
  locale           INTEGER REFERENCES locale (id),
  validity         INTEGER,
  price            INTEGER NOT NULL,
  discount_percent INTEGER,
  is_public        BOOLEAN NOT NULL,
  is_open          BOOLEAN NOT NULL,
  info             TEXT CHECK (LENGTH(info) <= 100),
  description      INTEGER REFERENCES document (id),
  thumbnail        TEXT CHECK (LENGTH(thumbnail) <= 255),
  starts_at        INTEGER,
  ends_at          INTEGER,
  created_at       INTEGER NOT NULL,
  updated_at       INTEGER NOT NULL
);

CREATE TABLE course_teacher (
  course_id     INTEGER REFERENCES course (id),
  teacher_id    INTEGER REFERENCES account (id),
  subject       TEXT CHECK (LENGTH(subject) <= 50),
  experience    INTEGER,
  qualification TEXT CHECK (LENGTH(qualification) <= 50),
  about         INTEGER REFERENCES document (id),
  PRIMARY KEY (course_id, teacher_id)
);

CREATE TABLE course_faq (
  id        INTEGER PRIMARY KEY,
  question  TEXT CHECK (LENGTH(question) <= 2000) NOT NULL,
  answer    TEXT CHECK (LENGTH(answer) <= 2000) NOT NULL,
  course_id INTEGER REFERENCES course (id)
);

CREATE TABLE coupon (
  id               INTEGER PRIMARY KEY,
  code             TEXT CHECK (LENGTH(code) <= 10) UNIQUE NOT NULL,
  discount_percent INTEGER NOT NULL,
  course_id        INTEGER REFERENCES course (id),
  use_limit        INTEGER,
  valid_till       INTEGER
);

CREATE TABLE payment (
  id           INTEGER PRIMARY KEY,
  user_id      INTEGER REFERENCES account (id),
  course_id    INTEGER REFERENCES course (id),
  amount       INTEGER NOT NULL,
  status       INTEGER NOT NULL CHECK (status > 0 AND status < 4),
  initiated_at INTEGER NOT NULL,
  coupon_id    INTEGER REFERENCES coupon (id)
);

CREATE TABLE refund (
  payment_id INTEGER PRIMARY KEY REFERENCES payment (id),
  refund_id  TEXT CHECK (LENGTH(refund_id) <= 100) NOT NULL,
  issued_at  INTEGER NOT NULL
);

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
