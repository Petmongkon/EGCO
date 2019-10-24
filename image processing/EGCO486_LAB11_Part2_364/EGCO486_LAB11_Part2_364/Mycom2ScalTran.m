function output = Mycom2ScalTran(img, tx, ty, sx, sy)
    scale = Myscale(img, sx, sy);
    output = Mytranslate(scale, tx, ty);
end