FROM ubuntu:22.04
 
RUN apt-get update && apt-get install -y git python3-virtualenv python3-dev libopenjp2-7 python3-libgpiod curl libcurl4-openssl-dev libssl-dev liblmdb-dev libsodium-dev zlib1g-dev libjpeg-dev packagekit iproute2

RUN mkdir /opt/logs /opt/configs /opt/gcodes /opt/db /opt/socket-api /opt/klipper
#VOLUME /opt/logs /opt/configs /opt/gcodes /opt/db /opt/socket-api /opt/klipper

WORKDIR /opt
RUN virtualenv -p python3 pyenv

RUN git clone https://github.com/Arksine/moonraker.git
WORKDIR /opt/moonraker
RUN git checkout 16327ff551ad56ae9e6de799a2f18a195b830917
WORKDIR /opt

RUN pyenv/bin/pip install -r moonraker/scripts/moonraker-requirements.txt

CMD [ "/opt/pyenv/bin/python", "/opt/moonraker/moonraker/moonraker.py", "-c" , "/opt/configs/moonraker.conf", "-l", "/opt/logs/moonraker.log"]