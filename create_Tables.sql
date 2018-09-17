CREATE TABLE account (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES user.id,
  balance BIGING NOT NULL,
  avalible BIGINT NOT NULL,
  type_id INTEGER REFERENCES account_type.id
);
CREATE TABLE credit (
  id SERIAL PRIMARY KEY,
  account_id INTEGER REFERENCES account.id,
  balance BIGINT NOT NULL,
  principle BIGINT NOT NULL,
  date DATE NOT NULL,
  rate FLOAT NOT NULL
);

CREATE TABLE deposit (
  id SERIAL PRIMARY KEY,
  account_id INTEGER REFERENCES account.id,
  balance BIGINT NOT NULL,
  principle BIGINT NOT NULL,
  date DATE NOT NULL,
  rate FLOAT NOT NULL
);

CREATE TABLE card (
  id SERIAL PRIMARY KEY,
  account_id INTEGER REFERENCES account.id,
  valid_from DATE NOT NULL,
  expire DATE NOT NULL,
  type_id INTEGER REFERENCES card_type.id
);

CREATE TABLE card_type (
  id SERIAL PRIMARY KEY,
  card_id INTEGER REFERENCES card.id
);

CREATE TABLE account_type (
  id SERIAL PRIMARY KEY,
  card_id INTEGER REFERENCES account.id
);

CREATE TABLE transaction (
  id SERIAL PRIMARY KEY,
  source_account_id INTEGER REFERENCES account.id,
  target_account_id INTEGER REFERENCES account.id,
  value BIGINT,
  date TIMESTAMP
);

CREATE TABLE user_account (
  user_id SERIAL PRIMARY KEY,
  account_id INTEGER REFERENCES account.ud
);

CREATE TABLE user (
  id SERIAL PRIMARY KEY,
  login TEXT,
  password TEXT
);

CREATE TABLE user_data (
  user_id INTEGER REFERENCES user.id,
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  phone_number TEXT
);
