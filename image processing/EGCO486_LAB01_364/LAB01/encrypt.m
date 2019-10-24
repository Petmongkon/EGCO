function  key = encrypt(pic)

natural=imread(pic);

key = randperm(256);

[x y z] = size(natural);
for i = 1 : x
    for j = 1 : y
        for k = 1 : z
            if(natural(i,j,k)==0)
                output(i,j,k)=key(256);
            else
                temp = natural(i,j,k);
                output(i,j,k)=key(temp);
            end
        end
    end
end
output1=uint8(output);
figure;
subplot(1,2,1);imshow(natural);
subplot(1,2,2);imshow(output1);


imwrite(output1,'output.bmp');


end
