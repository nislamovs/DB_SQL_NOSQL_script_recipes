#!/usr/bin/env bash

cd ./FileManager && rm -rf $(ls | grep -v main.c | grep -v CMakeLists.txt) ;

cd .. ;
rm filemanager.so
