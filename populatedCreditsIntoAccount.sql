CREATE OR REPLACE FUNCTION sum_of_credits(target_account_id INTEGER)
  RETURNS INTEGER AS $$
  DECLARE
    t_row credits%rowtype;
    sum INTEGER := 0;
  BEGIN
    FOR t_row in SELECT * FROM credits WHERE account_id = target_account_id LOOP
      raise notice 'balance before: %', sum;
      sum = sum + t_row.principle;
      raise notice 'balance after: %', sum;
  END LOOP;
    RETURN sum;
  end;
  $$
  LANGUAGE PLPGSQL;


CREATE OR REPLACE FUNCTION fill_accounts_with_credits()
  RETURNS void AS $$
DECLARE
   t_row accounts%rowtype;
    pre_available INTEGER;

BEGIN
    FOR t_row in SELECT * FROM accounts LOOP
      pre_available = t_row.available;
        update accounts
            set available = (pre_available + sum_of_credits(t_row.id))
        where id = t_row.id;
    END LOOP;
  RETURN;
END;
$$
  LANGUAGE PLPGSQL;

SELECT fill_accounts_with_credits();