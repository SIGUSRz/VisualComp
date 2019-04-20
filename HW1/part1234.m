function original = part0(img_path)

    original = load_preprocess(img_path, '.jpg', 256);

    addpath('other_funcs');
    filenames = {'CARTOON.jpg', 'flowergray.jpg', 'kitty.jpg', 'polarcities.jpg', 'text.jpg'};

    thresh = {0.3, 0.1, 0.1, 0.2, 0.2};
    
    lpyramids = {};
    
    for i = 1:length(original)
        img = original{i};
        
        [subsamples, blurs] = gpyramid(img, filenames{i});
               
        lpy = lpyramid(subsamples, blurs, filenames{i});
        lpyramids{end+1} = lpy;      
        
        edge_detection(subsamples, thresh{i}, filenames{i});
    end
    
    pairs = {[1, 3], [3, 5], [5, 1]};
    length(pairs)
    for i = 1:length(pairs)
        pyramids = pairs{i}
        lpy1 = lpyramids{pyramids(1)};
        lpy2 = lpyramids{pyramids(2)};
        file = strcat(int2str(pyramids(1)), '_', int2str(pyramids(2)), '.jpg') 
        mulres_spine(lpy1, lpy2, file);
    end
%     
end