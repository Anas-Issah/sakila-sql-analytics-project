--For each customer, determine what percentage of their payments were large payments.

WITH customer_payments_number AS(
    SELECT customer_id,COUNT(*)AS total_payments 
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
SELECT cn.customer_id,cn.total_payments,cc.large_payment_count AS large_payments,
    ROUND(cc.large_payment_count::NUMERIC/cn.total_payments  * 100,2)AS large_payment_percentage
    FROM customer_payments_number cn 
    INNER JOIN customer_large_payment_count cc 
    ON cn.customer_id = cc.customer_id
    ORDER BY large_payments;
