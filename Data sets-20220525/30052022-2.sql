select * from starbucks;
--1.Display and compare and rank the data based on Protein 
-- --2.Display and compare and rank the data based on Protein and limit 5
-- --3.Display and compare and dense_rank the data based on Protein 
----4.Display and compare and 5th highest Fat  on starbucks 
--5.Display and compare based on healthiest calories  
--6.Steve like all roasted dishes .Help Steve find the same from starbucks.
-- 7.Shiva follows vegan routines.Help Shiva find 'Lentils' from starbucks menu.
----1----
select Name,rank()
over(order by Protein) as rank
from starbucks;
-----2------
select Name,rank()
over(order by Protein) as rank
from starbucks
limit 5;
----3------
select Name,dense_rank()
over(order by Protein) as rank
from starbucks;
----4----
select Name,nth_value(fat,5)
over(order by fat)
from starbucks;
---5---
select name,Calories,min(Calories)
over(order by Calories)
from starbucks;
---6---
select name
from starbucks
where name like '%Roasted%';
---7---
select name
from starbucks
where name like '%Lentils%'


