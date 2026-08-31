--Rank all payments from highest amount to lowest

SELECT payment_id,customer_id,amount,
    RANK() OVER(ORDER BY amount DESC) AS payment_rank
    FROM payment;