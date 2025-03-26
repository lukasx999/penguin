#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>

int main(void) {

    DIR *dir = opendir(".");
    struct dirent *d = NULL;
    while ((d = readdir(dir)) != NULL) {
        printf("dir: %s\n", d->d_name);
    }

    printf("greetings!\n");
    while (1);
    return 0;
}
