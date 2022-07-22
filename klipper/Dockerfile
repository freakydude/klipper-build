FROM ubuntu:22.04
 
RUN apt-get update && apt-get install -y git virtualenv python2 libffi-dev build-essential libncurses-dev libusb-dev avrdude gcc-avr binutils-avr avr-libc stm32flash libnewlib-arm-none-eabi gcc-arm-none-eabi binutils-arm-none-eabi libusb-1.0


WORKDIR /opt
RUN git clone --depth 1 --branch v0.10.0 https://github.com/Klipper3d/klipper.git

RUN virtualenv -p python2 pyenv && pyenv/bin/pip install -r klipper/scripts/klippy-requirements.txt

RUN mkdir /opt/logs
VOLUME /opt/logs

RUN mkdir /opt/configs
VOLUME /opt/configs

RUN mkdir /opt/gcodes
VOLUME /opt/gcodes

RUN mkdir /opt/socket-api
VOLUME /opt/socket-api

CMD [ "/opt/pyenv/bin/python", "/opt/klipper/klippy/klippy.py" ,"/opt/configs/printer.cfg", "-l", "/opt/logs/klippy.log", "-a", "/opt/socket-api/klippy_uds"]