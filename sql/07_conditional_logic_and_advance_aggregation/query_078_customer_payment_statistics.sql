--Create a customer-level report containing
--customer_id
--total_spent
--average_payment
--largest_payment
--smallest__payment
--large_payment_count (any payment >= 8)

WITH customer_totals AS(
    SELECT customer_id,SUM(amount)AS total_spent ,AVG(amount) AS average_payment,
    MAX(amount) AS largest_payment,MIN(amount) AS smallest_payment
    FROM payment
    GROUP BY customer_id
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
    SELECT customer_id, SUM(large_payment) AS large_payment_count FROM customer_large_payment
    GROUP BY customer_id
)
SELECT ct.customer_id,ct.total_spent,ct.average_payment,
    ct.average_payment,ct.largest_payment,
    ct.smallest_payment,cc.large_payment_count
    FROM customer_totals ct
    INNER JOIN customer_large_payment_count cc
    ON ct.customer_id = cc.customer_id
    ORDER BY large_payment_count DESC;

