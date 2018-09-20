create or replace function check_balance_before_transaction()
  returns trigger
language plpgsql
as $$
DECLARE
  source_acc INTEGER;
  source_available INTEGER;

  BEGIN
  source_acc = NEW.source_account_id;
  source_available = (SELECT available FROM accounts WHERE id = source_acc);

  IF NEW.value > source_available AND source_acc != 0 THEN
  RAISE EXCEPTION 'Insufficient founds, Your balance: %, Requested ammount: %', source_available,  NEW.value
      USING HINT = 'Please check your balance.';
    END IF;
    RETURN NEW;
    END;
$$;

alter function check_balance_before_transaction()
  owner to bartoszjakub;
