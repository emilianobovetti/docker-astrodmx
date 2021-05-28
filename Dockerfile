FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    libatk1.0-0 \
    libcairo-gobject2 \
    libcairo2 \
    libexpat1 \
    libfreetype6 \
    libgdk-pixbuf2.0-0 \
    libgl1 \
    libglib2.0-0 \
    libglu1-mesa \
    libglu1 \
    libgomp1 \
    libgtk-3-0 \
    libltdl7 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpangoft2-1.0-0 \
    libsm6 \
    libx11-6 \
    libxtst6 \
    libxxf86vm1 \
    libfontconfig1 \
    libusb-1.0-0 \
    sudo \
    udev \
    wget

RUN useradd astrodmx --home-dir /home/astrodmx --create-home

RUN wget -O /home/astrodmx/install.deb https://www.astrodmx-capture.org.uk/sites/downloads/astrodmx/current/x86-64/astrodmx-glibc-2.30_0.88.2_amd64.deb

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
