USE_CAMERA_STUB := true

LOCAL_PATH := device/samsung/grandprimevelte

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# inherit from the proprietary version
-include vendor/samsung/grandprimevelte/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := mrvl
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := grandprimevelte

TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := \
	--ramdisk_offset 0x01000000 \
	--pagesize 2048 \
	--board MRVL
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.7/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 16384
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16384
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1887232
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun0/file"
BOARD_USES_MMCUTILS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_MISC_PARTITION := true

TARGET_PREBUILT_KERNEL := device/samsung/grandprimevelte/kernel

BOARD_HAS_NO_SELECT_BUTTON := true

# build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# Assert
TARGET_OTA_ASSERT_DEVICE := grandprimevelte,grandprimeveltexx,g531f

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MRVL := true
MRVL_WIRELESS_DAEMON_API := true
USE_BLUETOOTH_SAP := false

# Flags (removed, shifted to vendor files. INCLUDE_MARVELL_FLAGS present in vendor )
INCLUDE_MARVELL_FLAGS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# MRVL hardware
BOARD_USES_MRVL_HARDWARE := true

# Recovery_Files
LZMA_RAMDISK_TARGETS := recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.pxa1908
RECOVERY_FSTAB_VERSION := 2
BOARD_RECOVERY_SWIPE := true
#TARGET_RECOVERY_DEVICE_DIRS += $(LOCAL_PATH)
#TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/rootdir/init.pxa1908.rc

# Display
VSYNC_EVENT_PHASE_OFFSET_NS := 0
BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_USE_BGRA_8888 := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
#COMMON_GLOBAL_FLAGS += -DSK_SUPPORT_LEGACY_SETCONFIG
BOARD_ENABLE_MULTI_DISPLAYS := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_ENABLE_SUSPEND := true
CHARGING_ENABLED_PATH := "/sys/class/power_supply/battery/batt_lp_charging"
BOARD_NO_CHARGER_LED := false
BOARD_CHARGING_MODE_BOOTING_LPM := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += $(LOCAL_PATH)/cmhw

# Wifi
BOARD_WLAN_VENDOR := MRVL
MRVL_WIRELESS_DAEMON_API := true
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/sd8xxx/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/mrvl/sd8777_uapsta.bin"
CONFIG_CTRL_IFACE := true
MRVL_WIRELESS_DAEMON_API := true

# GPS (To be added later)
#BOARD_GPS_LIBRARIES := true
#BOARD_MRVL_USES_GPS := true

# system.prop
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Camera
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_TS_MAKEUP := true

# Boot Animation
TARGET_BOOTANIMATION_USE_RGB565 := true

# Webkit
ENABLE_WEBGL := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NEEDS_CUTILS_LOG := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_USES_HWCOMPOSER := true
#TARGET_FORCE_CPU_UPLOAD := true

# TWRP
TARGET_RECOVERY_FSTAB := device/samsung/grandprimevelte/rootdir/etc/recovery.fstab
RECOVERY_VARIANT := twrp
TW_THEME := portrait_mdpi
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_EXCLUDE_SUPERSU := true
#TW_EXCLUDE_MTP := true
TW_MTP_DEVICE := /dev/usb_mtp_gadget
TW_EXCLUDE_DEFAULT_USB_INIT := true
RECOVERY_FSTAB_VERSION := 2
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_CRYPTO := true
TW_BRIGHTNESS_PATH := "sys/devices/platform/ktd2801-bl.24/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 137
TW_EXTRA_LANGUAGES := true
HAVE_SELINUX := true

#Generic config
MRVL_ION := true

BOARD_USE_VIVANTE_GRALLOC := true
HDMI_SUPPORT_3D := true

#BOARD_GFX_DRIVER_VERSION=4x

#Enable marvell interface in SurfaceFlinger
MRVL_INTERFACE_ANIMATION := true
#ENABLE_HWC_GC_PATH := true

#Launch DMS in SurfaceFlinger process
MRVL_LAUNCH_DMS_IN_SURFACEFLINGER := true

TARGET_FORCE_CPU_UPLOAD := true


# Sec_touchscreen
INPUT_TOUCH_DRIVER := TOUCH_LT

# Compatibility with pre-kitkat Sensor HALs
SENSORS_NEED_SETRATE_ON_ENABLE := true

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true



# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Malloc
MALLOC_SVELTE := true

# bootcharting
INIT_BOOTCHART := true

# MRVL
BOARD_USES_MARVELL_HWC_ENHANCEMENT := true
#COMMON_GLOBAL_CFLAGS += -DMARVELL_HWC_ENHANCEMENT



#Hack for prebuilt kernel
ifeq ($(TARGET_DEVICE), grandprimevelte)
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
$(shell touch $(OUT)/obj/KERNEL_OBJ/usr/export_includes)
endif
