function zero_crossing = zeroCross(seg)
    sz = size(seg);
    sz = sz(1);
    
    input = padarray(seg, [1, 1], 'replicate');
    
    diff1 = abs(input - circshift(input, [-1, -1]));
    diff2 = abs(input - circshift(input, [-1,  0]));
    diff3 = abs(input - circshift(input, [-1,  1]));
    diff4 = abs(input - circshift(input, [ 0, -1]));
    diff5 = abs(input - circshift(input, [ 0,  1]));
    diff6 = abs(input - circshift(input, [ 1, -1]));
    diff7 = abs(input - circshift(input, [ 1,  0]));
    diff8 = abs(input - circshift(input, [ 1,  1]));
    
    sumdiff = diff1 + diff2 + diff3 + diff4 + diff5 + diff6 + diff7 + diff8;
    v = [2:sz(1)+1]; 
    sumdiff = sumdiff(v, v);
    zero_crossing = sumdiff > 0;
    
end