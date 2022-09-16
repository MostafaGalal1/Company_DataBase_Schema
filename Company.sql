CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    second_name VARCHAR(30),
    birth_date DATE,
    sex VARCHAR(1),
    salary DECIMAL(8,2),
    super_id INT,
    branch_id INT
);

CREATE TABLE Branch(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(30),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE Employee
ADD FOREIGN KEY (super_id)
REFERENCES Employee(emp_id)
ON DELETE SET NULL;

ALTER TABLE Employee
ADD FOREIGN KEY (branch_id)
REFERENCES Branch(branch_id)
ON DELETE SET NULL;

CREATE TABLE Client(
    client_id INT PRIMARY KEY,
    client_name varchar(30),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE Works_With(
    emp_id INT,
    client_id INT,
    total_sales DECIMAL(8,2),
    PRIMARY KEY (emp_id, client_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES Client(client_id) ON DELETE CASCADE
);

CREATE TABLE Branch_Supplier (
    branch_id INT,
    supplier_name varchar(30),
    supply_type varchar(30),
    PRIMARY KEY (branch_id, supplier_name),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
);

INSERT INTO Employee VALUES (100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
INSERT INTO Branch VALUES (1, 'corporate', 100, '2006-02-09');
UPDATE Employee SET branch_id = 1 where emp_id = 100;

INSERT INTO Employee VALUES (102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, NULL, NULL);
INSERT INTO Branch VALUES (2, 'Scranton', 102, '1992-04-06');
UPDATE Employee SET branch_id = 2 where emp_id = 102;

INSERT INTO Employee VALUES (106, 'Josh', 'Porter', '1969-09-05 ', 'M', 78000, NULL, NULL);
INSERT INTO Branch VALUES (3, 'Stamford', 106, '1998-02-13');
UPDATE Employee SET branch_id = 3 where emp_id = 106;

INSERT INTO Employee VALUES (101, 'Jan', 'Levinson',
'1961-05-11', 'F', 110000, 100, 1);
INSERT INTO Employee VALUES (103, 'Angela', 'Martin',
'1971-06-25', 'F', 63000, 102, 2);
INSERT INTO Employee VALUES (104, 'Kelly', 'Kapoor',
'1980-02-05', 'F', 55000, 102, 2);
INSERT INTO Employee VALUES (105, 'Stanley', 'Hudson',
'1958-02-19', 'M', 69000, 102, 2);
INSERT INTO Employee VALUES (107, 'Andy', 'Bernard',
'1973-07-22', 'M', 65000, 106, 3);
INSERT INTO Employee VALUES (108, 'Jim', 'Halpert',
'1978-10-01', 'M', 71000, 106, 3);

INSERT INTO Client VALUES (400, 'Dunmore Highschool', 2);
INSERT INTO Client VALUES (401, 'Lackawana Country', 2);
INSERT INTO Client VALUES (402, 'FedEx', 3);
INSERT INTO Client VALUES (403, 'John Daly Law, LLC', 3);
INSERT INTO Client VALUES (404, 'Scranton Whitepages', 2);
INSERT INTO Client VALUES (405, 'Times Newspaper', 3);
INSERT INTO Client VALUES (406, 'FedEx', 2);

INSERT INTO Works_With VALUES (105, 400, 55000);
INSERT INTO Works_With VALUES (102, 401, 267000);
INSERT INTO Works_With VALUES (108, 402, 22500);
INSERT INTO Works_With VALUES (107, 403, 5000);
INSERT INTO Works_With VALUES (108, 403, 12000);
INSERT INTO Works_With VALUES (105, 404, 33000);
INSERT INTO Works_With VALUES (107, 405, 26000);
INSERT INTO Works_With VALUES (102, 406, 15000);
INSERT INTO Works_With VALUES (105, 406, 130000);

INSERT INTO Branch_Supplier VALUES (2, 'Hammer Mill', 'Paper');
INSERT INTO Branch_Supplier VALUES (2, 'Uni-ball', 'Writing Utensils');
INSERT INTO Branch_Supplier VALUES (2, 'Patriot Paper', 'Paper');
INSERT INTO Branch_Supplier VALUES (2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO Branch_Supplier VALUES (3, 'Uni-ball', 'Writing Utensils');
INSERT INTO Branch_Supplier VALUES (3, 'Hammer Mill', 'Paper');
INSERT INTO Branch_Supplier VALUES (3, 'Stamford Lables', 'Custom Forms');

SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Client;
SELECT * FROM Works_With;
SELECT * FROM Branch_Supplier;