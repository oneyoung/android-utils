temp_dir=/data/supersu
zip_file=UPDATE-SuperSU-v1.94.zip
busybox=/data/busybox

adb remount
adb shell mkdir $temp_dir
adb push update-binary $temp_dir
adb push $zip_file $temp_dir
adb push busybox $busybox

adb shell chmod 777 $busybox
adb shell chmod 777 $temp_dir/update-binary
adb shell $temp_dir/update-binary 123 $temp_dir/$zip_file
adb shell rm -rf $temp_dir
adb shell rm $busybox
adb reboot
