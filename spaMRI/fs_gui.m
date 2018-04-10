function varargout = fs_gui(varargin)
% FS_GUI MATLAB code for fs_gui.fig
%      FS_GUI, by itself, creates a new FS_GUI or raises the existing
%      singleton*.
%
%      H = FS_GUI returns the handle to a new FS_GUI or the handle to
%      the existing singleton*.
%
%      FS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FS_GUI.M with the given input arguments.
%
%      FS_GUI('Property','Value',...) creates a new FS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fs_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fs_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fs_gui

% Last Modified by GUIDE v2.5 26-Mar-2018 17:42:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fs_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @fs_gui_OutputFcn, ...
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


% --- Executes just before fs_gui is made visible.
function fs_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fs_gui (see VARARGIN)

% Choose default command line output for fs_gui


handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(hObject,'color',[179/255 179/255 179/255]);
set(handles.text2,'BackgroundColor',[179/255 179/255 179/255]);
set(handles.text4,'BackgroundColor',[179/255 179/255 179/255]);
set(handles.text5,'BackgroundColor',[179/255 179/255 179/255]);

currp = which('fs_results');
currp = fileparts(currp);
addpath(genpath([currp,filesep,'Funfiles']));

Imgdata  =  imread([currp,filesep,'spaMRI.png']);
axes(handles.axes1);
imshow(Imgdata);



% UIWAIT makes fs_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fs_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
Env_Config;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME
global SUBJECTS_DIR
if isempty(FREESURFER_HOME) || isempty(SUBJECTS_DIR)
    msgbox('Please set up FREESURFER_HOME and SUBJECTS_DIR firstly');
else
    recon_all_gui;
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME
global SUBJECTS_DIR
if get(handles.pushbutton3,'value')
    if isempty(FREESURFER_HOME) || isempty(SUBJECTS_DIR)
        msgbox('Please set up FREESURFER_HOME and SUBJECTS_DIR firstly');
    else
        statistic_gui;
    end
end

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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME
global SUBJECTS_DIR
if isempty(FREESURFER_HOME) || isempty(SUBJECTS_DIR)
    msgbox('Please set up FREESURFER_HOME and SUBJECTS_DIR firstly');
else
    fs_results;
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME
global SUBJECTS_DIR
if isempty(FREESURFER_HOME) || isempty(SUBJECTS_DIR)
    msgbox('Please set up FREESURFER_HOME and SUBJECTS_DIR firstly');
else
    fs_utility;
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
