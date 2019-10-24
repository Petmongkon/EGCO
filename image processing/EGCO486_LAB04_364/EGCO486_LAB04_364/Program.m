img1=imread('eight_g.tif');
img2=imread('aaa256.jpg');

output1 = Myblf(img1,30,2);
figure;
subplot(1,2,1);imshow(img1,[]);title('Input Image');
subplot(1,2,2);imshow(output1,[]);title('Output Image');

output2 = Myglf(img1,30);
figure;
subplot(1,2,1);imshow(img1,[]);title('Input Image');
subplot(1,2,2);imshow(output2,[]);title('Output Image');

output3 = Mybhf(img2,80,2);
figure;
subplot(1,2,1);imshow(img2,[]);title('Input Image');
subplot(1,2,2);imshow(output3,[]);title('Output Image');

output4 = Myghf(img2,80);
figure;
subplot(1,2,1);imshow(img2,[]);title('Input Image');
subplot(1,2,2);imshow(output4,[]);title('Output Image');