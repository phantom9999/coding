/**
 Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

For example, given the above Employee table, the nth highest salary where n = 2 is 200.
If there is no nth highest salary, then the query should return null.
 */
use code;

drop TABLE IF EXISTS `Employee`;
create TABLE IF NOT EXISTS `Employee`
(
  id int,
  Salary int
);

delete from Employee;
insert into Employee (id, Salary) VALUES
  (1, 100),
  (2, 200),
  (3, 300);


SELECT distinct(Salary) FROM Employee UNION SELECT NULL ORDER BY Salary DESC LIMIT 1 OFFSET 4;


CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  select N-1 into N;
  RETURN (
      # Write your MySQL query statement below.
SELECT distinct(Salary) FROM Employee UNION SELECT NULL ORDER BY Salary DESC LIMIT 1 OFFSET N
  );
END





















