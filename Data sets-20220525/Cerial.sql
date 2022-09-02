select * from cereal
---1.Write A Query display count of cereals mfr wise
select mfr,count(name)
from cereal
group by mfr
--2.Write A Query to display count of cereals type wise
select type,count(name)
from cereal
group by type
--3.Write A Query to display average  of carbo cereals mfr wise
select mfr,avg(carbo) 
from cereal
group by mfr
--4.Write A Query to display sum of rating  of  cereals mfr wise
select mfr,sum(rating) 
from cereal
group by mfr
----5.Write A Query to display average of protein  of  cereals mfr wise
select mfr,avg(protein) 
from cereal
group by mfr
----6. Write A Query to display sum of weight  of  cereals type wise
select type,sum(weight)
from cereal
group by type

select * from cereal
select name,max(rating) as high from cereal

select name,mfr,calories,
case when calories > 100 then 'High'
when calories between 80 and 100 then 'Medium'
else 'Healthy'
end as level from cereal;

