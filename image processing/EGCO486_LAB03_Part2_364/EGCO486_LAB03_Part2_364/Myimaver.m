function [ output noise ] = Myimaver( img  )

sum=double(img);

for i =2 : 16
    pic=imread(['p',int2str(i),'.bmp']);
    sum=sum+double(pic);
end
output=uint8(sum/16);
noise=img-output;


end

