/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor
JOIN film_actor USING (actor_id)
RIGHT JOIN (SELECT film_id  FROM film_actor
JOIN actor USING (actor_id)
WHERE actor.first_name = 'RUSSELL' AND actor.last_name = 'BACALL') AS target_film USING (film_id)
WHERE (actor.first_name != 'RUSSELL' OR actor.last_name != 'BACALL')
ORDER BY first_name || ' ' || last_name;
