function [originals, masks] = loadimages(imgpath, suffix)

    filepath = strcat(imgpath, '*', suffix);
    imgfiles = dir(filepath);

    numfiles = length(imgfiles);
    originals = [];
    masks = [];

    for k=1:numfiles/2
        % for images
        idx = k *2 - 1;
        filename = strcat(imgpath, imgfiles(idx).name);
        disp(filename);
        single = im2double(rgb2gray(imread(filename)));
        single = reshape(single, [1, size(single)]);
        originals = [originals; single];

        % for masks
        idx = idx + 1;
        filename = strcat(imgpath, imgfiles(idx).name);
        single = im2bw(rgb2gray(imread(filename)));
        disp(filename);
        single = reshape(single, [1, size(single)]);
        masks = [masks; single];
    end

    masks = logical(masks);

    clear single
end
