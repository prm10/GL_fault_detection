function varargout = dynamic_2d(varargin)
% DYNAMIC_2D MATLAB code for dynamic_2d.fig
%      DYNAMIC_2D, by itself, creates a new DYNAMIC_2D or raises the existing
%      singleton*.
%
%      H = DYNAMIC_2D returns the handle to a new DYNAMIC_2D or the handle to
%      the existing singleton*.
%
%      DYNAMIC_2D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DYNAMIC_2D.M with the given input arguments.
%
%      DYNAMIC_2D('Property','Value',...) creates a new DYNAMIC_2D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dynamic_2d_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dynamic_2d_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dynamic_2d

% Last Modified by GUIDE v2.5 21-Sep-2015 11:02:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dynamic_2d_OpeningFcn, ...
                   'gui_OutputFcn',  @dynamic_2d_OutputFcn, ...
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


% --- Executes just before dynamic_2d is made visible.
function dynamic_2d_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dynamic_2d (see VARARGIN)

global data1 date1 sample_num sample_pos chos plot_handles...
    auto_plot_timer edit_time0 edit_time1 edit_time2;
chos=[1:26];
load data_ÐüÁÏ_2012-03-24.mat;
data1=data0(:,chos);
date1=date0;
time_info=[datestr(date1(1),'yyyy-mm-dd HH:MM:SS'),10,datestr(date1(length(data0)),'yyyy-mm-dd HH:MM:SS')];
set(handles.edit_time_info,'String',time_info);
edit_time0=date1(1);
edit_time1=date1(floor(length(date1)*0.4));
edit_time2=date1(floor(length(date1)*0.6));
set(handles.edit_time0,'string',datestr(edit_time0,'yyyy-mm-dd HH:MM:SS'));
set(handles.edit_time1,'string',datestr(edit_time1,'yyyy-mm-dd HH:MM:SS'));
set(handles.edit_time2,'string',datestr(edit_time2,'yyyy-mm-dd HH:MM:SS'));
sample_num=str2double(get(handles.edit_num,'string'));
sample_pos=1;
auto_plot_timer=timer(...
    'Name','MyTimer',...
    'Period',0.1,...
    'ExecutionMode','fixedSpacing');
plot_handles=handles.axes1;
self_model_train();
self_scatter_plot();
% Choose default command line output for dynamic_2d
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dynamic_2d wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dynamic_2d_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global auto_plot_timer;
% stop(auto_plot_timer);
% delete(auto_plot_timer);
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global date1 sample_num sample_pos;
sample_pos=floor(length(date1)*get(hObject,'Value'));
if sample_pos+sample_num>length(date1)
    sample_pos=length(date1)-sample_num;
end
self_scatter_plot();
guidata(hObject, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_time0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_time0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sample_pos date1;
sample_pos=find(date1<=datenum(get(hObject,'String')),1,'last');
% Hints: get(hObject,'String') returns contents of edit_time0 as text
%        str2double(get(hObject,'String')) returns contents of edit_time0 as a double


% --- Executes during object creation, after setting all properties.
function edit_time0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_time0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_num_Callback(hObject, eventdata, handles)
% hObject    handle to edit_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sample_num;
sample_num=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit_num as text
%        str2double(get(hObject,'String')) returns contents of edit_num as a double


% --- Executes during object creation, after setting all properties.
function edit_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_loaddata.
function pushbutton_loaddata_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_loaddata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data1 date1;
[filename, pathname] = uigetfile('*.mat', 'Select a MATLAB data file');
if ~isequal(filename,0)
	load(fullfile(pathname, filename));
	data1=data0;
	date1=date0;
%    disp(length(date1));
	time_info=[datestr(date0(1),'yyyy-mm-dd HH:MM:SS'),10,datestr(date0(length(data0)),'yyyy-mm-dd HH:MM:SS')];
    set(handles.edit_time_info,'String',time_info);
end
guidata(hObject, handles);

function edit_time2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_time2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global edit_time2;
edit_time2=datenum(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit_time2 as text
%        str2double(get(hObject,'String')) returns contents of edit_time2 as a double


% --- Executes during object creation, after setting all properties.
function edit_time2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_time2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_time1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_time1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global edit_time1;
edit_time1=datenum(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit_time1 as text
%        str2double(get(hObject,'String')) returns contents of edit_time1 as a double


% --- Executes during object creation, after setting all properties.
function edit_time1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_time1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_train.
function pushbutton_train_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
self_model_train();
self_scatter_plot();

% figure;
% plot(1:i1,T2(1:i1),i1+1:i2,T2(i1+1:i2),i2+1:size(data1,1),T2(i2+1:size(data1,1)));

guidata(hObject, handles);

function self_scatter_plot()
global sample_num sample_pos T plot_handles date1;
% axes(plot_handles);
% plot(T(1,sample_pos+1:sample_pos+sample_num),T(2,sample_pos+1:sample_pos+sample_num),'--');
% hold on;
if sample_pos<1
    sample_pos=1;
end
if sample_pos+sample_num>length(date1)
    sample_pos=length(date1)-sample_num;
end
scatter(plot_handles,T(1,sample_pos+1:sample_pos+sample_num),...
    T(2,sample_pos+1:sample_pos+sample_num),...
    linspace(30,50,sample_num),(linspace(0.7,0,sample_num).^0.3)'*ones(1,3),...
    'filled');
axis(plot_handles,[-6 6 -6 6]);
% hold off;

function self_auto_plot(obj,eventdata,ud)
flag=ud.f;
global date1 sample_num sample_pos;
sample_pos=sample_pos+flag;
self_scatter_plot();

function self_model_train(handles)
global data1 date1 T2 SPE T edit_time1 edit_time2;
i1=find(date1<edit_time1, 1, 'last' );
i2=find(date1<edit_time2, 1, 'last' );
data_train0=data1(1:i1,:);
data_validation0=data1(i1+1:i2,:);
data_test0=data1(i2+1:end,:);
M_train=mean(data_train0);
S_train=std(data_train0);
data_train1=guiyihua(data_train0,M_train,S_train);%ÑµÁ·¼¯
data_validation1=guiyihua(data_validation0,M_train,S_train);%²âÊÔ¼¯
data_test1=guiyihua(data_test0,M_train,S_train);%²âÊÔ¼¯
data_all1=guiyihua(data1,M_train,S_train);%²âÊÔ¼¯
x=data_train1';%ÑµÁ·¼¯
[P,te]=pca(x);%ÑµÁ·Ä£ÐÍ
y=data_all1';%²âÊÔ¼¯
m=find(tril(ones(size(data1,2)),0)*diag(te)/sum(sum(te))<0.95,1,'last');
[T2,SPE,T]=pca_indicater(y,P,te,m);


function edit_time_info_Callback(hObject, eventdata, handles)
% hObject    handle to edit_time_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_time_info as text
%        str2double(get(hObject,'String')) returns contents of edit_time_info as a double


% --- Executes during object creation, after setting all properties.
function edit_time_info_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_time_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_before.
function pushbutton_before_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_before (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global auto_plot_timer;
ud=struct('f',-1,'h',handles.axes1); 
set(auto_plot_timer,'UserData',ud);
set(auto_plot_timer,'TimerFcn',{@self_auto_plot,ud});
start(auto_plot_timer);

% --- Executes on button press in pushbutton_next.
function pushbutton_next_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global auto_plot_timer;
ud=struct('f',1,'h',handles.axes1); 
set(auto_plot_timer,'UserData',ud);
set(auto_plot_timer,'TimerFcn',{@self_auto_plot,ud});
start(auto_plot_timer);


% --- Executes on button press in pushbutton_stop.
function pushbutton_stop_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global auto_plot_timer;
stop(auto_plot_timer);
