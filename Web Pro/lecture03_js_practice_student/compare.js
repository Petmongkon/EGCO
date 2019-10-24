function comparenum(x,y)
{   
    var numX=parseInt(x);
    var numY=parseInt(y);
    if(numX < numY)
    {
        document.getElementById("c").value = 'A<B';
    }
    else if (numX > numY)
    {
        document.getElementById("c").value = 'A>B';
    }
    else if (numX == numX)
    {
        document.getElementById("c").value = 'A=B';
    }
    document.getElementById("d").value = Math.abs(numX-numY);

}