function varargout = recon_all_gui(varargin)
% RECON_ALL_GUI MATLAB code for recon_all_gui.fig
%      RECON_ALL_GUI, by itself, creates a new RECON_ALL_GUI or raises the existing
%      singleton*.
%
%      H = RECON_ALL_GUI returns the handle to a new RECON_ALL_GUI or the handle to
%      the existing singleton*.
%
%      RECON_ALL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECON_ALL_GUI.M with the given input arguments.
%
%      RECON_ALL_GUI('Property','Value',...) creates a new RECON_ALL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before recon_all_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to recon_all_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help recon_all_gui

% Last Modified by GUIDE v2.5 20-Mar-2018 13:35:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @recon_all_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @recon_all_gui_OutputFcn, ...
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


% --- Executes just before recon_all_gui is made visible.
function recon_all_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to recon_all_gui (see VARARGIN)

% Choose default command line output for recon_all_gui
global FREESURFER_HOME
addpath(genpath([FREESURFER_HOME,filesep,'matlab']));

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes recon_all_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = recon_all_gui_OutputFcn(hObject, eventdata, handles) 
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
folder_path = uigetdir(pwd);
set(handles.edit1,'string',folder_path);
clear folder_name


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SUBJECTS_DIR

if get(handles.checkbox1,'value') % get nifti images
    folder_path                            = uigetdir(pwd);
    if ischar(folder_path)
        subs                                   = dir(folder_path);
        subs_name                              = cell(0);
        k                                      = 1;
        for i=1:length(subs)
            Name                               = subs(i).name;
            if ~isequal(Name,'.') && ~isequal(Name,'..') && isdir([folder_path,filesep,Name])
                dicom                          = dir([folder_path,filesep,Name,filesep,'*.dicom']);
                if ~isempty(dicom)
                    subs_name{k,1}             = [folder_path,filesep,Name,filesep,dicom(1).name];
                    k                          = k+1;
                else
                    Img                        = dir([folder_path,filesep,Name,filesep,'co*.nii']);
                    if isempty(Img)
                        Img                    = dir([folder_path,filesep,Name,filesep,'co*.img']);
                    end
                    if ~isempty(Img)
                        subs_name{k,1}         = [folder_path,filesep,Name,filesep,Img(1).name];
                        k                      = k+1;
                    else
                        Img                    = dir([folder_path,filesep,Name,filesep,'o*.nii']);
                        if isempty(Img)
                            Img                = dir([folder_path,filesep,Name,filesep,'o*.img']);
                        end
                        if ~isempty(Img)
                            subs_name{k,1}     = [folder_path,filesep,Name,filesep,Img(1).name];
                            k = k+1;
                        else
                            Img                = dir([folder_path,filesep,Name,filesep,'*.nii']);
                            if isempty(Img)
                                Img            = dir([folder_path,filesep,Name,filesep,'*.img']);
                            end
                            if ~isempty(Img)
                                subs_name{k,1} = [folder_path,filesep,Name,filesep,Img(1).name];
                                k              = k+1;
                            else
                                fprintf('Can not find dicom/nifti image for subject: %s \n',Name);
                            end
                        end
                    end
                end
            end
        end
        clear k i Name folder_name
        set(handles.listbox1,'string',subs_name);
    end
else
    subs_name                              = uiget_multi(SUBJECTS_DIR, 'Please select subject folders');
    set(handles.listbox1,'string',subs_name);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SUBJECTS_DIR
global FREESURFER_HOME

set(handles.pushbutton4,'Enable','off');

% RUNNING                         = 'TRUE';
openmp                           = str2num(get(handles.edit4,'string'));
if round(openmp) ~= openmp
    error('The number of processors MUST be integer');
end

subjects_data                    = get(handles.listbox1,'string');
subjects_show                    = cell(size(subjects_data));
subjects_name                    = cell(size(subjects_data));
if get(handles.checkbox1,'value') % get nifti files
    for i=1:length(subjects_show)
        subjects_name{i}         = getname_long(subjects_data{i},2);
        subjects_show{i}         = cat(2,num2str(i),':(Waiting)',subjects_data{i});
    end
    set(handles.listbox1,'string',subjects_show);
    clear i subjects_show
    pause(0.5);
else                              % get subject folders
    for i=1:length(subjects_show)
        subjects_name{i}         = getname_long(subjects_data{i},1);
        subjects_show{i}         = cat(2,num2str(i),':(Waiting)',subjects_data{i});
    end
    set(handles.listbox1,'string',subjects_show);
    clear i  subjects_show 
    pause(0.5);
end

if ~isdir([SUBJECTS_DIR,filesep,'fsaverage'])
    fprintf('No fsaverage found under SUBJECTS_DIR: %s\n',SUBJECTS_DIR);
    fprintf('Copy fsaverage from FREESURFER_HOME to SUBJECTS_DIR, waiting ......\n');
    commands                     = ['cp -rf ',[FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage'],' ',SUBJECTS_DIR];
    fs_run_unix(commands);
    clear commands
end

for i=1:length(subjects_name)
    % running
    subjects_show                = get(handles.listbox1,'string');
    subjects_show{i}             = [num2str(i),':(Running)',subjects_data{i}];
    set(handles.listbox1,'string',subjects_show);
    clear subjects_show
    pause(0.5);
    
    % preprocessing
    if get(handles.checkbox1,'value')
        if ~exist([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'orig',filesep,'001.mgz'],'file')
        commands                 = ['recon-all -s ',subjects_name{i},' -i ',strtrim(subjects_data{i,:}),';'];
        fs_run_unix(commands);
        clear commands
        else
            fprintf('The preprocessing step has been done for subjid - %s\n',subjects_name{i});
        end
    end
    
    % autorecon1
    if get(handles.checkbox2,'value')
        if openmp <= 0
            commands         = ['recon-all -s ',subjects_name{i},' -autorecon1 -no-isrunning ',';'];
        else
            commands         = ['recon-all -s ',subjects_name{i},' -autorecon1 -no-isrunning ',' -parallel -openmp ',num2str(openmp),';'];
        end
        fs_run_unix(commands);
        clear commands
    end
    
    % autorecon2
    if get(handles.checkbox3,'value')
        if openmp <= 0
            commands         = ['recon-all -s ',subjects_name{i},' -autorecon2 -no-isrunning ',';'];
        else
            commands         = ['recon-all -s ',subjects_name{i},' -autorecon2 -no-isrunning ',' -parallel -openmp ',num2str(openmp),';'];
        end
        fs_run_unix(commands);
        clear commands
    end
    
    % autorecon3
    if get(handles.checkbox4,'value')
        if openmp <= 0
            commands         = ['recon-all -s ',subjects_name{i},' -autorecon3 -no-isrunning ',';'];
        else
            commands         = ['recon-all -s ',subjects_name{i},' -autorecon3 -no-isrunning ',' -parallel -openmp ',num2str(openmp),';'];
        end
        fs_run_unix(commands);
        clear commands
    end
    
    %%%%%%%%%%%%% Quality control
    outpath              = [SUBJECTS_DIR,filesep,subjects_name{i},filesep,'Quality_control'];
    % talariach checking
    if get(handles.checkbox7,'value')
        if ~isdir([outpath,filesep,'Talairach'])
            mkdir([outpath,filesep,'Talairach']);
        end
        if ~exist([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'transforms',filesep,'talairach.xfm'],'file')
            error('Can not find talariach transform: %s \n',[SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'transforms',filesep,'talairach.xfm']);
        end
        if ~exist([FREESURFER_HOME,filesep,'average',filesep,'mni305.cor.mgz'],'file')
            error('Can not find MNI template: %s \n',[FREESURFER_HOME,filesep,'average',filesep,'mni305.cor.mgz']);
        end
        if ~exist([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'orig.mgz'],'file')
            error('Can not find orig.mgz file: %s \n',[SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'orig.mgz']);
        end
        if ~exist([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'surf',filesep,'lh.white'],'file')
            error('Can not find lh.white file: %s \n',[SUBJECTS_DIR,filesep,subjects_name{i},filesep,'surf',filesep,'lh.white']);
        end
        if ~exist([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'surf',filesep,'rh.white'],'file')
            error('Can not find rh.white file: %s \n',[SUBJECTS_DIR,filesep,subjects_name{i},filesep,'surf',filesep,'rh.white']);
        end
        
        xfm                   = fs_read_talairach([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'transforms',filesep,'talairach.xfm']);
        mri305                = MRIread([FREESURFER_HOME,filesep,'average',filesep,'mni305.cor.mgz']);
        volmni                = mri305.vol;
        mriorig               = MRIread([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'orig.mgz']);
        white_lh              = freesurfer_read_surf([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'surf',filesep,'lh.white']);
        white_rh              = freesurfer_read_surf([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'surf',filesep,'rh.white']);
        
        ras_lh                = xfm*mriorig.vox2ras*inv(mriorig.tkrvox2ras)*[white_lh,ones(size(white_lh,1),1)]';
        ras_lh                = inv(mri305.tkrvox2ras)*[ras_lh',ones(size(ras_lh',1),1)]';
        ras_lh                = ras_lh(1:3,:)';
        ras_rh                = xfm*mriorig.vox2ras*inv(mriorig.tkrvox2ras)*[white_rh,ones(size(white_rh,1),1)]';
        ras_rh                = inv(mri305.tkrvox2ras)*[ras_rh',ones(size(ras_rh',1),1)]';
        ras_rh                = ras_rh(1:3,:)';
        ras_all               = [ras_lh;ras_rh];
        clear ras_lh ras_rh mri305 white_lh white_rh
        
        for islice = 75:15:195
            % coro view
            A                 = squeeze(volmni(:,:,islice));
            B                 = ras_all(round(ras_all(:,3)) == islice,[1,2]);
            H                 = figure;
            imagesc(A); colormap(gray); hold on; plot(B(:,1),B(:,2),'g.');
            axis equal
            axis off
            print(H,'-dtiff',[outpath,filesep,'Talairach',filesep,['cor_',num2str(islice),'.tif']]);
            close(H); clear A B H
        end
% %         Img                   = dir([outpath,filesep,'Talairach',filesep,'cor_*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Talairach',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Talairach',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Talairach',filesep,'cor_view.tif']);
% %         close(H); clear img H ImageAll
        
        for islice = 75:15:195
            % ax view
            A                 = squeeze(volmni(islice,:,:));
            B                 = ras_all(round(ras_all(:,2)) == islice,[1,3]);
            B(:,2)            = size(A,1) - B(:,2);
            H                 = figure;
            imagesc(fliplr(A)'); colormap(gray); hold on; plot(B(:,1),B(:,2),'g.');
            axis equal
            axis off
            print(H,'-dtiff',[outpath,filesep,'Talairach',filesep,['axe_',num2str(islice),'.tif']]);
            close(H); clear A B H
        end
% %         Img                   = dir([outpath,filesep,'Talairach',filesep,'axe_*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Talairach',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Talairach',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Talairach',filesep,'axe_view.tif']);
% %         close(H); clear img H ImageAll
        
        for islice = 75:15:195
            % sagittal view
            A                 = squeeze(volmni(:,islice,:));
            B                 = ras_all(round(ras_all(:,1)) == islice,[2,3]);
            H                 = figure;
            imagesc(A); colormap(gray); hold on; plot(B(:,2),B(:,1),'g.');
            axis equal
            axis off
            print(H,'-dtiff',[outpath,filesep,'Talairach',filesep,['sag_',num2str(islice),'.tif']]);
            close(H); clear A B H
        end
% %         Img                   = dir([outpath,filesep,'Talairach',filesep,'sag_*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Talairach',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Talairach',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Talairach',filesep,'sag_view.tif']);
% %         close(H); clear img H ImageAll
    end
    
    % skullstrip checking
    if get(handles.checkbox8,'value')
        if ~isdir([outpath,filesep,'Skullstrip'])
            mkdir([outpath,filesep,'Skullstrip']);
        end
        if ~exist([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'brainmask.mgz'],'file')
            error('Can not find brainmask.mgz file: %s \n',[SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'brainmask.mgz']);
        end
        brainmask             = MRIread([SUBJECTS_DIR,filesep,subjects_name{i},filesep,'mri',filesep,'brainmask.mgz']);
        brainmask             = brainmask.vol;
        for islice = 75:15:195
            % coro view
            A                 = squeeze(brainmask(:,:,islice));
            H                 = figure;
            imagesc(A); colormap(gray); axis equal; axis off
            print(H,'-dtiff',[outpath,filesep,'Skullstrip',filesep,['cor_',num2str(islice),'.tif']]);
            close(H); clear A H
        end
% %         Img                   = dir([outpath,filesep,'Skullstrip',filesep,'cor_*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Skullstrip',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Skullstrip',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Skullstrip',filesep,'cor_view.tif']);
% %         close(H); clear img H ImageAll
        
        for islice = 75:15:195
            % ax view
            A                 = squeeze(brainmask(islice,:,:));
            H                 = figure;
            imagesc(fliplr(A)'); colormap(gray); axis equal; axis off
            print(H,'-dtiff',[outpath,filesep,'Skullstrip',filesep,['axe_',num2str(islice),'.tif']]);
            close(H); clear A H
        end
% %         Img                   = dir([outpath,filesep,'Skullstrip',filesep,'axe_*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Skullstrip',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Skullstrip',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Skullstrip',filesep,'axe_view.tif']);
% %         close(H); clear img H ImageAll
        
        for islice = 75:15:195
            % sagittal view
            A                 = squeeze(brainmask(:,islice,:));
            H                 = figure;
            imagesc(A); colormap(gray); axis equal; axis off
            print(H,'-dtiff',[outpath,filesep,'Skullstrip',filesep,['sag_',num2str(islice),'.tif']]);
            close(H); clear A H
        end
% %         Img                   = dir([outpath,filesep,'Skullstrip',filesep,'sag_*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Skullstrip',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Skullstrip',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Skullstrip',filesep,'sag_view.tif']);
% %         close(H); clear img H ImageAll
    end
    
    % surface checking
    if get(handles.checkbox9,'value')
        if ~isdir([outpath,filesep,'Surface'])
            mkdir([outpath,filesep,'Surface']);
        end

        % surface checking (lh)
        fid                   = fopen([outpath,filesep,'Surface',filesep,'Tksurfer_lh.tcl'],'a+');
        fprintf(fid,'make_lateral_view\n');
        fprintf(fid,'save_tiff %s \n',[outpath,filesep,'Surface',filesep,'lh_lateral.tiff']);
        fprintf(fid,'rotate_brain_y 180\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[outpath,filesep,'Surface',filesep,'lh_medial.tiff']);
        fprintf(fid,'rotate_brain_x 90\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[outpath,filesep,'Surface',filesep,'lh_inferior.tiff']);
        fprintf(fid,'rotate_brain_x 190\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[outpath,filesep,'Surface',filesep,'lh_superior.tiff']);
        fprintf(fid,'exit');
        fclose(fid);
        command               = ['tksurfer ',subjects_name{i},' lh inflated -tcl ',[outpath,filesep,'Surface',filesep,'Tksurfer_lh.tcl']];
        fs_run_unix(command);
        delete([outpath,filesep,'Surface',filesep,'Tksurfer_lh.tcl']);
        clear command
        % rh surface
        fid                   = fopen([outpath,filesep,'Surface',filesep,'Tksurfer_rh.tcl'],'a+');
        fprintf(fid,'make_lateral_view\n');
        fprintf(fid,'save_tiff %s \n',[outpath,filesep,'Surface',filesep,'rh_lateral.tiff']);
        fprintf(fid,'rotate_brain_y 180\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[outpath,filesep,'Surface',filesep,'rh_medial.tiff']);
        fprintf(fid,'rotate_brain_x 90\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[outpath,filesep,'Surface',filesep,'rh_inferior.tiff']);
        fprintf(fid,'rotate_brain_x 190\n');
        fprintf(fid,'redraw\n');
        fprintf(fid,'save_tiff %s \n',[outpath,filesep,'Surface',filesep,'rh_superior.tiff']);
        fprintf(fid,'exit');
        fclose(fid);
        command               = ['tksurfer ',subjects_name{i},' rh inflated -tcl ',[outpath,filesep,'Surface',filesep,'Tksurfer_rh.tcl']];
        fs_run_unix(command);
        delete([outpath,filesep,'Surface',filesep,'Tksurfer_rh.tcl']);
        clear command
        
% %         Img                   = dir([outpath,filesep,'Surface',filesep,'lh_*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             clear A
% %         end
% %         Img                   = dir([outpath,filesep,'Surface',filesep,'rh_*.tif']);
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Surface',filesep,'Surface_check.tif']);
% %         close(H); clear img H ImageAll
        
        % white/pial checking
        fid                   = fopen([outpath,filesep,'Surface',filesep,'Tkmedit.tcl'],'a+');
        fprintf(fid,'for { set slice 75 } { $slice < 195 } {incr slice 15} {\n');
        fprintf(fid,'SetSurfaceLineColor 0 0 0 1 0 \n');
        fprintf(fid,'SetSurfaceLineColor 0 1 0 1 0 \n');
        fprintf(fid,'SetSurfaceLineColor 1 0 0 1 0 \n');
        fprintf(fid,'SetSurfaceLineColor 1 1 0 1 0 \n');
        fprintf(fid,'SetSurfaceLineColor 0 2 1 0 0 \n');
        fprintf(fid,'SetSurfaceLineWidth 0 0 3 \n');
        fprintf(fid,'SetSurfaceLineWidth 1 0 3 \n');
        fprintf(fid,'SetSurfaceLineWidth 0 2 3 \n');
        fprintf(fid,'SetSurfaceLineWidth 1 2 3 \n');
        fprintf(fid,'SetOrientation 0 \n');
        fprintf(fid,'SetSlice $slice \n');
        fprintf(fid,'RedrawScreen \n');
        fprintf(fid,'SaveTIFF %s \n',[outpath,filesep,'Surface',filesep,'coronal-$slice.tif']);
        fprintf(fid,'SetOrientation 1 \n');
        fprintf(fid,'SetSlice $slice \n');
        fprintf(fid,'RedrawScreen \n');
        fprintf(fid,'SaveTIFF %s \n',[outpath,filesep,'Surface',filesep,'horizontal-$slice.tif']);
        fprintf(fid,'SetOrientation 2 \n');
        fprintf(fid,'SetSlice $slice \n');
        fprintf(fid,'RedrawScreen \n');
        fprintf(fid,'SaveTIFF %s \n',[outpath,filesep,'Surface',filesep,'sagittal-$slice.tif']);
        fprintf(fid,'}\n');
        fprintf(fid,'exit');
        fclose(fid);
        command               = ['tkmedit ',subjects_name{i},' brainmask.mgz -surfs -tcl ',[outpath,filesep,'Surface',filesep,'Tkmedit.tcl']];
        fs_run_unix(command);
        delete([outpath,filesep,'Surface',filesep,'Tkmedit.tcl']);
        clear command
        
% %         Img                   = dir([outpath,filesep,'Surface',filesep,'coronal*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Surface',filesep,'coronal_view.tif']);
% %         close(H); clear img H ImageAll
% %         
% %         Img                   = dir([outpath,filesep,'Surface',filesep,'horizontal*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Surface',filesep,'horizontal_view.tif']);
% %         close(H); clear img H ImageAll
% %         
% %         Img                   = dir([outpath,filesep,'Surface',filesep,'sagittal*.tif']);
% %         ImageAll              = [];
% %         for img = 1:length(Img)
% %             A                 = imread([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             ImageAll          = cat(2,ImageAll,A);
% %             delete([outpath,filesep,'Surface',filesep,Img(img).name]);
% %             clear A
% %         end
% %         H = figure; imshow(ImageAll);
% %         print(H,'-dtiff',[outpath,filesep,'Surface',filesep,'sagittal_view.tif']);
% %         close(H); clear img H ImageAll
    end
    
    % Qcache
    if get(handles.checkbox5,'value')
        commands             = ['recon-all -s ',subjects_name{i},' -qcache -no-isrunning ',';'];
        fs_run_unix(commands);
        clear commands
    end
    
    % LGI
    if get(handles.checkbox6,'value')
        commands             = ['recon-all -s ',subjects_name{i},' -localGI; ','recon-all -s ',subjects_name{i},' -qcache -measure pial_lgi;'];
        fs_run_unix(commands);
        clear commands
    end
    
    % Done
    subjects_show                = get(handles.listbox1,'string');
    subjects_show{i}             = [num2str(i),':(Done)',subjects_data{i}];
    set(handles.listbox1,'string',subjects_show);
    clear subjects_show
    pause(0.5);
end
clear subjects_name k subs Name

set(handles.pushbutton4,'Enable','on');
fprintf('Recon-all Finished \n');


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6



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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_path = uigetdir(pwd);
set(handles.edit3,'string',folder_path);
clear folder_name


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
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

set(handles.listbox1,'string','');

% --------------------------------------------------------------------
function group_clear_Callback(hObject, eventdata, handles)
% hObject    handle to group_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
