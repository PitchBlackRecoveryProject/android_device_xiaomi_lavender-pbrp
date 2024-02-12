#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2022-2023 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="r5x"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
 	export ALLOW_MISSING_DEPENDENCIES=true
 	export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
 	export OF_USE_GREEN_LED=0
	export OF_FBE_METADATA_MOUNT_IGNORE=1
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
        export OF_QUICK_BACKUP_LIST="/boot;/dtbo;/system;/vendor;"
	export OF_PATCH_AVB20=1
    	export FOX_DELETE_AROMAFM=1
    	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00
 	export FOX_ENABLE_APP_MANAGER=1	
        export TARGET_DEVICE_ALT=r5x
	export TARGET_DEVICE_ALT=RMX2030
        export TARGET_DEVICE_ALT=RMX1911
	export TARGET_DEVICE_ALT=RMX1925
        export TARGET_DEVICE_ALT=RMX1927
	export OF_SUPPORT_OZIP_DECRYPTION=1
        export OF_DEFAULT_KEYMASTER_VERSION=4.0
	export FOX_USE_NANO_EDITOR=1
    	# dispense with the entire OTA menu
        export OF_DISABLE_OTA_MENU=1
        # no additional check for MIUI props
        export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1

        # Screen Settings
        export OF_CLOCK_POS=1
        export OF_HIDE_NOTCH=0
        export OF_ALLOW_DISABLE_NAVBAR=0
        export OF_SCREEN_H=2400
        export OF_STATUS_H=80
        export OF_STATUS_INDENT_LEFT=50
        export OF_STATUS_INDENT_RIGHT=50

        # R12.1 Settings
        export FOX_VERSION="R12.1"
        export OF_MAINTAINER="AmritoRock"
        export FOX_BUILD_TYPE="Stable"
	export FOX_VARIANT="$(date '+%Y%m%d-%H%M')"

        # run a process after formatting data to recreate /data/media/0 
        export OF_FORCE_CREATE_DATA_MEDIA_ON_FORMAT=1

        # Necessary to decrypt most r5x ROMs
        export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1

        # Disable wrappedkey?
        if [ "$OF_DISABLE_WRAPPEDKEY" = "1" ]; then
	  export FOX_VARIANT="unwrap"
        fi

        # Magisk
	if [ -n "${FOX_USE_SPECIFIC_MAGISK_ZIP}" ]; then
		if [ ! -e "${FOX_USE_SPECIFIC_MAGISK_ZIP}" ]; then
			echo "Downloading the Latest Release of Magisk..."
			LATEST_MAGISK_URL="$(curl -sL https://api.github.com/repos/topjohnwu/Magisk/releases/latest | grep browser_download_url | grep Magisk- | cut -d : -f 2,3 | sed 's/"//g')"
			mkdir -p $(dirname ${FOX_USE_SPECIFIC_MAGISK_ZIP})
			wget ${LATEST_MAGISK_URL} -O ${FOX_USE_SPECIFIC_MAGISK_ZIP} 2>/dev/null
			[ "$?" = "0" ] && echo "Magisk Downloaded Successfully"
			echo "Done!"
		fi
	fi

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
