create table buildings_height_difference (
    bin numeric,
    doitt_id numeric,
    created_date date,
    last_edited_date date,
    height_roof numeric,
    planimetrics_height numeric,
    height_difference numeric
);
--
insert into buildings_height_difference (
    bin
   ,doitt_id
   ,created_date
   ,last_edited_date
   ,height_roof
   ,planimetrics_height
   ,height_difference)
select 
    b.bin
   ,b.doitt_id
   ,b.created_da
   ,b.last_edi_1
   ,b.height_roo
   ,e.building_height
   ,abs(b.height_roo - e.building_height)
from 
  bldg.building1 b
join 
  bldg.building_height e
on 
  st_intersects(e.geom, b.geom)
where 
    (b.height_roo is not null and b.height_roo > 0)
and created_da < '2022-01-01';
--
--2
--3
--4
--
insert into buildings_height_difference (
    bin
   ,doitt_id
   ,created_date
   ,last_edited_date
   ,height_roof
   ,planimetrics_height
   ,height_difference)
select 
    b.bin
   ,b.doitt_id
   ,b.created_da
   ,b.last_edi_1
   ,b.height_roo
   ,e.building_height
   ,abs(b.height_roo - e.building_height)
from 
  bldg.building5 b
join 
  bldg.building_height e
on 
  st_intersects(e.geom, b.geom)
where 
    (b.height_roo is not null and b.height_roo > 0)
and created_da < '2022-01-01';