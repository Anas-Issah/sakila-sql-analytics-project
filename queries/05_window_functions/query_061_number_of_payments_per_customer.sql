--Show every payment and total number of payments made by that customer

SELECT payment_id,customer_id,amount,
    COUNT(*) OVER (PARTITION BY customer_id) AS payment_count FROM payment;