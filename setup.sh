#!/usr/bin/env bash
echo "starting setup with user $PGUSER on $PGHOST"
psql -v v1=$BLDGPASSWORD -f ./sql/create-users.sql
export PGUSER=bldg
export PGPASSWORD=$BLDGPASSWORD
psql -f ./sql/create-database.sql
export PGDATABASE=buildingscratch
echo "setting up database and schemas with user $PGUSER on database $PGDATABASE"
psql -f ./sql/setup-database.sql
for value in {1..5}
do
 echo "Processing borough: $value"
 if [ -f "./data/building$value.zip" ]; then
  unzip ./data/building$value.zip -d ./data/temp
  shp2pgsql -s 2263 -c ./data/temp/building$value.shp building$value > ./data/temp/building$value.sql
 else
  echo "File building$value.zip not found"
 fi
done
unzip ./data/elevation.zip -d ./data/temp
shp2pgsql -s 2263 -c ./data/temp/elevation.shp elevation > ./data/temp/elevation.sql
psql -f ./data/all.sql
rm -r ./data/temp/
