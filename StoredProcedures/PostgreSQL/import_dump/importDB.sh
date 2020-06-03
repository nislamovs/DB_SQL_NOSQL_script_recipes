#!/usr/bin/env bash

#Run manually from console
psql -U admin -W admin -h 127.0.0.1 -p 5432 -d school < db_backup.sql