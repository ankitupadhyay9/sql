WITH factorial_table(operand,total_so_far)
AS
  (SELECT 6 as operand, 6 as total_so_far -- replace 6 with the number that you want to calculate Factorial 
   UNION ALL
   SELECT operand-1, (operand-1)*total_so_far from factorial_table -- recursion happens here
   WHERE operand > 1 -- base condition
   )
select max(total_so_far) from factorial_table
