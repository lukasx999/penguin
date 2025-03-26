#include <unistd.h>

#include <dirent.h>
#include <stdio.h>

// #include <xf86drm.h>
// #include <xf86drmMode.h>

int main(void) {

    DIR *dirp = opendir(".");

    struct dirent *dir = NULL;
    while ((dir = readdir(dirp)) != NULL)
        printf("%s\n", dir->d_name);

    closedir(dirp);

    while (1);
    return 0;
}
