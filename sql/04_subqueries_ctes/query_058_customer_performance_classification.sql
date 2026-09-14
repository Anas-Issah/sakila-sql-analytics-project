--Create a customer performance report
--total spending >= 150 high
--total spending >= 100 but < 150 medium
--total spending < 100 low

WITH customer_total_expenditure AS(
    SELECT customer_id,SUM(amount) AS total_spent FROM payment
    GROUP BY customer_id
)

SELECT customer_id,total_spent,
                   CASE 
                        WHEN total_spent >= 150 THEN 'High'
                        WHEN total_spent >= 100 THEN 'Medium'
                        ELSE 'Low' 
                        END AS performance
FROM customer_total_expenditure
ORDER BY total_spent DESC;