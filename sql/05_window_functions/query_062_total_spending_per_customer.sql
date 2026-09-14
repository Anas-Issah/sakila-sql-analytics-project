--Show every payment together with the customer's total spending

SELECT payment_id,customer_id,amount,
    SUM(amount) OVER(PARTITION BY customer_id) AS total_customr_spending
    FROM payment;