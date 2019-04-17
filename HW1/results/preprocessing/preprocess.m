function preprocessed = preprocess(allimgs, size)

numimages = length(allimgs);
preprocessed = cell(1, numimages);

for k=1:numimages
    preprocessed{k} = imresize(im2double(allimgs{k}), [size, size]);
end

end
