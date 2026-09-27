% Read the image
image = imread('/MATLAB Drive/‏لقطة الشاشة ١٤٤٥-١١-٠١ في ٩.٥٠.٣١ ص.png');

% Display the original image
subplot(1, 2, 1);
imshow(image);
title('Old');

% Aplay 
sharpened_Image = imsharpen(image,Radius=1.5,Amount=6);

% Display the processed image
subplot(1, 2, 2);
imshow(sharpened_Image);
title('New ');
