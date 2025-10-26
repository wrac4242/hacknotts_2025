

#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
    char *filename;

    if (argc<2) {
        printf("Flower lookup utility\nusage ./lookup {flower number} \n1- poppy\n2- sunflower");
        return 0;
    }



    //read the file
    switch ((int )argv[1]-'0')
    {
    case 1:
        /* code */
        char *filename = "flowers/poppy";

    case 2:
        char *filename="flowers/sunflower";
    
    default:
        return -1;
        break;
    }

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