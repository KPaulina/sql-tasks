--exercises from SQL ZOO

--1. Show the total population of the world.
SELECT SUM(population)
FROM world

--2.List all the continents - just once each.
select distinct	continent from world

--3 Give the total GDP of Africa
select SUM(gdp) FROM world
where continent = 'Africa'

--4 How many countries have an area of at least 1000000
select count(name) from world where area >= 1000000

--5 What is the total population of ('Estonia', 'Latvia', 'Lithuania')
select sum(population) 
from world
where name IN ('Estonia', 'Latvia', 'Lithuania')

--6 For each continent show the continent and number of countries.
select continent, count(name) from world
group by continent

--///////////////////////////////////

--INNER JOIN 

--6. Obtain the cast list for 'Casablanca'.
select name from actor a
inner join casting b
ON a.id = b.actorid
where b.movieid=11768

--7. Obtain the cast list for the film 'Alien'
select name from actor a
inner join casting b
ON a.id = b.actorid
where b.movieid=10522

--8. List the films in which 'Harrison Ford' has appeared
select title from movie a
inner join casting b
ON a.id = b.movieid
where b.actorid = 2216

--9. List the films where 'Harrison Ford' has appeared - but not in the starring role.
select title from movie a
inner join casting b
ON a.id = b.movieid
where b.actorid = 2216 and b.ord != 1

--More JOIN operations

--3 List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

--10 List the films together with the leading star for all 1962 films.
SELECT a.title, c.name from movie a
JOIN casting b ON a.id=b.movieid
JOIN actor c ON b.actorid=c.id
where a.yr = 1962 and b.ord = 1


--OTHER 

--Give the id and the name for the stops on the '4' 'LRT' service.
SELECT a.id, a.name FROM stops a
INNER JOIN route b
ON a.id = b.stop
WHERE company = 'LRT' and num  = 4

--NULL

--1. List the teachers who have NULL for their department. 
Select name from teacher
Where dept IS NULL