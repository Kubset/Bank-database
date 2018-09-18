CREATE TRIGGER recalculate
AFTER INSERT ON transactions
FOR EACH ROW
EXECUTE PROCEDURE update_balances();


