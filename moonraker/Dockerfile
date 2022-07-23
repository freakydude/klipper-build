FROM ubuntu:22.04
 
RUN apt-get update && apt-get install -y git python3-virtualenv python3-dev libopenjp2-7 python3-libgpiod curl libcurl4-openssl-dev libssl-dev liblmdb-dev libsodium-dev zlib1g-dev libjpeg-dev packagekit

WORKDIR /opt
RUN git clone --depth 1 https://github.com/Arksine/moonraker.git

RUN virtualenv -p python3 pyenv && pyenv/bin/pip install -r moonraker/scripts/moonraker-requirements.txt

RUN mkdir /opt/logs /opt/configs /opt/db /opt/socket-api

VOLUME /opt/logs
VOLUME /opt/configs
VOLUME /opt/db
VOLUME /opt/socket-api

CMD [ "/opt/pyenv/bin/python", "/opt/moonraker/moonraker/moonraker.py", "-c" , "/opt/configs/moonraker.conf", "-l", "/opt/logs/moonraker.log"]