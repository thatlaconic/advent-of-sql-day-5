# [Santa's production dashboard](https://adventofsql.com/challenges/5)

## Description
Santa said that the toy production numbers have been fluctuating over the past few days. Some days the elves surpass all expectations, and other days production seems to dip unexpectedly. He's worried that if this trend continues, they might not meet the Christmas Eve deadline.

He needs a detailed analysis of their daily toy production to understand these trends. Maybe then they can identify any issues and ensure that every child receives a gift on Christmas morning

## Challenge
[Download Challenge data](

Using the provided schema and data, write a SQL query that analyzes the daily toy production trends for each date in the table, comparing a date to the date before. The query should accomplish the following:

* List each day's production date and the number of toys produced on that day.
* Include the previous day's toy production next to each current day's production.
* Calculate the change in the number of toys produced compared to the previous day.
*Calculate the percentage change in production compared to the previous day.
* The result set should display the following columns:

  + production_date: The current date.
  + toys_produced: Number of toys produced on the current date.
  + previous_day_production: Number of toys produced on the previous date.
  + production_change: Difference in toys produced between the current date and the previous date.
  + production_change_percentage: Percentage change in production compared to the previous day.
  
## Dataset
This dataset contains 1 table with 2 columns and 5000 rows. 
### Using PostgreSQL
**input**
```sql
SELECT *
FROM toy_production ;
```
**output**
![](https://github.com/thatlaconic/advent-of-sql-day-4/blob/main/toy_production.PNG)

### Solution
[Download Solution Code](https://github.com/thatlaconic/advent-of-sql-day-4/blob/main/advent_answer_day4.sql)

**input**
```sql

WITH CTE AS (SELECT *,
		LAG(toys_produced) OVER(ORDER BY production_date) AS previous_toys_produced,
		(toys_produced - (LAG(toys_produced) OVER(ORDER BY production_date))) AS production_change
		FROM toy_production)
SELECT * , ROUND((production_change::NUMERIC / previous_toys_produced::NUMERIC)*100, 2) AS production_change_percentage
FROM CTE
WHERE previous_toys_produced IS NOT NULL
ORDER BY 5 DESC ;

```
**output**

![](




