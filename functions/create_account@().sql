create or replace function create_account()
  returns trigger
language plpgsql
as $$
DECLARE
  usr_id integer := NEW.id;
  acc_id integer;
BEGIN
  INSERT INTO accounts(balance, available, type_id) VALUES (0,0,2) RETURNING id into acc_id;
  INSERT INTO user_accounts VALUES (usr_id,acc_id);
  RETURN NEW;
END;
$$;

alter function create_account()
  owner to bartoszjakub;

