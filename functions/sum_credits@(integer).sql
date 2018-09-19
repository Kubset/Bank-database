create or replace function sum_credits(target_account_id integer)
  returns integer
language plpgsql
as $$
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
$$;

alter function sum_credits(integer)
  owner to bartoszjakub;

