function varargout = interface(varargin)
% INTERFACE MATLAB code for interface.fig
%      INTERFACE,  by itself,  creates a new INTERFACE or raises the existing
%      singleton*.
%
%      H = INTERFACE returns the handle to a new INTERFACE or the handle to
%      the existing singleton*.
%
%      INTERFACE('CALLBACK', hObject, eventData, handles, ...) calls the local
%      function named CALLBACK in INTERFACE.M with the given input arguments.
%
%      INTERFACE('Property', 'Value', ...) creates a new INTERFACE or raises the
%      existing singleton*.  Starting from the left,  property value pairs are
%      applied to the GUI before interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE,  GUIDATA,  GUIHANDLES

% Edit the above text to modify the response to help interface

% Last Modified by GUIDE v2.5 06-May-2018 10:29:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',        mfilename,  ...
    'gui_Singleton',   gui_Singleton,  ...
    'gui_OpeningFcn',  @interface_OpeningFcn,  ...
    'gui_OutputFcn',   @interface_OutputFcn,  ...
    'gui_LayoutFcn',   [] ,  ...
    'gui_Callback',    []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State,  varargin{:});
else
    gui_mainfcn(gui_State,  varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before interface is made visible.
function interface_OpeningFcn(hObject,  eventdata,  handles,  varargin)
% This function has no output args,  see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface (see VARARGIN)

% Choose default command line output for interface
handles.output = hObject;

% Update handles structure
guidata(hObject,  handles);

% UIWAIT makes interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_OutputFcn(hObject,  eventdata,  handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject,  eventdata,  handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
project_name = get(handles.edit1, 'String');
suggestion = strcat(project_name, '.cr');
[filename,  pathname] = uiputfile({'*.cr'}, 'Save Project', suggestion);
file = fullfile(pathname, filename);
filepath_database = get(handles.edit2, 'String');
[~,  filename,  ext] = fileparts(filepath_database);
csvwrite(strcat(pathname,  filename,  ext),  handles.fileData);
contents = get(handles.popupmenu1, 'String');
type = contents{get(handles.popupmenu1, 'Value')};
traffic_level = get(get(handles.uibuttongroup1, 'SelectedObject'), 'String');
fileID = fopen(file, 'w');
fprintf(fileID, '%s\n', project_name);
fprintf(fileID, '%s\n', strcat(filename, ext));
fprintf(fileID, '%s\n', type);
fprintf(fileID, '%s\n', traffic_level);
fclose(fileID);


function edit4_Callback(hObject,  eventdata,  handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of edit4 as text
%        str2double(get(hObject, 'String')) returns contents of edit4 as a double


% --- Executes during object creation,  after setting all properties.
function edit4_CreateFcn(hObject,  eventdata,  handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject, 'BackgroundColor'),  get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end



function edit6_Callback(hObject,  eventdata,  handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of edit6 as text
%        str2double(get(hObject, 'String')) returns contents of edit6 as a double


% --- Executes during object creation,  after setting all properties.
function edit6_CreateFcn(hObject,  eventdata,  handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject, 'BackgroundColor'),  get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end



function edit5_Callback(hObject,  eventdata,  handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of edit5 as text
%        str2double(get(hObject, 'String')) returns contents of edit5 as a double


% --- Executes during object creation,  after setting all properties.
function edit5_CreateFcn(hObject,  eventdata,  handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject, 'BackgroundColor'),  get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject,  eventdata,  handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
full_path = get(handles.edit2, 'String');
file_data = csvread(full_path);
num_towers = str2num(get(handles.edit7, 'String'));
type_model = get(get(handles.uibuttongroup2, 'SelectedObject'), 'String');
if strcmp(type_model, 'SVM')
    towers = train_svm_model(file_data, num_towers);
else
    towers = train_anfis_model(file_data, 3, str2mat('trimf','trimf','trimf','trimf'), 20, num_towers);
end
fprintf('tamaño %d\n', size(towers));

function edit1_Callback(hObject,  eventdata,  handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of edit1 as text
%        str2double(get(hObject, 'String')) returns contents of edit1 as a double


% --- Executes during object creation,  after setting all properties.
function edit1_CreateFcn(hObject,  eventdata,  handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject, 'BackgroundColor'),  get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject,  eventdata,  handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject, 'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject, 'Value')} returns selected item from popupmenu1


% --- Executes during object creation,  after setting all properties.
function popupmenu1_CreateFcn(hObject,  eventdata,  handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject, 'BackgroundColor'),  get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end



function edit2_Callback(hObject,  eventdata,  handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject, 'String') returns contents of edit2 as text
%        str2double(get(hObject, 'String')) returns contents of edit2 as a double


% --- Executes during object creation,  after setting all properties.
function edit2_CreateFcn(hObject,  eventdata,  handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject, 'BackgroundColor'),  get(0, 'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject,  eventdata,  handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,  pathname] = uigetfile({'*.csv'}, 'Open Directory');
if isequal(filename, 0) || isequal(pathname, 0)
    return
end
set(handles.edit2,  'String',  strcat(pathname,  filename));
file = fullfile(pathname,  filename);
handles.fileData = csvread(file);
guidata(hObject,  handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject,  eventdata,  handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


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



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


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



function numberMF_e_Callback(hObject, eventdata, handles)
% hObject    handle to numberMF_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberMF_e as text
%        str2double(get(hObject,'String')) returns contents of numberMF_e as a double


% --- Executes during object creation, after setting all properties.
function numberMF_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberMF_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MFtype_e_Callback(hObject, eventdata, handles)
% hObject    handle to MFtype_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MFtype_e as text
%        str2double(get(hObject,'String')) returns contents of MFtype_e as a double


% --- Executes during object creation, after setting all properties.
function MFtype_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MFtype_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.panelANFIS, 'Visible', 'off');
set(handles.panelSVM, 'Visible', 'on');


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.panelSVM, 'Visible', 'off');
set(handles.panelANFIS, 'Visible', 'on');
