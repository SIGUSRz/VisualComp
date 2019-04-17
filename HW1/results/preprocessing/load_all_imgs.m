function allimgs = load_all_imgs(imgpath, suffix)

filepath = strcat(imgpath, '*');
filepath = strcat(filepath, suffix);
imgfiles = dir(filepath);

numfiles = length(imgfiles);
allimgs = cell(1, numfiles);

for k=1:numfiles
    filename = strcat(imgpath, imgfiles(k).name);
    allimgs{k} = imread(filename);
    
end

    %allimgs = preprocess(allimgs)

end
