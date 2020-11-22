clc; clear;
% full_name = fullfile(image_folder, filenames(n).name);
foto = imread('dataset_buah_jeruk/jeruk1.jpg');
foto = (rgb2gray(foto));

p_total = 124;
l_total = 164;

P_satuan = 31;
L_satuan = 41;

for q = 1 : L_satuan
    for w = 1 : P_satuan
        DAR(q,w) = foto(q,w);
    end
end

total = sum(DAR(:));
rata = total / 1271;
rata_bulat = round(rata);
HAS(1,1) = rata_bulat;

for q = (P_satuan + 1) : (P_satuan + 31)
   DAR(1,q) = foto(1,q);
end