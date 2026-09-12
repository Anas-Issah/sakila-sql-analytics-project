SELECT film_id,title,
    rental_count,total_revenue,
    ROUND(
        (COALESCE(total_revenue,0)/SUM(total_revenue) OVER()) * 100,2
    ) AS revenue_percentage
FROM film_performance_summary
ORDER BY total_revenue;