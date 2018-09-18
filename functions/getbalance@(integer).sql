create or replace function getbalance(userid integer)
  returns integer
language plpgsql
as $$
DECLARE
  revenues BIGINT := 0;
  expenditures BIGINT := 0;
  count_transactions INTEGER := 0;

BEGIN
    count_transactions = (SELECT COUNT(*) FROM transactions
                WHERE public.transactions.source_account_id = userid
                OR transactions.target_account_id = userid);

    revenues = (SELECT sum(value) FROM transactions
                WHERE public.transactions.source_account_id = userid);
    expenditures = (SELECT sum(value) FROM transactions
              WHERE public.transactions.target_account_id = userid);

--   raise notice 'Valuecount: %', count_transactions;
--   raise notice 'Valueexp: %', expenditures;
--   raise notice 'Valuerev: %', revenues;


  IF count_transactions = 0 THEN
    RETURN 0;
  end if;

  IF revenues IS NOT NULL AND expenditures IS NOT NULL THEN
    RETURN expenditures-revenues;
  ELSEIF expenditures IS NULL THEN
    RETURN -revenues;
  elseif revenues IS NULL THEN
    RETURN expenditures;
  END IF;

END;
$$;

alter function getbalance(integer)
  owner to postgres;

