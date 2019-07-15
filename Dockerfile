FROM ubuntu:18.04

WORKDIR /root

RUN apt-get update \
 && apt-get install -y build-essential openocd gcc-arm-none-eabi git gdb unzip xz-utils \
 && git clone https://github.com/Fifty-Nine/BoxLock_Firmware.git \
 && mkdir -p /root/pkg \
 && (echo 'cat /etc/motd' >> /root/.bashrc)

ADD https://github.com/ARM-software/CMSIS_5/archive/5.6.0.tar.gz /root/pkg
ADD http://packs.download.atmel.com/Atmel.SAMD21_DFP.1.2.280.atpack /root/pkg
ADD https://sourceforge.net/projects/freertos/files/FreeRTOS/V9.0.0/FreeRTOSv9.0.0.zip/download /root/pkg/FreeRTOSv9.0.0.zip

RUN tar -xvf /root/pkg/5.6.0.tar.gz -C /root/pkg \
 && mkdir -p /root/pkg/samd21-dfp \
 && unzip -d /root/pkg/samd21-dfp /root/pkg/Atmel.SAMD21_DFP.1.2.280.atpack \
 && mkdir -p /root/pkg/FreeRTOSv9.0.0 \
 && unzip -d /root/pkg /root/pkg/FreeRTOSv9.0.0.zip \
 && rm -rf /root/pkg/5.6.0.tar.gz /root/pkg/Atmel.SAMD21_DFP.1.2.280.atpack /root/pkg/FreeRTOSv9.0.0.zip

COPY config.mk /root/BoxLock_Firmware/
COPY motd /etc/motd

ENTRYPOINT [ "/bin/bash", "-l" ]
