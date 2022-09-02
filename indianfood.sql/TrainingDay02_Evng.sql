select * from indian_food
--------------------------------
select name,ingredients,max(cook_time)
from indian_food
group by course;
--------------------------------
select name,ingredients,course,max(cook_time)
from indian_food
where course = 'dessert';
---------------------------------
select name,ingredients,course,diet,max(prep_time)
from indian_food
group by course;
----------------------------------
select name,ingredients,course,diet
from indian_food
where ingredients like '%Paneer%'
-------------------------------
select name,ingredients,course,diet,state,max(cook_time)
from indian_food
group by state;
---------------------------------
select name,ingredients,diet,prep_time,cook_time,flavor_profile,course,state
from indian_food
where name like '%Halwa%';
-----------------------------
select * from indian_food
-------------
select count(diet) 
from indian_food
where diet='vegetarian';

select count(diet) 
from indian_food
where diet='non vegetarian';
--------------
select region,count(name)
from indian_food
group by region;
--------------
select state,count(name)
from indian_food
where flavor_profile='sweet'
group by state;
--------------
select course,count(name)
from indian_food
group by course;
--------------
select flavor_profile,count(name)
from indian_food
group by flavor_profile;
--------------
select name,max(cook_time)
from indian_food
where state = 'Maharashtra' and flavor_profile ='sweet'
group by state;
--------------
select name, cook_time from indian_food order by cook_time limit 10;
------------
SELECT name
FROM indian_food
WHERE course='snack' ORDER BY cook_time
LIMIT 10;
------------



