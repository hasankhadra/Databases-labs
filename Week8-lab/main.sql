DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts(
	ID serial primary key,
	Name VARCHAR(50),
	Credit int
);
 
-- insert 3 rows into the table
INSERT INTO accounts (Name, Credit) VALUES ('P1', 1000), ('P2', 1000), ('P3', 1000);
 
-- Ex1.1
BEGIN TRANSACTION; -- T1
SAVEPOINT T1;
UPDATE accounts
SET credit = credit - 500
WHERE ID = 1;
 
UPDATE accounts
SET credit = credit + 500
WHERE ID = 3;
 
ROLLBACK TO SAVEPOINT T1; -- This command is to undo the transaction
COMMIT;
 
BEGIN TRANSACTION; -- T2
SAVEPOINT T2;
UPDATE accounts
SET credit = credit - 700
WHERE ID = 2;
 
UPDATE accounts
SET credit = credit + 700
WHERE ID = 1;
 
ROLLBACK TO SAVEPOINT T2; -- This command is to undo the transaction
COMMIT;
 
BEGIN TRANSACTION; -- T3
SAVEPOINT T3;
UPDATE accounts
SET credit = credit - 300
WHERE ID = 2;
 
UPDATE accounts
SET credit = credit + 300
WHERE ID = 3;
 
ROLLBACK TO SAVEPOINT T3; -- This command is to undo the transaction
COMMIT;
-- since we rolled back all the transactions, then we have returned the credit for all accounts.
 
-- Ex1.2
ALTER TABLE accounts ADD COLUMN BankName varchar(100);
INSERT INTO accounts(Name, Credit) VALUES ('Fees', 0); -- add the extra row for the Fees

UPDATE accounts
SET BankName = 'TinkOff' 
WHERE ID = 2;

UPDATE accounts
SET BankName = 'SberBank' 
WHERE ID = 1 OR ID = 3;
 
BEGIN TRANSACTION; -- T1
SAVEPOINT T1;
UPDATE accounts
SET credit = credit - 500
WHERE ID = 1;
 
UPDATE accounts
SET credit = credit + 500
WHERE ID = 3;
 
-- ROLLBACK TO SAVEPOINT T1; -- This command is to undo the transaction
COMMIT;
 
BEGIN TRANSACTION; -- T2
SAVEPOINT T2;
UPDATE accounts
SET credit = credit - 730
WHERE ID = 2;
 
UPDATE accounts
SET credit = credit + 700
WHERE ID = 1;
 
UPDATE accounts -- add the fees since it's an external transaction
SET credit = credit + 30
WHERE ID = 4;
 
-- ROLLBACK TO SAVEPOINT T2; -- This command is to undo the transaction
COMMIT;
 
BEGIN TRANSACTION; -- T3
SAVEPOINT T3;
UPDATE accounts
SET credit = credit - 130
WHERE ID = 2;
 
UPDATE accounts
SET credit = credit + 100
WHERE ID = 3;
 
UPDATE accounts -- add the fees since it's an external transaction
SET credit = credit + 30
WHERE ID = 4;
 
-- ROLLBACK TO SAVEPOINT T3; -- This command is to undo the transaction
COMMIT;
 
SELECT * FROM accounts;