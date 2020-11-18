image_folder = 'dataset_4';
filenames = dir(fullfile(image_folder, '*.jpg'));
total_images = numel(filenames);
ciri_database = zeros(total_images,6);

for n = 1:total_images
    
    full_name = fullfile(image_folder, filenames(n).name);
    foto = imread(full_name);
    foto = (rgb2gray(foto));
    s = 4;
    for c = 1:s
        for k = 1:s
            A(c,k) = foto(c,k); 
        end
    end
    
    maxA = max(A(:));
    minB = min(A(:));
    hasil = (maxA + minB) / 2;
    HASIL(n,1) = hasil;
    % disp(hasil);
    % subplot(1,3,1), imshow(foto), title('Nilai pixel');
    % thisIntensity = foto(2,2);
    % disp(thisIntensity);
end

% foto = imread('dataset_4/jeruk1.jpg');
% foto = (rgb2gray(foto));


save ciri_gray HASIL












