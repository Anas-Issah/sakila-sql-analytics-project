--As I move down the customer ranking, how much of total revenue has accumulated?
WITH customers_total_revenue AS(
    SELECT SUM(total_spent) AS total_revenue 
    FROM customer_lifetime_value 
),
customer_revenue_analysis AS(
    SELECT customer_rank,customer_name,
        total_spent,
        ROUND(
            (total_spent/(SELECT total_revenue FROM customers_total_revenue))*100,2
        ) AS revenue_percentage
    FROM customer_lifetime_value
)
SELECT customer_rank,customer_name,total_spent,
    revenue_percentage,
    SUM(revenue_percentage) OVER(ORDER BY customer_rank) AS cummulative_revenue_percentage
FROM customer_revenue_analysis;