function varargout = Multi_regression_gui(varargin)
% MULTI_REGRESSION_GUI MATLAB code for Multi_regression_gui.fig
%      MULTI_REGRESSION_GUI, by itself, creates a new MULTI_REGRESSION_GUI or raises the existing
%      singleton*.
%
%      H = MULTI_REGRESSION_GUI returns the handle to a new MULTI_REGRESSION_GUI or the handle to
%      the existing singleton*.
%
%      MULTI_REGRESSION_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTI_REGRESSION_GUI.M with the given input arguments.
%
%      MULTI_REGRESSION_GUI('Property','Value',...) creates a new MULTI_REGRESSION_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Multi_regression_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Multi_regression_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Multi_regression_gui

% Last Modified by GUIDE v2.5 11-Sep-2017 18:39:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Multi_regression_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Multi_regression_gui_OutputFcn, ...
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


% --- Executes just before Multi_regression_gui is made visible.
function Multi_regression_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Multi_regression_gui (see VARARGIN)

% Choose default command line output for Multi_regression_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Multi_regression_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Multi_regression_gui_OutputFcn(hObject, eventdata, handles) 
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
set(hObject,'string',{'thickness','area','area.pial','sulc','curv','pial_lgi','volume','jacobian_white','w-g.pct.mgh','white.H','white.K'});


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
set(hObject,'string',{'0','5','10','15','20','25'});


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
set(hObject,'string',{'lh','rh'});


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g_subjid                 = get(handles.listbox1,'string');
variables                = get(handles.listbox3,'string'); 
variables                = str2num(variables);
covar                    = get(handles.listbox2,'string'); 
covar                    = str2num(covar);
if isempty(g_subjid) | isempty(variables)
    msgbox('Pls select group subjects or variables');
elseif length(g_subjid) ~= size(variables,1)
    msgbox('The group subjids do not match their variables');
else
    desig                = ones(length(g_subjid),1);
    desig                = [desig,variables];
    ylabel               = cell(0);
    for i=1:length(g_subjid)
        [~,A]            = fileparts(g_subjid{i});
        ylabel           = cat(2,ylabel,A);
        clear A
    end
    clear i
    if isempty(covar)
        figure; imagesc(desig); colormap(gray); title('Design Matrix');
        set(gca,'XTick',[1:size(desig,2)]);
        A                = cell(0);
        for i=1:size(variables,2)
            A            = cat(2,A,['var',num2str(i)]);
        end
        set(gca,'XTicklabel',cat(2,{'group'},A)); xticklabel_rotate; clear A
        set(gca,'YTick',1:length(ylabel));
        set(gca,'YTicklabel',ylabel);
        axis image;
    else
        if size(covar,1) ~= length(g_subjid)
            msgbox('Error: covariates do not match the number of subjects','ERROR');
        else
            xlabel       = cell(1,size(covar,2));
            for i=1:length(xlabel)
                xlabel{i} = ['cov',num2str(i)];
            end
            clear i
            desig        = [desig,covar];
            A            = cell(0);
            for i=1:size(variables,2)
                A        = cat(2,A,['var',num2str(i)]);
            end
            A            = cat(2,{'group'},A);
            A            = cat(2,A,xlabel);
            figure; imagesc(desig); colormap(gray); title('Design Matrix');
            set(gca,'XTick',1:size(desig,2));
            set(gca,'XTicklabel',A); xticklabel_rotate; clear A
            set(gca,'YTick',1:length(ylabel));
            set(gca,'YTicklabel',ylabel);
            axis image;
            clear xlabel
        end
    end
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.pushbutton2,'value')
    [label,labelpath] = uigetfile({'*.label'},'Pls select a mask (*.label)');
    if ~isempty(label) & label ~= 0
        set(handles.edit3,'string',[labelpath,filesep,label]);
    end
end


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.pushbutton3,'value')
    output = uigetdir(pwd,'Pls select output folder');
    if ~isempty(output) & output ~= 0
        set(handles.edit4,'string',output);
    end
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME
global SUBJECTS_DIR

% set(handles.pushbutton4,'Enable','off');
% get information
measure                        = get(handles.popupmenu1,'string'); % measure
measure                        = measure{get(handles.popupmenu1,'value')};
smooth                         = get(handles.popupmenu2,'string'); % smooth
smooth                         = smooth{get(handles.popupmenu2,'value')};
hemi                           = get(handles.popupmenu3,'string'); % hemi
hemi                           = hemi{get(handles.popupmenu3,'value')};
subjids                        = get(handles.listbox1,'string');  % subjid list
variable                       = str2num(get(handles.listbox3,'string'));  % subjid list
if isempty(variable)
    error('Please input variable(s)');
else
    variable                   = variable - repmat(mean(variable,1),size(variable,1),1); % demean variables
    if size(variable,1) ~= length(subjids)
        error('The number of variables does not match the number of subjects');
    end
end
cov                            = str2num(get(handles.listbox2,'string')); % covariates
if ~isempty(cov)
    cov                        = cov - repmat(mean(cov,1),size(cov,1),1); % demean covs
    if size(cov,1) ~= length(subjids)
        error('The number of covariates does not match the number of subjects');
    end
end
contrast                       = str2num(get(handles.edit1,'string')); % contrast
outputdir                      = get(handles.edit4,'string'); % output folder
if isempty(outputdir)
    outputdir                  = pwd;
end
outputname                     = get(handles.edit2,'string'); % output name

label                          = get(handles.edit3,'string'); % mask
if isempty(label)
    if isequal(hemi,'lh')
        label                  = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'label',filesep,'lh.cortex.label'];
    elseif isequal(hemi,'rh')
        label                  = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'label',filesep,'rh.cortex.label'];
    end
    clear currp
end
save([outputdir,filesep,'AFBATpara.mat'],'measure','smooth','hemi',...
     'subjids','variable','label','cov','contrast','outputdir','outputname');
 
 %% check files
RUN_glm                    = 'TRUE';
for i=1:length(subjids)
    filename               = [subjids{i},filesep,'surf',filesep,[hemi,'.',measure,'.fwhm',smooth,'.fsaverage.mgh']];
    if ~exist(filename,'file')
        fprintf('Can not find: %s \n',filename);
        RUN_glm            = 'FALSE';
    end
    clear filename
end

%%
if isequal(RUN_glm,'TRUE')
    % generate .fsgd file
    if ~exist([outputdir,filesep,'MultiRegression.fsgd'],'file')
        fid                       = fopen([outputdir,filesep,'MultiRegression.fsgd'],'a+');
        fprintf(fid,'GroupDescriptorFile 1 \n');
        fprintf(fid,'Title multiple_regression \n');
        fprintf(fid,'Class g1 \n');
        fprintf(fid,'Variables ');
        for i=1:size(variable,2);
            fprintf(fid,' var%s ',num2str(i));
        end;
        if ~isempty(cov)
            for i=1:size(cov,2);
                fprintf(fid,' cov%s ',num2str(i));
            end;
            fprintf(fid,'\n');
        else
            fprintf(fid,'\n');
        end
        for i=1:length(subjids)
            [~,Name]              = fileparts(subjids{i});
            fprintf(fid,'Input %s g1 ',Name);
            for ic = 1:size(variable,2);
                fprintf(fid,' %f ',variable(i,ic));
            end;
            clear ic
            if ~isempty(cov)
                for ic = 1:size(cov,2);
                    fprintf(fid,' %f ',cov(i,ic));
                end;
                clear ic
            end
            fprintf(fid,'\n');
            clear Name
        end
        fclose(fid);
        clear cov_g1 cov_g2 i
    else
        fprintf('The fsgd file already exists: %s \n',[outputdir,filesep,'MultiRegression.fsgd']);
    end
    
    % generate .mtx file
    if ~exist([outputdir,filesep,'MultiRegression_contrast.mtx'],'file')
        fid                        =  fopen([outputdir,filesep,'MultiRegression_contrast.mtx'],'a+');
        design                     = zeros(1,1+size(variable,2)+size(cov,2));
        if length(contrast) > length(design)
            error('Contrast is NOT correct');
        elseif length(contrast) == length(design)
            for i=1:length(contrast);
                fprintf(fid,' %d ',contrast(i));
            end;
            clear i
        elseif length(contrast) < length(design)
            for i=1:length(contrast);
                fprintf(fid,' %d ',contrast(i));
            end;
            clear i
            for i=1:length(design)-length(contrast);
                fprintf(fid,' %d ',0);
            end;
            clear i
        end
        fclose(fid);
    else
        fprintf('The mtx file already exists: %s \n',[outputdir,filesep,'MultiRegression_contrast.mtx']);
    end
    
    % running GLM with command
    if isempty(dir([SUBJECTS_DIR,filesep,'fsaverage']))
        fprintf('Copy fsaverage from %s to %s\n',FREESURFER_HOME,SUBJECTS_DIR);
        fprintf('Waiting......\n');
        unix(['cp -rf ',[FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage'],' ',SUBJECTS_DIR]);
    end
    cd(outputdir);
    statistic_command('MultiRegression.fsgd',{'MultiRegression_contrast.mtx'},[measure,'.fwhm',smooth,'.fsaverage'], hemi,label,'doss', ['MultiRegression_',hemi,'_',measure,'_',outputname]);
    
    %  set(handles.pushbutton4,'Enable','on');
end
% %%
% % read data
% if isempty(label)
%     label = '';
%     A = load_mgh([subjids{1},filesep,'surf',filesep,[hemi,'.',measure,'.fwhm',smooth,'.fsaverage.mgh']]);
%     data  = zeros(length(subjids),length(A));
%     clear A
% else
%     label = fs_read_label(label);
%     data  = zeros(length(subjids),length(label));
% end
% 
% fprintf('Reading data ');
% for i=1:length(subjids)
%     fprintf('. ');
%     if ~mod(i,100)
%         fprintf('\n');
%     end
%     A = load_mgh([subjids{i},filesep,'surf',filesep,[hemi,'.',measure,'.fwhm',smooth,'.fsaverage.mgh']]);
%     if isempty(label)
%         data(i,:) = A;
%     else
%         data(i,:) = A(label);
%     end
%     clear A
% end
% 
% % design matrix and contrast
% design      = ones(length(subjids),1);
% variable    = variable - repmat(mean(variable,1),size(variable,1),1); % demean variaables
% design      = [design,variable];
%     
% if ~isempty(cov)
%     cov    = cov - repmat(mean(cov,1),size(cov,1),1); % demean covs
%     design = [design,cov];
% end
% if length(contrast) < size(design,2)
%     contrast = [contrast,zeros(1,size(design,2)-length(contrast))];
% end
% 
% % glm fit
% fprintf('GLM fit. Waiting ...... \n');
% step        = 2000;
% iters       = ceil(size(data,2)/step);
% glmpara.x   = design;
% glmpara.con = contrast;
% tem_A       = zeros(size(contrast,2),size(data,2));
% tem_B       = zeros(1,size(data,2));
% tem_C       = zeros(1,size(data,2));
% for i=1:iters
%     fprintf('. ');
%     if i~= iters
%         index     = (i-1)*step + 1 : i*step;
%     else
%         index     = (i-1)*step + 1 : size(data,2);
%     end
%     glmpara.y      = data(:,index);
%     glmout         = AFBATglm(glmpara);
%     tem_A(:,index) = glmout.beta;
%     tem_B(index)   = sign(glmpara.con*glmout.beta)'.*sqrt(glmout.F);
%     tem_C(index)   = -log10(glmout.P);
% end
% fprintf('\n');
% 
% % save results
% fprintf('Saving statistic results ...... \n');
% [vol,M,mr_parms] = load_mgh([subjids1{1},filesep,'surf',filesep,[hemi,'.',measure,'.fwhm',smooth,'.fsaverage.mgh']]);
% 
% if isempty(label)
%     beta   = tem_A;
%     Tvalue = tem_B;
%     Pvalue = tem_C;
% else
%     beta   = zeros(size(contrast,2),length(vol)); beta(:,label) = tem_A;
%     Tvalue = zeros(1,length(vol)); Tvalue(label) = tem_B;
%     Pvalue = zeros(1,length(vol)); Pvalue(label) = tem_C;
% end
% clear tem_A tem_B tem_C
% 
% fname = [outputdir,filesep,[outputname,'_',measure,'_AFBAT001.mgh']]; save_mgh(Tvalue,fname,M,mr_parms); clear frame
% fname = [outputdir,filesep,[outputname,'_',measure,'_AFBAP001.mgh']]; save_mgh(Pvalue,fname,M,mr_parms); clear frame
% for i=1:size(beta,1)
%     if i < 10
%         fname = [outputdir,filesep,[outputname,'_',measure,'_Beta00',num2str(i),'.mgh']];
%     elseif i < 100
%         fname = [outputdir,filesep,[outputname,'_',measure,'_Beta0',num2str(i),'.mgh']];
%     else
%         fname = [outputdir,filesep,[outputname,'_',measure,'_Beta',num2str(i),'.mgh']];
%     end
%     save_mgh(beta(i,:),fname,M,mr_parms); clear frame
% end
% fprintf('Finished.\n');
% clear glmpara beta Tvalue Pvalue M mr_parms i
% set(handles.pushbutton4,'Enable','on');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SUBJECTS_DIR

measure                    = get(handles.popupmenu1,'string'); % measure
measure                    = measure{get(handles.popupmenu1,'value')};
smooth                     = get(handles.popupmenu2,'string'); % smooth
smooth                     = smooth{get(handles.popupmenu2,'value')};
hemi                       = get(handles.popupmenu3,'string'); % hemi
hemi                       = hemi{get(handles.popupmenu3,'value')};

if get(handles.pushbutton5,'value')
    pathname = uiget_multi(SUBJECTS_DIR, 'Pls select subject folders');
    if isempty(get(handles.listbox1,'string'))
        set(handles.listbox1,'string',pathname);
        for i = 1:length(pathname)
            if ~exist([pathname{i},filesep,'surf',filesep,[hemi,'.',measure,'.fwhm',smooth,'.fsaverage.mgh']],'file')
                fprintf('Can not find: %s \n',[pathname{i},filesep,'surf',filesep,[hemi,'.',measure,'.fwhm',smooth,'.fsaverage.mgh']]);
            end
        end
    else
        msgbox('The group subjects must be cleared before the next selection','Warning');
    end
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.pushbutton6,'value')
    [extname,pathname] = uigetfile({'*.mat';'*.txt';'*.xls';'*.xlsx'},'Pls select covariate file');
    if ischar(pathname)
        [~,~,ext] = fileparts(extname);
        if isequal(ext,'.txt')
            covs = load([pathname,filesep,extname]);
        elseif isequal(ext,'.mat')
            A = whos('-file',[pathname,filesep,extname]);
            load([pathname,filesep,extname]);
            covs = eval(A.name);
            clear A
        elseif isequal(ext,'*.xls') || isequal(ext,'*.xlsx')
            covs = xlsread([pathname,filesep,extname]);
        end
        if isempty(get(handles.listbox2,'string'))
            set(handles.listbox2,'string',num2str(covs));
        else
            msgbox('The covariates must be cleared before the next selection','Warning');
        end
    end
end

% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.pushbutton7,'value')
    [extname,pathname] = uigetfile({'*.mat';'*.txt';'*.xls';'*.xlsx'},'Pls select covariate file');
    if ischar(pathname)
        [~,~,ext] = fileparts(extname);
        if isequal(ext,'.txt')
            covs = load([pathname,filesep,extname]);
        elseif isequal(ext,'.mat')
            A = whos('-file',[pathname,filesep,extname]);
            load([pathname,filesep,extname]);
            covs = eval(A.name);
            clear A
        elseif isequal(ext,'*.xls') || isequal(ext,'*.xlsx')
            covs = xlsread([pathname,filesep,extname]);
        end
        if isempty(get(handles.listbox3,'string'))
            set(handles.listbox3,'string',num2str(covs));
        else
            msgbox('The covariates must be cleared before the next selection','Warning');
        end
    end
end


% --------------------------------------------------------------------
function group_clear_Callback(hObject, eventdata, handles)
% hObject    handle to group_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear_listbox1 = getappdata(0,'clear_listbox1');
clear_listbox3 = getappdata(0,'clear_listbox3');
clear_listbox2 = getappdata(0,'clear_listbox2');
if clear_listbox1
    set(handles.listbox1,'string','');
end
if clear_listbox3
    set(handles.listbox3,'string','');
end
if clear_listbox2
    set(handles.listbox2,'string','');
end
clear clear_listbox1 clear_listbox3 clear_listbox2


% --------------------------------------------------------------------
function group_rightclic_Callback(hObject, eventdata, handles)
% hObject    handle to group_rightclic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox1.
function listbox1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'clear_listbox1',1);
setappdata(0,'clear_listbox3',0);
setappdata(0,'clear_listbox2',0);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox3.
function listbox3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'clear_listbox1',0);
setappdata(0,'clear_listbox3',1);
setappdata(0,'clear_listbox2',0);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox2.
function listbox2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'clear_listbox1',0);
setappdata(0,'clear_listbox3',0);
setappdata(0,'clear_listbox2',1);


% --- Executes during object creation, after setting all properties.
function pushbutton4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
