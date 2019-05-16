function calibtest(originals, i)
    filename = strcat("part2/calib", num2str(i), ".mat");
    load(filename);
    img = singlePic(originals, i);
    fig = figure;
    imshow(img);
    hold on;
    scatter(x, y);
    drawnow;
end