-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

CREATE TABLE locale (
  id   SMALLINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) UNIQUE NOT NULL
) AUTO_INCREMENT = 1;

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

CREATE TABLE document (
  id         INTEGER PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(255) NOT NULL,
  content    TEXT NOT NULL,
  is_public  BOOLEAN,
  c_ids      VARCHAR(255),
  locale     SMALLINT REFERENCES locale (id),
  created_at BIGINT NOT NULL,
  updated_at BIGINT NOT NULL
) AUTO_INCREMENT = 10101;

CREATE TABLE document_catalogue (
  document_id  INTEGER REFERENCES document (id),
  catalogue_id SMALLINT REFERENCES catalogue (id),
  PRIMARY KEY (document_id, catalogue_id)
);

CREATE TABLE pdf (
  id          INTEGER PRIMARY KEY AUTO_INCREMENT,
  file_name   VARCHAR(255) NOT NULL,
  file_url    VARCHAR(255) NOT NULL,
  locale      SMALLINT REFERENCES locale (id),
  c_ids       VARCHAR(255),
  is_public   BOOLEAN,
  uploaded_at BIGINT NOT NULL
) AUTO_INCREMENT = 10101;

CREATE TABLE pdf_catalogue (
  pdf_id       INTEGER REFERENCES pdf (id),
  catalogue_id SMALLINT REFERENCES catalogue (id),
  PRIMARY KEY (pdf_id, catalogue_id)
);

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

CREATE TABLE course (
  id               SMALLINT PRIMARY KEY REFERENCES catalogue (id),
  cid              VARCHAR(3) UNIQUE NOT NULL,
  name             VARCHAR(255) NOT NULL,
  locale           SMALLINT REFERENCES locale (id),
  validity         SMALLINT,
  price            SMALLINT NOT NULL,
  discount_percent SMALLINT,
  is_public        BOOLEAN NOT NULL,
  is_open          BOOLEAN NOT NULL,
  info             VARCHAR(100),
  description      INTEGER REFERENCES document (id),
  thumbnail        VARCHAR(255),
  starts_at        BIGINT,
  ends_at          BIGINT,
  created_at       BIGINT NOT NULL,
  updated_at       BIGINT NOT NULL
);

CREATE TABLE course_teacher (
  course_id     SMALLINT REFERENCES course (id),
  teacher_id    BIGINT REFERENCES account (id),
  subject       VARCHAR(50),
  experience    SMALLINT,
  qualification VARCHAR(50),
  about         INTEGER REFERENCES document (id),
  PRIMARY KEY (course_id, teacher_id)
);

CREATE TABLE course_faq (
  id        SMALLINT PRIMARY KEY AUTO_INCREMENT,
  question  VARCHAR(2000) NOT NULL,
  answer    VARCHAR(2000) NOT NULL,
  course_id SMALLINT REFERENCES course (id)
) AUTO_INCREMENT = 1;

CREATE TABLE coupon (
  id               SMALLINT PRIMARY KEY AUTO_INCREMENT,
  code             VARCHAR(10) UNIQUE NOT NULL,
  discount_percent SMALLINT NOT NULL,
  course_id        SMALLINT REFERENCES course (id),
  use_limit        SMALLINT,
  valid_till       BIGINT
) AUTO_INCREMENT = 1;

CREATE TABLE payment (
  id           BIGINT PRIMARY KEY AUTO_INCREMENT,
  user_id      BIGINT REFERENCES account (id),
  course_id    SMALLINT REFERENCES course (id),
  amount       INTEGER NOT NULL,
  status       SMALLINT NOT NULL CHECK (status > 0 AND status < 4),
  initiated_at BIGINT NOT NULL,
  coupon_id    SMALLINT REFERENCES coupon (id)
) AUTO_INCREMENT = 10101;

CREATE TABLE refund (
  payment_id BIGINT PRIMARY KEY REFERENCES payment (id),
  refund_id  VARCHAR(100) NOT NULL,
  issued_at  BIGINT NOT NULL
);

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

CREATE TABLE live_class (
  id           BIGINT PRIMARY KEY AUTO_INCREMENT,
  course_id    SMALLINT REFERENCES course (id),
  catalogue_id SMALLINT REFERENCES catalogue (id),
  teacher_id   BIGINT REFERENCES account (id),
  starts_at    BIGINT NOT NULL,
  duration     SMALLINT NOT NULL,
  class_status SMALLINT NOT NULL CHECK (class_status > 0 AND class_status < 5)
) AUTO_INCREMENT = 10101;

CREATE TABLE live_class_material (
  id            BIGINT PRIMARY KEY AUTO_INCREMENT,
  live_class_id BIGINT REFERENCES live_class (id),
  document_id   INTEGER REFERENCES document (id),
  pdf_id        INTEGER REFERENCES pdf (id),
  test_id       INTEGER REFERENCES test (id),
  video_id      INTEGER REFERENCES video (id)
) AUTO_INCREMENT = 10101;
