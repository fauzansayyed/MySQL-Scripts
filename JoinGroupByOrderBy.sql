Use employees;
select distinct title from titles;
#if employee is staff or engineer 'Assitant Eengineer' mmarked it as entry level
#if employee is senior engineer , senior staff mmarked it as mid level
## else marked as managemeennt level

select *, 
case
	when title in  ('Staff','Engineer','Assistant Engineer') then 'enty level'
    	when title in  ('Senior Staff','Seniior Engineer') then 'Mid leevel'
	else "Mgmt_lvl" end 
    as position_level  #new column aadded
    from titles;



select distinct first_name from  employees;
#how many   times   each   name  is   appearing
select count(distinct first_name) as count from  employees;

#Groupby
select first_name , count( first_name) 
from employees group by first_name;# group by
 
 select first_name , count( first_name) from
 employees group by first_name # group by
 order by count(first_name);  #order by default is ascending

 
 select first_name , count( first_name) from
 employees group by first_name # group by
 order by count(first_name) desc;  #order by desc is dsecending
 
  
 select first_name , count( first_name) from
 employees group by first_name # group by
 order by 2 desc;   #2 is column position, ordering by 2nd column
 #-----------------------------------------------
 
  select * from dept_emp;

 select distinct dept_no from dept_emp;
 # give me the count of employees working in ech dept
select dept_no, count(dept_no ) from dept_emp
group by dept_no 
order by 2 desc;  #2 is column position of ' count(dept_no ) ' , ordering by 2nd column

 
#average 
select * from salaries limit 140;
#i want emp_no and his avg_salary

select emp_no, avg(salary) from salaries group by emp_no
order by 2 desc;


# i want to select all people who earn above 100000
#''having'' and ''where'' are giving same output because here we are not using aggregate function
select * from salaries where salary > 100000;
select * from salaries having salary > 100000;

# i want all(but only)  those names which are appearing more than 200 tiimes
# and there count also, if name is more than 200 times

 #count , max ,min are aggregate function --> whenever using these you should use  ''having' , dont use 'where' as it will not work
select first_name, count(first_name) from employees
group by first_name			# groupby then having then order by , 
having count(first_name) >200		    
order by count(first_name) desc;

select * from salaries limit 50;
# i want to know how many employees have joined after 1990
# and there average salary is more than 100000
# get there details

select emp_no,avg(salary), from_date from salaries
group by emp_no
having from_date > "1989-12-31" and avg(salary)>100000
order by 3 asc;


#Joins is used to get the data from more than one table.
#inner join
select * from dept_manager;
# i want to know how many female manager are there.(get there names always)
select employees.emp_no, employees.first_name, employees.last_name,
		employees.gender, dept_manager.dept_no
        from employees
        inner join   #instead of 'inner join' if we write' join' it will work same.
        dept_manager on dept_manager.emp_no = employees.emp_no     # for joining u can see column from two table is same that is (emp_no).
        where gender='F';
        
#same above can be written as below
select employees.emp_no, employees.first_name, employees.last_name,
		employees.gender, dept_manager.dept_no
        from dept_manager
        join   
         employees on employees.emp_no = dept_manager.emp_no
        where gender='F';
        
#same above can be written as below.   sir Sugested this below code so it will be easy to write.
select e.emp_no, e.first_name, e.last_name,
		e.gender, dm.dept_no
        from employees e   # table 'employees' id defined as 'e' here
        inner join  
        dept_manager dm on dm.emp_no = e.emp_no  # table 'dept_manager' id defined as 'dm' here
        where gender='F';
	
select distinct title from titles;
#get the emp_no, first_name, last_name of all the 'Senior Engineer'
#who are working in the production department 
select * from departments;
select e.emp_no, e.first_name, e.last_name, t.title,  de.dept_no
from employees e
inner join
titles t on e.emp_no=t.emp_no 
inner join dept_emp de on t.emp_no=  de.emp_no
where t.title = 'Senior Engineer' and de.dept_no ='d004'
group by e.emp_no;

#---------------------
#lets say i do not know the  department num for production 'd004'
#then write the query
select e.emp_no, e.first_name, e.last_name, t.title,  dm.dept_name  # this is acting for output .
from employees e
inner join titles t on e.emp_no=t.emp_no 
inner join dept_emp de on t.emp_no=  de.emp_no
inner join departments dm on de.dept_no= dm.dept_no
where t.title = 'Senior Engineer' and dm.dept_name ='production'
group by e.emp_no;

#------------------------------
# i  want emp_no, first_name , last, name , avg(salary) 

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    ROUND(AVG(s.salary), 2) AS avg_sal
FROM
    employees e
        INNER JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.emp_no
ORDER BY avg_sal DESC;

#beatify the code by selecting and then click on brush icon.
#___________________________

# emp no , first name, last name avg salary for all the managers
SELECT e.emp_no,e.first_name,e.last_name, t.title, ROUND(AVG(s.salary), 2) AS avg_sal
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
INNER JOIN titles t ON e.emp_no = t.emp_no
where t.title = 'Manager'
GROUP BY e.emp_no
ORDER BY avg_sal DESC;

# file is complete.
