FROM ubuntu:22.04
 
RUN apt-get update && apt-get install -y git virtualenv python3-dev libffi-dev build-essential libncurses-dev libusb-dev avrdude gcc-avr binutils-avr avr-libc stm32flash libnewlib-arm-none-eabi gcc-arm-none-eabi binutils-arm-none-eabi libusb-1.0 dfu-util

WORKDIR /opt
RUN git clone https://github.com/Klipper3d/klipper.git
WORKDIR /opt/klipper
RUN git checkout dd03cca49b920762f959d8cce047a6cc4debf60b
WORKDIR /opt

RUN virtualenv -p python3 pyenv && pyenv/bin/pip install -r klipper/scripts/klippy-requirements.txt

RUN mkdir /opt/logs
VOLUME /opt/logs

RUN mkdir /opt/configs
VOLUME /opt/configs

RUN mkdir /opt/gcodes
VOLUME /opt/gcodes

RUN mkdir /opt/socket-api
VOLUME /opt/socket-api

CMD [ "/opt/pyenv/bin/python", "/opt/klipper/klippy/klippy.py" ,"/opt/configs/printer.cfg", "-l", "/opt/logs/klippy.log", "-a", "/opt/socket-api/klippy.socket"]