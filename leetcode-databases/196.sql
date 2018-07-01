/**
 Write a SQL query to delete all duplicate email entries in a table named Person,
 keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.

For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+


[1 "abc@efg.com"]
[2 "abc@efg.com"]

[2 "abc@efg.com"]
[1 "abc@efg.com"]
 */

drop table IF EXISTS `Person`;
create table IF NOT EXISTS `Person`(
  Id int,
  Email varchar(64)
);
delete from Person;
insert into Person (Id, Email) VALUES
  (2, 'abc@efg.com'),
  (1, 'abc@efg.com');

/**
代码
 */

;

delete from Person where Id not in (select minone from (select minone from (select min(Id) as minone from Person GROUP BY Email) as tmp2) as tmp1);



