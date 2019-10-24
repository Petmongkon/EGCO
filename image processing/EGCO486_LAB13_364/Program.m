% img=imread('cameraman.tif');
% tem=imread('template.bmp');
% output=Mytemcorr(img,tem);
% figure;
% subplot(2,2,1);imshow(img,[]);title('Original Image');
% subplot(2,2,2);imshow(tem,[]);title('Template');
% subplot(2,2,3);imshow(output,[]);title('Matching result using correlation');

p1=imread('P1.bmp');
p2=imread('P2.bmp');
output1=Propanotemcorr(p1,p2);
figure;
subplot(2,2,1);imshow(p1,[]);title('First Image');
subplot(2,2,2);imshow(p2,[]);title('Second Image');
subplot(2,2,3);imshow(output1,[]);title('Panorama Image');
