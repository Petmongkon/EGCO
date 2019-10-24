clear;
img=double(imread('kodim03.png'))./255;
img2=rgb2gray(img);
clusterImg=img2;
[m,n,o]=size(img);
k=4;
ncluster=(m*n)/k;
count=0;
b=1;
for i=1:m
    for j=1:n
        count=count+1;
        if(ncluster*b==count)
            b=b+1;
        end
        clusterImg(i,j)=b;
    end
end
arrMean=double(zeros([1,k]));
arrMeanTemp=[1:k];

while arrMean~=arrMeanTemp
    arrMeanTemp=arrMean;
    arrSum=double(zeros([1,k]));
    arrCount=double(zeros([1,k]));
    count=1;

    while count<=k
        for i=1:m
            for j=1:n
                if(clusterImg(i,j)==count)
                    arrSum(count)=arrSum(count)+img(i,j);
                    arrCount(count)=arrCount(count)+1;
                end
            end
        end
        if(arrCount(count)==0)
            arrMean(count)=0;
        else
            arrMean(count)=arrSum(count)/arrCount(count);
        end
        count=count+1;
    end
    

    for i=1:m
        for j=1:n
            count=1;
            while(count<=k)
               findgroup(count)=abs(arrMean(count)-img(i,j));
               count=count+1;
            end
               m=zeros([1,k]);
               newgroup=min(findgroup(findgroup>0));
               m=find(findgroup==newgroup);
               if(size(m)>1)
                   clusterImg(i,j)=m(1);
               else
                   clusterImg(i,j)=m(1);
               end
        end
    end
end
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
for i=1:k
    R(clusterImg == i) = mean(mean(R(clusterImg == i)));
    G(clusterImg == i) = mean(mean(G(clusterImg == i)));
    B(clusterImg == i) = mean(mean(B(clusterImg == i)));
end
clusterImg = cat(3, R, G, B);
figure;
subplot(1,2,1);imshow(img,[]);title('input image');
subplot(1,2,2);imshow(clusterImg,[]);title('output image');