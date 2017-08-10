# Release name
PRODUCT_RELEASE_NAME := grandprimevelte

# Boot Animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH :=	540

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/grandprimevelte/device_grandprimevelte.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := grandprimevelte
PRODUCT_NAME := cm_grandprimevelte
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-G531F
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=samsung/grandprimeveltexx/grandprimevelte:5.1.1/LMY48B/G531FDDU1AOJ1:user/release-keys

