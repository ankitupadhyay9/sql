-- Initial set of data is last position character and length of string
-- then recursively append characters going backwards by decreasing the value of pos

WITH reverse_str(str,pos)
AS
  (SELECT substr('abcd',4,1) as str, 4 as pos from dual
   UNION ALL
   SELECT str || substr('abcd',pos -1 ,1), pos -1 from  reverse_str
   WHERE pos > 1 -- base condition
   )
select * from reverse_str;
