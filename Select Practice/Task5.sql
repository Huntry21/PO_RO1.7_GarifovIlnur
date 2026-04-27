SELECT 
    c.first_name, 
    c.last_name, 
    ROUND(SUM(p.amount), 2) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r  ON p.rental_id = r.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(p.amount) > 150
ORDER BY total_paid DESC;