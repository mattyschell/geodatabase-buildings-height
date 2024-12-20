#!/usr/bin/env bash
echo "generating missing height output in $PGDATABASE on $PGHOST"
echo "using spot elevations to populate BUILDINGS_missing_height"
psql -f ./sql/buildings-missing-height.sql
echo "using planimetrics buildings height_roof to populate BINS_missing_height"
psql -f ./sql/bins-missing-height.sql
echo "creating 2 output tables"
psql -f ./sql/bins-missing-height-output.sql
echo "copying bins_missing_height_update.csv to output directory"
psql -c "\COPY bins_missing_height_update \
             TO './output/bins_missing_height_update.csv' \
             WITH (FORMAT csv, HEADER true);"
echo "copying bins_missing_height_review.csv to output directory"
psql -c "\COPY bins_missing_height_review \
             TO './output/bins_missing_height_review.csv' \
             WITH (FORMAT csv, HEADER true);"