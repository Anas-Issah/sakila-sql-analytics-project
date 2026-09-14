--Rank customers by their total spending using DENSE_RANK();

WITH customer_totals AS(
    SELECT customer_id,SUM(amount) AS total_spent FROM payment
    GROUP BY customer_id)
SELECT customer_id,total_spent,DENSE_RANK() OVER(ORDER BY total_spent DESC) AS customer_rank
FROM customer_totals;