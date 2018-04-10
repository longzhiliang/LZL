function varargout = fs_results(varargin)
% FS_RESULTS MATLAB code for fs_results.fig
%      FS_RESULTS, by itself, creates a new FS_RESULTS or raises the existing
%      singleton*.
%
%      H = FS_RESULTS returns the handle to a new FS_RESULTS or the handle to
%      the existing singleton*.
%
%      FS_RESULTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FS_RESULTS.M with the given input arguments.
%
%      FS_RESULTS('Property','Value',...) creates a new FS_RESULTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fs_results_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fs_results_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fs_results

% Last Modified by GUIDE v2.5 23-Mar-2018 04:10:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @fs_results_OpeningFcn, ...
    'gui_OutputFcn',  @fs_results_OutputFcn, ...
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


% --- Executes just before fs_results is made visible.
function fs_results_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fs_results (see VARARGIN)

% Choose default command line output for fs_results
global FREESURFER_HOME
addpath(genpath([FREESURFER_HOME,filesep,'matlab']));
% % set(hObject,'toolbar','figure');

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

currp                      = which('fs_results.m');
currp                      = fileparts(currp);
hemi                       = get(handles.popupmenu1,'string');
hemi                       = hemi{get(handles.popupmenu1,'value')};
set(handles.radiobutton2,'value',1);
imgtype                    = 'pial';
img_pial                   = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.pial'];
v_curv                     = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
[vertices, faces]          = freesurfer_read_surf(img_pial);
vertices                   = single(vertices);
faces                      = int32(faces); 
axes(handles.axes2);

Cdata                      = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
axis equal; 
view(270,0);

view_para                  = [270,0];
h_camlight                 = camlight('headlight');lighting phong;material dull % shiny, dull, metal

set(handles.checkbox3,'value',1);
setappdata(0,'vertices',       vertices);% surf vertices
setappdata(0,'faces',          faces); % surf faces
setappdata(0,'view_para',      view_para); % view 
setappdata(0,'imgtype',        imgtype); % img type. inflated/white/pial
setappdata(0,'h_camlight',     h_camlight);% light
setappdata(0,'vol',            []); % surf overlay (mgh file)
setappdata(0,'vol_nonshow_Ind',[]); % surf index which are not shown
setappdata(0,'vol_path',       []); % path-to-mgh file
setappdata(0,'labelInd',       []); %  label file, 0-based frame (ROI)
setappdata(0,'surf_border',    []); % surface ROI's border
clear img_pial vertices faces curr_position view_para Cdata imgtype h_camlight currp v_curv

% UIWAIT makes fs_results wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fs_results_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

vertices                         = getappdata(0,'vertices');
faces                            = getappdata(0,'faces');
view_para                        = getappdata(0,'view_para');
if ~get(handles.checkbox3,'value')
    Cdata                        = repmat([200 200 200]./255,length(vertices),1);
else
    currp                        = which('fs_results');
    currp                        = fileparts(currp);
    hemi                         = get(handles.popupmenu1,'string');
    hemi                         = hemi{get(handles.popupmenu1,'value')};
    v_curv                       = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
    Cdata                        = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
    clear v_curv hemi currp
end

axes(handles.axes2);
delete(get(gca,'children'));
patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
view(view_para(1),view_para(2));

h_camlight = camlight('headlight');lighting phong;material dull % shiny, dull, metal

set(handles.edit8,'string',[]);
set(handles.edit9,'string',[]);
set(handles.edit10,'string',[]);
set(handles.edit11,'string',[]);
set(handles.edit14,'string',[]);

% setappdata(0,'h_camlight',     h_camlight); % light
setappdata(0,'vol',            []); % surface overlay
setappdata(0,'vol_nonshow_Ind',[]);
setappdata(0,'vol_path',       []);
setappdata(0,'labelInd',       []); % clear label file
setappdata(0,'surf_border',    []);
setappdata(0,'h_camlight',     h_camlight);
clear A i Cdata vol

% hide colorbar
set(handles.checkbox2,'value',0);
axes(handles.axes6);
cla reset
set(gca,'XTick',[]);set(gca,'XTickLabel',[]);
set(gca,'YTick',[]);set(gca,'YTickLabel',[]);
set(gca,'Color',[63 63 63]/255);set(gca,'Xcolor',[63 63 63]/255);set(gca,'Ycolor',[63 63 63]/255);set(gca,'Zcolor',[63 63 63]/255);


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

% curr_position = getappdata(0,'curr_position');
h_camlight                    = getappdata(0,'h_camlight');

axes(handles.axes2);

view(270,0); % original view
view_para                     = [270,0];

camlight(h_camlight,'headlight');lighting phong;material dull % shiny, dull, metal

setappdata(0,'view_para',view_para);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

hemi                                 = get(handles.popupmenu1,'string');
hemi                                 = hemi{get(handles.popupmenu1,'value')};
vol                                  = getappdata(0,'vol');
view_para                            = getappdata(0,'view_para');
if ~isempty(vol)
    msgbox('There has been an image overlayed');
else
    clear vol
    default_pos_th_dw                = 1;
    default_neg_th_dw                = -1;
    [filename,filepath]              = uigetfile('*.mgh','Select *.mgh image');
    if ischar(filename) && isequal(filename(end-3:end),'.mgh') % make sure it's a file
        vol_path                     = [filepath,filesep,filename];
        vol                          = load_mgh(vol_path);
        
        vol_pos                      = vol(vol > 0);
        vol_neg                      = vol(vol < 0);
        vol_nonshow_Ind              = [];
        if isempty(vol_pos)
            default_pos_th_dw        = 0;
            default_pos_th_up        = 0;
        else
            default_pos_th_up        = max(vol_pos);
            vol_nonshow_Ind          = [vol_nonshow_Ind;find(vol > default_pos_th_dw & vol <= default_pos_th_up)];
        end
        if isempty(vol_neg)
            default_neg_th_dw        = 0;
            default_neg_th_up        = 0;
        else
            default_neg_th_up        = min(vol_neg);
            vol_nonshow_Ind          = [vol_nonshow_Ind;find(vol > default_neg_th_up & vol <= default_neg_th_dw)];
        end
        vol_nonshow_Ind              = setdiff(1:length(vol),vol_nonshow_Ind);
        clear vol_pos vol_neg
        
        vertices                     = getappdata(0,'vertices');
        faces                        = getappdata(0,'faces');
        currp                        = which('fs_results.m');
        currp                        = fileparts(currp);
        if get(handles.checkbox3,'value')
            v_curv                   = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
            Gdata                    = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
            clear v_curv
        end
        
        colorpath                    = get(handles.popupmenu2,'string');
        colorpath                    = colorpath{get(handles.popupmenu2,'value')};
        colorpath                    = [currp,filesep,'ColorMats',filesep,colorpath,'.mat'];
        Cdata                        = fs_surf_color(vertices,vol,colorpath,default_pos_th_up,default_neg_th_up);
        if get(handles.checkbox3,'value')
            Cdata(vol_nonshow_Ind,:) = Gdata(vol_nonshow_Ind,:);
        else
            Cdata(vol_nonshow_Ind,:) = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
        end
        clear A  vol_min vol_max i
        
        axes(handles.axes2);
        delete(get(gca,'children'));
        patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
        axis equal;
        view(view_para(1),view_para(2));
        h_camlight = camlight('headlight');lighting phong;material dull % shiny, dull, metal

        
        set(handles.edit8, 'string',num2str(default_pos_th_dw));
        set(handles.edit9, 'string',num2str(default_pos_th_up));
        set(handles.edit10,'string',num2str(default_neg_th_dw));
        set(handles.edit11,'string',num2str(default_neg_th_up));
        
        sig_path                     = fileparts(vol_path);
        if isequal(sig_path(end),'/') || isequal(sig_path(end),'\')
            sig_path2                = fileparts(sig_path(1:end-1));
        else
            sig_path2                = fileparts(sig_path);
        end
        if exist([sig_path2,filesep,'fwhm.dat'],'file')
            fwhm                     = load([sig_path2,filesep,'fwhm.dat']); 
            set(handles.edit14,'string',num2str(fwhm));
            clear fwhm sig_path2
        end
        clear A i Cdata  sig_path2 sig_path
        
        %%%%%%%%%%%%%%%%%%%%% show colorbar
        if get(handles.checkbox2,'value')
            default_neg_th_up     = round(default_neg_th_up*10)/10;
            default_neg_th_dw     = round(default_neg_th_dw*10)/10;
            default_pos_th_up     = round(default_pos_th_up*10)/10;
            default_pos_th_dw     = round(default_pos_th_dw*10)/10;
            [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorpath,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw);
            axes(handles.axes6);
            imagesc(colorA);
            colormap(colorname);
            set(gca,'YTick',[])
            set(gca,'XTick',xtick);
            set(gca,'XTickLabel',xticklabel);
            set(gca,'XAxisLocation','bottom');
            set(gca,'FontUnits','pixels');
            set(gca,'FontWeight','bold');
            set(gca,'Fontsize',12);
        end
        clear colorA  xtick xticklabel
        
        setappdata(0,'vol',            vol); % surface overlay. e.g. sig.mgh
        setappdata(0,'vol_nonshow_Ind',vol_nonshow_Ind); % vertex index which are not shown
        setappdata(0,'vol_path',       vol_path); % path-to surface overlay
        setappdata(0,'labelInd',       []); %  label file, 0-based frame (ROI)
        setappdata(0,'surf_border',    []); % surface ROI's border
        setappdata(0,'h_camlight',     h_camlight);
    end
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global FREESURFER_HOME

currp                               = which('fs_results');
currp                               = fileparts(currp);
imgtype                             = getappdata(0,'imgtype');
hemi                                = get(handles.popupmenu1,'string');
hemi                                = hemi{get(handles.popupmenu1,'value')};
img                                 = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.',imgtype];
[vertices, faces]                   = freesurfer_read_surf(img);
vertices                            = single(vertices);
faces                               = int32(faces); 
axes(handles.axes2);
if ~get(handles.checkbox3,'value')
    Cdata                           = repmat([200 200 200]./255,length(vertices),1);
else
    v_curv                          = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
    Cdata                           = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
    clear v_curv
end

% axes(handles.axes2);
delete(get(gca,'children'));
patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
axis equal; 
view(270,0);
view_para                           = [270,0];
h_camlight                          = camlight('headlight');lighting phong;material dull % shiny, dull, metal

% setappdata(0,'curr_position',curr_position);
setappdata(0,'vertices',       vertices);
setappdata(0,'faces',          faces);
setappdata(0,'view_para',      view_para);
setappdata(0,'imgtype',        imgtype);
setappdata(0,'h_camlight',     h_camlight);
setappdata(0,'vol',            []);
setappdata(0,'vol_nonshow_Ind',[]);
setappdata(0,'labelInd',       []); %  label file, 0-based frame
setappdata(0,'surf_border',    []);
clear img vertices faces curr_position view_para Cdata imgtype

axes(handles.axes6);
cla reset
set(gca,'XTick',[]);set(gca,'XTickLabel',[]);
set(gca,'YTick',[]);set(gca,'YTickLabel',[]);
set(gca,'Color',[63 63 63]/255);set(gca,'Xcolor',[63 63 63]/255);set(gca,'Ycolor',[63 63 63]/255);set(gca,'Zcolor',[63 63 63]/255);


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
set(hObject,'string',{'lh','rh'});

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global FREESURFER_HOME

hemi                                            = get(handles.popupmenu1,'string');
hemi                                            = hemi{get(handles.popupmenu1,'value')};
vertices                                        = getappdata(0,'vertices');
faces                                           = getappdata(0,'faces');
view_para                                       = getappdata(0,'view_para');
vol                                             = getappdata(0,'vol');
vol_nonshow_Ind                                 = getappdata(0,'vol_nonshow_Ind');
surf_border                                     = getappdata(0,'surf_border');
default_pos_th_dw                               = str2num(get(handles.edit8,'string'));
default_pos_th_up                               = str2num(get(handles.edit9,'string'));
default_neg_th_dw                               = str2num(get(handles.edit10,'string'));
default_neg_th_up                               = str2num(get(handles.edit11,'string'));

currp                                           = which('fs_results.m');
currp                                           = fileparts(currp);
if ~isempty(vol)
    colorname                                   = get(handles.popupmenu2,'string');
    colorname                                   = colorname{get(handles.popupmenu2,'value')};
    colorname                                   = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
    Cdata                                       = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
    
    if ~get(handles.checkbox3,'value')
        Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
    else
        v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
        Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
        Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
        clear v_curv Gdata
    end
    
    if ~isempty(surf_border)
        Cdata(surf_border.borders{surf_border.k},:) = repmat([250 0   0]./255,length(surf_border.borders{surf_border.k}),1);
    end
    
    axes(handles.axes2);
    delete(get(gca,'children'));
    
    patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
    view(view_para(1),view_para(2));
    h_camlight                                  = camlight('headlight');lighting phong;material dull % shiny, dull, metal
    
    setappdata(0,'view_para',     view_para);
    setappdata(0,'h_camlight',    h_camlight);
    clear  Cdata  vol_min vol_max h_camlight vol_nonshow_Ind surf_border
    
    %%%%%%%%%%%%%%% show colorbar
    if get(handles.checkbox2,'value')
        default_neg_th_up     = round(default_neg_th_up*10)/10;
        default_neg_th_dw     = round(default_neg_th_dw*10)/10;
        default_pos_th_up     = round(default_pos_th_up*10)/10;
        default_pos_th_dw     = round(default_pos_th_dw*10)/10;
        [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorname,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw);
        axes(handles.axes6);
        imagesc(colorA);
        colormap(colorname);
        set(gca,'YTick',[])
        set(gca,'XTick',xtick);
        set(gca,'XTickLabel',xticklabel);
        set(gca,'XAxisLocation','bottom');
        set(gca,'FontUnits','pixels');
        set(gca,'FontWeight','bold');
        set(gca,'Fontsize',12);
    end
    clear colorA  xtick xticklabel
end



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
currp = which('fs_results.m');
currp = fileparts(currp);
mats  = dir([currp,filesep,'ColorMats',filesep,'*.mat']);
colorstr = cell(length(mats),1);
for i=1:length(mats)
    colorstr{i} = mats(i).name(1:end-4);
end
set(hObject,'string',colorstr);


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


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1



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
set(hObject,'string',{'abs','neg','pos'});

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

hemi                                     = get(handles.popupmenu1,'string');
hemi                                     = hemi{get(handles.popupmenu1,'value')};
vertices                                 = getappdata(0,'vertices');
faces                                    = getappdata(0,'faces');
view_para                                = getappdata(0,'view_para');
vol_path                                 = char(getappdata(0,'vol_path')); % overlay volume
level                                    = get(handles.popupmenu6,'value'); % vertex level
fwhm                                     = str2num(get(handles.edit14,'string'));

if level == 1
    level                                = 'th13';
elseif level == 2
    level                                = 'th20';
elseif level == 3
    level                                = 'th23';
elseif level == 4
    level                                = 'th30';
elseif level == 5
    level                                = 'th33';
elseif level == 6
    level                                = 'th40';
end
sign                                     = get(handles.popupmenu4,'value'); % vertex level
if sign == 1
    sign                                 = 'abs';
elseif sign == 2
    sign                                 = 'neg';
elseif sign == 3
    sign                                 = 'pos';
end

% check whole brain cortex or specific ROI
currp                                    = which('fs_results.m');
currp                                    = fileparts(currp);
vol                                      = load_mgh(vol_path);
lrh_cortex_label                         = fs_read_label([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'label',filesep,[hemi,'.cortex.label']]);
if length(vol(vol~=0)) == length(lrh_cortex_label)
    cortex_label                         = 'TRUE';
elseif length(vol(vol~=0)) < length(lrh_cortex_label)
    fprintf('It was detected that the sig.mgh was obtained using a specific mask instead of the whole cortex. \n');
    info                                 = input('Apply the defalut parameters for cluster-wise correction?(y/n):','s');
    if isequal(info,'y') || isequal(info,'yes')
        cortex_label                     = 'TRUE';
    else
        cortex_label                     = 'FALSE';
    end
    clear info
end
clear lrh_cortex_label vol

% mc-z
[sig_path, sig_name]                     = fileparts(vol_path);
[vol, M, mr_parms]                       = load_mgh(vol_path);
vol                                      = double(vol ~= 0);
save_mgh(vol, [sig_path,filesep,[sig_name,'_mask.mgh']], M, mr_parms); clear vol M mr_parms
fwhm                                     = round(fwhm);
if fwhm >= 10
    fwhm                                 = num2str(fwhm);
else
    fwhm                                 = ['0',num2str(fwhm)];
end

if isequal(cortex_label,'TRUE')
    if get(handles.checkbox1,'value')% correct 2 spaces
        command                          = ['mri_surfcluster',' --in ',vol_path,' --mask ',[sig_path,filesep,[sig_name,'_mask.mgh']],' --cwpvalthresh 0.05 ',...
                                            ' --o ',[sig_path,filesep,[sig_name,'_',level,'_',sign,'_ClusterCorrected.mgh']],' --no-fixmni ',...
                                            ' --csd ',[FREESURFER_HOME,filesep,'average',filesep,'mult-comp-cor',filesep,'fsaverage',filesep,hemi,filesep,'cortex',filesep,['fwhm',fwhm],filesep,sign,filesep,level,filesep,'mc-z.csd'],...
                                            ' --surf white --bonferroni 2 '];
    else
        command                          = ['mri_surfcluster',' --in ',vol_path,' --mask ',[sig_path,filesep,[sig_name,'_mask.mgh']],' --cwpvalthresh 0.05 ',...
                                            ' --o ',[sig_path,filesep,[sig_name,'_',level,'_',sign,'_ClusterCorrected.mgh']],' --no-fixmni ',...
                                            ' --csd ',[FREESURFER_HOME,filesep,'average',filesep,'mult-comp-cor',filesep,'fsaverage',filesep,hemi,filesep,'cortex',filesep,['fwhm',fwhm],filesep,sign,filesep,level,filesep,'mc-z.csd'],...
                                            ' --surf white '];
    end
    fs_run_unix(command);
    vol                                  = load_mgh([sig_path,filesep,[sig_name,'_',level,'_',sign,'_ClusterCorrected.mgh']]);
    clear command fwhm cortex_label
    
elseif isequal(cortex_label,'FALSE')
    if ~isdir([sig_path,filesep,'mult-comp-cor',filesep,hemi,filesep,[sig_name,'_label']])
        mkdir([sig_path,filesep,'mult-comp-cor',filesep,hemi,filesep,[sig_name,'_label']]);
    end
    command                              = ['mri_mcsim ',' --o ',[sig_path,filesep,'mult-comp-cor',filesep,hemi,filesep,[sig_name,'_label']],...
                                            ' --base mc-z --surface fsaverage ',hemi,' --nreps 10000 ',...
                                            ' --mask ',[sig_path,filesep,[sig_name,'_mask.mgh']]];
    fs_run_unix(command);
    
    if get(handles.checkbox1,'value')% correct 2 spaces
        command                          = ['mri_surfcluster',' --in ',vol_path,' --mask ',[sig_path,filesep,[sig_name,'_mask.mgh']],' --cwpvalthresh 0.05 ',...
                                            ' --o ',[sig_path,filesep,[sig_name,'_',level,'_',sign,'_ClusterCorrected.mgh']],' --no-fixmni ',...
                                            ' --csd ',[sig_path,filesep,'mult-comp-cor',filesep,hemi,filesep,[sig_name,'_label'],filesep,['fwhm',fwhm],filesep,sign,filesep,level,filesep,'mc-z.csd'],...
                                            ' --surf white --bonferroni 2 '];
    else
        command                          = ['mri_surfcluster',' --in ',vol_path,' --mask ',[sig_path,filesep,[sig_name,'_mask.mgh']],' --cwpvalthresh 0.05 ',...
                                            ' --o ',[sig_path,filesep,[sig_name,'_',level,'_',sign,'_ClusterCorrected.mgh']],' --no-fixmni ',...
                                            ' --csd ',[sig_path,filesep,'mult-comp-cor',filesep,hemi,filesep,[sig_name,'_label'],filesep,['fwhm',fwhm],filesep,sign,filesep,level,filesep,'mc-z.csd'],...
                                            ' --surf white '];
    end
    fs_run_unix(command);
    vol                                  = load_mgh([sig_path,filesep,[sig_name,'_',level,'_',sign,'_ClusterCorrected.mgh']]);
    clear command fwhm cortex_label
end
delete([sig_path,filesep,[sig_name,'_',level,'_',sign,'_ClusterCorrected.mgh']]);

if ~any(vol)
    msgbox('NO cluster survives mc-z correction');
else
    vol_pos                              = vol(vol > 0);
    vol_neg                              = vol(vol < 0);
    vol_nonshow_Ind                      = [];
    if isempty(vol_pos)
        default_pos_th_dw                = 0;
        default_pos_th_up                = 0;
    else
        default_pos_th_dw                = min(vol_pos);
        default_pos_th_up                = max(vol_pos);
        vol_nonshow_Ind                  = [vol_nonshow_Ind;find(vol > default_pos_th_dw & vol <= default_pos_th_up)];
    end
    if isempty(vol_neg)
        default_neg_th_dw                = 0;
        default_neg_th_up                = 0;
    else
        default_neg_th_dw                = max(vol_neg);
        default_neg_th_up                = min(vol_neg);
        vol_nonshow_Ind                  = [vol_nonshow_Ind;find(vol > default_neg_th_up & vol <= default_neg_th_dw)];
    end
    vol_nonshow_Ind                      = setdiff(1:length(vol),vol_nonshow_Ind);
    clear vol_pos vol_neg
    
    colorname                            = get(handles.popupmenu2,'string');
    colorname                            = colorname{get(handles.popupmenu2,'value')};
    colorname                            = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
    Cdata                                = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
    
    if ~get(handles.checkbox3,'value')
        Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
    else
        v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
        Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
        Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
        clear v_curv Gdata
    end
    
    axes(handles.axes2);
    delete(get(gca,'children'));
    
    patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
    view(view_para(1),view_para(2));
    h_camlight                           = camlight('headlight');lighting phong;material dull % shiny, dull, metal
    
    setappdata(0,'view_para',       view_para);
    setappdata(0,'h_camlight',      h_camlight);
    setappdata(0,'vol_nonshow_Ind', vol_nonshow_Ind);
    setappdata(0,'labelInd',       []); %  label file, 0-based frame (ROI)
    setappdata(0,'surf_border',    []); % surface ROI's border
    
    set(handles.edit8,'string', num2str(default_pos_th_dw));
    set(handles.edit9,'string', num2str(default_pos_th_up));
    set(handles.edit10,'string',num2str(default_neg_th_dw));
    set(handles.edit11,'string',num2str(default_neg_th_up));
    clear  Cdata  vol_min vol_max vol  vol_nonshow_Ind
    
    %%%%%%%%%%%%%%% show colorbar
    if get(handles.checkbox2,'value')
        default_neg_th_up     = round(default_neg_th_up*10)/10;
        default_neg_th_dw     = round(default_neg_th_dw*10)/10;
        default_pos_th_up     = round(default_pos_th_up*10)/10;
        default_pos_th_dw     = round(default_pos_th_dw*10)/10;
        [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorname,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw);
        axes(handles.axes6);
        imagesc(colorA);
        colormap(colorname);
        set(gca,'YTick',[])
        set(gca,'XTick',xtick);
        set(gca,'XTickLabel',xticklabel);
        set(gca,'XAxisLocation','bottom');
        set(gca,'FontUnits','pixels');
        set(gca,'FontWeight','bold');
        set(gca,'Fontsize',12);
    end
    clear colorA  xtick xticklabel
end

% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


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
set(hObject,'string',{'aparc','aparc.a2005s','aparc.a2009s'});

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

faces                                         = getappdata(0,'faces');
vol                                           = getappdata(0,'vol');
vol_nonshow_Ind                               = getappdata(0,'vol_nonshow_Ind');
hemi                                          = get(handles.popupmenu1,'string');
hemi                                          = char(hemi(get(handles.popupmenu1,'value')));
aparc                                         = get(handles.popupmenu5,'string');
aparc                                         = char(aparc(get(handles.popupmenu5,'value')));
aparc                                         = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'label',filesep,[hemi,'.',aparc,'.annot']];
[~, aparc_label, colortable]                  = read_annotation(aparc);
aparc_name                                    = colortable.struct_names;
aparc_name_label                              = colortable.table(:,end);
clear colortable

if ~isempty(vol)
    vol(vol_nonshow_Ind)                      = 0;
    area                                      = load_mgh([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,[hemi,'.white.avg.area.mgh']]);
    
    % find surface cluster
    fprintf('Finding surface clusters ...... \n');
    [clusterlabel,label]                      = fs_find_surfcluster(vol,faces);
    fprintf('%d clusters in total \n',length(label));
    fprintf('Reading clusters information \n');
    
    title                                      = {'ClusterNo','Vtxpeak','Vtxmax','Size(mm^2)','Nvtx','MNIx','MNIy','MNIz','AparcPeak','Aparcs'};
    table                                      = cell(length(label),length(title));
    for i=1:length(label)
        fprintf('. ');
        table{i,1}                             = i;
        Aind                                   = find(clusterlabel == label(i));
        A                                      = vol(Aind);
        [~,Amaxind]                            = max(abs(A));
        table{i,2}                             = A(Amaxind);
        table{i,3}                             = Aind(Amaxind)-1;
        table{i,4}                             = sum(area(Aind));
        table{i,5}                             = length(Aind);
        s                                      = fs_white_surface(Aind(Amaxind)-1,hemi);
        table{i,6}                             = roundn(s(1),-2);
        table{i,7}                             = roundn(s(2),-2);
        table{i,8}                             = roundn(s(3),-2);
        table{i,9}                             = aparc_name{aparc_name_label == aparc_label(Aind(Amaxind))}; 
        roi_index                              = aparc_label(Aind);
        A                                      = unique(roi_index);
        A(A == 0)                              = [];
        B                                      = [];
        for ia = 1:length(A)
            Name                               = aparc_name{aparc_name_label == A(ia)};
            if ia~=length(A)
                B                              = cat(2,B,[Name,'(',num2str(100*length(find(roi_index==A(ia)))/length(Aind)),'%','),']);
            else
                B                              = cat(2,B,[Name,'(',num2str(100*length(find(roi_index==A(ia)))/length(Aind)),'%',')']);
            end
            clear Name
        end
        table{i,10}                            = B;
        clear Aind A Amaxind s B ia roi_index
    end
    fprintf('\n');
    title                                      = cat(1,title,table);
    title                                      = fs_cell2str(title);
%     set(handles.listbox1,'string',title);
    fprintf('Done \n');
    fprintf('#Clusters: \n');
    disp(title);
    clear title table
end
clear aparc_name aparc_name_label aparc_label

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

labelInd                       = getappdata(0,'labelInd');
hemi                           = get(handles.popupmenu1,'string');
hemi                           = char(hemi(get(handles.popupmenu1,'value')));
vol                            = getappdata(0,'vol');
vol_nonshow_Ind                = getappdata(0,'vol_nonshow_Ind');
% surf_border                    = getappdata(0,'surf_border');

if isempty(labelInd) && isempty(vol)
    msgbox('NO label or overlay  found');
else
    [filename, filepath]       = uiputfile('*.label','Save labe file');
    vertices                   = freesurfer_read_surf([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,[hemi,'.white']]);
    if ~isempty(labelInd)
        fs_save_label(labelInd-1, vertices(labelInd,:), [], [filepath,filesep,filename]);
    elseif ~isempty(vol)
        fs_save_label(setdiff(1:length(vol),vol_nonshow_Ind)-1, vertices(setdiff(1:length(vol),vol_nonshow_Ind),:), [], [filepath,filesep,filename]);
    end
    fprintf('Save label file to : %s \n',[filepath,filesep,filename]);
    clear filepath filename currp vertices
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global FREESURFER_HOME

hemi                                    = get(handles.popupmenu1,'string');
hemi                                    = hemi{get(handles.popupmenu1,'value')};
[filename,filepath]                     = uigetfile('*.label','Select a label file');
labelInd                                = read_label([],[filepath,filesep,filename]);
labelInd                                = labelInd(:,1)+1; % label file is 0-based frame, so +1 for matlab use
if ischar(filename) % make sure it's a file
    vertices                            = getappdata(0,'vertices');
    faces                               = getappdata(0,'faces');
    view_para                           = getappdata(0,'view_para');
    
    if ~get(handles.checkbox3,'value')
        Cdata(vol_nonshow_Ind,:)         = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
    else
        currp                            = which('fs_results');
        currp                            = fileparts(currp);
        v_curv                           = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
        Cdata                            = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
        clear v_curv 
    end
    Cdata(labelInd,:)                    = repmat([0   255 255]./255,length(labelInd),1);
    
    axes(handles.axes2);
    delete(get(gca,'children'));
    patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
    axis equal;
    view(view_para(1),view_para(2));
    
    h_camlight                           = camlight('headlight');lighting phong;material dull % shiny, dull, metal
    
    setappdata(0,'h_camlight', h_camlight);
    setappdata(0,'labelInd',   labelInd);
    setappdata(0,'vol',        []);
    setappdata(0,'surf_border',    []); % surface ROI's border
end

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SUBJECTS_DIR

labelInd                              = getappdata(0,'labelInd');
hemi                                  = get(handles.popupmenu1,'string');
hemi                                  = char(hemi(get(handles.popupmenu1,'value')));

if isempty(labelInd)
    msgbox('NO label found');
else
    fsavg                             = dir([SUBJECTS_DIR,filesep,'fsaverage']);
    if isempty(fsavg)
        msgbox('Please copy the fsaverage folder from the FREESURFER_HOME to the SUBJECTS_DIR, then re-run this function');
    else
        answer                        = inputdlg({'Input a label name:'},'Input',1,{''});
        if isempty(answer{1})
            msgbox('ERROR: Pleas input a label name');
        else
            label_path                = [SUBJECTS_DIR,filesep,'fsaverage',filesep,'label',filesep,answer{1}];
            
            % save label to fsaverage
            vertices                  = freesurfer_read_surf([SUBJECTS_DIR,filesep,'fsaverage',filesep,'surf',filesep,[hemi,'.white']]);
            fs_save_label(labelInd-1, vertices(labelInd,:), [], label_path);
            
            subs                      = dir(SUBJECTS_DIR);
            subjects                  = cell(0);
            k                         = 1;
            for i=1:length(subs)
                if isdir([SUBJECTS_DIR,filesep,subs(i).name]) && ~isequal(subs(i).name,'fsaverage') && isdir([SUBJECTS_DIR,filesep,subs(i).name,filesep,'surf'])
                    subjects{1,k}     = subs(i).name;
                    k                 = k+1;
                end
            end
            clear i k subs
            disp('The subjects are : ');
            disp(subjects);
            
            for i=1:length(subjects)
                fprintf('Mapping label to subject : %s \n',subjects{i});
                command               = ['mri_label2label --srclabel ',label_path,' --srcsubject fsaverage ',' --trgsubject ',subjects{i},' --trglabel ',answer{1},' --regmethod surface ',' --hemi ',hemi];
                fs_run_unix(command);
                clear command
            end
            fprintf('Mapping label finished \n');
        end
    end
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% curr_position = getappdata(0,'curr_position');
view_para                     = getappdata(0,'view_para');
h_camlight                    = getappdata(0,'h_camlight');

axes(handles.axes2);

if view_para(1)-90 > 360
    view_para                 = [view_para(1)-90-360,view_para(2)];
elseif view_para(1)-90 < -360
    view_para                 = [view_para(1)-90+360,view_para(2)];
else
    view_para                 = [view_para(1)-90,view_para(2)];
end

view(view_para(1),view_para(2));
camlight(h_camlight,'headlight');lighting phong;material dull % shiny, dull, metal

setappdata(0,'view_para',view_para);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% curr_position = getappdata(0,'curr_position');
view_para                    = getappdata(0,'view_para');
h_camlight                   = getappdata(0,'h_camlight');

axes(handles.axes2);

if view_para(1)+90 > 360
    view_para                = [view_para(1)+90-360,view_para(2)];
elseif view_para(1)+90 < -360
    view_para                = [view_para(1)+90+360,view_para(2)];
else
    view_para                = [view_para(1)+90,view_para(2)];
end

view(view_para(1),view_para(2));
camlight(h_camlight,'headlight');lighting phong;material dull % shiny, dull, metal

setappdata(0,'view_para',view_para);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% curr_position = getappdata(0,'curr_position');
view_para                      = getappdata(0,'view_para');
h_camlight                     = getappdata(0,'h_camlight');

axes(handles.axes2);

if view_para(2)+90 > 360
    view_para                  = [view_para(1),view_para(2)+90-360];
elseif view_para(2)+90 < -360
    view_para                  = [view_para(1),view_para(2)+90+360];
else
    view_para                  = [view_para(1),view_para(2)+90];
end

view(view_para(1),view_para(2));
camlight(h_camlight,'headlight');lighting phong;material dull % shiny, dull, metal

setappdata(0,'view_para',view_para);

set(gcf,'WindowScrollWheelFcn',@zoom_lzl)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% curr_position = getappdata(0,'curr_position');
view_para                 = getappdata(0,'view_para');
h_camlight                = getappdata(0,'h_camlight');

axes(handles.axes2);
if view_para(2)-90 > 360
    view_para             = [view_para(1),view_para(2)-90-360];
elseif view_para(2)-90 < -360
    view_para             = [view_para(1),view_para(2)-90+360];
else
    view_para             = [view_para(1),view_para(2)-90];
end

view(view_para(1),view_para(2));
camlight(h_camlight,'headlight');lighting phong;material dull % shiny, dull, metal

setappdata(0,'view_para',view_para);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

vertices                               = getappdata(0,'vertices');
faces                                  = getappdata(0,'faces');
view_para                              = getappdata(0,'view_para');
vol                                    = getappdata(0,'vol');
vol_nonshow_Ind                        = getappdata(0,'vol_nonshow_Ind');
hemi                                   = get(handles.popupmenu1,'string');
hemi                                   = char(hemi(get(handles.popupmenu1,'value')));
aparc                                  = get(handles.popupmenu5,'string');
aparc                                  = char(aparc(get(handles.popupmenu5,'value')));

default_pos_th_up                      = str2num(get(handles.edit9,'string'));
default_neg_th_up                      = str2num(get(handles.edit11,'string'));

Img                                    = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,[hemi,'.white']];
vert_white                             = freesurfer_read_surf(Img);
vert_white                             = single(vert_white);

aparc_path                             = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'label',filesep,[hemi,'.',aparc,'.annot']];
[~, aparc_label, colortable]           = read_annotation(aparc_path);
aparc_name                             = colortable.struct_names;
aparc_name_label                       = colortable.table(:,end);
area                                   = load_mgh([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,[hemi,'.white.avg.area.mgh']]);
clear colortable Img aparc_path

if ~isempty(vol)
    vol(vol_nonshow_Ind)               = 0;
    fprintf('Finding surface clusters ...... \n');
    [clusterlabel,label]               = fs_find_surfcluster(vol,faces);
    disp(['find ',num2str(length(label)),' clusters']);
    
    Nvtx                               = zeros(length(label),1);
    Indvtx                             = cell(length(label),1);
    for i=1:length(label)
        Nvtx(i)                        = length(find(clusterlabel == label(i)));
        Indvtx{i}                      = find(clusterlabel == label(i));
    end
    [Nvtx, sortind]                    = sort(Nvtx,'descend');
    Indvtx                             = Indvtx(sortind);
    fprintf('finding cluster boundary. Waiting ');
    borders                            = cell(1,length(Nvtx));
    for i = 1:length(Nvtx)
        fprintf('. ');
        borders{i}                     = fs_label_borders(Indvtx{i},faces,vert_white,4);
    end
    fprintf('\n');
    
    surf_border.borders                = borders; % each ROI's border-index
    surf_border.k                      = 1;       % the current ROI
    surf_border.Indvtx                 = Indvtx;  % each ROI's index
    labelInd                           = surf_border.Indvtx{surf_border.k}; % the current label index
    clear borders i NvtxMax Nvtx Indvtx sortind vert_white
    
    currp                              = which('fs_results.m');
    currp                              = fileparts(currp);
    colorname                          = get(handles.popupmenu2,'string');
    colorname                          = colorname{get(handles.popupmenu2,'value')};
    colorname                          = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
    Cdata                              = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
    
    if ~get(handles.checkbox3,'value')
        Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
    else
        v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
        Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
        Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
        clear v_curv Gdata
    end
    
    Cdata(surf_border.borders{surf_border.k},:)  = repmat([250 0   0]./255,length(surf_border.borders{surf_border.k}),1);
    clear A 
    
    axes(handles.axes2);
    delete(get(gca,'children'));
    
    patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
    view(view_para(1),view_para(2));
    h_camlight                        = camlight('headlight');lighting phong;material dull % shiny, dull, metal
    
    %%%%%%%%%%%%%%% reporting cluster information
    disp('#Cluster:');
    Aind                              = surf_border.Indvtx{surf_border.k};
    A                                 = vol(Aind);
    [~,Amaxind]                       = max(abs(A));
    disp([blanks(4),'Peak value: ',num2str(A(Amaxind)),]);  clear A
    disp([blanks(4),'Peak vertex: ',num2str(Aind(Amaxind)-1)]);
    s                                 = fs_white_surface(Aind(Amaxind)-1,hemi);
    disp([blanks(4),'Peak Coordinate (MNI): ',num2str(s)]); clear s
    disp([blanks(4),'Number of vertex: ',num2str(length(Aind))]);
    disp([blanks(4),'Size (mm^2): ',num2str(sum(area(Aind)))]);
    roi_index                         = aparc_label(Aind);
    A                                 = unique(roi_index);
    A(A == 0)                         = [];
    B                                 = [];
    for ia = 1:length(A)
        Name                          = aparc_name{aparc_name_label == A(ia)};
        if ia~=length(A)
            B                         = cat(2,B,[Name,'/']);
        else
            B                         = cat(2,B,Name);
        end
        clear Name
    end
    disp([blanks(4),'Brain areas (',aparc,') :',B]);
    clear Aind  Amaxind roi_index B ia
    %%%%%%%%%
    
    setappdata(0,'h_camlight',   h_camlight);
    setappdata(0,'surf_border',  surf_border);
    setappdata(0,'labelInd',     labelInd);
    clear colorname Cdata  vol_min vol_max vol_nonshow_Ind borders surf_border hemi aparc  labelInd
end



% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

vertices                                     = getappdata(0,'vertices');
faces                                        = getappdata(0,'faces');
view_para                                    = getappdata(0,'view_para');
vol                                          = getappdata(0,'vol');
vol_nonshow_Ind                              = getappdata(0,'vol_nonshow_Ind');
surf_border                                  = getappdata(0,'surf_border');
hemi                                         = get(handles.popupmenu1,'string');
hemi                                         = char(hemi(get(handles.popupmenu1,'value')));
aparc                                        = get(handles.popupmenu5,'string');
aparc                                        = char(aparc(get(handles.popupmenu5,'value')));


%%%% show present border
if isempty(surf_border)
    msgbox('Please conduct "Find clusters" function first or no clusters found');
else
    surf_border.k                                = surf_border.k + 1;
    if surf_border.k > length(surf_border.borders)
        surf_border.k                            = 1;
    end
    labelInd                                     = surf_border.Indvtx{surf_border.k}; % the current label index
    
    default_pos_th_up                            = str2num(get(handles.edit9,'string'));
    default_neg_th_up                            = str2num(get(handles.edit11,'string'));
    
    currp                                        = which('fs_results');
    currp                                        = fileparts(currp);
    
    aparc_path                                   = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'label',filesep,[hemi,'.',aparc,'.annot']];
    [~, aparc_label, colortable]                 = read_annotation(aparc_path);
    aparc_name                                   = colortable.struct_names;
    aparc_name_label                             = colortable.table(:,end);
    area                                         = load_mgh([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,[hemi,'.white.avg.area.mgh']]);
    clear colortable  aparc_path
    
    if ~isempty(vol)
        vol(vol_nonshow_Ind)                     = 0;
        
        colorname                                = get(handles.popupmenu2,'string');
        colorname                                = colorname{get(handles.popupmenu2,'value')};
        colorname                                = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
        Cdata                                    = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
        
        if ~get(handles.checkbox3,'value')
            Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
        else
            v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
            Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
            Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
            clear v_curv Gdata
        end
        
        Cdata(surf_border.borders{surf_border.k},:)         = repmat([250 0   0]./255,length(surf_border.borders{surf_border.k}),1);
        clear A   default_pos_th_up  default_neg_th_up i colorname
        
        axes(handles.axes2);
        delete(get(gca,'children'));
        
        patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
        view(view_para(1),view_para(2));
        h_camlight                               = camlight('headlight');lighting phong;material dull % shiny, dull, metal
        clear Cdata
        
        %%%%%%%%%%%%%%% reporting cluster information
        disp('#Cluster:');
        Aind                                     = surf_border.Indvtx{surf_border.k};
        A                                        = vol(Aind);
        [~,Amaxind]                              = max(abs(A));
        disp([blanks(4),'Peak value: ',num2str(A(Amaxind)),]);  clear A
        disp([blanks(4),'Peak vertex: ',num2str(Aind(Amaxind))]);
        s                                        = fs_white_surface(Aind(Amaxind),hemi);
        disp([blanks(4),'Peak Coordinate (MNI): ',num2str(s)]); clear s
        disp([blanks(4),'Number of vertex: ',num2str(length(Aind))]);
        disp([blanks(4),'Size (mm^2): ',num2str(sum(area(Aind)))]);
        roi_index                                = aparc_label(Aind);
        A                                        = unique(roi_index);
        A(A == 0)                                = [];
        B                                        = [];
        for ia = 1:length(A)
            Name                                 = aparc_name{aparc_name_label == A(ia)};
            if ia~=length(A)
                B                                = cat(2,B,[Name,'/']);
            else
                B                                = cat(2,B,Name);
            end
            clear Name
        end
        disp([blanks(4),'Brain areas (',aparc,') :',B]);
        clear Aind  Amaxind roi_index B ia
        %%%%%%%%%
        
        setappdata(0,'h_camlight', h_camlight);
        setappdata(0,'surf_border',surf_border);
        setappdata(0,'labelInd',   labelInd);
        clear vol_nonshow_Ind surf_border hemi area aparc aparc_label colortable aparc_name_label aparc_name
    end
end

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

vertices                               = getappdata(0,'vertices');
faces                                  = getappdata(0,'faces');
view_para                              = getappdata(0,'view_para');
vol                                    = getappdata(0,'vol');
vol_nonshow_Ind                        = getappdata(0,'vol_nonshow_Ind');
surf_border                            = getappdata(0,'surf_border');
hemi                                   = get(handles.popupmenu1,'string');
hemi                                   = char(hemi(get(handles.popupmenu1,'value')));
aparc                                  = get(handles.popupmenu5,'string');
aparc                                  = char(aparc(get(handles.popupmenu5,'value')));


%%%% show present border
if isempty(surf_border)
    msgbox('Please conduct "Find clusters" function first or no clusters found');
else
    surf_border.k                          = surf_border.k - 1;
    if surf_border.k <= 0
        surf_border.k                      = length(surf_border.borders);
    end
    labelInd                               = surf_border.Indvtx{surf_border.k}; % the current label index
    
    default_pos_th_up                      = str2num(get(handles.edit9,'string'));
    default_neg_th_up                      = str2num(get(handles.edit11,'string'));
    
    currp                                  = which('fs_results');
    currp                                  = fileparts(currp);
    
    aparc_path                             = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'label',filesep,[hemi,'.',aparc,'.annot']];
    [~, aparc_label, colortable]           = read_annotation(aparc_path);
    aparc_name                             = colortable.struct_names;
    aparc_name_label                       = colortable.table(:,end);
    area                                   = load_mgh([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,[hemi,'.white.avg.area.mgh']]);
    clear colortable  aparc_path
    
    if ~isempty(vol)
        vol(vol_nonshow_Ind)               = 0;
        
        colorname                          = get(handles.popupmenu2,'string');
        colorname                          = colorname{get(handles.popupmenu2,'value')};
        colorname                          = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
        Cdata                              = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
        
        if ~get(handles.checkbox3,'value')
            Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
        else
            v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
            Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
            Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
            clear v_curv Gdata
        end
        
        Cdata(surf_border.borders{surf_border.k},:)         = repmat([250 0   0]./255,length(surf_border.borders{surf_border.k}),1);
        clear A   default_pos_th_up  default_neg_th_up i colorname
        
        axes(handles.axes2);
        delete(get(gca,'children'));
        
        patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
        view(view_para(1),view_para(2));
        h_camlight                         = camlight('headlight');lighting phong;material dull % shiny, dull, metal
        clear Cdata
        
        %%%%%%%%%%%%%%% reporting cluster information
        disp('#Cluster:');
        Aind                               = surf_border.Indvtx{surf_border.k};
        A                                  = vol(Aind);
        [~,Amaxind]                        = max(abs(A));
        disp([blanks(4),'Peak value: ',num2str(A(Amaxind)),]);  clear A
        disp([blanks(4),'Peak vertex: ',num2str(Aind(Amaxind))]);
        s                                  = fs_white_surface(Aind(Amaxind),hemi);
        disp([blanks(4),'Peak Coordinate (MNI): ',num2str(s)]); clear s
        disp([blanks(4),'Number of vertex: ',num2str(length(Aind))]);
        disp([blanks(4),'Size (mm^2): ',num2str(sum(area(Aind)))]);
        roi_index                          = aparc_label(Aind);
        A                                  = unique(roi_index);
        A(A == 0)                          = [];
        B                                  = [];
        for ia = 1:length(A)
            Name                           = aparc_name{aparc_name_label == A(ia)};
            if ia~=length(A)
                B                          = cat(2,B,[Name,'/']);
            else
                B                          = cat(2,B,Name);
            end
            clear Name
        end
        disp([blanks(4),'Brain areas (',aparc,') :',B]);
        clear Aind  Amaxind roi_index B ia
        %%%%%%%%%
        
        setappdata(0,'h_camlight', h_camlight);
        setappdata(0,'surf_border',surf_border)
        setappdata(0,'labelInd',   labelInd);
        clear vol_nonshow_Ind surf_border hemi area aparc aparc_label colortable aparc_name_label aparc_name
    end
end

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
global FREESURFER_HOME

hemi                                = get(handles.popupmenu1,'string');
hemi                                = hemi{get(handles.popupmenu1,'value')};
vertices                            = getappdata(0,'vertices');
faces                               = getappdata(0,'faces');
view_para                           = getappdata(0,'view_para');
fdrth                               = str2num(char(get(handles.edit7,'string'))); % fdr threshold
vol_path                            = char(getappdata(0,'vol_path')); % overlay volume

% fdr
vol                                 = load_mgh(vol_path);
vol_Ind                             = find(vol ~= 0); % perform fdr within areas with non-zero value
vol_msk                             = vol(vol_Ind);
pvalue                              = 10.^(-1*vol_msk);
if get(handles.checkbox1,'value') % correct 2 spaces (left & right)
    H                               = fdr(pvalue,fdrth/2);
else
    H                               = fdr(pvalue,fdrth);
end
vol_msk                             = zeros(size(vol));
vol_msk(vol_Ind)                    = H;
vol                                 = vol.*vol_msk;
clear pvalue H fdrth vol_msk vol_Ind

% % [vol_dir,name,ext]  = fileparts(vol_path); % the path-to-folder containing the vol file
% % % fdr correction
% % if get(handles.checkbox1,'value') % correct 2 spaces (left & right)
% %    command          = ['mri_surfcluster ',' --in ',vol_path,' --fdr ',fdrth,' --sign abs --subject fsaverage --hemi ',hemi,' --o ',[vol_dir,filesep,name,'_fdr.',ext],' --bonferroni 2 '];
% % else
% %    command          = ['mri_surfcluster ',' --in ',vol_path,' --fdr ',fdrth,' --sign abs --subject fsaverage --hemi ',hemi,' --o ',[vol_dir,filesep,name,'_fdr.',ext]];
% % end
% % fs_run_unix(command);
% % vol                 = load_mgh([vol_dir,filesep,name,'_fdr.',ext]);
% % clear vol_path vol_dir name ext

if ~any(vol)
    msgbox('NO vertex survives fdr correction');
else
    currp                           = which('fs_results');
    currp                           = fileparts(currp);
    if ~isempty(vol)
        vol_pos                     = vol(vol > 0);
        vol_neg                     = vol(vol < 0);
        vol_nonshow_Ind             = [];
        if isempty(vol_pos)
            default_pos_th_dw       = 0;
            default_pos_th_up       = 0;
        else
            default_pos_th_dw       = min(vol_pos);
            default_pos_th_up       = max(vol_pos);
            vol_nonshow_Ind         = [vol_nonshow_Ind;find(vol > default_pos_th_dw & vol <= default_pos_th_up)];
        end
        if isempty(vol_neg)
            default_neg_th_dw       = 0;
            default_neg_th_up       = 0;
        else
            default_neg_th_dw       = max(vol_neg);
            default_neg_th_up       = min(vol_neg);
            vol_nonshow_Ind         = [vol_nonshow_Ind;find(vol > default_neg_th_up & vol <= default_neg_th_dw)];
        end
        vol_nonshow_Ind             = setdiff(1:length(vol),vol_nonshow_Ind);
        clear vol_pos vol_neg

        colorname                   = get(handles.popupmenu2,'string');
        colorname                   = colorname{get(handles.popupmenu2,'value')};
        colorname                   = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
        Cdata                       = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
        
        if ~get(handles.checkbox3,'value')
            Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
        else
            v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
            Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
            Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
            clear v_curv Gdata
        end
        
        axes(handles.axes2);
        delete(get(gca,'children'));
        
        patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
        view(view_para(1),view_para(2));
        h_camlight                  = camlight('headlight');lighting phong;material dull % shiny, dull, metal
        
        setappdata(0,'view_para',       view_para);
        setappdata(0,'h_camlight',      h_camlight);
        setappdata(0,'vol_nonshow_Ind', vol_nonshow_Ind);
        setappdata(0,'labelInd',       []); %  label file, 0-based frame (ROI)
        setappdata(0,'surf_border',    []); % surface ROI's border
        
        set(handles.edit8,'string', num2str(default_pos_th_dw));
        set(handles.edit9,'string', num2str(default_pos_th_up));
        set(handles.edit10,'string',num2str(default_neg_th_dw));
        set(handles.edit11,'string',num2str(default_neg_th_up));
        clear  Cdata  vol_min vol_max vol  vol_nonshow_Ind
        
         %%%%%%%%%%%%%%% show colorbar
         if get(handles.checkbox2,'value')
             default_neg_th_up     = round(default_neg_th_up*10)/10;
             default_neg_th_dw     = round(default_neg_th_dw*10)/10;
             default_pos_th_up     = round(default_pos_th_up*10)/10;
             default_pos_th_dw     = round(default_pos_th_dw*10)/10;
             [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorname,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw);
             axes(handles.axes6);
             imagesc(colorA);
             colormap(colorname);
             set(gca,'YTick',[])
             set(gca,'XTick',xtick);
             set(gca,'XTickLabel',xticklabel);
             set(gca,'XAxisLocation','bottom');
             set(gca,'FontUnits','pixels');
             set(gca,'FontWeight','bold');
             set(gca,'Fontsize',12);
         end
         clear colorA  xtick xticklabel
    end
end


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
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
% set(hObject,'string',{'1.3(0.05)','2.0(0.01)','2.3(0.005)','3.0(0.001)','3.3(0.0005)','4.0(0.0001)'});


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
% minth = str2num(get(hObject,'string'));
% disp(minth);
global FREESURFER_HOME

hemi                                = get(handles.popupmenu1,'string');
hemi                                = hemi{get(handles.popupmenu1,'value')};
vertices                            = getappdata(0,'vertices');
faces                               = getappdata(0,'faces');
view_para                           = getappdata(0,'view_para');
vol                                 = getappdata(0,'vol'); % overlay volume
default_pos_th_dw                   = str2num(get(handles.edit8,'string'));
default_pos_th_up                   = str2num(get(handles.edit9,'string'));
default_neg_th_dw                   = str2num(get(handles.edit10,'string'));
default_neg_th_up                   = str2num(get(handles.edit11,'string'));

if ~isempty(vol)
    if default_pos_th_dw <= 0 || isempty(default_pos_th_dw)
        msgbox('Pleas input a positive value');
        set(handles.edit8,'string','1');
    else
        currp                       = which('fs_results');
        currp                       = fileparts(currp);
        if ~isempty(vol)
            vol_nonshow_Ind         = [];
            vol_nonshow_Ind         = [vol_nonshow_Ind;find(vol > default_pos_th_dw & vol <= default_pos_th_up)];
            vol_nonshow_Ind         = [vol_nonshow_Ind;find(vol > default_neg_th_up & vol <= default_neg_th_dw)];
            vol_nonshow_Ind         = setdiff(1:length(vol),vol_nonshow_Ind);
            
            colorname               = get(handles.popupmenu2,'string');
            colorname               = colorname{get(handles.popupmenu2,'value')};
            colorname               = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
            Cdata                   = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
            
            if ~get(handles.checkbox3,'value')
                Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
            else
                v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
                Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
                Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
                clear v_curv Gdata
            end
            
            axes(handles.axes2);
            delete(get(gca,'children'));
            
            patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
            view(view_para(1),view_para(2));
            h_camlight              = camlight('headlight');lighting phong;material dull % shiny, dull, metal
            
            
            setappdata(0,'view_para',      view_para);
            setappdata(0,'h_camlight',     h_camlight);
            setappdata(0,'vol_nonshow_Ind',vol_nonshow_Ind);
            setappdata(0,'labelInd',       []); %  label file, 0-based frame (ROI)
            setappdata(0,'surf_border',    []); % surface ROI's border
            clear  Cdata  vol_min vol_max vol_nonshow_Ind
            
            %%%%%%%%%%%%%%% show colorbar
            if get(handles.checkbox2,'value')
                default_neg_th_up     = round(default_neg_th_up*10)/10;
                default_neg_th_dw     = round(default_neg_th_dw*10)/10;
                default_pos_th_up     = round(default_pos_th_up*10)/10;
                default_pos_th_dw     = round(default_pos_th_dw*10)/10;
                [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorname,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw);
                axes(handles.axes6);
                imagesc(colorA);
                colormap(colorname);
                set(gca,'YTick',[])
                set(gca,'XTick',xtick);
                set(gca,'XTickLabel',xticklabel);
                set(gca,'XAxisLocation','bottom');
                set(gca,'FontUnits','pixels');
                set(gca,'FontWeight','bold');
                set(gca,'Fontsize',12);
            end
            clear colorA  xtick xticklabel
        end
    end
end

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
global FREESURFER_HOME

hemi                                  = get(handles.popupmenu1,'string');
hemi                                  = hemi{get(handles.popupmenu1,'value')};
vertices                              = getappdata(0,'vertices');
faces                                 = getappdata(0,'faces');
view_para                             = getappdata(0,'view_para');
vol                                   = getappdata(0,'vol'); % overlay 
default_pos_th_dw                     = str2num(get(handles.edit8,'string'));
default_pos_th_up                     = str2num(get(handles.edit9,'string'));
default_neg_th_dw                     = str2num(get(handles.edit10,'string'));
default_neg_th_up                     = str2num(get(handles.edit11,'string'));

if ~isempty(vol)
    if default_pos_th_up <= 0 || isempty(default_pos_th_up)
        msgbox('Pleas input a positive value');
        set(handles.edit9,'string',num2str(max(vol(:))));
    else
        currp                         = which('fs_results');
        currp                         = fileparts(currp);
        if ~isempty(vol)
            vol_nonshow_Ind           = [];
            vol_nonshow_Ind           = [vol_nonshow_Ind;find(vol > default_pos_th_dw & vol <= default_pos_th_up)];
            vol_nonshow_Ind           = [vol_nonshow_Ind;find(vol > default_neg_th_up & vol <= default_neg_th_dw)];
            vol_nonshow_Ind           = setdiff(1:length(vol),vol_nonshow_Ind);
            
            colorname                 = get(handles.popupmenu2,'string');
            colorname                 = colorname{get(handles.popupmenu2,'value')};
            colorname                 = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
            Cdata                     = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
            
            if ~get(handles.checkbox3,'value')
                Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
            else
                v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
                Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
                Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
                clear v_curv Gdata
            end
            
            axes(handles.axes2);
            delete(get(gca,'children'));
            
            patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
            view(view_para(1),view_para(2));
            h_camlight                = camlight('headlight');lighting phong;material dull % shiny, dull, metal
            
            setappdata(0,'view_para',      view_para);
            setappdata(0,'h_camlight',     h_camlight);
            setappdata(0,'vol_nonshow_Ind',vol_nonshow_Ind);
            setappdata(0,'labelInd',       []); %  label file, 0-based frame (ROI)
            setappdata(0,'surf_border',    []); % surface ROI's border
            clear  Cdata  vol_min vol_max A vol_nonshow_Ind
            
             %%%%%%%%%%%%%%% show colorbar
             if get(handles.checkbox2,'value')
                 default_neg_th_up     = round(default_neg_th_up*10)/10;
                 default_neg_th_dw     = round(default_neg_th_dw*10)/10;
                 default_pos_th_up     = round(default_pos_th_up*10)/10;
                 default_pos_th_dw     = round(default_pos_th_dw*10)/10;
                 [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorname,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw);
                 axes(handles.axes6);
                 imagesc(colorA);
                 colormap(colorname);
                 set(gca,'YTick',[])
                 set(gca,'XTick',xtick);
                 set(gca,'XTickLabel',xticklabel);
                 set(gca,'XAxisLocation','bottom');
                 set(gca,'FontUnits','pixels');
                 set(gca,'FontWeight','bold');
                 set(gca,'Fontsize',12);
             end
             clear colorA  xtick xticklabel
        end
    end
end

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

vol                                     = getappdata(0,'vol');
vol_nonshow_Ind                         = getappdata(0,'vol_nonshow_Ind'); % vertex index which are not shown
labelInd                                = getappdata(0,'labelInd');
vol_path                                = getappdata(0,'vol_path'); % path-to surface overlay
if isempty(vol) && isempty(labelInd)
    msgbox('There is no overlay or label');
else
    [filename, filepath]                = uiputfile('*.mgh','Save mgh file');
    [~, M, mr_parms]                    = load_mgh(vol_path);
    
    if ~isempty(vol) && isempty(labelInd)% thresholded overlay
        vol(vol_nonshow_Ind)            = 0;
    end
    if ~isempty(vol) && ~isempty(labelInd)% specific ROI
        A                               = zeros(size(vol));
        A(labelInd)                     = vol(labelInd);
        vol                             = A;
        clear A
    end
    if isempty(vol) && ~isempty(labelInd)% a mask
        hemi                            = get(handles.popupmenu1,'string');
        hemi                            = hemi{get(handles.popupmenu1,'value')};
        A                               = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,[hemi,'.thickness']]);
        vol                             = zeros(size(A)); 
        vol(labelInd)                   = 1;
        clear hemi A
    end

    save_mgh(vol, [filepath,filesep,filename], M, mr_parms);
    fprintf('Save mgh file to : %s \n',[filepath,filesep,filename]);
    clear filename filepath vol M mr_parms
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1




% --- Executes during object creation, after setting all properties.
function pushbutton16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
direction                 = imread('Direction_up.png');
set(hObject,'CDATA',direction);
clear direction


% --- Executes during object creation, after setting all properties.
function pushbutton15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
direction                   = imread('Direction_down.png');
set(hObject,'CDATA',direction);
clear direction


% --- Executes during object creation, after setting all properties.
function pushbutton14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
direction                   = imread('Direction_left.png');
set(hObject,'CDATA',direction);
clear direction


% --- Executes during object creation, after setting all properties.
function pushbutton13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
direction                   = imread('Direction_right.png');
set(hObject,'CDATA',direction);
clear direction


% --- Executes during object creation, after setting all properties.
function pushbutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
direction                   = imread('Direction_reset.png');
set(hObject,'CDATA',direction);
clear direction


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2



% --- Executes during object deletion, before destroying properties.
function pushbutton7_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FREESURFER_HOME

currp                               = which('fs_results.m');
currp                               = fileparts(currp);

view_para                           = getappdata(0,'view_para');
vol                                 = getappdata(0,'vol');
vol_nonshow_Ind                     = getappdata(0,'vol_nonshow_Ind');
labelInd                            = getappdata(0,'labelInd');
surf_border                         = getappdata(0,'surf_border');

str                                 = get(hObject,'string');
switch str
    case 'Inflated'
        imgtype                     = 'inflated';
    case 'Pial'
        imgtype                     = 'pial';
    case 'White'
        imgtype                     = 'white';
end

hemi                                = get(handles.popupmenu1,'string');
hemi                                = hemi{get(handles.popupmenu1,'value')};
img                                 = [FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.',imgtype];
[vertices, faces]                   = freesurfer_read_surf(img);
vertices                            = single(vertices);
faces                               = int32(faces); 

% get Cdata
if isempty(vol) && isempty(labelInd)
    if ~get(handles.checkbox3,'value')
        Cdata                       = repmat([200 200 200]./255,length(vertices),1);
    else
        v_curv                      = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
        Cdata                       = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
        clear v_curv 
    end
else
    if ~isempty(labelInd)
        if ~get(handles.checkbox3,'value')
            Cdata                   = repmat([200 200 200]./255,length(vertices),1);
        else
            v_curv                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
            Cdata                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
            clear v_curv
        end
        if isempty(vol)
            Cdata(labelInd,:)       = repmat([0   255 255]./255,length(labelInd),1);
        end
    end
    
    if ~isempty(vol)
        
        default_pos_th_up           = str2num(get(handles.edit9,'string'));
        default_neg_th_up           = str2num(get(handles.edit11,'string'));

        colorname                   = get(handles.popupmenu2,'string');
        colorname                   = colorname{get(handles.popupmenu2,'value')};
        colorname                   = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
        Cdata                       = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
        
        if ~get(handles.checkbox3,'value')
            Cdata(vol_nonshow_Ind,:)= repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
        else
            v_curv                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
            Gdata                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
            Cdata(vol_nonshow_Ind,:)= Gdata(vol_nonshow_Ind,:);
            clear v_curv Gdata
        end
        if ~isempty(surf_border)
            Cdata(surf_border.borders{surf_border.k},:)  = repmat([250 0   0]./255,length(surf_border.borders{surf_border.k}),1);
        end
        clear A colorname i default_pos_th_up default_neg_th_up
    end
end

axes(handles.axes2);
delete(get(gca,'children'));
patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
axis equal; 
view(view_para(1),view_para(2));
h_camlight = camlight('headlight');lighting phong;material dull % shiny, dull, metal

setappdata(0,'vertices',     vertices); % surface vertices
setappdata(0,'faces',        faces); % surface faces
setappdata(0,'imgtype',      imgtype); % imgtype. inflated/white/pial
setappdata(0,'h_camlight',   h_camlight);

clear vertices faces imgtype h_camlight vol vol_nonshow_Ind surf_border 


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton16.
function pushbutton16_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'string',{'1.3(0.05)','2.0(0.01)','2.3(0.005)','3.0(0.001)','3.3(0.0005)','4.0(0.0001)'});



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
global FREESURFER_HOME

hemi                                   = get(handles.popupmenu1,'string');
hemi                                   = hemi{get(handles.popupmenu1,'value')};
vertices                               = getappdata(0,'vertices');
faces                                  = getappdata(0,'faces');
view_para                              = getappdata(0,'view_para');
vol                                    = getappdata(0,'vol'); % overlay volume
default_pos_th_dw                      = str2num(get(handles.edit8,'string'));
default_pos_th_up                      = str2num(get(handles.edit9,'string'));
default_neg_th_dw                      = str2num(get(handles.edit10,'string'));
default_neg_th_up                      = str2num(get(handles.edit11,'string'));

if ~isempty(vol)
    if default_neg_th_dw >= 0 || isempty(default_neg_th_dw)
        msgbox('Pleas input a negative value');
        set(handles.edit10,'string','-1');
    else
        currp                          = which('fs_results');
        currp                          = fileparts(currp);
        if ~isempty(vol)
            vol_nonshow_Ind            = [];
            vol_nonshow_Ind            = [vol_nonshow_Ind;find(vol > default_pos_th_dw & vol <= default_pos_th_up)];
            vol_nonshow_Ind            = [vol_nonshow_Ind;find(vol > default_neg_th_up & vol <= default_neg_th_dw)];
            vol_nonshow_Ind            = setdiff(1:length(vol),vol_nonshow_Ind);
            
            colorname                  = get(handles.popupmenu2,'string');
            colorname                  = colorname{get(handles.popupmenu2,'value')};
            colorname                  = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
            Cdata                      = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
            
            if ~get(handles.checkbox3,'value')
                Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
            else
                v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
                Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
                Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
                clear v_curv Gdata
            end
            
            axes(handles.axes2);
            delete(get(gca,'children'));
            
            patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
            view(view_para(1),view_para(2));
            h_camlight                 = camlight('headlight');lighting phong;material dull % shiny, dull, metal
            
            
            setappdata(0,'view_para',      view_para);
            setappdata(0,'h_camlight',     h_camlight);
            setappdata(0,'vol_nonshow_Ind',vol_nonshow_Ind);
            setappdata(0,'labelInd',       []); %  label file, 0-based frame (ROI)
            setappdata(0,'surf_border',    []); % surface ROI's border
            clear  Cdata  vol_min vol_max vol_nonshow_Ind
            
            %%%%%%%%%%%%%%% show colorbar
            if get(handles.checkbox2,'value')
                default_neg_th_up     = round(default_neg_th_up*10)/10;
                default_neg_th_dw     = round(default_neg_th_dw*10)/10;
                default_pos_th_up     = round(default_pos_th_up*10)/10;
                default_pos_th_dw     = round(default_pos_th_dw*10)/10;
                [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorname,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw);
                axes(handles.axes6);
                imagesc(colorA);
                colormap(colorname);
                set(gca,'YTick',[])
                set(gca,'XTick',xtick);
                set(gca,'XTickLabel',xticklabel);
                set(gca,'XAxisLocation','bottom');
                set(gca,'FontUnits','pixels');
                set(gca,'FontWeight','bold');
                set(gca,'Fontsize',12);
            end
            clear colorA  xtick xticklabel
        end
    end
end

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
global FREESURFER_HOME

hemi                                    = get(handles.popupmenu1,'string');
hemi                                    = hemi{get(handles.popupmenu1,'value')};
vertices                                = getappdata(0,'vertices');
faces                                   = getappdata(0,'faces');
view_para                               = getappdata(0,'view_para');
vol                                     = getappdata(0,'vol'); % overlay volume
default_pos_th_dw                       = str2num(get(handles.edit8,'string'));
default_pos_th_up                       = str2num(get(handles.edit9,'string'));
default_neg_th_dw                       = str2num(get(handles.edit10,'string'));
default_neg_th_up                       = str2num(get(handles.edit11,'string'));

if ~isempty(vol)
    if default_neg_th_up >= 0 || isempty(default_neg_th_up)
        msgbox('Pleas input a negative value');
        set(handles.edit10,'string',num2str(min(vol)));
    else
        currp                          = which('fs_results');
        currp                          = fileparts(currp);
        if ~isempty(vol)
            vol_nonshow_Ind            = [];
            vol_nonshow_Ind            = [vol_nonshow_Ind;find(vol > default_pos_th_dw & vol <= default_pos_th_up)];
            vol_nonshow_Ind            = [vol_nonshow_Ind;find(vol > default_neg_th_up & vol <= default_neg_th_dw)];
            vol_nonshow_Ind            = setdiff(1:length(vol),vol_nonshow_Ind);
            
            colorname                  = get(handles.popupmenu2,'string');
            colorname                  = colorname{get(handles.popupmenu2,'value')};
            colorname                  = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
            Cdata                      = fs_surf_color(vertices,vol,colorname,default_pos_th_up,default_neg_th_up);
            
            if ~get(handles.checkbox3,'value')
                Cdata(vol_nonshow_Ind,:)                = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
            else
                v_curv                                  = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
                Gdata                                   = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
                Cdata(vol_nonshow_Ind,:)                = Gdata(vol_nonshow_Ind,:);
                clear v_curv Gdata
            end
            
            axes(handles.axes2);
            delete(get(gca,'children'));
            
            patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
            view(view_para(1),view_para(2));
            h_camlight                 = camlight('headlight');lighting phong;material dull % shiny, dull, metal
            
            
            setappdata(0,'view_para',      view_para);
            setappdata(0,'h_camlight',     h_camlight);
            setappdata(0,'vol_nonshow_Ind',vol_nonshow_Ind);
            setappdata(0,'labelInd',       []); %  label file, 0-based frame (ROI)
            setappdata(0,'surf_border',    []); % surface ROI's border
            clear  Cdata  vol_min vol_max vol_nonshow_Ind
            
             %%%%%%%%%%%%%%% show colorbar
             if get(handles.checkbox2,'value')
                 default_neg_th_up     = round(default_neg_th_up*10)/10;
                 default_neg_th_dw     = round(default_neg_th_dw*10)/10;
                 default_pos_th_up     = round(default_pos_th_up*10)/10;
                 default_pos_th_dw     = round(default_pos_th_dw*10)/10;
                 [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorname,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw);
                 axes(handles.axes6);
                 imagesc(colorA);
                 colormap(colorname);
                 set(gca,'YTick',[])
                 set(gca,'XTick',xtick);
                 set(gca,'XTickLabel',xticklabel);
                 set(gca,'XAxisLocation','bottom');
                 set(gca,'FontUnits','pixels');
                 set(gca,'FontWeight','bold');
                 set(gca,'Fontsize',12);
             end
             clear colorA  xtick xticklabel
        end
    end
end

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2

vol                                 = getappdata(0,'vol'); % overlay 
default_pos_th_dw                   = str2num(get(handles.edit8,'string'));
default_pos_th_up                   = str2num(get(handles.edit9,'string'));
default_neg_th_dw                   = str2num(get(handles.edit10,'string'));
default_neg_th_up                   = str2num(get(handles.edit11,'string'));

if ~isempty(vol)
    if get(handles.checkbox2,'value')
        currp                       = which('fs_results.m');
        currp                       = fileparts(currp);
        colorname                   = get(handles.popupmenu2,'string');
        colorname                   = colorname{get(handles.popupmenu2,'value')};
        colorname                   = [currp,filesep,'ColorMats',filesep,colorname,'.mat'];
        load(colorname);
        A                           = whos('-file',colorname);
        colorname                   = eval(A.name);
        clear A
        
        default_neg_th_up     = round(default_neg_th_up*10)/10;
        default_neg_th_dw     = round(default_neg_th_dw*10)/10;
        default_pos_th_up     = round(default_pos_th_up*10)/10;
        default_pos_th_dw     = round(default_pos_th_dw*10)/10;
        [colorA,colorname,xtick,xticklabel] = fs_colorbar(colorname,default_pos_th_up,default_pos_th_dw,default_neg_th_up,default_neg_th_dw);
        axes(handles.axes6);
        imagesc(colorA);
        colormap(colorname);
        set(gca,'YTick',[])
        set(gca,'XTick',xtick);
        set(gca,'XTickLabel',xticklabel);
        set(gca,'XAxisLocation','bottom');
        set(gca,'FontUnits','pixels');
        set(gca,'FontWeight','bold');
        set(gca,'Fontsize',12);
        clear colorA  xtick xticklabel
    else
        axes(handles.axes6);
        cla reset
        set(gca,'XTick',[]);set(gca,'XTickLabel',[]);
        set(gca,'YTick',[]);set(gca,'YTickLabel',[]);
        set(gca,'Color',[63 63 63]/255);set(gca,'Xcolor',[63 63 63]/255);set(gca,'Ycolor',[63 63 63]/255);set(gca,'Zcolor',[63 63 63]/255);
    end
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global FREESURFER_HOME

hemi                                = get(handles.popupmenu1,'string');
hemi                                = hemi{get(handles.popupmenu1,'value')};
vertices                            = getappdata(0,'vertices');
faces                               = getappdata(0,'faces');
view_para                           = getappdata(0,'view_para');
vol                                 = getappdata(0,'vol'); % overlay volume
vol_nonshow_Ind                     = getappdata(0,'vol_nonshow_Ind');
labelInd                            = getappdata(0,'labelInd');
surf_border                         = getappdata(0,'surf_border');

currp                               = which('fs_results');
currp                               = fileparts(currp);

if isempty(vol) && isempty(labelInd)
    if ~get(handles.checkbox3,'value')
        Cdata                       = repmat([200 200 200]./255,length(vertices),1);
    else
        v_curv                      = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
        Cdata                       = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
        clear v_curv
    end
    if ~isempty(surf_border)
        Cdata(surf_border.borders{surf_border.k},:)  = repmat([250 0   0]./255,length(surf_border.borders{surf_border.k}),1);
    end
end

if ~isempty(vol)
    default_pos_th_up               = str2num(get(handles.edit9,'string'));
    default_neg_th_up               = str2num(get(handles.edit11,'string'));
    colorpath                       = get(handles.popupmenu2,'string');
    colorpath                       = colorpath{get(handles.popupmenu2,'value')};
    colorpath                       = [currp,filesep,'ColorMats',filesep,colorpath,'.mat'];
    Cdata                           = fs_surf_color(vertices,vol,colorpath,default_pos_th_up,default_neg_th_up);
    if ~get(handles.checkbox3,'value')
        Cdata(vol_nonshow_Ind,:)    = repmat([200 200 200]./255,length(vol_nonshow_Ind),1);
    else
        v_curv                      = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
        Gdata                       = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
        Cdata(vol_nonshow_Ind,:)    = Gdata(vol_nonshow_Ind,:);
        clear v_curv Gdata
    end
    if ~isempty(surf_border)
        Cdata(surf_border.borders{surf_border.k},:)  = repmat([250 0   0]./255,length(surf_border.borders{surf_border.k}),1);
    end
end

if ~isempty(labelInd)
    if ~get(handles.checkbox3,'value')
        Cdata                       = repmat([200 200 200]./255,length(vertices),1);
    else
        v_curv                      = read_curv([FREESURFER_HOME,filesep,'subjects',filesep,'fsaverage',filesep,'surf',filesep,hemi,'.curv']);
        Cdata                       = fs_curv_color(vertices,v_curv,[currp,filesep,'ColorMats',filesep,'gray.mat']);
        clear v_curv
    end
    Cdata(labelInd,:)               = repmat([0   255 255]./255,length(labelInd),1);
    if ~isempty(surf_border)
        Cdata(surf_border.borders{surf_border.k},:)  = repmat([250 0   0]./255,length(surf_border.borders{surf_border.k}),1);
    end
end

axes(handles.axes2);
delete(get(gca,'children'));
patch('vertices',vertices,'faces',faces(:,[1 3 2]),'facecolor','flat','Edgecolor','none','FaceVertexCdata',Cdata,'CDataMapping','scaled');
axis equal;
view(view_para(1),view_para(2));
h_camlight = camlight('headlight');lighting phong;material dull % shiny, dull, metal

setappdata(0,'h_camlight',  h_camlight);

%% zoom in and out function
function zoom_lzl(src,cbd)
cp=get(gca,'CurrentPoint'); 
if cbd.VerticalScrollCount > 0
    k=1.25; % zoom in 
else
    k=0.75; % zoom out
end
axis(k*axis+(1-k)*cp([1,1,3,3]))
