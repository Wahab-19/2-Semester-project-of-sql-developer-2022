CREATE DATABASE atm_management;
USE atm_management;

CREATE TABLE customer(
customer_id INT PRIMARY KEY,
full_name VARCHAR(20),
email VARCHAR(39),
phone VARCHAR(20),
address VARCHAR(20)
);


CREATE TABLE accountss(
account_id INT PRIMARY KEY,
account_number VARCHAR(20),
balance DECIMAL(10,2),
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE atms(
atm_id INT PRIMARY KEY,
bank_name VARCHAR(20),
location VARCHAR(20)
);

CREATE TABLE transactionss(
transaction_id INT PRIMARY KEY,
t_type VARCHAR(20),
amount DECIMAL(10,2),
account_id INT, 
FOREIGN KEY (account_id) REFERENCES accountss(account_id),
atm_id INT,
FOREIGN KEY (atm_id) REFERENCES atms(atm_id)
);

INSERT INTO customer(customer_id,full_name,address,email,phone)
VALUES(1,'zain ul abedin','haveli lakh','zain9246@gamil.com','03292361251'),
       (2,'ali ahmad','lahore','aliahmad346@gmail.com','03204567876');

INSERT INTO accountss(account_id,account_number,balance,customer_id)
VALUES(1001,'9417865764',1000.00,2),
      (1002,'7435068897',1200.89,1);

UPDATE customer
SET address = 'haveli lakha' WHERE customer_id = 1;

INSERT INTO atms(atm_id,bank_name,location)
VALUES(100,'alfalah','near minhaj road'),
      (101,'meezan','near canal road');

INSERT INTO transactionss(transaction_id,t_type,amount,atm_id,account_id)
VALUES(71,'deposit',1000.50,100,1001);
       

	   SELECT 
    t.transaction_id AS Transaction_ID,
    t.t_type AS Transaction_Type,
    t.amount AS Amount,
    a.account_number AS Account_Number,
    a.balance AS Current_Balance,
    c.full_name AS Customer_Name,
    c.email AS Email,
    c.phone AS Phone,
    atm.bank_name AS ATM_Bank,
    atm.location AS ATM_Location
FROM 
    transactionss t
JOIN 
    accountss a ON t.account_id = a.account_id
JOIN 
    customer c ON a.customer_id = c.customer_id
JOIN 
    atms atm ON t.atm_id = atm.atm_id;

 



SELECT * FROM customer;
SELECT * FROM accountss;
SELECT * FROM atms;
SELECT * FROM transactionss;