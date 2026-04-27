SELECT
    f.title,
    cat.name AS category_name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat     ON fc.category_id = cat.category_id
ORDER BY f.title
LIMIT 20;