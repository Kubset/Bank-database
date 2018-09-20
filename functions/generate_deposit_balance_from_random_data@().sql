CREATE OR REPLACE FUNCTION generate_deposit_balance_from_random_data()
  RETURNS void AS $$
DECLARE
  current_length INTEGER;
   t_row deposits%rowtype;
    current_date DATE = CURRENT_DATE;
    value BIGINT;

BEGIN
    FOR t_row in SELECT * FROM deposits LOOP
      current_length = date_diff('month', t_row.date, current_date);

      IF current_length > t_row.length THEN
        current_length = t_row.length;
      end if;

      value = count_deposit_balance(t_row.principle, t_row.rate, current_length);

        update deposits
            set balance = count_deposit_balance(t_row.principle, t_row.rate, current_length)
        where id = t_row.id;
    END LOOP;
END;
$$
  LANGUAGE PLPGSQL;