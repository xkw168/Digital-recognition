#encoding:utf-8
import numpy as np
import cv2
import sys

# ver python 3.5

# Load an color image in grayscale
img = cv2.imread('digital5_640x480.bmp',0)
#img = cv2.imread('test.bmp')

rows,cols = img.shape
#print rows,cols
print (rows,cols)
grey = img[0,0]
#(b,g,r) = img[0,0]
#print b,g,r
#sys.exit(0)
fp=open("imgdata5.txt","wt")
fpz=open("savedata.txt","wt")#灰度图像
#for i in range(): 
#for i in xrange(0,rows):
for i in range(0,rows):
#for (int i = 0; i < image.rows; i++)

    
    #for j in xrange(0,cols):
    for j in range(0,cols):
#   for (int j = 0; j < image.cols; j++)
        p = img[i,j]
        #print i,j
        #fp.write("@"+str(i*cols+j)+'\n')
        char_tmp = "@"+str(hex(i*cols+j))+'\n'
        
        fp.write(char_tmp.replace('0x',''))
        char_tmp = str(hex(p))+"\n"
        fp.write(char_tmp.replace('0x',''))
        fpz.write(str(hex(p))+"\n")
fp.close()
fpz.close()

cv2.namedWindow("Image")   
cv2.imshow("Image", img)   
cv2.waitKey (0)  
cv2.destroyAllWindows()

sys.exit(0)
  
          # #include "opencv2/core/core.hpp"
# #include "opencv2/opencv.hpp"
# #include <iostream>
# using namespace std;
# using namespace cv;
# int main(int argc, char *argv[])
# {
    # // create by using the constructor
 # Mat image = imread(argv[1],CV_LOAD_IMAGE_GRAYSCALE);
 
 # if(!image.data)
 # {
  # printf("Error loading %s",argv[1]);
  # return -1;
 # }
 # //cvNamedWindow("show",CV_WINDOW_AUTOSIZE);
 # //imshow("show",image);
 # //waitKey(0);
 # FILE *pfile=fopen("imgdata.txt","wb");
 # if(pfile==NULL)
 # {
  # printf("Error opening imgdata.txt");
  # return -1;
 # }
 # uchar *p;
    # for (int i = 0; i < image.rows; i++)
    # {
        # p = image.ptr < uchar > (i);
        # for (int j = 0; j < image.cols; j++)
        # {
            # fprintf(pfile,"@%x\n",i*image.cols+j);
   # fprintf(pfile,"%x\n", p[j]);
        # }
    # }
 # fclose(pfile);

 # return 0;
# }
