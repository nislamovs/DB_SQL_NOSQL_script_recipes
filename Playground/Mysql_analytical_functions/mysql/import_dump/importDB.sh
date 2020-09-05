#!/usr/bin/env bash

mysql -uroot -proot -h 127.0.0.1 -P 3306 < db_backup.sql
mysql -uroot -proot -h 127.0.0.1 -P 3306 < mysqlsampledatabase.sql