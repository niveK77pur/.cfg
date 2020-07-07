#!/bin/bash

MTP_MOUNTPOINT="/run/user/1000/gvfs"
USB_MOUNTPOINT="/run/media/$user"

MOUNTED_SYM="✓"
UNMOUNTED_SYM="✗"

dmenu-select() {
    dmenu -i -l 20 -p '(un)mount device'
}


get-mount-location() {
    echo $1 | sed 's/.*(\(.\+\))$/\1/'
}

set-mount-status() {
    case "$1" in 
        "mtp") while read selection; do
                location="$(get-mount-location "$selection")"
                gio info "mtp://[usb:$location]" &>/dev/null
                if [ $? -eq 0 ]; then
                    echo $selection | sed "s#(?)#($MOUNTED_SYM)#"
                else
                    echo $selection | sed "s#(?)#($UNMOUNTED_SYM)#"
                fi
            done < /dev/stdin ;;
        "usb") while read selection; do
                location="$(get-mount-location "$selection")"
                mount | grep -E "^$location" &>/dev/null
                if [ $? -eq 0 ]; then
                    echo $selection | sed "s#(?)#($MOUNTED_SYM)#"
                else
                    echo $selection | sed "s#(?)#($UNMOUNTED_SYM)#"
                fi
            done < /dev/stdin ;;
    esac
}

mount-list() {
    lsusb \
        | grep '(MTP)' \
        | sed 's#Bus \(...\) Device \(...\).*:[0-9a-f]\{4\} \(.*\) (MTP)#MTP(?)    \3 (\1:\2)#' \
        | set-mount-status mtp
    lsblk -o LABEL,SIZE,PATH \
        | grep -E '/dev/sdb[0-9]+' \
        | sed 's#\(.*\) \(/.*[0-9]\+\)#USB(?)    \1 (\2)#' \
        | set-mount-status usb
}

mount-select() {
    selection="$(mount-list | dmenu-select)"
    location="$(get-mount-location "$selection")"
    case "$(echo $selection | awk '{print $1}')" in
        "MTP($MOUNTED_SYM)")    gio mount -u "mtp://[usb:$location]" ;;
        "MTP($UNMOUNTED_SYM)")  gio mount "mtp://[usb:$location]" ;;
        "USB($MOUNTED_SYM)")    udisksctl unmount -b "$location" ;;
        "USB($UNMOUNTED_SYM)")  udisksctl mount -b "$location" ;;
    esac
}


mount-select
