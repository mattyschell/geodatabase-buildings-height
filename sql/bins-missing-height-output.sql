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
    abs(a.planimetrics_height - b.planimetrics_height) < 10;
--
create table 
    bins_missing_height_review as
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
    abs(a.planimetrics_height - b.planimetrics_height) >= 10;