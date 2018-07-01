/**
 Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+

For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.


[1 1]
[2 2]
[3 1]
[4 1]
 */


/**
表格创建
 */

use code;
drop table IF EXISTS `Logs`;
create table IF NOT EXISTS `Logs`(
  Id int,
  Num int
);

delete from Logs;
insert into Logs (Id, Num) VALUES
  (1, 1),
  (2, 2),
  (3, 1),
  (4, 1);

/**
代码
连续出现三次
 */

select distinct l1.num
from Logs l1
    join Logs l2 on l1.id=l2.id-1
    join Logs l3 on l1.id=l3.id-2
where l1.num=l2.num and l2.num=l3.num



