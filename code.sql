SELECT
  state,
  year,
  tempc,
  tempc - LAG(tempc, 1, 0) OVER(
    PARTITION BY state
    ORDER BY year
  ) change_in_temp
FROM state_climate
ORDER BY change_in_temp DESC
--LIMIT 5
;

SELECT
  state,
  year,
  tempc,
  LAST_VALUE(tempc) OVER (
    PARTITION BY state
    ORDER BY tempc
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) as highest_temp
FROM state_climate
LIMIT 5
;

SELECT
  state,
  year,
  tempc,
  FIRST_VALUE(tempc) OVER (
    PARTITION BY state
    ORDER BY tempc
  ) as lowest_temp
FROM state_climate
LIMIT 5
;

SELECT
  state,
  year,
  tempc,
  AVG(tempc)
    OVER (
      PARTITION BY state
      ORDER BY year
    ) as running_avg_temp
FROM state_climate
LIMIT 5
;


SELECT * 
FROM state_climate 
LIMIT 10
;
