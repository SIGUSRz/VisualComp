function imfilt(A, p)
    sz = size(A);
    f = figure;
    
    h1 = fspecial('gaussian', sz, sz(1)*0.01);
    subplot(1,3,1), imshow(imfilter(A, h1, 'full'));
    h2 = fspecial('gaussian', sz, sz(1)*0.05);
    subplot(1,3,2), imshow(imfilter(A, h2, 'full'));
    h3 = fspecial('gaussian', sz / 2, sz(1)*0.01);
    subplot(1,3,3), imshow(imfilter(A, h3, 'full'));
    suptitle(p);
    
    filename = strcat('results/part0g_', p);
    saveas(f, filename);
end
