#include "twoDtree.h"
#include "util/RGBAPixel.h"
#include "util/PNG.h"

using namespace util;
using namespace std;

/*
 * Demonstration of project functionality.
 * Reads Point data from external files.
 * Produces PNG images of the point sets.
 * Add more images with various prune paramters
 * as necessary.
 */
int main(int argc, char *argv[])
{
    double optpct = 1.00;
    int opttol = 100;
    if (argc < 3)
    {
        printf("PNG Pixel Art Filter\n");
        printf("Usage: %s input.png filter.png [tol=%d] [pct=%f]\n", argv[0], opttol, optpct);
        return 0;
    }
    if (argc > 3)
        opttol = atoi(argv[3]);
    if (argc > 4)
        optpct = atof(argv[4]);
    //read in images
    PNG origImg;
    origImg.readFromFile(argv[1]);

    //build twoDtrees
    twoDtree t(origImg);

    //prune images
    //modify paramters to get different effects
    t.prune(optpct, opttol);

    //render tree
    PNG pic = t.render();

    //write to file
    pic.writeToFile(argv[2]);

    return 0;
}
