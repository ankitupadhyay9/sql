/*
Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.


For example, after running your query, the above Person table should have the following rows:
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
*/
delete from person where id not in (select min(id) from (select * from person) as p group by email);



-- check this approach
DELETE FROM person p 
WHERE  p.id IN (SELECT p2.id 
                FROM   person p2 
                WHERE  p2.email = p.email 
                       AND p2.id > p.id)  