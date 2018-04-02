function varargout = fs_convert(varargin)
% FS_CONVERT MATLAB code for fs_convert.fig
%      FS_CONVERT, by itself, creates a new FS_CONVERT or raises the existing
%      singleton*.
%
%      H = FS_CONVERT returns the handle to a new FS_CONVERT or the handle to
%      the existing singleton*.
%
%      FS_CONVERT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FS_CONVERT.M with the given input arguments.
%
%      FS_CONVERT('Property','Value',...) creates a new FS_CONVERT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fs_convert_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fs_convert_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fs_convert

% Last Modified by GUIDE v2.5 16-Oct-2017 10:47:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fs_convert_OpeningFcn, ...
                   'gui_OutputFcn',  @fs_convert_OutputFcn, ...
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


% --- Executes just before fs_convert is made visible.
function fs_convert_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fs_convert (see VARARGIN)

% Choose default command line output for fs_convert
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.text2,'Enable','on');
set(handles.edit2,'Enable','on');
set(handles.text3,'Enable','off');
set(handles.edit3,'Enable','off');

% UIWAIT makes fs_convert wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fs_convert_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
condition                      = get(handles.popupmenu1,'string');
condition                      = char(condition(get(handles.popupmenu1,'value')));

if isequal(condition,'annot2label') || isequal(condition,'label2annot') || isequal(condition,'mgz2nifti') || isequal(condition,'nifti2mgz')
    set(handles.text2,'Enable','on');
    set(handles.edit2,'Enable','on');
    set(handles.text3,'Enable','off');
    set(handles.edit3,'Enable','off');
end
if isequal(condition,'label2label') || isequal(condition,'surf2surf') || isequal(condition,'label2nifti') || isequal(condition,'nifti2label') || isequal(condition,'surf2nifti') || isequal(condition,'nifti2surf')
    set(handles.text2,'Enable','on');
    set(handles.edit2,'Enable','on');
    set(handles.text3,'Enable','on');
    set(handles.edit3,'Enable','on');
end
if isequal(condition,'mgz2nifti') || isequal(condition,'nifti2mgz')
    set(handles.text4,'Enable','off');
    set(handles.popupmenu2,'Enable','off');
else
    set(handles.text4,'Enable','on');
    set(handles.popupmenu2,'Enable','on');
end

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
set(hObject,'string',{'annot2label','label2annot','label2label',...
                      'surf2surf','label2nifti','nifti2label',...
                      'surf2nifti','nifti2surf','mgz2nifti','nifti2mgz'});

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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

condition                      = get(handles.popupmenu1,'string');
condition                      = char(condition(get(handles.popupmenu1,'value')));
List                           = 'true';

if isequal(condition,'annot2label')
    pathname                   = uiget_multi(pwd, 'Pls select *.annot file');
    for i=1:length(pathname)
        [~,name,ext]  = fileparts(pathname{i});
        if ~isequal(name(1:2),'lh') && ~isequal(name(1:2),'rh')
            msgbox('The name of files MUST starts with lh or rh');
            List               = 'false';
            break;
        end
        if ~isequal(ext,'.annot')
            msgbox('Please selet *.annot file');
            List               = 'false';
            break;
        end
    end
    clear  i ext
elseif isequal(condition,'label2annot') || isequal(condition,'label2nifti') || isequal(condition,'label2label')
    pathname       = uiget_multi(pwd, 'Pls select *.label file');
    for i=1:length(pathname)
        [~,name,ext]  = fileparts(pathname{i});
        if ~isequal(name(1:2),'lh') && ~isequal(name(1:2),'rh')
            msgbox('The name of files MUST starts with lh or rh');
            List               = 'false';
            break;
        end
        if ~isequal(ext,'.label')
            msgbox('Please selet *.label file');
            List               = 'false';
            break;
        end
    end
    clear  i ext 
elseif isequal(condition,'nifti2label') || isequal(condition,'nifti2surf') || isequal(condition,'nifti2mgz')
    pathname       = uiget_multi(pwd, 'Pls select *.img/hdr/nii file');
    for i=1:length(pathname)
        [~,name,ext]  = fileparts(pathname{i});
%         if ~isequal(name(1:2),'lh') && ~isequal(name(1:2),'rh')
%             msgbox('The name of files MUST starts with lh or rh');
%             List               = 'false';
%             break;
%         end
        if ~isequal(ext,'.img') && ~isequal(ext,'.hdr') && ~isequal(ext,'.nii')
            msgbox('Please selet *.img/hdr/nii file');
            List               = 'false';
            break;
        end
    end
    clear  i ext
    
elseif isequal(condition,'mgz2nifti')
    pathname       = uiget_multi(pwd, 'Pls select *.mgz file');
    for i=1:length(pathname)
        [~,name,ext]  = fileparts(pathname{i});
%         if ~isequal(name(1:2),'lh') && ~isequal(name(1:2),'rh')
%             msgbox('The name of files MUST starts with lh or rh');
%             List               = 'false';
%             break;
%         end
        if ~isequal(ext,'.mgz') 
            msgbox('Please selet *.mgz file');
            List               = 'false';
            break;
        end
    end
    clear  i ext
    
elseif isequal(condition,'surf2surf') || isequal(condition,'surf2nifti')
    pathname       = uiget_multi(pwd, 'Pls select surface file');
    for i=1:length(pathname)
        [~,name,ext]  = fileparts(pathname{i});
        if ~isequal(name(1:2),'lh') && ~isequal(name(1:2),'rh')
            msgbox('The name of files MUST starts with lh or rh');
            List               = 'false';
            break;
        end
    end
    clear  i ext
end

if isequal(List,'true')
    pathname_done              = get(handles.listbox1,'string');
    set(handles.listbox1,'string',cat(1,pathname_done,pathname));
end





% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SUBJECTS_DIR

condition                      = get(handles.popupmenu1,'string');
condition                      = char(condition(get(handles.popupmenu1,'value')));
hemi                           = get(handles.popupmenu2,'string');
hemi                           = hemi{get(handles.popupmenu2,'value')};
soursub                        = get(handles.edit2,'string');
targsub                        = get(handles.edit3,'string');
outdir                         = get(handles.edit1,'string');
inputfiles                     = get(handles.listbox1,'string');

currp                          = which('fs_convert.m');
currp                          = fileparts(currp);

if isequal(condition,'annot2label')
    
    str                        = cell(0);
    for i=1:length(inputfiles)
        annotpath              = inputfiles{i};
        [~,Name,ext]           = fileparts(annotpath);
        outdir_temp            = [outdir,filesep,[Name,ext]];
        if ~isdir(outdir_temp)
            mkdir(outdir_temp);
        end
        commands               = ['mri_annotation2label ',' --annotation ',annotpath,' --hemi ',hemi,' --subject ',soursub,' --outdir ',outdir_temp];
        fs_run_unix(commands);
        
        str{i,1}               = outdir_temp;
        set(handles.listbox2,'string',str);
        clear annotpath commands outdir_temp Name ext 
        pause(0.5);
        fprintf('Done\n');
    end
    clear str i
    
elseif isequal(condition,'label2annot')
    
    vertices                    = freesurfer_read_surf([SUBJECTS_DIR,filesep,soursub,filesep,'surf',filesep,[hemi,'.white']]);
    vertices                    = [0:1:size(vertices,1)-1]';
    labels                      = zeros(length(vertices),1);
    
    ct.numEntries               = length(inputfiles);
    ct.orig_tab                 = outdir;
    for i=1:length(inputfiles)
        [~,Name]                = fileparts(inputfiles{i});
        fprintf('Reading label file: %s\n',Name);
        ct.struct_names{1,i}    = Name;
        color                   = [unidrnd(255) unidrnd(255) unidrnd(255) 0];
        ct.table(i,:)           = [color color(1) + color(2)*2^8 + color(3)*2^16 + color(4)*2^24];
        A                       = read_label([],inputfiles{i});
        A                       = A(:,1);
        labels(A+1)             = ct.table(i,end);
        clear A Name color
    end
    write_annotation([outdir,filesep,[hemi,'.',condition,'.',soursub,'.annot']], vertices, labels, ct);
    set(handles.listbox2,'string',[outdir,filesep,[hemi,'.',condition,'.',soursub,'.annot']]);
    clear i vertices labels ct
    fprintf('Done\n');
    
elseif isequal(condition,'label2nifti')
    
    str                         = cell(0);
    for i=1:length(inputfiles)
        [~,Name,ext]            = fileparts(inputfiles{i});
        command                 = ['mri_label2label ',' --srclabel ',inputfiles{i},' --srcsubject ',soursub,' --trgsubject ',targsub,' --trglabel ',[hemi,'.',Name,ext],' --regmethod surface ',' --hemi ',hemi,';'];
        command                 = cat(2,command,['mri_label2vol ',' --label ',[SUBJECTS_DIR,filesep,targsub,filesep,'label',filesep,[hemi,'.',Name,ext]],' --temp ',[SUBJECTS_DIR,filesep,targsub,filesep,'mri',filesep,'orig.mgz'],...
                                                 ' --subject ',targsub,' --hemi ',hemi,' --o ',[outdir,filesep,[Name,'.',targsub,'.nii']],...
                                                 ' --proj frac 0 1 0.1 --fillthresh 0.5 --reg ',[currp,filesep,'Funfiles',filesep,'register_ch2surf2vol.dat',';']]);
        fs_run_unix(command);
        str{i,1}                = [outdir,filesep,[Name,'.',targsub,'.nii']];
        set(handles.listbox2,'string',str);
        delete([SUBJECTS_DIR,filesep,targsub,filesep,'label',filesep,[hemi,'.',Name,ext]]);
        clear Name ext outfile command
        pause(0.5);
    end
    clear hemi  str
    fprintf('Done\n');
    
elseif isequal(condition,'nifti2label')
    
    str                         = cell(0);
    for i=1:length(inputfiles)
        [~,Name,ext]            = fileparts(inputfiles{i});
        command                 = ['mri_vol2vol ',' --mov ',inputfiles{i},' --o ',[SUBJECTS_DIR,filesep,soursub,filesep,'mri',filesep,['Temporary_',Name,'.nii']],...
                                   ' --targ ',[SUBJECTS_DIR,filesep,soursub,filesep,'mri',filesep,'rawavg.mgz'],' --regheader --interp nearest'];
        fs_run_unix(command);
        command                 = ['mri_vol2surf ',' --mov ',[SUBJECTS_DIR,filesep,soursub,filesep,'mri',filesep,['Temporary_',Name,'.nii']],...
                                   ' --reg ',[currp,filesep,'Funfiles',filesep,'register_ch2vol2surf.dat '],' --hemi ',hemi,' --out_type mgh ',...
                                   ' --o ',[SUBJECTS_DIR,filesep,soursub,filesep,'surf',filesep,[Name,'.mgh']],' --interp nearest',';'];
        command                 = cat(2,command,['mri_cor2label ',' --i ',[SUBJECTS_DIR,filesep,soursub,filesep,'surf',filesep,[Name,'.mgh']],...
                                                 ' --id 1 ',' --l ',[SUBJECTS_DIR,filesep,soursub,filesep,'label',filesep,[hemi,'.',Name,'.label']],...
                                                 ' --surf ',soursub,' ',hemi,';']);
        command                 = cat(2,command,['mri_label2label ',' --srclabel ',[SUBJECTS_DIR,filesep,soursub,filesep,'label',filesep,[hemi,'.',Name,'.label']],' --srcsubject ',soursub,...
                                                 ' --trgsubject ',targsub,' --trglabel ',[outdir,filesep,[hemi,'.',Name,'.',targsub,'.label']],...
                                                 ' --regmethod surface --hemi ',hemi,';']);
        fs_run_unix(command);
        str{i,1}                = [outdir,filesep,[hemi,'.',Name,'.',targsub,'.label']];
        set(handles.listbox2,'string',str);
        delete([SUBJECTS_DIR,filesep,soursub,filesep,'mri',filesep,['Temporary_',Name,'.nii']]);
        delete([SUBJECTS_DIR,filesep,soursub,filesep,'surf',filesep,[Name,'.mgh']]);
        delete([SUBJECTS_DIR,filesep,soursub,filesep,'label',filesep,[hemi,'.',Name,'.label']]);
        clear Name ext outfile command
        pause(0.5);
    end
    clear i hemi str
    fprintf('Done\n');
    
elseif isequal(condition,'label2label')

    str                         = cell(0);
    for i=1:length(inputfiles)
        [~,Name,ext]            = fileparts(inputfiles{i});
        command                 = ['mri_label2label ',' --srclabel ',inputfiles{i},' --srcsubject ',soursub,' --trgsubject ',targsub,' --trglabel ',[outdir,filesep,[Name,'.',targsub,'.label']],' --regmethod surface ',' --hemi ',hemi,';'];
        fs_run_unix(command);
        str{i,1}                = [outdir,filesep,[Name,'.',targsub,'.label']];
        set(handles.listbox2,'string',str);
        clear Name ext command
        pause(0.5);
    end
    clear  hemi str i
    
elseif isequal(condition,'surf2surf')

    str                         = cell(0);
    for i=1:length(inputfiles)
        [~,Name,ext]            = fileparts(inputfiles{i});
        command                 = ['mri_surf2surf ',' --srcsubject ',soursub,' --trgsubject ',targsub,' --hemi ',hemi,...
                                   ' --sval ',inputfiles{i},' --tval ',[outdir,filesep,[Name,'.',targsub,'.mgh']],';'];
        fs_run_unix(command);
        str{i,1}                = [outdir,filesep,[Name,'.',targsub,'.mgh']];
        set(handles.listbox2,'string',str);
        clear Name ext command
        pause(0.5);
    end
    clear  hemi str i
    
elseif isequal(condition,'nifti2surf')

    str                         = cell(0);
    command                     = ['mri_convert ',[SUBJECTS_DIR,filesep,soursub,filesep,'mri/orig/001.mgz'],' ',[SUBJECTS_DIR,filesep,soursub,filesep,'mri/orig/001.nii'],';'];
    command                     = cat(2,command,['bbregister ',' --s ',soursub,' --mov ',[SUBJECTS_DIR,filesep,soursub,filesep,'mri/orig/001.nii'],' --t1 --init-fsl ',...
                                  ' --reg ',[SUBJECTS_DIR,filesep,soursub,filesep,'mri/orig/',['register_',soursub,'.dat']]]);
    fs_run_unix(command);
    for i=1:length(inputfiles)
        [~,Name,ext]            = fileparts(inputfiles{i});
        command                 = ['mri_vol2surf --mov ',inputfiles{i},' --reg ',[SUBJECTS_DIR,filesep,soursub,filesep,'mri/orig/',['register_',soursub,'.dat']],...
                                   ' --projdist-max 0 1 0.1 --interp nearest --hemi ',hemi,' --out ',...
                                   [SUBJECTS_DIR,filesep,soursub,filesep,'surf',filesep,[hemi,'.',Name,ext,'.mgh']],';'];
        command                 = cat(2,command,['mri_surf2surf ',' --srcsubject ',soursub,' --trgsubject ',targsub,' --hemi ',hemi,...
                                    ' --sval ',[SUBJECTS_DIR,filesep,soursub,filesep,'surf',filesep,[hemi,'.',Name,ext,'.mgh']],...
                                    ' --tval ',[outdir,filesep,[hemi,'.',Name,'.',targsub,'.mgh']]]);
        fs_run_unix(command);
        str{i,1}                = [outdir,filesep,[Name,'.',targsub,'.mgh']];
        set(handles.listbox2,'string',str);
        delete([SUBJECTS_DIR,filesep,soursub,filesep,'surf',filesep,[hemi,'.',Name,ext,'.mgh']]);
        clear Name ext command 
        pause(0.5);
    end
    delete([SUBJECTS_DIR,filesep,soursub,filesep,'mri/orig/001.nii']);
    files                      = dir([SUBJECTS_DIR,filesep,soursub,filesep,'mri/orig/register*']);
    for ifile = 1:length(files)
        delete([SUBJECTS_DIR,filesep,soursub,filesep,'mri/orig/',files(ifile).name]);
    end
    clear  hemi str i ifile files
    
elseif isequal(condition,'surf2nifti')
    
    str                         = cell(0);
    command                     = ['mri_convert ',[SUBJECTS_DIR,filesep,targsub,filesep,'mri/orig/001.mgz'],' ',[SUBJECTS_DIR,filesep,targsub,filesep,'mri/orig/001.nii'],';'];
    command                     = cat(2,command,['bbregister ',' --s ',targsub,' --mov ',[SUBJECTS_DIR,filesep,targsub,filesep,'mri/orig/001.nii'],' --t1 --init-fsl ',...
                                  ' --reg ',[SUBJECTS_DIR,filesep,targsub,filesep,'mri/orig/',['register_',targsub,'.dat']]]);
    fs_run_unix(command);
    for i=1:length(inputfiles)
        [~,Name,ext]            = fileparts(inputfiles{i});
        command                 = ['mri_surf2surf ',' --srcsubject ',soursub,' --trgsubject ',targsub,' --hemi ',hemi,...
                                    ' --sval ',inputfiles{i},...
                                    ' --tval ',[SUBJECTS_DIR,filesep,targsub,filesep,'surf',filesep,[hemi,'.',targsub,Name,ext,'.mgh']],';'];
        command                 = cat(2,command,['mri_surf2vol --surfval ',[SUBJECTS_DIR,filesep,targsub,filesep,'surf',filesep,[hemi,'.',targsub,Name,ext,'.mgh']],...
                                    ' --hemi ',hemi,' --reg ',[SUBJECTS_DIR,filesep,targsub,filesep,'mri/orig/',['register_',targsub,'.dat']],...
                                    ' --projfrac 0.5 ',' --o ',[outdir,filesep,[Name,'.',targsub,'.nii']],...
                                    ' --template ',[SUBJECTS_DIR,filesep,targsub,filesep,'mri/orig/001.nii']]);
        fs_run_unix(command);
        str{i,1}                = [outdir,filesep,[Name,'.',targsub,'.nii']];
        set(handles.listbox2,'string',str);
        delete([SUBJECTS_DIR,filesep,targsub,filesep,'surf',filesep,[hemi,'.',targsub,Name,ext,'.mgh']]);
        clear Name ext command
        pause(0.5);
    end
    delete([SUBJECTS_DIR,filesep,targsub,filesep,'mri/orig/001.nii']);
    files                      = dir([SUBJECTS_DIR,filesep,targsub,filesep,'mri/orig/register*']);
    for ifile = 1:length(files)
        delete([SUBJECTS_DIR,filesep,targsub,filesep,'mri/orig/',files(ifile).name]);
    end
    clear  hemi str i ifile files
    
elseif isequal(condition,'nifti2mgz')
    str                         = cell(0);
    for i=1:length(inputfiles)
        [~,Name,ext]            = fileparts(inputfiles{i});
        command                 = ['mri_convert ',inputfiles{i},'  ',[outdir,filesep,[Name,ext,'.mgz']],';'];
        fs_run_unix(command);
        str{i,1}                = [outdir,filesep,[Name,ext,'.nii']];
        set(handles.listbox2,'string',str);
        clear Name ext command
        pause(0.5);
    end
    clear  hemi str i
    
elseif isequal(condition,'mgz2nifti')
    str                         = cell(0);
    for i=1:length(inputfiles)
        [~,Name,ext]            = fileparts(inputfiles{i});
        command                 = ['mri_convert ',inputfiles{i},'  ',[outdir,filesep,[Name,ext,'.nii']],';'];
        fs_run_unix(command);
        str{i,1}                = [outdir,filesep,[Name,ext,'.nii']];
        set(handles.listbox2,'string',str);
        clear Name ext command
        pause(0.5);
    end
    clear  hemi str i
end

% --- Executes during object creation, after setting all properties.
function pushbutton4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
convertImg = imread('Convert.png');
set(hObject,'CDATA',convertImg);
clear convertImg


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


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over popupmenu1.
function popupmenu1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'##########################',...
        '(1) The name of all files MUST starts with lh or rh such as lh.prefrontal.nii, rh.postcentral.label'},'Help');
    


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
