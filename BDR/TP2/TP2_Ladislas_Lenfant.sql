USE TP2;

-- 2
-- a
SELECT POPULARITY FROM FILMS WHERE TITLE = 'Batman';
-- b
SELECT LENGTH FROM FILMS WHERE TITLE LIKE ('%E. T.%');
-- c
SELECT DISTINCT DIRECTOR FROM FILMS;
-- d
SELECT * FROM FILMS WHERE DIRECTOR = 'Hitchcock, Alfred';
-- e
SELECT * FROM FILMS WHERE LENGTH IS NULL;
-- f
SELECT TITLE
FROM FILMS, AJOUE, ACTORS
WHERE AJOUE.IDFILM = FILMS.ID
AND AJOUE.IDACTOR = ACTORS.ID
AND ACTORS.NAME = 'Cruise, Tom';
-- g
SELECT TITLE, POPULARITY
FROM FILMS, AJOUE, ACTORS
WHERE AJOUE.IDFILM = FILMS.ID
AND AJOUE.IDACTOR = ACTORS.ID
AND ACTORS.NAME = 'Roberts, Julia'
ORDER BY POPULARITY DESC;
-- h
SELECT NAME
FROM ACTORS
WHERE ID NOT IN (SELECT IDACTOR FROM ACTORS);
-- i
SELECT TITLE, DIRECTOR
FROM FILMS, AJOUE, ACTORS
WHERE AJOUE.IDFILM = FILMS.ID
AND AJOUE.IDACTOR = ACTORS.ID
AND ACTORS.NAME = FILMS.DIRECTOR;
-- j
SELECT COUNT(*) FROM FILMS;
-- k
SELECT YEAR FROM FILMS WHERE YEAR = (SELECT MIN(YEAR) FROM FILMS);
-- l
SELECT * FROM FILMS WHERE YEAR = (SELECT MIN(YEAR) FROM FILMS);
-- m
SELECT COUNT(*) FROM FILMS WHERE SUBJECT = 'Action';
-- n
SELECT AVG(POPULARITY)
FROM FILMS, AJOUE, ACTORS
WHERE AJOUE.IDFILM = FILMS.ID
AND AJOUE.IDACTOR = ACTORS.ID
AND ACTORS.NAME = 'Willis, Bruce';
-- o
SELECT TITLE, LENGTH
FROM FILMS, AJOUE, ACTORS
WHERE AJOUE.IDFILM = FILMS.ID
AND AJOUE.IDACTOR = ACTORS.ID
AND ACTORS.NAME = 'Streep, Meryl'
AND LENGTH = 
(SELECT MAX(LENGTH)
FROM FILMS, AJOUE, ACTORS
WHERE AJOUE.IDFILM = FILMS.ID
AND AJOUE.IDACTOR = ACTORS.ID
AND ACTORS.NAME = 'Streep, Meryl');
-- p
SELECT AVG(POPULARITY) FROM FILMS WHERE SUBJECT = 'Comedy';
-- q
SELECT SUBJECT, AVG(POPULARITY) FROM FILMS GROUP BY SUBJECT;
-- r
SELECT NAME
FROM ACTORS, FILMS, AJOUE
WHERE AJOUE.IDACTOR = ACTORS.ID
AND AJOUE.IDFILM = FILMS.ID 
GROUP BY NAME
HAVING COUNT(NAME) > 15;
-- s
SELECT *
FROM FILMS
WHERE POPULARITY > (SELECT AVG(POPULARITY) FROM FILM);
-- t
SELECT *
FROM FILMS
ORDER BY LENGTH DESC
LIMIT 3;
-- u
SELECT DIRECTOR, COUNT(DIRECTOR)
FROM FILMS
WHERE DIRECTOR LIKE('%,%')
GROUP BY DIRECTOR
ORDER BY COUNT(DIRECTOR) DESC
LIMIT 1;
-- v
SELECT COUNT(*) FROM FILMS, AJOUE;