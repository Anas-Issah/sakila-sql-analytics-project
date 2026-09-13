CREATE OR REPLACE VIEW dashboard_kpis AS 
    WITH t_revenue AS(
    SELECT SUM(amount) AS total_revenue FROM payment
)
SELECT
    (SELECT COUNT(customer_id) FROM customer) AS total_customers,
    (SELECT COUNT(customer_id) FROM customer
        WHERE active = 1) AS active_customers,
    (SELECT COUNT(film_id) FROM film) AS total_films,
    (SELECT COUNT(category_id) FROM category) AS total_categories,
    (SELECT COUNT(rental_id) FROM rental) AS total_rentals,
    (SELECT total_revenue FROM t_revenue) AS total_revenue,
    ROUND(
        (SELECT AVG(total_spent) FROM customer_lifetime_value),2
    ) AS average_customer_spend,
    ROUND(
        (SELECT total_revenue FROM t_revenue)/
            (SELECT COUNT(rental_id) FROM rental),2        
    ) AS average_rental_revenue,
    (SELECT customer_name FROM customer_lifetime_value
        WHERE customer_rank = 1) AS top_customer,
    (SELECT title FROM film_performance_summary
        ORDER BY total_revenue DESC
        LIMIT 1) AS top_film,
    (SELECT name FROM category_revenue_summary
        ORDER BY total_revenue DESC
        LIMIT 1) AS top_category,
    (SELECT store_id FROM store_performance_summary
        ORDER BY total_revenue DESC
        LIMIT 1) AS top_store
;