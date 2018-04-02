function varargout = Twoway_anova(varargin)
% TWOWAY_ANOVA MATLAB code for Twoway_anova.fig
%      TWOWAY_ANOVA, by itself, creates a new TWOWAY_ANOVA or raises the existing
%      singleton*.
%
%      H = TWOWAY_ANOVA returns the handle to a new TWOWAY_ANOVA or the handle to
%      the existing singleton*.
%
%      TWOWAY_ANOVA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TWOWAY_ANOVA.M with the given input arguments.
%
%      TWOWAY_ANOVA('Property','Value',...) creates a new TWOWAY_ANOVA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Twoway_anova_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Twoway_anova_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Twoway_anova

% Last Modified by GUIDE v2.5 23-Mar-2018 09:57:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Twoway_anova_OpeningFcn, ...
                   'gui_OutputFcn',  @Twoway_anova_OutputFcn, ...
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


% --- Executes just before Twoway_anova is made visible.
function Twoway_anova_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Twoway_anova (see VARARGIN)

% Choose default command line output for Twoway_anova
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Twoway_anova wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Twoway_anova_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g_subjid                        = get(handles.listbox1,'string');
covar                           = str2num(get(handles.listbox2,'string')); 
label                           = str2num(get(handles.edit1,'string')); 
model                           = get(handles.popupmenu4,'string');
model                           = model{get(handles.popupmenu4,'value')};

factors                         = get(handles.edit5,'string');
factors(isspace(factors))       = [];
Ind                             = strfind(factors,',');
for i=1:length(Ind)
    if i == 1
        name{1,i}               = factors(1:Ind(i)-1);
    else
        name{1,i}               = factors(Ind(i-1)+1:Ind(i)-1);
    end
end
name{1,length(Ind)+1}           = factors(Ind(end)+1:end);
factors                         = name; clear name Ind i
if length(factors) ~= 2
    error('Pls input 2 factor names');
end
levels                          = get(handles.edit6,'string');
levels(isspace(levels))         = [];
Ind                             = strfind(levels,',');
for i=1:length(Ind)
    if i == 1
        name{1,i}               = levels(1:Ind(i)-1);
    else
        name{1,i}               = levels(Ind(i-1)+1:Ind(i)-1);
    end
end
name{1,length(Ind)+1}           = levels(Ind(end)+1:end);
levels                          = name; clear name Ind i
if length(levels) ~= 2
    error('Pls input levels for each factor');
end
% disp(factors);
% disp(levels);

if isempty(g_subjid)
    msgbox('Pls select group subjects');
elseif isempty(label)
    msgbox('Please assign each subject a label');
elseif length(label) ~= length(g_subjid)
    msgbox('The label is wrong. Pls check');
else
    L1                          = str2num(levels{1});
    L2                          = str2num(levels{2});
    desig                       = zeros(length(g_subjid),L1*L2);
    K                           = 1;
    for i=1:L1
        for j=1:L2
            A                   = str2num([num2str(i),num2str(j)]);
            desig(label == A,K) = 1;
            K                   = K+1;
            clear A
        end
    end
    clear i j K
    
    ylabelshow                  = cell(length(g_subjid),1);
    for i=1:length(g_subjid)
        [~,ylabelshow{i}]       = fileparts(g_subjid{i});
    end
    clear i
    xlabelshow                  = cell(0);
    for i=1:L1
        for j=1:L2
            xlabelshow          = cat(2,xlabelshow,[factors{1},num2str(i),'-',factors{2},num2str(j)]);
        end
    end
    if isempty(covar)
        figure; imagesc(desig); colormap(gray); title('Design Matrix');
        set(gca,'XTick',1:size(desig,2));
        set(gca,'XTicklabel',xlabelshow); xticklabel_rotate; clear A
        set(gca,'YTick',1:length(ylabelshow));
        set(gca,'YTicklabel',ylabelshow);
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
                xlabel               = cell(1,size(covar,2)*L1*L2);
                covar_dods           = zeros(size(covar,1),size(covar,2)*L1*L2);
                for i=1:size(covar,2)
                    K                = 1;
                    for ig = 1:L1
                        for jg = 1:L2
                            A        = str2num([num2str(ig),num2str(jg)]);
                            xlabel{L1*L2*(i-1)+K}    = [factors{1},num2str(ig),'-',factors{2},num2str(jg),'-cov',num2str(i)];
                            covar_dods(label==A,L1*L2*(i-1)+K)   = covar(label==A,i);
                            K        = K+1;
                            clear A
                        end
                    end
                    clear ig K jg
                end
                clear i
                desig                = [desig,covar_dods];
                clear covar_dods
            end
            
            figure; imagesc(desig); colormap(gray); title('Design Matrix');
            set(gca,'XTick',1:size(desig,2));
            set(gca,'XTicklabel',cat(2,xlabelshow,xlabel)); xticklabel_rotate; clear A
            set(gca,'YTick',1:length(ylabelshow));
            set(gca,'YTicklabel',ylabelshow);
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
%% get information
% factors and levels
factors                             = get(handles.edit5,'string');
factors(isspace(factors))           = [];
Ind                                 = strfind(factors,',');
for i=1:length(Ind)
    if i == 1
        name{1,i}                   = factors(1:Ind(i)-1);
    else
        name{1,i}                   = factors(Ind(i-1)+1:Ind(i)-1);
    end
end
name{1,length(Ind)+1}               = factors(Ind(end)+1:end);
factors                             = name; clear name Ind i
if length(factors) ~= 2
    error('Pls input 2 factor names');
end
levels                               = get(handles.edit6,'string');
levels(isspace(levels))              = [];
Ind                                  = strfind(levels,',');
for i=1:length(Ind)
    if i == 1
        name{1,i}                    = levels(1:Ind(i)-1);
    else
        name{1,i}                    = levels(Ind(i-1)+1:Ind(i)-1);
    end
end
name{1,length(Ind)+1}                = levels(Ind(end)+1:end);
levels                               = name; clear name Ind i
if length(levels) ~= 2
    error('Pls input levels for each factor');
end

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
assign                               = str2num(get(handles.edit1,'string')); % label for each subjid. 
if length(assign) ~= length(subjids)
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
    'subjids','label','cov','outputdir','outputname','model');

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
    L1                                   = str2num(levels{1});
    L2                                   = str2num(levels{2});
    assign_num                           = zeros(L1*L2,2); % this is used for find position of each subject
    K                                    = 1;
    for i=1:L1;
        for j=1:L2
            assign_num(K,1)              = i;
            assign_num(K,2)              = j;
            K                            = K+1;
        end
    end;
    clear K i j
    
    % generate .fsgd file
    if ~exist([outputdir,filesep,'TwowayAnova_Between.fsgd'],'file')
        fid                              = fopen([outputdir,filesep,'TwowayAnova_Between.fsgd'],'a+');
        fprintf(fid,'GroupDescriptorFile 1 \n');
        fprintf(fid,'Title TwowayAnova \n');
        for i=1:L1;
            for j=1:L2
                fprintf(fid,'Class %s \n',[factors{1},num2str(i),'_',factors{2},num2str(j)]);
            end
        end;
        clear i j
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
            classi                       = num2str(assign(i));
            fprintf(fid,'Input %s  %s ',Name,[factors{1},classi(1),'_',factors{2},classi(2)]);
            if ~isempty(cov)
                for ic = 1:size(cov,2);
                    fprintf(fid,' %f ',cov(i,ic));
                end;
                clear ic
            end
            fprintf(fid,'\n');
            clear Name classi
        end
        fclose(fid);
        clear  i
    else
        fprintf('The fsgd file already exists: %s \n',[outputdir,filesep,'TwowayAnova_Between.fsgd']);
    end
    
    % generate .mtx file (main effect of factor-1)
    if ~exist([outputdir,filesep,'TwowayAnova_Between_MainEffect_',factors{1},'.mtx'],'file')
        fid                              =  fopen([outputdir,filesep,'TwowayAnova_Between_MainEffect_',factors{1},'.mtx'],'a+');
        for ic = 2:L1
            contrast                     = zeros(1,L1*L2);
            contrast(assign_num(:,1) == 1)  = 1;
            contrast(assign_num(:,1) == ic) = -1;
            for i=1:length(contrast);
                fprintf(fid,'%d  ',contrast(i));
            end;
            clear i
            if ~isempty(cov)
                if isequal(model,'doss')
                    fprintf(fid,' %d ',zeros(1,size(cov,2)));
                elseif isequal(model,'dods')
                    fprintf(fid,' %d ',zeros(1,size(cov,2)*L1*L2));
                end
            end
            fprintf(fid,'\n');
            clear contrast
        end
        fclose(fid);
    else
        fprintf('The mtx file (main effect) already exists: %s \n',[outputdir,filesep,'TwowayAnova_Between_MainEffect_',factors{1},'.mtx']);
    end
    
    % generate .mtx file (main effect of factor-2)
    if ~exist([outputdir,filesep,'TwowayAnova_Between_MainEffect_',factors{2},'.mtx'],'file')
        fid                              =  fopen([outputdir,filesep,'TwowayAnova_Between_MainEffect_',factors{2},'.mtx'],'a+');
        for ic = 2:L2
            contrast                     = zeros(1,L1*L2);
            contrast(assign_num(:,2) == 1)  = 1;
            contrast(assign_num(:,2) == ic) = -1;
            for i=1:length(contrast);
                fprintf(fid,'%d  ',contrast(i));
            end;
            clear i
            if ~isempty(cov)
                if isequal(model,'doss')
                    fprintf(fid,' %d ',zeros(1,size(cov,2)));
                elseif isequal(model,'dods')
                    fprintf(fid,' %d ',zeros(1,size(cov,2)*L1*L2));
                end
            end
            fprintf(fid,'\n');
            clear contrast
        end
        fclose(fid);
    else
        fprintf('The mtx file (main effect) already exists: %s \n',[outputdir,filesep,'TwowayAnova_Between_MainEffect_',factors{2},'.mtx']);
    end
    
    % generate .mtx file (interaction effect)
    if ~exist([outputdir,filesep,'TwowayAnova_Between_Interaction_',factors{1},'_',factors{2},'.mtx'],'file')
        fid                              =  fopen([outputdir,filesep,'TwowayAnova_Between_Interaction_',factors{1},'_',factors{2},'.mtx'],'a+');
        for ic = 2:L1
            for jc = 2:L2
                contrast                        = zeros(1,L1*L2);
                A                               = find(assign_num(:,1) == 1);
                B                               = find(assign_num(:,2) == 1);
                contrast(intersect(A,B))        = 1; clear A B
                A                               = find(assign_num(:,1) == ic);
                B                               = find(assign_num(:,2) == jc);
                contrast(intersect(A,B))        = 1; clear A B
                A                               = find(assign_num(:,1) == 1);
                B                               = find(assign_num(:,2) == jc);
                contrast(intersect(A,B))        = -1;
                A                               = find(assign_num(:,1) == ic);
                B                               = find(assign_num(:,2) == 1);
                contrast(intersect(A,B))        = -1; clear A B
                for i=1:length(contrast);
                    fprintf(fid,'%d  ',contrast(i));
                end;
                clear i
                if ~isempty(cov)
                    if isequal(model,'doss')
                        fprintf(fid,' %d ',zeros(1,size(cov,2)));
                    elseif isequal(model,'dods')
                        fprintf(fid,' %d ',zeros(1,size(cov,2)*L1*L2));
                    end
                end
                fprintf(fid,'\n');
                clear contrast
            end
        end
        fclose(fid);
    else
        fprintf('The mtx file (main effect) already exists: %s \n',[outputdir,filesep,'TwowayAnova_Between_Interaction_',factors{1},'_',factors{2},'.mtx']);
    end
    clear L1 L2
    
    % statistic analysis
    if isempty(dir([SUBJECTS_DIR,filesep,'fsaverage']))
        fprintf('Copy fsaverage from %s to %s\n',FREESURFER_HOME,SUBJECTS_DIR);
        fprintf('Waiting......\n');
        unix(['cp -rf ',[FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage'],' ',SUBJECTS_DIR]);
    end
    cd(outputdir);
    statistic_command('TwowayAnova_Between.fsgd',...
        {['TwowayAnova_Between_MainEffect_',factors{1},'.mtx'],...
        ['TwowayAnova_Between_MainEffect_',factors{2},'.mtx'],...
        ['TwowayAnova_Between_Interaction_',factors{1},'_',factors{2},'.mtx']},...
        [measure,'.fwhm',smooth,'.fsaverage'], hemi,label,model, ['TwowayAnova_Between_',hemi,'_',measure,'_',outputname]);
    
    % set(handles.pushbutton4,'Enable','on');
end

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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over popupmenu1.
function popupmenu1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
