FROM coderbyheart/fw-nrfconnect-nrf-docker:main@sha256:2f910c3d1a5868f620e8cfe670bc8da3cef8e9b17d26fe34b40146a285951473
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
