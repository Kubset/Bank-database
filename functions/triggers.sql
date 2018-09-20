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

-- CREATE TRIGGER proceed_credit_founds AFTER INSERT
--   ON credits
--   FOR EACH ROW
--   EXECUTE PROCEDURE proceed_credit();
-- 
-- CREATE TRIGGER generate_credit_account AFTER INSERT
--   ON credits
--   FOR EACH ROW
--   EXECUTE PROCEDURE open_credit_account();
CREATE TRIGGER create_account_when_create_user
  AFTER INSERT ON users
  FOR EACH ROW
  EXECUTE PROCEDURE create_account();

