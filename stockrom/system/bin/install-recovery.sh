#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9791488 9de5dc381cbaf8a249c76e63b46139b29924839e 7348224 0a4526f2cecd6f6d0826decf82bd4246650e49cb
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9791488:9de5dc381cbaf8a249c76e63b46139b29924839e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7348224:0a4526f2cecd6f6d0826decf82bd4246650e49cb EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 9de5dc381cbaf8a249c76e63b46139b29924839e 9791488 0a4526f2cecd6f6d0826decf82bd4246650e49cb:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
