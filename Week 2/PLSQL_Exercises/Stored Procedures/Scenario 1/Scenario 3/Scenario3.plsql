SET SERVEROUTPUT ON;

CREATE TABLE ACCOUNTS (
  account_id   NUMBER PRIMARY KEY,
  customer_name VARCHAR2(50),
  balance       NUMBER
);
INSERT INTO ACCOUNTS VALUES (1, 'Adam', 10000);
INSERT INTO ACCOUNTS VALUES (2, 'jack', 5000);

COMMIT;

CREATE OR REPLACE PROCEDURE TransferFunds (
  p_from_account   IN NUMBER,
  p_to_account     IN NUMBER,
  p_amount         IN NUMBER
) AS
  v_balance NUMBER;
BEGIN
  SELECT balance INTO v_balance
  FROM ACCOUNTS
  WHERE account_id = p_from_account;

  IF v_balance < p_amount THEN
    DBMS_OUTPUT.PUT_LINE('Transfer failed: Insufficient balance.');
    RETURN;
  END IF;

  UPDATE ACCOUNTS
  SET balance = balance - p_amount
  WHERE account_id = p_from_account;


  UPDATE ACCOUNTS
  SET balance = balance + p_amount
  WHERE account_id = p_to_account;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Transfer of ' || p_amount ||
                       ' from account ' || p_from_account ||
                       ' to account ' || p_to_account || ' completed.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Transfer failed: One or both accounts do not exist.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Unexpected error: ');
    ROLLBACK;
END;
/

BEGIN
  TransferFunds(1, 2, 3000);
END;
/

SELECT * FROM ACCOUNTS;