-- Ex1.1 With explaining how to optimize the query (with Ex2)

EXPLAIN ANALYZE SELECT film.film_id as film_id, film.title AS title, category.name AS category, film.rating AS rating
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
RIGHT JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.name = 'Horror' OR category.name = 'Sci-Fi'
WHERE inventory.film_id is null AND (film.rating = 'PG-13' OR film.rating = 'R');
-- The most expensive step is matching the film.rating from the film table
-- To optimize it, we can use a hash index on the rating attribute to make the query faster
-- since we're only using equal condition

-- Ex1.1 With explaining how to optimize the query (with Ex2)
EXPLAIN ANALYZE SELECT staff.store_id, city.city AS city, SUM(amount) AS Sum
FROM payment 
JOIN staff ON payment.staff_id = staff.staff_id
JOIN address ON staff.address_id = address.address_id
JOIN city ON city.city_id = address.city_id
WHERE date_trunc('month',payment_date) = (SELECT date_trunc('month',max(payment_date)) FROM payment)
GROUP BY staff.store_id, city.city
ORDER BY Sum DESC;
-- The most expensive step is finding the last month of the payments. To optimize it, we can 
-- use a Hash index to reduce the cost (since it's an equal condition).
