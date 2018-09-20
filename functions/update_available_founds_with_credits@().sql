create or replace function update_available_founds_with_credits()
  returns void
language plpgsql
as $$
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
$$;

alter function update_available_founds_with_credits()
  owner to postgres;

