# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2021.2.1\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2021.2.1\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\bsu\labaOSthreads

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\bsu\labaOSthreads\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/labaOSthreads.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/labaOSthreads.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/labaOSthreads.dir/flags.make

CMakeFiles/labaOSthreads.dir/windowsversion.cpp.obj: CMakeFiles/labaOSthreads.dir/flags.make
CMakeFiles/labaOSthreads.dir/windowsversion.cpp.obj: ../windowsversion.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\bsu\labaOSthreads\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/labaOSthreads.dir/windowsversion.cpp.obj"
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles\labaOSthreads.dir\windowsversion.cpp.obj -c D:\bsu\labaOSthreads\windowsversion.cpp

CMakeFiles/labaOSthreads.dir/windowsversion.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/labaOSthreads.dir/windowsversion.cpp.i"
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\bsu\labaOSthreads\windowsversion.cpp > CMakeFiles\labaOSthreads.dir\windowsversion.cpp.i

CMakeFiles/labaOSthreads.dir/windowsversion.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/labaOSthreads.dir/windowsversion.cpp.s"
	C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\bsu\labaOSthreads\windowsversion.cpp -o CMakeFiles\labaOSthreads.dir\windowsversion.cpp.s

# Object files for target labaOSthreads
labaOSthreads_OBJECTS = \
"CMakeFiles/labaOSthreads.dir/windowsversion.cpp.obj"

# External object files for target labaOSthreads
labaOSthreads_EXTERNAL_OBJECTS =

labaOSthreads.exe: CMakeFiles/labaOSthreads.dir/windowsversion.cpp.obj
labaOSthreads.exe: CMakeFiles/labaOSthreads.dir/build.make
labaOSthreads.exe: CMakeFiles/labaOSthreads.dir/linklibs.rsp
labaOSthreads.exe: CMakeFiles/labaOSthreads.dir/objects1.rsp
labaOSthreads.exe: CMakeFiles/labaOSthreads.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\bsu\labaOSthreads\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable labaOSthreads.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\labaOSthreads.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/labaOSthreads.dir/build: labaOSthreads.exe
.PHONY : CMakeFiles/labaOSthreads.dir/build

CMakeFiles/labaOSthreads.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\labaOSthreads.dir\cmake_clean.cmake
.PHONY : CMakeFiles/labaOSthreads.dir/clean

CMakeFiles/labaOSthreads.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\bsu\labaOSthreads D:\bsu\labaOSthreads D:\bsu\labaOSthreads\cmake-build-debug D:\bsu\labaOSthreads\cmake-build-debug D:\bsu\labaOSthreads\cmake-build-debug\CMakeFiles\labaOSthreads.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/labaOSthreads.dir/depend

