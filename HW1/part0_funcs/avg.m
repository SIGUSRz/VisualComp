function avg(A, p)
    B = A - mean(mean(A, 1), 2);
    B(B < 0.0) = 0.0;
    f = figure;
    imshow(B);
    title(p);
    
    filename = strcat('results/part0d_', p);
    saveas(f, filename);
end