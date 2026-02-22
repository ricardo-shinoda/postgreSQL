SELECT * FROM orders;


-- Generate series of dates with [UNION, UNION ALL]

-- UNION duplicate values removed
-- UNION ALL duplicate values also shown

SELECT '2026-02-21' AS Dates
UNION ALL 
SELECT '2026-02-20'
UNION ALL 
SELECT '2026-02-20';

-- Subquery
SELECT * FROM 
(SELECT '2026-02-21' AS Dates
UNION ALL 
SELECT '2026-02-20'
UNION ALL 
SELECT '2026-02-20') AS sq;

-- Using CTE

WITH cte AS (SELECT '2026-02-21' AS Dates
	UNION ALL 
	SELECT '2026-02-20'
	UNION ALL 
	SELECT '2026-02-20')
SELECT * FROM cte;

-- Recursive CTE

WITH RECURSIVE cte AS (SELECT CAST('2026-02-21' AS date) AS dates
						UNION ALL 
						SELECT CAST(dates + INTERVAL '1 DAY' AS date)
						FROM cte
						WHERE dates < CAST('2026-03-15' AS date)
)
SELECT * FROM cte;
