function varargout = fs_calculator(varargin)
% FS_CALCULATOR MATLAB code for fs_calculator.fig
%      FS_CALCULATOR, by itself, creates a new FS_CALCULATOR or raises the existing
%      singleton*.
%
%      H = FS_CALCULATOR returns the handle to a new FS_CALCULATOR or the handle to
%      the existing singleton*.
%
%      FS_CALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FS_CALCULATOR.M with the given input arguments.
%
%      FS_CALCULATOR('Property','Value',...) creates a new FS_CALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fs_calculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fs_calculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fs_calculator

% Last Modified by GUIDE v2.5 25-Aug-2017 13:29:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fs_calculator_OpeningFcn, ...
                   'gui_OutputFcn',  @fs_calculator_OutputFcn, ...
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


% --- Executes just before fs_calculator is made visible.
function fs_calculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fs_calculator (see VARARGIN)

% Choose default command line output for fs_calculator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fs_calculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fs_calculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'string','');

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'string','');

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pathname                                  = uiget_multi(pwd, 'Pls select group folder');
RUN                                       = 'true';
for i=1:length(pathname)
    if ~isdir(pathname{i})
        msgbox('Please selet group folder instead of files');
        RUN                               = 'false';
        break;
    end
end
if isequal(RUN,'true')
    pathname_done                         = get(handles.listbox1,'string');
    K                                     = length(pathname_done)+1;
    for i=1:length(pathname)
        pathname{i}                       = ['g',num2str(K),':',pathname{i}];
        K                                 = K+1;
    end
    set(handles.listbox1,'string',cat(1,pathname_done,pathname));
    clear K pathname_done pathname
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

pathname                         = uiget_multi(pwd, 'Pls select *.label/*.mgh file');
RUN                              = 'true';
for i=1:length(pathname)
    [~,~,ext]  = fileparts(pathname{i});
    if ~isequal(ext,'.label') && ~isequal(ext,'.mgh')
        msgbox('Please selet *.label / *.mgh file');
        RUN                      = 'false';
        break;
    end
end
if isequal(RUN,'true')
    pathname_done                = get(handles.listbox2,'string');
    K                            = length(pathname_done)+1;
    for i=1:length(pathname)
        pathname{i}              = ['i',num2str(K),':',pathname{i}];
        K                        = K+1;
    end
    set(handles.listbox2,'string',cat(1,pathname_done,pathname));
    clear K pathname_done pathname
end



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
output = uigetdir(pwd,'Pls select output folder');
if ~isempty(output) & output ~= 0
    set(handles.edit2,'string',output);
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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
expression                                     = get(handles.edit1,'string');
outputdir                                      = get(handles.edit2,'string');
prefix                                         = get(handles.edit3,'string');

if isempty(expression) 
    error('Please provide an expression for img calculator');
end

RUN_I                                          = 0;
RUN_G                                          = 0;
imgfile                                        = get(handles.listbox2,'string');
for i=1:length(imgfile)
    if strfind(expression,['i',num2str(i)])
        RUN_I                                  = 1;
    end
end
groupdir                                       = get(handles.listbox1,'string');
for i=1:length(groupdir)
    if strfind(expression,['g',num2str(i)])
        RUN_G                                  = 1;
    end
end

% calculator for .label / .mgh files
if RUN_I
    if ~isempty(strfind(expression,'union')) || ~isempty(strfind(expression,'intersect')) || ~isempty(strfind(expression,'setdiff')) % label file
        for i=1:length(imgfile)
            [~,~,ext]                          = fileparts(imgfile{i});
            if ~isequal(ext,'.label')
                error('The expression provided only works on *.label file. Please check the input');
            end
        end
        
        labelmatrix                            = [];
        labelInd                               = cell(0);
        for i=1:length(imgfile)
            A                                  = imgfile{i};
            A                                  = strrep(A,['i',num2str(i),':'],'');
            A                                  = read_label([],A);
            labelmatrix                        = [labelmatrix;A];
            labelInd{1,i}                      = A(:,1);
            expression                         = strrep(expression,['i',num2str(i)],['labelInd{1,',num2str(i),'}']);
            clear A
        end
        labelInd                               = eval(expression);
        if ~isempty(labelInd)
            for i=1:length(labelInd)
                ind                            = find(labelmatrix(:,1) == labelInd(i));
                lindex(i,:)                    = labelmatrix(ind(1),1);
                lxyz(i,:)                      = labelmatrix(ind(1),2:4);
                lvals(i,:)                     = labelmatrix(ind(1),5);
            end
        else
            lindex = []; lxyz = [];  lvals = [];
        end
        fs_save_label(lindex, lxyz, lvals, [outputdir,filesep,prefix,'.label']);
        clear labelInd ind lindex lxyz lvals labelmatrix
        fprintf('Calculation finished. Save label file to : %s\n',[outputdir,filesep,prefix,'.label']);
        
    else % mgh file
        for i=1:length(imgfile)
            [~,~,ext]                          = fileparts(imgfile{i});
            if ~isequal(ext,'.mgh')
                error('The expression provided only works on *.mgh file. Please check the input');
            end
        end
        A                                      = imgfile{1}; 
        A                                      = strrep(A,'i1:','');
        [~, M, mr_parms]                       = load_mgh(A); clear A
        vol                                    = cell(0);
        for i=1:length(imgfile)
            A                                  = imgfile{i};
            A                                  = strrep(A,['i',num2str(i),':'],'');
            vol{1,i}                           = load_mgh(A);
            expression                         = strrep(expression,['i',num2str(i)],['vol{1,',num2str(i),'}']);
            clear A
        end
        if strfind(expression(1:4),'mean')
            A                                  = 0;
            for i=1:length(imgfile)
                A                              = A + vol{1,i};
            end
            vol                                = A./length(imgfile);
            clear i A
        elseif strfind(expression(1:3),'std')
            A                                  = 0;
            for i=1:length(imgfile)
                A                              = [A,vol{1,i}];
            end
            vol                                = std(A,[],2);
            clear i A
        else
            vol = eval(expression);
        end
        save_mgh(vol, [outputdir,filesep,prefix,'.mgh'], M, mr_parms);
        clear M mr_parms vol i ext
        fprintf('Calculation finished. Save mgh file to : %s\n',[outputdir,filesep,prefix,'.mgh']);
    end
end

% calculator for groups
if RUN_G
    for i=1:length(groupdir)
        A                                      = groupdir{i};
        A                                      = strrep(A,['g',num2str(i),':'],'');
        groupdir{i}                            = A;
        clear A
    end
    if ~isempty(strfind(expression,'union')) || ~isempty(strfind(expression,'intersect')) || ~isempty(strfind(expression,'setdiff')) % label file
        labelfiles                             = cell(0);
        for i=1:length(groupdir)
            labelfiles{1,i}                    = dir([groupdir{i},filesep,'*.label']);
            if i > 1
                if length(labelfiles{1,i}) ~= length(labelfiles{1,i-1})
                    error('Make sure that all  folders include the same number of label files');
                end
            end
        end
        fprintf('Find %d labels in total \n',length(labelfiles{1,1}));
        for i=1:length(labelfiles{1,1})
            labelmatrix                        = [];
            labelInd                           = cell(0);
            exp                                = expression;
            for ig = 1:length(groupdir)
                A                              = read_label([],[groupdir{ig},filesep,labelfiles{1,ig}(i).name]);
                labelmatrix                    = [labelmatrix;A];
                labelInd{1,i}                  = A(:,1);
                exp                            = strrep(exp,['g',num2str(ig)],['labelInd{1,',num2str(i),'}']);
                clear A
            end
            labelInd                           = eval(exp);
            if ~isempty(labelInd)
                for il=1:length(labelInd)
                    ind                        = find(labelmatrix(:,1) == labelInd(il));
                    lindex(il,:)               = labelmatrix(ind(1),1);
                    lxyz(il,:)                 = labelmatrix(ind(1),2:4);
                    lvals(il,:)                = labelmatrix(ind(1),5);
                    clear ind
                end
            else
                lindex = []; lxyz = [];  lvals = [];
            end
            if i < 10
                fs_save_label(lindex, lxyz, lvals, [outputdir,filesep,prefix,['00',num2str(i)],'.label']);
                fprintf('Saving label file to : %s\n',[outputdir,filesep,prefix,['00',num2str(i)],'.label']);
            elseif i < 100
                fs_save_label(lindex, lxyz, lvals, [outputdir,filesep,prefix,['0',num2str(i)],'.label']);
                fprintf('Saving label file to : %s\n',[outputdir,filesep,prefix,['0',num2str(i)],'.label']);
            else
                fs_save_label(lindex, lxyz, lvals, [outputdir,filesep,prefix,num2str(i),'.label']);
                fprintf('Saving label file to : %s\n',[outputdir,filesep,prefix,num2str(i),'.label']);
            end
            clear labelmatrix labelInd exp ig il lindex lxyz lvals
        end
        clear i
    else %%%%%%%%%%%%%%%%%%%%%%%%% mgh file
        mghfiles                               = cell(0);
        for i=1:length(groupdir)
            mghfiles{1,i}                      = dir([groupdir{i},filesep,'*.mgh']);
            if i > 1
                if length(mghfiles{1,i}) ~= length(mghfiles{1,i-1})
                    error('Make sure that all  folders include the same number of mgh files');
                end
            end
        end
        fprintf('Find %d mgh files in total \n',length(mghfiles{1,1}));
        [~, M, mr_parms]                       = load_mgh([groupdir{1},filesep,mghfiles{1,1}(1).name]);
        for i=1:length(mghfiles{1,1})
            vol                                = cell(0);
            exp                                = expression;
            for ig = 1:length(groupdir)
                vol{1,ig}                      = load_mgh([groupdir{ig},filesep,mghfiles{1,ig}(i).name]);
                exp                            = strrep(exp,['g',num2str(ig)],['vol{1,',num2str(ig),'}']);
            end
            vol                                = eval(exp);
            if i < 10
                save_mgh(vol, [outputdir,filesep,prefix,['00',num2str(i)],'.mgh'], M, mr_parms);
                fprintf('Saving mgh file to : %s\n',[outputdir,filesep,prefix,['00',num2str(i)],'.mgh']);
            elseif i < 100
                save_mgh(vol, [outputdir,filesep,prefix,['0',num2str(i)],'.mgh'], M, mr_parms);
                fprintf('Saving mgh file to : %s\n',[outputdir,filesep,prefix,['0',num2str(i)],'.mgh']);
            else
                save_mgh(vol, [outputdir,filesep,prefix,num2str(i),'.mgh'], M, mr_parms);
                fprintf('Saving mgh file to : %s\n',[outputdir,filesep,prefix,num2str(i),'.mgh']);
            end
            clear vol ig exp
        end
        clear M mr_parms mghfiles i
    end
end

% --------------------------------------------------------------------
function group_clear_Callback(hObject, eventdata, handles)
% hObject    handle to group_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear_listbox1 = getappdata(0,'clear_listbox1');
clear_listbox2 = getappdata(0,'clear_listbox2');
if clear_listbox1
    set(handles.listbox1,'string','');
end
if clear_listbox2
    set(handles.listbox2,'string','');
end
clear clear_listbox1  clear_listbox2


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox1.
function listbox1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'clear_listbox1',1);
setappdata(0,'clear_listbox2',0);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox2.
function listbox2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'clear_listbox1',0);
setappdata(0,'clear_listbox2',1);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'The calculator only works on *.label or *.mgh file.','',...
        '##########################',...
        'The *.mgh file is involved in surface measurements such as thickness, area and curv. Generally, it supports MATLAB-operations, such as +,  -,  *,  /,  .*,  ./,  (), sqrt,mean,std and so on',...
        'For example, i1+i2 means the sum of surface mearments of the two images; sqrt(i1)+i2.*i3 works in the following way: firstly compute square root of image1(i1), multiply image2 by image3, then get sum of the two resulted images','',...
        '##########################',...
        'While the *.label is a specific ROI, so it only supports the following three operations:',...
        '(1) union',...
        '        e.g. union(i1,i2) generates elements which exist in label1 or label2',...
        '(2) intersect',...
        '        e.g. intersect(i1,i2) generates elements which exist in label1 and label2',...
        '(3) setdiff',...
        '        e.g. setdiff(i1,i2) generates elements that exist in label1 but not in label2',...
        'Of course, combinations of the three operations are allowed, e.g. union(i1,setdiff(i2,i3))'},...
        'Help');
