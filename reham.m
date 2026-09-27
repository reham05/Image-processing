clc;
clear;
close all;

% Load image
I = imread('BO.jpg');
if numel(size(I)) > 2
    Im = rgb2gray(I);
else
    Im = I; % Image is already grayscale
end
 
noisy = imnoise(Im, 'salt & pepper', 0.01);
 
[m, n] = size(noisy);
 
output = zeros(m, n);
output = uint8(output);
 
for i = 1:m
    for j = 1:n  
        xmin = max(1, i - 1); 
        xmax = min(m, i + 1);
        ymin = max(1, j - 1);
        ymax = min(n, j + 1);
        temp = noisy(xmin:xmax, ymin:ymax);
        output(i, j) = median(temp(:));
    end
end
 
figure(1);
set(gcf, 'Position', get(0, 'ScreenSize'));
subplot(131), imshow(I), title('Original Image');
subplot(132), imshow(output), title('Output of Median Filter');
