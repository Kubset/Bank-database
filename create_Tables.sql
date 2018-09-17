CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  login TEXT,
  password TEXT
);


CREATE TABLE IF NOT EXISTS user_data (
  user_id INTEGER REFERENCES users,
  first_name TEXT,
  last_name TEXT,
  address TEXT,
  phone_number TEXT
);

CREATE TABLE IF NOT EXISTS  card_types (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE IF NOT EXISTS  account_types (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE IF NOT EXISTS accounts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users,
  balance BIGINT NOT NULL,
  avalible BIGINT NOT NULL,
  type_id INTEGER REFERENCES account_types
);

CREATE TABLE IF NOT EXISTS  cards (
id SERIAL PRIMARY KEY,
account_id INTEGER REFERENCES accounts,
valid_from DATE NOT NULL,
expire DATE NOT NULL,
type_id INTEGER REFERENCES card_types
);





CREATE TABLE IF NOT EXISTS  user_accounts (
  user_id SERIAL PRIMARY KEY,
  account_id INTEGER REFERENCES accounts
);

CREATE TABLE IF NOT EXISTS  credits (
  id SERIAL PRIMARY KEY,
  account_id INTEGER REFERENCES accounts,
  balance BIGINT NOT NULL,
  principle BIGINT NOT NULL,
  date DATE NOT NULL,
  rate FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS  deposits (
  id SERIAL PRIMARY KEY,
  account_id INTEGER REFERENCES accounts,
  balance BIGINT NOT NULL,
  principle BIGINT NOT NULL,
  date DATE NOT NULL,
  rate FLOAT NOT NULL
);



CREATE TABLE IF NOT EXISTS  transactions (
  id SERIAL PRIMARY KEY,
  source_account_id INTEGER REFERENCES accounts,
  target_account_id INTEGER REFERENCES accounts,
  value BIGINT,
  date TIMESTAMP
);


