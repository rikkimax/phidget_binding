module examples.HelloWorld;
import phidget21;
import std.stdio : writeln, writefln, readln;
import std.string : toStringz, fromStringz;

extern(C)
int AttachHandler(CPhidgetHandle device, void* userPtr) {
	int serialNumber;
	const char* name;

	LocalErrorCatcher(CPhidget_getDeviceName(device, &name));
	LocalErrorCatcher(CPhidget_getSerialNumber(device, &serialNumber));

	writefln("Hello Device %s, Serial Number: %d", name.fromStringz, serialNumber);

	return 0;
}

extern(C)
int DetachHandler(CPhidgetHandle device, void* userPtr) {
	int serialNumber;
	const char* name;

	LocalErrorCatcher(CPhidget_getDeviceName(device, &name));
	LocalErrorCatcher(CPhidget_getSerialNumber(device, &serialNumber));

	writefln("Goodbye Device %s, Serial Number: %d", name.fromStringz, serialNumber);
	return 0;
}

// When using an error handler with the manager, it takes a
// CPhidgetManagerHandle, when using an individual object, the
// object serves as its own handle.
extern(C)
int LibraryErrorHandler(CPhidgetManagerHandle device, void* userPtr, int errorCode, const char* errorDescription) {
	writeln("Error Event: %d - %s", errorCode, errorDescription);
	return 0;
}

// This error handler can handle any CPhidget function that returns an int
extern(C)
int LocalErrorCatcher(int errorCode) {
	const char* errorDescription;

	// If the error code is 0, everything is okay
	if (errorCode != 0) {
		// Otherwise, you can print specific messages or perform actions by error value.

		switch(errorCode) {
			default:
				writefln("Error: An error occurred with code %d.", errorCode);
				LocalErrorCatcher(CPhidget_getErrorDescription(errorCode, &errorDescription));
				writefln("The description for this error is %s", errorDescription.fromStringz);
				break;
		}
	}

	return 0;
}

void main() {
	Phidget.load();

	int result;
	const char* err;

	CPhidgetManagerHandle device;
	LocalErrorCatcher(CPhidgetManager_create(&device));

	LocalErrorCatcher(CPhidgetManager_set_OnAttach_Handler(device, &AttachHandler, null));
	LocalErrorCatcher(CPhidgetManager_set_OnDetach_Handler(device, &DetachHandler, null));
	LocalErrorCatcher(CPhidgetManager_set_OnError_Handler(device, &LibraryErrorHandler, null));

	writeln("Opening...");
	// Most opening and closing would be via a cast to
	// (CPhidgetHandle), however, this manager has its
	// own handle struct to cast to.
	LocalErrorCatcher(CPhidgetManager_open(device));

	writeln("Phidget Simple Playground (plug and unplug devices)");
	writeln("Press Enter to end anytime...");
	readln();

	writeln("Closing...");
	LocalErrorCatcher(CPhidgetManager_close(device));
	LocalErrorCatcher(CPhidgetManager_delete(device));
}