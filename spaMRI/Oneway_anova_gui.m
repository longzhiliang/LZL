function varargout = Oneway_anova_gui(varargin)
% ONEWAY_ANOVA_GUI MATLAB code for Oneway_anova_gui.fig
%      ONEWAY_ANOVA_GUI, by itself, creates a new ONEWAY_ANOVA_GUI or raises the existing
%      singleton*.
%
%      H = ONEWAY_ANOVA_GUI returns the handle to a new ONEWAY_ANOVA_GUI or the handle to
%      the existing singleton*.
%
%      ONEWAY_ANOVA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ONEWAY_ANOVA_GUI.M with the given input arguments.
%
%      ONEWAY_ANOVA_GUI('Property','Value',...) creates a new ONEWAY_ANOVA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Oneway_anova_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Oneway_anova_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Oneway_anova_gui

% Last Modified by GUIDE v2.5 23-Apr-2017 13:20:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Oneway_anova_gui_OpeningFcn, ...
    'gui_OutputFcn',  @Oneway_anova_gui_OutputFcn, ...
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


% --- Executes just before Oneway_anova_gui is made visible.
function Oneway_anova_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Oneway_anova_gui (see VARARGIN)

% Choose default command line output for Oneway_anova_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Oneway_anova_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Oneway_anova_gui_OutputFcn(hObject, eventdata, handles)
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
g_subjid                        = get(handles.listbox1,'string');
covar                           = str2num(get(handles.listbox2,'string')); 
label                           = str2num(get(handles.edit1,'string')); 
model                           = get(handles.popupmenu4,'value');
if model == 1
    model                       = 'dods';
elseif model == 2
    model                       = 'doss';
end

if isempty(g_subjid)
    msgbox('Pls select group subjects');
elseif isempty(label)
    msgbox('Please assign each subject a label');
elseif length(label) ~= length(g_subjid)
    msgbox('The label is wrong. Pls check');
else
    num_class                   = unique(label);
    desig                       = zeros(length(g_subjid),length(num_class));
    for i=1:length(num_class)
        desig(label == num_class(i),i) = 1;
    end
    clear i
    
    ylabel                      = cell(length(g_subjid),1);
    for i=1:length(g_subjid)
        [~,ylabel{i}]           = fileparts(g_subjid{i});
    end
    clear i
    A                           = cell(0);
    for i=1:size(desig,2)
        A                       = cat(2,A,['group',num2str(i)]);
    end
    if isempty(covar)
        figure; imagesc(desig); colormap(gray); title('Design Matrix');
        set(gca,'XTick',1:size(desig,2));
        set(gca,'XTicklabel',A); xticklabel_rotate; clear A
        set(gca,'YTick',1:length(ylabel));
        set(gca,'YTicklabel',ylabel);
        axis image;
    else
        if size(covar,1) ~= length(g_subjid)
            msgbox('Error: covariates do not match the number of subjects','ERROR');
        else
            if isequal(model,'doss')
                xlabel               = cell(1,size(covar,2));
                for i=1:length(xlabel)
                    xlabel{i}        = ['cov',num2str(i)];
                end
                clear i
                desig                = [desig,covar];
            elseif isequal(model,'dods')
                xlabel               = cell(1,size(covar,2)*length(num_class));
                covar_dods           = zeros(size(covar,1),size(covar,2)*length(num_class));
                for i=1:size(covar,2) 
                    for ig = 1:length(num_class)
                        xlabel{length(num_class)*i-length(num_class)+ig}    = ['g',num2str(ig),'-cov',num2str(i)];
                        covar_dods(label==num_class(ig),length(num_class)*i-length(num_class)+ig)   = covar(label==num_class(ig),i);
                    end
                    clear ig
                end
                clear i
                desig                = [desig,covar_dods];
                clear covar_dods
            end
            
            figure; imagesc(desig); colormap(gray); title('Design Matrix');
            set(gca,'XTick',1:size(desig,2));
            set(gca,'XTicklabel',cat(2,A,xlabel)); xticklabel_rotate; clear A
            set(gca,'YTick',1:length(ylabel));
            set(gca,'YTicklabel',ylabel);
            axis image;
            clear xlabel
        end
    end
end
        
%     elseif model == 2 % within-subject
%         if length(g_subjid) ~= size(covar,1)
%             msgbox('The number of coariates are NOT correct');
%         else
%             ylabel = cell(length(g_subjid),1);
%             for i=1:length(g_subjid)
%                 [~,ylabel{i}] = fileparts(g_subjid{i});
%             end
%             
%             num_class = unique(label); % number of repeated measures
%             desig     = zeros(length(g_subjid),length(find(label == num_class(1)))+length(num_class)-1);
%             A         = cell(0); % xlabel name
%             for i=1:length(find(label == num_class(1))) % add subjids
%                 desig((i-1)*length(num_class)+1:i*length(num_class),i) = ones(length(num_class),1);
%                 A = cat(2,A,['subjid',num2str(i)]);
%             end
%             for i=1:length(num_class)-1 % add between-tp
%                 desig(label == num_class(1),length(find(label == num_class(1)))+i) = 1;
%                 desig(label == num_class(1+i),length(find(label == num_class(1)))+i) = -1;
%                 A = cat(2,A,['tp1_vs_tp',num2str(i+1)]);
%             end
%             clear i
%             
%             if isempty(covar)
%                 figure; imagesc(desig); colormap(gray); title('Design Matrix');
%                 set(gca,'XTick',1:size(desig,2));
%                 set(gca,'XTicklabel',A); xticklabel_rotate; clear A
%                 set(gca,'YTick',1:length(ylabel));
%                 set(gca,'YTicklabel',ylabel);
%                 axis image;
%             else
%                 xlabel = cell(1,size(covar,2));
%                 for i=1:length(xlabel)
%                     xlabel{i} = ['cov',num2str(i)];
%                 end
%                 clear i
%                 A  = cat(2,A,xlabel);
%                 clear xlabel
%                 
%                 desig = [desig, covar];
%                 figure; imagesc(desig); colormap(gray); title('Design Matrix');
%                 set(gca,'XTick',1:size(desig,2));
%                 set(gca,'XTicklabel',A); xticklabel_rotate; clear A
%                 set(gca,'YTick',1:length(ylabel));
%                 set(gca,'YTicklabel',ylabel);
%                 axis image;
%                 clear xlabel A desig
%             end
%         end
%     end
% end


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
measure                              = get(handles.popupmenu1,'string'); % measure
measure                              = measure{get(handles.popupmenu1,'value')};
smooth                               = get(handles.popupmenu2,'string'); % smooth
smooth                               = smooth{get(handles.popupmenu2,'value')};
hemi                                 = get(handles.popupmenu3,'string'); % hemi
hemi                                 = hemi{get(handles.popupmenu3,'value')};
model                                = get(handles.popupmenu4,'string'); % model
model                                = model{get(handles.popupmenu4,'value')};
subjids                              = get(handles.listbox1,'string');  % subjid list. 
label                                = get(handles.edit3,'string'); % mask
cov                                  = str2num(get(handles.listbox2,'string')); % covariates
if ~isempty(cov)
    cov                              = cov - repmat(mean(cov,1),size(cov,1),1); % demean covs
    if size(cov,1) ~= length(subjids)
        error('The number of covariates does not match the number of subjects');
    end
end
sublabel                             = str2num(get(handles.edit1,'string')); % label for each subjid. 
if length(sublabel) ~= length(subjids)
    error('Please assign a label to each subject');
end
outputdir                            = get(handles.edit4,'string'); % output folder
if isempty(outputdir)
    outputdir                        = pwd;
end
outputname                           = get(handles.edit2,'string'); % output name


if isempty(label)
    if isequal(hemi,'lh')
        label                        = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'label',filesep,'lh.cortex.label'];
    elseif isequal(hemi,'rh')
        label                        = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'label',filesep,'rh.cortex.label'];
    end
    clear currp
end
save([outputdir,filesep,'AFBATpara.mat'],'measure','smooth','hemi',...
    'subjids','label','cov','sublabel','outputdir','outputname','model');

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
    L                                    = unique(sublabel);
    % generate .fsgd file
    if ~exist([outputdir,filesep,'OnewayAnova_Between.fsgd'],'file')
        fid                              = fopen([outputdir,filesep,'OnewayAnova_Between.fsgd'],'a+');
        fprintf(fid,'GroupDescriptorFile 1 \n');
        fprintf(fid,'Title OnewayAnova \n');
        for i=1:length(L);
            fprintf(fid,'Class g%d \n',L(i));
        end;
        clear i
        if ~isempty(cov)
            fprintf(fid,'Variables ');
            for i=1:size(cov,2);
                fprintf(fid,' cov%s ',num2str(i));
            end;
            fprintf(fid,'\n');
        else
            fprintf(fid,'\n');
        end
        for i=1:length(subjids)
            [~,Name]                     = fileparts(subjids{i});
            fprintf(fid,'Input %s  g%d ',Name,sublabel(i));
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
        clear  i
    else
        fprintf('The fsgd file already exists: %s \n',[outputdir,filesep,'OnewayAnova_Between.fsgd']);
    end
    
    % generate .mtx file
    if ~exist([outputdir,filesep,'OnewayAnova_Between_MainEffect_contrast.mtx'],'file')
        fid                              =  fopen([outputdir,filesep,'OnewayAnova_Between_MainEffect_contrast.mtx'],'a+');
        
        for ic = 2:length(L)
            contrast                     = zeros(1,length(L));
            contrast([1,ic])             = [1 -1];
            for i=1:length(contrast);
                fprintf(fid,'%d  ',contrast(i));
            end;
            clear i
            if ~isempty(cov)
                if isequal(model,'doss')
                    fprintf(fid,' %d ',zeros(1,size(cov,2)));
                elseif isequal(model,'dods')
                    fprintf(fid,' %d ',zeros(1,size(cov,2)*length(L)));
                end
            end
            fprintf(fid,'\n');
            clear contrast
        end
        fclose(fid);
    else
        fprintf('The mtx file already exists: %s \n',[outputdir,filesep,'OnewayAnova_Between_MainEffect_contrast.mtx']);
    end
    
    if isempty(dir([SUBJECTS_DIR,filesep,'fsaverage']))
        fprintf('Copy fsaverage from %s to %s\n',FREESURFER_HOME,SUBJECTS_DIR);
        fprintf('Waiting......\n');
        unix(['cp -rf ',[FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage'],' ',SUBJECTS_DIR]);
    end
    cd(outputdir);
    statistic_command('OnewayAnova_Between.fsgd',{'OnewayAnova_Between_MainEffect_contrast.mtx'},[measure,'.fwhm',smooth,'.fsaverage'], hemi,label,model, ['OnewayAnova_Between_',hemi,'_',measure,'_',outputname]);
end
% elseif isequal(model,'Within-subject')
%     for ic = 2:length(L)
%         if length(sublabel == L(1)) ~= length(sublabel == L(ic))
%             error('Repeated ANOVA analysis fails. Please check subject labels');
%         end
%     end
%     clear ic
%     if length(subjids) ~= size(cov,1)
%         error('The covariate MUST be matched with inputed number of subjids');
%     end
%     
%     % generate .fsgd file
%     if ~exist([outputdir,filesep,'OnewayAnova_Within.fsgd'],'file')
%         fid           = fopen([outputdir,filesep,'OnewayAnova_Within.fsgd'],'a+');
%         fprintf(fid,'GroupDescriptorFile 1 \n');
%         fprintf(fid,'Title  repeated_anova \n');
%         for i=1:length(find(sublabel == L(1))); fprintf(fid,'Class subjid%d \n',i); end; clear i
%         fprintf(fid,'Variables ');
%         for i=2:length(L); fprintf(fid,' tp1_vs_tp%d ',i); end; clear i
%         if ~isempty(cov)
%             for i=1:size(cov,2); fprintf(fid,' cov%s ',num2str(i)); end; fprintf(fid,'\n');
%         end
%         variable = zeros(length(subjids),length(L)-1);
%         for i=1:length(L)-1
%             for ic = 1:length(find(sublabel == L(1)))
%                 variable([(ic-1)*length(L)+1,(ic-1)*length(L)+1+i],i) = [1 -1];
%             end
%         end
%         clear i ic
%         K = 1;
%         for i=1:length(subjids)
%             [~,Name]   = fileparts(subjids{i});
%             fprintf(fid,'Input %s subjid%d ',Name,K);
%             if ~mod(i,length(L))
%                 K = K+1;
%             end
%             for ic = 1:size(variable,2); fprintf(fid,' %d ',variable(i,ic)); end; clear ic
%             if ~isempty(cov)
%                 for ic = 1:size(cov,2); fprintf(fid,' %f ',cov(i,ic));end; clear ic
%             end
%             fprintf(fid,'\n');
%             clear Name
%         end
%         fclose(fid);
%         clear variable i K
%     else
%         fprintf('The fsgd file already exists: %s \n',[outputdir,filesep,'OnewayAnova_Within.fsgd']);
%     end
%     
%     % generate .mtx file
%     if ~exist([outputdir,filesep,'OnewayAnova_Within_MainEffect_contrast.mtx'],'file')
%         fid            =  fopen([outputdir,filesep,'OnewayAnova_Within_MainEffect_contrast.mtx'],'a+');
%         for i=1:length(L)-1
%             for ic=1:length(find(sublabel==L(1)));fprintf(fid,'%d  ',0);end;clear ic
%             for ic=1:length(L)-1;
%                 if i == ic
%                     fprintf(fid,'%d  ',1);
%                 else
%                     fprintf(fid,'%d  ',0);
%                 end
%             end
%             for ic=1:size(cov,2);fprintf(fid,'%d  ',0);end;clear ic
%             fprintf(fid,'\n');
%         end
%         fclose(fid);
%     else
%         fprintf('The mtx file already exists: %s \n',[outputdir,filesep,'OnewayAnova_Within_MainEffect_contrast.mtx']);
%     end
%     
%     % running GLM using command
%     cd(outputdir);
%     
%     commands = ['mris_preproc ',' --target fsaverage ', ' --hemi ',hemi,' --meas ',measure,' --fsgd ','OnewayAnova_Within.fsgd',' --out ',['OnewayAnovaWithin_',hemi,'_',measure,'_',outputname,'.mgh'],';'];
%     commands = cat(2,commands,['mri_surf2surf ',' --s fsaverage ',' --hemi ',hemi,' --fwhm ',smooth,' --sval ',['OnewayAnovaWithin_',hemi,'_',measure,'_',outputname,'.mgh'],' --tval ',['OnewayAnovaWithin_',hemi,'_',measure,'_sm',num2str(smooth),'_',outputname,'.mgh'],';']);
%     commands = cat(2,commands,['mri_glmfit ',' --y ',['OnewayAnovaWithin_',hemi,'_',measure,'_sm',num2str(smooth),'_',outputname,'.mgh'], ' --fsgd ','OnewayAnova_Within.fsgd',' doss ',' --C ', 'OnewayAnova_Within_MainEffect_contrast.mtx',' --label ',label,' --surf fsaverage ',hemi, ' --glmdir ',['OnewayAnovaWithin_',hemi,'_',measure,'_',outputname],';']);
%     fs_run_unix(commands);
% end
% 
set(handles.pushbutton4,'Enable','on');

% % % read data
% % if isempty(label)
% %     label = '';
% %     A = load_mgh([subjids{1},filesep,'surf',filesep,[hemi,'.',measure,'.fwhm',smooth,'.fsaverage.mgh']]);
% %     data  = zeros(length(subjids),length(A));
% %     clear A
% % else
% %     label = fs_read_label(label);
% %     data  = zeros(length(subjids),length(label));
% % end
% %
% % fprintf('Reading data ');
% % for i=1:length(subjids)
% %     fprintf('. ');
% %     if ~mod(i,100)
% %         fprintf('\n');
% %     end
% %     A = load_mgh([subjids{i},filesep,'surf',filesep,[hemi,'.',measure,'.fwhm',smooth,'.fsaverage.mgh']]);
% %     if isempty(label)
% %         data(i,:) = A;
% %     else
% %         data(i,:) = A(label);
% %     end
% %     clear A
% % end
% % fprintf('\n');
% %
% % % design matrix and contrast
% % num_class  = unique(label);
% % design     = zeros(length(subjids),length(num_class));
% % label_Ind  = [];
% % for i=1:length(num_class)
% %     design(length(label_Ind)+1:length(label_Ind)+length(find(label == num_class(i))),i) = 1;
% %     label_Ind = [label_Ind;find(label == num_class(i))'];
% % end
% % clear i
% %
% % cov = cov(label_Ind,:);
% % if ~isempty(cov)
% %     cov    = cov - repmat(mean(cov,1),size(cov,1),1); % demean covs
% %     design = [design,cov];
% % end
% %
% % contrast = zeros(num_class-1,size(design,2));
% % for i=1:num_class-1
% %     contrast(i,i)    = 1;
% %     contrast(i,i+1)  = -1;
% % end
% %
% % data = data(label_Ind,:);
% % % glm fit
% % fprintf('GLM fit. Waiting ...... \n');
% % step        = 2000;
% % iters       = ceil(size(data,2)/step);
% % glmpara.x   = design;
% % glmpara.con = contrast;
% % tem_A       = zeros(size(contrast,2),size(data,2));
% % tem_B       = zeros(1,size(data,2));
% % tem_C       = zeros(1,size(data,2));
% % for i=1:iters
% %     fprintf('. ');
% %     if i~= iters
% %         index     = (i-1)*step + 1 : i*step;
% %     else
% %         index     = (i-1)*step + 1 : size(data,2);
% %     end
% %     glmpara.y      = data(:,index);
% %     glmout         = AFBATglm(glmpara);
% %     tem_A(:,index) = glmout.beta;
% %     tem_B(index)   = sign(glmpara.con*glmout.beta)'.*sqrt(glmout.F);
% %     tem_C(index)   = -log10(glmout.P);
% % end
% % fprintf('\n');
% %
% % % save results
% % fprintf('Saving statistic results ...... \n');
% % [vol,M,mr_parms] = load_mgh([subjids{1},filesep,'surf',filesep,[hemi,'.',measure,'.fwhm',smooth,'.fsaverage.mgh']]);
% %
% % if isempty(label)
% %     beta   = tem_A;
% %     Tvalue = tem_B;
% %     Pvalue = tem_C;
% % else
% %     beta   = zeros(size(contrast,2),length(vol)); beta(:,label) = tem_A;
% %     Tvalue = zeros(1,length(vol)); Tvalue(label) = tem_B;
% %     Pvalue = zeros(1,length(vol)); Pvalue(label) = tem_C;
% % end
% % clear tem_A tem_B tem_C
% %
% % fname = [outputdir,filesep,[outputname,'_',measure,'_AFBAT001.mgh']]; save_mgh(Tvalue,fname,M,mr_parms); clear frame
% % fname = [outputdir,filesep,[outputname,'_',measure,'_AFBAP001.mgh']]; save_mgh(Pvalue,fname,M,mr_parms); clear frame
% % for i=1:size(beta,1)
% %     if i < 10
% %         fname = [outputdir,filesep,[outputname,'_',measure,'_Beta00',num2str(i),'.mgh']];
% %     elseif i < 100
% %         fname = [outputdir,filesep,[outputname,'_',measure,'_Beta0',num2str(i),'.mgh']];
% %     else
% %         fname = [outputdir,filesep,[outputname,'_',measure,'_Beta',num2str(i),'.mgh']];
% %     end
% %     save_mgh(beta(i,:),fname,M,mr_parms); clear frame
% % end
% % fprintf('Finished.\n');
% % clear glmpara beta Tvalue Pvalue M mr_parms i
% % set(handles.pushbutton4,'Enable','on');

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

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


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
set(hObject,'string',{'dods','doss'});


% --------------------------------------------------------------------
function group_clear_Callback(hObject, eventdata, handles)
% hObject    handle to group_clear (see GCBO)
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
clear clear_listbox1 clear_listbox2

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
setappdata(0,'clear_listbox2',0);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox2.
function listbox2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'clear_listbox1',0);
setappdata(0,'clear_listbox2',1);
