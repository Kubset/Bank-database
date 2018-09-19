create function update_balances()
  returns trigger
language plpgsql
as $$
BEGIN
        UPDATE accounts
        SET balance = getbalance(id)
          WHERE id = NEW.target_account_id
          OR id = NEW.source_account_id;
  RETURN NEW;
END;
$$;

alter function update_balances()
  owner to bartoszjakub;

