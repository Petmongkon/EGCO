img = imread('woman_blonde.tif');
figure
res = Propointsam(img);
subplot(1,2,1); imshow(img, []); title('input image');
subplot(1,2,2); imshow(res, []); title('output image');

figure
res = Prolocalaver(img);
subplot(1,2,1); imshow(img, []); title('input image');
subplot(1,2,2); imshow(res, []); title('output image');

figure
res = Propixelrep(img);
subplot(1,2,1); imshow(img, []); title('input image');
subplot(1,2,2); imshow(res, []); title('output image');

figure
res = Promidpoint(img);
subplot(1,2,1); imshow(img, []); title('input image');
subplot(1,2,2); imshow(res, []); title('output image');

figure
res = Pronearest(img, [450 250]);
subplot(2,2,1); imshow(img, []); title('input image');
subplot(2,2,2); imshow(res, []); title('output image');

figure
res = Probilinear(img, [250 450]);
subplot(1,2,1); imshow(img, []); title('input image');
subplot(1,2,2); imshow(res, []); title('output image');