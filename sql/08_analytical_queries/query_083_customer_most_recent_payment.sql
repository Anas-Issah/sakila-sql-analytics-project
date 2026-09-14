--For every customer, find their most recent payment

WITH customer_payments AS(
    SELECT c.customer_id,CONCAT(c.first_name,' ',c.last_name) AS customer_name,
        p.payment_date, p.amount,
        ROW_NUMBER() OVER(PARTITION BY c.customer_id ORDER by payment_date DESC) as payment_num
        FROM customer c
        INNER JOIN payment p
        ON c.customer_id = p.customer_id)
SELECT customer_id,customer_name,payment_date::DATE,amount
    FROM customer_payments 
    WHERE payment_num = 1
    ORDER BY customer_id ASC;

    