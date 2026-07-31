--The marketing team wants a list of customers who are currently active.

SELECT customer_id,first_name,last_name,email FROM customer
WHERE active = 1;