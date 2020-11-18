% full_name = fullfile(image_folder, filenames(n).name);
foto = imread('dataset_buah_jeruk/jeruk1.jpg');
foto = (rgb2gray(foto));

panjang = 31;
lebar = 41;

P = 41;
L = 31;
pos_p = 1;
pos_l = 1;
total = 0;

for o = 1:4
    for r = o:4
        pos_x_p = 1;
        pos_x_l = 1;
        for n = pos_x_l:P
            for c = pos_x_p:L
            pix = foto(1,1);
            % disp(pix);
            HAS(n,c) = pix;
            P = P + 41;
            L = L + 31;
            end_p = p + (p + 41) - 1;
            end_l = l + (p + 31) - 1;
            end
        end
        
    end
end


    
nilaiHas = sum(HAS(:));
rataHas = round(nilaiHas / 1271);

disp(num2str(rataHas));