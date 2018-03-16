/*Get the highest answer rate question from a table survey_log with these columns: uid, action, question_id, answer_id, q_num, timestamp. 

uid means user id; action has these kind of values: "show", "answer", "skip"; answer_id is not null when action column is "answer", while is null for "show" and "skip"; q_num is the numeral order of the question in current session. 

Write a sql query to identify the question which has the highest answer rate.

Example:

Input:
+------+-----------+--------------+------------+-----------+------------+
| uid  | action    | question_id  | answer_id  | q_num     | timestamp  |
+------+-----------+--------------+------------+-----------+------------+
| 5    | show      | 285          | null       | 1         | 123        |
| 5    | answer    | 285          | 124124     | 1         | 124        |
| 5    | show      | 369          | null       | 2         | 125        |
| 5    | skip      | 369          | null       | 2         | 126        |
+------+-----------+--------------+------------+-----------+------------+
Output:
+-------------+
| survey_log  |
+-------------+
|    285      |
+-------------+
Explanation:
question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.



Note: The highest answer rate meaning is: answer number's ratio in show number in the same question. 
*/

set @row_number := 0;

select question_id survey_log  
from (
select question_id,@row_number := @row_number+1 rn from
(
select question_id, count(1) total_asked, sum(ans) answered, sum(ans)/count(1) answer_rate
from (
select case when action = 'answer' then 1 else 0 end ans
      , question_id
from survey_log sl
    ) t
group by question_id 
) t1
order by answer_rate desc
) t2
where rn = 1
