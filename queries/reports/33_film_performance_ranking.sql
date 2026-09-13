SELECT film_id,title,
    rental_count,total_revenue,
    ROW_NUMBER() OVER(ORDER BY total_revenue DESC) AS revenue_rank,
    ROW_NUMBER() OVER(ORDER BY rental_count DESC) AS rental_rank
FROM film_performance_summary;