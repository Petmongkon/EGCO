img1=imread('LAB5.tif');
output1=Myblf(img1,20,2);
figure;
subplot(1,2,1);imshow(img1,[]);title('input image');
subplot(1,2,2);imshow(output1,[]);title('output image');

output2=Myblfpad(img1,20,2);
figure;
subplot(1,2,1);imshow(img1,[]);title('input image');
subplot(1,2,2);imshow(output2,[]);title('output image');
