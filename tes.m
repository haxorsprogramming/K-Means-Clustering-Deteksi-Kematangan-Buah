% full_name = fullfile(image_folder, filenames(n).name);
foto = imread('dataset_buah_jeruk/jeruk1.jpg');
foto = (rgb2gray(foto));

p_total = 124;
l_total = 164;

P_satuan = 31;
L_satuan = 41;

for q = 1:L_satuan
    for w = q:P_satuan
        DAR(w,q) = foto(w,q);
    end
end
