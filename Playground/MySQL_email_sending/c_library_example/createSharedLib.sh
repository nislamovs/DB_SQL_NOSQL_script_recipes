#!/usr/bin/env bash

cd ./EmailModule  ;
cmake . ;
cmake --build . ;
gcc -shared -o ./emailmodule.so ./CMakeFiles/EmailModule.dir/main.c.o
