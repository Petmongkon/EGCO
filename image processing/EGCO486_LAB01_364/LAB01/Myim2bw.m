function Myim2bw
%MYIM2BW Summary of this function goes here
%   Detailed explanation goes here

camera = imread('cameraman.tif');
minimum=min(camera(:));
maximum=max(camera(:));
med=(minimum+maximum)./2;
[rows col] = size(camera);

for i=1:rows
    for j=1:col
        if camera(i,j)>=med
            camera1(i,j)=1;
        else
            camera1(i,j)=0;
        end
    end
end

figure;
subplot(1,2,1); imshow(camera); title('input image');
subplot(1,2,2); imshow(camera1);title('output image');


end

