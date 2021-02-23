# znp-firmware

Z-Stack firmware update utility for ZNP radios such as the CC2538, CC2652R, CC2652RB, CC2652P and CC1352P variants from Texas Instruments.

## To use

Run the docker utility:

`docker run --rm -v.:/opt/firmware/backup --device=/dev/ttyACM0:/dev/ttyACM0 -it walthowd/znp-firmware bash`

Perform a network backup to file from NVRAM:

`python -m zigpy_znp.tools.nvram_read /dev/ttyACM0 -o /opt/firmware/backup/coordinator-backup.json`

Find the correct coordinator firmware for your adapter by consulting the Z-Stack firmware README files:

- https://github.com/Koenkk/Z-Stack-firmware/blob/master/coordinator/README.md
  - https://github.com/Koenkk/Z-Stack-firmware/blob/master/coordinator/Z-Stack_3.x.0/bin/README.md

Put your adapter in flashing mode and then upgrade:

`/opt/firmware/cc2538-bsl.py -p /dev/ttyACM0 -evw /opt/firmware/CORRECT-FIRMWARE.bn`

Perform a restore your network backup file to NVRAM:

`python -m zigpy_znp.tools.nvram_write /dev/ttyACM0 -i /opt/firmware/backup/coordinator-backup.json`
