#
# Copyright (c) 2021 Nordic Semiconductor ASA
#
# SPDX-License-Identifier: LicenseRef-BSD-5-Clause-Nordic
#

zephyr_include_directories(.)
target_sources_ifdef(CONFIG_EXTERNAL_SENSORS app PRIVATE
                        ${CMAKE_CURRENT_SOURCE_DIR}/ext_sensors.c)
