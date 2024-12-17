drop table if exists 
    bins_missing_height;
--
create table bins_missing_height (
    bin numeric,
    doitt_id numeric,
    created_date date,
    last_edited_date date,
    planimetrics_height numeric
);
--
insert into bins_missing_height (
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
   ,e.height_roof
from 
  bldg.building1 b
join 
  bldg.bin_height e
on 
  b.bin = e.bin
where 
    (b.height_roo is null or b.height_roo = 0)
and (b.created_da < '2022-01-01' or b.created_da is null);
--
--2
--3
--4
--
insert into bins_missing_height (
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
   ,e.height_roof
from 
  bldg.building5 b
join 
  bldg.bin_height e
on 
  b.bin = e.bin
where 
    (b.height_roo is null or b.height_roo = 0)
and (b.created_da < '2022-01-01' or b.created_da is null);
-- this is bad planimetrics input
-- splits or similar where the capture rules were ignored
-- toss these (approximately 10) we do not trust it
delete from 
    bins_missing_height
where 
    bin in (select 
                bin 
            from 
                bins_missing_height
            group by bin
            having count(*) > 1);
alter table 
    bins_missing_height
add 
    primary key (bin);