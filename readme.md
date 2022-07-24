# Artillery Sidewinder X2

Preconfigured docker container stack for Klipper + Moonraker + Mainsail + mjpeg-streamer (webcam).
Configuration is done for a stock Artillery Sidewinder X2



```sh
git clone https://github.com/freakydude/klipper-build.git

cd klipper-build
docker-compose up -d --build
```


For flashing Sidewinder Firmware:
```sh
docker-compose exec klipper /bin/bash

cd klipper
make menuconfig 
make
make flash FLASH_DEVICE=/dev/ttyACM0
```
