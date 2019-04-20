function [subsample, blur] = gpyramid(I, p)
    h = fspecial('average', [2, 2]);
    img = I;
    sz = size(I);
    z = sz(1);
    N = log2(sz(1));
    blur = {};
    subsample = {};

    f = figure;
    a = subplot(3, 3, 1);
    imshow(img);
    subsample{end + 1} = img;
    
    for i = 1:N
        img = padarray(img, [1, 1], 'replicate');
        img = imfilter(img, h, 'conv');
        v = [2:sz(1)+1];
        img = img(v, v);
        
        blur{end + 1} = img;
        v = 1:2:sz(1);
        img = img(v, v);
        subsample{end + 1} = img;
        sz = size(img);
        if sz(1) > 1
            [X, Y] = meshgrid(1:sz(1));
            [Xq, Yq] = meshgrid(1:((sz(1) - 1.) / z):sz(1));
            Xq = Xq(1:size(Xq) - 1, 1:size(Xq) - 1);
            Yq = Yq(1:size(Yq) - 1, 1:size(Yq) - 1);
            int = interp2(X, Y, img, Xq, Yq);
            a = subplot(3, 3, i + 1);
            imshow(int);
        else
            % Interpolation function does not work for single pixel
            int=imresize(img, [256, 256], 'bilinear');
            a = subplot(3, 3, i + 1);
            imshow(int);
        end
    end
    suptitle(p);
    filename = strcat('results/part1_', p);
    saveas(f, filename);
end