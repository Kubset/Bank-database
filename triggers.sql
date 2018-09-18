CREATE TRIGGER recalculate
AFTER INSERT ON transactions
FOR EACH ROW
EXECUTE PROCEDURE update_balances();

CREATE TRIGGER ensure_ballance BEFORE INSERT
  ON transactions
  FOR EACH ROW
  EXECUTE PROCEDURE check_ballance();


