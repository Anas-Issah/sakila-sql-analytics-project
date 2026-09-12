SELECT store_id,store_manager,
    customer_count,rental_count,
    total_revenue,average_revenue_per_rental,
    ROUND(
        (total_revenue/SUM(total_revenue) OVER()) * 100,2
        ) AS revenue_percentage
FROM store_performance_summary
; 