--For every payment, show customer's next payment.

SELECT customer_id,payment_id,payment_date,amount,
    LEAD(amount) OVER(PARTITION BY customer_id ORDER BY payment_date,payment_id) AS next_payment
    FROM payment;