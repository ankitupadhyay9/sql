/*
The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.
+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+


*/

select e1.name Employee
from employee e1
    ,employee e2
where e1.managerid = e2.id
  and e1.salary > e2.salary