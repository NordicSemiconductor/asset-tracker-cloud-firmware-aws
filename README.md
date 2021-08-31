# Asset Tracker Firmware

![Build and Release](https://github.com/NordicSemiconductor/asset-tracker-cloud-firmware-aws/workflows/Build%20and%20Release/badge.svg)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)
[![Nordic ClangFormat](https://img.shields.io/static/v1?label=Nordic&message=ClangFormat&labelColor=00A9CE&color=337ab7)](https://github.com/nrfconnect/sdk-nrf/blob/master/.clang-format)
[![Zephyr compliance](https://img.shields.io/static/v1?label=Zephry&message=compliance&labelColor=4e109e&color=337ab7)](https://docs.zephyrproject.org/latest/contribute/index.html#coding-style)

This repository maintains an out-of-tree **copy** of the
[Asset Tracker v2](https://github.com/nrfconnect/sdk-nrf/tree/master/applications/asset_tracker_v2)
application to show how to use open-source tools for automating the creation of
building HEX files, and continuously integrating the firmware against the cloud
implementation of the nRF Asset Tracker.

The copy is regularly updated from source and kept in sync with the NCS release
branches.

## SUPL Client

> :warning: Note that the download of the A-GPS data happens after every boot of
> the device and is around 30 KB.

If the GitHub Action secret `SUPL_CLIENT_LIB_DOWNLOAD` is configured and
pointing to a HTTP link with the
[SUPL Client library](https://developer.nordicsemi.com/nRF_Connect_SDK/doc/latest/nrf/include/supl_os_client.html#downloading-and-installing)
(e.g. `https://example.com/nrf9160_libsupl-v0.7.0-809cb2e.zip`), the SUPL client
will be compiled and AGPS enabled.

> :information_source:
> [Read the complete nRF Asset Tracker documentation](https://nordicsemiconductor.github.io/asset-tracker-cloud-docs/).
