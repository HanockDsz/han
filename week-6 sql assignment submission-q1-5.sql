
#1Write a SQL query to find those reviewers who have rated nothing for some movies. Return reviewer name.

select rev_name from reviewer 
where rev_id not in (select rev_id from rating);
/*Here we are using sub-query
we are pulling out reviewers names by selecting rev_id which are not present in rating table.
*/
 
 #2Write a SQL query to find the movies, which have been reviewed by any reviewer body except by 'Paul Monks'. Return movie title.
 
 select mov_title from movie
 where mov_id in ( select mov_id from rating
 where rev_id in (select rev_id from reviewer
 where rev_name!='paul monks'));

/* here we are using sub queries to take data from 3 tables- movie, rating and reviewer.
first we are selecting rev_id from reviewer table who's name is not paul monks.
The rev_ids whose name is not paul monks is taken in rating table. and from movie table, movie names are pulled with mov_id as common key
*/ 
 select mov_title from movie
 inner join rating on movie.mov_id=rating.mov_id
 inner join reviewer
 on rating.rev_id=reviewer.rev_id
 where rev_name!='Paul monks'

/* same can be done using inner join function also*/


#3 Write a SQL query to find the lowest rated movies. Return reviewer name, movie title, and number of stars for those movies. 

select rev_name, mov_title, rev_stars from movie
inner join rating
on movie.mov_id=rating.mov_id
inner join reviewer
on rating.rev_id=reviewer.rev_id
where rev_stars=0

/* in the rating table, lowest rev_stars is '0'. hence we are joining 3 tables- movie, rating, reviewer to pullout
required output and giving condition at the end that is rev_stars=0
select * from movie
*/

# 4 Write a SQL query to find the movies directed by 'James Cameron'. Return movie title.

select mov_title from movie
where mov_id in(select mov_id from movie_direction
where dir_id in(select dir_id from director where dir_id in(select dir_id  from director where
concat(dir_fname,' ',dir_lname)='James cameron')));

/* we are giving sub query to pick mov_id, dir_id from the tables director and movie_direction where director name is james cameron.
using this dir_id, we will pick the movie, mov_id which are pertaining to picked dir_id to get the desired output*/

# 5.Write a query in SQL to find the name of those movies where one or more actors acted in two or more movies. 

select mov_title from movie
where mov_id in ( select mov_id from movie_cast 
where act_id  in(select act_id 
from movie_cast 
group by act_id
having count(act_id)>1))


/* we are selecting act_id from movie_cast who appear more than once. 
these act_ids are taken further to movie_cast and movie table to get movie names.*/ 
