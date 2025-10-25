// notes for me
// get a string from the user then find the appropiate file and read it (make sure it is traversable)

#include <stdio.h>

int main() {

    // find the user's flower choice
    char query[2048]; // TODO: do we need such a big buffer?
    printf("Enter flower name for lookup: ");
    scanf("%s", &query);

    //read the file

    char filename[2048];
    sprintf(filename, "flowers/%s");

    char file_content[2048];

    FILE *flower_file = fopen(filename,"r");
    fgets(file_content, 2048, flower_file);

    printf(file_content);

    fclose(flower_file);


}