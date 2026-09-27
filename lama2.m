% Read the image
original_image = imread('/MATLAB Drive/‏لقطة الشاشة ١٤٤٥-١١-٠١ في ١٢.٠١.٥١ م.png');

% Display the original 
subplot(1, 2, 1);
imshow(original_image);
title('Old');

% Convert the original image to double format
original_image_double = im2double(original_image);

% Define lower and upper percentiles for contrast 
lowerPercentile = 0.9;
highPercentile = 100;

% Compute the intensity limits for contrast stretching
limits = stretchlim(original_image, [lowerPercentile/100, highPercentile/100]);

% Apply contrast stretching to restore image contrast
restoredImage = imadjust(original_image, limits, []);

% Define gamma value for gamma correction  Apply gamma correction 
gamma = 0.4;
enhancedImage = imadjust(restoredImage, [], [], gamma);

% Display the new image
subplot(1, 2, 2);
imshow(enhancedImage);
title('New');
