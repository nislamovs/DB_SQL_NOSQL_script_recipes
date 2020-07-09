cmake_minimum_required(VERSION 3.10.2)

set(PROJECTNAME FileManager)
project(FileManager C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

include_directories(/usr/include/mysql)

execute_process(COMMAND mysql_config --cflags OUTPUT_VARIABLE MYSQL_CFLAGS  OUTPUT_STRIP_TRAILING_WHITESPACE)
#execute_process(COMMAND mysql_config --libs   OUTPUT_VARIABLE MYSQL_LINK    OUTPUT_STRIP_TRAILING_WHITESPACE)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${MYSQL_CFLAGS} -c -Wall -Werror")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -I/usr/include/mysql")

#set(SOURCE_FILES test.c test.h)
set(SOURCE_FILES main.c)
add_executable(${PROJECTNAME} ${SOURCE_FILES})

target_link_libraries(${PROJECTNAME} "/usr/lib/x86_64-linux-gnu/libmysqlclient.so")
target_link_libraries(${PROJECTNAME} "/usr/lib/x86_64-linux-gnu/libz.so")