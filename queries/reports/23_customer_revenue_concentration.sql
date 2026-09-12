--What percentage of the total revenue is genrated by the top 20% of customers
WITH twenty_percent_of_customers AS(
    SELECT CEIL(COUNT(customer_id) * 0.2) AS number_of_customers
    FROM customer_lifetime_value
),
customers_total_spent AS(
        SELECT sum(total_spent) AS total_spent
        FROM customer_lifetime_value
),
twenty_percent_total_spent AS(
        SELECT SUM(total_spent) AS twenty_percent_total
        FROM customer_lifetime_value
        WHERE customer_rank <= (SELECT number_of_customers FROM twenty_percent_of_customers)
            
)
SELECT
    (SELECT COUNT(customer_id) FROM customer_lifetime_value) AS total_customers,
    (SELECT number_of_customers FROM twenty_percent_of_customers) AS top_20_percent_customers,
    (SELECT twenty_percent_total FROM twenty_percent_total_spent) AS top_20_percent_customers_revenue,
    (SELECT total_spent FROM customers_total_spent),
    (ROUND(
     ((SELECT twenty_percent_total FROM twenty_percent_total_spent
        ) / 
            (SELECT total_spent FROM customers_total_spent)) * 100,2
    )
    ) AS top_20_percent_revenue_share
;
 