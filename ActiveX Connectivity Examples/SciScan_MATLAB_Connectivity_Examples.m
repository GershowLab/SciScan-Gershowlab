%% README - INSTRUCTIONS
% -----------------------
% This script illustrates the 'getting' and 'setting' of SciScan variables
% which allows to user to both query the current value as well as modify 
% the variableas.
% 
% This example uses an ActiveX service (hosted by LabVIEW) to establish 
% communication with SciScan from MATLAB. The labview code carrying out 
% this task is 'GFGTranslator.vi'.
%
% Steps for runninng the examples:
% -------------------------------- 
% 1. Modify the variable 'path_to_GFGTranslator' to correctly point to
%    'GFGTranslator.vi' (which resides in your SciScan installation folder)
% 2. Un-comment the relevant code snippet (GET examples can
%    be found in 'section A' and SET examples can be found in 'Section B')
% 3. Note the special case for the boolean controls 'FOCUS', 'Record' 
%    and 'Cancel'; which can only be set using the FGV_dataType = 
%    'boolean ref' (See last example)
% 
% @Author: Scientifica Ltd.

%% Path of GFGTranslator.vi in your SciScan installation folder
path_to_GFGTranslator = 'D:\gitrepo\140812_ssdev_repo\GFGTranslator.vi'; 
                                                        % !! Modify this !!

%% Initialize ActiveX to enable communication with LabVIEW
LABVIEW=actxserver('LabVIEW.Application');
VI=invoke(LABVIEW,'GetVIReference',path_to_GFGTranslator);


%
% *****************************************************************
% Example A - Reading Data from SciScan
% *****************************************************************

%% ---------------------------------------------------------------
% eg A1: Reading a string
% ----------------------------------------------------------------
% GFG_action = 'get';  % Action to take (Valid entries: 'get' and 'set')
% GFG_dataType = 'string';% Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only) 
% GFG_var_name = 'experiment.name';  % variable name of the SciScan UI item
% 
% SetControlValue(VI,'Action', GFG_action);  % Write the Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Write the Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Specify GFG Variable
% 
% VI.Run();  % Run the VI
% result = GetControlValue(VI,'string_op');  % Get return value from string indicator
% status = GetControlValue(VI,'status');
% 
% 
% if (strcmp(status,'success'))
%    display(sprintf('SciScan GFG variable %s = %s',GFG_var_name,...
%        num2str(result)) )  % Print value to console
% else
%    display(status)
% end

%% ---------------------------------------------------------------
% eg A2: Reading a path
% ----------------------------------------------------------------
% GFG_action = 'get';  % Action to take (Valid entries: 'get' and 'set')
% GFG_dataType = 'path'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'root.path';  % variable name of the SciScan UI item
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Specify GFG Variable to be read
% 
% VI.Run();  % Run the VI
% result = GetControlValue(VI,'string_op');  % Get return value from string indicator
% status = GetControlValue(VI,'status');
% 
% 
% if (strcmp(status,'success'))
%    display(sprintf('SciScan GFG variable %s = %s',GFG_var_name,result))  % Print value to console
% else
%    %sprintf('SciScan GFG variable %s not found!\n(or SciScan NOT RUNNING resulting in a LabVIEW Error; in which case go to LabVIEW and manually stop execution of GFGTranslator.vi) ',GFG_var_name)
%    display(status)
% end


%% ---------------------------------------------------------------
% eg A3: Reading a numeric
% ----------------------------------------------------------------
% GFG_action = 'get'; % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'numeric'; %(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
% GFG_var_name = 'Laser.Power';  %variable name of the SciScan UI item
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Specify GFG Variable to be read
% 
% VI.Run();  % Run the VI
% result = GetControlValue(VI,'numeric_op');  % Get return value
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display(sprintf('SciScan GFG variable %s = %s',GFG_var_name,num2str(result)) )  % Print value to console
% else
%    display(status)
% end  


%% ----------------------------------------------------------------
% eg A4: Reading a boolean
% -----------------------------------------------------------------
% GFG_action = 'get';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'boolean'; %Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'enable.virtual.XYZ';  % variable name of the SciScan UI item
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Specify GFG Variable to be read
% 
% VI.Run();  % Run the VI
% result = GetControlValue(VI,'boolean_op');  % Get return value
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display(sprintf('SciScan GFG variable %s = %s',GFG_var_name,num2str(result)) )  % Print value to console
% else
%     display(status)
% end

%% ---------------------------------------------------------------
% eg A5: Reading an Image array
% ----------------------------------------------------------------
% GFG_action = 'get';  % Action to take (Valid entries: 'get' and 'set')
% GFG_dataType = 'image'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'Channel 1 large';  % variable name of the SciScan UI item
% 
% SetControlValue(VI,'Action', GFG_action);  % Write the Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Write the Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Specify GFG Variable to be read
% 
% VI.Run();  % Run the VI
% result = GetControlValue(VI,'array_op');  % Get return value from string indicator
% 
% status = GetControlValue(VI,'status');
% 
% 
% if (strcmp(status,'success'))
%    if (numel(result) ~= 0)
%        display(sprintf('SciScan GFG variabe %s found! Plotting the array as image...\n',GFG_var_name)) % Print value to console
%        imagesc(result);       
%    else
%        display(sprintf('SciScan GFG variabe %s found. However, no data to plot.',GFG_var_name))    
%    end
% else
%    display(status)
% end

%% ---------------------------------------------------------------
% eg A6: Reading an Enum
% ----------------------------------------------------------------
% GFG_action = 'get';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'numeric'; %(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
% GFG_var_name = 'avg.type';  %variable name of the SciScan UI item
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Specify GFG Variable to be read
% 
% VI.Run();  % Run the VI
% result = GetControlValue(VI,'numeric_op');  % Get return value
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display(sprintf('SciScan GFG variable %s = %s',GFG_var_name,num2str(result)))  % Print value to console
% else
%    display(status)
% end

%% ---------------------------------------------------------------
% eg A7: Reading a variant
% ----------------------------------------------------------------
% GFG_action = 'get';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'variant'; %(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
% %GFG_var_name = 'scan.mode.main.settings'; %variable name of the SciScan UI item
% GFG_var_name = 'Min.Max.Channel.1'; %variable name of the SciScan UI item
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Specify GFG Variable to be read
% 
% VI.Run();  % Run the VI
% result = GetControlValue(VI,'variant_op');  % Get return value
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display(sprintf('SciScan GFG variable %s:',GFG_var_name) )
%    display(result)  % Print value to console
% else
%    display(status)
% end   


%% ---------------------------------------------------------------
% eg A8: Reading all GFG Variables as a variant
% ----------------------------------------------------------------
% GFG_action = 'get';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'all'; %(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% 
% VI.Run();  % Run the VI
% result = GetControlValue(VI,'variant_op');  % Get return value
% if (strcmp(status,'success'))
% display(sprintf('All SciScan variables:\n'))
% display(result)
% else
%    status = GetControlValue(VI,'status')
% end

%% ---------------------------------------------------------------
% eg A9: Reading the software version
% ----------------------------------------------------------------
% GFG_action = 'get';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'version'; %(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
% GFG_var_name = 'SciScan 1.0 GALVO.vi';  %Filename(in SciScan)
% %GFG_var_name = 'GFGTranslator.vi';  % Checking GFGTranslator.vi version
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Specify GFG Variable to be read
% 
% VI.Run();  % Run the VI
% result = GetControlValue(VI,'string_op');  % Get return value
% status = GetControlValue(VI,'status');
% 
% 
% if (strcmp(status,'success'))
% display(sprintf('%s version: %s', GFG_var_name, result) )
% else
%    status = GetControlValue(VI,'status')
% end

%% *****************************************************************
% Example B - Writing data to SciScan
% ******************************************************************

%% ---------------------------------------------------------------
% eg B1: Writing to a string GFG variable
% ----------------------------------------------------------------

% GFG_action = 'set';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'string'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'protocol.notes';  % GFG Variable to write into
% GFG_data_to_set = 'Setting Variable Successful!'; % Data to set
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Set the GFG Variable name
% SetControlValue(VI,'string_ip',GFG_data_to_set); % Set the GFG data value
% 
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end
%% ---------------------------------------------------------------
% eg B2: Writing to a path GFG variable
% ----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'path'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'root.path';  % GFG Variable to write into
% GFG_data_to_set = 'D:\temp';
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); %Set the GFG Variable name
% SetControlValue(VI,'string_ip',GFG_data_to_set); % Set the GFG data value
% 
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end

%% ---------------------------------------------------------------
% eg B3: Writing to a numeric
% ----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'numeric'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'Laser.Power';  % GFG Variable name
% GFG_data_to_set = 0;
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % GFG Variable to write into
% SetControlValue(VI,'numeric_ip',GFG_data_to_set) % Set the GFG data value
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end

%% ---------------------------------------------------------------
% eg B4: Writing to an enumerated data type
% ----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries: 'get' and 'set')
% GFG_dataType = 'numeric'; % (Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
% GFG_var_name = 'display.palette';  % GFG Variable to write into
% GFG_data_to_set = 2; %Data to which the enum is set (Start from 0)
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); %Set the GFG Variable name
% SetControlValue(VI,'numeric_ip',GFG_data_to_set) % Set the GFG data value
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end

%% ---------------------------------------------------------------
% eg B5: Writing to a boolean reference
% ----------------------------------------------------------------
% !!!! NOTE !!!!
% This is a special case for some of the Boolean controls in SciScan,
% namely 'FOCUS', 'Record' and 'Cancel'
%-----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries: 'get' and 'set')
% GFG_dataType = 'booleanref'; % (Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
% GFG_var_name = 'FOCUS';  % GFG Variable to write into
% GFG_data_to_set = 0; %Data to which the boolean is set (Valid entries = 1, 0)
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); %Set the GFG Variable name
% SetControlValue(VI,'boolean_ip',GFG_data_to_set) % Set the GFG data value
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end

%% ---------------------------------------------------------------
% eg B6: Writing to a boolean
% ----------------------------------------------------------------
% This example demonstrates writing to Boolean controls (except
% for the special cases described in B5)
%-----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries: 'get' and 'set')
% GFG_dataType = 'boolean'; % (Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
% GFG_var_name = 'enable.virtual.XYZ';  % GFG Variable to write into
% GFG_data_to_set = 1; %Data to which the boolean is set (Valid entries = 1, 0)
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); %Set the GFG Variable name
% SetControlValue(VI,'boolean_ip',GFG_data_to_set) % Set the GFG data value
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end

%% ---------------------------------------------------------------
% eg B7: Writing Absolute Stage Positions
% ----------------------------------------------------------------
% This example demonstrates writing absolute stage positions as
% a 'command string'
%-----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'string'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'SetAbsXYZ';  % GFG Variable to write into
% GFG_data_to_set = '10,20,30'; % Data to set
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Set the GFG Variable name
% SetControlValue(VI,'string_ip',GFG_data_to_set); % Set the GFG data value
% 
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end

%% ---------------------------------------------------------------
% eg B8: Writing Virtual Stage Positions
% ----------------------------------------------------------------
% This example demonstrates writing virtual stage positions as
% a 'command string'
%-----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'string'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'SetVirtXYZ';  % GFG Variable to write into
% GFG_data_to_set = '10,20,30'; % Data to set
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Set the GFG Variable name
% SetControlValue(VI,'string_ip',GFG_data_to_set); % Set the GFG data value
% 
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end
%% ---------------------------------------------------------------
% eg B9: Writing Absolute Stage Positions Independently (absX)
% ----------------------------------------------------------------
% This example demonstrates writing virtual stage positions as
% a 'numeric'
%-----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'numeric'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'absX';  % GFG Variable to write into
% GFG_data_to_set = 12; % Data to set
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Set the GFG Variable name
% SetControlValue(VI,'numeric_ip',GFG_data_to_set); % Set the GFG data value
% 
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end

%% ---------------------------------------------------------------
% eg B10: Writing Absolute Stage Positions Independently (absY)
% ----------------------------------------------------------------
% This example demonstrates writing virtual stage positions as
% a 'numeric'
%-----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'numeric'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'absY';  % GFG Variable to write into
% GFG_data_to_set = 20; % Data to set
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Set the GFG Variable name
% SetControlValue(VI,'numeric_ip',GFG_data_to_set); % Set the GFG data value
% 
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end

%% ---------------------------------------------------------------
% eg B11: Writing Absolute Stage Positions Independently (absZ)
% ----------------------------------------------------------------
% This example demonstrates writing virtual stage positions as
% a 'numeric'
%-----------------------------------------------------------------
% GFG_action = 'set';  % Action to take (Valid entries are 'get' and 'set')
% GFG_dataType = 'numeric'; % Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
% GFG_var_name = 'absZ';  % GFG Variable to write into
% GFG_data_to_set = 30; % Data to set
% 
% SetControlValue(VI,'Action', GFG_action);  % Set Action
% SetControlValue(VI,'DataType', GFG_dataType);  % Set Data Type
% SetControlValue(VI,'GFG_var_name',GFG_var_name); % Set the GFG Variable name
% SetControlValue(VI,'numeric_ip',GFG_data_to_set); % Set the GFG data value
% 
% VI.Run();  % Run the VI
% status = GetControlValue(VI,'status');
% 
% if (strcmp(status,'success'))
%    display('Command send success')  % Print value to console
% else
%    display(status);
% end