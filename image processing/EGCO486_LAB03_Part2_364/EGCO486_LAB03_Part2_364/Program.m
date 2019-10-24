dark=imread('Dark256.tif');
low=imread('Low-contrast256.tif');

[historiginal eqimg histeq] = Myhisteq ( dark );
figure;
subplot(2,2,1);imshow(dark);title('Original image');
subplot(2,2,2);bar(historiginal(1,:),historiginal(2,:));title('Original histogram');
subplot(2,2,3);imshow(eqimg,[]);title('Equalized image');
subplot(2,2,4);bar(histeq(1,:),histeq(2,:));title('Equalized histogram');

[historiginal1 eqimg1 histeq1] = Myhisteq ( low );
figure;
subplot(2,2,1);imshow(low);title('Original image');
subplot(2,2,2);bar(historiginal1(1,:),historiginal1(2,:));title('Original histogram');
subplot(2,2,3);imshow(eqimg1,[]);title('Equalized image');
subplot(2,2,4);bar(histeq1(1,:),histeq1(2,:));title('Equalized histogram');


img=imread('p1.bmp');
[output noise]=Myimaver(img);
figure;
subplot(2,2,1);imshow(img);title('input');
subplot(2,2,2);imshow(output,[]);title('output');
subplot(2,2,3);imshow(noise);title('noise');