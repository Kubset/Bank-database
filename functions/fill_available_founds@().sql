CREATE OR REPLACE FUNCTION fill_available_founds()
  RETURNS void AS $$
DECLARE
   t_row accounts%rowtype;

BEGIN
    FOR t_row in SELECT * FROM accounts LOOP
        update accounts
            set available = t_row.balance
        where id = t_row.id;
    END LOOP;
END;
$$
  LANGUAGE PLPGSQL;

SELECT fill_available_founds();