CREATE TABLE Customers (
    Customer_ID NUMBER,
    Name VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER,
    IsVIP VARCHAR2(5)
);


CREATE TABLE Loans (
    Loan_ID NUMBER,
    Customer_ID NUMBER,
    Interest_Rate NUMBER,
    Due_Date DATE
);

INSERT INTO Customers VALUES (1,'Amit',65,5000,'FALSE');
INSERT INTO Customers VALUES (2,'Rahul',45,15000,'FALSE');
INSERT INTO Customers VALUES (3,'Rohit',70,20000,'FALSE');


INSERT INTO Loans VALUES (101,1,8,SYSDATE+10);
INSERT INTO Loans VALUES (102,2,7,SYSDATE+20);
INSERT INTO Loans VALUES (103,3,9,SYSDATE+40);

COMMIT;

DECLARE

CURSOR customer_cursor IS
SELECT Customer_ID, Age
FROM Customers;

BEGIN

FOR customer IN customer_cursor
LOOP

    IF customer.Age > 60 THEN

        UPDATE Loans
        SET Interest_Rate = Interest_Rate - 1
        WHERE Customer_ID = customer.Customer_ID;

    END IF;

END LOOP;

COMMIT;

DBMS_OUTPUT.PUT_LINE('Interest Discount Applied');

END;
/

DECLARE

CURSOR customer_cursor IS
SELECT Customer_ID, Balance
FROM Customers;

BEGIN

FOR customer IN customer_cursor
LOOP

    IF customer.Balance > 10000 THEN

        UPDATE Customers
        SET IsVIP = 'TRUE'
        WHERE Customer_ID = customer.Customer_ID;

    END IF;

END LOOP;

COMMIT;

DBMS_OUTPUT.PUT_LINE('VIP Status Updated');

END;
/

DECLARE

CURSOR loan_cursor IS
SELECT Customer_ID, Due_Date
FROM Loans
WHERE Due_Date <= SYSDATE + 30;

BEGIN

FOR loan IN loan_cursor
LOOP

    DBMS_OUTPUT.PUT_LINE(
    'Reminder: Customer ' || loan.Customer_ID ||
    ' Loan Due Date: ' || loan.Due_Date
    );

END LOOP;

END;
/