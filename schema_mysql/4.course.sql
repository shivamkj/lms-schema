-- Copyright (©) 2024 - Zenlit Technology Solutions
-- Licensed under the GNU AGPLv3, check LICENSE for more details.
-- Auto generated, Don't edit by hand

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
