SELECT 
    (SELECT COUNT(customer_id) FROM customer) AS total_customers,
    (SELECT COUNT(customer_id) FROM customer WHERE active = 1) AS active_customers,
    (SELECT COUNT(customer_id) FROM customer WHERE active = 0) AS inactive_customers,
    (SELECT COUNT(rental_id) FROM rental)  AS total_rentals,
    ROUND((SELECT COUNT(rental_id) FROM rental)/(SELECT COUNT(customer_id) FROM customer)::NUMERIC,2) AS average_rentals_per_customer,
    (SELECT SUM(amount) FROM payment) AS total_revenue,
    ROUND((SELECT SUM(amount) FROM payment)/(SELECT COUNT(customer_id) FROM customer)::NUMERIC,2) AS average_customer_spend
  ;



