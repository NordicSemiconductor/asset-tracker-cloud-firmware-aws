#!/bin/bash

git clone --single-branch --branch asset-tracker-v2 https://github.com/jtguggedal/fw-nrfconnect-nrf sdk-nrf
cp -rv sdk-nrf/applications/asset_tracker_v2/* ./
rm -rf sdk-nrf