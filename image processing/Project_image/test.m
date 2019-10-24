I=imread('can_new_01.jpg');

figure, subplot(2,2,1),imshow(I);

threshold = graythresh(I);

bw1 = im2bw(I,threshold);
% bw1 = Mydilate(bw1);
% bw1 = Mydilate(bw1);
% bw1 = Mydilate(bw1);
% bw1 = Mydilate(bw1);
% bw1 = Mydilate(bw1);
% bw1 = Mydilate(bw1);
% bw1 = Mydilate(bw1);
% 


subplot(2,2,2), imshow(bw1);

bw2 = bwareaopen(bw1,30);

se = strel('disk',4);

bw3 = imtophat(bw2,se);

subplot(2,2,3),, imshow(bw3);

d = edge(bw3,'sobel');
% d = Mydilate(d);
% d = Mydilate(d);
% d = Mydilate(d);
% d = Mydilate(d);
% d = Mydilate(d);

subplot(2,2,4), imshow(d);