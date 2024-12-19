drop table if exists 
    bins_missing_height_update;
drop table if exists 
    bins_missing_height_review;
--
create table 
    bins_missing_height_update as
select 
     a.bin
    ,abs(a.planimetrics_height - b.planimetrics_height) as height_diff
    ,a.planimetrics_height as bin_height  
    ,b.planimetrics_height as spot_height
from 
    bins_missing_height a
join 
    buildings_missing_height b
on 
    a.bin = b.bin
where 
    abs(a.planimetrics_height - b.planimetrics_height) < 20
and a.planimetrics_height > 10;
--
create table 
    bins_missing_height_review as
select 
     a.bin
    ,a.planimetrics_height as planimetrics_height  
    ,b.planimetrics_height as planimetrics_spot_height_calc
    ,abs(a.planimetrics_height - b.planimetrics_height) as height_diff
from 
    bins_missing_height a
join 
    buildings_missing_height b
on 
    a.bin = b.bin
where 
    (abs(a.planimetrics_height - b.planimetrics_height) >= 20
or  a.planimetrics_height <= 10)
and a.planimetrics_height <> 0
order by a.planimetrics_height desc;