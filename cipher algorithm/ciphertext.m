function varargout = ciphertext(varargin)
% CIPHERTEXT MATLAB code for ciphertext.fig
%      CIPHERTEXT, by itself, creates a new CIPHERTEXT or raises the existing
%      singleton*.
%
%      H = CIPHERTEXT returns the handle to a new CIPHERTEXT or the handle to
%      the existing singleton*.
%
%      CIPHERTEXT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CIPHERTEXT.M with the given input arguments.
%
%      CIPHERTEXT('Property','Value',...) creates a new CIPHERTEXT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ciphertext_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ciphertext_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ciphertext

% Last Modified by GUIDE v2.5 19-May-2022 07:09:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ciphertext_OpeningFcn, ...
                   'gui_OutputFcn',  @ciphertext_OutputFcn, ...
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


% --- Executes just before ciphertext is made visible.
function ciphertext_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ciphertext (see VARARGIN)

% Choose default command line output for ciphertext
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ciphertext wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ciphertext_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function msg_Callback(hObject, eventdata, handles)
% hObject    handle to msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of msg as text
%        str2double(get(hObject,'String')) returns contents of msg as a double


% --- Executes during object creation, after setting all properties.
function msg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function res_Callback(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res as text
%        str2double(get(hObject,'String')) returns contents of res as a double


% --- Executes during object creation, after setting all properties.
function res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
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
m=get(handles.msg,'string');
k=str2num(get(handles.k,'string'));
    if k>25 || k<1
set(handles.res,'string','Key must be in range from 1 to 25');
    else
  for i= 1:length(m)
            if (m(i)==32)
                continue;
            end
     Plaintext(i)=m(i)-k;
            
            if Plaintext(i) <65
                Plaintext(i)=Plaintext(i)+26;
            end
    
        end
        Plaintext=lower(char(Plaintext));
        set(handles.res,'string',Plaintext)




    end
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=get(handles.msg,'string');
k=str2num(get(handles.k,'string'));
    if k>25 || k<1
set(handles.res,'string','Key must be in range from 1 to 25');
    else


        for i= 1:length(m)
            if (m(i)==32)
                continue;
            end
    
           
            Ciphertext(i)=m(i)+k;
            
            if Ciphertext(i) >122
               Ciphertext(i)=Ciphertext(i)-26;
            end
    
        end
        Ciphertext=upper(char(Ciphertext));
        set(handles.res,'string',Ciphertext)
    end
   


    


function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
