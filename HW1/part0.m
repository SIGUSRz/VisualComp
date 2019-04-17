function original = part0(img_path)

    original = load_preprocess(img_path, '.jpg', 100);

    addpath('part0_funcs');
    filenames = {'CARTOON.jpg', 'flowergray.jpg', 'kitty.jpg', 'polarcities.jpg', 'text.jpg'};

    for i = 1:length(original)
        img = original{i};
        
        %part a
        sort_plot(img, filenames{i});
        
        %part b
        flatten(img, filenames{i});
        
        %part c
        thres(img, filenames{i});
        
        %part d
        avg(img, filenames{i});
        
        %part e
        if(i==1)
            part0_e()
        end
        
        %part f
        half(img, filenames{i});
        
        %part g
        imfilt(img, filenames{i});
        if(i==1)
            disp('DONT FORGET COMPARING IMGS')
        end
        
        %part h
        convolution(img, filenames{i});
        if(i==1)
            disp('DONT FORGET MENTIONING THE CHANGES')
        end
end