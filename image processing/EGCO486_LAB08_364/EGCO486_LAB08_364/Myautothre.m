clear all;
img=double(imread('coins.bmp'))./255;
[m,n]=size(img);
X=Myimhist(img);
Y=X(2,:);
T=graythresh(Y);
t0=0;
predefine=0.1;

while abs(T-t0)>predefine
    t0=T;
    sumU1=0;
    sumU2=0;
    countU1=0;
    countU2=0;
    for i=1:m
        for j=1:n
            if(img(i,j)>T)
                sumU1=double(sumU1+img(i,j));
                countU1=countU1+1;
                output(i,j)=1;
            else
                sumU2=double(sumU2+img(i,j));
                countU2=countU2+1;
                output(i,j)=0;
            end
        end
    end
    u1=sumU1/countU1;
    u2=sumU2/countU2;
    T=(u1+u2)/2;
end
figure;
subplot(1,2,1);imshow(img,[]);title('input image');
subplot(1,2,2);imshow(output,[]);title('output image');