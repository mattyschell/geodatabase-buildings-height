create table (
    bin numeric,
    doitt_id numeric,
    created_date date,
    last_edited_date date,
    height_roof numeric,
    planimetrics_height numeric,
    height_difference numeric
);
insert into bin_height_difference (
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
   ,e.height_roof
   ,abs(b.height_roo - e.height_roof)
from 
  bldg.building1 b
join 
  bldg.bin_height e
on 
  b.bin = e.bin
where 
    (b.height_roo is not null and b.height_roo > 0)
and created_da < '2022-01-01';
--
--2
--3
--4
--
insert into bin_height_difference (
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
   ,e.height_roof
   ,abs(b.height_roo - e.height_roof)
from 
  bldg.building5 b
join 
  bldg.bin_height e
on 
  b.bin = e.bin
where 
    (b.height_roo is not null and b.height_roo > 0)
and created_da < '2022-01-01';
--
