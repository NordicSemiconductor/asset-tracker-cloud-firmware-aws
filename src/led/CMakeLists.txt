#
# Copyright (c) 2019-2021 Nordic Semiconductor ASA
#
# SPDX-License-Identifier: LicenseRef-BSD-5-Clause-Nordic
#

zephyr_include_directories(.)
target_sources_ifdef(CONFIG_LED_CONTROL app PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/led.c)
target_sources_ifdef(CONFIG_LED_USE_PWM app PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/led_pwm.c)
