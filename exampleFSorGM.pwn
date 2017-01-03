//Example for using script_compatiblity.inc

#include <a_samp>
#include <script_compatiblity>


//No need to check for defines!
//You can also run this as a gamemode without using main()

public OnScriptInit() {

	printf("Running as : %s", (GetInitMode() == SCRIPT_MODE_FS) ? ("FS") : ("GM"));

	//Hooking is necessary in case if this is an include.
	#if defined yourLIB_OnIncInit
	    return yourLIB_OnIncInit();
	#else
		return 1;
	#endif
}

public OnScriptExit() {

	printf("Exiting as : %s", (GetInitMode() == SCRIPT_MODE_FS) ? ("FS") : ("GM"));

	//Hooking is necessary if this is an include.
	#if defined yourLIB_OnIncExit
	    return yourLIB_OnIncExit();
	#else
	    return 1;
	#endif
}

#if defined _ALS_OnScriptInit
	#undef OnScriptInit
#else
	#define _ALS_OnScriptInit
#endif

#if defined _ALS_OnScriptExit
	#undef OnScriptExit
#else
	#define _ALS_OnScriptExit
#endif

#define OnScriptInit yourLIB_OnIncInit
#define OnScriptExit yourLIB_OnIncExit

#if defined yourLIB_OnIncInit
	forward yourLIB_OnIncInit();
#endif

#if defined yourLIB_OnIncExit
	forward yourLIB_OnIncExit();
#endif

