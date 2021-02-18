-- selecting the countries from 12th to 17th after sorting them by country_id
SELECT * FROM country ORDER BY country_id limit 6 offset 11;

-- join the city and address tables where they match the city_id and the name of the city starts with 'A'
SELECT city.city AS city_name, address.address As city_address
FROM city
JOIN address ON (city.city_id = address.city_id AND SUBSTR(city.city, 1, 1) = 'A');

-- We join the customer table with the result of the previous query to access the city name while having only the address_id
-- of the customer. We match the address_id of the customer with the address_id that we have in the previous query and we
-- project the name of the city along with the first and last name of the customer
SELECT customer.first_name, customer.last_name, T.city_name AS city
FROM customer
JOIN (SELECT city.city AS city_name, address.address As city_address, address.address_id as address_id
FROM city
JOIN address ON (city.city_id = address.city_id AND SUBSTR(city.city, 1, 1) = 'A')) AS T ON T.address_id = customer.address_id;

-- We simply match the records that have the same customer_id and we check that the amount of that payment is greater than 11
SELECT customer.*
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id AND payment.amount > 11.0;

-- WE group the customers by their first_name and choose the ones that apppear more than once in the table
SELECT first_name FROM customer GROUP BY first_name HAVING COUNT(first_name) > 1;

