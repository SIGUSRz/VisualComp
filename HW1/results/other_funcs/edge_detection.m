function edge_detection(Ps, thres, p)

    lap_ope = [-1/8 -1/8 -1/8; -1/8 1 -1/8; -1/8 -1/8 -1/8];
    f = figure;

    for i=1:length(Ps)
        img = imfilter(Ps{i}, lap_ope, 'same');
        seg = img > 0;
        
        pos_im = img .* (seg > 0);
        
        diff1 = abs(seg - circshift(seg, [-1, -1]));
        diff2 = abs(seg - circshift(seg, [-1,  0]));
        diff3 = abs(seg - circshift(seg, [-1,  1]));
        diff4 = abs(seg - circshift(seg, [ 0, -1]));
        diff5 = abs(seg - circshift(seg, [ 0,  1]));
        diff6 = abs(seg - circshift(seg, [ 1, -1]));
        diff7 = abs(seg - circshift(seg, [ 1,  0]));
        diff8 = abs(seg - circshift(seg, [ 1,  1]));
        
        diff = diff1 + diff2 + diff3 + diff4 + diff5 + diff6 + diff7 + diff8;
         
        bindiff = seg .* (diff > 0);
        
        
        
        
        var1 = abs(pos_im - circshift(pos_im, [-1, -1]));
        var2 = abs(pos_im - circshift(pos_im, [-1,  0]));
        var3 = abs(pos_im - circshift(pos_im, [-1,  1]));
        var4 = abs(pos_im - circshift(pos_im, [ 0, -1]));
        var5 = abs(pos_im - circshift(pos_im, [ 0,  1]));
        var6 = abs(pos_im - circshift(pos_im, [ 1, -1]));
        var7 = abs(pos_im - circshift(pos_im, [ 1,  0]));
        var8 = abs(pos_im - circshift(pos_im, [ 1,  1]));
        var = var1 + var2 + var3 + var4 + var5 + var6 + var7 + var8;

        edges = (1-bindiff) .* (var > thres);
        a = subplot(3, 3, i);imshow(edges);
    end
    suptitle(p);
    filename = strcat('results/part3_', p);
    saveas(f, filename);
end