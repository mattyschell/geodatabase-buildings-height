set search_path to bldg, public;
\set QUIET 1
SET client_min_messages TO WARNING;
--\i ./data/temp/building1.sql
--\i ./data/temp/building2.sql
--\i ./data/temp/building3.sql
--\i ./data/temp/building4.sql
\i ./data/temp/building5.sql
\i ./data/temp/elevation.sql
\i ./data/temp/spot_elevation.sql
\i ./data/create-spatial-indexes.sql
\i ./data/create-building_height.sql
