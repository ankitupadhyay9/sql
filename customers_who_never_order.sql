/*
Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

Table: Customers.
+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+


Table: Orders.
+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+


*/
select name Customers
from customers c
where c.id not in (select distinct customerid from orders);

-- another approach
select distinct name Customers
from (
select name , o.customerid
from customers c left join orders o
on c.id = o.customerid
) t
where customerid is null