LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := main
LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES := main.cpp
LOCAL_CPPFLAGS	:= -DARM -DOS_LNX -DARCH_32 -fexceptions
LOCAL_CPPFLAGS	+= -I$(LOCAL_PATH)/include
LOCAL_CPPFLAGS 	+= -fexceptions
#LOCAL_CPPFLAGS 	+= -fno-stack-protector -z execstack 
#LOCAL_LDLIBS := -ljnigraphics -llog $(LOCAL_PATH)/libs/libOpenCL.so
include $(BUILD_EXECUTABLE)
