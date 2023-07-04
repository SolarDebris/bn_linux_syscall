#include <binaryninjaapi.h>
#include "linuxsyscall.h"

extern "C" {

BN_DECLARE_CORE_ABI_VERSION

BINARYNINJAPLUGIN bool CorePluginInit()
{
	BinaryNinja::LogInfo("Linux Syscall Loaded Successfully");
	return true;
}

/* */
}
