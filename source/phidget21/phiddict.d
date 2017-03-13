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
module phidget21.phiddict;

extern(C) __gshared {
	enum CPhidgetDictionary_keyChangeReason {
		PHIDGET_DICTIONARY_VALUE_CHANGED = 1, /**< The value of an existing key/value pair changed. */
		PHIDGET_DICTIONARY_ENTRY_ADDED, /**< A new key/value pair was added. */
		PHIDGET_DICTIONARY_ENTRY_REMOVING, /**< A key is being removed. */
		PHIDGET_DICTIONARY_CURRENT_VALUE /**< Initial state received once a handler was added. */
	}
	
	/**
	 * A Phidget Dictionary handle.
	 */
	struct _CPhidgetDictionary;
	alias CPhidgetDictionaryHandle = _CPhidgetDictionary*;
	
	/**
	 * A Dictionary key listener handle.
	 */
	struct _CPhidgetDictionaryListener;
	alias CPhidgetDictionaryListenerHandle = _CPhidgetDictionaryListener*;
	
	/**
	 * Creates a Phidget Dictionary handle.
	 *
	 * Params:
	 *  dict = A pointer to an unallocated phidget dictionary handle.
	 */
	int function(CPhidgetDictionaryHandle* dict) CPhidgetDictionary_create;

	/**
	 * Closes the connection to a Phidget Dictionary.
	 * 
	 * Params:
	 *  dict = An opened phidget dictionary handle.   
	 */
	int function(CPhidgetDictionaryHandle dict) CPhidgetDictionary_close;

	/**
	 * Frees a Phidget Dictionary handle.
	 * 
	 * Params:
	 *  A closed Dictionary handle.
	 */
	int function(CPhidgetDictionaryHandle dict) CPhidgetDictionary_delete;

	alias CPhidgetDictionary_set_OnError_Handler_Func = extern(C) int function(CPhidgetDictionaryHandle, void* userPtr, int errorCode, const char* errorString);
	/**
	 * Sets the error handler callback function. This is called when an asyncrhonous error occurs.
	 * 
	 * Params:
	 *  dict = A phidget dictionary handle.
	 *  fptr = Callback function pointer.
	 *  userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetDictionaryHandle dict, CPhidgetDictionary_set_OnError_Handler_Func fptr, void* userPtr) CPhidgetDictionary_set_OnError_Handler;

	/**
	 * Adds a key/value pair to the dictionary. Or, changes an existing key's value.
	 * 
	 * Params:
	 *  dict = A connected dictionary handle.
	 *  key = The key value.
	 *  value = The value value.
	 *  persistent = Whether the key stays in the dictionary after disconnection.
	 */
	int function(CPhidgetDictionaryHandle dict, const char* key, const char* value, int persistent) CPhidgetDictionary_addKey;

	/**
	 * Removes a set of keys from the dictionary.
	 * 
	 * Params:
	 *  dict = A connected dictionary handle.
	 *  pattern = A regular expression representing the set of keys to remove.
	 */
	int function(CPhidgetDictionaryHandle dict, const char* pattern) CPhidgetDictionary_removeKey;


	/**
	 * Callback function for KeyChange events.
	 * 
	 * Params:
	 *  dict = Dictionary from which this event originated.
	 *  userPtr = User defined data.
	 *  value = Value value.
	 *  reason = Reason for KeyChange event.
	 */
	alias CPhidgetDictionary_OnKeyChange_Function = extern(C) int function(CPhidgetDictionaryHandle dict, void* userPtr, const char* key, const char* value, CPhidgetDictionary_keyChangeReason reason);

	/**
	 * Adds a key listener to an opened dictionary. Note that this should only be called afrter the connection to the
	 * dictionary has been made - unlike all other events.
	 * 
	 * Params:
	 *  dict = A connected dictionary handle.
	 *  dictlistener = A pointer to an unallocated dictionary key listener handle.
	 *  pattern = A regular expression representing the set of keys to monitor.
	 *  fptr = Callback function pointer.
	 *  userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetDictionaryHandle dict, CPhidgetDictionaryListenerHandle* dictlistener, const char* pattern, CPhidgetDictionary_OnKeyChange_Function fptr, void* userPtr) CPhidgetDictionary_set_OnKeyChange_Handler;

	/**
	 * Removes a key listener.
	 * 
	 * Params:
	 *  dictlistener = The dictionary key listener created by CPhidgetDictionary_set_OnKeyChange_Handler
	 */
	int function(CPhidgetDictionaryListenerHandle dictlistener) CPhidgetDictionary_remove_OnKeyChange_Handler;

	/**
	 * Gets a key value. If more then one key matches, only the first value is returned.
	 * 
	 * Params:
	 *  dict = A phidget dictionary handle.
	 *  key = A key value to look up.
	 *  value = A user array for the value to be stored in. Set to null if the key does not exist.
	 *  valuelen = Length of the value array.
	 */
	int function(CPhidgetDictionaryHandle dict, const char* key, char* value, int valuelen) CPhidgetDictionary_getKey;

	alias CPhidgetDictionary_set_OnServerConnect_Handler_Func = extern(C) int function(CPhidgetDictionaryHandle dict, void* userPtr);
	/**
	 * Sets a server connect handler callback function. This is called when a connection to the server has been made.
	 * 
	 * Params:
	 *  dict = A phidget dictionary handle.
	 *  fptr = Callback function pointer.
	 *  userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetDictionaryHandle dict, CPhidgetDictionary_set_OnServerConnect_Handler_Func fptr, void* userPtr) CPhidgetDictionary_set_OnServerConnect_Handler;

	alias CPhidgetDictionary_set_OnServerDisconnect_Handler_Func = extern(C) int function(CPhidgetDictionaryHandle dict, void* userPtr);
	/**
	 * Sets a server disconnect handler callback function. This is called when a connection to the server has been lost.
	 * 
	 * Params:
	 *  dict = A phidget dictionary handle.
	 *  fptr = Callback function pointer.
	 *  userPtr = A pointer for use by the user - this value is passed back into the callback function.
	 */
	int function(CPhidgetDictionaryHandle dict, CPhidgetDictionary_set_OnServerDisconnect_Handler_Func fptr, void* userPtr) CPhidgetDictionary_set_OnServerDisconnect_Handler;

	/**
	 * Gets the server ID.
	 * 
	 * Params:
	 *  dict = A connected dictionary handle.
	 *  serverID = A pointer which will be set to a char array containing the server ID string.
	 */
	int function(CPhidgetDictionaryHandle dict, const char** serverID) CPhidgetDictionary_getServerID;

	/**
	 * Gets the address and port.
	 * 
	 * Params:
	 *  dict = A connected dictionary handle.
	 *  address = A pointer which will be set to a char array containing the address string.
	 *  port = An int pointer for returning the port number.
	 */
	int function(CPhidgetDictionaryHandle dict, const char** address, int* port) CPhidgetDictionary_getServerAddress;

	/**
	 * Gets the connected to server status.
	 * 
	 * Params:
	 *  dict = An opened dictionary handle. 
	 *  serverStatus = An int pointer for returning the server status. Possible codes are PHIDGET_ATTACHED and PHIDGET_NOTATTACHED.
	 */
	int function(CPhidgetDictionaryHandle dict, int* serverStatus) CPhidgetDictionary_getServerStatus;

	/**
	 * Opens a Phidget dictionary by ServerID. Note that this requires Bonjour (mDNS) to be running on both the host and the server.
	 * 
	 * Params:
	 *  dict = A phidget dictionary handle.
	 *  serverID = ServerID. Specify NULL to open any.
	 *  password = Password. Can be NULL if the server is running unsecured.
	 */
	int function(CPhidgetDictionaryHandle dict, const char* serverID, const char* password) CPhidgetDictionary_openRemote;

	/**
	 * Opens a Phidget dictionary by address and port.
	 * 
	 * Params:
	 *  dict = A phidget dictionary handle.
	 *  address = Address. This can be a hostname or IP address.
	 *  port = Port number. Default is 5001.
	 *  password = Password. Can be NULL if the server is running unsecured.
	 */
	int function(CPhidgetDictionaryHandle dict, const char* address, int port, const char* password) CPhidgetDictionary_openRemoteIP;
}