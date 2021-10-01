FROM coderbyheart/fw-nrfconnect-nrf-docker@sha256:5b61de6482244c05a7a6fac4526074633584fb62ac91c815405c49a35cb3a1c3
RUN rm -rf /workdir/ncs
COPY . /workdir/ncs/firmware
RUN \
    # Zephyr requirements of firmware
    cd /workdir/ncs/firmware; west init -l && \
    cd /workdir/ncs; west update && \
    pip3 install -r zephyr/scripts/requirements.txt && \
    pip3 install -r nrf/scripts/requirements.txt && \
    pip3 install -r bootloader/mcuboot/scripts/requirements.txt && \
    rm -rf /workdir/ncs/firmware
# Optionally fetch the SUPL client
ARG SUPL_CLIENT_LIB_DOWNLOAD
RUN test -z "$SUPL_CLIENT_LIB_DOWNLOAD" || \
    /bin/bash -c "\
        apt-get -y install unzip && \
        wget -q $SUPL_CLIENT_LIB_DOWNLOAD -O supl_client.zip && \
        unzip supl_client.zip && \
        mkdir -p /workdir/ncs/nrf/ext/lib/bin && \
        mv -v supl /workdir/ncs/nrf/ext/lib/bin \
    " && :
