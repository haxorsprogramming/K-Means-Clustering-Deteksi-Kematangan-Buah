function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 23-Nov-2020 03:57:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
ImgInput1 = imread(fullfile(pathname,filename));
foto1 = (rgb2gray(ImgInput1));
cimg1 = imresize(foto1, [4 4]);
axes(handles.pic_cl_1);
imshow(cimg1);
title('1');
set(handles.tblpixel1, 'Data', cimg1);
handles.nim1 = cimg1;
axes(handles.pic_or_1);
imshow(foto1);
title('1');
guidata(hObject, handles);

function pushbutton1_CreateFcn(hObject, eventdata, handles)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
ImgInput2 = imread(fullfile(pathname,filename));
foto2 = (rgb2gray(ImgInput2));
cimg2 = imresize(foto2, [4 4]);
axes(handles.pic_cl_2);
imshow(cimg2);
title('2');
set(handles.tblpixel2, 'Data', cimg2);
handles.nim2 = cimg2;
axes(handles.pic_or_2);
imshow(foto2);
title('2');
guidata(hObject, handles);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
ImgInput3 = imread(fullfile(pathname,filename));
foto3 = (rgb2gray(ImgInput3));
cimg3 = imresize(foto3, [4 4]);
axes(handles.pic_cl_3);
imshow(cimg3);
title('3');
set(handles.tblpixel3, 'Data', cimg3);
handles.nim3 = cimg3;
axes(handles.pic_or_3);
imshow(foto3);
title('3');
guidata(hObject, handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
ImgInput4 = imread(fullfile(pathname,filename));
foto4 = (rgb2gray(ImgInput4));
cimg4 = imresize(foto4, [4 4]);
axes(handles.pic_cl_4);
imshow(cimg4);
title('4');
set(handles.tblpixel4, 'Data', cimg4);
handles.nim4 = cimg4;
axes(handles.pic_or_4);
imshow(foto4);
title('4');
guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
ImgInput5 = imread(fullfile(pathname,filename));
foto5 = (rgb2gray(ImgInput5));
cimg5 = imresize(foto5, [4 4]);
axes(handles.pic_cl_5);
imshow(cimg5);
title('5');
set(handles.tblpixel5, 'Data', cimg5);
handles.nim5 = cimg5;
axes(handles.pic_or_5);
imshow(foto5);
title('5');
guidata(hObject, handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
ImgInput6 = imread(fullfile(pathname,filename));
foto6 = (rgb2gray(ImgInput6));
cimg6 = imresize(foto6, [4 4]);
axes(handles.pic_cl_6);
imshow(cimg6);
title('6');
set(handles.tblpixel6, 'Data', cimg6);
handles.nim6 = cimg6;
axes(handles.pic_or_6);
imshow(foto6);
title('6');
guidata(hObject, handles);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% pertama
n1 = handles.nim1;
m1 = max(n1(:));
k1 = min(n1(:));
fnx_1 = (m1 + k1) / 2;
mts1 = int2str(fnx_1);
cp1 = 'T = ';
fincap1 = strcat(cp1, mts1);
set(handles.ntr1,'String', fincap1);

if fnx_1 > 125 
    set(handles.txtHasil1,'String', 'Matang');
    handles.hb1 = 1;
else
    set(handles.txtHasil1,'String', 'Mentah');
    handles.hb1 = 0;
end

% kedua
n2 = handles.nim2;
m2 = max(n2(:));
k2 = min(n2(:));
fnx_2 = (m2 + k2) / 2;
mts2 = int2str(fnx_2);
cp2 = 'T = ';
fincap2 = strcat(cp2, mts2);
set(handles.ntr2,'String', fincap2);

if fnx_2 > 125 
    set(handles.txtHasil2,'String', 'Matang');
    handles.hb2 = 1;
else
    set(handles.txtHasil2,'String', 'Mentah');
    handles.hb2 = 0;
end

% ketiga
n3 = handles.nim3;
m3 = max(n3(:));
k3 = min(n3(:));
fnx_3 = (m3 + k3) / 2;
mts3 = int2str(fnx_3);
cp3 = 'T = ';
fincap3 = strcat(cp3, mts3);
set(handles.ntr3,'String', fincap3);

if fnx_3 > 125 
    set(handles.txtHasil3,'String', 'Matang');
    handles.hb3 = 1;
else
    set(handles.txtHasil3,'String', 'Mentah');
    handles.hb3 = 0;
end


% keempat
n4 = handles.nim4;
m4 = max(n4(:));
k4 = min(n4(:));
fnx_4 = (m4 + k4) / 2;
mts4 = int2str(fnx_4);
cp4 = 'T = ';
fincap4 = strcat(cp4, mts4);
set(handles.ntr4,'String', fincap4);

if fnx_4 > 125 
    set(handles.txtHasil4,'String', 'Matang');
    handles.hb4 = 1;
else
    set(handles.txtHasil4,'String', 'Mentah');
    handles.hb4 = 0;
end


% kelima
n5 = handles.nim5;
m5 = max(n5(:));
k5 = min(n5(:));
fnx_5 = (m5 + k5) / 2;
mts5 = int2str(fnx_5);
cp5 = 'T = ';
fincap5 = strcat(cp5, mts5);
set(handles.ntr5,'String', fincap5);

if fnx_5 > 125 
    set(handles.txtHasil5,'String', 'Matang');
    handles.hb5 = 1;
else
    set(handles.txtHasil5,'String', 'Mentah');
    handles.hb5 = 0;
end


% keenam
n6 = handles.nim6;
m6 = max(n6(:));
k6 = min(n6(:));
fnx_6 = (m6 + k6) / 2;
mts6 = int2str(fnx_6);
cp6 = 'T = ';
fincap6 = strcat(cp6, mts6);
set(handles.ntr6,'String', fincap6);

if fnx_6 > 125 
    set(handles.txtHasil6,'String', 'Matang');
    handles.hb6 = 1;
else
    set(handles.txtHasil6,'String', 'Mentah');
    handles.hb6 = 0;
end

% final 
hb1 = handles.hb1;
hb2 = handles.hb2;
hb3 = handles.hb3;
hb4 = handles.hb4;
hb5 = handles.hb5;
hb6 = handles.hb6;

hbfin = hb1 + hb2 + hb3 + hb4 + hb5 + hb6;

if hbfin < 3
    set(handles.txtHasilFinal,'String', 'Buah diprediksi mentah');
    disp('mentah');
elseif hbfin == 3
    set(handles.txtHasilFinal,'String', 'Buah diprediksi mengkal');
    disp('mengkal');
else
    set(handles.txtHasilFinal,'String', 'Buah diprediksi matang');
    disp('matang');
end

% disp(hb1);
