function edge_detection(Ps, thres, p)

    lap_ope = [-1/8 -1/8 -1/8; -1/8 1 -1/8; -1/8 -1/8 -1/8];
    f = figure;

    for i=1:length(Ps)
        sz = size(Ps{i});
        img = padarray(Ps{i}, [1, 1], 'replicate');
        img = imfilter(img, lap_ope, 'same');
        v = [2:sz(1)+1]; 


        img = img(v, v);
        
        seg = img > 0;
        
        pos_im = img .* (seg > 0);
        
        
        diff = NNpadding(pos_im);
         
        bindiff = seg .* (diff > 0);
        
        var = NNpadding(pos_im);

        edges = (1-bindiff) .* (var > thres);
        a = subplot(3, 3, i);imshow(edges);
    end
    suptitle(p);
    filename = strcat('results/part3_', p);
    saveas(f, filename);
end