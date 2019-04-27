function processed = part2(img, ksize, sigma)

    f = figure;
    [imgM, imgP] = part1bstep3(img);

    % new_moonM = moonM;
    minM = min(imgM(:))
    maxM = max(imgM(:))
    avgM = mean(imgM(:))

    normZ = maxM - minM;

    filter = fspecial('gaussian', [ksize, ksize], sigma);

    shiftM = (imgM - minM)/normZ;

    alpha = shiftM;

    alpha = medfilt2(alpha);

    alphaS = size(alpha);
    alpha = padarray(alpha,[1, 1],'replicate');
    alpha = imfilter(alpha, filter, 'conv');
    alpha = alpha(2:alphaS(1)+1, 2:alphaS(2)+1);

    alpha = medfilt2(alpha);
    normA = max(alpha(:)) - min(alpha(:));
    alpha = alpha/normA;


    new_imgM = alpha * normZ + minM;

    new_img = ifft2(exp(new_imgM) .* exp(j * imgP));
    processed = real(new_img);


    f = figure;
    a = subplot(2, 2, 1);
    imshow(fftshift(alpha),[]);
    title('alpha');
    a = subplot(2, 2, 2);

    imshow(fftshift(new_imgM),[]);;
    title('new magnitude');


    f = figure;
    a = subplot(2, 2, 3);
    imshow(img);
    title('original');
    a = subplot(2, 2, 4);
    imshow(processed);
    title('ifft');

    f = figure;
    imshow(processed);
    title('result');
    
end