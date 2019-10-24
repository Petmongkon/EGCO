function [eqimg] = Myhisteq ( img )

% historiginal=zeros(2,256);
%     for i = 1:256
%         historiginal(1,i)=i-1;
%         historiginal(2,i)=size(find(img==i-1),1);
%     end
[m,n,o]=size(img);
pixel = m*n;

freq=zeros(m,1);
prob=zeros(m,1);
probc=zeros(m,1);
cum=zeros(m,1);
output=zeros(m,1);

for i=1:m
    for j=1:n
        value=img(i,j);
        freq(value+1)=freq(value+1)+1;
        prob(value+1)=freq(value+1)/pixel;
    end
end

sum=0;

for i=1:size(prob)
    sum = sum+freq(i);
    cum(i) = sum;
    probc(i) = cum(i)/pixel;
    output(i) = round(probc(i)*255);
end

for i=1:m
    for j=1:n
        eqimg(i,j)=output(img(i,j)+1);
    end
end

% histeq=zeros(2,256);
%     for i = 1:256
%         histeq(1,i)=i-1;
%         histeq(2,i)=size(find(eqimg==i-1),1);
%     end


end