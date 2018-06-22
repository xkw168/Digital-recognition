#encoding:utf-8
#import numpy as np
#import cv2

import cv2
import numpy as np
#from matplotlib import pyplot as plt
import sys

debug = False
img = np.zeros((480,640),np.uint8)
#生成一个空灰度图像
  
    
def GetStockTxt(txt):
       lnum = 0
       stocks = []
       #img = np.zeros((240,320),np.uint8)#生成一个空灰度图像
       with open(txt, 'r') as fd:
            for line in fd:
                
                if (lnum < 307200):
                    i = (int(lnum/640))%480
                    
                    j = int(lnum%640)
                    #print i,j
                    img[i,j] = int(line.strip('\n'),16)
                    #print img[i,j]
                lnum += 1;			
            fd.close()
           

            
GetStockTxt('savedata.txt')
cv2.imwrite("./digital.jpg", img)
cv2.namedWindow("digital")   
cv2.imshow("digital", img)   
cv2.waitKey (0)  
cv2.destroyAllWindows()









sys.exit(0)

