create or replace function proceed_credit()
  returns trigger
language plpgsql
as $$
DECLARE
  account_no INTEGER;
  credit_principle BIGINT;
  available_founds BIGINT;

  BEGIN
  account_no = NEW.account_id;
  credit_principle = NEW.principle;
  available_founds = (SELECT available FROM accounts WHERE id = account_no);

  update accounts
    set available = (available_founds + credit_principle)
        where id = account_no;
  RETURN NEW;
  END;
$$;

alter function proceed_credit()
  owner to bartoszjakub;

