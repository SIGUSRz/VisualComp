function original = part0(img_path)

    original = load_preprocess(img_path, '.jpg', 256);

    addpath('other_funcs');
    filenames = {'CARTOON.jpg', 'flowergray.jpg', 'kitty.jpg', 'polarcities.jpg', 'text.jpg'};

    thresh = {0.3, 0.1, 0.1, 0.2, 0.2};
    
    for i = 1:length(original)
        img = original{i};
        
        [gpy, dsp] = gpyramid(img, filenames{i});

        lpyramid(gpy, dsp, img, filenames{i});
        
        edge_detection(gpy, thresh{i}, filenames{i});
        
    end
end