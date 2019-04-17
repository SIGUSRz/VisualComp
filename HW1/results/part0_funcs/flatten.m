function flatten(A, p)
    dimension = 100;
    flatten = reshape(A, 1, dimension^2);
    f = figure;
    histogram(A, 32);
    title(p);
    
    filename = strcat('results/part0b_', p);
    saveas(f, filename);
end