function varargout = hill(varargin)
% HILL MATLAB code for hill.fig
%      HILL, by itself, creates a new HILL or raises the existing
%      singleton*.
%
%      H = HILL returns the handle to a new HILL or the handle to
%      the existing singleton*.
%
%      HILL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HILL.M with the given input arguments.
%
%      HILL('Property','Value',...) creates a new HILL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hill_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hill_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hill

% Last Modified by GUIDE v2.5 19-May-2022 19:42:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hill_OpeningFcn, ...
                   'gui_OutputFcn',  @hill_OutputFcn, ...
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


% --- Executes just before hill is made visible.
function hill_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hill (see VARARGIN)

% Choose default command line output for hill
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hill wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hill_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes during object deletion, before destroying properties.
function msg_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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
m=get(handles.msg,'string')
k=get(handles.k,'data')
lenk=size(k,2);
    
  Ciphertext=reshape(m,[],lenk)*0;
  [nr,ncol]=size(Ciphertext);
    
  x=1;
  for j=1:nr
        for i=1:ncol
              Ciphertext(j,i)=m(x)
              x=x+1;
        end  
    end
    
      Ciphertext=Ciphertext-97
      Ciphertext=upper(char(mod(Ciphertext*k,26)+97));
     
    h=1;
 for j=1:nr
        for i=1:ncol
            l(1,h)=Ciphertext(j,i);
            h=h+1;
        end  
    end
    Ciphertext=l;
        set(handles.res,'string',Ciphertext)





% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m=get(handles.msg,'string')
k=get(handles.k,'data')
lenk=size(k,2);


plaintext=reshape(m,[],lenk)*0;
[nr,ncol]=size(plaintext);
% convert ciphertext from vector to matrix

x=1;
for j=1:nr
    for i=1:ncol
          plaintext(j,i)=m(x);
          x=x+1;
    end
end
%A=65  , Z=90
plaintext=plaintext-65;

%find the inverse of determinant

%int16 : Type
dk=int16(mod(det(k),26));

if gcd(dk,26) ~= 1
    disp('determinant has no inverse modulo 26')
    
else 
[~,u,~]= gcd(dk,26);
inverse_dk= mod(u,26);
end

%find Minor and cofactor of key matrix (adjugate matrix)
key_t=k';
adjugate_key=int16((det(key_t)*inv(key_t))');

%key inverse=(Det(key))^-1 . Adj(Key) mode 26
key_inverse=mod(inverse_dk*adjugate_key,26);

%Decryption p=c*k^-1 mod26
plaintext=lower(char((mod(plaintext*double(key_inverse),26)+65)));

h=1;
for j=1:nr
    for i=1:ncol
        pl(1,h)=plaintext(j,i);
        h=h+1;
    end  
end
plaintext=pl;

        set(handles.res,'string',plaintext)







