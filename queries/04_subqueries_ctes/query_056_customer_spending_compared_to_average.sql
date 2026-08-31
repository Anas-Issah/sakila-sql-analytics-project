--show each customer, their total spending, and the difference between
-- their spending and the average customer spending

WITH customer_expenditure AS (
    SELECT customer_id,SUM(amount) AS total_spent FROM payment
    GROUP BY customer_id
),
average_spent AS (SELECT AVG(total_spent) AS avg_spent FROM customer_expenditure)
SELECT ce.customer_id,ce.total_spent,(SELECT avg_spent FROM average_spent) AS average_customer_expenditure,
ce.total_spent - (SELECT avg_spent FROM average_spent) AS difference_from_average
FROM customer_expenditure ce
ORDER BY ce.total_spent DESC;
