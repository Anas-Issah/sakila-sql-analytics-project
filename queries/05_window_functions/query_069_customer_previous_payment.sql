--For every payment, show the amount of the customer's previous payment.

SELECT customer_id,payment_id,payment_date,amount,
    LAG(amount) OVER(PARTITION BY customer_id ORDER BY payment_date,payment_id) AS previous_payment
    FROM payment;