drop table classes;

create table classes(
    class varchar(20),
    type varchar(5),
    country varchar(15),
    numGuns number,
    bore number,
    displacement number);

REM: 1)Add first two tuples from the above sample data. List the columns explicitly in the INSERT clause. (No ordering of columns)

insert into classes(country,type,bore,numGuns,class,displacement) values('Germany','bb','14','8','Bismark','32000');
insert into classes(type,country,bore,displacement,class,numGuns) values('bb','USA','16','46000','Iowa','9');
select* from classes;

REM: 2)Populate the relation with the remaining set of tuples. This time, do not list the columns in the INSERT clause.

insert into classes values('Kongo','bc','Japan','8','15','42000');
insert into classes values('North Carolina','bb','USA','9','16','37000');
insert into classes values('Revenge','bb','Gt.Britain','8','15','29000');
insert into classes values('Renown','bc','Gt.Britain','6','15','32000');

REM: 3)Display the populated relation

select * from classes;


REM: 4)Mark an intermediate point here in this transaction

SAVEPOINT A;

REM: 5)Change the displacement of Bismark to 34000

update classes set displacement ='34000' where class='Bismark';

REM: 6)For the battleships having at least 9 number of guns or the ships with at least 15 inch bore, increase the displacement by 10%. Verify your changes to the table.

update classes set displacement = 1.1*displacement where (numGuns >=9 OR bore>=15);
select* from classes;

REM: 7)Delete Kongo class of ship from Classes table.

delete from classes where class='Kongo';

REM: 8)Display your changes to the table.

select* from classes;

REM: 9) Discard the recent updates to the relation without discarding the earlier INSERT operation(s).

ROLLBACK TO A;

REM: 10) Commit the changes

COMMIT;

REM: ******************************************* DML RETREIVAL OPERATIONS **************************************************

REM: Executing employees.sql

drop table employees;

@D:/employees.sql


REM: 11)  Display firsy name, job id and salary of all the employees.

select first_name,job_id,salary from employees;


REM: 12)  Display the id, name(first & last), salary and annual salary of all the employees. Sort the employees by first name. Label the columns as shown below:(EMPLOYEE_ID, FULL NAME, MONTHLY SAL, ANNUAL SALARY)

select employee_id,(first_name||' '||last_name)"FullName",salary AS Monthly_salary,salary*12 AS Annual_salary from employees ORDER BY first_name;

REM: 13)  List the different jobs in which the employees are working for

select distinct job_id from employees;

REM: 14)  Display the id, first name, job id, salary and commission of employees who are earning commissions.

select employee_id,first_name,job_id,salary,commission_pct from employees where commission_pct is not NULL;

REM: 15). Display the details (id, first name, job id, salary and dept id) of employees who are MANAGERS.

select employee_id,first_name,job_id,salary,department_id,manager_id from employees
   where employee_id IN (select manager_id from employees);

REM: 16) Display the details of employees other than sales representatives (id, first name, hire date, job id, salary and dept id) who are hired after ‘01­May­1999’ or whose salary is at least 10000.

select employee_id,first_name,hire_date,job_id,salary,department_id from employees
    where ( hire_date >'01-May-1999' OR salary >=10000) AND job_id <> 'SA_REP';

REM: 17) Display the employee details (first name, salary, hire date and dept id) whose salary falls in the range of 5000 to 15000 and his/her name begins with any of characters (A,J,K,S). Sort the output by first name.

select first_name,salary,hire_date,department_id from employees
   where  (salary BETWEEN 5000 AND 15000) AND (first_name LIKE 'A%' OR first_name LIKE 'J%' OR first_name LIKE 'K%' OR first_name LIKE 'S%') ORDER BY first_name;

REM: 18)Display the experience of employees in no. of years and months who were hired after 1998. Label the columns as: (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, EXP­YRS, EXP­MONTHS)

select employee_id,first_name,hire_date,floor(months_between(hire_date,to_date(CURRENT_DATE,'dd-MON-yyyy'))/12)AS "EXP_YRS",months_between(hire_date,to_date(CURRENT_DATE,'dd-MON-yyyy')) AS "EXP_MONTHS" from employees WHERE  extract(year from hire_date)> '1998';

REM: 19) Display the total number of departments.

select count(distinct department_id) from employees;

REM: 20) Show the number of employees hired by year­wise. Sort the result by year­wise.

select count(*),extract(year  from hire_date) from employees group by extract(year from hire_date) ORDER BY extract(year from hire_date);


REM: 21)Display the minimum, maximum and average salary, number of employees for each department. Exclude the employee(s) who are not in any department. Include the department(s) with at least 2 employees and the average salary is more than 10000. Sort the result by minimum salary in descending order.

 select MIN(salary),MAX(salary),AVG(salary),count(*) from employees where department_id!=0 GROUP BY department_id having (count(*) >=2 AND AVG(salary) >10000) ORDER BY MIN(salary) desc;


