function [magnitude, phase] = part1bstep3(I)
    imgF = fft2(I);
    
    magnitude = log(abs(imgF));
    
    f = figure;
    a = subplot(1, 2, 1);
    imshow(fftshift(magnitude),[]);;
    title("magnitude of DFT");
    colormap('gray'); drawnow;
    
    a = subplot(1, 2, 2);
    copyF = imgF;
    copyF(magnitude<1e-6) = 0;
    phase = angle(copyF); 
    imshow(unwrap(fftshift(phase)), []);
    title("phase of DFT");
    colormap('gray'); drawnow;
    
    step3 = 0;
end