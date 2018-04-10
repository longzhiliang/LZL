function varargout = fs_extractor(varargin)
% FS_EXTRACTOR MATLAB code for fs_extractor.fig
%      FS_EXTRACTOR, by itself, creates a new FS_EXTRACTOR or raises the existing
%      singleton*.
%
%      H = FS_EXTRACTOR returns the handle to a new FS_EXTRACTOR or the handle to
%      the existing singleton*.
%
%      FS_EXTRACTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FS_EXTRACTOR.M with the given input arguments.
%
%      FS_EXTRACTOR('Property','Value',...) creates a new FS_EXTRACTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fs_extractor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fs_extractor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fs_extractor

% Last Modified by GUIDE v2.5 23-Mar-2018 07:46:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fs_extractor_OpeningFcn, ...
                   'gui_OutputFcn',  @fs_extractor_OutputFcn, ...
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


% --- Executes just before fs_extractor is made visible.
function fs_extractor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fs_extractor (see VARARGIN)

% Choose default command line output for fs_extractor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fs_extractor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fs_extractor_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'string',{'thickness','area','area.pial','sulc','curv','pial_lgi','volume','jacobian_white','w-g.pct.mgh'});

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'string',{'lh','rh'});

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject,'string',{'0','5','10','15','20','25'});
set(hObject,'Enable','off')



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
set(hObject,'Enable','off');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
output = uigetdir(pwd,'Pls select output folder');
if ~isempty(output) & output ~= 0
    set(handles.edit1,'string',output);
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hemi           = get(handles.popupmenu2,'string');
% hemi           = char(hemi(get(handles.popupmenu2,'value')));

measurename                            = get(handles.popupmenu1,'string');
measurename                            = measurename{get(handles.popupmenu1,'value')};
hemi                                   = get(handles.popupmenu2,'string');
hemi                                   = hemi{get(handles.popupmenu2,'value')};
smooth                                 = get(handles.popupmenu3,'string');
smooth                                 = smooth{get(handles.popupmenu3,'value')};
space                                  = get(handles.popupmenu5,'string');
space                                  = space{get(handles.popupmenu5,'value')};
if strcmp(space,'native')
    measurement                        = [hemi,'.',measurename];
elseif strcmp(space,'fsaverage')
    measurement                        = [hemi,'.',measurename,'.fwhm',smooth,'.fsaverage.mgh'];
else
    error('It is unkown space. pls choose native or fsaverage');
end
clear measurename hemi smooth space

roi_value                              = get(handles.popupmenu4,'value');
outdir                                 = get(handles.edit1,'string');
subjids                                = get(handles.listbox1,'string');

%% label name / file
if roi_value == 1 || roi_value == 2 % label name/file
    
    if roi_value == 1 % label name
        roi_name                       = get(handles.edit2,'string');
        roi_name(isspace(roi_name))    = [];
        Ind                            = strfind(roi_name,',');
        if ~isempty(Ind)
            A                              = cell(0);
            for i=1:length(Ind)
                if i == 1
                    A{1,i}                 = roi_name(1:Ind(i)-1);
                else
                    A{1,i}                 = roi_name(Ind(i-1)+1:Ind(i)-1);
                end
            end
            A{1,length(Ind)+1}             = roi_name(Ind(end)+1:end);
            roi_name                       = A;
        else
            roi_name                       = cellstr(roi_name);
        end
        fprintf('Find labels: %s\n',fs_cell2str(roi_name));
        clear A Ind i  
        
    elseif roi_value == 2 % label file
        roi_name                       = get(handles.listbox2,'string');
        fprintf('label file : \n');
        for i=1:length(roi_name)
            fprintf('%s %s\n',blanks(4),roi_name{i});
        end
    end
    
    fs_value                           = cell(length(subjids)+1,length(roi_name)+1);
    fs_value{1,1}                      = 'subjid_name';
    for i=1:length(roi_name); 
        if roi_value == 1
            fs_value{1,i+1}            = roi_name{i};
        elseif roi_value == 2
            [~,Name,ext]               = fileparts(roi_name{i});
            fs_value{1,i+1}            = [Name,ext];
            clear Name ext
        end
    end; 
    clear i
    
    for i=1:length(subjids)
        [~,Name]                       = fileparts(subjids{i});
        fs_value{i+1,1}                = Name;
        fprintf('Extract values from %s \n',Name);
        if ~isempty(strfind(measurement,'fsaverage'))
            vol                        = load_mgh([subjids{i},filesep,'surf',filesep,measurement]);
        else
            vol                        = read_curv([subjids{i},filesep,'surf',filesep,measurement]);
        end
        for il = 1:length(roi_name)
            if roi_value == 1
                labelInd               = read_label([],[subjids{i},filesep,'label',filesep,roi_name{il}]);
            elseif roi_value == 2
                labelInd               = read_label([],roi_name{il});
            end
            labelInd = labelInd(:,1)+1; % label index +1 for matlab 
            fs_value{i+1,il+1}      = nanmean(vol(labelInd));
            clear labelInd
        end
        clear Name vol il
    end
    fs_value                           = fs_cell2str(fs_value);
    fid                                = fopen([outdir,filesep,['extract_',measurement,'.txt']],'w');
    for i=1:size(fs_value,1)
        fprintf(fid,'%s\n',fs_value(i,:));
    end
    fclose(fid);
    clear i fs_value
    fprintf('Done\n');
end

%% annot name/file

if roi_value == 3 || roi_value == 4 % annot name/file
    
    if roi_value == 3 % annot name
        annot_name                      = get(handles.edit2,'string');
        annot_name(isspace(annot_name)) = [];
        Ind                             = strfind(annot_name,',');
        if ~isempty(Ind)
            A                               = cell(0);
            for i=1:length(Ind)
                if i == 1
                    A{1,i}                  = annot_name(1:Ind(i)-1);
                else
                    A{1,i}                  = annot_name(Ind(i-1)+1:Ind(i)-1);
                end
            end
            A{1,length(Ind)+1}              = annot_name(Ind(end)+1:end);
            annot_name                      = A; clear A Ind i
        else
            annot_name                      = cellstr(annot_name);
        end
        fprintf('Find labels: %s\n',fs_cell2str(annot_name));
        
    elseif roi_value == 4 % annot file
        annot_name                      = get(handles.listbox2,'string');
        fprintf('Annot file : \n');
        for i=1:length(annot_name)
            fprintf('%s %s\n',blanks(4),annot_name{i});
        end
    end
    
    for i=1:length(annot_name)
        if roi_value == 3
            [~, ~, colortable]          = read_annotation([subjids{1},filesep,'label',filesep,annot_name{i}]);
        elseif roi_value == 4
            [~, ~, colortable]          = read_annotation(annot_name{i});
        end
        fs_value                        = cell(length(subjids)+1,length(colortable.struct_names)+1);
        fs_value{1,1}                   = 'subjid_name';
        for iroi=1:length(colortable.struct_names)
            fs_value{1,iroi+1}          = colortable.struct_names{iroi};
        end;
        clear iroi
        
        for isub =1:length(subjids)
            [~,Name]                    = fileparts(subjids{isub});
            fs_value{isub+1,1}          = Name;
            fprintf('Extract values from %s \n',Name);
            if ~isempty(strfind(measurement,'fsaverage'))
                vol                     = load_mgh([subjids{isub},filesep,'surf',filesep,measurement]);
            else
                vol                     = read_curv([subjids{isub},filesep,'surf',filesep,measurement]);
            end
            if roi_value == 3
                [vertices, label, colortable] = read_annotation([subjids{isub},filesep,'label',filesep,annot_name{i}]);
            elseif roi_value == 4
                [vertices, label, colortable] = read_annotation(annot_name{i});
            end
            colortable                        = colortable.table(:,5);
            for iroi = 1:length(colortable)
                volInd                        = find(label == colortable(iroi));
                if ~isempty(volInd)
                    fs_value{isub+1,iroi+1}   = nanmean(vol(volInd));
                else
                    fs_value{isub+1,iroi+1}   = 'NaN';
                end
                clear volInd
            end
            clear label colortable iroi vol vertices Name
        end
        fs_value                              = fs_cell2str(fs_value);
        if roi_value == 3
            fid                               = fopen([outdir,filesep,['extract_',measurement,'_',annot_name{i},'.txt']],'w');
        elseif roi_value == 4
            [~,Name,ext]                      = fileparts(annot_name{i});
            fid                               = fopen([outdir,filesep,['extract_',measurement,'_',[Name,ext],'.txt']],'w');
            clear Name ext
        end
        for ivalue = 1:size(fs_value,1)
            fprintf(fid,'%s\n',fs_value(ivalue,:));
        end
        fclose(fid);
        clear ivalue fs_value
        fprintf('Extraction from annot file %s. Done\n',annot_name{i});
    end   
end




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SUBJECTS_DIR

pathname                       = uiget_multi(SUBJECTS_DIR, 'Pls select subject folder(s)');
RUN                            = 'true';
for i=1:length(pathname)
    if ~isdir(pathname{i})
        msgbox('Please selet subject folder(s),not files');
        RUN                    = 'false';
        break;
    end
end
if isequal(RUN,'true')
    pathname_done              = get(handles.listbox1,'string');
    set(handles.listbox1,'string',cat(1,pathname_done,pathname));
    clear pathname_done pathname
end

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
label                               = get(handles.popupmenu4,'value');
if label == 1 || label == 3
    % input file names
    set(handles.edit2,              'Enable','on');
    set(handles.listbox2,           'Enable','off');
elseif label == 2 || label == 4
    % input specific files
    set(handles.edit2,              'Enable','off');
    set(handles.listbox2,           'Enable','on');
    
    RUN                             = 'true';
    if label == 2 % label file
        pathname                    = uiget_multi(pwd, 'Pls select *.label file(s)');
        for i=1:length(pathname)
            [~,~,ext]               = fileparts(pathname{i});
            if ~isequal(ext,'.label')
                msgbox('Please selet *.label file(s)');
                RUN                 = 'false';
                break;
            end
        end
        if isequal(RUN,'true')
            pathname_done           = get(handles.listbox2,'string');
            set(handles.listbox2,'string',cat(1,pathname_done,pathname));
        end
    end
    
    if label == 4
        pathname                    = uiget_multi(pwd, 'Pls select *.annot file(s)');
        for i=1:length(pathname)
            [~,~,ext]               = fileparts(pathname{i});
            if ~isequal(ext,'.annot')
                msgbox('Please selet *.annot file(s)');
                RUN                 = 'false';
                break;
            end
        end
        if isequal(RUN,'true')
            pathname_done           = get(handles.listbox2,'string');
            set(handles.listbox2,'string',cat(1,pathname_done,pathname));
        end
    end
    clear pathname_done pathname
end

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'string',{'label name','label file','annot name','annot file'});


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

% --------------------------------------------------------------------
function group_clear_Callback(hObject, eventdata, handles)
% hObject    handle to group_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
value               = get(handles.popupmenu5,'value');
if value == 1
    set(handles.popupmenu3,'Enable','off')
elseif value == 2
    set(handles.popupmenu3,'Enable','on')
end


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'string',{'native','fsaverage'});
