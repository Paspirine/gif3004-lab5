# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/paspirine/projet/laboratoire5/rpi

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/paspirine/projet/laboratoire5/rpi/build

# Include any dependencies generated for this target.
include CMakeFiles/tp5client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tp5client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tp5client.dir/flags.make

CMakeFiles/tp5client.dir/tp5client.c.o: CMakeFiles/tp5client.dir/flags.make
CMakeFiles/tp5client.dir/tp5client.c.o: ../tp5client.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/paspirine/projet/laboratoire5/rpi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/tp5client.dir/tp5client.c.o"
	/home/paspirine/arm-cross-comp-env/arm-raspbian-linux-gnueabihf/bin/arm-raspbian-linux-gnueabihf-gcc --sysroot=/home/paspirine/arm-cross-comp-env/arm-raspbian-linux-gnueabihf/arm-raspbian-linux-gnueabihf/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tp5client.dir/tp5client.c.o   -c /home/paspirine/projet/laboratoire5/rpi/tp5client.c

CMakeFiles/tp5client.dir/tp5client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tp5client.dir/tp5client.c.i"
	/home/paspirine/arm-cross-comp-env/arm-raspbian-linux-gnueabihf/bin/arm-raspbian-linux-gnueabihf-gcc --sysroot=/home/paspirine/arm-cross-comp-env/arm-raspbian-linux-gnueabihf/arm-raspbian-linux-gnueabihf/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/paspirine/projet/laboratoire5/rpi/tp5client.c > CMakeFiles/tp5client.dir/tp5client.c.i

CMakeFiles/tp5client.dir/tp5client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tp5client.dir/tp5client.c.s"
	/home/paspirine/arm-cross-comp-env/arm-raspbian-linux-gnueabihf/bin/arm-raspbian-linux-gnueabihf-gcc --sysroot=/home/paspirine/arm-cross-comp-env/arm-raspbian-linux-gnueabihf/arm-raspbian-linux-gnueabihf/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/paspirine/projet/laboratoire5/rpi/tp5client.c -o CMakeFiles/tp5client.dir/tp5client.c.s

# Object files for target tp5client
tp5client_OBJECTS = \
"CMakeFiles/tp5client.dir/tp5client.c.o"

# External object files for target tp5client
tp5client_EXTERNAL_OBJECTS =

tp5client: CMakeFiles/tp5client.dir/tp5client.c.o
tp5client: CMakeFiles/tp5client.dir/build.make
tp5client: CMakeFiles/tp5client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/paspirine/projet/laboratoire5/rpi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable tp5client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tp5client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tp5client.dir/build: tp5client

.PHONY : CMakeFiles/tp5client.dir/build

CMakeFiles/tp5client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tp5client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tp5client.dir/clean

CMakeFiles/tp5client.dir/depend:
	cd /home/paspirine/projet/laboratoire5/rpi/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/paspirine/projet/laboratoire5/rpi /home/paspirine/projet/laboratoire5/rpi /home/paspirine/projet/laboratoire5/rpi/build /home/paspirine/projet/laboratoire5/rpi/build /home/paspirine/projet/laboratoire5/rpi/build/CMakeFiles/tp5client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tp5client.dir/depend
