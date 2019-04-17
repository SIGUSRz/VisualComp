function convolution(A, p)


    sz = size(A);
    f = figure;
    
    h1 = fspecial('gaussian', sz, sz(1)*0.01);
    subplot(1,3,1), imshow(conv2(A, h1));
    h2 = fspecial('gaussian', sz, sz(1)*0.05);
    subplot(1,3,2), imshow(conv2(A, h2));
    h3 = fspecial('gaussian', sz / 2, sz(1)*0.01);
    subplot(1,3,3), imshow(conv2(A, h3));
    suptitle(p);
    
    filename = strcat('results/part0h_', p);
    saveas(f, filename);
end
