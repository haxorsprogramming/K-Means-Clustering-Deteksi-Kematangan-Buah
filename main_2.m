function varargout = main_2(varargin)
% MAIN_2 MATLAB code for main_2.fig
%      MAIN_2, by itself, creates a new MAIN_2 or raises the existing
%      singleton*.
%
%      H = MAIN_2 returns the handle to a new MAIN_2 or the handle to
%      the existing singleton*.
%
%      MAIN_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_2.M with the given input arguments.
%
%      MAIN_2('Property','Value',...) creates a new MAIN_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_2

% Last Modified by GUIDE v2.5 25-Nov-2020 03:08:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_2_OpeningFcn, ...
                   'gui_OutputFcn',  @main_2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main_2 is made visible.
function main_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_2 (see VARARGIN)

% Choose default command line output for main_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_input_citra_1.
function btn_input_citra_1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_input_citra_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning('off');
% citra 1
% -> input citra
[filename,pathname] = uigetfile('*.jpg');
img_input_1 = imread(fullfile(pathname,filename));
% -> set gambar input original ke axes
axes(handles.img_original_1);
imshow(img_input_1);
title('Citra original');
% -> ubah gambar ke grayscale
img_gray_1 = rgb2gray(img_input_1);
% -> set gambar grayscale ke axes
axes(handles.img_grayscale_1);
imshow(img_gray_1);
title('Citra grayscale');

% -> tentukan jumlah class
numberOfClasses = 2;
indexes = kmeans(img_gray_1(:), numberOfClasses);
classImage = reshape(indexes, size(img_gray_1));
 
% h = subplot(2, 2, 3);
axes(handles.img_seg_1);
imshow(classImage, []);
title('Citra biner');
% colormap(h,parula);
class = zeros(size(img_gray_1));
area = zeros(numberOfClasses, 1);
 
for n = 1:numberOfClasses
    class(:,:,n) = classImage == n;
    area(n) = sum(sum(class(:,:,n)));
end
 
[~,min_area] = min(area);
 
object = classImage==min_area;
bw = medfilt2(object,[5 5]);
bw = bwareaopen(bw, 5000);
s = regionprops(bw,'BoundingBox');
bbox = cat(1, s.BoundingBox);
RGB = insertShape(img_input_1, 'FilledRectangle', bbox, 'Color', 'yellow', 'Opacity', 0.3);
RGB = insertObjectAnnotation(RGB, 'rectangle', bbox, '','TextBoxOpacity', 0.9, 'FontSize', 11);
axes(handles.img_dec_1);
imshow(RGB);
title('Citra segmentasi');

% clusterisasi 
img_clus_1 = imresize(img_gray_1, [4 4]);
axes(handles.citra_clus_1);
imshow(img_clus_1);
title('Citra clustering');
handles.np1 = img_clus_1;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
clc;clear;



% --- Executes on button press in btn_input_citra_2.
function btn_input_citra_2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_input_citra_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning('off');
% citra 2
% -> input citra
[filename,pathname] = uigetfile('*.jpg');
img_input_2 = imread(fullfile(pathname,filename));
% -> set gambar input original ke axes
axes(handles.img_original_2);
imshow(img_input_2);
title('Citra original');
% -> ubah gambar ke grayscale
img_gray_2 = rgb2gray(img_input_2);
% -> set gambar grayscale ke axes
axes(handles.img_grayscale_2);
imshow(img_gray_2);
title('Citra grayscale');

% -> tentukan jumlah class
numberOfClasses = 2;
indexes = kmeans(img_gray_2(:), numberOfClasses);
classImage = reshape(indexes, size(img_gray_2));
 
% h = subplot(2, 2, 3);
axes(handles.img_seg_2);
imshow(classImage, []);
title('Citra biner');
% colormap(h,parula);
class = zeros(size(img_gray_2));
area = zeros(numberOfClasses, 1);
 
for n = 1:numberOfClasses
    class(:,:,n) = classImage == n;
    area(n) = sum(sum(class(:,:,n)));
end
 
[~,min_area] = min(area);
 
object = classImage==min_area;
bw = medfilt2(object,[5 5]);
bw = bwareaopen(bw, 5000);
s = regionprops(bw,'BoundingBox');
bbox = cat(1, s.BoundingBox);
RGB = insertShape(img_input_2, 'FilledRectangle', bbox, 'Color', 'yellow', 'Opacity', 0.3);
RGB = insertObjectAnnotation(RGB, 'rectangle', bbox, '','TextBoxOpacity', 0.9, 'FontSize', 11);
axes(handles.img_dec_2);
imshow(RGB);
title('Citra segmentasi');

% clusterisasi 
img_clus_2 = imresize(img_gray_2, [4 4]);
axes(handles.citra_clus_2);
imshow(img_clus_2);
title('Citra clustering');
handles.np2 = img_clus_2;
guidata(hObject, handles);

% --- Executes on button press in btn_input_citra_3.
function btn_input_citra_3_Callback(hObject, eventdata, handles)
% hObject    handle to btn_input_citra_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnProses.
function btnProses_Callback(hObject, eventdata, handles)
% hObject    handle to btnProses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% pertama 
np1 = handles.np1;
m1 = max(np1(:));
k1 = min(np1(:));
fnx_1 = (m1 + k1) / 2;
mts1 = int2str(fnx_1);
cp1 = 'T = ';
fincap1 = strcat(cp1, mts1);
set(handles.txt_t_1, 'String', fincap1);
if fnx_1 < 127
    set(handles.txt_hasil_1, 'String', 'Mentah');
    handles.nf1 = 0;
else
    set(handles.txt_hasil_1, 'String', 'Matang');
    handles.nf1 = 1;
end

% kedua
np2 = handles.np2;
m2 = max(np2(:));
k2 = min(np2(:));
fnx_2 = (m2 + k2) / 2;
mts2 = int2str(fnx_2);
cp2 = 'T = ';
fincap2 = strcat(cp2, mts2);
set(handles.txt_t_2, 'String', fincap2);
if fnx_2 < 127
    set(handles.txt_hasil_2, 'String', 'Mentah');
    handles.nf2 = 0;
else
    set(handles.txt_hasil_2, 'String', 'Matang');
    handles.nf2 = 1;
end

% ketiga
np3 = handles.np3;
m3 = max(np3(:));
k3 = min(np3(:));
fnx_3 = (m3 + k3) / 2;
mts3 = int2str(fnx_3);
cp3 = 'T = ';
fincap3 = strcat(cp3, mts3);
set(handles.txt_t_3, 'String', fincap3);
if fnx_3 < 127
    set(handles.txt_hasil_3, 'String', 'Mentah');
    handles.nf3 = 0;
else
    set(handles.txt_hasil_3, 'String', 'Matang');
    handles.nf3 = 1;
end

% keempat
np4 = handles.np4;
m4 = max(np4(:));
k4 = min(np4(:));
fnx_4 = (m4 + k4) / 2;
mts4 = int2str(fnx_4);
cp4 = 'T = ';
fincap4 = strcat(cp4, mts4);
set(handles.txt_t_4, 'String', fincap4);
if fnx_4 < 127
    set(handles.txt_hasil_4, 'String', 'Mentah');
    handles.nf4 = 0;
else
    set(handles.txt_hasil_4, 'String', 'Matang');
    handles.nf4 = 1;
end

% kelima
np5 = handles.np5;
m5 = max(np5(:));
k5 = min(np5(:));
fnx_5 = (m5 + k5) / 2;
mts5 = int2str(fnx_5);
cp5 = 'T = ';
fincap5 = strcat(cp5, mts5);
set(handles.txt_t_5, 'String', fincap5);
if fnx_5 < 127
    set(handles.txt_hasil_5, 'String', 'Mentah');
    handles.nf5 = 0;
else
    set(handles.txt_hasil_5, 'String', 'Matang');
    handles.nf5 = 1;
end

% kedua
np6 = handles.np6;
m6 = max(np6(:));
k6 = min(np6(:));
fnx_6 = (m6 + k6) / 2;
mts6 = int2str(fnx_6);
cp6 = 'T = ';
fincap6 = strcat(cp6, mts6);
set(handles.txt_t_6, 'String', fincap6);
if fnx_6 < 127
    set(handles.txt_hasil_6, 'String', 'Mentah');
    handles.nf6 = 0;
else
    set(handles.txt_hasil_6, 'String', 'Matang');
    handles.nf6 = 1;
end

nf_1 = handles.nf1;
nf_2 = handles.nf2;
nf_3 = handles.nf3;
nf_4 = handles.nf4;
nf_5 = handles.nf5;
nf_6 = handles.nf6;

f = msgbox('Perhitungan K-Means clustering selesai ...');

total_nilai = nf_1 + nf_2 + nf_3 + nf_4 + nf_5 + nf_6;

if total_nilai < 3
    set(handles.txt_hasil_final,'String', 'Buah diprediksi mentah');
elseif total_nilai == 3
    set(handles.txt_hasil_final,'String', 'Buah diprediksi mengkal');
else
    set(handles.txt_hasil_final,'String', 'Buah diprediksi matang');
end

disp(total_nilai);


guidata(hObject, handles);

% --- Executes on button press in btn_input_citra_2.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to btn_input_citra_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in input_citra_3.
function input_citra_3_Callback(hObject, eventdata, handles)
% hObject    handle to input_citra_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning('off');
% citra 3
% -> input citra
[filename,pathname] = uigetfile('*.jpg');
img_input_3 = imread(fullfile(pathname,filename));
% -> set gambar input original ke axes
axes(handles.img_original_3);
imshow(img_input_3);
title('Citra original');
% -> ubah gambar ke grayscale
img_gray_3 = rgb2gray(img_input_3);
% -> set gambar grayscale ke axes
axes(handles.img_grayscale_3);
imshow(img_gray_3);
title('Citra grayscale');

% -> tentukan jumlah class
numberOfClasses = 2;
indexes = kmeans(img_gray_3(:), numberOfClasses);
classImage = reshape(indexes, size(img_gray_3));
 
% h = subplot(2, 2, 3);
axes(handles.img_seg_3);
imshow(classImage, []);
title('Citra biner');
% colormap(h,parula);
class = zeros(size(img_gray_3));
area = zeros(numberOfClasses, 1);
 
for n = 1:numberOfClasses
    class(:,:,n) = classImage == n;
    area(n) = sum(sum(class(:,:,n)));
end
 
[~,min_area] = min(area);
 
object = classImage==min_area;
bw = medfilt2(object,[5 5]);
bw = bwareaopen(bw, 5000);
s = regionprops(bw,'BoundingBox');
bbox = cat(1, s.BoundingBox);
RGB = insertShape(img_input_3, 'FilledRectangle', bbox, 'Color', 'yellow', 'Opacity', 0.3);
RGB = insertObjectAnnotation(RGB, 'rectangle', bbox, '','TextBoxOpacity', 0.9, 'FontSize', 11);
axes(handles.img_dec_3);
imshow(RGB);
title('Citra segmentasi');

% clusterisasi 
img_clus_3 = imresize(img_gray_3, [4 4]);
axes(handles.citra_clus_3);
imshow(img_clus_3);
title('Citra clustering');
handles.np3 = img_clus_3;
guidata(hObject, handles);
% --- Executes on button press in input_citra_4.
function input_citra_4_Callback(hObject, eventdata, handles)
% hObject    handle to input_citra_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning('off');
% citra 4
% -> input citra
[filename,pathname] = uigetfile('*.jpg');
img_input_4 = imread(fullfile(pathname,filename));
% -> set gambar input original ke axes
axes(handles.img_original_4);
imshow(img_input_4);
title('Citra original');
% -> ubah gambar ke grayscale
img_gray_4 = rgb2gray(img_input_4);
% -> set gambar grayscale ke axes
axes(handles.img_grayscale_4);
imshow(img_gray_4);
title('Citra grayscale');

% -> tentukan jumlah class
numberOfClasses = 2;
indexes = kmeans(img_gray_4(:), numberOfClasses);
classImage = reshape(indexes, size(img_gray_4));
 
% h = subplot(2, 2, 3);
axes(handles.img_seg_4);
imshow(classImage, []);
title('Citra biner');
% colormap(h,parula);
class = zeros(size(img_gray_4));
area = zeros(numberOfClasses, 1);
 
for n = 1:numberOfClasses
    class(:,:,n) = classImage == n;
    area(n) = sum(sum(class(:,:,n)));
end
 
[~,min_area] = min(area);
 
object = classImage==min_area;
bw = medfilt2(object,[5 5]);
bw = bwareaopen(bw, 5000);
s = regionprops(bw,'BoundingBox');
bbox = cat(1, s.BoundingBox);
RGB = insertShape(img_input_4, 'FilledRectangle', bbox, 'Color', 'yellow', 'Opacity', 0.3);
RGB = insertObjectAnnotation(RGB, 'rectangle', bbox, '','TextBoxOpacity', 0.9, 'FontSize', 11);
axes(handles.img_dec_4);
imshow(RGB);
title('Citra segmentasi');

% clusterisasi 
img_clus_4 = imresize(img_gray_4, [4 4]);
axes(handles.citra_clus_4);
imshow(img_clus_4);
title('Citra clustering');
handles.np4 = img_clus_4;
guidata(hObject, handles);

% --- Executes on button press in input_citra_5.
function input_citra_5_Callback(hObject, eventdata, handles)
% hObject    handle to input_citra_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning('off');
% citra 5
% -> input citra
[filename,pathname] = uigetfile('*.jpg');
img_input_5 = imread(fullfile(pathname,filename));
% -> set gambar input original ke axes
axes(handles.img_original_5);
imshow(img_input_5);
title('Citra original');
% -> ubah gambar ke grayscale
img_gray_5 = rgb2gray(img_input_5);
% -> set gambar grayscale ke axes
axes(handles.img_grayscale_5);
imshow(img_gray_5);
title('Citra grayscale');

% -> tentukan jumlah class
numberOfClasses = 2;
indexes = kmeans(img_gray_5(:), numberOfClasses);
classImage = reshape(indexes, size(img_gray_5));
 
% h = subplot(2, 2, 3);
axes(handles.img_seg_5);
imshow(classImage, []);
title('Citra biner');
% colormap(h,parula);
class = zeros(size(img_gray_5));
area = zeros(numberOfClasses, 1);
 
for n = 1:numberOfClasses
    class(:,:,n) = classImage == n;
    area(n) = sum(sum(class(:,:,n)));
end
 
[~,min_area] = min(area);
 
object = classImage==min_area;
bw = medfilt2(object,[5 5]);
bw = bwareaopen(bw, 5000);
s = regionprops(bw,'BoundingBox');
bbox = cat(1, s.BoundingBox);
RGB = insertShape(img_input_5, 'FilledRectangle', bbox, 'Color', 'yellow', 'Opacity', 0.3);
RGB = insertObjectAnnotation(RGB, 'rectangle', bbox, '','TextBoxOpacity', 0.9, 'FontSize', 11);
axes(handles.img_dec_5);
imshow(RGB);
title('Citra segmentasi');

% clusterisasi 
img_clus_5 = imresize(img_gray_5, [4 4]);
axes(handles.citra_clus_5);
imshow(img_clus_5);
title('Citra clustering');
handles.np5 = img_clus_5;
guidata(hObject, handles);

% --- Executes on button press in input_citra_6.
function input_citra_6_Callback(hObject, eventdata, handles)
% hObject    handle to input_citra_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning('off');
% citra 6
% -> input citra
[filename,pathname] = uigetfile('*.jpg');
img_input_6 = imread(fullfile(pathname,filename));
% -> set gambar input original ke axes
axes(handles.img_original_6);
imshow(img_input_6);
title('Citra original');
% -> ubah gambar ke grayscale
img_gray_6 = rgb2gray(img_input_6);
% -> set gambar grayscale ke axes
axes(handles.img_grayscale_6);
imshow(img_gray_6);
title('Citra grayscale');

% -> tentukan jumlah class
numberOfClasses = 2;
indexes = kmeans(img_gray_6(:), numberOfClasses);
classImage = reshape(indexes, size(img_gray_6));
 
% h = subplot(2, 2, 3);
axes(handles.img_seg_6);
imshow(classImage, []);
title('Citra biner');
% colormap(h,parula);
class = zeros(size(img_gray_6));
area = zeros(numberOfClasses, 1);
 
for n = 1:numberOfClasses
    class(:,:,n) = classImage == n;
    area(n) = sum(sum(class(:,:,n)));
end
 
[~,min_area] = min(area);
 
object = classImage==min_area;
bw = medfilt2(object,[5 5]);
bw = bwareaopen(bw, 5000);
s = regionprops(bw,'BoundingBox');
bbox = cat(1, s.BoundingBox);
RGB = insertShape(img_input_6, 'FilledRectangle', bbox, 'Color', 'yellow', 'Opacity', 0.3);
RGB = insertObjectAnnotation(RGB, 'rectangle', bbox, '','TextBoxOpacity', 0.9, 'FontSize', 11);
axes(handles.img_dec_6);
imshow(RGB);
title('Citra segmentasi');

% clusterisasi 
img_clus_6 = imresize(img_gray_6, [4 4]);
axes(handles.citra_clus_6);
imshow(img_clus_6);
title('Citra clustering');
handles.np6 = img_clus_6;
guidata(hObject, handles);
