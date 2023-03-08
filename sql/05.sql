/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT DISTINCT title FROM film
JOIN film_actor USING (film_id)
RIGHT JOIN 
(SELECT actor_id FROM film_actor
JOIN film USING (film_id)
WHERE film.title = 'AMERICAN CIRCUS')
AS actor_table 
USING (actor_id)
GROUP BY title
HAVING count(*) > 1
ORDER BY title ASC;
