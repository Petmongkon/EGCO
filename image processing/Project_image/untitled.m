clear all;
bot = imread('bottle_new_01.jpg');
pic = rgb2gray(bot);
[x,y] = size(pic);
for i=1:x
    for j=1:y
        if pic(i,j) <= 65
           newpic(i,j) = 0; 
        else
           newpic(i,j) = 255;
            
        end
    end
end
subplot(2,2,1);
imshow(bot);
subplot(2,2,2);
imshow(pic);
subplot(2,2,3);
imshow(newpic);
subplot(2,2,4);