function img = load_and_resize(imgpath, name, sfx, sz, print)
    addpath(imgpath);
    img = im2double(rgb2gray(imread(strcat(name, sfx))));
    img = imresize(img, [sz, sz]);
    
    if print
        imshow(img);
    end
end