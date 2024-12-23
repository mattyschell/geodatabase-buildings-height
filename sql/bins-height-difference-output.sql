drop table if exists 
    bins_height_difference_review;
--
create table 
    bins_height_difference_review as
select 
     a.bin
    ,ceil(a.height_roof) as oti_height_roof
    ,ceil(a.planimetrics_height) as planimetrics_height_roof
    ,round(a.height_difference) as height_difference  
    ,ceil(b.planimetrics_height) as planimetrics_spot_height_calc
    ,ceil(abs(a.planimetrics_height - b.planimetrics_height)) as planimetrics_height_range
from 
    bins_height_difference a
join 
    buildings_height_difference b
on 
    a.bin = b.bin
where 
    abs(a.planimetrics_height - b.planimetrics_height) < 30 -- this means confidence
and a.planimetrics_height > 10 -- ignore shorties
and a.height_difference > 30  -- reduce list to real differences
order by a.height_difference desc;