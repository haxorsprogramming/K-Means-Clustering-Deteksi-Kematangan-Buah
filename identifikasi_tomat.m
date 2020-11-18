function varargout = identifikasi_tomat(varargin)
% IDENTIFIKASI_TOMAT MATLAB code for identifikasi_tomat.fig
%      IDENTIFIKASI_TOMAT, by itself, creates a new IDENTIFIKASI_TOMAT or raises the existing
%      singleton*.
%
%      H = IDENTIFIKASI_TOMAT returns the handle to a new IDENTIFIKASI_TOMAT or the handle to
%      the existing singleton*.
%
%      IDENTIFIKASI_TOMAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IDENTIFIKASI_TOMAT.M with the given input arguments.
%
%      IDENTIFIKASI_TOMAT('Property','Value',...) creates a new IDENTIFIKASI_TOMAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before identifikasi_tomat_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to identifikasi_tomat_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help identifikasi_tomat
 
% Last Modified by GUIDE v2.5 04-Nov-2020 13:39:14
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @identifikasi_tomat_OpeningFcn, ...
    'gui_OutputFcn',  @identifikasi_tomat_OutputFcn, ...
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
 
 
% --- Executes just before identifikasi_tomat is made visible.
function identifikasi_tomat_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to identifikasi_tomat (see VARARGIN)
 
% Choose default command line output for identifikasi_tomat
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);
movegui(hObject,'center');
 
% UIWAIT makes identifikasi_tomat wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = identifikasi_tomat_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 axes(handles.axes6)
matlabImage = imread('logo_uin.jpg');
image(matlabImage)
axis off
axis image
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

nilai = [0 0 0 0 0 0];

% pertama 
load ciri_gray
ciri_total = handles.ciri_total;
 
ciri = zeros(1,6);
for i = 1:6
    ciri(i) = str2double(ciri_total{i,2});
end
 
[num,~] = size(ciri_gray);
 
dist = zeros(1,num);
for n = 1:num
    data_base = ciri_gray(n,:);
    jarak = sum((data_base-ciri).^2).^0.5;
    dist(n) = jarak;
end
 
[~,id] = min(dist);
 
if isempty(id)
    set(handles.edit1,'String','Unknown')
else
    switch id
        case 1
            tingkat = 'Mentah';
            nilai(1) = 1;
        case 2
            tingkat = 'Mentah';
            nilai(1) = 1;
        case 3
            tingkat = 'Mentah';
            nilai(1) = 1;
        case 4
            tingkat = 'Matang';
            nilai(1) = 2;
        case 5
            tingkat = 'Matang';
            nilai(1) = 2;
        case 6
            tingkat = 'Matang';
            nilai(1) = 2;
        case 7
            tingkat = 'Matang';
            nilai(1) = 2;
        case 8
            tingkat = 'Matang';
            nilai(1) = 2;
        otherwise
            tingkat = 'Mentah';
            nilai(1) = 1;
    end
    set(handles.edit1,'String',tingkat)
end


% kedua 
load ciri_database
ciri_total = handles.ciri_total2;
 
ciri = zeros(1,6);
for i = 1:6
    ciri(i) = str2double(ciri_total{i,2});
end
 
[num,~] = size(ciri_database);
 
dist = zeros(1,num);
for n = 1:num
    data_base = ciri_database(n,:);
    jarak = sum((data_base-ciri).^2).^0.5;
    dist(n) = jarak;
end
 
[~,id] = min(dist);
 
if isempty(id)
    set(handles.text14,'String','Unknown')
else
    switch id
        case 1
            tingkat = 'Mengkal';
            nilai(2) = 2;
        case 2
            tingkat = 'Mengkal';
             nilai(2) = 2;
        case 3
            tingkat = 'Mengkal';
             nilai(2) = 2;
        case 4
            tingkat = 'Mengkal';
             nilai(2) = 2;
        case 5
            tingkat = 'Mengkal';
             nilai(2) = 2;
        case 6
            tingkat = 'Mengkal';
             nilai(2) = 2;
        case 7
            tingkat = 'Matang';
             nilai(2) = 3;
        case 8
            tingkat = 'Matang';
             nilai(2) = 3;
        otherwise
            tingkat = 'Mentah';
             nilai(2) = 1;
    end
    set(handles.text14,'String',tingkat)
end

% ketiga
load ciri_database
ciri_total = handles.ciri_total3;
 
ciri = zeros(1,6);
for i = 1:6
    ciri(i) = str2double(ciri_total{i,2});
end
 
[num,~] = size(ciri_database);
 
dist = zeros(1,num);
for n = 1:num
    data_base = ciri_database(n,:);
    jarak = sum((data_base-ciri).^2).^0.5;
    dist(n) = jarak;
end
 
[~,id] = min(dist);
 
if isempty(id)
    set(handles.text15,'String','Unknown')
else
    switch id
        case 1
            tingkat = 'Mengkal';
            nilai(3) = 2;
        case 2
            tingkat = 'Mengkal';
             nilai(3) = 2;
        case 3
            tingkat = 'Mengkal';
             nilai(3) = 2;
        case 4
            tingkat = 'Mengkal';
             nilai(3) = 2;
        case 5
            tingkat = 'Mengkal';
             nilai(3) = 2;
        case 6
            tingkat = 'Mengkal';
             nilai(3) = 2;
        case 7
            tingkat = 'Matang';
             nilai(3) = 3;
        case 8
            tingkat = 'Matang';
             nilai(3) = 3;
        otherwise
            tingkat = 'Mentah';
             nilai(3) = 1;
    end
    set(handles.text15,'String',tingkat)
end

% keempat
load ciri_database
ciri_total = handles.ciri_total4;
 
ciri = zeros(1,6);
for i = 1:6
    ciri(i) = str2double(ciri_total{i,2});
end
 
[num,~] = size(ciri_database);
 
dist = zeros(1,num);
for n = 1:num
    data_base = ciri_database(n,:);
    jarak = sum((data_base-ciri).^2).^0.5;
    dist(n) = jarak;
end
 
[~,id] = min(dist);
 
if isempty(id)
    set(handles.text16,'String','Unknown')
else
    switch id
        case 1
            tingkat = 'Mengkal';
            nilai(4) = 2;
        case 2
            tingkat = 'Mengkal';
            nilai(4) = 2;
        case 3
            tingkat = 'Mengkal';
            nilai(4) = 2;
        case 4
            tingkat = 'Mengkal';
            nilai(4) = 2;
        case 5
            tingkat = 'Mengkal';
            nilai(4) = 2;
        case 6
            tingkat = 'Mengkal';
            nilai(4) = 2;
        case 7
            tingkat = 'Matang';
            nilai(4) = 3;
        case 8
            tingkat = 'Matang';
            nilai(4) = 3;
        otherwise
            tingkat = 'Mentah';
            nilai(4) = 1;
    end
    set(handles.text16,'String',tingkat)
end

% kelima
load ciri_database
ciri_total = handles.ciri_total5;
 
ciri = zeros(1,6);
for i = 1:6
    ciri(i) = str2double(ciri_total{i,2});
end
 
[num,~] = size(ciri_database);
 
dist = zeros(1,num);
for n = 1:num
    data_base = ciri_database(n,:);
    jarak = sum((data_base-ciri).^2).^0.5;
    dist(n) = jarak;
end
 
[~,id] = min(dist);
 
if isempty(id)
    set(handles.text17,'String','Unknown')
else
    switch id
        case 1
            tingkat = 'Mengkal';
            nilai(5) = 2;
        case 2
            tingkat = 'Mengkal';
            nilai(5) = 2;
        case 3
            tingkat = 'Mengkal';
            nilai(5) = 2;
        case 4
            tingkat = 'Mengkal';
            nilai(5) = 2;
        case 5
            tingkat = 'Mengkal';
            nilai(5) = 2;
        case 6
            tingkat = 'Mengkal';
            nilai(5) = 2;
        case 7
            tingkat = 'Matang';
            nilai(5) = 3;
        case 8
            tingkat = 'Matang';
            nilai(5) = 3;
        otherwise
            tingkat = 'Mentah';
            nilai(5) = 1;
    end
    set(handles.text17,'String',tingkat)
end




% keenam
load ciri_database
ciri_total = handles.ciri_total6;
 
ciri = zeros(1,6);
for i = 1:6
    ciri(i) = str2double(ciri_total{i,2});
end
 
[num,~] = size(ciri_database);
 
dist = zeros(1,num);
for n = 1:num
    data_base = ciri_database(n,:);
    jarak = sum((data_base-ciri).^2).^0.5;
    dist(n) = jarak;
end
 
[~,id] = min(dist);
 
if isempty(id)
    set(handles.text18,'String','Unknown')
else
    switch id
        case 1
            tingkat = 'Mengkal';
            nilai(6) = 2;
        case 2
            tingkat = 'Mengkal';
            nilai(6) = 2;
        case 3
            tingkat = 'Mengkal';
            nilai(6) = 2;
        case 4
            tingkat = 'Mengkal';
            nilai(6) = 2;
        case 5
            tingkat = 'Mengkal';
            nilai(6) = 2;
        case 6
            tingkat = 'Mengkal';
            nilai(6) = 2;
        case 7
            tingkat = 'Matang';
            nilai(6) = 3;
        case 8
            tingkat = 'Matang';
            nilai(6) = 3;
        otherwise
            tingkat = 'Mentah';
            nilai(6) = 1;
    end
    set(handles.text18,'String',tingkat)
end

disp(nilai)
jumlah = sum(nilai);
disp(jumlah)

if jumlah < 6 
   msgbox( sprintf('Buah diprediksi mentah'));
elseif jumlah > 7 && jumlah < 12
    msgbox( sprintf('Buah diprediksi mengkal'));
else
   msgbox( sprintf('Buah diprediksi matang'));
end


 

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
 
 
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% pertama
Img_bw = handles.Img_bw;
 
axes(handles.axes4)
imshow(Img_bw)
title('Buah 1');
 
stats = regionprops(Img_bw,'Area','Perimeter','Eccentricity');
area = stats.Area;
perimeter = stats.Perimeter;
metric = 4*pi*area/(perimeter^2);
eccentricity = stats.Eccentricity;


ciri_bentuk = cell(2,2);
ciri_bentuk{1,1} = 'Metric';
ciri_bentuk{2,1} = 'Eccentricity';
ciri_bentuk{1,2} = num2str(metric);
ciri_bentuk{2,2} = num2str(eccentricity);
 
handles.ciri_bentuk = ciri_bentuk;
guidata(hObject, handles);
 
set(handles.text2,'String','Ekstraksi Buah 1');
set(handles.uitable1,'Data',ciri_bentuk,'RowName',1:2);

% kedua
Img_bw = handles.Img_bw2;
 
axes(handles.axes23)
imshow(Img_bw)
title('Buah 2');
 
stats = regionprops(Img_bw,'Area','Perimeter','Eccentricity');
area = stats.Area;
perimeter = stats.Perimeter;
metric = 4*pi*area/(perimeter^2);
eccentricity = stats.Eccentricity;


ciri_bentuk = cell(2,2);
ciri_bentuk{1,1} = 'Metric';
ciri_bentuk{2,1} = 'Eccentricity';
ciri_bentuk{1,2} = num2str(metric);
ciri_bentuk{2,2} = num2str(eccentricity);
 
handles.ciri_bentuk2 = ciri_bentuk;
guidata(hObject, handles);
 
set(handles.text8,'String','Ekstraksi Buah 2');
set(handles.uitable5,'Data',ciri_bentuk,'RowName',1:2);

% ketiga
Img_bw = handles.Img_bw3;
 
axes(handles.axes24)
imshow(Img_bw)
title('Buah 3');
 
stats = regionprops(Img_bw,'Area','Perimeter','Eccentricity');
area = stats.Area;
perimeter = stats.Perimeter;
metric = 4*pi*area/(perimeter^2);
eccentricity = stats.Eccentricity;


ciri_bentuk = cell(2,2);
ciri_bentuk{1,1} = 'Metric';
ciri_bentuk{2,1} = 'Eccentricity';
ciri_bentuk{1,2} = num2str(metric);
ciri_bentuk{2,2} = num2str(eccentricity);
 
handles.ciri_bentuk3 = ciri_bentuk;
guidata(hObject, handles);
 
set(handles.text10,'String','Ekstraksi Buah 3');
set(handles.uitable7,'Data',ciri_bentuk,'RowName',1:2);

% keempat
Img_bw = handles.Img_bw4;
 
axes(handles.axes25)
imshow(Img_bw)
title('Buah 4');
 
stats = regionprops(Img_bw,'Area','Perimeter','Eccentricity');
area = stats.Area;
perimeter = stats.Perimeter;
metric = 4*pi*area/(perimeter^2);
eccentricity = stats.Eccentricity;


ciri_bentuk = cell(2,2);
ciri_bentuk{1,1} = 'Metric';
ciri_bentuk{2,1} = 'Eccentricity';
ciri_bentuk{1,2} = num2str(metric);
ciri_bentuk{2,2} = num2str(eccentricity);
 
handles.ciri_bentuk4 = ciri_bentuk;
guidata(hObject, handles);
 
set(handles.text11,'String','Ekstraksi Buah 4');
set(handles.uitable8,'Data',ciri_bentuk,'RowName',1:2);

% kelima
Img_bw = handles.Img_bw5;
 
axes(handles.axes26)
imshow(Img_bw)
title('Buah 5');
 
stats = regionprops(Img_bw,'Area','Perimeter','Eccentricity');
area = stats.Area;
perimeter = stats.Perimeter;
metric = 4*pi*area/(perimeter^2);
eccentricity = stats.Eccentricity;


ciri_bentuk = cell(2,2);
ciri_bentuk{1,1} = 'Metric';
ciri_bentuk{2,1} = 'Eccentricity';
ciri_bentuk{1,2} = num2str(metric);
ciri_bentuk{2,2} = num2str(eccentricity);
 
handles.ciri_bentuk5 = ciri_bentuk;
guidata(hObject, handles);
 
set(handles.text12,'String','Ekstraksi Buah 5');
set(handles.uitable9,'Data',ciri_bentuk,'RowName',1:2);

% keenam
Img_bw = handles.Img_bw6;
 
axes(handles.axes27)
imshow(Img_bw)
title('Buah 6');
 
stats = regionprops(Img_bw,'Area','Perimeter','Eccentricity');
area = stats.Area;
perimeter = stats.Perimeter;
metric = 4*pi*area/(perimeter^2);
eccentricity = stats.Eccentricity;


ciri_bentuk = cell(2,2);
ciri_bentuk{1,1} = 'Metric';
ciri_bentuk{2,1} = 'Eccentricity';
ciri_bentuk{1,2} = num2str(metric);
ciri_bentuk{2,2} = num2str(eccentricity);
 
handles.ciri_bentuk6 = ciri_bentuk;
guidata(hObject, handles);
 
set(handles.text13,'String','Ekstraksi Buah 6');
set(handles.uitable10,'Data',ciri_bentuk,'RowName',1:2);

% KE GRAYSCALE 

%pertama
Img = handles.Img;
Img_bw = handles.Img_bw;
ciri_bentuk = handles.ciri_bentuk;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes5)
imshow(Img_gray)
title('Buah 1')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total = ciri_total;
guidata(hObject, handles);
 
set(handles.text2,'String', 'Ekstraksi Buah 1');
set(handles.uitable1,'Data', ciri_total,'RowName',1:6);

% kedua
Img = handles.Img2;
Img_bw = handles.Img_bw2;
ciri_bentuk = handles.ciri_bentuk2;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes28)
imshow(Img_gray)
title('Buah 2')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total2 = ciri_total;
guidata(hObject, handles);
 
set(handles.text8,'String', 'Ekstraksi Buah 2');
set(handles.uitable5,'Data', ciri_total,'RowName',1:6);


% ketiga
Img = handles.Img3;
Img_bw = handles.Img_bw3;
ciri_bentuk = handles.ciri_bentuk3;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes29)
imshow(Img_gray)
title('Buah 3')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total3 = ciri_total;
guidata(hObject, handles);
 
set(handles.text10,'String', 'Ekstraksi Buah 3');
set(handles.uitable7,'Data', ciri_total,'RowName',1:6);

% keempat
Img = handles.Img4;
Img_bw = handles.Img_bw4;
ciri_bentuk = handles.ciri_bentuk4;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes30)
imshow(Img_gray)
title('Buah 4')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total4 = ciri_total;
guidata(hObject, handles);
 
set(handles.text11,'String', 'Ekstraksi Buah 4');
set(handles.uitable8,'Data', ciri_total,'RowName',1:6);

% kelima
Img = handles.Img5;
Img_bw = handles.Img_bw5;
ciri_bentuk = handles.ciri_bentuk5;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes31)
imshow(Img_gray)
title('Buah 5')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total5 = ciri_total;
guidata(hObject, handles);
 
set(handles.text12,'String', 'Ekstraksi Buah 5');
set(handles.uitable9,'Data', ciri_total,'RowName',1:6);

% keenam
Img = handles.Img6;
Img_bw = handles.Img_bw6;
ciri_bentuk = handles.ciri_bentuk6;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes32)
imshow(Img_gray)
title('Buah 6')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total6 = ciri_total;
guidata(hObject, handles);
 
set(handles.text13,'String', 'Ekstraksi Buah 6');
set(handles.uitable10,'Data', ciri_total,'RowName',1:6);


 
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%pertama
Img = handles.Img;
Img_bw = handles.Img_bw;
ciri_bentuk = handles.ciri_bentuk;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes5)
imshow(Img_gray)
title('Buah 1')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total = ciri_total;
guidata(hObject, handles);
 
set(handles.text2,'String', 'Ekstraksi Buah 1');
set(handles.uitable1,'Data', ciri_total,'RowName',1:6);

% kedua
Img = handles.Img2;
Img_bw = handles.Img_bw2;
ciri_bentuk = handles.ciri_bentuk2;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes28)
imshow(Img_gray)
title('Buah 2')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total = ciri_total;
guidata(hObject, handles);
 
set(handles.text8,'String', 'Ekstraksi Buah 2');
set(handles.uitable5,'Data', ciri_total,'RowName',1:6);


% ketiga
Img = handles.Img3;
Img_bw = handles.Img_bw3;
ciri_bentuk = handles.ciri_bentuk3;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes29)
imshow(Img_gray)
title('Buah 3')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total = ciri_total;
guidata(hObject, handles);
 
set(handles.text10,'String', 'Ekstraksi Buah 3');
set(handles.uitable7,'Data', ciri_total,'RowName',1:6);

% keempat
Img = handles.Img4;
Img_bw = handles.Img_bw4;
ciri_bentuk = handles.ciri_bentuk4;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes30)
imshow(Img_gray)
title('Buah 4')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total = ciri_total;
guidata(hObject, handles);
 
set(handles.text11,'String', 'Ekstraksi Buah 4');
set(handles.uitable8,'Data', ciri_total,'RowName',1:6);

% kelima
Img = handles.Img5;
Img_bw = handles.Img_bw5;
ciri_bentuk = handles.ciri_bentuk5;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes31)
imshow(Img_gray)
title('Buah 5')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total = ciri_total;
guidata(hObject, handles);
 
set(handles.text12,'String', 'Ekstraksi Buah 5');
set(handles.uitable9,'Data', ciri_total,'RowName',1:6);

% keenam
Img = handles.Img6;
Img_bw = handles.Img_bw6;
ciri_bentuk = handles.ciri_bentuk6;
 
Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
 
axes(handles.axes32)
imshow(Img_gray)
title('Buah 6')
 
pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);
 
ciri_total = cell(6,2);
ciri_total{1,1} = ciri_bentuk{1,1};
ciri_total{1,2} = ciri_bentuk{1,2};
ciri_total{2,1} = ciri_bentuk{2,1};
ciri_total{2,2} = ciri_bentuk{2,2};
ciri_total{3,1} = 'Contrast';
ciri_total{4,1} = 'Correlation';
ciri_total{5,1} = 'Energy';
ciri_total{6,1} = 'Homogeneity';
ciri_total{3,2} = num2str(Contrast);
ciri_total{4,2} = num2str(Correlation);
ciri_total{5,2} = num2str(Energy);
ciri_total{6,2} = num2str(Homogeneity);
 
handles.ciri_total = ciri_total;
guidata(hObject, handles);
 
set(handles.text13,'String', 'Ekstraksi Buah 6');
set(handles.uitable10,'Data', ciri_total,'RowName',1:6);


 
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% pertama 
Img = handles.Img;
% Color-Based Segmentation Using K-Means Clustering
cform = makecform('srgb2lab');
lab = applycform(Img,cform);
axes(handles.axes2)
imshow(lab)
title('Buah 1');
handles.lab = lab;
guidata(hObject, handles)

% kedua
Img2 = handles.Img2;
% Color-Based Segmentation Using K-Means Clustering
cform = makecform('srgb2lab');
lab2 = applycform(Img2,cform);
axes(handles.axes11)
imshow(lab2)
title('Buah 2');
handles.lab2 = lab2;
guidata(hObject, handles)

% ketiga
Img3 = handles.Img3;
% Color-Based Segmentation Using K-Means Clustering
cform = makecform('srgb2lab');
lab3 = applycform(Img3,cform);
axes(handles.axes13)
imshow(lab3)
title('Buah 3');
handles.lab3 = lab3;
guidata(hObject, handles)

% keempat
Img4 = handles.Img4;
% Color-Based Segmentation Using K-Means Clustering
cform = makecform('srgb2lab');
lab4 = applycform(Img4,cform);
axes(handles.axes14)
imshow(lab4)
title('Buah 4');
handles.lab4 = lab4;
guidata(hObject, handles)

% kelima
Img5 = handles.Img5;
% Color-Based Segmentation Using K-Means Clustering
cform = makecform('srgb2lab');
lab5 = applycform(Img5,cform);
axes(handles.axes16)
imshow(lab5)
title('Buah 5');
handles.lab5 = lab5;
guidata(hObject, handles)

% keenam
Img6 = handles.Img6;
% Color-Based Segmentation Using K-Means Clustering
cform = makecform('srgb2lab');
lab6 = applycform(Img6,cform);
axes(handles.axes17)
imshow(lab6)
title('Buah 6');
handles.lab6 = lab6;
guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% pertama 
Img = handles.Img;
lab = handles.lab;
 
ab = double(lab(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
 
nColors = 2;
[cluster_idx, ~] = kmeans(ab,nColors,'distance','sqEuclidean', ...
    'Replicates',3);
 
pixel_labels = reshape(cluster_idx,nrows,ncols);
 
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);
 
for k = 1:nColors
    color = Img;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end
 
area_cluster1 = sum(find(pixel_labels==1));
area_cluster2 = sum(find(pixel_labels==2));
 
[~,cluster_min] = min([area_cluster1,area_cluster2]);
 
Img_bw = (pixel_labels==cluster_min);
Img_bw = imfill(Img_bw,'holes');
Img_bw = bwareaopen(Img_bw,50);
 
tomat = Img;
R = tomat(:,:,1);
G = tomat(:,:,2);
B = tomat(:,:,3);
R(~Img_bw) = 0;
G(~Img_bw) = 0;
B(~Img_bw) = 0;
tomat_rgb = cat(3,R,G,B);
axes(handles.axes3)
imshow(tomat_rgb)
title('Buah 1');
 
handles.Img_bw = Img_bw;
guidata(hObject, handles)
 
% kedua
Img2 = handles.Img2;
lab2 = handles.lab2;
 
ab = double(lab2(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
 
nColors = 2;
[cluster_idx, ~] = kmeans(ab,nColors,'distance','sqEuclidean', ...
    'Replicates',3);
 
pixel_labels = reshape(cluster_idx,nrows,ncols);
 
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);
 
for k = 1:nColors
    color = Img2;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end
 
area_cluster1 = sum(find(pixel_labels==1));
area_cluster2 = sum(find(pixel_labels==2));
 
[~,cluster_min] = min([area_cluster1,area_cluster2]);
 
Img_bw = (pixel_labels==cluster_min);
Img_bw = imfill(Img_bw,'holes');
Img_bw = bwareaopen(Img_bw,50);
 
tomat = Img2;
R = tomat(:,:,1);
G = tomat(:,:,2);
B = tomat(:,:,3);
R(~Img_bw) = 0;
G(~Img_bw) = 0;
B(~Img_bw) = 0;
tomat_rgb = cat(3,R,G,B);
axes(handles.axes18)
imshow(tomat_rgb)
title('Buah 2');
 
handles.Img_bw2 = Img_bw;
guidata(hObject, handles)

% ketiga
Img3 = handles.Img3;
lab3 = handles.lab3;
 
ab = double(lab3(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
 
nColors = 2;
[cluster_idx, ~] = kmeans(ab,nColors,'distance','sqEuclidean', ...
    'Replicates',3);
 
pixel_labels = reshape(cluster_idx,nrows,ncols);
 
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);
 
for k = 1:nColors
    color = Img3;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end
 
area_cluster1 = sum(find(pixel_labels==1));
area_cluster2 = sum(find(pixel_labels==2));
 
[~,cluster_min] = min([area_cluster1,area_cluster2]);
 
Img_bw = (pixel_labels==cluster_min);
Img_bw = imfill(Img_bw,'holes');
Img_bw = bwareaopen(Img_bw,50);
 
tomat = Img3;
R = tomat(:,:,1);
G = tomat(:,:,2);
B = tomat(:,:,3);
R(~Img_bw) = 0;
G(~Img_bw) = 0;
B(~Img_bw) = 0;
tomat_rgb = cat(3,R,G,B);
axes(handles.axes19)
imshow(tomat_rgb)
title('Buah 3');
 
handles.Img_bw3 = Img_bw;
guidata(hObject, handles)

% keempat
Img4 = handles.Img4;
lab4 = handles.lab4;
 
ab = double(lab4(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
 
nColors = 2;
[cluster_idx, ~] = kmeans(ab,nColors,'distance','sqEuclidean', ...
    'Replicates',3);
 
pixel_labels = reshape(cluster_idx,nrows,ncols);
 
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);
 
for k = 1:nColors
    color = Img4;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end
 
area_cluster1 = sum(find(pixel_labels==1));
area_cluster2 = sum(find(pixel_labels==2));
 
[~,cluster_min] = min([area_cluster1,area_cluster2]);
 
Img_bw = (pixel_labels==cluster_min);
Img_bw = imfill(Img_bw,'holes');
Img_bw = bwareaopen(Img_bw,50);
 
tomat = Img4;
R = tomat(:,:,1);
G = tomat(:,:,2);
B = tomat(:,:,3);
R(~Img_bw) = 0;
G(~Img_bw) = 0;
B(~Img_bw) = 0;
tomat_rgb = cat(3,R,G,B);
axes(handles.axes20)
imshow(tomat_rgb)
title('Buah 4');
 
handles.Img_bw4 = Img_bw;
guidata(hObject, handles)

% kelima
Img5 = handles.Img5;
lab5 = handles.lab5;
 
ab = double(lab5(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
 
nColors = 2;
[cluster_idx, ~] = kmeans(ab,nColors,'distance','sqEuclidean', ...
    'Replicates',3);
 
pixel_labels = reshape(cluster_idx,nrows,ncols);
 
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);
 
for k = 1:nColors
    color = Img5;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end
 
area_cluster1 = sum(find(pixel_labels==1));
area_cluster2 = sum(find(pixel_labels==2));
 
[~,cluster_min] = min([area_cluster1,area_cluster2]);
 
Img_bw = (pixel_labels==cluster_min);
Img_bw = imfill(Img_bw,'holes');
Img_bw = bwareaopen(Img_bw,50);
 
tomat = Img5;
R = tomat(:,:,1);
G = tomat(:,:,2);
B = tomat(:,:,3);
R(~Img_bw) = 0;
G(~Img_bw) = 0;
B(~Img_bw) = 0;
tomat_rgb = cat(3,R,G,B);
axes(handles.axes21);
imshow(tomat_rgb);
title('Buah 5');
 
handles.Img_bw5 = Img_bw;
guidata(hObject, handles);

% keenam
Img6 = handles.Img6;
lab6 = handles.lab6;
 
ab = double(lab6(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
 
nColors = 2;
[cluster_idx, ~] = kmeans(ab,nColors,'distance','sqEuclidean', ...
    'Replicates',3);
 
pixel_labels = reshape(cluster_idx,nrows,ncols);
 
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);
 
for k = 1:nColors
    color = Img6;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end
 
area_cluster1 = sum(find(pixel_labels==1));
area_cluster2 = sum(find(pixel_labels==2));
 
[~,cluster_min] = min([area_cluster1,area_cluster2]);
 
Img_bw = (pixel_labels==cluster_min);
Img_bw = imfill(Img_bw,'holes');
Img_bw = bwareaopen(Img_bw,50);
 
tomat = Img6;
R = tomat(:,:,1);
G = tomat(:,:,2);
B = tomat(:,:,3);
R(~Img_bw) = 0;
G(~Img_bw) = 0;
B(~Img_bw) = 0;
tomat_rgb = cat(3,R,G,B);
axes(handles.axes22)
imshow(tomat_rgb)
title('Buah 6');
 
handles.Img_bw6 = Img_bw;
guidata(hObject, handles);


 
% --- Executes on button press in btnBukaCitra.
function btnBukaCitra_Callback(hObject, eventdata, handles)
% hObject    handle to btnBukaCitra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
 
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    axes(handles.axes1)
    imshow(Img)
    title('Buah 1')
else
    return
end
 
handles.Img = Img;
guidata(hObject, handles)
 
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% pertama
axes(handles.axes1)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes2)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes3)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes4)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes5)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
set(handles.text2,'String',[])
set(handles.uitable1,'Data',[])
set(handles.edit1,'String',[])

% kedua
axes(handles.axes34)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes11)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes18)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes23)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes28)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
set(handles.text8,'String',[])
set(handles.uitable5,'Data',[])
set(handles.text14,'String',[])

% ketiga
axes(handles.axes35)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes13)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes19)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes24)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes29)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
set(handles.text10,'String',[])
set(handles.uitable7,'Data',[])
set(handles.text15,'String',[])

% keempat
axes(handles.axes36)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes14)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes20)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes25)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes30)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
set(handles.text11,'String',[])
set(handles.uitable8,'Data',[])
set(handles.text16,'String',[])

% kelima
axes(handles.axes37)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes16)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes21)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes26)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes31)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
set(handles.text12,'String',[])
set(handles.uitable9,'Data',[])
set(handles.text17,'String',[])

% keenam
axes(handles.axes38)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes17)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes22)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes27)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
axes(handles.axes32)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])
 
set(handles.text13,'String',[])
set(handles.uitable10,'Data',[])
set(handles.text18,'String',[])



% --- Executes during object creation, after setting all properties.
function axes6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes6


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
 
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    axes(handles.axes34)
    imshow(Img)
    title('Buah 2')
else
    return
end
 
handles.Img2 = Img;
guidata(hObject, handles)

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
 
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    axes(handles.axes35)
    imshow(Img)
    title('Buah 3')
else
    return
end
 
handles.Img3 = Img;
guidata(hObject, handles)

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
 
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    axes(handles.axes36)
    imshow(Img)
    title('Buah 4')
else
    return
end
 
handles.Img4 = Img;
guidata(hObject, handles)

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
 
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    axes(handles.axes37)
    imshow(Img)
    title('Buah 5')
else
    return
end
 
handles.Img5 = Img;
guidata(hObject, handles)

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
 
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    axes(handles.axes38)
    imshow(Img)
    title('Buah 6')
else
    return
end
 
handles.Img6 = Img;
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function btnBukaCitra_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btnBukaCitra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pushbutton11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pushbutton3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
