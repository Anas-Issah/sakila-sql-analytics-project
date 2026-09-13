WITH store_performance AS (
    SELECT store_id,store_manager,
    customer_count,rental_count,
    total_revenue,
    CASE
        WHEN rental_count >= 400 AND total_revenue >= 3000 THEN 'Top Store'
        WHEN rental_count >= 400 THEN 'High Volume'
        WHEN total_revenue >= 3000 THEN 'High Revenue'
        WHEN rental_count > 0 THEN	'Low Performance'
        ELSE 'Inactive'
    END
        AS performance_category
FROM store_performance_summary
)
SELECT performance_category,COUNT(store_id) AS store_count,
    SUM(customer_count) AS total_customers,
    SUM(rental_count) AS total_rentals,
    SUM(total_revenue) AS total_revenue,
    ROUND(
        SUM(total_revenue)/COUNT(store_id),2
    ) AS average_revenue_per_store
FROM film_performance
GROUP BY performance_category
ORDER BY total_revenue DESC;