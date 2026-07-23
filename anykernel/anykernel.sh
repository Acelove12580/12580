### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=Panda_2026 GKI Kernel
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


# AnyKernel install
block=boot
is_slot_device=auto
no_magisk_check=1
patch_vbmeta_flag=auto
ramdisk_compression=auto

# import functions
. tools/ak3-core.sh

gki_kernel="6.1"
kernel_version=$(uname -r | awk -F '.' '{print $1"."$2}')
if [[ "$kernel_version" == "$gki_kernel" ]]; then
    ui_print " " "  -> Duchamp Supported: true"
else
    ui_print " " "  -> Duchamp Supported: false"
    abort "  -> NO-GKI Device: abort"
fi

# boot install
split_boot
if [ -f "split_img/ramdisk.cpio" ]; then
    unpack_ramdisk
    write_boot
else
    flash_boot
fi
