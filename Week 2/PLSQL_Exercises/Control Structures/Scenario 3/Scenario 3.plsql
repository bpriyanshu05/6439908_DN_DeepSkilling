CREATE TABLE CUSTOMERS (
  customer_id NUMBER PRIMARY KEY,
  name        VARCHAR2(60)
);

CREATE TABLE LOANS (
  loan_id     NUMBER PRIMARY KEY,
  customer_id NUMBER,
  due_date    DATE,
  amount      NUMBER,
  FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

INSERT INTO CUSTOMERS VALUES (1, 'Ajay');
INSERT INTO CUSTOMERS VALUES (2, 'Vimal');
INSERT INTO CUSTOMERS VALUES (3, 'madhu');

INSERT INTO LOANS VALUES (1010, 1, SYSDATE + 10, 5000);
INSERT INTO LOANS VALUES (1011, 2, SYSDATE + 30, 7000);
INSERT INTO LOANS VALUES (1012, 3, SYSDATE + 20, 8000);
COMMIT;

BEGIN
  FOR rec IN (
    SELECT l.loan_id, l.due_date, c.name
    FROM LOANS l
    JOIN CUSTOMERS c ON l.customer_id = c.customer_id
    WHERE l.due_date <= SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan #' || rec.loan_id ||
                         ' for ' || rec.name ||
                         ' is due on ' ||rec.due_date);
  END LOOP;
END;
/

SELECT * FROM LOANS;