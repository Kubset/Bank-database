CREATE TRIGGER recalculate
AFTER INSERT ON transactions
FOR EACH ROW
EXECUTE PROCEDURE update_balances();

CREATE TRIGGER ensure_balance_before_transaction BEFORE INSERT
  ON transactions
  FOR EACH ROW
  EXECUTE PROCEDURE check_balance_before_transaction();

CREATE TRIGGER ensure_balance_before_deposit BEFORE INSERT
  ON deposits
  FOR EACH ROW
  EXECUTE PROCEDURE check_balance_before_deposit();

