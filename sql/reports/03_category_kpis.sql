WITH category_revenue_rank AS(
    SELECT name,
        ROW_NUMBER() OVER(ORDER BY total_revenue DESC) AS revenue_rank,
        ROW_NUMBER() OVER(ORDER BY rental_count DESC) AS rental_rank
    FROM category_revenue_summary
)
SELECT 
    (SELECT COUNT(category_id) FROM category) AS total_categories,
    (SELECT COUNT(film_id) FROM film) AS total_films,
    (SELECT COUNT(rental_id) FROM rental) AS total_rentals,
    (SELECT SUM(amount) FROM payment) AS total_revenue,
    (SELECT name FROM category_revenue_rank
        WHERE revenue_rank = 1
        ) AS highest_revenue_category,
    (SELECT name FROM category_revenue_rank
        WHERE rental_rank = 1) AS most_rented_category
    ;

