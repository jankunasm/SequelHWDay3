-- 1. List all customers who live in Texas (use JOINS)

-- Answer: 5 customers

SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district LIKE 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name

-- Answer: 1406 customers

SELECT customer.first_name, customer.last_name
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175
-- (use subqueries)

-- Answer: 6 customers

SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);


-- 4. List all customers that live in Nepal (use the city table)

-- Answer: 1 customer

SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


-- 5. Which staff member had the most transactions?

-- Answer: Jon Stephens with 7304

SELECT first_name, last_name, COUNT(payment.payment_id)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY(first_name, last_name);


-- 6. How many movies of each rating are there?

-- Answer: PG-13 223, PG 194, G 178, NC-17 210, R 195

SELECT COUNT(rating), rating
FROM film
GROUP BY rating;


-- 7. Show all customers who have made a single payment above 
-- $6.99 (Use Subqueries)

-- Answer:

SELECT first_name, last_name
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount IN(
	SELECT payment.amount
	FROM payment
	WHERE amount > 6.99
	GROUP BY amount
)
GROUP BY first_name, last_name
Having COUNT(amount) = 1;


-- 8. How many free rentals did our stores give away?

-- Answer: 24 free rentals

SELECT amount
FROM payment
WHERE amount < 0.99;


















