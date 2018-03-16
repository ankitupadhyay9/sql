/*
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.
+------+----------+-----------+----------+
|Id    |Name 	  |Department |ManagerId |
+------+----------+-----------+----------+
|101   |John 	  |A 	      |null      |
|102   |Dan 	  |A 	      |101       |
|103   |James 	  |A 	      |101       |
|104   |Amy 	  |A 	      |101       |
|105   |Anne 	  |A 	      |101       |
|106   |Ron 	  |B 	      |101       |
+------+----------+-----------+----------+


Given the Employee table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return: 
+-------+
| Name  |
+-------+
| John  |
+-------+


*/

select name from employee 
where id in (
select managerid
from employee e
group by managerid
having count(1) >= 5
    )

-- another approach
select e2.name
from employee e1
    ,employee e2
where e1.managerid = e2.id
group by e2.id
having count(1) >=5

	