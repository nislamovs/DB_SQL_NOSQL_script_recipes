#!/usr/bin/env bash

# Run from console
psql --port=5432 --host=127.0.0.1 --dbname=airport --username=admin


# Run from console client
\copy airports (id,ident,type,name,latitude_deg,longitude_deg,elevation_ft,continent,iso_country,iso_region,municipality,scheduled_service,gps_code,iata_code,local_code,home_link,wikipedia_link,keywords)	FROM '/home/perkele/Downloads/airports.csv' DELIMITER ',' CSV HEADER;