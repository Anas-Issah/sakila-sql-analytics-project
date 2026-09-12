WITH monthly_totals AS (
    SELECT DATE_TRUNC('MONTH',r.rental_date)::DATE AS month,
        SUM(p.amount)AS total_revenue
    FROM rental r 
    LEFT JOIN payment p 
    ON r.rental_id = p.rental_id 
    GROUP BY DATE_TRUNC('MONTH',r.rental_date)
),
monthly_totals_with_lag AS (
    SELECT month,total_revenue,
        LAG(total_revenue) OVER(ORDER BY month) AS previous_month_revenue
    FROM monthly_totals
)
SELECT month,total_revenue,previous_month_revenue,
    ROUND(
        (
            (total_revenue-previous_month_revenue)/ NULLIF(previous_month_revenue,0)
            ) * 100,2
            ) AS revenue_growth
FROM monthly_totals_with_lag
ORDER BY month;