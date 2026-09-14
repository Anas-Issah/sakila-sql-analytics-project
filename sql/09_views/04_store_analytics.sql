--STORE PEFORMANCE
CREATE OR REPLACE VIEW store_performance_summary AS
    WITH store_totals AS(
            SELECT st.store_id,COUNT(DISTINCT r.customer_id) AS customer_count,
            COUNT(r.rental_id) AS rental_count,SUM(p.amount) AS total_revenue,
                AVG(p.amount) AS average_revenue_per_rental
            FROM store st
            INNER JOIN staff s
            ON st.store_id = s.store_id 
            INNER JOIN rental r 
            ON s.staff_id = r.staff_id
            LEFT JOIN payment p 
            ON r.rental_id = p.rental_id
            GROUP BY st.store_id
    )
    SELECT st.store_id,CONCAT(manager.first_name,' ',manager.last_name) AS store_manager,
        st.customer_count,st.rental_count,st.total_revenue,st.average_revenue_per_rental
    FROM store_totals st
    INNER JOIN store sr 
    ON st.store_id = sr.store_id 
    INNER JOIN staff manager
    ON sr.manager_staff_id = manager.staff_id;


