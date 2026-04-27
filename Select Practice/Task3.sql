SELECT
    f.rating,
    count (*) as film_count
FROM film f 
group by f.rating 
ORDER BY film_count desc;