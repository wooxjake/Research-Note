function varargout = untitled4(varargin)
% UNTITLED4 MATLAB code for untitled4.fig
%      UNTITLED4, by itself, creates a new UNTITLED4 or raises the existing
%      singleton*.
%
%      H = UNTITLED4 returns the handle to a new UNTITLED4 or the handle to
%      the existing singleton*.
%
%      UNTITLED4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED4.M with the given input arguments.
%
%      UNTITLED4('Property','Value',...) creates a new UNTITLED4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled4

% Last Modified by GUIDE v2.5 08-May-2019 17:40:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled4_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled4_OutputFcn, ...
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


% --- Executes just before untitled4 is made visible.
function untitled4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled4 (see VARARGIN)

% Choose default command line output for untitled4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in f_load.
function f_load_Callback(hObject, eventdata, handles)
% hObject    handle to f_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[file,path] = uigetfile('*.mat','MultiSelect', 'on');
set(handles.f_list,'String',file);
set(handles.path,'String',path);


% --- Executes on selection change in f_list.
function f_list_Callback(hObject, eventdata, handles)
% hObject    handle to f_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns f_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from f_list
 clc
 if strcmp(get(gcf,'selectiontype'),'open')  % listbox double-click event
     
     f=get(handles.f_list,'Value');
     f_arr=get(handles.f_list,'String');
     if length(f_arr)>1
       f_arr=f_arr{f};
     end
     path=[get(handles.path,'String') f_arr];
     marker=load_marker(path);
    
     
     set(handles.m_list,'String',marker);
     
 end


% --- Executes during object creation, after setting all properties.
function f_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
	set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in m_list.
function m_list_Callback(hObject, eventdata, handles)
% hObject    handle to m_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns m_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from m_list


% --- Executes during object creation, after setting all properties.
function m_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in lunch.
function lunch_Callback(hObject, eventdata, handles)
% hObject    handle to lunch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f_list=get(handles.f_list,'String');
path=get(handles.path,'String');
s_m_list=get(handles.m_list,'String');

if length(s_m_list)<2
   
    
    
end


for i=1:length(f_list)
    
    m_comp=load_marker([path f_list{i}]);
    res=check_marker(s_m_list,m_comp);

    if ~isempty(res)
        arr_wrong=cellstr(get(handles.result,'String'));
        
        for ii=1:length(res)
            arr_wrong{end+1}=[f_list{i} '->' res{ii}];
        end
        set(handles.result,'String',arr_wrong);
    end    
    
end



% --- Executes on selection change in result.
function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns result contents as cell array
%        contents{get(hObject,'Value')} returns selected item from result


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%% script function

function arr_marker=load_marker(direc)
    
     raw=load(direc);
     raw_name=fieldnames(raw);
     raw=eval(['raw.' raw_name{1}]);

     arr_marker=raw.Trajectories.Labeled.Labels;
   
function res=check_marker(sta,comp)

y='';
for i=1:length(comp)
    
    if ~ismember(comp{i},sta)
        y{end+1}=comp{i};
    end
    
end

res=y;
     
