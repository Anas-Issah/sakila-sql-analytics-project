SELECT film_id,title,
    rental_count,total_revenue,
    CASE 
        WHEN rental_count >= 30 AND total_revenue >= 100 THEN 'Top Performer'
        WHEN rental_count >= 30	THEN 'Popular'
        WHEN total_revenue >= 100 THEN 'High Revenue'
        WHEN rental_count > 0  THEN	'Low Performer'
        ELSE 'Inactive'
    END
        AS performance_category
FROM film_performance_summary 
ORDER BY total_revenue DESC;