function [magnitude, phase] = part1bstep3(I)
    imgF = fft2(I);
    
    magnitude = abs(fftshift(imgF));
    
    f = figure;
    a = subplot(1, 2, 1);
    imshow(magnitude,[]);;
    title("magnitude of DFT");
    colormap('gray'); drawnow;
    
    a = subplot(1, 2, 2);
    copyF = imgF;
    copyF(magnitude<1e-6) = 0;
    phase = unwrap(fftshift(angle(copyF))); 
    imshow(phase, []);
    title("phase of DFT");
    colormap('gray'); drawnow;
    
    step3 = 0;
end