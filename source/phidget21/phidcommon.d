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
module phidget21.phidcommon;
import phidget21.phidconst;

extern(C) __gshared {
	struct _CPhidget;
	alias CPhidgetHandle = _CPhidget*;

	struct _CPhidget_Timestamp {
		int seconds;       /**< Number of seconds since timing began */
		int microseconds;  /**< Number of microseconds since last second passed - range is 0 - 999999 */
	}
	alias CPhidget_Timestamp = _CPhidget_Timestamp;
	alias CPhidget_TimestampHandle = _CPhidget_Timestamp*;

	enum CPhidget_DeviceUID {
		PHIDUID_NOTHING = 1,
		
		PHIDUID_ACCELEROMETER_2AXIS_2G,
		PHIDUID_ACCELEROMETER_2AXIS_10G,
		PHIDUID_ACCELEROMETER_2AXIS_5G,
		PHIDUID_ACCELEROMETER_3AXIS_3G,
		
		PHIDUID_ADVANCEDSERVO_1MOTOR,
		
		PHIDUID_ADVANCEDSERVO_8MOTOR,
		PHIDUID_ADVANCEDSERVO_8MOTOR_PGOOD_FLAG,
		PHIDUID_ADVANCEDSERVO_8MOTOR_CURSENSE_FIX,
		
		PHIDUID_ANALOG_4OUTPUT,
		
		PHIDUID_BRIDGE_4INPUT_GAINBUG,
		PHIDUID_BRIDGE_4INPUT,
		
		PHIDUID_ENCODER_1ENCODER_1INPUT_OLD,
		PHIDUID_ENCODER_1ENCODER_1INPUT_v1,
		PHIDUID_ENCODER_1ENCODER_1INPUT_v2,
		PHIDUID_ENCODER_HS_1ENCODER,
		PHIDUID_ENCODER_HS_4ENCODER_4INPUT,
		
		PHIDUID_FREQUENCYCOUNTER_2INPUT,
		
		PHIDUID_GPS,
		
		PHIDUID_INTERFACEKIT_0_0_4_NO_ECHO,
		PHIDUID_INTERFACEKIT_0_0_4,
		PHIDUID_INTERFACEKIT_0_0_8,
		PHIDUID_INTERFACEKIT_0_5_7,
		PHIDUID_INTERFACEKIT_0_8_8_w_LCD,
		PHIDUID_INTERFACEKIT_0_16_16_NO_ECHO,
		PHIDUID_INTERFACEKIT_0_16_16_BITBUG,
		PHIDUID_INTERFACEKIT_0_16_16,
		PHIDUID_INTERFACEKIT_2_2_2,
		PHIDUID_INTERFACEKIT_2_8_8,
		PHIDUID_INTERFACEKIT_4_8_8,
		PHIDUID_INTERFACEKIT_8_8_8_NO_ECHO,
		PHIDUID_INTERFACEKIT_8_8_8,
		PHIDUID_INTERFACEKIT_8_8_8_FAST,
		PHIDUID_INTERFACEKIT_8_8_8_w_LCD_NO_ECHO,
		PHIDUID_INTERFACEKIT_8_8_8_w_LCD,
		PHIDUID_INTERFACEKIT_8_8_8_w_LCD_FAST,
		PHIDUID_INTERFACEKIT_TOUCH_SLIDER,
		PHIDUID_INTERFACEKIT_TOUCH_ROTARY,
		
		PHIDUID_IR,
		
		PHIDUID_LED_64,
		PHIDUID_LED_64_ADV,
		PHIDUID_LED_64_ADV_M3,
		
		PHIDUID_MOTORCONTROL_1MOTOR,
		PHIDUID_MOTORCONTROL_HC_2MOTOR,
		PHIDUID_MOTORCONTROL_LV_2MOTOR_4INPUT,
		
		PHIDUID_PHSENSOR,
		
		PHIDUID_RFID_OLD,
		PHIDUID_RFID,
		PHIDUID_RFID_2OUTPUT_NO_ECHO,
		PHIDUID_RFID_2OUTPUT,
		PHIDUID_RFID_2OUTPUT_READ_WRITE,
		
		PHIDUID_SERVO_1MOTOR_OLD,
		PHIDUID_SERVO_4MOTOR_OLD,
		PHIDUID_SERVO_1MOTOR_NO_ECHO,
		PHIDUID_SERVO_1MOTOR,
		PHIDUID_SERVO_4MOTOR_NO_ECHO,
		PHIDUID_SERVO_4MOTOR,
		
		PHIDUID_SPATIAL_ACCEL_3AXIS_1049,
		PHIDUID_SPATIAL_ACCEL_3AXIS_1041,
		PHIDUID_SPATIAL_ACCEL_3AXIS_1043,
		PHIDUID_SPATIAL_ACCEL_GYRO_COMPASS_1056,
		PHIDUID_SPATIAL_ACCEL_GYRO_COMPASS_1056_NEG_GAIN,
		PHIDUID_SPATIAL_ACCEL_GYRO_COMPASS_1042,
		PHIDUID_SPATIAL_ACCEL_GYRO_COMPASS_1044,
		
		PHIDUID_STEPPER_BIPOLAR_1MOTOR,
		PHIDUID_STEPPER_BIPOLAR_1MOTOR_M3,
		PHIDUID_STEPPER_UNIPOLAR_4MOTOR,
		
		PHIDUID_TEMPERATURESENSOR_OLD,
		PHIDUID_TEMPERATURESENSOR,
		PHIDUID_TEMPERATURESENSOR_AD22100,
		PHIDUID_TEMPERATURESENSOR_TERMINAL_BLOCKS,
		PHIDUID_TEMPERATURESENSOR_4,
		PHIDUID_TEMPERATURESENSOR_IR,
		
		PHIDUID_TEXTLCD_2x20,
		PHIDUID_TEXTLCD_2x20_w_8_8_8,
		PHIDUID_TEXTLCD_2x20_w_8_8_8_BRIGHTNESS,
		PHIDUID_TEXTLCD_ADAPTER,
		
		PHIDUID_TEXTLED_1x8,
		PHIDUID_TEXTLED_4x8,
		
		PHIDUID_WEIGHTSENSOR,
		
		PHIDUID_GENERIC,
		PHIDUID_FIRMWARE_UPGRADE
	}

	/**
	 * Opens a Phidget.
	 *
  	 * Params:
 	 * 	phid = A phidget handle.
	 *	serialNumber = Serial number. Specify -1 to open any.
   	 */
	int function(CPhidgetHandle phid, int serialNumber) CPhidget_open;

	/**
	 * Opens a Phidget by label.
	 *
	 * Params:
	 * 	phid = A phidget handle.
 	 *	label = Label string. Labels can be up to 10 characters (UTF-8 encoding). Specify NULL to open any.
	 */
	int function(CPhidgetHandle phid, const char* label) CPhidget_openLabel;
	
	/**
	 * Closes a Phidget.
	 *
	 * Params:
	 *	phid = An opened phidget handle.
	 */
	int function(CPhidgetHandle phid) CPhidget_close;
	
	/**
	 * Frees a Phidget handle.
	 *
 	 * Params:
	 * 	phid = A closed phidget handle.
	 */
	int function(CPhidgetHandle phid) CPhidget_delete;

	alias CPhidget_set_OnDetach_Handler_Func = extern(C) int function(CPhidgetHandle phid, void* userPtr);
	/**
 	 * Sets a detach handler callback function. This is called when this Phidget is unplugged from teh system.
	 *
	 * Params:
	 *	phid = A phidget handle.
	 *	fptr = Callback function pointer.
	 *	userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetHandle phid, CPhidget_set_OnDetach_Handler_Func fptr, void* userPtr) CPhidget_set_OnDetach_Handler;

	alias CPhidget_set_OnAttach_Handler_Func = extern(C) int function(CPhidgetHandle phid, void* userPtr);
	/**
	 * Sets an attach handler callback function. This is called when this Phidget is plugged into the system, and is ready for use.
	 *
	 * Params:
	 *	phid = A phidget handle.
	 *	fptr = Callback function pointer.
	 *	userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetHandle phid, CPhidget_set_OnAttach_Handler_Func fptr, void* userPtr) CPhidget_set_OnAttach_Handler;

	alias CPhidget_set_OnServerConnect_Handler_Func = extern(C) int function(CPhidgetHandle phid, void* userPtr);
	/**
 	 * Sets a server connect handler callback function. This is used for opening Phidgets remotely, and is called when a connection to the server has been made.
	 *
	 * Params:
	 *	phid = A phidget handle.
	 *	fptr = Callback function pointer.
	 *	userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetHandle phid, CPhidget_set_OnServerConnect_Handler_Func fptr, void* userPtr) CPhidget_set_OnServerConnect_Handler;

	alias CPhidget_set_OnServerDisconnect_Handler_Func = extern(C) int function(CPhidgetHandle phid, void* userPtr);
	/**
	 * Sets a server disconnect handler callback function. This is used for opening Phidgets remotely, and is called when a connection to the server has been lost.
	 *
	 * Params:
	 *	phid = A phidget handle.
	 *	fptr = Callback function pointer.
	 *	userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetHandle phid, CPhidget_set_OnServerDisconnect_Handler_Func fptr, void* userPtr) CPhidget_set_OnServerDisconnect_Handler;

	alias CPhidget_set_OnError_Handler_Func = extern(C) int function(CPhidgetHandle phid, void* userPtr, int errorCode, const char* errorString);
	/**
	 * Sets the error handler callback function. This is called when an asynchronous error occurs.
	 *
	 * Params:
	 *	phid = A phidget handle.
	 * 	fptr = Callback function pointer.
	 * 	userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetHandle phid, CPhidget_set_OnError_Handler_Func fptr, void* userPtr) CPhidget_set_OnError_Handler;
	
	/**
	 * Gets the specific name of a Phidget.
	 *
	 * Params:
	 *	phid = An attached phidget handle.
	 *	deviceName = A pointer which will be set to point to a char array containing the device name.
	 */
	int function(CPhidgetHandle phid, const char** deviceName) CPhidget_getDeviceName;
	
	/**
	 * Gets the serial number of a Phidget.
	 *
	 * Params:
	 *	phid = An attached phidget handle..
	 *	serialNumber = An int pointer for returning the serial number.
	 */
	int function(CPhidgetHandle phid, int* serialNumber) CPhidget_getSerialNumber;
	
	/**
	 * Gets the firmware version of a Phidget.
	 *
	 * Params:
	 *	phid = An attached phidget handle.
	 *	deviceVersion = An int pointer for returning the device version.
	 */
	int function(CPhidgetHandle phid, int* deviceVersion) CPhidget_getDeviceVersion;
	
	/**
	 * Gets the attached status of a Phidget.
	 *
	 * Params:
	 *	phid = A phidget handle.
	 *	deviceStatus = An int pointer for returning the device status. Possible are PHIDGET_ATTACHED and PHIDGET_NOTATTACHED.
	 */
	int function(CPhidgetHandle phid, int* deviceStatus) CPhidget_getDeviceStatus;
	
	/**
	 * Gets the library version. This contains a version number and a build date.
	 *
	 * Params:
	 *	libraryVersion = A pointer which will be set to point to a char array containing the library version string.
	 */
	int function(const char** libraryVersion) CPhidget_getLibraryVersion;
	
	/**
	 * Gets the type (class) of a Phidget.
	 *
	 * Params:
	 *	phid = An attached phidget handle.
	 *	deviceType = A pointer which will be set to a char array containing the device type string.
	 */
	int function(CPhidgetHandle phid, const char** deviceType) CPhidget_getDeviceType;
	
	/**
	 * Gets the label of a Phidget.
	 *
	 * Params:
	 *	phid = An attached phidget handle.
	 * 	deviceLabel = A pointer which will be set to a char array containing the device label string.
	 */
	int function(CPhidgetHandle phid, const char** deviceLabel) CPhidget_getDeviceLabel;
	
	/**
	 * Gets the label of a Phidget.
	 *
	 * Params:
	 *	phid = An attached phidget handle.
	 *	deviceLabel = A pointer which will be set to a char array containing the device label string.
	 */
	int function(CPhidgetHandle phid, const char* deviceLabel) CPhidget_setDeviceLabel;
	
	/**
	 * Gets the description for an error code.
	 *
	 * Params:
	 *	errorCode = The error code to get the description of.
	 *	errorString = A pointer which will be set to a char array containing the error description string.
	 */
	int function(int errorCode, const char** errorString) CPhidget_getErrorDescription;
	
	/**
	 * Waits for attachment to happen. This can be called right after calling CPhidget_open, as an alternative to using the attach handler.
	 *
	 * Params:
	 *	phid = An opened phidget handle.
	 *	milliseconds = Time to wait for the attachment. Specify 0 to wait forever.
	 */
	int function(CPhidgetHandle phid, int milliseconds) CPhidget_waitForAttachment;
	
	/**
	 * Gets the server ID fo a remotely opened Phidget. This will fail if the Phidget was opened locally.
	 *
	 * Params:
	 *	phid = A connected phidget handle.
	 *	serverID = A pointer which will be set to a char array containing the server ID string.
	 */
	int function(CPhidgetHandle phid, const char** serverID) CPhidget_getServerID;
	
	/**
	 * Gets the address and port of a remotely opened Phidget. This will fail f the Phidget was opened locally.
	 *
	 * Params:
	 *	phid = A connected phidget handle.
	 *	address = A pointer which will be set to a char array containing the address string.
	 *	port = An int pointer for returning the port number.
	 */
	int function(CPhidgetHandle phid, const char** address, int* port) CPhidget_getServerAddress;
	
	/**
	 * Gets the connected to server status of a remotely opened Phidget. This will fail if the Phidget was opened locally.
	 *
	 * Params:
	 *	phid = An opened phidget handle.
	 *	serverStatus = An int pointer for returning the server status. Possible codes are PHIDGET_ATTACHED and PHIDGET_NONATTACHED.
	 */
	int function(CPhidgetHandle phid, int* serverStatus) CPhidget_getServerStatus;
	
	/**
	 * Gets the device ID of a Phidget.
	 *
	 * Params:
	 *	phid = An attached phidget handle.
	 *	deviceID = The device ID constant.
	 */
	int function(CPhidgetHandle phid, CPhidget_DeviceID* deviceID) CPhidget_getDeviceID;
	
	/**
	 * Gets the class of a Phidget Handle.
	 *
	 * Params:
	 *	phid = A phidget handle.
	 *	deviceClass = The device class constant.
	 */
	int function(CPhidgetHandle phid, CPhidget_DeviceClass* deviceClass) CPhidget_getDeviceClass;

	/**
	 * Opens a Phidget remotely by ServerID. Note that this requries Bonjour (mDNS) to be running on both the host and the server.
	 * 
	 * Params:
	 *  phid = A phidget handle.
	 *  serial = Serial number. Specify -1 to open any.
	 *  serverID = Server ID. Specify NULL to open any.
	 *  password = Password. Can be NULL if the server is running unsecured.
	 */
	int function(CPhidgetHandle phid, int serial, const char* serverID, const char* password) CPhidget_openRemote;

	/**
	 * Opens a Phidget remotely by ServerID. Note that this requires Bonjour (mDNS) to be running on both the host and the server.
	 * 
	 * Params:
	 *  phid = A phidget handle.
	 *  label = Label string. Labels can be up to 10 characters (UTF-8 encoding). Specify NULL to open any.
	 *  serverID = Server ID. Specify NULL to open any.
	 *  password = Password. Can be NULL if the server is running unsecured.
	 */
	int function(CPhidgetHandle phid, const char* label, const char* serverID, const char* password) CPhidget_openLabelRemote;

	/**
	 * Opens a Phidget remotely by address and port, with optional serial number.
	 * 
	 * Params:
	 *  phid = A phidget handle.
	 *  serial = Serial number. Specify -1 to open any.
	 *  address = Address. This can be a hostname or IP address.
	 *  port = Port number. Default is 5001.
	 *  password = Password. Can be NULL if the server is running unsecured.
	 */
	int function(CPhidgetHandle phid, int serial, const char* address, int port, const char* password) CPhidget_openRemoteIP;

	/**
	 * Opens a Phidget remotely by address and port, with optional label.
	 * 
	 * Params:
	 *  phid = A phidget handle.
	 *  label = Label string. Labels can be up to 10 characters (UTF-8 encoding). Specify NULL to open any.
	 *  address = Address. This can be a hostname or IP address.
	 *  port = Port number. Default is 5001.
	 *  password = Password. Can be NULL if the serer is running unsecured.
	 */
	int function(CPhidgetHandle phid, const char* label, const char* address, int port, const char* password) CPhidget_openLabelRemoteIP;
}