#!/usr/bin/env bash
export SURVIVINGUSER=$PGUSER
export SURVIVINGPASSWORD=$PGPASSWORD
export PGUSER=bldg
export PGPASSWORD=$BLDGPASSWORD
rm -r ./data/temp/
psql -c "drop database buildingscratch"
export PGUSER=$SURVIVINGUSER
export PGPASSWORD=$SURVIVINGPASSWORD
psql -c "drop user bldg;"