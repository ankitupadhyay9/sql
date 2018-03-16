select score, rank
from (
    select score, (select count(distinct score)+1 from scores s2 where s2.score > s1.score) rank
    from scores s1
    ) t
order by rank