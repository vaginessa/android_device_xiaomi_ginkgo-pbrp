#!/system/bin/sh
# This script is needed to automatically set device props.

load_willow()
{
    resetprop "ro.product.model" "Redmi Note 8T"
    resetprop "ro.product.name" "willow"
    resetprop "ro.build.product" "willow"
    resetprop "ro.product.device" "willow"
    resetprop "ro.product.system.device" "willow"
    resetprop "ro.product.vendor.device" "willow"
    resetprop "ro.vendor.product.device" "willow"
}

load_ginkgo()
{
    resetprop "ro.product.model" "Redmi Note 8"
    resetprop "ro.product.name" "ginkgo"
    resetprop "ro.build.product" "ginkgo"
    resetprop "ro.product.device" "ginkgo"
    resetprop "ro.product.system.device" "ginkgo"
    resetprop "ro.product.vendor.device" "ginkgo"
    resetprop "ro.vendor.product.device" "ginkgo"
}    

variant=$(getprop ro.boot.hwc)
echo $variant
hwversion=$(getprop ro.boot.hwversion)
echo $hwversion

case $variant in
    "Global_B")
        case $hwversion in
         "18.31.0"|"18.39.0"|"19.39.0")
          load_willow
         ;;
    *)
        load_ginkgo
         ;;
esac

exit 0
