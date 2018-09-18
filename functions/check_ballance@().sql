create function check_ballance()
  returns trigger
language plpgsql
as $$
DECLARE
  source_acc INTEGER;
  source_available INTEGER;

  BEGIN
  source_acc = NEW.source_account_id;
  source_available = (SELECT available FROM accounts WHERE id = source_acc);

  IF NEW.value > source_available THEN
  RAISE EXCEPTION 'Insufficient founds, Your balance: %, Requested ammount: %', source_available,  NEW.value
      USING HINT = 'Please check your balance.';
    END IF;
    RETURN NEW;
    END;
$$;

alter function check_ballance()
  owner to bartoszjakub;
