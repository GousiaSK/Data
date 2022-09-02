---lead()----
-- lead() -- next off set value

select first_name,hire_date,salary,lead(salary)
over(order by salary) as [Dream Salary]
from employees;

select first_name,hire_date,salary,lead(salary,2) -- 2nd offset value
over(order by salary) as [Dream Salary]
from employees;

select first_name,hire_date,salary,lead(salary,3,'Satisfied') -- 3rd offset value
over(order by salary) as [Dream Salary]
from employees;

select first_name,hire_date,salary,lag(salary,1,'Satisfied')
over(order by salary) as [Dream Salary]
from employees;

select first_name,sex,embark_town,survived,fare,lead(fare)
over(order by fare) as [Fare_New]
from titanic;

--percent_rank -- (rank-1)/(total_rows-1)

select first_name,last_name,salary,round(percent_rank()
over(order by salary),2) as [Percent_rank]
from employees;

select first_name,survived,alive,embark_town,round(percent_rank()
over(order by fare)) as [Percent_rank]
from titanic;

--cume_dist -- cumulative distribution of a value within a set of VALUES
-- N/total rows 
--0<cume_dist<=1

select first_name,salary,round(cume_dist()
over(order by salary),2) as [Cume_Dist_Val]
from employees; 

select first_name,embark_town,fare,round(cume_dist()
over(order by fare),2) as [Cume Dist Val]
from titanic;

select department_name,count(*),round(cume_dist()
over(order by department_name),2) as [Cum dist]
from employees
inner join departments
on employees.department_id = departments.department_id
group by department_name;


select department_name,count(*),row_number()
over(order by department_name) as [Cum dist]
from employees
inner join departments
on employees.department_id = departments.department_id
group by department_name;

select department_name,count(*) as count,row_number()
over(order by department_name) as [Row Num],
round(cume_dist() over(order by department_name),2) as [Cum dist]
from employees 
inner join departments 
on employees.department_id=departments.department_id
group by department_name
order by department_name;

select first_name,last_name,salary,hire_date,lead(Hire_date)
over(order by hire_date) as [Next Senior]
from employees;
--Distribute fare column into 4 buckets.order fare column in descending order.
--on Titanic table
select first_name,fare,ntile(4)
over(order by fare desc) 
from titanic;



