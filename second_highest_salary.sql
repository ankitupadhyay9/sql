select max(salary) as SecondHighestSalary 
from employee e1
where salary not in (select max(salary)
              from employee e2               
              )