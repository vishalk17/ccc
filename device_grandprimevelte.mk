$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/grandprimevelte/grandprimevelte-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/grandprimevelte/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/grandprimevelte/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_grandprimevelte
PRODUCT_DEVICE := grandprimevelte

LOCAL_PATH := device/samsung/grandprimevelte

# Screen Density Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREBUILT_DPI := large xxxhdpi xxhdpi xhdpi hdpi ldpi mdpi hdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

# default.prop
DEFAULT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240 \
	ro.wifi.active_roaming.enable=true \
	ro.config.max_starting_bg=10 \
	persist.service.camera.isptype=1 \
	ro.cmd.ssipc_enable=true \
	ro.security.mode=tz \
	ro.cmd.WORLD_PHONE=true \
	ro.atm.manufacturer.id=Marvell \
	ro.atm.model.id=LINUX \
	ro.atm.id=Marvell \
	dalvik.vm.heapstartsize=8m \
	dalvik.vm.heapgrowthlimit=96m \
	dalvik.vm.heapsize=256m \
	dalvik.vm.heaptargetutilization=0.75 \
	dalvik.vm.heapminfree=2m \
	dalvik.vm.heapmaxfree=8m \
	persist.radio.rem.enable=0 \
	drm.service.enabled=true \
	ro.sec.fle.encryption=true \
	ro.config.dha_cached_max=6 \
	ro.config.dha_empty_init=24 \
	ro.config.dha_empty_max=24 \
	ro.config.dha_lmk_scale=0.7 \
	ro.config.dha_th_rate=1.83 \
	ro.config.ldha_ext_enable=true
	
# Key mappings and touchscreen files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/usr/idc/elan-ts.idc:/system/usr/idc/elan-ts.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/ft5306-ts.idc:/system/usr/idc/ft5306-ts.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/msg2133.idc:/system/usr/idc/msg2133.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/qwerty2.idc:/system/usr/idc/qwerty2.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/qwerty.idc:/system/usr/idc/qwerty.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/synaptics_dsx_i2c.idc:/system/usr/idc/synaptics_dsx_i2c.idc \
	$(LOCAL_PATH)/prebuilt/usr/idc/Synaptics_HID_TouchPad.idc:/system/usr/idc/Synaptics_HID_TouchPad.idc
	
#  Hardware permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml
	
# Media Profiles
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/etc/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/etc/media_codecs.xml:system/etc/media_codecs.xml
	
$(call inherit-product-if-exists, external/alsa-lib/alsa-lib-products.mk)
PRODUCT_PACKAGES += \
	libaudio \
	alsa.omap3
# Note to self, look into alsa.omap3

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/etc/audio_policy.conf:system/etc/audio_policy.conf
	
# Time Zone Data
PRODUCT_COPY_FILES += \
bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

PRODUCT_COPY_FILES += $(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab
PRODUCT_COPY_FILES += $(LOCAL_PATH)/poweroff.sh:recovery/root/sbin/poweroff.sh

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler

# Charger
PRODUCT_PACKAGES += \
    charger \
    libold_shim

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa1908 \
    file_contexts \
    fstab_lpm.pxa1908 \
    init.pxa1908.usb.rc \
    init.pxa1908.security.rc \
	init.pxa1908.sensor.rc \
	init.pxa1908.tel.rc \
	init_bsp.pxa1908.rc \
	init_bsp.pxa1908.tel.rc \
	ueventd.pxa1908.rc 
	

# IPv6 tethering
PRODUCT_PACKAGES += \
    SamsungServiceMode \
    ebtables \
    ethertypes \
    libebtc

# Product specific Packages
PRODUCT_PACKAGES += \
    libsecril-client \
    rfkill \
    libMarvellWireless \
    libwpa_client

# OMX
PRODUCT_PACKAGES += \
    libion \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw \
    libdashplayer

# Power
PRODUCT_PACKAGES += \
    libxml2 \
    power.mrvl \
    powerhal.conf

PRODUCT_PACKAGES += \
    libhealthd.default
	
# Graphics
PRODUCT_PACKAGES += \
    libHWComposerGC 

# Terminal
PRODUCT_PACKAGES += \
    Terminal

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# NFC
PRODUCTS_PACKAGES += \
	Tag \
	com.android.nfc_extras \
	libnfc_nci_jni \
	libnfc_nci 
	
# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Net
PRODUCT_PACKAGES += \
    libnetcmdiface

# IR
PRODUCT_PACKAGES += \
    consumerir.mrvl

# Wireless
PRODUCT_PACKAGES += \
    libMarvellWireless \
    MarvellWirelessDaemon
	
# NFC Prebuilt files
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/etc/libnfc-sec.conf:system/etc/libnfc-sec.conf \
$(LOCAL_PATH)/etc/libnfc-sec-hal.conf:system/etc/libnfc-sec-hal.conf \
$(LOCAL_PATH)/etc/nfcee_access.xml:system/etc/nfcee_access.xml

# Android EGL implementation
PRODUCT_PACKAGES += libGLES_android
