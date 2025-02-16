CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,  -- Unique identifier for each employee
    Name VARCHAR(100) NOT NULL,  -- Full name of the employee
    Department VARCHAR(50) NOT NULL,  -- Department where the employee works
    Salary DECIMAL(10, 2) NOT NULL,  -- Annual salary of the employee
    HireDate DATE NOT NULL  -- Date when the employee was hired
);



INSERT INTO Employees (EmployeeID, Name, Department, Salary, HireDate) VALUES
(6, 'Emily Davis', 'Marketing', 58000, '2021-09-12'),
(7, 'Michael Wilson', 'Finance', 72000, '2017-08-14'),
(8, 'Sophia Martinez', 'IT', 68000, '2020-12-05'),
(9, 'William Anderson', 'HR', 53000, '2022-02-18'),
(10, 'Olivia Taylor', 'Marketing', 62000, '2019-10-22'),
(11, 'James Thomas', 'Finance', 75000, '2018-04-30'),
(12, 'Ava Jackson', 'IT', 71000, '2021-11-15'),
(13, 'Benjamin White', 'HR', 54000, '2023-01-10'),
(14, 'Mia Harris', 'Marketing', 59000, '2020-06-25'),
(15, 'Ethan Clark', 'Finance', 73000, '2019-03-17'),
(16, 'Isabella Lewis', 'IT', 69000, '2022-08-19'),
(17, 'Liam Walker', 'HR', 56000, '2021-07-03'),
(18, 'Charlotte Hall', 'Marketing', 63000, '2018-12-11'),
(19, 'Noah Young', 'Finance', 74000, '2020-05-28'),
(20, 'Amelia King', 'IT', 70000, '2023-02-14');


