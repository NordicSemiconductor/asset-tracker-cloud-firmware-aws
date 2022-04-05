Feature: Run the firmware

    The Asset Tracker should run the firmware

    Scenario: The firmware should have been run

        Then the Firmware CI run device log should contain
        """
        aws_iot_integration.cloud_wrap_init:  The Asset Tracker v2 has started
        aws_iot_integration: cloud_wrap_init:  Version:     {appVersion}-original
        aws_iot_integration.cloud_wrap_init:  Client ID:   {deviceId}
        aws_iot_integration.cloud_wrap_init:  Cloud:       AWS IoT
        aws_iot_integration.cloud_wrap_init:  Endpoint:    {mqttEndpoint}
        """