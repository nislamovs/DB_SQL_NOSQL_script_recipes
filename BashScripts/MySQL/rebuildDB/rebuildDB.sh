#!/usr/bin/env bash

mysql -h 127.0.0.1 -P 3306 -uroot -proot -Bse "DROP DATABASE IF EXISTS school;CREATE DATABASE school;source ./import_dump/db_backup.sql;"