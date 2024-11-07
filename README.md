# geodatabase-buildings-height

Update [geodatabase-buildings](https://github.com/mattyschell/geodatabase-buildings) height_roof using planimetrics [elevation](https://github.com/CityOfNewYork/nyc-planimetrics/blob/main/Capture_Rules.md#subtype-building-elevation) data.  Let's work in PostGIS to troll ourselves.

## Manual Preparation

See the data directory, this prep is prep'd.  

* Export buildings by borough as 5 shapefiles to the data/ directory as building1.shp, building2.shp etc.  Zip each shapefile up for version control, we wish to slide underneath the github limit of 100MB.

* Export elevations with feature_code equal to 3020 as a shapefile named elevation.shp to the data directory.  Zip it also.

* Export elevations with feature_code equal to 300000 as a shapefile named spot_elevation.shp to the data directory.  Zip that bad boy.

Don't bother with removing columns, the ArcGIS Pro GUI is uncooperative when also selecting a subset of records.

## Database Setup

Create and load a scratch PostGIS database.

```shell
export BLDGPASSWORD=<provide a scratch password>
export PGUSER=postgres
export PGPASSWORD=<your postgres password>
export PGHOST=<your postgres host>
export PGDATABASE=postgres
./setup.sh
```

## Evaluate Heights

This is a work in progress...

### Evaluate Buildings With NULL or 0 Height

See /sql/buildings-missing-heights.sql

### Evaluate Buildings With Suspect Heights

TBD


