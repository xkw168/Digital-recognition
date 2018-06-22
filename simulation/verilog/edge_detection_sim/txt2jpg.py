#encoding:utf-8
#import numpy as np
#import cv2

import cv2
import numpy as np
#from matplotlib import pyplot as plt
import sys

debug = False
img = np.zeros((240,320),np.uint8)
#生成一个空灰度图像
  
    
def GetStockTxt(txt):
       lnum = 0
       stocks = []
       #img = np.zeros((240,320),np.uint8)#生成一个空灰度图像
       with open(txt, 'r') as fd:
            for line in fd:
                
                if (lnum < 76800):
                    i = (int(lnum/320))%240
                    
                    j = int(lnum%320)
                    #print i,j
                    img[i,j] = int(line.strip('\n'),16)
                    #print img[i,j]
                lnum += 1;			
            fd.close()
           

            
GetStockTxt('savedata.txt')
cv2.imwrite("./library_sobel_128.jpg", img)
cv2.namedWindow("library_th128")   
cv2.imshow("library_th128", img)   
cv2.waitKey (0)  
cv2.destroyAllWindows()









sys.exit(0)

