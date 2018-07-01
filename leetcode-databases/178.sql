/**
 Write a SQL query to rank scores.
 If there is a tie between two scores, both should have the same ranking.
 Note that after a tie, the next ranking number should be the next consecutive integer value.
 In other words, there should be no "holes" between ranks.

+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+

For example, given the above Scores table, your query should generate the following report (order by highest score):

+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+

 */

use code;
drop table IF EXISTS `Scores`;
create table IF NOT EXISTS `Scores`
(
  Id int,
  Score DOUBLE
);

delete from Scores;
insert into Scores (Id, Score) VALUES
  (1, 3.5),
  (2, 3.65),
  (3, 4.00),
  (4, 3.85),
  (5, 4.00),
  (6, 3.65);


SELECT
  score,(
          SELECT COUNT(DISTINCT score) FROM Scores where score > a.score
        ) + 1 as  rank
from Scores as a
ORDER by score DESC;




SELECT
  T2.Score as Score, (
                       SELECT COUNT(*) + 1 FROM
                         (SELECT T1.Score FROM Scores as T1 GROUP BY Score ORDER BY Score DESC) as TEMP
                       WHERE
                         T2.Score < TEMP.Score
                     ) as  Rank
FROM
  Scores T2
ORDER BY Score DESC;














