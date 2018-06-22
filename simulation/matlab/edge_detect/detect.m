clc
clear all
%% 直接输入二值化图片
%im = imread('digitals.png');

%% 输入彩色图
im = imread('digitals.png');
im = rgb2gray(im);
thresh = graythresh(im)
im = im2bw(im,thresh);
im = uint16(im);
imshow(~im);

[l,m]=bwlabel(~im,8);
%% 对图片中的连通域画矩形框?
status=regionprops(l,'BoundingBox');

for i=1:m
rectangle('position',status(i).BoundingBox,'edgecolor','r','LineWidth',1.5);
end
result = zeros(1,m);
peidui = zeros(m,3);
moban235 = [1,0,2;
    1,1,3;
    0,1,5];
moban = [2,2,2;
    1,1,1;
    1,1,3;
    1,1,3;
    2,1,2;
    1,1,3;
    1,2,3;
    1,1,2;
    2,2,3;
    2,1,3];
for i=1:m
%%  初步判断数字
    peidui235 = zeros(1,2);
    x1 = int16(status(i).BoundingBox(4)/5*2 + status(i).BoundingBox(2)-30);
    x2 = int16(status(i).BoundingBox(4)/3*2 + status(i).BoundingBox(2));
    y = int16(status(i).BoundingBox(1) + status(i).BoundingBox(3)/2);
    for k = int16(status(i).BoundingBox(2)-3):int16(status(i).BoundingBox(4)+status(i).BoundingBox(2)+3)
        if (im(k,y) == 0 && im(k+1,y) > 0)
           peidui(i,3) = peidui(i,3) + 1 ; 
        end
    end
    for k =  int16(status(i).BoundingBox(1)-3):int16(status(i).BoundingBox(3)+status(i).BoundingBox(1)+3)
        if (im(x1,k) == 0 && im(x1,k+1) > 0)
           peidui(i,1) = peidui(i,1) + 1 ; 
        end
        if (im(x2,k) == 0 && im(x2,k+1) > 0)
           peidui(i,2) = peidui(i,2) + 1 ; 
        end
    end
    for q = 1:10
        if (peidui(i,:) == moban(q,:))
           result(i) = q-1; 
        end
    end
	
%%  对数字2、3、5进行细分
    if(result(i) == 5)
            for k =  int16(status(i).BoundingBox(1)-3):int16(status(i).BoundingBox(3)+status(i).BoundingBox(1)+3)
                if (im(x1,k) > 0 && im(x1,k+1) == 0 && k > y)
                    peidui235(1,1) = 1 ;
                end
                if (im(x2,k) > 0 && im(x2,k+1) == 0 && k > y)
                    peidui235(1,2) = 1 ;
                end
            end
            for z = 1:3
                if (peidui235(1,:) == moban235(z,1:2))
                    result(i) = moban235(z,3);
                end
            end
    end
end


%% 显示结果
result