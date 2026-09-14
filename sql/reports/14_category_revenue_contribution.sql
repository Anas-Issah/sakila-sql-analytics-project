SELECT category_id,name,
    film_count,rental_count,
    total_revenue,average_revenue_per_film,
    ROUND(
        (total_revenue/SUM(total_revenue) OVER()) * 100,2
    ) AS revenue_percentage
FROM category_revenue_summary
ORDER BY total_revenue DESC;
