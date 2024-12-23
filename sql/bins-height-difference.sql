drop table if exists 
    bins_height_difference;
--
create table bins_height_difference (
    bin numeric,
    height_difference numeric,
    height_roof numeric,
    planimetrics_height numeric,
    created_date date,
    last_edited_date date
);
-- 1
insert into bins_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date
   ,last_edited_date
   )
select 
    b.bin
   ,abs(b.height_roo - e.height_roof)
   ,b.height_roo
   ,e.height_roof
   ,b.created_da
   ,b.last_edi_1
from 
    bldg.building1 b
join 
    bldg.bin_height e
on 
    b.bin = e.bin
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);
-- 2
insert into bins_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date
   ,last_edited_date
   )
select 
    b.bin
   ,abs(b.height_roo - e.height_roof)
   ,b.height_roo
   ,e.height_roof
   ,b.created_da
   ,b.last_edi_1
from 
    bldg.building2 b
join 
    bldg.bin_height e
on 
    b.bin = e.bin
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);
-- 3
insert into bins_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date
   ,last_edited_date
   )
select 
    b.bin
   ,abs(b.height_roo - e.height_roof)
   ,b.height_roo
   ,e.height_roof
   ,b.created_da
   ,b.last_edi_1
from 
    bldg.building3 b
join 
    bldg.bin_height e
on 
    b.bin = e.bin
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);
-- 4
insert into bins_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date
   ,last_edited_date
   )
select 
    b.bin
   ,abs(b.height_roo - e.height_roof)
   ,b.height_roo
   ,e.height_roof
   ,b.created_da
   ,b.last_edi_1
from 
    bldg.building4 b
join 
    bldg.bin_height e
on 
    b.bin = e.bin
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);
-- 5
insert into bins_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date
   ,last_edited_date
   )
select 
    b.bin
   ,abs(b.height_roo - e.height_roof)
   ,b.height_roo
   ,e.height_roof
   ,b.created_da
   ,b.last_edi_1
from 
    bldg.building5 b
join 
    bldg.bin_height e
on 
    b.bin = e.bin
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);