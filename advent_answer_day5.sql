#advent challenge day_4

WITH CTE AS (SELECT *,
LAG(toys_produced) OVER(ORDER BY production_date) AS previous_toys_produced,
(toys_produced - (LAG(toys_produced) OVER(ORDER BY production_date))) AS production_change
FROM toy_production)
SELECT * , ROUND((production_change::NUMERIC / previous_toys_produced::NUMERIC)*100, 2) AS production_change_percentage
FROM CTE
WHERE previous_toys_produced IS NOT NULL
ORDER BY 5 DESC;


