/**
 Suppose that a website contains two tables, the Customers table and the Orders table.
 Write a SQL query to find all customers who never order anything.

Table: Customers.

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+

Table: Orders.

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+

Using the above tables as example, return the following:

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

 */

use code;
drop table IF EXISTS `Customers`;
create table IF NOT EXISTS `Customers`(
  Id int,
  Name varchar(64)
);
drop table IF EXISTS `Orders`;
create TABLE  IF NOT EXISTS `Orders` (
  Id int,
  CustomerId INT
);
insert into Customers (Id, Name) VALUES
  (1, 'Joe'),
  (2, 'Henry'),
  (3, 'Sam'),
  (4, 'Max');
INSERT into Orders (Id, CustomerId) VALUES
  (1, 3), (2, 1);

/**
代码
 */

select Name as Customers  from `Customers` LEFT JOIN Orders on Customers.Id=Orders.CustomerId where CustomerId is NULL ;

select Name as Customers from
  (select Name, Orders.Id as TT from Customers LEFT JOIN Orders on Customers.Id=Orders.CustomerId) as qq
where qq.TT IS NULL ;




