--Assign a sequential number to each payment made by each customer, ordered by payment date.

SELECT customer_id,payment_id,payment_date,amount,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY payment_date) AS payment_number
    FROM payment;