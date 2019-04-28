function conved = myconv(img, kernel, ks)
    pad = ks;
    imgS = size(img);
    alpha = padarray(img,[pad, pad],'replicate');
    alpha = imfilter(alpha, kernel, 'conv');
    conved = alpha(1+pad:imgS(1)+pad, 1+pad:imgS(2)+pad);
end