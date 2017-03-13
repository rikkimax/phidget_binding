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
module phidget21.phidmanager;
import phidget21.phidcommon : CPhidgetHandle;

extern(C) __gshared {
	/**
     * A Phidget Manager handle.
     */
	struct _CPhidgetManager;
	alias CPhidgetManagerHandle = _CPhidgetManager*;

	int function(CPhidgetManagerHandle* phidm) CPhidgetManager_create;
	int function(CPhidgetManagerHandle phidm) CPhidgetManager_open;
	int function(CPhidgetManagerHandle phidm) CPhidgetManager_close;
	int function(CPhidgetManagerHandle phidm) CPhidgetManager_delete;

	alias CPhidgetManager_set_OnAttach_Handler_Func = extern(C) int function(CPhidgetHandle phid, void* userPtr);
	int function(CPhidgetManagerHandle phidm, CPhidgetManager_set_OnAttach_Handler_Func fptr, void* userPtr) CPhidgetManager_set_OnAttach_Handler;

	alias CPhidgetManager_set_OnDetach_Handler_Func = extern(C) int function(CPhidgetHandle phid, void* userPtr);
	int function(CPhidgetManagerHandle phidm, CPhidgetManager_set_OnDetach_Handler_Func fptr, void* userPtr) CPhidgetManager_set_OnDetach_Handler;

	int function(CPhidgetManagerHandle phidm, CPhidgetHandle** phidArray, int* count) CPhidgetManager_getAttachedDevices;
	int function(CPhidgetHandle* phidArray) CPhidgetManager_freeAttachedDevicesArray;

	alias CPhidgetManager_set_OnError_Handler_Func = extern(C) int function(CPhidgetManagerHandle phidm, void* userPtr, int errorCode, const char* errorString);
	int function(CPhidgetManagerHandle phidm, CPhidgetManager_set_OnError_Handler_Func fptr, void* userPtr) CPhidgetManager_set_OnError_Handler;

	alias CPhidgetManager_set_OnServerConnect_Handler_Func = extern(C) int function(CPhidgetManagerHandle phidm, void* userPtr);
	int function(CPhidgetManagerHandle phidm, CPhidgetManager_set_OnServerConnect_Handler_Func fptr, void* userPtr) CPhidgetManager_set_OnServerConnect_Handler;

	alias CPhidgetManager_set_OnServerDisconnect_Handler_Func = extern(C) int function(CPhidgetManagerHandle phidm, void* userPtr);
	/**
	 * Sets a server disconnect handler callback function. This is used for opening Phidget Managers remotely, and is called when a connection to the server has been lost.
	 * 
	 * Params:
	 *  phidm = A phidget manager handle.
	 *  fptr = Callback function pointer.
	 *  userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetManagerHandle phidm, CPhidgetManager_set_OnServerDisconnect_Handler_Func fptr, void* userPtr) CPhidgetManager_set_OnServerDisconnect_Handler;

	/**
	 * Gets the server ID of a remotely opened Phidget Manager. This will fail if the manager was opened locally.
	 * 
	 * Params:
	 *  phidm = A connected phidget manager handle.
	 *  serverID = A pointer which will be set of a char array containing the server ID string.
	 */
	int function(CPhidgetManagerHandle phidm, const char** serverID) CPhidgetManager_getServerID;

	/**
	 * Gets the address and port of a remotely opened Phidget Manager. This will fail if the manager was opened locally.
	 * 
	 * Params:
	 *  phidm = A connected phidget manager handle.
	 *  address = A pointer which will be set to a char array containing the address string.
	 *  port = An int pointer for returning the port number.
	 */
	int function(CPhidgetManagerHandle phidm, const char** address, int* port) CPhidgetManager_getServerAddress;

	/**
	 * Gets the connected to server status of a remotely opened Phidget Manager. This will fail if the manager was opened locally.
	 * 
	 * Params:
	 *  phidm = An opened phidget manager handle.
	 *  serverStatus = An int pointer for returning the server status. Possible codes are PHIDGET_ATTACHED and PHDIGET_NOTATTACHED.
	 */
	int function(CPhidgetManagerHandle phidm, int* serverStatus) CPhidgetManager_getServerStatus;

	/**
	 * Opens a Phidget manager remotely by ServerID. Note that this rquires Bonjour (mDNS) to be running on both the host and the server.
	 * 
	 * Params:
	 *  phidm = A phidget manager handle.
	 *  serverID = ServerID. Specify NULL to open any.
	 *  password = Password. Can be NULL if the server is running unsecured.
	 */
	int function(CPhidgetManagerHandle phidm, const char* serverID, const char* password) CPhidgetManager_openRemote;

	/**
	 * Opens a Phidget manager remotely by address and port.
	 * 
	 * Params:
	 *  phidm = A phidget manager handle.
	 *  address = Address. This can be a hostname or IP address.
	 *  port = Port number. Default is 5001.
	 *  password = Password. Can be NULL if the server is running unsecured.
	 */
	int function(CPhidgetManagerHandle phidm, const char* address, int port, const char* password) CPhidgetManager_openRemoteIP;

}