--Classify every payment based on it's amount

SELECT payment_id,customer_id, amount,
    CASE
        WHEN amount >= 8 THEN 'LARGE'
        WHEN amount >= 5 THEN 'MEDIUM'
        ELSE 'SMALL'
    END
    AS payment_size
    FROM payment
    ORDER BY amount DESC;