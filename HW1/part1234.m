function original = part0(img_path)

    original = load_preprocess(img_path, '.jpg', 256);

    addpath('other_funcs');
    filenames = {'CARTOON.jpg', 'flowergray.jpg', 'kitty.jpg', 'polarcities.jpg', 'text.jpg'};

    thresh = {0.1, 0.02, 0.01, 0.00001, 0.1};
    
    lpyramids = {};
    
    for i =1:5 %length(original)
        img = original{i};
        
        [subsamples, org] = gpyramid(img, filenames{i});
               
        lpy = lpyramid(org, filenames{i});
        lpyramids{end+1} = lpy;      
%         
        edge_detection(org, thresh{i}, filenames{i});
    end
    
%     pairs = {[1, 2], [3, 4], [1, 5]};
%     length(pairs)
%     for i = 1:length(pairs)
%         pyramids = pairs{i}
%         lpy1 = lpyramids{pyramids(1)};
%         lpy2 = lpyramids{pyramids(2)};
%         mulres_spine(lpy1, lpy2);
%     end
%     
end