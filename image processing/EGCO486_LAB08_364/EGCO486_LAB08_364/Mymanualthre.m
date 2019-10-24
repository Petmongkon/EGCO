clear;
img=imread('coins.bmp');
% hist=Myimhist(img);
% figure;
% imhist(img);
% figure;bar(hist(1,:),hist(2,:));title('histogram');
[m,n]=size(img);
for i=1:m
    for j=1:n   
        if(img(i,j)>80&&img(i,j)<=255)
            output(i,j)=255;
        else
            output(i,j)=img(i,j);
        end
    end
end

figure;
subplot(1,2,1);imshow(img,[]);title('input image');
subplot(1,2,2);imshow(output,[]);title('output image');
