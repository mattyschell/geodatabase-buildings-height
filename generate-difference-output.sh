#!/usr/bin/env bash
echo "generating height difference output in $PGDATABASE on $PGHOST"
echo "using spot elevations to populate BUILDINGS_height_difference"
psql -f ./sql/buildings-height-difference.sql
echo "using planimetrics buildings height_roof to populate BINS_height_difference"
psql -f ./sql/bins-height-difference.sql
echo "creating sorted output table bins_height_difference_review"
psql -f ./sql/bins-height-difference-output.sql
echo "copying bins_height_difference_review.csv to output directory"
psql -c "\COPY bins_height_difference_review \
             TO './output/bins_height_difference_review.csv' \
             WITH (FORMAT csv, HEADER true);"
