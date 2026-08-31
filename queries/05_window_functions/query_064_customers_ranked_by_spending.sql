--Rank customers according to their total spending

WITH customer_totals AS (
    SELECT customer_id,SUM(amount) AS total_spent FROM payment
    GROUP BY customer_id
)                     
SELECT customer_id,total_spent,RANK() OVER(ORDER BY total_spent DESC) AS customer_rank
    FROM customer_totals;