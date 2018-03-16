/*
The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
+----+-------+--------+--------------+


The Department table holds all departments of the company.
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+


Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows.
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+


*/

# Write your MySQL query statement below
set @row_number := 0;
set @dept_name := '';

select Department, Employee, Salary
from (
select Department, Employee, Salary, @row_number := case when @dept_name = Department then @row_number+1 else 1 end as row_number, @dept_name := Department
from (
select d.name Department, e.name Employee, e.salary Salary
from employee e, department d
where e.departmentid = d.id
order by e.departmentid, e.salary desc
) t
    ) t1
    where row_number <= 3 ;



-- Another approach
select d.name Department, e.name Employee, e.salary Salary
from employee e,department d
where e.departmentid = d.id
  and 3 > (select count(distinct e2.salary) 
           from employee e2
           where e2.departmentid = e.departmentid
             and e2.salary > e.salary
          )