--Create a comprehensive customer report containing:
--customer_id
--customer_name
--payment_count
--total_spent
--average_payment
--large_payment_count
--large_payment_percentage
--customer_category

WITH customer_totals AS(
    SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(p.*) AS total_payments,SUM(p.amount)AS total_spent ,
    AVG(p.amount) AS average_payment
    FROM customer c
    INNER JOIN payment p 
    ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
),
customer_large_payment AS(
    SELECT customer_id,
    CASE
        WHEN amount >= 8 THEN 1
        ELSE 0
        END
        AS large_payment
    FROM payment      
),
customer_large_payment_count AS(
    SELECT customer_id, SUM(large_payment) AS large_payment_count 
        FROM customer_large_payment
        GROUP BY customer_id
),
 customer_category AS (
    SELECT customer_id,
        CASE
        WHEN total_spent >= 150 THEN 'VIP'
        WHEN total_spent >= 100 THEN 'HIGH'
        WHEN total_spent >= 50 THEN 'MEDIUM'
        ELSE 'LOW'
    END
    AS customer_category
    FROM customer_totals
)  
SELECT ct.customer_id,ct.customer_name,
    ct.total_payments,ct.total_spent,
    ct.average_payment,cp.large_payment_count,
    ROUND(cp.large_payment_count::NUMERIC/ct.total_payments  * 100,2) AS large_payment_percentage,
    cc.customer_category
    FROM customer_totals ct
    INNER JOIN customer_large_payment_count cp
    ON ct.customer_id = cp.customer_id
    INNER JOIN customer_category cc 
    ON ct.customer_id = cc.customer_id
    ORDER BY ct.total_spent DESC;