clear all,clc
    im = 'can_new_01.jpg';
    pic = imread(im);
    pic = imresize(pic,[150,150]);
    [x,y,z] = size(pic);
    origin = pic;
    pic = rgb2gray(pic);
    for i=1:x
        for j=1:y
            if pic(i,j) < 70
                newpic(i,j) = 0;
            else
                newpic(i,j) = 255;
            end
        end
    end
    newpic = Mydilate(newpic);
    newpic = imfill(newpic,'holes');
    
          boundary = edge(newpic,'Roberts','nothinning');
          boundary = boundary*255;
          newpic1 = uint8(boundary);
          newpic1 = imfill(newpic1,'holes');
          newpic1 = im2uint8(newpic1);
          newpic1 = newpic1*255;
          for i=1:3
            newpic1 = Mydilate(newpic1);
          end
          [label,num] = bwlabel(newpic1);
     blob1 = regionprops(label,...
                         'Perimeter','Area','FilledArea','Solidity','Centroid');
            ct = [blob1.Centroid];
            ct;