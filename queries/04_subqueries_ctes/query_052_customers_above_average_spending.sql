--Find customers whose total spending is greater than the average spending of all customers

WITH customer_total_spending AS (
    SELECT customer_id,SUM(amount) total_spent FROM payment
GROUP BY customer_id) ,
customers_average_spending AS(
    SELECT AVG(ct.total_spent) AS average_spending FROM customer_total_spending AS ct
)
SELECT ct.customer_id, ct.total_spent FROM customer_total_spending AS ct
WHERE ct.total_spent > (
    SELECT customers_average_spending.average_spending FROM customers_average_spending)
ORDER BY ct.total_spent DESC;