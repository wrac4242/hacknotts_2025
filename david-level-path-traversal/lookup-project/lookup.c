

#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {

    if (argc<2) {
        printf("Flower lookup utility\nusage ./lookup {flower} \n");
        return 0;
    }



    //read the file

    char filename[1024];
    sprintf(filename, "flowers/%s",argv[1]);

    char file_content[2048];

    FILE *flower_file = fopen(filename,"r");

    if (! flower_file) {
        printf("flower not found!\n");
        return -1;

    }
    while (fgets(file_content, 2048, flower_file)){
        printf("%s\n",file_content);
    }




    fclose(flower_file);


}