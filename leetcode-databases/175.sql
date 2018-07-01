/**
 Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+
PersonId is the primary key column for this table.

Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
AddressId is the primary key column for this table.


Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:

FirstName, LastName, City, State

 */

/**
表格创建
 */

use test;
drop table if EXISTS  `Person`;
create table IF NOT EXISTS `Person` (
  PersonId int PRIMARY KEY,
  FirstName varchar(64),
  LastName varchar(64)
);

drop table IF EXISTS `Address`;
create table IF NOT EXISTS `Address` (
  AddressId  int PRIMARY KEY ,
  PersonId int,
  City varchar(64),
  State varchar(64)
);

insert into Person (PersonId, FirstName, LastName) VALUES
  (1, '01', '11'),
  (2, '02', '12'),
  (3, '03', '13'),
  (4, '04', '14');

INSERT into Address (AddressId, PersonId, City, State) VALUES
  (1, 1, '21', '31'),
  (2, 3, '22', '32');



/**
代码
FirstName, LastName, City, State
 */

select FirstName, LastName, City, State from Person LEFT JOIN Address ON Person.PersonId=Address.PersonId;









