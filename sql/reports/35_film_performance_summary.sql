WITH film_performance AS (
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
)
SELECT 
    performance_category,
    COUNT(film_id) AS film_count,
    SUM(rental_count) AS total_rentals,
    SUM(total_revenue) AS total_revenue,
    ROUND(
        SUM(total_revenue)/COUNT(film_id),2
    ) AS average_revenue_per_film
FROM film_performance
GROUP BY performance_category
ORDER BY total_revenue DESC;