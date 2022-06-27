/* we have a Olymipic dataset where we have records pertaining to different athletes, their country 
which they are representing, year of participation, their age during the participation year, sports in which 
they are participation and the number of medals won in that year.

first let us check the table satisfies the normal forms:

1ST Normal Form: there should not be any multi-valued attributes in the columns.

after observing the table, we can see that, there are no multivalued data in any of the records. so the table 
has already satisfied 1NF.

2ND Normal Form: As per this rule, there shouldn't be partial dependency in a table.
in the table, date_given is dependent on year and year is dependent on age and name. since date_given is of
no use for our analysis, we can drop it. 

3rd normal form: there should not be any transitive columns in the table.
In the table we can consider name and age as super keys. so all the remaining columns are directly dependent on 
name and age column. Only date_given column is depended on year column. that is date_given
column is transitively dependent on super key. since we dont need date_given column for our
analysis we can just keep as it is and ignore. Hence we can say that the table satisfies 3rd NF.

we need to get the below query results and analyse the same.
1. Find the average number of medals won by each country
2. Display the countries and the number of gold medals they have won in decreasing order
3. Display the list of people and the medals they have won in descending order, grouped by their country
4. Display the list of people with the medals they have won according to their age
5. Which country has won the most number of medals (cumulative)

*/

# 1. Find the average number of medals won by each country

select country, avg(total_medal) as avg_medal from olym_table
group by country
order by avg_medal desc

#2. Display the countries and the number of gold medals they have won in decreasing order

select country, gold_medal from olym_table
order by gold_medal desc;

#3. Display the list of people and the medals they have won in descending order, grouped by their country

select country, name, total_medal from olym_table
group by country, name order by total_medal desc;


#4. Display the list of people with the medals they have won according to their age
select name, age, gold_medal, silver_medal, brone_medal from olym_table;

#5. Which country has won the most number of medals (cumulative)
select country, sum(total_medal) as no_of_medals from olym_table
group by country order by no_of_medals desc

# United states has won the most number of medals followed by Russia and Germany

