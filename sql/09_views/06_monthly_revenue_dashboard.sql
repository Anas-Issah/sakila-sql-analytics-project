CREATE OR REPLACE VIEW monthly_revenue_dashboard AS
    WITH monthly_totals AS (
    SELECT DATE_TRUNC('MONTH',r.rental_date)::DATE AS month,
        COUNT(r.rental_id) AS total_rentals,SUM(p.amount)AS total_revenue,
        ROUND(AVG(p.amount),2) AS average_revenue_per_rental
    FROM rental r 
    LEFT JOIN payment p 
    ON r.rental_id = p.rental_id 
    GROUP BY DATE_TRUNC('MONTH',r.rental_date)
),
monthly_totals_with_lag AS (
    SELECT month,total_rentals,total_revenue,average_revenue_per_rental,
        LAG(total_revenue) OVER(ORDER BY month) AS previous_month_revenue
    FROM monthly_totals
)
SELECT month,total_rentals,COALESCE(total_revenue,0) AS total_revenue,
    COALESCE(average_revenue_per_rental,0) AS average_revenue_per_rental,
    COALESCE(previous_month_revenue,0) AS previous_month_revenue,
    COALESCE(ROUND(
        (
            (total_revenue-previous_month_revenue)/ NULLIF(previous_month_revenue,0)
            ) * 100,2
            ),0
     ) AS revenue_growth_percentage
FROM monthly_totals_with_lag
ORDER BY month;