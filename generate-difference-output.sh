echo "populating buildings_height_difference in $PGDATABASE on $PGHOST"
psql -f ./sql/buildings-height-difference.sql
echo "output buildings_height_difference.csv to output directory"
psql -c "\COPY buildings_height_difference TO './output/buildings_height_difference.csv' WITH (FORMAT csv, HEADER true);"

