-- CREATE TABLE Employees (
--     Employee_ID NUMBER,
--     Name VARCHAR2(50),
--     Department VARCHAR2(20),
--     Salary NUMBER
-- );

-- CREATE TABLE Savings_Accounts (
--     Account_ID NUMBER,
--     Customer_Name VARCHAR2(50),
--     Balance NUMBER
-- );

-- INSERT INTO Employees VALUES (1, 'Amit', 'IT', 50000);
-- INSERT INTO Employees VALUES (2, 'Rahul', 'HR', 40000);
-- INSERT INTO Employees VALUES (3, 'Rohit', 'IT', 60000);

-- INSERT INTO Savings_Accounts VALUES (101, 'Amit', 10000);
-- INSERT INTO Savings_Accounts VALUES (102, 'Rahul', 20000);
-- INSERT INTO Savings_Accounts VALUES (103, 'Rohit', 30000);

-- COMMIT;

-- CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
-- AS
-- BEGIN
--     UPDATE Savings_Accounts
--     SET Balance = Balance + (Balance * 0.01);

--     COMMIT;

--     DBMS_OUTPUT.PUT_LINE('Monthly Interest Applied');
-- END;
-- /

-- BEGIN
--     ProcessMonthlyInterest;
-- END;
-- /

-- CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
--     p_department IN VARCHAR2,
--     p_bonus_percent IN NUMBER
-- )
-- AS
-- BEGIN
--     UPDATE Employees
--     SET Salary = Salary + (Salary * p_bonus_percent / 100)
--     WHERE Department = p_department;

--     COMMIT;

--     DBMS_OUTPUT.PUT_LINE('Bonus Updated for Department: ' || p_department);
-- END;
-- /

-- BEGIN
--     UpdateEmployeeBonus('IT', 10);
-- END;
-- /

-- CREATE OR REPLACE PROCEDURE TransferFunds(
--     p_from_account IN NUMBER,
--     p_to_account   IN NUMBER,
--     p_amount       IN NUMBER
-- )
-- AS
--     v_balance NUMBER;
-- BEGIN
--     SELECT Balance
--     INTO v_balance
--     FROM Savings_Accounts
--     WHERE Account_ID = p_from_account;

--     IF v_balance >= p_amount THEN

--         UPDATE Savings_Accounts
--         SET Balance = Balance - p_amount
--         WHERE Account_ID = p_from_account;

--         UPDATE Savings_Accounts
--         SET Balance = Balance + p_amount
--         WHERE Account_ID = p_to_account;

--         COMMIT;

--         DBMS_OUTPUT.PUT_LINE('Transfer Successful');

--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
--     END IF;

-- EXCEPTION
--     WHEN NO_DATA_FOUND THEN
--         DBMS_OUTPUT.PUT_LINE('Account not found');
-- END;
-- /

-- BEGIN
--     TransferFunds(101, 102, 5000);
-- END;
-- /

-- SELECT * FROM Employees;
-- SELECT * FROM Savings_Accounts;