#include <my_global.h>
#include <mysql.h>


my_bool FileManager_init(UDF_INIT *initid, UDF_ARGS *args, char *message);
void FileManager_deinit(UDF_INIT *initid __attribute__((unused)));
char* FileManager(UDF_INIT *initid, UDF_ARGS *args, char *result, unsigned long *length, char *is_null, char *error);

my_bool FileManager_Init(UDF_INIT *initid, UDF_ARGS *args, char *message) {
    if(args -> arg_count < 3 || args -> arg_count > 3) {
        strcpy(message, "Invalid argument count");
        return 1;
    }

    args -> arg_type[0]=STRING_RESULT;
    args -> arg_type[1]=STRING_RESULT;
    args -> arg_type[2]=STRING_RESULT;
    initid -> ptr = (char*) malloc(200);
    return 0;
}

void FileManager_deinit(UDF_INIT *initid __attribute__((unused))) {
    if (initid -> ptr) {
        free (initid -> ptr);
    }
}

char* FileManager(UDF_INIT *initid, UDF_ARGS *args, char *result, unsigned long *length, char *is_null, char *error) {
    *length = 0;
    switch (atoi(args -> args[0])) {
        case 1: //Create file
        {
            FILE *fp=fopen(args->args[1], "w");
            if(fp != NULL) {
                char data[] = "File created successfully";
                strcpy(initid->ptr, data);
                *length=strlen(data);
            }
            fclose(fp);
        }
            break;
        case 2: //Write to file
        {
            FILE *fp=fopen(args->args[1], "w");
            size_t count = fwrite(args -> args[2], 1, strlen(args ->args[2]), fp);
            if(count == strlen(args -> args[2])) {
                char data[] = "Data saved successfully";
                strcpy(initid->ptr, data);
                *length=strlen(data);
                fclose(fp);
            }
        }
            break;
        case 3: //Read from file
        {
            FILE *fp=fopen(args->args[1], "r");
            char buffer[100];
//            size_t count = fread(buffer, 1, 100, fp);
            fread(buffer, 1, 100, fp);
            strcpy(initid->ptr, buffer);
            *length=strlen(buffer);
            fclose(fp);
        }
            break;
        case 4: //Delete file
        {
            if (remove(args->args[1]) == 0) {
                char data[] = "File removed successfully";
                strcpy(initid->ptr, data);
                *length=strlen(data);
            } else {
                char data[] = "File remove failed!";
                strcpy(initid->ptr, data);
                *length=strlen(data);
            }
        }
            break;
    }

    return initid->ptr;
}