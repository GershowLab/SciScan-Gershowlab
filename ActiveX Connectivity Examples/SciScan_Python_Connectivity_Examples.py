# -*- coding: utf-8 -*-
"""
Created on Thu Jul 23 15:01:38 2015
Description:
-----------
This Example illustrates the 'getting' and 'setting' of GFG (Generelaized Functional 
Global) variable of SciScan. This allows to user to query the current software state
as well as modify it.

This example uses an ActiveX service (hosted by LabVIEW) to establish communication 
with SciScan from Python. The labview code carrying out this task is 'GFGTranslator.vi'.

Steps for runninng the code are as follows:
--------------------------------------------

1. Modify the variable 'path_to_GFGTranslator' to correctly point to 'GFGTranslator.vi'
2. Un-comment the relevant code snippet (Read/Get examples can
be found in 'section A' and write examples can be found in 'Section B')
3. Note the special case for boolean controls 'FOCUS', 'Record' and 'Cancel' 
which can only be set using the FG_dataType = 'boolean ref' (See last example)

@author: Scientifica Ltd.

"""

#Connectto GFG core
import win32com.client  # Python ActiveX Client
import os #for path related functionalities

path_to_GFGTranslator = os.path.normpath('D:\\gitrepo\\140812_ssdev_repo\\GFGTranslator.vi') 
                                                        # !!!! MODIFY THIS !!!!
LabVIEW = win32com.client.Dispatch("Labview.Application")
VI = LabVIEW.getvireference(path_to_GFGTranslator)  # Path to LabVIEW VI
VI._FlagAsMethod("Call")  # Flag "Call" as Method



# *****************************************************************
# Example A - Reading Data from SciScan
# *****************************************************************

# ---------------------------------------------------------------
# # eg A1: Reading a string
# #-----------------------
#GFG_action = 'get'  # Action to take (Valid entries: 'get' and 'set')
#GFG_dataType = 'string' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only) 
#GFG_var_name = 'experiment.name'  # variable name of the SciScan UI item
#
#VI.setcontrolvalue('Action', GFG_action)  # Write the Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Write the Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Specify GFG Variable to be read
#
#VI.Call()  # Run the VI
#result = VI.getcontrolvalue('string_op')  # Get return value from string indicator
#status = VI.getcontrolvalue('status')
#
#print("status: " + status)
#if status == 'success':
#    print "SciScan GFG variabe " + "'" + GFG_var_name + "'" + " = " + str(result)  # Print value to console

# -----------------------------------------------------------------

## ---------------------------------------------------------------
## eg A2: Reading a path
##-----------------------
#GFG_action = 'get'  # Action to take (Valid entries: 'get' and 'set')
#GFG_dataType = 'path' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'root.path'  # variable name of the SciScan UI item
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Specify GFG Variable to be read
#
#VI.Call()  # Run the VI
#result = VI.getcontrolvalue('string_op')  # Get return value from string indicator
#status = VI.getcontrolvalue('status')
#
#print("status: " + status)
#if status == 'success':
#    print "SciScan GFG variabe " + "'" + GFG_var_name + "'" + " = " + str(result)  # Print value to console

## -----------------------------------------------------------------
# ---------------------------------------------------------------
# eg A3: Reading a numeric
#-----------------------
#GFG_action = 'get'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'numeric' #(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
#GFG_var_name = 'Laser.Power'  #variable name of the SciScan UI item
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Specify GFG Variable to be read
#
#VI.Call()  # Run the VI
#result = VI.getcontrolvalue('numeric_op')  # Get return value
#status = VI.getcontrolvalue('status')
#
#print("status: " + status)
#if status == 'success':
#    print "SciScan GFG variabe " + "'" + GFG_var_name + "'" + " = " + str(result)  # Print value to console

#    
# -----------------------------------------------------------------

# ---------------------------------------------------------------
# eg A4: Reading a boolean
#-----------------------
#GFG_action = 'get'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'boolean' #Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'enable.virtual.XYZ'  # variable name of the SciScan UI item
#GFG_var_name = 'Laser.Powe1r'  # variable name of the SciScan UI item
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Specify GFG Variable to be read
#
#VI.Call()  # Run the VI
#result = VI.getcontrolvalue('boolean_op')  # Get return value
#status = VI.getcontrolvalue('status')
#
#print("status: " + status);
#if status == 'success':
#    print "SciScan GFG variabe " + "'" + GFG_var_name + "'" + " = " + str(result)  # Print value to console

# -----------------------------------------------------------------

# ---------------------------------------------------------------
# eg A5: Reading an Image array
#-------------------------------
#GFG_action = 'get'  # Action to take (Valid entries: 'get' and 'set')
#GFG_dataType = 'image' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'Channel 1 large'  # variable name of the SciScan UI item
#
#VI.setcontrolvalue('Action', GFG_action)  # Write the Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Write the Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Specify GFG Variable to be read
#
#VI.Call()  # Run the VI
#result = VI.getcontrolvalue('array_op')  # Get return value from string indicator
#
#status = VI.getcontrolvalue('status')
#
#print("status: " + status)
#if status == 'success':
#    if len(result) != 0:
#        print "SciScan GFG variabe " + "'" + GFG_var_name + "'" + " Found! Plotting the array as image...\n" # Print value to console
#        import matplotlib.pyplot as plt
#        plt.set_cmap('Greys_r')    
#        plt.imshow(result)
#    else:
#        print "SciScan GFG variabe " + "'" + GFG_var_name + "'" + " Found. However, no data to plot."    

## -----------------------------------------------------------------

# ---------------------------------------------------------------
# eg A6: Reading an Enum
#-----------------------
#GFG_action = 'get'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'numeric' #(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
#GFG_var_name = 'avg.type'  #variable name of the SciScan UI item
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Specify GFG Variable to be read
#
#VI.Call()  # Run the VI
#result = VI.getcontrolvalue('numeric_op')  # Get return value
#status = VI.getcontrolvalue('status')
#
#print("status: " + status)
#if status == 'success':
#    print "SciScan GFG variabe " + "'" + GFG_var_name + "'" + " = " + str(result)  # Print value to console
  
# -----------------------------------------------------------------

# ---------------------------------------------------------------
# eg A7: Reading a variant
#-----------------------
#GFG_action = 'get'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'variant' #(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
#GFG_var_name = 'Min.Max.Channel.1'  #variable name of the SciScan UI item
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Specify GFG Variable to be read
#
#VI.Call()  # Run the VI
#result = VI.getcontrolvalue('variant_op')  # Get return value
#status = VI.getcontrolvalue('status')
#
#print("\nstatus: " + status)
#if status == 'success':
#    print "SciScan GFG variabe " + "'" + GFG_var_name + "'" + " = " + str(result)  # Print value to console
  
# -----------------------------------------------------------------

# ---------------------------------------------------------------
# eg A8: Reading all GFG Variables as a variant
#-----------------------------------------------
#GFG_action = 'get'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'all' #(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#
#VI.Call()  # Run the VI
#result = VI.getcontrolvalue('variant_op')  # Get return value
#status = VI.getcontrolvalue('status')
#
#print("\nstatus: " + status)
#if status == 'success':
#    print "All SciScan variables:\n\n"+ str(result)
    
# -----------------------------------------------------------------

# ---------------------------------------------------------------
# eg A9: Reading the software version
# -----------------------------------------------
#GFG_action = 'get'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'version'  #(Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
##GFG_var_name = 'SciScan 1.0 GALVO.vi'  # Filename(in SciScan)
#GFG_var_name = 'GFGTranslator.vi' # Checking GFGTranslator.vi version
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name', GFG_var_name)  # Specify GFG Variable to be read
#
#VI.Call()  # Run the VI
#result = VI.getcontrolvalue('string_op')  # Get return value
#status = VI.getcontrolvalue('status')
#
#print("\nstatus: " + status)
#print "Returned string: " + str(result)

# -----------------------------------------------------------------


#*****************************************************************
# Example B - Writing data to SciScan
#*****************************************************************

## ---------------------------------------------------------------
## eg B1: Writing to a string GFG variable
##--------------------------

#GFG_action = 'set'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'string' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'protocol.notes'  # GFG Variable to write into
#GFG_data_to_set = 'Setting Variable Successful!' # Data to set
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Set the GFG Variable name
#VI.setcontrolvalue('string_ip',GFG_data_to_set) # Set the GFG data value
#
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

##-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B2: Writing to a path GFG variable
##----------------------------------------
#GFG_action = 'set'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'path' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'root.path'  # GFG Variable to write into
#GFG_data_to_set = 'D:\Temp'
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) #Set the GFG Variable name
#VI.setcontrolvalue('string_ip',GFG_data_to_set) # Set the GFG data value
#
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

##-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B3: Writing to a numeric
##----------------------------
#GFG_action = 'set'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'numeric' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'Laser.Power'  # GFG Variable name
#GFG_data_to_set = 2
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # GFG Variable to write into
#VI.setcontrolvalue('numeric_ip',GFG_data_to_set) # Set the GFG data value
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

##-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B4: Writing to an enumerated data type
##------------------------------------------
#GFG_action = 'set'  # Action to take (Valid entries: 'get' and 'set')
#GFG_dataType = 'numeric' # (Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
#GFG_var_name = 'display.palette'  # GFG Variable to write into
#GFG_data_to_set = 1 #Data to which the enum is set (Start from 0)
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) #Set the GFG Variable name
#VI.setcontrolvalue('numeric_ip',GFG_data_to_set) # Set the GFG data value
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

##-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B5: Writing to a boolean reference
## --------------------------------------
# This is a special case for some of the Boolean controls in SciScan,
## namely 'FOCUS', 'Record' and 'Cancel'
##------------------------------------------
#GFG_action = 'set'  # Action to take (Valid entries: 'get' and 'set')
#GFG_dataType = 'booleanref' # (Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
#GFG_var_name = 'FOCUS'  # GFG Variable to write into
#GFG_data_to_set = False #Data to which the boolean is set (Valid entries = True, False)
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) #Set the GFG Variable name
#VI.setcontrolvalue('boolean_ip',GFG_data_to_set) # Set the GFG data value
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

#-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B6: Writing to a boolean reference
## --------------------------------------
# This example demonstrates writing to Boolean controls (except
## for the special cases described in B5)
##------------------------------------------
#GFG_action = 'set'  # Action to take (Valid entries: 'get' and 'set')
#GFG_dataType = 'boolean' # (Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only))
#GFG_var_name = 'enable.virtual.XYZ'  # GFG Variable to write into
#GFG_data_to_set = True #Data to which the boolean is set (Valid entries = True, False)
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) #Set the GFG Variable name
#VI.setcontrolvalue('boolean_ip',GFG_data_to_set) # Set the GFG data value
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

#-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B7: Writing Absolute Stage Positions
## This example demonstrates writing absolute stage positions as
## a 'command string'
##-----------------------------------------------------------------

#GFG_action = 'set'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'string' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'SetAbsXYZ'  # GFG Variable to write into
#GFG_data_to_set = '12,22,32' # Data to set
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Set the GFG Variable name
#VI.setcontrolvalue('string_ip',GFG_data_to_set) # Set the GFG data value
#
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

##-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B8: Writing Virtual Stage Positions
## This example demonstrates writing virtual stage positions as
## a 'command string'
##-----------------------------------------------------------------

GFG_action = 'set'  # Action to take (Valid entries are 'get' and 'set')
GFG_dataType = 'string' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
GFG_var_name = 'SetVirtXYZ'  # GFG Variable to write into
GFG_data_to_set = '12,22,32' # Data to set

VI.setcontrolvalue('Action', GFG_action)  # Set Action
VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Set the GFG Variable name
VI.setcontrolvalue('string_ip',GFG_data_to_set) # Set the GFG data value

VI.Call()  # Run the VI
status = VI.getcontrolvalue('status')

if status == 'success':
    print "Command send success"  # Print value to console
else:
    print "\nStatus: " + status

##-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B9: Writing Absolute Stage Positions Independently (absX)
## This example demonstrates writing virtual stage positions as
## a 'numeric'
##-----------------------------------------------------------------

#GFG_action = 'set'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'numeric' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'absX'  # GFG Variable to write into
#GFG_data_to_set = 10 # Data to set
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Set the GFG Variable name
#VI.setcontrolvalue('numeric_ip',GFG_data_to_set) # Set the GFG data value
#
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

##-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B10: Writing Absolute Stage Positions Independently (absY)
## This example demonstrates writing virtual stage positions as
## a 'numeric'
##-----------------------------------------------------------------

#GFG_action = 'set'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'numeric' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'absY'  # GFG Variable to write into
#GFG_data_to_set = 22 # Data to set
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Set the GFG Variable name
#VI.setcontrolvalue('numeric_ip',GFG_data_to_set) # Set the GFG data value
#
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

##-----------------------------------------------------------------

## ---------------------------------------------------------------
## eg B11: Writing Absolute Stage Positions Independently (absY)
## This example demonstrates writing virtual stage positions as
## a 'numeric'
##-----------------------------------------------------------------

#GFG_action = 'set'  # Action to take (Valid entries are 'get' and 'set')
#GFG_dataType = 'numeric' # Valid entries: string, path, numeric, boolean, booleanref, all, variant (Read Only), image (Read Only)
#GFG_var_name = 'absZ'  # GFG Variable to write into
#GFG_data_to_set = 32 # Data to set
#
#VI.setcontrolvalue('Action', GFG_action)  # Set Action
#VI.setcontrolvalue('DataType', GFG_dataType)  # Set Data Type
#VI.setcontrolvalue('GFG_var_name',GFG_var_name) # Set the GFG Variable name
#VI.setcontrolvalue('numeric_ip',GFG_data_to_set) # Set the GFG data value
#
#VI.Call()  # Run the VI
#status = VI.getcontrolvalue('status')
#
#if status == 'success':
#    print "Command send success"  # Print value to console
#else:
#    print "\nStatus: " + status

##-----------------------------------------------------------------