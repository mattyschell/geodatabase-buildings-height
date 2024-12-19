drop table if exists 
    buildings_missing_height;
--
create table buildings_missing_height (
    bin numeric,
    doitt_id numeric,
    created_date date,
    last_edited_date date,
    planimetrics_height numeric
);
-- 1
insert into buildings_missing_height (
    bin
   ,doitt_id
   ,created_date
   ,last_edited_date
   ,planimetrics_height)
select 
    b.bin
   ,b.doitt_id
   ,b.created_da
   ,b.last_edi_1
   ,e.building_height
from 
    bldg.building1 b
join 
    bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is null or b.height_roo = 0)
and (created_da < '2022-01-01' or created_da is null);
-- 2
insert into buildings_missing_height (
    bin
   ,doitt_id
   ,created_date
   ,last_edited_date
   ,planimetrics_height)
select 
    b.bin
   ,b.doitt_id
   ,b.created_da
   ,b.last_edi_1
   ,e.building_height
from 
    bldg.building2 b
join 
    bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is null or b.height_roo = 0)
and (created_da < '2022-01-01' or created_da is null);
-- 3
insert into buildings_missing_height (
    bin
   ,doitt_id
   ,created_date
   ,last_edited_date
   ,planimetrics_height)
select 
    b.bin
   ,b.doitt_id
   ,b.created_da
   ,b.last_edi_1
   ,e.building_height
from 
    bldg.building3 b
join 
    bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is null or b.height_roo = 0)
and (created_da < '2022-01-01' or created_da is null);
-- 4
insert into buildings_missing_height (
    bin
   ,doitt_id
   ,created_date
   ,last_edited_date
   ,planimetrics_height)
select 
    b.bin
   ,b.doitt_id
   ,b.created_da
   ,b.last_edi_1
   ,e.building_height
from 
    bldg.building4 b
join 
    bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is null or b.height_roo = 0)
and (created_da < '2022-01-01' or created_da is null);
-- 5
insert into buildings_missing_height (
    bin
   ,doitt_id
   ,created_date
   ,last_edited_date
   ,planimetrics_height)
select 
    b.bin
   ,b.doitt_id
   ,b.created_da
   ,b.last_edi_1
   ,e.building_height
from 
    bldg.building5 b
join 
   bldg.building_height e
on 
    st_intersects(e.geom, b.geom)
where 
    (b.height_roo is null or b.height_roo = 0)
and (created_da < '2022-01-01' or created_da is null);
-- this is 2 more more elevations on a footprint
-- toss these it means we have no confidence in 
-- using this strategy for these buildings
delete from 
    buildings_missing_height
where 
    bin in (select 
                bin 
            from 
                buildings_missing_height
            group by bin
            having count(*) > 1);
alter table 
    buildings_missing_height
add 
    primary key (bin);
