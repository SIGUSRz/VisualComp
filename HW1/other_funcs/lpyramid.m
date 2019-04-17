function lpyramid(Ps, Ds, img, p)
    f = figure;
    
    for i = 2:length(Ds)
        Li = Ds{i-1}-Ds{i};
        a = subplot(2, 4, i-1);
        imshow(Li);
    end
    suptitle(p);
    filename = strcat('results/part2_', p);
    saveas(f, filename);
end      