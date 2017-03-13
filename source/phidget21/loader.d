module phidget21.loader;
import derelict.util.loader;

class PhidgetLoader : SharedLibLoader {
	this() {
		super("phidget21.dll,phidget21.so");
	}

	override void loadSymbols() {
		static import phidcommon = phidget21.phidcommon;
		static import phiddict = phidget21.phiddict;
		static import phidlog = phidget21.phidlog;
		static import phidmanager = phidget21.phidmanager;

		loadSymbolsImport!phidcommon();
		loadSymbolsImport!phiddict();
		loadSymbolsImport!phidlog();
		loadSymbolsImport!phidmanager();

		static import phidifkit = phidget21.phidgets.phidifkit;
		loadSymbolsImport!phidifkit();
	}

	private {
		void loadSymbolsImport(alias mod)() {
			import std.traits : isFunctionPointer;

			foreach(m; __traits(allMembers, mod)) {
				static if (__traits(compiles, typeof(__traits(getMember, mod, m)))) {
					alias Type = typeof(__traits(getMember, mod, m));

					static if (isFunctionPointer!(typeof(__traits(getMember, mod, m)))) {
						mixin("mod." ~ m ~ " = cast(Type)loadSymbol(m);");
					}
				}
			}
		}
	}
}

__gshared PhidgetLoader Phidget;

shared static this() {
	Phidget = new PhidgetLoader;
}