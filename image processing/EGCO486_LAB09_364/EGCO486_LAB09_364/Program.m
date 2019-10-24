img1=imread('text_image.tif');
output1=Myerosion(img1);
figure;
subplot(2,1,1);imshow(img1,[]);title('input image');
subplot(2,1,2);imshow(output1,[]);title('output image');

img2=imread('text-gaps_1_pixel.tif');
output2=Mydilate(img2);
figure;
subplot(2,1,1);imshow(img2,[]);title('input image');
subplot(2,1,2);imshow(output2,[]);title('output image');

img3=imread('noisy_fingerprint.tif');
[output3,output4]=Myopening(img3);
figure;
subplot(2,2,1);imshow(img3,[]);title('input image');
subplot(2,2,2);imshow(output3,[]);title('eroded image');
subplot(2,2,3);imshow(output4,[]);title('opening image');

[output5,output6]=Myclosing(output4);
figure;
subplot(2,2,1);imshow(output4,[]);title('opened image');
subplot(2,2,2);imshow(output5,[]);title('dilate image');
subplot(2,2,3);imshow(output6,[]);title('closing image');