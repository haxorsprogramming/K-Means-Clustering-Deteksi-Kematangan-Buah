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

% Last Modified by GUIDE v2.5 23-Nov-2020 20:08:08

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
title('Citra jeruk original 1');
% -> ubah gambar ke grayscale
img_gray_1 = rgb2gray(img_input_1);
% -> set gambar grayscale ke axes
axes(handles.img_grayscale_1);
imshow(img_gray_1);
title('Citra grayscale jeruk 1');

% -> tentukan jumlah class
numberOfClasses = 2;
indexes = kmeans(img_gray_1(:), numberOfClasses);
classImage = reshape(indexes, size(img_gray_1));
 
% h = subplot(2, 2, 3);
axes(handles.img_seg_1);
imshow(classImage, []);
title('Citra biner jeruk 1');
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
RGB = insertObjectAnnotation(RGB, 'rectangle', bbox, 'Object','TextBoxOpacity', 0.9, 'FontSize',18);
axes(handles.img_dec_1);
imshow(RGB);
title('Segmentasi jeruk 1');

% clusterisasi 
img_clus_1 = imresize(img_gray_1, [4 4]);
axes(handles.citra_clus_1);
imshow(img_clus_1);
title('Citra clustering jeruk 1');

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
clc;clear;
