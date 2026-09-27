folder = '/MATLAB Drive/project/images';

fileList = dir(fullfile(folder, '*.jpg'));

maxNumImages = 2;

for i = 1:min(numel(fileList), maxNumImages)
    filename = fullfile(folder, fileList(i).name);
    image = imread(filename);

    figure('Position', [200, 200, 800, 600]);

    subplot(1, 3, 1);
    imshow(image);
    title('Original image', 'FontSize', 6);
    
    image1 = im2double(image);
    
    radius = 5;
    amount = 1.5;
    enhanced1 = imsharpen(image1, 'Radius', radius, 'Amount', amount);
    
    subplot(1, 3, 2);
    imshow(enhanced1);
    title('Image Sharpening', 'FontSize', 6);
    
    image2 = im2double(image);
    
    low_in = 0.1;
    high_in = 0.9;
    enhanced2 = imadjust(image2, stretchlim(image2, [low_in, high_in]), []);
    
    subplot(1, 3, 3);
    imshow(enhanced2);
    title('Contrast Stretching', 'FontSize', 6);
end