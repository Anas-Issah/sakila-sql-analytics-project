CREATE OR REPLACE VIEW film_performance_dashboard AS
    WITH film_performance AS (
        SELECT f.film_id,f.title,COALESCE(COUNT(r.rental_id),0) AS rental_count,
            COALESCE(SUM(p.amount),0) AS total_revenue,
            CASE 
                WHEN COUNT(r.rental_id) >= 30 AND SUM(p.amount) >= 100 THEN 'Top Performer'
                WHEN COUNT(r.rental_id) >= 30 THEN 'Popular'
                WHEN SUM(p.amount) >= 100 THEN 'High Revenue'
                WHEN COUNT(r.rental_id) > 0  THEN 'Low Performer'
                ELSE'Inactive'
            END
                AS performance_category
        FROM film f 
        LEFT JOIN inventory i 
        ON f.film_id = i.film_id 
        LEFT JOIN rental r 
        ON i.inventory_id = r.inventory_id 
        LEFT JOIN payment p 
        ON r.rental_id = p.rental_id
        GROUP BY f.film_id
        ORDER BY total_revenue DESC
    )
    
    SELECT film_id,title,rental_count,
        total_revenue,
        ROUND(
            total_revenue/
                NULLIF(SUM(total_revenue) OVER(),0) * 100,2
        ) AS revenue_percentage,
        performance_category
        FROM film_performance
        ORDER BY total_revenue;