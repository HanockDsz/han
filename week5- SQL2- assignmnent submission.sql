#1. Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.

select mov_title, act_fname, act_lname, role from movie
inner join movie_cast
on movie.mov_id=movie_cast.mov_id
inner join actors
on movie_cast.act_id=actors.act_id
GROUP BY mov_title
having mov_title='Annie Hall';

/* 2.From the following tables, write a SQL query to find the director who directed a movie that casted a 
role for 'Eyes Wide Shut'. Return director first name, last name and movie title*/

select movie_cast.role, dir_fname, dir_lname, mov_title from movie_cast
inner join movie_direction
on movie_cast.mov_id=movie_direction.mov_id
inner join director
on movie_direction.dir_id=director.dir_id
inner join movie
on movie_direction.mov_id=movie.mov_id
where mov_title= 'Eyes Wide Shut';

/* 3. Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’.
Return director first name, last name and movie title */

select movie_cast.role, dir_fname, dir_lname, mov_title from movie_cast
inner join movie_direction
on movie_cast.mov_id=movie_direction.mov_id
inner join director
on movie_direction.dir_id=director.dir_id
inner join movie
on movie_direction.mov_id=movie.mov_id
where movie_cast.role= 'Sean Maguire';

/* 4. Write a SQL query to find the actors who have not acted in any movie between1990 and 2000 (Begin and end values are included.). 
Return actor first name, last name, movie title and release year.*/

select act_fname, act_lname, mov_title, movie.mov_year from movie
inner join movie_cast
on movie.mov_id=movie_cast.mov_id
inner join actors
on movie_cast.act_id=actors.act_id
where mov_year>=1990 and mov_year<=2000;

# using common table expression
with movtab as (select * from movie
where mov_year>=1990 and mov_year<=2000)
select act_fname, act_lname, mov_title, movtab.mov_year from movtab
inner join movie_cast
on movtab.mov_id=movie_cast.mov_id
inner join actors
on movie_cast.act_id=actors.act_id;

/* 5. Write a SQL query to find the directors with number of genres movies. Group the result set on director first name, 
last name and generic title. Sort the result-set in ascending order by director first name and last name. 
Return director first name, last name and number of genres movies.*/

select dir_fname, dir_lname, count(gen_title) from director
inner join movie_direction
on director.dir_id=movie_direction.dir_id
inner join movie_genres
on movie_direction.mov_id=movie_genres.mov_id
inner join genres
on movie_genres.gen_id=genres.gen_id
group by dir_fname
order by dir_fname asc;

# 6. Write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.

select mov_title, mov_year, gen_title from movie
inner join movie_genres
on movie.mov_id=movie_genres.mov_id
inner join genres
on movie_genres.gen_id=genres.gen_id;

#7.Write a SQL query to find all the movies with year, genres, and name of the director. 

select mov_title, mov_year as movie_name, gen_title as genres,concat(dir_fname,' ',dir_lname) as dir_name from movie
inner join movie_genres
on movie.mov_id=movie_genres.mov_id
inner join movie_direction
on movie.mov_id=movie.mov_id
inner join director
on movie_direction.dir_id=director.dir_id
inner join genres
on movie_genres.gen_id=genres.gen_id;

/* 8. Write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. 
Return movie title, release year, date of release, duration, and first and last name of the director. */

select mov_title, mov_year, mov_dt_rel, mov_time "duration", dir_fname, dir_lname from movie
inner join movie_direction
on movie.mov_id=movie_direction.mov_id
inner join director
on movie_direction.dir_id=director.dir_id
order by mov_dt_rel desc;