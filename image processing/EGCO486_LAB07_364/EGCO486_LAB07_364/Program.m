imgDog=imread('PuppyWithBall.jpg');
imgBad=imread('badexposure.jpg');
imgBoy=imread('twin_boys_g.tif');
imgBoy2=imread('twin_boys_sp.tif');
imgBird=imread('kodim23.jpg');
imgflower=imread('flower_blurry.tif');
[histRGB,histY,histI]=Procolorhist(imgBad);
figure;
subplot(2,2,1);imshow(imgBad,[]);title('Input Image');
subplot(2,2,2);imshow(histRGB,[]);title('Histogram equalization on RGB');
subplot(2,2,3);imshow(histY,[]);title('Histogram equalization on Y (YCbCr)');
subplot(2,2,4);imshow(histI,[]);title('Histogram equalization on I (HSI)');


[averRGB,averY,averI]=Procoloraver(imgBoy);
figure;
subplot(2,2,1);imshow(imgBoy,[]);title('Input Image');
subplot(2,2,2);imshow(averRGB,[]);title('Performed average filter on RGB');
subplot(2,2,3);imshow(averY,[]);title('Performed average filter on Y (YCbCr)');
subplot(2,2,4);imshow(averI,[]);title('Performed average filter on I (HSI)');

[medRGB,medY,medI]=Procolormedian(imgBoy2);
figure;
subplot(2,2,1);imshow(imgBoy2,[]);title('Input Image');
subplot(2,2,2);imshow(medRGB,[]);title('Performed median filter on RGB');
subplot(2,2,3);imshow(medY,[]);title('Performed median filter on Y (YCbCr)');
subplot(2,2,4);imshow(medI,[]);title('Performed median filter on I (HSI)');

[negativeR,negativeG,negativeB,negativeRGB]=Procolorcomp(imgBird);
figure;
subplot(2,2,1);imshow(negativeR,[]);title('Negative R component');
subplot(2,2,2);imshow(negativeG,[]);title('Negative G component');
subplot(2,2,3);imshow(negativeB,[]);title('Negative B component');
subplot(2,2,4);imshow(negativeRGB,[]);title('Negative all component');


[laplaRGB,laplaY,laplaI]=Procolorsharpen(imgflower);
figure;
subplot(2,2,1);imshow(imgflower,[]);title('Input Image');
subplot(2,2,2);imshow(laplaRGB,[]);title('Laplacian filter on RGB');
subplot(2,2,3);imshow(laplaY,[]);title('Laplacian filter on Y (YCbCr)');
subplot(2,2,4);imshow(laplaI,[]);title('Laplacian filter on I (HSI)');

outputBall=Procolorseg(imgDog);
figure;
subplot(1,2,1);imshow(imgDog,[]);title('Input Image');
subplot(1,2,2);imshow(outputBall,[]);title('Output Image');
