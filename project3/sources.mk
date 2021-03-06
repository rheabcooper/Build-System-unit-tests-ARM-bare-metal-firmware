#####################################################
#													
#	@file sources.mk								
#	@brief A source file for the build of project 2	
#													
#	This file was all developed by Brian Kelly.						
#									 				
# 	@author Brian Kelly								
#	@date September 24, 2017						
#													
#####################################################

# Set up the location for the project directory
MYDIR = /home/brian/repos/BMK-ecen5813-project1

# login info for the BeagleBone Black
BBB_ROOT = root@192.168.240.31
BBB_USER = debian@192.168.240.31
BBB_USB_ROOT = root@192.168.7.2
BBB_USB_USER = debian@192.168.7.2

#File Paths on the BeagleBone Black
BBB_USER_DIR = /home/debian
BBB_USER_BIN = $(BBB_USER_DIR)/bin

# Project Master or Top Level Directory
PROJ_DIR 		= $(MYDIR)/project3

# Subdirectories under the Master Directory
INC_DIR 		= $(PROJ_DIR)/include
LIB_DIR 		= $(PROJ_DIR)/lib
PLATFORM_DIR 	= $(PROJ_DIR)/platform
SRC_DIR 		= $(PROJ_DIR)/src
OBJ_DIR			= $(PROJ_DIR)/obj
DEP_DIR			= $(PROJ_DIR)/dep
TEST_DIR		= $(PROJ_DIR)/test
THIRD_PARTY_DIR = $(PROJ_DIR)/3rd-party

# Source Directory
MAIN_SRC 		= $(SRC_DIR)/main.c
CONV_SRC		= $(SRC_DIR)/conversion.c
DEBUG_SRC		= $(SRC_DIR)/debug.c
MEMORY_SRC		= $(SRC_DIR)/memory.c
PROJ1_SRC		= $(SRC_DIR)/project1.c
REVERSE_SRC		= $(SRC_DIR)/reverse.c
CIRBUF_SRC		= $(SRC_DIR)/cirbuf.c
UART_SRC		= $(SRC_DIR)/uart.c
PROJ2_SRC		= $(SRC_DIR)/project2.c
KL25Z_SYS_SRC	= $(SRC_DIR)/system_MKL25Z4.c
KL25Z_SUP_SRC	= $(SRC_DIR)/startup_MKL25Z4.S
PROJ3_SRC		= $(SRC_DIR)/project3.c
GPIO_SRC		= $(SRC_DIR)/gpio.c
SPI_SRC			= $(SRC_DIR)/spi.c
NORDIC_SRC		= $(SRC_DIR)/nordic.c
DMA_SRC			= $(SRC_DIR)/dma.c
LOGGER_SRC		= $(SRC_DIR)/logger.c
LOG_QUEUE_SRC	= $(SRC_DIR)/logger_queue.c
PROFILE_SRC		= $(SRC_DIR)/profiling.c
RTC_SRC			= $(SRC_DIR)/rtc.c

# Include Directory
INC_CMN_DIR 	= $(INC_DIR)/common
CMN_INC			= $(INC_CMN_DIR)/common.h
CONV_INC	 	= $(INC_CMN_DIR)/conversion.h
DEBUG_INC 		= $(INC_CMN_DIR)/debug.h
MEMORY_INC 		= $(INC_CMN_DIR)/memory.h
PLATFORM_INC	= $(INC_CMN_DIR)/platform.h
PROJ1_INC		= $(INC_CMN_DIR)/project1.h
REVERSE_INC		= $(INC_CMN_DIR)/reverse.h
CIRBUF_INC		= $(INC_CMN_DIR)/cirbuf.h
PROJ2_INC		= $(INC_CMN_DIR)/project2.h
PROJ3_INC		= $(INC_CMN_DIR)/project3.h
LOGGER_INC		= $(INC_CMN_DIR)/logger.h
LOG_QUEUE_INC	= $(INC_CMN_DIR)/logger_queue.h
PROFILE_INC		= $(INC_CMN_DIR)/profiling.h	

INC_CMSIS_DIR	= $(INC_DIR)/CMSIS
CM0PLUS_INC		= $(INC_CMSIS_DIR)/core_cm0plus.h
CM4_INC			= $(INC_CMSIS_DIR)/core_cm4.h
CM4_SIMD_INC	= $(INC_CMSIS_DIR)/core_cm4_simd.h
CMFUNC_INC		= $(INC_CMSIS_DIR)/core_cmFunc.h
CMINSTR_INC		= $(INC_DMSIS_DIR)/core_cmInstr.h

INC_KL25Z_DIR	= $(INC_DIR)/kl25z
KL25Z_INC		= $(INC_KL25Z_DIR)/MKL25Z4.h
SYS_KL25Z_INC	= $(INC_KL25Z_DIR)/system_MKL25Z4.h
UART_INC		= $(INC_KL25Z_DIR)/uart.h
GPIO_INC		= $(INC_KL25Z_DIR)/gpio.h
SPI_INC			= $(INC_KL25Z_DIR)/spi.h
NORDIC_INC		= $(INC_KL25Z_DIR)/nordic.h
DMA_INC			= $(INC_KL25Z_DIR)/dma.h
RTC_INC			= $(INC_KL25Z_DIR)/rtc.h

# Platform Directory
KL25Z_LD		= $(PLATFORM_DIR)/MKL25Z128xxx4_flash.ld

# Test Directory
CONV_TEST		= $(TEST_DIR)/conversion_test.c
MEM_TEST		= $(TEST_DIR)/memory_test.c
CIRBUF_TEST		= $(TEST_DIR)/cirbuf_test.c

# Test Object files
CONV_TEST_OBJ	= $(TEST_DIR)/conversion_test.o
MEM_TEST_OBJ	= $(TEST_DIR)/memory_test.o
CIRBUF_TEST_OBJ	= $(TEST_DIR)/cirbuf_test.o

# Test Output executables
CONV_TEST_EXE   = conv_test.out
MEM_TEST_EXE    = mem_test.out
CIRBUF_TEST_EXE = cirbuf_test.out

# Third Party Directory
CMOCKA_INCLUDE_DIR	= $(THIRD_PARTY_DIR)/build-Debug/include
CMOCKA_LIBRARY		= $(THIRD_PARTY_DIR)/build-Debug/lib/libcmocka.a
CMOCKA_BUILD_DIR	= $(THIRD_PARTY_DIR)/build-Debug		
