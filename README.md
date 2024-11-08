# geodatabase-buildings-height

Update [geodatabase-buildings](https://github.com/mattyschell/geodatabase-buildings) height_roof using planimetrics [elevation](https://github.com/CityOfNewYork/nyc-planimetrics/blob/main/Capture_Rules.md#subtype-building-elevation) data.  Let's work in PostGIS to troll ourselves.

## Manual Preparation

See the data directory, this prep is prep'd.  

* Export buildings by borough as 5 shapefiles to the data/ directory as building1.shp, building2.shp etc.  Zip each shapefile up for version control, we wish to slide underneath the github limit of 100MB.

* Export elevations with feature_code equal to 3020 as a shapefile named elevation.shp to the data directory.  Zip it also.

* Export elevations with feature_code equal to 300000 as a shapefile named spot_elevation.shp to the data directory.  Zip that bad boy.

Don't bother with removing columns, the ArcGIS Pro GUI requires a galaxy brain when also selecting a subset of records.

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

## Generate Output for Buildings With Null or Zero Height

```shell
export PGPASSWORD=<scratch password from setup>
export PGHOST=<your postgres host>
export PGUSER=bldg
export PGDATABASE=buildingscratch
./generate-nullzero-output.sh
```

See output\buildings_missing_height.csv

## Evaluate Buildings With Suspect Heights

TBD


## Remove data\temp and Teardown Database

```shell
export BLDGPASSWORD=<scratch password from setup>
export PGUSER=postgres
export PGPASSWORD=<your postgres password>
export PGHOST=<your postgres host>
export PGDATABASE=postgres
./teardown.sh
```
