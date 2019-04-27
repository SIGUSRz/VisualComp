function imgs = load_all(imgpath, names, print)
    imgs = {}; addpath(imgpath);

    for i=1:length(names)
        img = im2double(imread(names{i}));
        if length(size(img))==3
            img = rgb2gray(img);
        end
        imgs{end+1} = img;

        if print
            f = figure;
            imshow(img);
        end
    end
end