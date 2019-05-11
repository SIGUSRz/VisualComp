function [subsample, original] = gpyramid(I, p)
    h = fspecial('average', [2, 2]);
    img = I;
    sz = size(I);
    sz = sz(1);
    N = log2(sz(1));
    original = {};
    subsample = {};

    f = figure;
    a = subplot(3, 3, 1);
    imshow(img);
    subsample{end + 1} = img;
    original{end + 1} = img;
    
    for i = 1:N
        
        img = padarray(img, [1, 1], 'replicate');
        img = imfilter(img, h, 'conv');
        v = [2:sz+1];        
        img = img(v, v);
        
        
        v = 1:2:sz(1);
        img = img(v, v);
        subsample{end + 1} = img;
        sz = size(img);
        sz = sz(1);
        % Interpolation function does not work for single pixel
        int=imresize(img, [256, 256], 'bilinear');
        a = subplot(3, 3, i + 1);
        imshow(int);
        
        original{end + 1} = int;

    end
    suptitle(p);
end