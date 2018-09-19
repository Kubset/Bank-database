create function check_balance_before_deposit()
  returns trigger
language plpgsql
as $$
DECLARE
  account_no INTEGER;
  available_founds INTEGER;

  BEGIN
  account_no = NEW.account_id;
  available_founds = (SELECT available FROM accounts WHERE id = account_no);

  IF NEW.principle > source_available THEN
  RAISE EXCEPTION 'Insufficient founds, Your balance: %, Requested ammount: %', available_founds,  NEW.principle
      USING HINT = 'Please check your balance.';
    END IF;
    RETURN NEW;
    END;
$$;

alter function check_balance_before_transaction()
  owner to bartoszjakub;

