FROM archlinux:base-devel

RUN pacman -Suy --noconfirm git sudo 

# so with nopasswd for klippy
RUN echo 'klippy ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/klippy 
#    chown klippy:klippy -R klipper

# Create user
RUN useradd -ms /bin/bash klippy 
# && adduser klippy dialout
USER klippy

WORKDIR /home/klippy

RUN git clone https://aur.archlinux.org/yay.git
WORKDIR /home/klippy/yay
RUN makepkg -si --noconfirm
RUN yay -S --noconfirm libusb python-can python-cffi python-greenlet python-jinja python-pyserial python arm-none-eabi-gcc arm-none-eabi-binutils arm-none-eabi-newlib

WORKDIR /home/klippy
RUN git clone https://github.com/Klipper3d/klipper.git

WORKDIR /home/klippy/klipper


COPY ./.config .config


ENTRYPOINT [ "/bin/bash"]