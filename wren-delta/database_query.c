#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

// #define PATH_TO_SCRIPT "/home/wren-delta/dbquery.py"
// #define PATH_TO_SCRIPT "/home/wren/hacknotts/wren-delta/dbquery.py"
#define PATH_TO_SCRIPT "./dbquery.py"
int main()
{
	printf("Running the python script\n");
	char *args[]={"/usr/bin/python3", PATH_TO_SCRIPT, NULL};
	execv(args[0],args);

    return 0;
}
