#!/usr/bin/env bash

mysqldump -h 127.0.0.1 -P 3306 -u admin -padmin school > school_dump.sql