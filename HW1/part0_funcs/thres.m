function thres(A, p)
    thres = 0.3;
    B = A;
    B = A > thres;
    f = figure;
    subplot(1,2,1), imshow(A);
    subplot(1,2,2), imshow(B);
    suptitle(p);
    
    filename = strcat('results/part0c_', p);
    saveas(f, filename);
end