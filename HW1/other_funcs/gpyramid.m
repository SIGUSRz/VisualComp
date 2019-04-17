function [gpy, dsp] = gpyramid(I, p)
    h = fspecial('average', [2, 2]);
    img = I;
    sz = size(I);
    N = log2(sz(1));
    gpy = {};
    dsp = {};

    f = figure;
    a = subplot(3, 3, 1);
    imshow(img);
    gpy{end + 1} = img;
    dsp{end + 1} = img;

    for i = 1:N
        img = conv2(img, h, 'same');
        v = 1:2:sz(1);
        img = img(v, v);
        gpy{end + 1} = img;
        sz = size(img);

        int=imresize(img, [256, 256], 'bilinear');
        dsp{end + 1} = int;
        a = subplot(3, 3, i + 1);
        imshow(int);
    end
    suptitle(p);
    filename = strcat('results/part1_', p);
    saveas(f, filename);
end