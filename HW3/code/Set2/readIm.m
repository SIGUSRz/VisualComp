function image = readIm(fileName)
    image = imread(fileName);
    image = im2double(image);
    image = single(rgb2gray(image));
%     figure
%     imshow(image)
end