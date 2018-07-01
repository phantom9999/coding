/**
 The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
+----+-------+--------+--------------+

The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+

Write a SQL query to find employees who have the highest salary in each of the departments.
For the above tables, Max has the highest salary in the IT department and Henry has the highest salary in the Sales department.

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
 */

use code;
drop table IF EXISTS `Employee`;
create table IF NOT EXISTS `Employee`
(
  Id int,
  Name varchar(64),
  Salary int,
  DepartmentId int
);
drop TABLE IF EXISTS `Department`;
create table IF NOT EXISTS `Department`
(
  id int,
  name varchar(64)
);

insert into Employee (Id, Name, Salary, DepartmentId) VALUES
  (1, 'Joe', 70000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1);

INSERT  INTO Department (id, name) VALUES
  (1, 'IT'),
(2, 'Sales');


select Department.name as Department, Employee.Name as Employee, max(Employee.Salary)
from Employee JOIN Department ON Employee.DepartmentId=Department.id
GROUP BY Department.id, Employee.Salary;

/**
[1 "Joe" 60000 1]
[4 "Max" 60000 1]

[1 "IT"]
 */
delete from Employee;
DELETE from Department;
insert into Employee (Id, Name, Salary, DepartmentId) VALUES
  (1, 'Joe', 60000, 1),
  (4, 'Max', 60000, 1);

INSERT  INTO Department (id, name) VALUES
  (1, 'IT');

select Department.Name, Employee.Name, Employee.Salary
from Employee
  JOIN (select max(Employee.Salary) as maxone, Employee.DepartmentId as dId from Employee GROUP BY Employee.DepartmentId) as a
  on Employee.DepartmentId = a.dId and Employee.Salary=a.maxone
JOIN Department
ON Employee.DepartmentId=Department.id;