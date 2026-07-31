--Finance wants to investigate large payment transactions.
SELECT payment_id,customer_id,amount FROM payment
WHERE amount >= 5;