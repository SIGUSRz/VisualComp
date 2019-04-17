function sort_plot(A, p)
    dimension = 100;
    flatten = reshape(A, 1, dimension^2);
    sorted = sort(flatten);
    x = 1:dimension^2;
    f = figure;
    plot(x(1:length(sorted)), sorted(1:length(sorted)),'-');
    title(p);
    
    filename = strcat('results/part0a_', p);
    saveas(f, filename);
end