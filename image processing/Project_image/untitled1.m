img=imread('can_new_01.jpg');
img2=imresize(img,[150,150]);
imwrite(img2,'can_with_bg.jpg');