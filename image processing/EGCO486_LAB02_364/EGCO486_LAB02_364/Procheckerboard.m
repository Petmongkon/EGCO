    moon = imread('moon_dark.bmp')
    output1=imresize(moon,0.5);
    output2=imresize(moon,0.25);
    output3=imresize(moon,0.125);
    output4=imresize(moon,0.0625);
    output5=imresize(moon,0.03125);
    figure;
    subplot(2,3,1);imshow(moon);title('1024*1024');
    subplot(2,3,2);imshow(output1);title('512*512');
    subplot(2,3,3);imshow(output2);title('256*256');
    subplot(2,3,4);imshow(output3);title('128*128');
    subplot(2,3,5);imshow(output4);title('64*64');
    subplot(2,3,6);imshow(output5);title('32*32');