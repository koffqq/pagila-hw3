/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

WITH b01id AS (
SELECT DISTINCT actor_id
FROM actor
JOIN film_actor USING (actor_id)
RIGHT JOIN (SELECT film_id  FROM film_actor
JOIN actor USING (actor_id)
WHERE actor.first_name = 'RUSSELL' AND actor.last_name = 'BACALL') AS target_film USING (film_id))

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor a0
LEFT JOIN 
(SELECT DISTINCT  a1.actor_id 
FROM actor a1 JOIN film_actor f1 ON (a1.actor_id=f1.actor_id) JOIN film_actor f2 ON (f1.film_id=f2.film_id) JOIN actor a2 ON (f2.actor_id=a2.actor_id)
EXCEPT
SELECT * FROM b01id) as idtable ON (a0.actor_id=idtable.actor_id)
WHERE idtable.actor_id IS NOT NULL
ORDER BY "Actor Name";
