/**
 Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+

For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+

Note: All emails are in lowercase.



 */

/**
数据创建
 */

use test;
drop table if exists `Person`;
create table if not exists `Person` (
  Id int,
  Email varchar(64)
);

insert into Person (Id, Email) VALUES
  (1, 'a@b.com'),
  (2, 'c@d.com'),
  (3, 'a@b.com');


select a.Email as Email from (select count(*) as number, Email from Person group by Email) as a where a.number > 1;




