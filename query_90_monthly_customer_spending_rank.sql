--For each month, find the top 3 customers by spending

WITH customer_monthly_expenditure AS(
    SELECT DATE_TRUNC('Month', payment_date) AS month,customer_id,
        SUM(amount) AS monthly_expenditure
        FROM payment
        GROUP BY DATE_TRUNC('Month', payment_date) ,customer_id
),
customer_rank AS(
    SELECT month,customer_id,monthly_expenditure,
        ROW_NUMBER() OVER(PARTITION BY month ORDER BY monthly_expenditure DESC) AS rank 
        FROM customer_monthly_expenditure
)
SELECT cr.month,cr.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    cr.monthly_expenditure,cr.rank 
    FROM customer_rank cr 
    INNER JOIN customer c 
    ON cr.customer_id = c.customer_id 
    WHERE cr.rank IN (1,2,3)
    ORDER BY month,rank;
