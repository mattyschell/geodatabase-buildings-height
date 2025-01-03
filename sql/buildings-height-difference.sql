drop table if exists 
    buildings_height_difference;
--
create table buildings_height_difference (
    bin numeric,
    height_difference numeric,
    height_roof numeric,
    planimetrics_height numeric,
    created_date date,
    last_edited_date date
);
-- 1
insert into buildings_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date   
   ,last_edited_date)
select 
    b.bin
   ,abs(b.height_roo - e.building_height)
   ,b.height_roo
   ,e.building_height
   ,b.created_da
   ,b.last_edi_1   
from 
    bldg.building1 b
join 
    bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);
-- 2
insert into buildings_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date   
   ,last_edited_date)
select 
    b.bin
   ,abs(b.height_roo - e.building_height)
   ,b.height_roo
   ,e.building_height
   ,b.created_da
   ,b.last_edi_1   
from 
    bldg.building2 b
join 
    bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);
-- 3
insert into buildings_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date   
   ,last_edited_date)
select 
    b.bin
   ,abs(b.height_roo - e.building_height)
   ,b.height_roo
   ,e.building_height
   ,b.created_da
   ,b.last_edi_1   
from 
    bldg.building3 b
join 
    bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);
-- 4
insert into buildings_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date   
   ,last_edited_date)
select 
    b.bin
   ,abs(b.height_roo - e.building_height)
   ,b.height_roo
   ,e.building_height
   ,b.created_da
   ,b.last_edi_1   
from 
    bldg.building4 b
join 
    bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);
-- 5
insert into buildings_height_difference (
    bin
   ,height_difference
   ,height_roof
   ,planimetrics_height
   ,created_date   
   ,last_edited_date)
select 
    b.bin
   ,abs(b.height_roo - e.building_height)
   ,b.height_roo
   ,e.building_height
   ,b.created_da
   ,b.last_edi_1   
from 
    bldg.building5 b
join 
    bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is not null and b.height_roo > 0)
and (created_da < '2022-01-01' or created_da is null);