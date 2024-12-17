echo "populating buildings_missing_height in $PGDATABASE on $PGHOST"
psql -f ./sql/buildings-missing-height.sql
psql -f ./sql/bins-missing-height.sql
echo "output buildings_missing_height.csv to output directory"
psql -c "\COPY buildings_missing_height TO './output/buildings_missing_height.csv' WITH (FORMAT csv, HEADER true);"
echo "output bins_missing_height.csv to output directory"
psql -c "\COPY bins_missing_height TO './output/bins_missing_height.csv' WITH (FORMAT csv, HEADER true);"