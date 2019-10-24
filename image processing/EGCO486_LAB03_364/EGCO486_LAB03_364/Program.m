img1=imread('breast_digital_Xray.tif');
img2=imread('fractured_spine.tif');
img3=imread('washed_out_aerial_image.tif');
img4=imread('MRI.bmp');
img6=imread('100-dollars.tif');
img7=imread('cameraman.tif');

output1 = Myneg(img1);
figure;
subplot(1,2,1);imshow(img1);title('input image');
subplot(1,2,2);imshow(output1);title('output image');

output2 = Mypow(img2,1,0.4);
figure;
subplot(1,2,1);imshow(img2);title('input image');
subplot(1,2,2);imshow(output2);title('output image');

output3= Mypow(img3,1,3);
figure;
subplot(1,2,1);imshow(img3);title('input image');
subplot(1,2,2);imshow(output3);title('output image');

output4= Mygrayls(img4,1,100,140);
figure;
subplot(1,2,1);imshow(img4);title('input image');
subplot(1,2,2);imshow(output4);title('output image');

output5=Mygrayls(img4,2,100,140);
figure;
subplot(1,2,1);imshow(img4);title('input image');
subplot(1,2,2);imshow(output5);title('output image');

output6=Mybits(img6);
figure;
subplot(1,2,1);imshow(img6);title('input image');
subplot(1,2,2);imshow(output6);title('output image');

output7=Myimhist(img7);
figure;
subplot(1,2,1);imshow(img7);title('input image');
subplot(1,2,2);bar(output7(1,:),output7(2,:));title('histogram');

