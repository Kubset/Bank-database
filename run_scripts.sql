BEGIN;
\i /home/kuba/codecool/advanced/TW_2/Bank-database/custom_settings.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/functions/getbalance@(integer).sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/functions/create_account@().sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/functions/update_balances@().sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/functions/check_balance_before_transaction@().sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/functions/sum_credits@(integer).sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/create_tables/drop_Tables.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/create_tables/create_Tables.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_account_types.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_card_types.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_user.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_user_data.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_accounts.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/functions/fill_available_founds@().sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_user_accounts_without_credits_and_deposits.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_deposits.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_credits.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/functions/update_available_founds_with_credits@().sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_cards.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/functions/triggers.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/fill_database/fill_transactions.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/sequences.sql
\i /home/kuba/codecool/advanced/TW_2/Bank-database/indexes.sql
COMMIT;
