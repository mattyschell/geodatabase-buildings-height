create index elevationgeom_idx on elevation using gist(geom);
create index spotelevationgeom_idx on spot_elevation using gist(geom);
--create index building1geom_idx on building1 using gist(geom);
--create index building2geom_idx on building2 using gist(geom);
--create index building3geom_idx on building3 using gist(geom);
--create index building4geom_idx on building4 using gist(geom);
create index building5geom_idx on building5 using gist(geom);