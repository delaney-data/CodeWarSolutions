/*
https://www.codewars.com/kata/58167fa1f544130dcf000317

For this challenge your task is to calculate the MIN, MEDIAN and MAX scores of the students from the results table.
Resultant table:
  min  
  median
  max
*/

SELECT
  MIN(score) AS Min,

  ((
 (SELECT MAX(Score) FROM
   (SELECT score FROM result ORDER BY score LIMIT 50) AS BottomHalf)
   +
  (SELECT MIN(Score) FROM
   (SELECT score FROM result ORDER BY score DESC LIMIT 50) AS TopHalf)
  ) / 2 :: float) AS Median,

  MAX(score) AS Max

FROM result;
