-- so slow and annoying that i do not wish to evaluate further
-- it is a strong hint that performing this sort of work in the 
-- live, versioned geodatabase is a bad approach
select 
    (e.elevation - (b.ground_elevation + b.height_roof)) as elevation_diff
   ,e.elevation as planimetrics_elevation
   ,(b.ground_elevation + b.height_roof) as building_elevation
   ,b.doitt_id
   ,e.objectid
   ,b.last_edited_date
from 
    bldg.building_evw b
   ,planimetrics_2022.elevation e
where 
    b.doitt_id = 1210705
and sdo_relate(b.shape, e.shape, 'mask=anyinteract') = 'TRUE'