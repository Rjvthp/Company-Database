-- Create Branch Table
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE
);
SELECT * FROM branch;

-- Create Employee Table
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_date DATE,
  sex CHAR(1),
  salary INT,
  super_id INT,
  branch_id INT,
  FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

-- Create Client Table
CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

-- Create Works_With Table
CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- Create Branch_Supplier Table
CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- Insert Data into Branch Table
INSERT INTO branch (branch_id, branch_name, mgr_id, mgr_start_date) VALUES
(1, 'Corporate', 100, '2006-02-09'),
(2, 'Scranton', 102, '1992-04-06'),
(3, 'Stamford', 106, '1998-02-13');

-- Insert Data into Employee Table
INSERT INTO employee (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id) VALUES
(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, 1),
(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1),
(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, 2),
(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2),
(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2),
(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2),
(106, 'Josh', 'Porter', '1969-09-25', 'M', 78000, 100, 3),
(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3),
(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- Insert Data into Client Table
INSERT INTO client (client_id, client_name, branch_id) VALUES
(400, 'Dunmore Highschool', 2),
(401, 'Lackawanna County', 2),
(402, 'FedEx', 3),
(403, 'John Daly Law, LLC', 3),
(404, 'Scranton Whitepages', 2),
(405, 'Times Newspaper', 3),
(406, 'FedEx', 2);

-- Insert Data into Works_With Table
INSERT INTO works_with (emp_id, client_id, total_sales) VALUES
(105, 400, 55000),
(104, 401, 267000),
(106, 402, 22500),
(103, 403, 5000),
(102, 404, 33000),
(108, 405, 13000),
(107, 406, 15000),
(108, 406, 130000);

-- Insert Data into Branch_Supplier Table
INSERT INTO branch_supplier (branch_id, supplier_name, supply_type) VALUES
(2, 'Hammer Mill', 'Paper'),
(2, 'Uni-ball', 'Writing Utensils'),
(2, 'Patriot Paper', 'Paper'),
(3, 'J.T. Forms & Labels', 'Custom Forms'),
(3, 'Uni-ball', 'Writing Utensils'),
(3, 'Hammer Mill', 'Paper'),
(3, 'Stamford Labels', 'Custom Forms');

-- List all tables
SHOW TABLES;

-- View contents of the employee table
SELECT * FROM employee;

-- View contents of the branch table
SELECT * FROM branch;

-- View contents of the client table
SELECT * FROM client;

-- View contents of the works_with table
SELECT * FROM works_with;

-- View contents of the branch_supplier table
SELECT * FROM branch_supplier;
