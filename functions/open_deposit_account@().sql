create or replace function open_deposit_account(owner_id INTEGER, credit_value BIGINT, interest_rate DOUBLE PRECISION, credit_length INTEGER)
  returns void
language plpgsql
as $$
DECLARE
  deposit_acc_no INTEGER;
  actual_date DATE := NOW();


  BEGIN
  INSERT INTO accounts(balance, available, type_id) VALUES (new.principle, 0, 4) RETURNING id INTO deposit_acc_no;
  INSERT INTO deposits(deposit_account_id, principle, date, rate, length) VALUES (deposit_acc_no, credit_value, actual_date, interest_rate, credit_length);
  INSERT INTO user_accounts(user_id, account_id) VALUES (owner_id, credit_acc_no);

  END;
$$;

alter function open_deposit_account(INTEGER, BIGINT, DOUBLE PRECISION, INTEGER)
  owner to bartoszjakub;

