----Constraints----
/* Set of rules to table 
1.NOT NULL
2.DEFAULT
-- 3.UNIQUE
-- 4.PRIMARY KEY
-- 5.FORIEGN KEY
*/
---1.NOT NULL : Ensure that a column cannot have a NULL VALUE (UNKNOWN)
drop table comapany
create table company (
id int NOT NULL,
NAME TEXT);

insert into company values(1,'Gousia');
select * from company;

--2.DEFAULT -- Provide a DEFAULT value to a column insert into does not specific VALUES

drop table company

create table company(
id int,
name text,
age int default 20 );

insert into company(id,name) values(1,'Gousia');

select * from company;

create table authors(
authorid int not null,
name text,
age int default 20);

insert into authors (authorid,name) values (1,'Afreen');


select * from authors;

---PRIMARY KEY : NOT NULL + UNIQUE 
---FORIEGN KEY : 
/*departments -- MASTER TABLE 
10 RESEARCH
employees
*/
SELECT * FROM departments; -- department_id is PRIMARY KEY
SELECT * FROM employees;

DROP TABLE company;

CREATE TABLE Company(
Id INT PRIMARY KEY,
Name TEXT);

INSERT INTO Company VALUES (1,'Gousia');

SELECT * FROM Company;

------------
DROP TABLE authors;
------------
CREATE TABLE authors(
Id INT PRIMARY KEY,
Name TEXT);
------------
INSERT INTO authors VALUES (1,'TEST1');
INSERT INTO authors VALUES (1,'TEST2');

------------------
DROP TABLE authors;
------------------
CREATE TABLE Author(
AuthorID INT PRIMARY KEY,
Name TEXT
);

CREATE TABLE Books(
BookID INT PRIMARY KEY,
Title TEXT,
AuthorID INT REFERENCES Author(AuthorID)
);
---------------
SELECT * from Books;

---CHECK : If Condition is not satisfied then it will raise the error while inserting the DATA
CREATE TABLE E
(
EmpId INT,
EName TEXT,
Age INT CHECK(Age>18)
);
INSERT INTO E VALUES(1,'Gousia',20);
INSERT INTO E VALUES(2,'Gouse',10);
SELECT * FROM E;

----------------
CREATE TABLE Orders(
Id INT PRIMARY KEY,
OrderPrice INT CHECK(OrderPrice > 0),
CName TEXT
);

INSERT INTO Orders VALUES (1,20,'Afru');
INSERT INTO Orders VALUES (1,0,'Gousia');

SELECT * FROM Orders;

------UNIQUE -- UNIQUE + NULL

CREATE TABLE HotelBooking(
HotelID INT PRIMARY KEY,
HotelName TEXT UNIQUE
);

INSERT INTO HotelBooking VALUES (1,'Taj');
INSERT INTO HotelBooking VALUES (2,'Taj');

--------JOINS---------
--Joins are used to combine rows from two or more tables based on related column.
--need to have one column which will be common to them.

select * from departments;
select * from employees;
--department_id is commmon--
/*
1.CROSS JOIN -- SQLITE
2.INNER JOIN -- SQLITE
3.LEFT OUTER JOIN -- SQLITE
4.RIGHT OUTER JOIN -- SQLITE NOT SUPPORT THIS
5.SELF JOIN --SQLITE
6.FULL OUTER JOIN -- SQLITE DOES NOT SUPPORT
*/
---CROSS JOIN : Cartesian Product of two tables
/*1. no meaningful interpretation
2.for testing purpose
3.testing database performance
*/

SELECT employee_id,department_name
FROM employees
CROSS JOIN departments;	--40*11 = 440 ROWS	- m*n rows

SELECT * FROM employees;	--40ROWS  - m

SELECT * FROM departments;	--11 ROWS	- n

--INNER JOIN

SELECT first_name,department_name
FROM employees
INNER JOIN departments
WHERE employees.department_id = departments.department_id;

select * from departments;
select * from employees;

SELECT first_name,departments.location_id
FROM employees
INNER JOIN departments
WHERE employees.department_id = departments.department_id;


SELECT first_name,location_id
FROM employees
INNER JOIN departments
WHERE employees.department_id = departments.department_id;


SELECT first_name,department_name,departments.department_id
FROM employees
INNER JOIN departments
WHERE employees.department_id = departments.department_id;



SELECT first_name,department_name,employees.department_id
FROM employees
INNER JOIN departments
WHERE employees.department_id = departments.department_id;


/*
SELECT first_name,department_name,department_id
FROM employees
INNER JOIN departments
WHERE employees.department_id = departments.department_id;
-------------ERROR------------------------Because Same column name prsent in both tables
*/

-----------Table Alias------


SELECT first_name,department_name,d.department_id
FROM employees e
INNER JOIN departments d
WHERE e.department_id = d.department_id;


--------------
SELECT * FROM employees;
SELECT * FROM departments;


SELECT first_name,last_name,email,e.department_id,department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE department_name='Marketing';

-----SELF JOIN -----
/* Can be joined with itself */

SELECT * FROM employees;
SELECT * FROM departments;

select e.employee_id,e.first_name,m.employee_id,m.first_name
from employees e
join employees m
on e.manager_id=m.employee_id;

-------LEFT OUTER JOIN --------

CREATE TABLE Dep
(
DepID INT PRIMARY KEY,
DName TEXT
);

INSERT INTO Dep VALUES(10,'Research');

CREATE TABLE Emp
(
EmpID INT PRIMARY KEY,
Name TEXT,
Dep INT
);

INSERT INTO Emp VALUES(1,'Allen',10);
INSERT INTO Emp VALUES(2,'Steven',NULL);

SELECT * FROM Dep;
SELECT * FROM Emp;

SELECT e.first_name,e.last_name,e.department_id,d.department_name
from employees e INNER JOIN departments d
on e.department_id=d.department_id
WHERE d.department_id in (4,8);

SELECT d.department_name,count(*)
from employees e INNER JOIN departments d
on e.department_id=d.department_id
GROUP by d.department_id;
--------------------------------
create table dept(deptid int ,dname text);
insert into dept values(10,'research');

create table emp (empid int,ename text,deptid int);
insert into emp values(1,'allen',10),(2,'steven',null);
--display all employees who have been dept and also not assigned dept 

select ename,dname,e.deptid 
from emp e left outer join dept d on e.deptid=d.deptid;

SELECT first_name,last_name,department_name,city,state_province
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

SELECT first_name,last_name,department_name,city,state_province
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where first_name like '%b%';

--1.Find the colleagues of Taylor along with department name

select * from employees;
select * from departments;

select e.first_name,d.department_name from employees e
join departments d
on e.department_id=d.department_id
where d.department_id=(select department_id from employees where last_name='Taylor');

select avg(e.salary),d.department_name,count(*)
from employees e join departments d
on e.department_id=d.department_id
group by d.department_id;

