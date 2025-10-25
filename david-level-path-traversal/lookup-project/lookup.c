

#include <stdio.h>

int main() {


    char query[2048]; // TODO: do we need such a big buffer?
    printf("Enter flower name for lookup: ");
    scanf("%s", &query);

    //read the file

    char filename[2048];
    sprintf(filename, "flowers/%s",query);

    char file_content[2048];

    FILE *flower_file = fopen(filename,"r");

    if (! flower_file) {
        printf("flower not found!");
        return -1;
    }
    fgets(file_content, 2048, flower_file);

    printf("%s",file_content);

    fclose(flower_file);


}