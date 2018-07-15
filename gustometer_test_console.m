function varargout = gustometer_test_console(varargin)
% GUSTOMETER_TEST_CONSOLE MATLAB code for gustometer_test_console.fig
%      GUSTOMETER_TEST_CONSOLE, by itself, creates a new GUSTOMETER_TEST_CONSOLE or raises the existing
%      singleton*.
%
%      H = GUSTOMETER_TEST_CONSOLE returns the handle to a new GUSTOMETER_TEST_CONSOLE or the handle to
%      the existing singleton*.
%
%      GUSTOMETER_TEST_CONSOLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUSTOMETER_TEST_CONSOLE.M with the given input arguments.
%
%      GUSTOMETER_TEST_CONSOLE('Property','Value',...) creates a new GUSTOMETER_TEST_CONSOLE or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gustometer_test_console_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gustometer_test_console_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gustometer_test_console

% Last Modified by GUIDE v2.5 03-Mar-2017 02:16:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gustometer_test_console_OpeningFcn, ...
                   'gui_OutputFcn',  @gustometer_test_console_OutputFcn, ...
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

% --- Executes just before gustometer_test_console is made visible.
function gustometer_test_console_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gustometer_test_console (see VARARGIN)

% Choose default command line output for gustometer_test_console
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes gustometer_test_console wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gustometer_test_console_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function infuse_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to infuse_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function infuse_time_Callback(hObject, eventdata, handles)
% hObject    handle to infuse_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of infuse_time as text
%        str2double(get(hObject,'String')) returns contents of infuse_time as a double
infuse_time = str2double(get(hObject, 'String'));
if isnan(infuse_time)
    set(hObject, 'String', 2);
    errordlg('Input must be a number','Error');
end

% Save the new infuse_time value
handles.infuse_time = infuse_time;
infuse_rate=15;% change if necessary, but usually max rate is good for infusing
handles.infuse_volume = (infuse_time/60)*infuse_rate;

%rate = (handles.dispense_volume / handles.dispense_time)*60;
set(handles.inf_vol,'String',handles.infuse_volume);
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function dispense_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to infuse_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function dispense_time_Callback(hObject, eventdata, handles)
% hObject    handle to infuse_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of infuse_time as text
%        str2double(get(hObject,'String')) returns contents of infuse_time as a double
dispense_time = str2double(get(hObject, 'String'));
if isnan(dispense_time)
    set(hObject, 'String', 2);
    errordlg('Input must be a number','Error');
end

% Save the new infuse_time value
handles.dispense_time = dispense_time;
rate = (handles.dispense_volume / handles.dispense_time)*60;
set(handles.rate, 'String', rate);
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function dispense_volume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dispense_volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function dispense_volume_Callback(hObject, eventdata, handles)
% hObject    handle to dispense_volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dispense_volume as text
%        str2double(get(hObject,'String')) returns contents of dispense_volume as a double
dispense_volume = str2double(get(hObject, 'String'));
if isnan(dispense_volume)
    set(hObject, 'String', 0.5);
    errordlg('Input must be a number','Error');
end

% Save the new dispense_volume value
handles.dispense_volume = dispense_volume;
rate = (handles.dispense_volume / handles.dispense_time)*60;
set(handles.rate, 'String', rate);
guidata(hObject,handles)

% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rate = (handles.dispense_volume / handles.dispense_time)*60;
set(handles.rate, 'String', rate);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles, true);

% --- Executes when selected object changed in unitgroup.
% function unitgroup_SelectionChangedFcn(hObject, eventdata, handles)
% % hObject    handle to the selected object in unitgroup 
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% if (hObject == handles.english)
%     set(handles.text4, 'String', 'lb/cu.in');
%     set(handles.text5, 'String', 'cu.in');
%     set(handles.text6, 'String', 'lb');
% else
%     set(handles.text4, 'String', 'kg/cu.m');
%     set(handles.text5, 'String', 'cu.m');
%     set(handles.text6, 'String', 'kg');
% end

% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.infuse_time = 2;
handles.infuse_volume=0.5;
handles.dispense_time = 2;
handles.dispense_volume  = 0.5;

rate = (handles.dispense_volume / handles.dispense_time)*60;

% set(handles.infuse_time, 'String', handles.infuse_time);
% set(handles.dispense_time, 'String', handles.dispense_time);
% set(handles.dispense_volume,  'String', handles.dispense_volume);
%set(handles.rate, 'String', 0);
set(handles.rate, 'String', rate);
set(handles.inf_vol,'String',handles.infuse_volume);
set(handles.com_port, 'String',0);
set(handles.error_port, 'String','');
set(handles.pumps_selected, 'String',0);

%set(handles.unitgroup, 'SelectedObject', handles.english);

% set(handles.text4, 'String', 'lb/cu.in');
% set(handles.text5, 'String', 'cu.in');
% set(handles.text6, 'String', 'lb');

% Update handles structure
guidata(handles.figure1, handles);



%function density_Callback(hObject, eventdata, handles)
% hObject    handle to infuse_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of infuse_time as text
%        str2double(get(hObject,'String')) returns contents of infuse_time as a double


% --- Executes when uipanel1 is resized.
function uipanel1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function syringe_diameter_Callback(hObject, eventdata, handles)
% hObject    handle to syringe_diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of syringe_diameter as text
%        str2double(get(hObject,'String')) returns contents of syringe_diameter as a double


% --- Executes during object creation, after setting all properties.
function syringe_diameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to syringe_diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in find_com_port.
function find_com_port_Callback(hObject, eventdata, handles)
% hObject    handle to find_com_port (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
%% Script to check serial ports
%Written by Alexandra DiFeliceantonio version Matlab 2013b
%% adapted by MG Veldhuizen
%if exist('s1') == 1
success=0;
com_port_mess='';
succesport='0';
if exist('s1')==1
    disp('Port already open, closing and attempting to reopen correct port'); %if it exists, close the port, it might be wrong
    fclose(s1);
    delete(s1);
    clear s1;
end
if  exist('s1')~=1 % check if s1 already exists    
   for k=3:8  % try for COM3-COM8 (most common addresses)
 %  if success~=1
       try  % if it doesn't exist try and open a port
            serport=['com' num2str(k)];
            s1=serial(serport,'baudrate',19200,'databits',8,'terminator',13); % try COM3 first
            fopen(s1);
            successmess=['Was able to connect to COM' num2str(k)]; 
            disp(successmess)
            success=success+1;
            succesport=['com' num2str(k)];
            fclose(s1);
            delete(s1);
            clear s1;
        catch err
            if (strcmp(err.identifier, 'MATLAB:serial:fopen:opfailed')); % if that fails, try com3
               sermess=['COM' num2str(k) ' not available'];
               disp(sermess);
               clear err
                fclose(s1);
                delete(s1);
                clear s1;
%                if k<8
%                     sermess=['trying COM' num2str(k+1)];
%                     disp(sermess);
%                     %disp('COM4 not available, trying COM3')
%                 else 
%                     disp('Other issue, check if USB is connected or restart matlab');
%                end
            end
   %     end
   end
   end
end
if success==0
com_port_mess='no available ports found, check if USB is connected or restart matlab';
   %    disp('no available ports found, check if USB is connected or restart matlab');
elseif success >1
 com_port_mess='more than one available port found, check matlab space and manually test correct port';   
else

end
disp(com_port_mess);
   set(handles.com_port, 'String', succesport);
   set(handles.error_port,'String',com_port_mess);
%clear
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on find_com_port and none of its controls.
function find_com_port_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to find_com_port (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in list_pumps.
function list_pumps_Callback(hObject, eventdata, handles)
% hObject    handle to list_pumps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
    for i=0:10
       pump_handle=findobj('Tag',['pump_',num2str(i)]); 
       %disp(pump_handle);
       set(pump_handle,'Enable','off'); 
    end    
no_pumps_selected= get(hObject, 'value');
% handles.no_pumps_selected=no_pumps_selected;
% set(handles.no_pumps_selected, 'Int',0);
    for i=0:(no_pumps_selected-1)
       pump_handle=findobj('Tag',['pump_',num2str(i)]); 
       set(pump_handle,'Enable','on'); 
    end    
set(handles.pumps_selected, 'String', no_pumps_selected);
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_pumps contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_pumps


% --- Executes on button press in test_pumps.
function test_pumps_Callback(hObject, eventdata, handles)
% hObject    handle to test_pumps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
P=cell(str2num(handles.pumps_selected.String),1);
M=cell(str2num(handles.pumps_selected.String),5);%fill in chars that are returned from
%query

%loop to reset check marks and status messages
for i=0:10
    params_handle=findobj('Tag',['params',num2str(i)]); 
    set(params_handle,'String','');
    pump_handle=findobj('Tag',['pump_',num2str(i)]); 
    set(pump_handle,'Value',0);
end   
s1=serial((handles.com_port.String),'baudrate',19200,'databits',8,'terminator',13);
 
%loop to query and display status message
 for i=0:(str2num(handles.pumps_selected.String)-1)
     params_handle=findobj('Tag',['params',num2str(i)]); 
     set(params_handle,'ForegroundColor',[0 0.5 0]);%not sure how to get red color
     set(params_handle,'String','pump parameters sent');
     l=pumpinit(handles.dispense_volume,handles.rate,handles.infuse_volume,i,handles);
     fopen(s1);
     fprintf(s1,[num2str(i) 'run']); 
     set(params_handle,'String','dispense sent, listen for pump motor, check pump #');
     pause(10);
     try
        clear lastwarn;
        fprintf(s1,[num2str(i) 'dis']);
        set(params_handle,'String','query sent');
        P{i+1,1}=fscanf(s1,'%s',19);
        p1=str2num(P{i+1,1}(11:15));
        if p1==(handles.dispense_volume+handles.infuse_volume)
            pump_handle=findobj('Tag',['pump_',num2str(i)]); 
            set(pump_handle,'Value',1); 
            correctvolstring = ['correct volume dispensed: ',num2str(p1), ' ml'];
            set(params_handle,'String',correctvolstring);
        else
            set(params_handle,'ForegroundColor','r');%not sure how to get red color
            incorrectvolstring = ['incorrect volume dispensed: ',num2str(p1), ' ml'];
            set(params_handle,'String',incorrectvolstring);
            %pumptxt_handle=findobj('Tag',['textpump',num2str(i)]);
            %set(pumptxt_handle,'String','error');
        end
        %warn=lastwarn;
        if (strcmp(lastwarn, 'Unsuccessful read: A timeout occurred before the Terminator was reached or SIZE values were available..')); % if that fails, try com3
            error(lastwarn);
        end
        catch err
            if (strcmp(lastwarn, 'Unsuccessful read: A timeout occurred before the Terminator was reached or SIZE values were available..')); % if that fails, try com3
               set(params_handle,'String',['query fail, check that pump displays: ',num2str(handles.dispense_volume+handles.infuse_volume),' ml']);   
               set(params_handle,'ForegroundColor','r');%not sure how to get red color
               clear err;
               %warn='0';
               lastwarn('')
            end
     end
     fclose(s1);
end

% format return from query I <float> W <float> <volume units>    

function v=pumpinit(~, ~, ~, index, handles)
% set up pumps parameters or a single pump, can be called from another
% script. Assumes serial port is already open
s1=serial((handles.com_port.String),'baudrate',19200,'databits',8,'terminator',13);
 fopen(s1);
    fprintf(s1,([num2str(index) 'dia26.59'])); %syringe inner diameter
	pause(.1);
	fprintf(s1,([num2str(index) 'phn01']));   %BEGINNING OF PHASE 1 (before subject receives liquid, infuse to get the liquid to the end of the tube)
	pause(.1);
	fprintf(s1,([num2str(index) 'funrat'])); %function pumpint rate
    pause(.1);
    fprintf(s1,([num2str(index), 'rate15mm']));    %ml per hour converted into ml per minute (15mm equal to max rate)
    pause(.1);
    fprintf(s1,([num2str(index) ,'vol',num2str(handles.infuse_volume)]));   %volume to be dispensed
	pause(.1);
	fprintf(s1,([num2str(index) 'dirinf']));    %dirinf=pumping direction = infuse
	pause(.1);
	
    
    fprintf(s1,([num2str(index) 'phn02']));   %BEGINNING OF PHASE 2 (when subject is actually receiving the liquid)
    pause(.1);
    fprintf(s1,([num2str(index) 'funrat']));
    pause(.1);
    fprintf(s1,([num2str(index), 'rate', handles.rate.String,'mm']));    %ml per hour converted into ml per minute (15mm equal to max rate)
    pause(.1);
    fprintf(s1,([num2str(index) ,'vol',num2str(handles.dispense_volume)]));   %volume to be dispensed
	pause(.1);
    fprintf(s1,([num2str(index) 'dirinf'])); %direction infuse
    pause(.1);
    
    fprintf(s1,([num2str(index) 'phn03'])); %BEGINNING OF PHASE 3 (withdraw liquid to prevent any drippage)
    pause(.1);
	fprintf(s1,([num2str(index) 'funrat']));    
    pause(.1);
	fprintf(s1,([num2str(index) 'rat15mm']));   %WE WITHDRAW AT THE MAXIMUM RATE
    pause(.1);
	fprintf(s1,([num2str(index) ,'vol',num2str(handles.infuse_volume)]));   %volume to be retracted 
    pause(.1);
	fprintf(s1,([num2str(index) 'dirwdr'])); % direction withdraw
    pause(.1);
	fprintf(s1,([num2str(index) 'phn04'])); %  begin phase 4 (stop)
    pause(.1);
	fprintf(s1,([num2str(index) 'funstp'])); % stop pump
    fclose(s1);
    
    v=1;


     


% --- Executes on button press in exit_button.
function exit_button_Callback(hObject, eventdata, handles)
% hObject    handle to exit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if  exist('s1')==1 
    fclose(s1);
end    

%delete(handles)
delete(handles.figure1)
clear


% --- Executes on selection change in list_pumps.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to list_pumps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list_pumps contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list_pumps


% --- Executes during object creation, after setting all properties.
function list_pumps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list_pumps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pumps_selected.
function pumps_selected_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pumps_selected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over exit_button.
function exit_button_ButtonDownFcn(hObject, eventdata, handles)


% hObject    handle to exit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function file_name_Callback(hObject, eventdata, handles)
% hObject    handle to file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name as text
%        str2double(get(hObject,'String')) returns contents of file_name as a double


% --- Executes during object creation, after setting all properties.
function file_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
