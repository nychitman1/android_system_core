ifneq ($(BUILD_TINY_ANDROID),true)

LOCAL_PATH:= $(call my-dir)

common_src_files :=                           \
                  src/SocketListener.cpp      \
                  src/FrameworkListener.cpp   \
                  src/NetlinkListener.cpp     \
                  src/NetlinkEvent.cpp        \
                  src/FrameworkCommand.cpp    \
                  src/SocketClient.cpp        \
                  src/ServiceManager.cpp      \
                  EventLogTags.logtags


include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(common_src_files)
LOCAL_MODULE:= libsysutils

ifneq ($(TARGET_ARCH),arm64)
LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
else
LOCAL_C_INCLUDES :=
endif

LOCAL_CFLAGS := -Werror
LOCAL_SHARED_LIBRARIES := libcutils liblog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(common_src_files)
LOCAL_MODULE:= libsysutils

ifneq ($(TARGET_ARCH),arm64)
LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
else
LOCAL_C_INCLUDES :=
endif

LOCAL_CFLAGS := -Werror
include $(BUILD_STATIC_LIBRARY)

endif
