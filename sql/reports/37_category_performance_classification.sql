SELECT category_id,name,
    film_count,rental_count,
    total_revenue,
    CASE 
        WHEN rental_count >= 150 AND total_revenue >= 200 THEN 'Top Category'
        WHEN rental_count >= 150 THEN 'High Volume'
        WHEN total_revenue >= 200 THEN 'High Revenue'
        WHEN rental_count > 0 THEN 'Low Performance'
        ELSE 'Inactive'
    END
        AS performance_category
FROM category_revenue_summary;