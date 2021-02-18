# znp-firmware
Firmware update utility for ZNP radios such as the TI CC2652R

## To use

Run the docker utility:

`docker run --rm -v.:/opt/firmware/backup --device=/dev/ttyACM0:/dev/ttyACM0 -it walthowd/znp-firmware bash`

Backup your current TI radio:

`python -m zigpy_znp.tools.nvram_read /dev/ttyACM0 -o /opt/firmware/backup/coordinator-backup.json`

Find the correct coordinator firmware for your adapter by consulting the [ZStack firmware README](https://github.com/Koenkk/Z-Stack-firmware/blob/master/coordinator/Z-Stack_3.x.0/bin/README.md)

Put your adapter in flashing mode and then ppgrade:

`/opt/firmware/cc2538-bsl.py -p /dev/ttyACM0 -evw /opt/firmware/CORRECT-FIRMWARE.bn`

Restore your network backup:

`python -m zigpy_znp.tools.nvram_write /dev/ttyACM0 -i /opt/firmware/backup/coordinator-backup.json`
