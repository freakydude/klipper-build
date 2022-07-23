FROM alpine:latest

# install build tools
RUN apk update
RUN apk add git make cmake g++ linux-headers libjpeg-turbo-dev imagemagick v4l-utils-dev

WORKDIR /opt

# checkout mjpg-streamer
RUN git clone https://github.com/jacksonliam/mjpg-streamer.git

WORKDIR /opt/mjpg-streamer/mjpg-streamer-experimental

# build mjpg-streamer
RUN make USE_LIBV4L2=true

CMD /opt/mjpg_streamer -i "/opt/input_uvc.so -r ${RESOLUTION:-1920x1080}" -o "/opt/output_http.so -w /opt/www"
