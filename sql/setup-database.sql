create extension postgis;
create schema if not exists bldg;
grant usage on schema 
    bldg 
to 
    public;
revoke create on schema 
    public 
from 
    public;