CREATE OR REPLACE FUNCTION count_value_with_interest(deposit_value BIGINT, interest_rate DOUBLE PRECISION, length INTEGER)
  RETURNS INTEGER AS $$
DECLARE
  final_value BIGINT;
  time_period DOUBLE PRECISION;
  percentage_as_decimal DOUBLE PRECISION;

BEGIN
  time_period =  length / 12;
  percentage_as_decimal = interest_rate / 100;
  final_value = deposit_value * (1 + (percentage_as_decimal * time_period));
  return final_value;
end;
$$
LANGUAGE PLPGSQL;