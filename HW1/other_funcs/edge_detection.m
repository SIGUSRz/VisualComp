function edge_detection(Ps, thres, p)

    lap_ope = [-1/8 -1/8 -1/8; -1/8 1 -1/8; -1/8 -1/8 -1/8];
    box_ope = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
    f = figure;

    for i=1:length(Ps)
        sz = size(Ps{i});
        conved = padarray(Ps{i}, [1, 1], 'replicate');
        conved = imfilter(conved, lap_ope, 'same');
        v = [2:sz(1)+1]; 
        conved = conved(v, v);
        
        seg = conved > 0;
        
        zero_crossing = zeroCross(seg);
        
        local_var = stdfilt(Ps{i});
        
        outstanding = local_var > 0.00001;
        
        edges = zero_crossing & local_var;
        edges = uint8(255 - mat2gray(outstanding) * 255);
        a = subplot(3, 3, i);imshow(edges);
    end
    suptitle(p);
    filename = strcat('results/part3_', p);
    saveas(f, filename);
end