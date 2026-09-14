CREATE OR REPLACE VIEW category_performance_dashboard AS 
    WITH category_summary AS (
        SELECT category_id,name, film_count,
            rental_count,total_revenue,
            CASE
                WHEN rental_count  >= 150 AND total_revenue >= 200 THEN 'Top Category'
                WHEN rental_count >= 150 THEN 'High Volume'
                WHEN total_revenue >= 200 THEN 'High Revenue'
                WHEN rental_count > 0 THEN 'Low Performance'
                ELSE 'Inactive'
            END 
                AS performance_category
        FROM category_revenue_summary
    ) 
    SELECT category_id,name,
        film_count,rental_count,total_revenue,
        ROUND(
            (total_revenue/
                NULLIF(SUM(total_revenue) OVER(),0))*100,2
        ) AS revenue_percentage,
        performance_category
    FROM category_summary
    ORDER BY total_revenue DESC;