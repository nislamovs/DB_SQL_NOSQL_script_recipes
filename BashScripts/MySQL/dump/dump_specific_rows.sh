#!/usr/bin/env bash

mysqldump -h 127.0.0.1 -P 3306 -u admin -padmin school teachers --where="class_id is not null" > teachers_class_heads_dump.sql