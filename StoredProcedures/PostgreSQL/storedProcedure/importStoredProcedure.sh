#!/usr/bin/env bash

psql -U admin -W admin -h 127.0.0.1 -p 5432 -d school < storedProc.sql