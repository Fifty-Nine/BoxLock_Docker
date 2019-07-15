# Path to the root directory of the Atmel XDK.
CMSIS_INSTALL_PATH:=/root/pkg/CMSIS_5-5.6.0

# Path to the device family pack for the
# target MCU.
DFP_INSTALL_PATH:=/root/pkg/samd21-dfp/samd21a

# Path to the target system root directory.
SYSROOT:=/usr/lib

FREERTOS_INSTALL_PATH:=/root/pkg/FreeRTOSv9.0.0

# Board revision * 100
BOARD_REV=101

# Definitions of the various binaries used to build and
# run the target.
CC:=arm-none-eabi-gcc
CXX:=arm-none-eabi-g++
LD:=arm-none-eabi-g++
GDB:=arm-none-eabi-gdb

# Add flags common to C and C++ here.
COMMON_FLAGS+= \
	-O3 -flto

# Add C-specific flags here.
CFLAGS+= \

# Add C++-specific flags here
CXXFLAGS+= \

# Add linker flags here
LDFLAGS+= \
	-specs=nosys.specs \
	 -Wl,--print-memory-usage \

