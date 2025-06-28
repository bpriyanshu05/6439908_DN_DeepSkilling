CREATE TABLE CUSTOMERS (
  customer_id NUMBER PRIMARY KEY,
  name        VARCHAR2(50),
  age         NUMBER
);

CREATE TABLE LOANS (
  loan_id       NUMBER PRIMARY KEY,
  customer_id   NUMBER,
  interest_rate NUMBER,
  FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

INSERT INTO CUSTOMERS VALUES (1, 'Alice',   65);
INSERT INTO CUSTOMERS VALUES (2, 'Bob',     45);
INSERT INTO CUSTOMERS VALUES (3, 'Charlie', 70);

INSERT INTO LOANS VALUES (111, 1, 7.5);
INSERT INTO LOANS VALUES (112, 2, 8.0);
INSERT INTO LOANS VALUES (113, 3, 6.5);

COMMIT;

BEGIN
  FOR rec IN (
    SELECT l.loan_id, l.interest_rate
    FROM LOANS l
    JOIN CUSTOMERS c ON l.customer_id = c.customer_id
    WHERE c.age > 60
  ) LOOP
    UPDATE LOANS
    SET interest_rate = rec.interest_rate - 1
    WHERE loan_id = rec.loan_id;
  END LOOP;

  COMMIT;
END;
/

SELECT * FROM LOANS;
