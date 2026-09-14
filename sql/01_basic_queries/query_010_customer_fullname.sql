--Create a customer contact list showing customers' full names.
SELECT customer_id,CONCAT(first_name,' ',last_name) AS full_name FROM customer;