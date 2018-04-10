function varargout = Env_Config(varargin)
% ENV_CONFIG MATLAB code for Env_Config.fig
%      ENV_CONFIG, by itself, creates a new ENV_CONFIG or raises the existing
%      singleton*.
%
%      H = ENV_CONFIG returns the handle to a new ENV_CONFIG or the handle to
%      the existing singleton*.
%
%      ENV_CONFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENV_CONFIG.M with the given input arguments.
%
%      ENV_CONFIG('Property','Value',...) creates a new ENV_CONFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Env_Config_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Env_Config_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Env_Config

% Last Modified by GUIDE v2.5 17-Aug-2017 09:20:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Env_Config_OpeningFcn, ...
                   'gui_OutputFcn',  @Env_Config_OutputFcn, ...
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


% --- Executes just before Env_Config is made visible.
function Env_Config_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Env_Config (see VARARGIN)

% Choose default command line output for Env_Config
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global FREESURFER_HOME
global SUBJECTS_DIR

if exist('FREESURFER_HOME','var');
    set(handles.edit1,'string',FREESURFER_HOME);
end
if exist('SUBJECTS_DIR','var');
    set(handles.edit2,'string',SUBJECTS_DIR);
end

% UIWAIT makes Env_Config wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Env_Config_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.pushbutton1,'value')
    pathname = uiget_multi(pwd, 'Pls select FREESURFER_HOME path');
    set(handles.edit1,'string',pathname);
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME 
global SUBJECTS_DIR
FREESURFER_HOME    = char(get(handles.edit1,'string'));
SUBJECTS_DIR       = char(get(handles.edit2,'string'));
if ~isempty(FREESURFER_HOME)
    fprintf('The FREESURFER_HOME is :%s \n',FREESURFER_HOME);
else
    fprintf('The FREESURFER_HOME is :%s \n','empty');
end
if ~isempty(SUBJECTS_DIR)
    fprintf('The SUBJECTS_DIR    is :%s \n',SUBJECTS_DIR);
else
    fprintf('The SUBJECTS_DIR    is :%s \n','empty');
end
close(gcf);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.pushbutton5,'value')
    pathname = uiget_multi(pwd, 'Pls select SUBJECTS_DIR path');
    set(handles.edit2,'string',pathname);
end
