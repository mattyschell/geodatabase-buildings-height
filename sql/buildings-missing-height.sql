create table buildings_missing_height (
    bin numeric,
    doitt_id numeric,
    created_date date,
    last_edited_date date,
    planimetrics_height numeric
);
--
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
and created_da < '2022-01-01';
--
-- other boroughs here I guess
--