/*
 * Compute the number of customers who live outside of the US.
 */

SELECT COUNT(distinct customer_id) FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
WHERE country.country != 'United States'
;

