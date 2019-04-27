function img = load_and_resize(imgpath, name, sz, print)
    addpath(imgpath);
    img = im2double(imread(strcat(name, '.jpg')));
    img = imresize(img, [sz, sz]);
    
    if print
        imshow(img);
    end
end