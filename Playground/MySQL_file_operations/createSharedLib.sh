#!/usr/bin/env bash

cd ./FileManager  ;
cmake . ;
cmake --build . ;
gcc -shared -o ../filemanager.so ./CMakeFiles/FileManager.dir/main.c.o