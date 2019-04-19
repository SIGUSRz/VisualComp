function diff = NNpadding(seg)
    sz = size(seg);
    binimg = padarray(seg, [1, 1], 'replicate');

    diff1 = abs(binimg - circshift(binimg, [-1, -1]));
    diff2 = abs(binimg - circshift(binimg, [-1,  0]));
    diff3 = abs(binimg - circshift(binimg, [-1,  1]));
    diff4 = abs(binimg - circshift(binimg, [ 0, -1]));
    diff5 = abs(binimg - circshift(binimg, [ 0,  1]));
    diff6 = abs(binimg - circshift(binimg, [ 1, -1]));
    diff7 = abs(binimg - circshift(binimg, [ 1,  0]));
    diff8 = abs(binimg - circshift(binimg, [ 1,  1]));
    
    diff = diff1 + diff2 + diff3 + diff4 + diff5 + diff6 + diff7 + diff8;
    
    v = [2:sz(1)+1]; 
    diff = diff(v, v);
end