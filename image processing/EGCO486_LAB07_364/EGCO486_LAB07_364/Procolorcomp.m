function [ negativeR,negativeG,negativeB,negativeRGB ] = Procolorcomp( img )

    R=img(:,:,1);
    G=img(:,:,2);
    B=img(:,:,3);
    
    newR=Myneg(R);
    negativeR=cat(3,newR,G,B);
    
    newG=Myneg(G);
    negativeG=cat(3,R,newG,B);
    
    newB=Myneg(B);
    negativeB=cat(3,R,G,newB);
    
    negativeRGB=cat(3,newR,newG,newB);

end

