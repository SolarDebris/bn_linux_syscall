cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

project(bn_linux_syscall)

# Create plugin library target
add_library(bn_linux_syscall SHARED src/plugin.cpp src/types.cpp src/types.h src/annotate.cpp src/annotate.h src/info.cpp src/info.h)
target_compile_features(bn_linux_syscall PRIVATE cxx_std_17 c_std_99)
target_link_libraries(bn_linux_syscall PRIVATE binaryninjaapi)

# Plugins need to compile with `-fPIC` on Linux
if(${CMAKE_SYSTEM_NAME} STREQUAL "LINUX")
	target_compile_options(bn_linux_syscall PRIVATE "-fPIC")
endif()

# Add vendored API dependency if enabled
option(BN_VENDOR_API "Use the Binary Ninja API submodule" ON)
if(BN_VENDOR_API)
	add_subdirectory(vendor/api)

	# Auto-configure an `install` target
	bn_install_plugin(bn_linux_syscall)
endif()

