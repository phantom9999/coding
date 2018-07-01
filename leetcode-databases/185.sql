/**
 The Employee table holds all employees.
 Every employee has an Id, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
+----+-------+--------+--------------+

The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+

Write a SQL query to find employees who earn the top three salaries in each of the department.
For the above tables, your SQL query should return the following rows.

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
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
delete from Employee;
insert into Employee (Id, Name, Salary, DepartmentId) VALUES
(1, 'Joe', 70000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1);

INSERT  INTO Department (id, name) VALUES
(1, 'IT'),
(2, 'Sales');


select
  Employee.Id as id, Employee.Name as Employee, Salary, DepartmentId, Department.name as Department
from Employee, Department where DepartmentId=Department.id;

/*
SELECT a.id,a.gid,a.col1,a.col2 FROM t2 a
WHERE 3>=(
SELECT COUNT(*) FROM t2 b
WHERE a.gid=b.gid AND a.col2<=b.col2)
ORDER BY a.gid,a.col2 desc
*/

select Department, Employee, Salary
from (
  select
  Employee.Id as id, Employee.Name as Employee, Salary, DepartmentId, Department.name as Department
from Employee, Department where DepartmentId=Department.id
) as a
where 4 >= (
  select count(*) from (
  select
  Employee.Id as id, Employee.Name as Employee, Salary, DepartmentId, Department.name as Department
from Employee, Department where DepartmentId=Department.id
) as b
  where a.DepartmentId=b.DepartmentId and a.Salary<=b.Salary
) ORDER BY Department, Salary DESC ;

/**
    "Employee": [
      [1, "Joe", 60000, 1],
      [2, "Ralph", 50000, 1],
      [3, "Joel", 60000, 1],
      [4, "Tracy", 75000, 1]
    ],
    "Department": [
      [1, "IT"]
    ]
 */

delete from Employee;
delete from Department;
insert into Employee (Id, Name, Salary, DepartmentId) VALUES
(1, 'Joe', 60000, 1),
(2, 'Ralph', 50000, 1),
(3, 'Joel', 60000, 1),
(4, 'Tracy', 75000, 1);

INSERT into Department (id, name) VALUES
  (1, 'IT');

SELECT
  d.name as Department,
  b.name as Employee,
  b.salary
FROM
  (
    SELECT
      e1.name,
      e1.salary,
      e1.DepartmentId,
      count(DISTINCT (e2.salary)) as cnt
    FROM Employee e1
      INNER JOIN Employee e2
        ON e1.DepartmentId = e2.DepartmentId
           AND e1.salary <= e2.salary
    GROUP BY e1.name
      , e1.salary
      , e1.DepartmentId
  ) as b
  INNER JOIN Department as d
    ON b.DepartmentId = d.Id
WHERE b.cnt < 4;

