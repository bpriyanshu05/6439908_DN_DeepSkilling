CREATE TABLE ACCOUNTS (
  account_id    NUMBER PRIMARY KEY,
  customer_name VARCHAR2(50),
  account_type  VARCHAR2(20),
  balance       NUMBER
);

INSERT INTO ACCOUNTS VALUES (1, 'Alice', 'Savings', 10000);
INSERT INTO ACCOUNTS VALUES (2, 'Bob', 'Checking', 5000);
INSERT INTO ACCOUNTS VALUES (3, 'Charlie', 'Savings', 20000);

COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
      UPDATE ACCOUNTS
  SET balance = balance + (balance * 0.01)
  WHERE account_type = 'Savings';

  DBMS_OUTPUT.PUT_LINE('Monthly interest applied to all savings accounts.');

  COMMIT;
END;
/


BEGIN
  ProcessMonthlyInterest;
END;
/


SELECT * FROM ACCOUNTS;