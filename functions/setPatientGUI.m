function varargout = setPatientGUI(varargin)
% SETPATIENTGUI MATLAB code for setPatientGUI.fig
%      SETPATIENTGUI, by itself, creates a new SETPATIENTGUI or raises the existing
%      singleton*.
%
%      H = SETPATIENTGUI returns the handle to a new SETPATIENTGUI or the handle to
%      the existing singleton*.
%
%      SETPATIENTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SETPATIENTGUI.M with the given input arguments.
%
%      SETPATIENTGUI('Property','Value',...) creates a new SETPATIENTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before setPatientGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to setPatientGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help setPatientGUI

% Last Modified by GUIDE v2.5 14-Apr-2017 17:40:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @setPatientGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @setPatientGUI_OutputFcn, ...
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


% --- Executes just before setPatientGUI is made visible.
function setPatientGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to setPatientGUI (see VARARGIN)

% Choose default command line output for setPatientGUI
handles.output = hObject;
%print(contents{get(hObject,'Value')})
set(handles.patientMenu, 'String', strcat(varargin{1}.patientData.Name, {' '}, varargin{1}.patientData.Surname));
set(handles.placeMenu, 'String', strcat(varargin{1}.placeData.Place));
set(handles.ledMenu, 'String', strcat(varargin{1}.ledData.Led));
set(handles.stateMenu, 'String', strcat(varargin{1}.stateData.State));
set(handles.handMenu, 'String', strcat(varargin{1}.handData.Hand));
% default data
global nameIndex;
global placeIndex;
global ledIndex;
global stateIndex;
global handIndex;

handles.NameIndex = nameIndex;
handles.PlaceIndex = placeIndex;
handles.LedIndex = ledIndex;
handles.StateIndex = stateIndex;
handles.HandIndex = handIndex;

set(handles.patientMenu, 'Value', handles.NameIndex);
set(handles.placeMenu, 'Value', handles.PlaceIndex);
set(handles.ledMenu, 'Value', handles.LedIndex);
set(handles.stateMenu, 'Value', handles.StateIndex);
set(handles.handMenu, 'Value', handles.HandIndex);
% Update handles structure
guidata(hObject, handles);
%handles
% UIWAIT makes setPatientGUI wait for user response (see UIRESUME)
%guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = setPatientGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiwait();
% Get default command line output from handles structure
varargout{1} = handles.output;
%handles
%uiwait();
%varargout{1} = handles.output
varargout{2} = handles;




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nameIndex;
global placeIndex;
global ledIndex;
global stateIndex;
global handIndex;
nameIndex = handles.NameIndex;
placeIndex = handles.PlaceIndex;
ledIndex = handles.LedIndex;
stateIndex = handles.StateIndex;
handIndex = handles.HandIndex;
indexArray = [nameIndex, placeIndex, ledIndex, stateIndex, handIndex];
saveConfiguration('guiData.txt', indexArray);

uiresume()
close()

% --- Executes on selection change in patientMenu.
function patientMenu_Callback(hObject, eventdata, handles)
% hObject    handle to patientMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%print(contents{get(hObject,'Value')})
handles.NameIndex = get(hObject, 'Value');
% Update handles structure
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns patientMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from patientMenu


% --- Executes during object creation, after setting all properties.
function patientMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to patientMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ledMenu.
function ledMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ledMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns ledMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ledMenu
handles.LedIndex = get(hObject, 'Value');
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function ledMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ledMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in stateMenu.
function stateMenu_Callback(hObject, eventdata, handles)
% hObject    handle to stateMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.StateIndex = get(hObject, 'Value');
% Update handles structure
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns stateMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from stateMenu


% --- Executes during object creation, after setting all properties.
function stateMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stateMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in placeMenu.
function placeMenu_Callback(hObject, eventdata, handles)
% hObject    handle to placeMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.PlaceIndex = get(hObject, 'Value');
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns placeMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from placeMenu


% --- Executes during object creation, after setting all properties.
function placeMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to placeMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in handMenu.
function handMenu_Callback(hObject, eventdata, handles)
% hObject    handle to handMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.HandIndex = get(hObject, 'Value');
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns handMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from handMenu


% --- Executes during object creation, after setting all properties.
function handMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to handMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
