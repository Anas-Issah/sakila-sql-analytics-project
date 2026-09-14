WITH customers_total_revenue AS(
    SELECT SUM(total_spent) AS total_revenue 
    FROM customer_lifetime_value 
),
customer_revenue_analysis AS(
    SELECT customer_rank,customer_name,
        total_spent,
        (total_spent/(SELECT total_revenue FROM customers_total_revenue))*100
            AS revenue_percentage
    FROM customer_lifetime_value
),
customer_revenue_analysis_cummulative_percentages AS(
    SELECT customer_rank,customer_name,total_spent,
    revenue_percentage,
    SUM(revenue_percentage) OVER(ORDER BY customer_rank) AS cummulative_revenue_percentage
FROM customer_revenue_analysis
)

SELECT
    MIN(customer_rank) AS customers_needed,
    (SELECT COUNT(*) FROM customer_lifetime_value) AS total_customers,
    ROUND(
        MIN(customer_rank)::NUMERIC /
        (SELECT COUNT(*) FROM customer_lifetime_value) * 100,
        2
    ) AS customer_percentage
FROM customer_revenue_analysis_cummulative_percentages
WHERE cummulative_revenue_percentage >= 80;
