CREATE TABLE EMPLOYEES (
  emp_id     NUMBER PRIMARY KEY,
  name       VARCHAR2(50),
  department VARCHAR2(50),
  salary     NUMBER
);

INSERT INTO EMPLOYEES VALUES (1, 'Asrar', 'HR', 50000);
INSERT INTO EMPLOYEES VALUES (2, 'john', 'IT', 60000);
INSERT INTO EMPLOYEES VALUES (3, 'Neha', 'IT', 70000);
INSERT INTO EMPLOYEES VALUES (4, 'Shraddha', 'Finance', 55000);

COMMIT;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  p_department     IN VARCHAR2,
  p_bonus_percent  IN NUMBER
) AS
BEGIN
  UPDATE EMPLOYEES
  SET salary = salary + (salary * p_bonus_percent / 100)
  WHERE department = p_department;

  DBMS_OUTPUT.PUT_LINE('Bonus of ' || p_bonus_percent || '% applied to department: ' || p_department);

  COMMIT;
END;
/

BEGIN
  UpdateEmployeeBonus('IT', 10);
END;
/

SELECT * FROM EMPLOYEES;