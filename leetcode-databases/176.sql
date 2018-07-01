/**
 Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

For example, given the above Employee table, the second highest salary is 200.
If there is no second highest salary, then the query should return null.

 */

use code;
drop table IF EXISTS `Employee`;
create table IF NOT EXISTS `Employee`
(
  Id int,
  Salary int
);
delete from Employee;
insert into Employee (Id, Salary) VALUES
  (1, 100),
  (2, 200),
  (3, 300);

/**
开始
 */

select Salary from Employee ORDER BY Salary DESC LIMIT 1 OFFSET 3;


SELECT CASE

  END

/**
{"headers": {"Employee": ["Id"
"Salary"]}
"rows": {"Employee": [[1
100]]}}
 */


SELECT distinct(Salary) FROM Employee UNION SELECT NULL ORDER BY Salary DESC LIMIT 1,4;
















