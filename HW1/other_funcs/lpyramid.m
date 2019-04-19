function lpy = lpyramid(subsamples, blurs, p)
    size(subsamples)
    size(blurs)
    f = figure;
    lpy = {};
    for i = 1:length(blurs)
        
        %for j = 1:length(blurs{i})
        sz = size(blurs{i});
        a = subplot(2, 4, i);
        gray = mat2gray(blurs{i} - subsamples{i});
        lpy{end+1} = gray;
        imshow(gray);
    end
end      