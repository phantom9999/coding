/**
Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

+---------+------------+------------------+
| Id(INT) | Date(DATE) | Temperature(INT) |
+---------+------------+------------------+
|       1 | 2015-01-01 |               10 |
|       2 | 2015-01-02 |               25 |
|       3 | 2015-01-03 |               20 |
|       4 | 2015-01-04 |               30 |
+---------+------------+------------------+

For example, return the following Ids for the above Weather table:

+----+
| Id |
+----+
|  2 |
|  4 |
+----+
 */
use code;
drop table IF EXISTS `Weather`;
create TABLE IF NOT EXISTS `Weather`
(
  Id int,
  Date DATE,
  Temperature int
);
delete from Weather;
insert into Weather (Id, Date, Temperature) VALUES
  (1, '2015-01-01', 10),
  (2, '2015-01-02', 25),
  (3, '2015-01-03', 20),
  (4, '2015-01-04', 30);


/**
[1 "2000-12-16" 3]
[2 "2000-12-15" -1]
 */
delete from Weather;
insert into Weather (Id, Date, Temperature) VALUES
  (1, '2000-12-16', 3),
  (2, '2000-12-15', -1);


select a.Id from Weather as a JOIN Weather as b on a.Date = DATE_ADD(b.Date, INTERVAL 1 DAY) where a.Temperature > b.Temperature;





















