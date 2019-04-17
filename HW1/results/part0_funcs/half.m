function half(A, p)
    dimension = 100;
    v = 1:2:dimension;
    hf = A(v, v);
    f = figure;
    imshow(hf);
    title(p);
    
    filename = strcat('results/part0f_', p);
    saveas(f, filename);
end