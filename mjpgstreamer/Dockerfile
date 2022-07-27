FROM alpine:latest

# install build tools
RUN apk update
RUN apk add git make cmake g++ linux-headers libjpeg-turbo-dev imagemagick v4l-utils-dev v4l-utils

WORKDIR /opt

# checkout mjpg-streamer
RUN git clone https://github.com/jacksonliam/mjpg-streamer.git

WORKDIR /opt/mjpg-streamer/mjpg-streamer-experimental

# build mjpg-streamer
RUN make USE_LIBV4L2=true

CMD ./mjpg_streamer -i "./input_uvc.so ${INPUTUVC}" -o "./output_http.so -w ./www" && /usr/bin/v4l2-ctl --set-ctrl "${V4L2CTRLS}"
