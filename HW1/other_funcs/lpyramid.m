function lpy = lpyramid(subsamples, blurs, p)
    f = figure;
    lpy = {};
    for i = 1:length(blurs)
        sz = size(subsamples{i});
        a = subplot(2, 4, i);
        %gray = subsamples{i} - blurs{i};
        gray = subsamples{i} - imresize(subsamples{i+1}, sz, 'nearest');
        
        lpy{end+1} = gray;
        imshow(gray);
    end
    suptitle(p);
    filename = strcat('results/part2_', p);
    saveas(f, filename);
    
    lpy{end+1} = subsamples{end};
end      