FROM ubuntu:22.04
ENV ESP_DIR=/home/default/esp
ENV XTENSA_FILE=xtensa-lx106-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz

WORKDIR $ESP_DIR

RUN apt-get update &&\
    apt-get install -y \
        gcc \
        git \
        wget\
        make \
        libncurses-dev \
        flex \
        bison \
        gperf \
        python2 \
        curl
RUN curl https://dl.espressif.com/dl/$XTENSA_FILE -O ; tar -xzf $XTENSA_FILE
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2
ENV PATH="${PATH}:${ESP_DIR}/xtensa-lx106-elf/bin"
ENV IDF_PATH="${ESP_DIR}/ESP8266_RTOS_SDK"
RUN git clone --recursive https://github.com/espressif/ESP8266_RTOS_SDK.git ${IDF_PATH}
RUN ln -s /usr/bin/python2.7 /usr/bin/python
RUN python -m pip install --user -r $IDF_PATH/requirements.txt

