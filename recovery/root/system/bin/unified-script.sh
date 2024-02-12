#!/system/bin/sh
# This script is needed to automatically set device props.

load_RMX2030()
{
      resetprop "ro.product.model" "RMX2030"
      resetprop "ro.product.name" "RMX2030"
      resetprop "ro.build.product" "RMX2030"
      resetprop "ro.product.device" "RMX2030"
      resetprop "ro.product.system.device" "RMX2030"
      resetprop "ro.product.vendor.device" "RMX2030"
      resetprop "ro.vendor.product.device" "RMX2030"
}

load_RMX1927()
{
      resetprop "ro.product.model" "RMX1927"
      resetprop "ro.product.name" "RMX1927"
      resetprop "ro.build.product" "RMX1927"
      resetprop "ro.product.device" "RMX1927"
      resetprop "ro.product.system.device" "RMX1927"
      resetprop "ro.product.vendor.device" "RMX1927"
      resetprop "ro.vendor.product.device" "RMX1927"
}

load_RMX1925()
{
      resetprop "ro.product.model" "RMX1925"
      resetprop "ro.product.name" "RMX1925"
      resetprop "ro.build.product" "RMX1925"
      resetprop "ro.product.device" "RMX1925"
      resetprop "ro.product.system.device" "RMX1925"
      resetprop "ro.product.vendor.device" "RMX1925"
      resetprop "ro.vendor.product.device" "RMX1925"
}

load_RMX1911()
{
      resetprop "ro.product.model" "RMX1911"
      resetprop "ro.product.name" "RMX1911"
      resetprop "ro.build.product" "RMX1911"
      resetprop "ro.product.device" "RMX1911"
      resetprop "ro.product.system.device" "RMX1911"
      resetprop "ro.product.vendor.device" "RMX1911"
      resetprop "ro.vendor.product.device" "RMX1911"
}

project=$(cat /proc/oppoVersion/prjVersion)
echo $project

case $project in
     "19743")
         load_RMX2030
              ;;
     "19632")
          load_RMX1927
              ;;
     "S86125AA1")
          load_RMX1925
              ;;
     "19631")
          load_RMX1911
              ;;

esac

exit 0
