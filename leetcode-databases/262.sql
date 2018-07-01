/**
 The Trips table holds all taxi trips.
 Each trip has a unique Id, while Client_Id and Driver_Id are both foreign keys to the Users_Id at the Users table.
 Status is an ENUM type of (‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_client’).

+----+-----------+-----------+---------+--------------------+----------+
| Id | Client_Id | Driver_Id | City_Id |        Status      |Request_at|
+----+-----------+-----------+---------+--------------------+----------+
| 1  |     1     |    10     |    1    |     completed      |2013-10-01|
| 2  |     2     |    11     |    1    | cancelled_by_driver|2013-10-01|
| 3  |     3     |    12     |    6    |     completed      |2013-10-01|
| 4  |     4     |    13     |    6    | cancelled_by_client|2013-10-01|
| 5  |     1     |    10     |    1    |     completed      |2013-10-02|
| 6  |     2     |    11     |    6    |     completed      |2013-10-02|
| 7  |     3     |    12     |    6    |     completed      |2013-10-02|
| 8  |     2     |    12     |    12   |     completed      |2013-10-03|
| 9  |     3     |    10     |    12   |     completed      |2013-10-03|
| 10 |     4     |    13     |    12   | cancelled_by_driver|2013-10-03|
+----+-----------+-----------+---------+--------------------+----------+

The Users table holds all users.
Each user has an unique Users_Id, and Role is an ENUM type of (‘client’, ‘driver’, ‘partner’).

+----------+--------+--------+
| Users_Id | Banned |  Role  |
+----------+--------+--------+
|    1     |   No   | client |
|    2     |   Yes  | client |
|    3     |   No   | client |
|    4     |   No   | client |
|    10    |   No   | driver |
|    11    |   No   | driver |
|    12    |   No   | driver |
|    13    |   No   | driver |
+----------+--------+--------+

Write a SQL query to find the cancellation rate of requests made by unbanned clients between
 Oct 1, 2013 and Oct 3, 2013. For the above tables,
 your SQL query should return the following rows with the cancellation rate being rounded to two decimal places.

+------------+-------------------+
|     Day    | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 |       0.33        |
| 2013-10-02 |       0.00        |
| 2013-10-03 |       0.50        |
+------------+-------------------+

 */

use code;
DROP TABLE IF EXISTS `Trips`;
create TABLE IF NOT EXISTS `Trips`
(
  Id int,
  Client_Id int,
  Driver_Id int,
  City_Id int,
  Status varchar(64),
  Request_at varchar(64)
);

INSERT into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES 
(1,1,10,1,'completed','2013-10-01'),
(2,2,11,1,'cancelled_by_driver','2013-10-01'),
(3,3,12,6,'completed','2013-10-01'),
(4,4,13,6,'cancelled_by_client','2013-10-01'),
(5,1,10,1,'completed','2013-10-02'),
(6,2,11,6,'completed','2013-10-02'),
(7,3,12,6,'completed','2013-10-02'),
(8,2,12,12,'completed','2013-10-03'),
(9,3,10,12,'completed','2013-10-03'),
(10,4,13,12,'cancelled_by_driver','2013-10-03');

drop table IF EXISTS `Users`;
create TABLE IF NOT EXISTS `Users`
(
  Users_Id int ,
  Banned VARCHAR(64),
  Role VARCHAR(64)
);
insert into Users (Users_Id, Banned, Role) VALUES
  (1,'No','client'),
  (2,'Yes','client'),
  (3,'No','client'),
  (4,'No','client'),
  (10,'No','driver'),
  (11,'No','driver'),
  (12,'No','driver'),
  (13,'No','driver');



select Client_Id,Status,Request_at, count(*) as number from Trips GROUP BY Request_at, Status, Client_Id;

select * from Users where Banned='No' and Role='client';

/**
统计各个部分人数
 */
select
  Request_at,
    max(CASE Status WHEN 'completed' then sum1 else 0 end) as completed,
    max(CASE Status WHEN 'cancelled_by_driver' then sum1 else 0 end) as cancelled_by_driver,
    max(CASE Status WHEN 'cancelled_by_client' then sum1 else 0 end) as cancelled_by_client
from (
  SELECT
    Request_at,
    Status,
    sum(number) AS sum1
  FROM
    (SELECT
       Client_Id,
       Status,
       Request_at,
       count(*) AS number
     FROM Trips
     GROUP BY Request_at, Status, Client_Id) AS a
    JOIN
    (SELECT
      Users_Id, Role
     FROM Users
     WHERE Banned = 'No' AND Role = 'client') AS b ON a.Client_Id = b.Users_Id
  GROUP BY Request_at, Status
) as d
  GROUP BY Request_at;

/**
统计比例
 */
select Request_at, round((cancelled_by_client + cancelled_by_driver)/(completed+cancelled_by_driver+cancelled_by_client), 2) from
(select
  Request_at,
    max(CASE Status WHEN 'completed' then sum1 else 0 end) as completed,
    max(CASE Status WHEN 'cancelled_by_driver' then sum1 else 0 end) as cancelled_by_driver,
    max(CASE Status WHEN 'cancelled_by_client' then sum1 else 0 end) as cancelled_by_client
from (
  SELECT
    Request_at,
    Status,
    sum(number) AS sum1
  FROM
    (SELECT
       Client_Id,
       Status,
       Request_at,
       count(*) AS number
     FROM Trips
     GROUP BY Request_at, Status, Client_Id) AS a
    JOIN
    (SELECT
      Users_Id, Role
     FROM Users
     WHERE Banned = 'No' AND Role = 'client') AS b ON a.Client_Id = b.Users_Id
  GROUP BY Request_at, Status
) as d
  GROUP BY Request_at) as c
where Request_at>='2013-10-01' and Request_at<='2013-10-03';


select * from Trips where Status='cancelled_by_client';

/**
{
  "Trips": [
    ["1", "1", "10", "1", "completed", "2013-10-01"],
    ["2", "2", "11", "1", "cancelled_by_driver", "2013-10-01"],
    ["3", "3", "12", "6", "completed", "2013-10-01"],
    ["4", "4", "13", "6", "cancelled_by_client", "2013-10-01"],
    ["5", "1", "10", "1", "completed", "2013-10-02"],
    ["6", "2", "11", "6", "completed", "2013-10-02"],
    ["7", "3", "12", "6", "completed", "2013-10-02"],
    ["8", "2", "12", "12", "completed", "2013-10-03"],
    ["9", "3", "10", "12", "completed", "2013-10-03"],
    ["10", "4", "13", "12", "cancelled_by_driver", "2013-10-03"],
    ["11", "3", "10", "6", "cancelled_by_driver", "2013-10-02"],
    ["12", "5", "12", "12", "cancelled_by_client", "2013-10-01"],
    ["13", "4", "13", "1", "cancelled_by_driver", "2013-10-03"]
  ],
  "Users": [
    ["1", "No", "client"],
    ["2", "Yes", "client"],
    ["3", "No", "client"],
    ["4", "No", "client"],
    ["5", "Yes", "client"],
    ["10", "No", "driver"],
    ["11", "No", "driver"],
    ["12", "No", "driver"],
    ["13", "No", "driver"]
  ]
}

[
    ["2013-10-01", 0.33],
    ["2013-10-02", 0.33],
    ["2013-10-03", 0.67]
]
 */
delete from Trips;
delete from Users;
insert into Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) VALUES
('1', '1', '10', '1', 'completed', '2013-10-01'),
('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01'),
('3', '3', '12', '6', 'completed', '2013-10-01'),
('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01'),
('5', '1', '10', '1', 'completed', '2013-10-02'),
('6', '2', '11', '6', 'completed', '2013-10-02'),
('7', '3', '12', '6', 'completed', '2013-10-02'),
('8', '2', '12', '12', 'completed', '2013-10-03'),
('9', '3', '10', '12', 'completed', '2013-10-03'),
('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03'),
('11', '3', '10', '6', 'cancelled_by_driver', '2013-10-02'),
('12', '5', '12', '12', 'cancelled_by_client', '2013-10-01'),
('13', '4', '13', '1', 'cancelled_by_driver', '2013-10-03');
INSERT into Users (Users_Id, Banned, Role) VALUES 
('1', 'No', 'client'),
('2', 'Yes', 'client'),
('3', 'No', 'client'),
('4', 'No', 'client'),
('5', 'Yes', 'client'),
('10', 'No', 'driver'),
('11', 'No', 'driver'),
('12', 'No', 'driver'),
('13', 'No', 'driver');





