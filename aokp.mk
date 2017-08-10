# Release name
PRODUCT_RELEASE_NAME := grandprimevelte

# Inherit some common AOKP stuff.
$(call inherit-product, vendor/aokp/configs/common_full_phone.mk)

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/lt023g/sepolicy

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Boot Animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH :=	540

# Inherit device configuration
$(call inherit-product, device/samsung/grandprimevelte/device_grandprimevelte.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := grandprimevelte
PRODUCT_NAME := aokp_grandprimevelte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := grandprimevelte
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=samsung/grandprimeveltexx/grandprimevelte:5.1.1/LMY48B/G531FDDU1AOJ1:user/release-keys