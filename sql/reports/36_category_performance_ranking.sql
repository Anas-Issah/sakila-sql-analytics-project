SELECT category_id,name,
    film_count,rental_count,
    total_revenue,
    ROW_NUMBER() OVER(ORDER BY total_revenue DESC) AS revenue_rank,
    ROW_NUMBER() OVER(ORDER BY rental_count DESC) AS rental_rank
FROM category_revenue_summary
;