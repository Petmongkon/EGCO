img = imread('shape.bmp');
BW = ~imbinarize(img(:,:,1));
[B,L] = bwboundaries(BW, 'noholes');
STATS = regionprops(L, 'all');
figure,
imshow(img),
title('Results');
hold on
for x=1:length(STATS)
    [m,n]=size(STATS(x).Image);   
    if (abs(STATS(x).FilledArea - m*n) < 1 && abs(m-n) < 5)
        text( STATS(x).Centroid(1)-20, STATS(x).Centroid(2), 'Square');        
    elseif (abs(STATS(x).FilledArea - m*n) < 1 )
        text( STATS(x).Centroid(1)-30, STATS(x).Centroid(2), 'Rectangle');
    elseif (abs(STATS(x).FilledArea - pi*((m/2)^2)) < 6)
        text( STATS(x).Centroid(1)-15, STATS(x).Centroid(2), 'Circle');
    elseif (abs(STATS(x).FilledArea - pi*((m/2)*(n/2))) < 10)
        text( STATS(x).Centroid(1)-20, STATS(x).Centroid(2), 'Ellipse');
    else
        text( STATS(x).Centroid(1)-25, STATS(x).Centroid(2), 'Triangle');
    end
    
end


