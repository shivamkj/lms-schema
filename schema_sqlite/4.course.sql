-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

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
