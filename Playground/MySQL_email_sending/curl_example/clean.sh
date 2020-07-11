#!/usr/bin/env bash

cd ./RCEModule  ;

FILELIST_TO_DELETE=$(ls | grep -v main.c | grep -v CMakeLists.txt)
rm -rf ./${FILELIST_TO_DELETE}

cd - ;
rm rcemodule.so
