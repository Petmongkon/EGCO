    moon=imread('moon_dark.bmp');
 
    moon1=gray2ind(moon,256);
    moon2=gray2ind(moon,128);
    moon3=gray2ind(moon,64);
    moon4=gray2ind(moon,32);
    moon5=gray2ind(moon,16);
    moon6=gray2ind(moon,8);
    moon7=gray2ind(moon,4);
    moon8=gray2ind(moon,2);
    
    figure
    subplot(2,4,1);imshow(moon1,[]);title('256 grey level');
    subplot(2,4,2);imshow(moon2,[]);title('128 grey level');
    subplot(2,4,3);imshow(moon3,[]);title('64 grey level');
    subplot(2,4,4);imshow(moon4,[]);title('32 grey level');
    subplot(2,4,5);imshow(moon5,[]);title('16 grey level');
    subplot(2,4,6);imshow(moon6,[]);title('8 grey level');
    subplot(2,4,7);imshow(moon7,[]);title('4 grey level');
    subplot(2,4,8);imshow(moon8,[]);title('2 grey level');