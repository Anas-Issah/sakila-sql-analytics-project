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
ORDER BY total_revenue DESC;