/**
 The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+

Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+

 */

/**
创建表格
 */
use test;
drop TABLE IF EXISTS `181`;
create table if not EXISTS `181` (
  Id int,
  Name varchar(64),
  Salary varchar(64),
  ManagerId int
);

insert into `181` (Id, Name, Salary, ManagerId) VALUES
  (1, 'Joe', 70000, 3),
  (2, 'Henry', 80000, 4),
  (3, 'Sam', 60000, NULL),
  (4, 'Max', 90000, NULL);

/**
开始查询
 */

select * from `181`;


select a.Name as Employee from `Employee` as a JOIN `Employee` as b on a.ManagerId=b.Id where a.Salary > b.Salary;













