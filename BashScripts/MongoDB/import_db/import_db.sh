#!/usr/bin/env bash

mongoimport --db neighbourhoods --collection inventory \
          --drop --file neighbourhoods.geojson