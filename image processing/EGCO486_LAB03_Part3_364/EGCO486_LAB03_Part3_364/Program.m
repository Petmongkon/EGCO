img1=imread('eight_salt_pepper.tif');
output1=Mymed(img1,1);
figure;
subplot(2,2,1);imshow(img1);title('Input Image');
subplot(2,2,2);imshow(output1);title('Output Image');

img2=imread('eight_gaussian.tif');
output2=Myaver(img2,1);
figure;
subplot(2,2,1);imshow(img2);title('Input Image');
subplot(2,2,2);imshow(output2);title('Output Image');

img3=imread('aaa256.jpg');
[output3,HrOutput1,HcOutput1]=Mygrad(img3,1);
figure;
subplot(2,2,1);imshow(img3,[]);title('Input Image');
subplot(2,2,2);imshow(HcOutput1,[]);title('Output for Hr');
subplot(2,2,3);imshow(HrOutput1,[]);title('Output for Hc');
subplot(2,2,4);imshow(output3,[]);title('Output for Hc+Hr');

output4=MyLaplaNeg(img3,1);
figure;
subplot(2,2,1);imshow(img3,[]);title('Input Image');
subplot(2,2,2);imshow(output4,[]);title('Output Image for Laplacian');

img5=imread('blurry_moon.tif');
[output5,outputlapla]=EnhanLaplaNeg(img5,1);
figure;
subplot(2,2,1);imshow(img5);title('Input Image');
subplot(2,2,2);imshow(outputlapla,[]);title('Output Image for Laplacian');
subplot(2,2,3);imshow(output5,[]);title('Sharpened Image');
