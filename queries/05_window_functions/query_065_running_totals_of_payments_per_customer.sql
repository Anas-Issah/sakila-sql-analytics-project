--Show a running total of payments for each customer ordered by payment date

SELECT customer_id,payment_id,payment_date,amount,
    SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_date) AS running_total
    FROM payment;