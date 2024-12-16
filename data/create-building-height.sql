-- after unzipping and loading the input data
-- create building heights from building elevation minus nearest spot elevation
-- this is the dataset we will use 
-- elevation = building elevation (poor naming choice)
-- spot_elevation = all spot elevations
-- i am including spot_distance in case some buildings are so far from their 
--     nearest spot elevation as to generate suspect heights
create table building_height 
as
select 
    a.elevation - b.elevation as building_height
   ,a.elevation as building_elevation
   ,b.elevation as spot_elevation
   ,ST_Distance(a.geom, b.geom) as spot_distance
   ,a.geom as geom
from 
    elevation as a
join lateral (
    select 
        elevation
       ,geom
    from 
        spot_elevation 
    order by 
        a.geom <-> geom 
    limit 1
) as b on true;
--
create index 
    building_heightgeom_idx 
on 
    building_height 
using 
    gist(geom);