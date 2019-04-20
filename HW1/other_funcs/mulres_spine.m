function mulres_spine(lpy1, lpy2, p)
    mask = cat(2, ones([256, 127]), zeros(256, 129));
    size(mask)
    [subsamples, blurs] = gpyramid(mask, 'filter gpyramid');

    sumLS = zeros([256, 256]);
    f = figure;
    length(subsamples)
    
    for level=1:length(lpy1)
        GR = subsamples{level};
        LS = GR.*lpy1{level} + (1 - GR).*lpy2{level};
        a = subplot(3, 3, level); 
        imshow(LS);
        
        
        sumLS = sumLS + imresize(LS, [256, 256], 'bilinear');
    end
    
    f = figure;
    imshow(sumLS)
    filename = strcat('results/part4_', p);
    saveas(f, filename);
    
        

    
    
end