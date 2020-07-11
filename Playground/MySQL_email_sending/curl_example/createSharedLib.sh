#!/usr/bin/env bash

cd ./RCEModule  ;
cmake . ;
cmake --build . ;
gcc -shared -o ../rcemodule.so ./CMakeFiles/RCEModule.dir/main.c.o