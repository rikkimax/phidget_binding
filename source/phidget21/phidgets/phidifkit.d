/**
 * This file is part of libphidget21
 *
 * Copyright 2006-2015 Phidgets Inc <patrick@phidgets.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see 
 * <http://www.gnu.org/licenses/>
 */
module phidget21.phidgets.phidifkit;

extern(C) __gshared {
	struct _CPhidgetInterfaceKit;
	alias CPhidgetInterfaceKitHandle = _CPhidgetInterfaceKit*;
	
	int function(CPhidgetInterfaceKitHandle* phid) CPhidgetInterfaceKit_create;
	
	/**
	 * Gets the number of digital inputs supported by tehis board.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  count = The digital input count.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int* count) CPhidgetInterfaceKit_getInputCount;
	
	/**
	 * Gets the state of a digital input.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The input index.
	 *  inputState = The input state. Possible values are PTRUE and PFALSE.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int* inputState) CPhidgetInterfaceKit_getInputState;
	
	alias CPhidgetInterfaceKit_set_OnInputChange_Handler_Func = extern(C) int function(CPhidgetInterfaceKitHandle phid, void* userPtr, int index, int inputState);
	/**
	 * Set a digital input change handler. This is called when a digital input changes.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  fptr = Callback function pointer.
	 *  userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetInterfaceKitHandle phid, CPhidgetInterfaceKit_set_OnInputChange_Handler_Func fptr, void* userPtr) CPhidgetInterfaceKit_set_OnInputChange_Handler;
	
	/**
	 * Gets the number of digital outputs supported by this board.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  count = The output count.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int* count) CPhidgetInterfaceKit_getOutputCount;
	
	/**
	 * Gets the state of a digital output.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The output index.
	 *  outputState = The output state. Possible values are PTRUE and PFALSE.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int* outputState) CPhidgetInterfaceKit_getOutputState;
	
	/**
	 * Sets the state of a digital output.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The output index.
	 *  outputState = The output state. Possible values are PTRUE and PFALSE.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int outputState) CPhidgetInterfaceKit_setOutputState;
	
	alias CPhidgetInterfaceKit_set_OnOutputChange_Handler_Func = extern(C) int function(CPhidgetInterfaceKitHandle phid, void* userPtr, int index, int outputState);
	/**
	 * Set a digital output change handler. This is called when a digital output changs.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit hadnle.
	 *  fptr = Callback function pointer.
	 *  userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetInterfaceKitHandle phid, CPhidgetInterfaceKit_set_OnOutputChange_Handler_Func fptr, void* userPtr) CPhidgetInterfaceKit_set_OnOutputChange_Handler;
	
	/**
	 * Gets the number of sensor (analog) inputs supported by this board.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  count = The sensor input count.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int* count) CPhidgetInterfaceKit_getSensorCount;
	
	/**
	 * Gets a sensor value (0-1000).
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The sensor index.
	 *  sensorValue = The sensor value.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int* sensorValue) CPhidgetInterfaceKit_getSensorValue;
	
	/**
	 * Gets a sensor raw value (12-bit).
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The sensor index.
	 *  sensorRawValue = The sensor value.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int* sensorRawValue) CPhidgetInterfaceKit_getSensorRawValue;
	
	alias CPhidgetInterfaceKit_set_OnSensorChange_Handler_Func = extern(C) int function(CPhidgetInterfaceKitHandle phid, void* userPtr, int index, int sensorValue);
	/**
	 * Set a sensor change handler. This is called when a sensor value changes by more then the change trigger.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  fptr = Callback function pointer.
	 *  userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetInterfaceKitHandle phid, CPhidgetInterfaceKit_set_OnSensorChange_Handler_Func fptr, void* userPtr) CPhidgetInterfaceKit_set_OnSensorChange_Handler;
	
	/**
	 * Gets a sensor change trigger.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The sensor index.
	 *  trigger = The change trigger.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int* trigger) CPhidgetInterfaceKit_getSensorChangeTrigger;
	
	/**
	 * Sets a sensor change trigger.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The sensor index.
	 *  trigger = The change trigger.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int trigger) CPhidgetInterfaceKit_setSensorChangeTrigger;
	
	/**
	 * Gets the ratiometric state for this board.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  ratiometric = The ratiometric state. Possible values are PTRUE and PFALSE.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int* ratiometric) CPhidgetInterfaceKit_getRatiometric;

	/**
	 * Sets the ratiometric state for this board.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  ratiometric = The ratiometric state. Possible values are PTRUE and PFALSE.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int ratiometric) CPhidgetInterfaceKit_setRatiometric;

	/**
	 * Gets the Data rate for an analog input.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The sensor index.
	 *  milliseconds = Data rate in ms.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int* milliseconds) CPhidgetInterfaceKit_getDataRate;

	/**
	 * Sets the Data Rate for an analog input.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The sensor index.
	 *  milliseconds = Data rate in ms.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int milliseconds) CPhidgetInterfaceKit_setDataRate;

	/**
	 * Gets the maximum supported data rate for an analog input.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The sensor index.
	 *  max = Data rate in ms.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int* max) CPhidgetInterfaceKit_getDataRateMax;

	/**
	 * Gets the minimum supported data rate for an analog input.
	 * 
	 * Params:
	 *  phid = An attached phidget interface kit handle.
	 *  index = The sensor index.
	 *  min = Data rate in ms.
	 */
	int function(CPhidgetInterfaceKitHandle phid, int index, int* min) CPhidgetInterfaceKit_getDataRateMin;
}