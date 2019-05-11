function lpy = lpyramid(original, p)
    f = figure;
    lpy = {};
    
    for i = 1:length(original)-1
        a = subplot(3, 3, i);
        gray = mat2gray(original{i} - original{i+1});
        lpy{end+1} = gray;
        imshow(uint8(gray*225));
    end
    i = length(original);
    lpy{end+1} = original{i};
    a = subplot(3, 3, i);
    imshow(uint8(original{i}*225));
end      