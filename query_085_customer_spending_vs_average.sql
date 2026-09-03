--Create a customer spending report showing whether each customer's total spending 
-- is above or below the average customer spending
--return
--customer_id
--customer_name
--total_spent
--average_customer_spending
--difference_from_average
--status

WITH customer_spending AS (
    SELECT customer_id,SUM(amount) AS total_spent
        FROM payment
        GROUP BY customer_id
),
average_total_spending AS (
    SELECT AVG(total_spent) AS average_spending FROM customer_spending 
)
SELECT cs.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    cs.total_spent,(SELECT * FROM average_total_spending) AS average_customer_spending,
    cs.total_spent - (SELECT * FROM average_total_spending)  AS difference_from_average,
    CASE 
        WHEN   cs.total_spent - (SELECT * FROM average_total_spending)  > 0 THEN 'Above Average'
        WHEN cs.total_spent - (SELECT * FROM average_total_spending)  < 0 THEN 'Below Average'
        ELSE 'Match Average'
    END
        AS status
    FROM customer_spending cs
    INNER JOIN customer c 
    ON cs.customer_id = c.customer_id
    ORDER BY total_spent DESC;