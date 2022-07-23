FROM ubuntu:22.04
 
RUN apt-get update && apt-get install -y git python3-virtualenv python3-dev libffi-dev build-essential libncurses-dev libusb-dev avrdude gcc-avr binutils-avr avr-libc stm32flash libnewlib-arm-none-eabi gcc-arm-none-eabi binutils-arm-none-eabi libusb-1.0 dfu-util

RUN mkdir /opt/logs /opt/configs /opt/gcodes /opt/socket-api /opt/klipper
VOLUME /opt/logs
VOLUME /opt/configs
VOLUME /opt/gcodes
VOLUME /opt/socket-api

WORKDIR /opt
RUN virtualenv -p python3 pyenv

RUN git clone https://github.com/Klipper3d/klipper.git
WORKDIR /opt/klipper
RUN git checkout dd03cca49b920762f959d8cce047a6cc4debf60b

CMD [ "/opt/pyenv/bin/python", "/opt/klipper/klippy/klippy.py" ,"/opt/configs/klippy.cfg", "-l", "/opt/logs/klippy.log", "-a", "/opt/socket-api/klippy.socket"]