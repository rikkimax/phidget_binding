module examples.InterfaceKit_Simple;
import phidget21;
import std.stdio : write, writeln, writefln, readln;
import std.string : toStringz, fromStringz;

extern(C)
int AttachHandler(CPhidgetHandle IFK, void* userptr) {
	int serialNo;
	const char* name;
	
	CPhidget_getDeviceName(IFK, &name);
	CPhidget_getSerialNumber(IFK, &serialNo);
	
	writefln("%s %10d attached!", name.fromStringz, serialNo);
	
	return 0;
}

extern(C)
int DetachHandler(CPhidgetHandle IFK, void* userptr) {
	int serialNo;
	const char* name;
	
	CPhidget_getDeviceName(IFK, &name);
	CPhidget_getSerialNumber(IFK, &serialNo);
	
	writefln("%s %10d detached!", name.fromStringz, serialNo);

	return 0;
}

extern(C)
int ErrorHandler(CPhidgetHandle IFK, void* userptr, int ErrorCode, const char* unknown)
{
	writefln("Error handled. %d - %s", ErrorCode, unknown.fromStringz);
	return 0;
}

extern(C)
int InputChangeHandler(CPhidgetInterfaceKitHandle IFK, void* usrptr, int Index, int State) {
	writefln("Digital Input %d > State: %d", Index, State);
	return 0;
}

extern(C)
int OutputChangeHandler(CPhidgetInterfaceKitHandle IFK, void* usrptr, int Index, int State) {
	writefln("Digital Output %d > State: %d", Index, State);
	return 0;
}

extern(C)
int SensorChangeHandler(CPhidgetInterfaceKitHandle IFK, void* usrptr, int Index, int Value) {
	writefln("Sensor: %d > Value: %d", Index, Value);
	return 0;
}

extern(C)
int display_property(CPhidgetInterfaceKitHandle phid) {
	int serialNo, version_, numInputs, numOutputs, numSensors, triggerVal, ratiometric;
	const char* ptr;

	CPhidget_getDeviceType(cast(CPhidgetHandle)phid, &ptr);
	CPhidget_getSerialNumber(cast(CPhidgetHandle)phid, &serialNo);
	CPhidget_getDeviceVersion(cast(CPhidgetHandle)phid, &version_);

	CPhidgetInterfaceKit_getInputCount(phid, &numInputs);
	CPhidgetInterfaceKit_getOutputCount(phid, &numOutputs);
	CPhidgetInterfaceKit_getSensorCount(phid, &numSensors);
	CPhidgetInterfaceKit_getRatiometric(phid, &ratiometric);

	writeln(ptr.fromStringz);

	writefln("Serial Number: %10d", serialNo);
	writefln("Version %8d", version_);

	writefln("# Digital Inputs: %d", numInputs);
	writefln("# Digital Outputs: %d", numOutputs);

	writefln("# Sensors: %d", numSensors);
	writefln("Ratiometric: %d", ratiometric);

	foreach(i; 0 .. numSensors) {
		CPhidgetInterfaceKit_getSensorChangeTrigger(phid, i, &triggerVal);
		writefln("Sensor#: %d > Sensitivity Trigger: %d", i, triggerVal);
	}

	return 0;
}

int interfacekit_simple() {
	Phidget.load();

	int result, numSensors;
	const char* err;

	CPhidgetInterfaceKitHandle ifKit;
	CPhidgetInterfaceKit_create(&ifKit);

	CPhidget_set_OnAttach_Handler(cast(CPhidgetHandle)ifKit, &AttachHandler, null);
	CPhidget_set_OnDetach_Handler(cast(CPhidgetHandle)ifKit, &DetachHandler, null);
	CPhidget_set_OnError_Handler(cast(CPhidgetHandle)ifKit, &ErrorHandler, null);

	CPhidgetInterfaceKit_set_OnInputChange_Handler(ifKit, &InputChangeHandler, null);

	CPhidgetInterfaceKit_set_OnSensorChange_Handler(ifKit, &SensorChangeHandler, null);

	CPhidgetInterfaceKit_set_OnOutputChange_Handler(ifKit, &OutputChangeHandler, null);

	CPhidget_open(cast(CPhidgetHandle)ifKit, -1);

	write("Waiting for interface kit to be attached....");
	if((result = CPhidget_waitForAttachment(cast(CPhidgetHandle)ifKit, 10000)) != 0) {
		CPhidget_getErrorDescription(result, &err);
		writefln("Problem waiting for attachment: %s", err.fromStringz);
		return 0;
	}

	display_property(ifKit);

	writeln("Reading.....");
	writeln("Press any key to go to next step");
	readln;

	writeln("Modifying sensor sensitivity triggers....");

	CPhidgetInterfaceKit_getSensorCount(ifKit, &numSensors);

	foreach(i; 0 .. numSensors) {
		CPhidgetInterfaceKit_setSensorChangeTrigger(ifKit, i, 100); 
	}

	writeln("Reading.....");

	writeln("Press any key to go to next step");
	readln;

	writeln("Toggling Ratiometric....");

	CPhidgetInterfaceKit_setRatiometric(ifKit, 0);

	writeln("Reading.....");

	writeln("Press any key to end");
	readln;

	writeln("Closing...");
	CPhidget_close(cast(CPhidgetHandle)ifKit);
	CPhidget_delete(cast(CPhidgetHandle)ifKit);

	return 0;
}

void main() {
	interfacekit_simple();
}