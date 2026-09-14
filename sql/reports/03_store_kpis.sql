WITH store_ranking AS(
    SELECT store_id,
    ROW_NUMBER() OVER(ORDER BY total_revenue DESC) AS revenue_rank,
    ROW_NUMBER() OVER(ORDER BY rental_count DESC) AS rental_rank
    FROM store_performance_summary
)
SELECT
    (SELECT COUNT(store_id) FROM store) AS total_stores,
    (SELECT COUNT(customer_id) FROM customer) AS total_customers,
    (SELECT COUNT(rental_id) FROM rental) AS total_rentals,
    (SELECT SUM(amount) FROM payment) AS total_revenue,
    (SELECT store_id FROM store_ranking
        WHERE revenue_rank = 1) AS highest_revenue_store,
    (SELECT store_id FROM store_ranking
        WHERE rental_rank = 1) AS most_active_store
        ;