# geodatabase-buildings-height

Update [geodatabase-buildings](https://github.com/mattyschell/geodatabase-buildings) height_roof using planimetrics [elevation](https://github.com/CityOfNewYork/nyc-planimetrics/blob/main/Capture_Rules.md#subtype-building-elevation) data.  Let's work in PostGIS to troll ourselves.


## setup

Export buildings by borough as 5 shapefiles to the data/ directory as building1.shp, building2.shp etc.  Zip them up for version control, we wish to slide underneath the github limit of 100MB.

Export elevations with feature_code equal to 3020 as a shapefile to the data directory.  Zip it also.

Don't bother with removing columns, the ArcGIS Pro GUI is uncooperative when also selecting a subset of records.

