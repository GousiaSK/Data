--Display the count of employees working in London
--Write a query in SQL to display those employees who contain a letter z 
--to their first name and also display their last name, department, city, and state province.
select * from locations;
select * from employees;
select * from departments;
---1-----
select first_name,count(first_name) as Count
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.city= 'London'
----2-----
select first_name,last_name,city,state_province
from employees e
inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id
where first_name like '%z%';

/*Write a create table statement with following attributes  [Descriptive Question](2marks)
# Table name :Persons
# Id int with not null,
# Lastname varchar(255) not null,
# Firstname varchar(255) not null,
# Age int-  (create a check constraint of age should be greater than or equal to 18)
*/

create table Persons
(
Id int not null,
Lastname varchar(255) not null,
Firstname varchar(255) not null,
Age int check (Age >=18)
);

drop table Persons;

